Return-Path: <linux-arm-msm+bounces-90299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mI5VLhcgc2ngsQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 08:15:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5761F7187E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 08:15:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2B76D302A55B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 07:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462FB3783D1;
	Fri, 23 Jan 2026 07:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fKN1JpuV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SuN1ZUNj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E118037475F
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769152424; cv=none; b=H6TdzGqFVF+dsC2L4/Wbk6go85q1p0YFallxgZZfKwQgVc+3BphMN1B39YNYKA4podn3X3rm0uDWaLIh1Y66EPswO9cXdnAVpCLaMWyqAN8qQ8jUI1C6qBDFfay3bnINleBeQ0uZ+BiMufw/XRKToF5QXLZFob4/+4d8/GJ3N+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769152424; c=relaxed/simple;
	bh=7y6blKebgKzt9BRVqRBcQ5R8+G4jp/Ep6s3mVoRZmtA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=glyuuJ5n1VvWFZs8j6KwS+6/RioviKfjpGpRgLk5XoVV1PaP8Ee/pjOvyTxpBmzyN5fPyZSd3x4p9kqtoFBWU3TE5S+LByzqNtf5YzfTR0ChOkJFsjbtW8QMOQsXUGKZptBh/3w1PYM/bOYGon2GLPWEJYkFJIDDcRt94jbENnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fKN1JpuV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SuN1ZUNj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N4SBDv3810688
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:13:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iPV2eXLOd5gbQl9Ewk51iLk1KlwSkFWdUok4y/9LcH4=; b=fKN1JpuV4zIMTy+z
	D4JcSM9LZoTj9w+QulnDBGrENM/TArbNP8WO3B9qoMNcGL8t/o0g/tDxEC4LfctR
	hixz9CQgKJoFnIRAUhN+TpD/Sfd6SKeDgHDZeUw2sM2MDo6LMwhrxdrVsTNFahI9
	S6ci5i5nDN0yIqn0WGuAftewQ1n4NwyhYEFOsI0QEuVWPzPErAGDwW8gV0b0uWX3
	cRuGbHzE5AUxSywOczsJUFRo87+u32KvCYUFj0fQXJmrZpzKMnoBZxrPIGiqOdhO
	Mi8OSEMG6S9hUtOVCnq99F97nTGp9An8P5skvCuG21KuxCmReacHJJhxb3ulH0IV
	ve5x1g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bujq1bu2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:13:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0bb1192cbso15400735ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 23:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769152408; x=1769757208; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iPV2eXLOd5gbQl9Ewk51iLk1KlwSkFWdUok4y/9LcH4=;
        b=SuN1ZUNjzypToBilb0u9E9I4m4g3QLuc5vgRuluo7I7STDc9FBNbxi6hZ0BwU/GQNX
         /RNbyCYWovrtWXgowjtYU/ZQ2u8jMElLdqnk8z3jSUIQVWeWSMs79Q6sl1o6wEiVOy3U
         L3m+QMOOJ1o859TwSq55pGB0EGDthGvv/UWnOoEwyA5ZYQVL1PQcUpGSd3oooezcQfQ1
         Xqp4KU5WWhFZOl9YgBChAGT7ltvdVaFY2fvOnqgN0nQu6TlE8rYccO9Xf4prJvqvHktG
         sGp+4r8rwGy4RJCoRvaQji9+rQV5kIoRAydHO1hgd42YOVvUG2QicDyWGyvM63dRS16Z
         L2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769152408; x=1769757208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iPV2eXLOd5gbQl9Ewk51iLk1KlwSkFWdUok4y/9LcH4=;
        b=m280YZGv/5rPtXn+vVmbXPXkZDXT8u5w/FhwyWsLI/90HdHLnkiJQAu7qaNHUENv4T
         OO9/jiARGtOleytZvlFxn7YXvkrXcZHb2Gu/gSQ8iDrDRdNu9swxt74YCxbhZzWu53Jy
         W1XSCiXbTrbDt+fmvdZzawOXrWMdTpjI88LBHnJZ6GU60wmfkKvJL0uEkAVU6Fxy5W0K
         tYVh/0Ex4iWwx9xEuGyEbnDHmlHLKpWCKFFg8PpgaZOHohtGyt1+wFHB7osPpSAw9eP9
         +9EOM8Hyp98kr3DjTDB2QTTrjMcI0HkXWus+ZPR+0xukmnMhPyHDIJzCUHYNy/nDTxOY
         NPCw==
X-Forwarded-Encrypted: i=1; AJvYcCUwW+QUITYU9AOA/anzCLsK53kqW+OoxM/1Yl3m4F2XzLHTMNkm/UcfOf3pVg2frrnhJo7f2VAkzMeO6SFV@vger.kernel.org
X-Gm-Message-State: AOJu0YymSgWDpZjHFlS0xoJ0em/n6Pb4XNnY5hjccrlD7pL1Bfg4lsaj
	NU4vqtjXJ2GWGJrIA0hYwq7cOCSAHyEz95t5HpKCgnXfq/ix8gn0VqjjvPJVOa5owJZNXXrLGid
	vJFGoRsRvMbBJodkbhPjBWSIueqi6QYHIJu2e0dX55681ZokVgbmDBgeLYcAn34ECPB8Y
