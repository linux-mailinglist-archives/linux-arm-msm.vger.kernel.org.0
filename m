Return-Path: <linux-arm-msm+bounces-109722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEdHGkUwFWoRTgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:31:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5275D0DE5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:31:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD467303DD7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 05:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA1103BFAD4;
	Tue, 26 May 2026 05:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CzQJlEGW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IclSXTZR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A72E3BED7F
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779773421; cv=none; b=TkMmzb3HGR44dXvXVfP+MNsVVLdZ9kDu1A4u9xqMUGFd9h+bwAsZzynFTCyRfVR18OJEVIrGslbeezgS2GC+ekf2j+raa5LxdIaO3KJsz2Std0qbxZI5hlwAiaKjDVyOuIp53SalwZBO5BYI1B8NB1zPZisAWcgqQ37AsAI1fYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779773421; c=relaxed/simple;
	bh=SmXOInYNnuuWw9LyfstHCgLf7UMa4kUN0xkTlOURXRM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s/bGUUcnCtdESNCxMlxTOhWco88n9UjaAracSx5Snzu8IS9ok2EZc7HbFy8e3Pqj4QkKvdYu1nkUZT+AUTPf9qR2ieDhDwDRUE0P9dPwpPpoX/Kr7S03obN/wVnSc8utl8laO7XVKIx1hibHHiKD0l4pmuDTjAfhB+uUMm+nRuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CzQJlEGW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IclSXTZR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PLfSbL3263593
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:30:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vq7BrayrVFPFC+ZcpVlN7OvCC/ZbYB0qftswyZgjhdY=; b=CzQJlEGWlesiVrHn
	FYVPkwDMk4oia5pSsFHfoL4PmB60lqVqLF1mc06sV7As83qPkyYD5A1gXBqNk/O+
	s5bPglkNWkKjV4yJnRk6rYfrd1yy4vrpAC6K1wQ0mOt+G8tk78+MoIAv8u2xix6I
	98YYEdBnM77oEsy40QyXop1HLqmTHD4N9DlphQueAKs2JIxBJmzNosNVeCyBkfW2
	iPDeVDQAsV6tR91ELVZfD9LTVeqMSsDdLjAWFZ+9HJsv/R/KKWTtfn50kxmd/wMq
	Rk+9dHHu6ZSaNQz3j9634R7WPVARLZZgeI/9o4kh3NUToE5+dQHhfMgP44g3GkX7
	JrEMNA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecnhs2s1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:30:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2baf7378ad0so107463765ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 22:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779773418; x=1780378218; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vq7BrayrVFPFC+ZcpVlN7OvCC/ZbYB0qftswyZgjhdY=;
        b=IclSXTZR3bSLrkWQBOokrYTlJ0rtS3vj3eFqimTk+J3T1JwJFGWHrf3rYIFiuzvqxk
         PjBGTzgU5xXmGCAek/MGtaSCSf677Bkqq9zntDaZn/Yu1dOL7CV1jI2SfPly4TRNCKc3
         fnyLpqrvCB9ZlpzxZF76KDl4igDp6se7DAHwwXUJ92zBtlLBWoToPHuBo/FWDvOJlkCX
         ZHcNl8DEJmCPtcbq9+xTkhTW7ZRjLJ6roIboxdlqKC0r4LOoCgueq2ctKQzeSnCV3nBu
         0sgdOawbOQhyJA7EAJv6vT89Zw9T0BYCGKumNiHP1jaqOm+DGHRKWW9AyF4Bw/P20jNK
         O4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779773418; x=1780378218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vq7BrayrVFPFC+ZcpVlN7OvCC/ZbYB0qftswyZgjhdY=;
        b=oRKs67m5sYjka+FNU5tGzEI4gU3emJWascZEd08Sgc2gYb1h0z+ZjXyZVJDtGPhmYg
         dODSjNewH2O1yf+7k+IoEjcvfMxKuPOwvdNYZXvjtOxtaJdFEpLmfSJlF62difWHYYou
         L2El4X+/k0bbFM5bLdPdAaZ5c4l/DpSd8kqn4iBnD/7x9dW6XHoM87/qKA01TPGXNLzq
         6IQ80DVq2ND6yNxctgXNuWc8cxcfWTe+baJ5adcCmMjNrQzes9rBih37keM7n1BKh9ii
         wnODfbyrnxLxTXpiUF2Lxf9j4YZQmQl6QlPm0OvEgDbUe+mvAW+vXT7pArbkzfrqCPpc
         NKvg==
X-Forwarded-Encrypted: i=1; AFNElJ9UbOsb+KEmroiRZNIumK2OivlbyXCUQ3nVm6j19Z6n3j0QlMQz/Xm0IvbFZZsJyu4CYHgzzBgcD4P921SM@vger.kernel.org
X-Gm-Message-State: AOJu0YwTBMfJ9lRPX3LUiVlfcO5RFUQ6IUMln5qBQWfpSxEzFMRe1aus
	LMjz4E+lLPBKJtxUCrkDdyy8YsnKiEAoC7JsEwVA6fHAJiBoqs4BiEQcTYh0E9FpCXJfoX7cxc3
	3qGKnsSQLv+FQG5B3F6Ks740T+CPxerFqoz8G9jcfF/TgoGUHOGNcE4hv4IVJreHwCLGA
