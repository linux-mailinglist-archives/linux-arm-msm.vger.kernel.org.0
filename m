Return-Path: <linux-arm-msm+bounces-105956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OV2IDXj+WmlEwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 14:31:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 011614CD8CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 14:31:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5324530F157E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 12:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC4B436369;
	Tue,  5 May 2026 12:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="elXwbKAS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hjY39Sqp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E24427A0B
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 12:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777983948; cv=none; b=FrEWSlPYK5ZyZ+svuVnrBEqdYYrIDp5u61t55YfMfz7mmIjyCfNU6JjcUQb4UNm6hqPep44cuEpZoI5yafmdIR2u+rFHepSbCS6wRXALqn0mS+JyeoO31uwhgprg2VbYVWNCldHCGj5F8lfFWW6QyPH/bLXE9gnqS09DDaLMiCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777983948; c=relaxed/simple;
	bh=YOcZgnUU7aNUADZbewVlvFKcPy4NxigrSCC0vnQKVC0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RmYSjjFozfQoEnZyv5KsCbWTCuPO5Nl1glHxMN4WX065wqS1Nzs3VRMfXnpec8JcCFBWa2ZFS8aoZ80aqHaTQa0MHf0D7Koy5aubw9b6TXkZTyN9VMZvG72mkW4zXvW1ymrqwFuxerzGi4gNjrc45qkvo1OOPYdHtIZ+toObD1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=elXwbKAS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hjY39Sqp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6457Ubw71186923
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 12:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cezRDIDuuGgXSugZUDs0zZVIa3d2l+pmJWevmxHgvlI=; b=elXwbKASq3qWKy3v
	e4Npmt6BrwzXXhMyMhh8mMOfkCkGaa2hCjj9DdHm4ZHNhyPS/5nNEZphaOsBeAMP
	hya9Due/LQzDgnRGwcT5kieWSAqSpbCj/xWXVlr0c7NbhYkgvZ27AVLgAyqTrLAY
	bJ5EMqtI/thEr3G/LluNuy7EGovejlgM50GPfuzpMeOlCX8mtfCupYjbFLPRi1JK
	XmdIAAY+kFnEKTGkMbduOMFMw3DPfahp4ME50z27QQ85SXsmBGIeEMnFYnYReP+2
	vl1kl2hjRBn16/FflTPzhJFkVaVVyBIuPvMvZ/syTEJCJZxdKBFMxLac/pgK5WTy
	eFqcNg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvvgca17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 12:25:45 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8217f2c9359so846157b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 05:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777983945; x=1778588745; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cezRDIDuuGgXSugZUDs0zZVIa3d2l+pmJWevmxHgvlI=;
        b=hjY39Sqpci5KhWFzV5YMtKt2Wca7Y75nZa/k6Mikm9F9w8cnZ3TqZ7LnkrEazU72ly
         ciIyqCv1qvSk9wYa7cBRUCou5qmSRXcmDU+T37XgO+xZSwAWMAounojzDpKN16Z81HWL
         DEkTd3S2o3kFlWE5leX3f/OgCFYys09ukeCGPcvaePIWE9aCiVhznPA9rKT7sEsrYqmp
         UK80Ijs1i5glSWaFFXxgn3UB0RTnH7UDN4PtQ+6nPVYbXaPb/CqcjFEI9uK+SjV2mOCK
         ppVLpxU7gkJAs1TIXD1XDMbQwzddKuVHeZOnozGflqG0nXs0H3wTRFmv/mEgT31E+d4C
         RTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983945; x=1778588745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cezRDIDuuGgXSugZUDs0zZVIa3d2l+pmJWevmxHgvlI=;
        b=aPBqC5GGiDvNiXK3NRawWQhx83HlDvrDlGUbmV8ikmnjjpEENIdhVkeTwlIJqdCzp5
         afdU0NyOjpwU1DrhEuPFPAwyOF7+K4W/nfbE1i2j8aSrIXRsH6zvaFwJGSmzcHw7TVZs
         8r8wradXI4vBiAJzx+hEiz7i5ylqoKkiLMb+V+e7/AsrkBOYVhu0TJmnmYhmYILgTJdm
         WY+LEItR5VaJbYdYcTWwH2zzeKlWUxS7TbCHrprSnx0uUDl+36azUsDY0vu7iGF4GK/X
         IjYSXz8J5rFl+JrtaG0Lqp4Dgwlr085J+2ddzcy2HeH5bMF4NtjCgCQ/72mOjxI72npd
         Dx2w==
X-Gm-Message-State: AOJu0YytnXxOhSX9uVC3x04I69/sCqFimYlr3cU4ICEMvV3llCx3J40q
	ObJNyKWTPHJgbjYXXE9HxnuKn6I2QUpBtcpmL58neWsX8J4S76/QGwJ2PXHftnn/Oggnyh+N+VA
	2myoitEJUzWnVfIQcDbFpMaOfRGO8MihkzGKpHkS56QbQ7TetzswAbnCvf0fZhzMmGbpf
