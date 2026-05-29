Return-Path: <linux-arm-msm+bounces-110284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDN8NRagGWq7xwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 16:17:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A9F603686
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 16:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51CD430B3292
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 14:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F91B3E5A1E;
	Fri, 29 May 2026 14:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KhgoA7VA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WKbhPREy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57DD33D505
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780063888; cv=none; b=SMUH+0M6+Acp6YYE4bMYKa3Wlemk0peDY3NTbww8f2qoc1Nq6kdm6wqx56FIGqMJLftTQhkgzPHjQdtkIM3/YlIre3lq9U0x2gZTugxZmMIqbzJL0tu8dNdn1TZ8lDkKcWIjpE6BziHkLn+wn8gwjWgErAOKW6SL5V3Tq2lCAYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780063888; c=relaxed/simple;
	bh=QT1O7JWZuQeCOEkAN5pFlabn2CCUVlrdoZ+6wOk2a8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=odtaiTfj4WHQ8o2MpDqUMc2DMrDAOGp9ZeJmU3kMPigObkcZtMaufh5OWpFog50xK8rPf4sJomPqw3C2C/wZGTZ1sag7IdyKF5jFD8D+izzP3Je/zaTgQx9ANP3zOW6YMVgujDme0u0exicfFjrQnaoqJ/9XLqXoOXxiYgkXGOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KhgoA7VA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WKbhPREy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDLEfs154524
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZJtPO6O5NeXjipxB9wGMsy1g8c32dTSOI3WAyDX13cU=; b=KhgoA7VAs2Apz+wE
	79IHmtYPSmrqIfWJPhPQWZh3f/+2jfXLtU6VmaBOzeQnCSh+s1chx0ccaKAdyWEx
	sZ4VE15AI+r70ZTUUL2fR0LWLAh635Jv9RKhCqqRu+MLa7mvOVZ0K5hN1aYwkBAr
	u4d60cDM7ioBImJRS+yn0FkB85k67OhOaswLIh/sHLcZe4qYJCa2Q6ogK6ANpFJF
	xkZhIudCDiAiChIuTk1rZjKTNErCdvPyukTm1l6d7zkxdbvdcLKsnNhPhfSkk4bk
	PuyDrcVhuGn1AkgnDL2M9n+RkaxvF/ZZDF8S1NRzZxdCFCOf32W1sCrhO3MHXDYw
	TtRDwg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eeuy5c33r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:11:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba5f794825so111910725ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 07:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780063884; x=1780668684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZJtPO6O5NeXjipxB9wGMsy1g8c32dTSOI3WAyDX13cU=;
        b=WKbhPREygcg+j37IPSiY045QLp4mA3zS7jxVxoNjxTI8QcQQ+Miq2F/JKWYYWo5BCB
         5/pxGKPpnELr/udJ9ZxmqA0vWQ2wJwfjv6RhVtvubqEbvM0RS6XNfY+xlsnAmkyJNkqW
         KIcsjaGo0ck6RT5Lc/YGWw/zs5iMN37FbbjBgqtMI22u/7iGRmHY/5jAFtWcZDUcgd3l
         GbLhlJo3xhgKxr7dsgUnuNiJw8P6sAqI5zT/82nkxku1oN4J8lBbQ/uH5RCIuUdUyMKG
         Q2WOc4OPWhvQc9ueIupyt0LawS9IcYG4QqBhDDs9YQHjt3bB20MhSUZY+LCdM8qqZ44H
         FAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780063884; x=1780668684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZJtPO6O5NeXjipxB9wGMsy1g8c32dTSOI3WAyDX13cU=;
        b=p/91qm8O1mtC/V99DAIyBJ7lMF2p5L+z5MYCdyryg7JTQGofnsYpxmx0++NRS2PrK+
         +Q8HBRKivxQp5zc5snFnzUjswDh8jejrzLM/m5IPqlABApUmfoccof65KgKZagkKBAPm
         0yEl/8PFAvQSqBfCPj+eRUXKk0xJmZQy7vL44Bb7c95UhncH59WCw6WQjOlWmsVeRL8P
         ubX3B1sGrDAXOdSfGDaKwkx5UIp3++vnbYISXrWcqBw6pvB1s1hcHoxNTI5C80xOLx9O
         l+2WOru+s/nGSCkY9t/mYqx3axC0vSF88v2/RPwnMRVe+l9zgbmno8/Yo2WF1CoeQmMV
         VzgQ==
X-Forwarded-Encrypted: i=1; AFNElJ8NrueZ9A0OBJXhkiXWGljclvG0d07zPWRThrOVDyDRI8oxGqO8M+k4Gtb1d8vkmi/pa2OB4XTco3Z5/sw/@vger.kernel.org
X-Gm-Message-State: AOJu0YwVNzVwSUqffvJ2tqKPLJ+/wGrXQ8yoiLVUXUz8PEa4bqqhKznW
	twQXiuW1oFO2uTG7N6jsADO1YnYxx0WosWREhFSUhLgl+X4U1tWrMuHjCkCpHecgxSCPAfCIGla
	rvHugm1i9zd6ogVSZhi8nSRVmcAKS6n97M1nNcS1jf4Dhb3HQ0HH1ccMAejKzkqgdBIzF