X-Gm-Gg: AZuq6aKVqUUwSJ4Q+hudVAnkCQz2L4/zVIbek+XIg4C0dgbWaxLLkYDK+qFD8Qti8/P
	I1iUoYQrXOEWJoenbrUyvW1Ku4MmHVhoIRS+3WwnO17kggr5uGHsnPYdxSAl/Og9i/6F6vTSRC3
	+QGrpmWh2RgcQ6vE+z/JAhSe48ncPx+aQaTdL4Q7X2akxnHSPrsON67SzHDIRJG9hzy6jV/4Uhf
	Mrqo8BT0xrSzouVIoYHd9RSqImnzmXVlxqRWKUiuvhw9EfcZxyu8mcdIgAeh9AZCktwl5XYOPfG
	UrIIo/v1zC4RRDAiozKS4bBm5KK9/AcGimO7RiY7QrP8fU8GJkK9mM2uqe/lDfc6vR/HT9z54+z
	ITPM96F72ukHqYLeRkkKjLnmXDPiB0RLRu8E=
X-Received: by 2002:a17:903:2f84:b0:29e:c2de:4ad with SMTP id d9443c01a7336-2a80ebec84bmr3446595ad.24.1769152407843;
        Thu, 22 Jan 2026 23:13:27 -0800 (PST)
X-Received: by 2002:a17:903:2f84:b0:29e:c2de:4ad with SMTP id d9443c01a7336-2a80ebec84bmr3446305ad.24.1769152407337;
        Thu, 22 Jan 2026 23:13:27 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f978b8sm10979795ad.46.2026.01.22.23.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 23:13:26 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 12:41:34 +0530
Subject: [PATCH 10/11] arm64: dts: qcom: sm8750: Add power-domain and iface
 clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-qcom_ice_power_and_clk_vote-v1-10-e9059776f85c@qti.qualcomm.com>
References: <20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com>
In-Reply-To: <20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769152357; l=1189;
 i=hdev@qti.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=7y6blKebgKzt9BRVqRBcQ5R8+G4jp/Ep6s3mVoRZmtA=;
 b=NPittR0Vi/r+lMXTgDwI9lNwgDucxRJan/NqRGPRF1akhKwbbzdGmVLoSaNzVIkhWz66EuVkY
 5uSPHLwLi97C2Nbvx2my/JSNRn+Tb+iDox2sZnbY8mnRs/MKqxESAYG
X-Developer-Key: i=hdev@qti.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-ORIG-GUID: enbnAzSMAicpJslJP294rngi_0cefeqq
X-Authority-Analysis: v=2.4 cv=O480fR9W c=1 sm=1 tr=0 ts=69731f98 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=n08Rq-YSkjsL-2sbs4UA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: enbnAzSMAicpJslJP294rngi_0cefeqq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA1NCBTYWx0ZWRfX7A5BgNVVsxN9
 czIAnJ9T/DEK82NgbRKW9IthrWG+Q1dZ8iYVgyn1C4nmUFqhHOzShS52bySddp8cHCz+atkU8O7
 RAmalSKszp49HbPaNg/bLvN/X4I91JO0YhhuzKIEKcEz05Ac06WLzSapnZao2XbcQ+yQHNk5sJk
 TWDHbR9kayveHjVNgkuP7FPlRSOPHur9PrrABMuUUw3kc006i9IiVHPH9GA88SZqko/Bh5Y29Ef
 66pXVd7H72fRus9Dtb66UETQtY8bUpXEggXKR0vlRybk7466jYzFro2OxSpeZDakrNFApgRUHhh
 xHCW910ujE9tKEdnWOxGRX8Jkjx6a8jROletoeBkUArIGFGL/b4ndpPdkxbvQrmuPZi33px74Lk
 Kv/qkqs9Ly8zztfw+SVMGHbydZ+WQHpAEH6vn6hceofKDIO/1XhdpqzBVAaIldrc1KxIZNPsyMP
 5lYm3mGRUkHs8HIMXKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230054
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90299-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,qti.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,1dc4000:email,oss.qualcomm.com:dkim,1d88000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5761F7187E
X-Rspamd-Action: no action

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for it's own resources. Before accessing ICE hardware, the 'core' and
'iface' clocks must be turned on by the driver. This can only be done if
the GCC_UFS_PHY_GDSC power domain is enabled. Specify both the
GCC_UFS_PHY_GDSC power domain and 'core' and 'iface' clocks in the ICE node
for sm8750.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index a76bf5193a70..11352cb16baa 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2074,7 +2074,11 @@ ice: crypto@1d88000 {
 				     "qcom,inline-crypto-engine";
 			reg = <0x0 0x01d88000 0x0 0x18000>;
 
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "ice_core_clk",
+				      "iface_clk";
+			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.34.1