X-Gm-Gg: AeBDievq2dTyaq7GbZzXFOx2A4ThzvKu9TGdiC1ftop2gWK+shQygfFkzOD4UaBpJ67
	z5lx3etLP6HwS87RwxgiYWhJzwpDrk9oKtHHnS/IUrdLgLFkzeDsjpo9li9IDa72HeeL1dxN1D0
	snD5xF0cqFne7Zu/BbxLIJ3IOhIdH8N31owlA5XcI/KMy2UAzOG1taNKYlfUwW2Q8Axwzmd4d4o
	mxSsnc0kTGnlo3UB9rtmg8bpSUQHvSG+qFd60pZyF19Dx8zCZsIR7iUzwnVCJvvq8kcsv1hRtUn
	VjCbynrt+F/yB7d3jvUFLtUut86R1Pm2etCSMLzRFMbFSbExyguaDIqrrX4Xd++vXUYQ8p5Pipa
	jDScvg+/029X0X1ah3sLyk/KftsSswjBZ9qwqr7eNRsY9U/RckjMb82hVAX7fzlE=
X-Received: by 2002:a05:6a20:6f87:b0:39f:6343:c6e6 with SMTP id adf61e73a8af0-3a7f1d53191mr7943155637.7.1777983944526;
        Tue, 05 May 2026 05:25:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:6f87:b0:39f:6343:c6e6 with SMTP id adf61e73a8af0-3a7f1d53191mr7943130637.7.1777983943895;
        Tue, 05 May 2026 05:25:43 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbbaac5bsm12597998a12.6.2026.05.05.05.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:25:43 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Date: Tue, 05 May 2026 17:53:52 +0530
Subject: [PATCH 8/8] arm64: dts: qcom: monaco: add AEST error nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-aest-devicetree-support-v1-8-d5d6ffacf0a5@oss.qualcomm.com>
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
In-Reply-To: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
To: Ruidong Tian <tianruidond@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
        mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-edac@vger.kernel.org,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777983885; l=2471;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=YOcZgnUU7aNUADZbewVlvFKcPy4NxigrSCC0vnQKVC0=;
 b=IHRZKVkkhxU9y02nDwnaD6SzrjQm04m+20HXWuq2/N4sWJObINqXltUQZ1/qyBP+tvKxUc5iD
 JMepAm3K+K8CN73vjyA6Efr0HTg9ztmpukLEzg04lLRt4vmu3gpMBMM
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Proofpoint-ORIG-GUID: GV6XJCAW5RqipFIo4w2skuiBM72UWDr_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDExOCBTYWx0ZWRfX5hssC8vWpdYY
 sXMuDFz8JnxclwqhDChyPWiwLh+8GToTdMMd4RGtzdXKpV0BV5ZpYN2erqXgF7Dq3hqikOCvpEI
 YVUp3mYBLCKeF8ckubQdiu+KcXMs7g+SAwzJQTrKgcWBdLDwraUS9pjX7O0zs0APajK5jk5L1Ey
 SAZY1Oo9N781wyflQrkG5IIjXJUXz42TB2jE3s3vxOXJ3As1pEv73ofcKtkH4RsEUjM8Czi0G1V
 9mIzD16v6jwYdKrBDEb6+8RFDHACdBKH19XbvFEkHkZpoKaRf99vhM/asmdvz+lbvC4LdlMKblu
 1NYxco8Wq4sbniA4whb7A5E3Kcr0LPK3NWBGaQARAJSTPB3J0dl0kr8y34FrHA0fOcpGOXJfZAV
 /YNlJMN4smVk5umTYhySKIJnOmp+Z2P9sgrBKXGd1h6aTb1fTJDNWt0QxrOkn0eRZHSrRSIHJ16
 NwGVusUQV3zN2hFOP0w==
X-Authority-Analysis: v=2.4 cv=K+AS2SWI c=1 sm=1 tr=0 ts=69f9e1c9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=JAhf3ahiasQHMHGiI4QA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: GV6XJCAW5RqipFIo4w2skuiBM72UWDr_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050118
X-Rspamd-Queue-Id: 011614CD8CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105956-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add AEST RAS error source nodes for the Monaco SoC.

The DT describes a processor error source covering all CPU cores and a
shared L3 cache error source for the cluster. These nodes model the
hardware error reporting blocks and associated interrupts as required
by the Arm AEST specification.

Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 41 ++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 7b1d57460f1e..8e43ceed7d84 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <dt-bindings/arm/aest.h>
 #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
@@ -29,6 +30,46 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aest {
+		compatible = "arm,aest";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		aest-processor-0 {
+			compatible = "arm,aest-processor";
+			arm,num-records = <1>;
+			arm,record-impl = /bits/ 64 <0x0>;
+			arm,status-reporting = /bits/ 64 <0x0>;
+			arm,addressing-mode = /bits/ 64 <0x0>;
+			arm,processor-flags = <AEST_PROC_GLOBAL>;
+			interrupts = <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
+			interrupt-names = "fhi";
+		};
+
+		aest-l3-cluster0 {
+			compatible = "arm,aest-processor";
+			arm,num-records = <2>;
+			arm,record-impl = /bits/ 64 <0x1>;
+			arm,status-reporting = /bits/ 64 <0x0>;
+			arm,addressing-mode = /bits/ 64 <0x0>;
+			arm,processor-flags = <AEST_PROC_SHARED>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "fhi";
+		};
+
+		aest-l3-cluster1 {
+			compatible = "arm,aest-processor";
+			arm,num-records = <2>;
+			arm,record-impl = /bits/ 64 <0x1>;
+			arm,status-reporting = /bits/ 64 <0x0>;
+			arm,addressing-mode = /bits/ 64 <0x0>;
+			arm,processor-flags = <AEST_PROC_SHARED>;
+			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "fhi";
+		};
+	};
+
 	clocks {
 		xo_board_clk: xo-board-clk {
 			compatible = "fixed-clock";

-- 
2.34.1