X-Gm-Gg: Acq92OHxIRXZw6RpL+YVvZe0UKtbo4gNuU07HfDJ+ZWk2MB4W1QzHhPmGzUXMFKEWYH
	Nsv68fnpY0AT3F2yl2jGMUndQLjoqswSM6HfLA22/4iYHDmIFfcFbJpGmCmg+xchqXR9nhi4BoH
	QB8t5KlrHviGy73hH0Gcc/stbhXyyGY/1mWFLYniK0sDvyHm98a9Gv8z+zxtVWn3B10YA/cG/SP
	WhNmQvXy4TkoPHtPa4oTec/dBVyDQP+xTnXa8OcP24kyAerofGc0tTV0sKI1xb9JXZJWMS7Kxg+
	lsUUR/w+AWG3YbFSNRPz1fzSg6c5yjz6zMA4gEMLXoXcgJ40hRIe1YOi+/+qRXs0LZHSPjRfYu7
	GFh/3y3AGQDJ9vuWmxJkkiTw31ehmB12L2obuMIwHlx0xSvQ4eGJRHvrrzuqmbSzC/lby
X-Received: by 2002:a17:902:ce0c:b0:2bd:6327:b4f5 with SMTP id d9443c01a7336-2bf20cdbdd2mr36696255ad.40.1780063884042;
        Fri, 29 May 2026 07:11:24 -0700 (PDT)
X-Received: by 2002:a17:902:ce0c:b0:2bd:6327:b4f5 with SMTP id d9443c01a7336-2bf20cdbdd2mr36695735ad.40.1780063883532;
        Fri, 29 May 2026 07:11:23 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a00a53sm30775215ad.27.2026.05.29.07.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:11:23 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Fri, 29 May 2026 19:41:11 +0530
Subject: [PATCH 2/2] PENDING: arm64: dts: qcom: kaanapali: add reboot-mode
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-psci_sys_reset-dt-changes-for-pakala-v1-2-7c32161cf50b@oss.qualcomm.com>
References: <20260529-psci_sys_reset-dt-changes-for-pakala-v1-0-7c32161cf50b@oss.qualcomm.com>
In-Reply-To: <20260529-psci_sys_reset-dt-changes-for-pakala-v1-0-7c32161cf50b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Xin Liu <xin.liu@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=SPtykuvH c=1 sm=1 tr=0 ts=6a199e8c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=7AJH4AG-BTyQ-FR_P80A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: epqV-E8oesYxltwG6408YvT8ZGbZbO7Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0MiBTYWx0ZWRfX+teozEvGHwNX
 zuXqpfj51TbovApYLJ0twnxE1s2ZaOxZlgfF2rod3IxboTl+NbBefMBM1F/oL9jnRkxB2jXrdcZ
 x2lChI56PN/4MJjWJykGJjR+LC0jZrzFmzjLOYC+KPtfuwlIh5yArkLcP/uF5j7pLYo8/ihQq8M
 fNOeBNiDf1eGrVWbZN95XnwUUwzqwb0oRNFVLv9rGbxgOQTFmLKujRHmoF0vioi1doWGioOxMrG
 e3Dvwif3e89qQ4cmBuHm4ZvibbNcqWsXpMz/hP6rAMXv+ncs8vYS4nHFLtUZbydnY0Mq3n62gak
 cJAjMuM4Sqphl/lPSiZp8HCW3lQKU3STlLeoJq/A1JBCaLMNEzG9SJdBgzYFoYGW2WSdtgkH2D+
 DebYiBT8u1LzAhWJQwpHgA9a455WB08k3jK/qBTIqNNY933F29Ux03TI/HXc/d0Cu6rNxYf0fqM
 XSJ+NIf+1JcLbr9DTvw==
X-Proofpoint-ORIG-GUID: epqV-E8oesYxltwG6408YvT8ZGbZbO7Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605290142
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-110284-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anurag.pateriya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 40A9F603686
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Xin Liu <xin.liu@oss.qualcomm.com>

Add PSCI SYSTEM_RESET2 reboot-modes for kaanapali-mtp and kaanapali-qrd
for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi    | 2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 7bce5653ea74..6429d91eba62 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -1356,3 +1356,10 @@ &usb_dp_qmpphy {
 
 	status = "okay";
 };
+
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
index 95dce0812725..85007e53c456 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
@@ -851,3 +851,10 @@ &usb_dp_qmpphy {
 
 	status = "okay";
 };
+
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 63c828c80920..d8203b2dbc8c 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -274,7 +274,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.43.0


