Return-Path: <linux-arm-msm+bounces-101986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECiPOOHf02lxngcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 18:31:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E933A5524
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 18:31:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5F7D9300D758
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 16:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A7BA38C2B0;
	Mon,  6 Apr 2026 16:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M5KlJV50";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="imBiTuUJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B9538BF94
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 16:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775493063; cv=none; b=eApxry8wnyDu2k83hl6kS62gPq3Ie6nCEOc+EqnasQ+cDREp0Ry5el48k3x9Aj2zGdUFgnwzBTM+CgCV/J53PmHhkuWQdF/LhUlztTlZaIVrPWQve+5AaThwWtRbtzDNQofNGgj4rTkuSWGrweazQuH61qbDanf6stuBTQ8oTtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775493063; c=relaxed/simple;
	bh=X0zOoETaUNZbYRdCZLxc7cxleqnZywNwelrvTP1dhVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QU85Z48QZqS3JT1bi9Uim+1EXEv9v/pavrvHnzTsuvf6QQMxenkSIK71bBQC87giC6osYi/KNvt5Ki5wT1z6CEJHsuPjC4iB92qR1Lg6XigmC6QmPsW6OhbpKjw6d1D5f8KyFnMasxy3NJWIZ+yQ6OkM3am7iJqmykiHBLdmIzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M5KlJV50; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=imBiTuUJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636ElYGh1151547
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 16:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8wSWXfIADo0Y6dQj1aeky6p49cIbwPqBQa2xQCaBrbk=; b=M5KlJV5029Ykf6nd
	Fh2rHC2yqyTKBh3XSCgNZdeyQGNFDdlB5WlnI/CA3zyd/g1jEdnIB3OSW1dbRJNG
	OFhAMG6yT166X1e6lcoD4wCquG1BDLfARPxnKGuD8GytXkncBQOCN1dC8etl+2FX
	OtQXFtkuTq8x9wRrfkut4TCdo9uN6OIowLYmVr/CzgXTp0HuCvpIKuIUU4QY3eOH
	4N9YTi6Z/sibGYdAa4ROXn43aH5YKu6WUAUHNDg3Mnc71TJHcZlTx6EJIPqXSc9O
	Vr9rsv38XWgXb4D/kETlNYCsPVOr4bXpjcYRTUb8l4cvJ7XhVsoELN2OTKapE7uY
	1vcxew==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcewerbdd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 16:31:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b249975139so106286955ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 09:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775493060; x=1776097860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8wSWXfIADo0Y6dQj1aeky6p49cIbwPqBQa2xQCaBrbk=;
        b=imBiTuUJBagu3IKTwbzjILi5nmRN2vnKmnh/+8B3CeplrhmoTf2+WOJU0vBRPT/r0m
         SH/rD7w+df/MiMrhk21dUu9tCM6DRx2ZuNW7si8ajZpu8QgVVNAXpBFxijpJ2TO7RGxe
         mxohxWVYE4HsS33cVAUZavP/jmWCS7zPeg0gvnlFv2D6xFAXokOG/vnt5l3mhPpwuZbV
         oGrBg5OX2dA8hzfquiRrdFy0VOLM3HDThR3koR4EQcwpIod/4mJAriwDH3wJg+NlyZbR
         sv+F7GGl0AHcoS4sAvTVTBaaxVHWiOwUejZMZ/dDbdyIsVpg/OrrC66rY9b+VwxYZKzf
         FVpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775493060; x=1776097860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8wSWXfIADo0Y6dQj1aeky6p49cIbwPqBQa2xQCaBrbk=;
        b=MkI0gSQsWUDUBb1LmylQmuHaHojRBcM+35yT1DfSGpwgEWKWAzj3R8LdtiBQgBFN0O
         3hob5W5ZSnidcxoqWQU5ylTJEgnhdnZKSH9d8M+IYXCfounQljr28P/ZydRf7PHltXvX
         ldgf0RGfkvFeuwW5hIMxxvTBjdwC8Ee4R6Ldvzikz7+FM3w4S9i7sN8reiyoD/9MmKss
         cxSY/aQzSn1fZX4zuGBXOJdf22skXMtFwWy7F+uGqS5epNMtAPOY+WwkmtbzNH84OxsP
         Gc0WAGOZ61q3AyaTkIE4HAz9Uf7XtV9Lwf+oPACeCSI2swTIxi05a4h7/U7TgfSZVTyG
         E6qg==