X-Gm-Gg: Acq92OHOIz0Mv8AT73NYsHdlJG81j4p6V2RxrhcFIDtMsI4dO7jX4+W3NSA7EyvPsJJ
	jqIDhZEX3Mlh1hQg7CNzZDIxtLuqZOWiIHpGjfRBz9K1JYWYeYnA622euyaeLoeh2NjLqqmt4Jy
	7o66f4Xe3CnDZMADIj7FsfSAGjYnA3vTFtOSdaljPKVDLDTwrZ1DDvw/Zr42AU9rYTuPw7kDxo/
	nIk9N6mrDGNawN9lfZ9Rb1WvmP5XCcUt6h+ZG70Wl8VNFhYzP/Fow+pKfTrKgBte7wET75qNzIA
	dieHVBEvpCBmyNlyxYJHyK8y6xUg/uPQjqjddlb5bW5ZeQHlUzjWPZR0GR66ljhi0ABbjay8asT
	twPWFlqcR7/Ym1SSbMD9XiRZ1cegIT1mUxyZjBCkWCLmK/A==
X-Received: by 2002:a17:902:e548:b0:2bd:4d97:b5bb with SMTP id d9443c01a7336-2beb0385f86mr195646375ad.12.1779773417312;
        Mon, 25 May 2026 22:30:17 -0700 (PDT)
X-Received: by 2002:a17:902:e548:b0:2bd:4d97:b5bb with SMTP id d9443c01a7336-2beb0385f86mr195646035ad.12.1779773416724;
        Mon, 25 May 2026 22:30:16 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56b7920sm114088995ad.21.2026.05.25.22.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 22:30:16 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 26 May 2026 10:59:47 +0530
Subject: [PATCH 4/4] arm64: dts: qcom: glymur: Add EVA clock controller
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-evacc_glymur-v1-4-b61c7755c403@oss.qualcomm.com>
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
In-Reply-To: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=Vd3H+lp9 c=1 sm=1 tr=0 ts=6a152fea cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Juf6bUmjuD87IqhQNpkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: cs-AVPYU34usAoK3G3BW4DDf__wKO8FJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA0NSBTYWx0ZWRfX82DAw9V9ZjvN
 Af7NgKVhEXTvubszkOtYBc/jVrSWT8VbpjAZADAoEQlDH3bpskcxl6Tjr4t0gqyWfILJmI9aAgI
 RWsoxJ6nzw+01g8cds1J7wBCKFTAusCjh0ZN5EHrKV366HnGZj2vd7M+Vua1lj8su525s50WLRT
 jU1Zwz4ZYOnSMkUE92KQM39D94icyJe6vrsGGB6HI/4z6AW+K3GnVxTW2QcimYKb7lChhVztbQL
 jPLOf+3laqqUu+xIxTZd2K3CZulpNk9t0ja2akRHM6c5ORWCvsoBEUQtqntsPS07szvtfxu7RkO
 z5rueDDUitf/FJnt8tUsvB0cNkAwqFcnlGZz7LubMQzt966l/tFl+8OkAQOsIVPHkm5Vsv6etAx
 VFy9eBMPexCDEIfnT9SzJFfKTIA2yqT4/aMEgeucLU6NadJh8HzxWPxcRPtmXuFLDWpPJ1PSjsQ
 kY/T/wWuev3zHaaOWpg==
X-Proofpoint-ORIG-GUID: cs-AVPYU34usAoK3G3BW4DDf__wKO8FJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260045
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109722-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[af00000:email,qualcomm.com:email,qualcomm.com:dkim,abf0000:email,aaf0000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CB5275D0DE5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the device node for the EVA clock controller (evacc) for Qualcomm
Glymur SoC. The EVACC provides clocks and resets to the EVA hardware block.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e9549d126aa50a0dc7a90943a3249..66948808d197bd17ffe65190b472bb845cba0eb8 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/qcom,glymur-dispcc.h>
+#include <dt-bindings/clock/qcom,glymur-evacc.h>
 #include <dt-bindings/clock/qcom,glymur-gcc.h>
 #include <dt-bindings/clock/qcom,glymur-gpucc.h>
 #include <dt-bindings/clock/qcom,glymur-tcsr.h>
@@ -4804,6 +4805,24 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		evacc: clock-controller@abf0000 {
+			compatible = "qcom,glymur-evacc";
+			reg = <0x0 0x0abf0000 0x0 0x10000>;
+			clocks = <&gcc GCC_EVA_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,glymur-dispcc";
 			reg = <0x0 0x0af00000 0x0 0x20000>;

-- 
2.34.1