X-Gm-Message-State: AOJu0Yw/fEGxjTSpEUVX8xuqeQoyaKLZx6+kc9zuYnQvWZqeInn5gOs7
	BVRqpf9rL6aLMKQl+3duwPVcnKPJJDOEsuPwOk+a2StjfxvNzwlWEcm3ej6yCoWJc0FUmt7+hks
	rYoB21Qf7kWJiFtAYsVoV5dREqycEHb5LKBuWLSgTQtXOh+YHyUJKfuc2KvkZaxkUahPj
X-Gm-Gg: AeBDieuh27/xy+5ew2VVttatbIYSLdLvPt72I+FbEOTFdCxgC/83X/MtQ1cIKuHBcCm
	GzuVwOEpePK48OVY5q6Hr8Q+cc09T+z2CdrvbYNX27dviZ1n/5/SiFnvsiDw8AuyF0ls4BnfZ7S
	19QbQImJsJcOcwdjrTjMArFZ0NxYUKyIwhxejigeMH2aqEFBYAOmEGVytDl8nd0/412fb8uSZfV
	7Q1gZTI1pC2kBpnMqj7pc1/NIgGsEpRolCmE5vDO9dLRAscM3rUvP3rT8TfWvAAE+baxhhMzI9o
	MLZogEZw+PU0sASxjc9Qb7UXAFxLTN4T0x/+QNL1ZHkmjCH+abKSAQbxMhub2ifFZclPNNE02pZ
	RtsAWlxctCRgMFoSTBlACy/TFgC+hXi6zwZ0Ztr57yyoVwkasX9FFgFE=
X-Received: by 2002:a17:902:e74d:b0:2b2:5771:4ce5 with SMTP id d9443c01a7336-2b281547ed9mr145572995ad.0.1775493060511;
        Mon, 06 Apr 2026 09:31:00 -0700 (PDT)
X-Received: by 2002:a17:902:e74d:b0:2b2:5771:4ce5 with SMTP id d9443c01a7336-2b281547ed9mr145572595ad.0.1775493059999;
        Mon, 06 Apr 2026 09:30:59 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cdc61sm145144455ad.80.2026.04.06.09.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 09:30:59 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Mon, 06 Apr 2026 22:00:37 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: monaco: Add iface clock for ice sdhc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260406-ice_emmc_clock_addition-v1-2-e7b237bf7a69@oss.qualcomm.com>
References: <20260406-ice_emmc_clock_addition-v1-0-e7b237bf7a69@oss.qualcomm.com>
In-Reply-To: <20260406-ice_emmc_clock_addition-v1-0-e7b237bf7a69@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-ORIG-GUID: _8dpmVGOW6v836Znd7IoYTID0mWzp8Wr
X-Authority-Analysis: v=2.4 cv=E4nAZKdl c=1 sm=1 tr=0 ts=69d3dfc5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VpYg6FisGcu3jhjwBKwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE2MiBTYWx0ZWRfX0+yHigyYz4dd
 zbOsKEOGXwF+S3Rmz6VXWWmetmfpJy7+s1R0KRBVTvmWeuoj1WuTC91CJe9Z3ltK0ZIm0Di7UeZ
 FerPsuq3oXKALfToZIjJ1ueVaw7geLwkXvS+cNjC77SCsabGESgqf2kqWl8lpb0CPHdgMKTqEMZ
 eqJhJ0bPJ9OfFtKVsTyvMwPOKVRGkE9yc8ilWWfQKTjoI+SxwbjM4DiKY2ctO5prEVnhixuJAFV
 Cy7mHGhSjttfC3SzZ11Q3pAaob5+MvMJyhUdV3K2Z07aPEuU9qyomwb7bzo0qamtLRUojqVU58r
 4AJSk2Vlqz/DxJuIpsoyo7YkbUXv5cF7SQB7CfQYkff+PeIoznkPDMNSXDM4bddJQFqVOkLKF0U
 +C4dZQD84C4y7c58PUZWJ7mo6TgDBIKO9fra0LwMkVosygmDBcVk2/1lzC2XEj7LhxU6KEJ8xmY
 KuZA7gt9Q2//zzlUELA==
X-Proofpoint-GUID: _8dpmVGOW6v836Znd7IoYTID0mWzp8Wr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060162
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-101986-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,87c8000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.135.221.64:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 86E933A5524
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core'
clock the 'iface' clock should also be turned on by the driver.

As bindings allow to specify 2 clocks, add iface clock now.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 5fd289669353..e4bc1cc34097 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -4873,7 +4873,8 @@ sdhc_ice: crypto@87c8000 {
 			compatible = "qcom,qcs8300-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
 			reg = <0x0 0x087c8000 0x0 0x18000>;
-			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>, <&gcc GCC_SDCC1_AHB_CLK>;
+			clock-names = "core", "iface";
 		};
 
 		usb_1_hsphy: phy@8904000 {

-- 
2.34.1


