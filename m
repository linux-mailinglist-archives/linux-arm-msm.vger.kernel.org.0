Return-Path: <linux-arm-msm+bounces-103407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OF4kMa7V4GmMmgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:27:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE8440E1D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:27:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56E3A30D6530
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 12:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 359943B634E;
	Thu, 16 Apr 2026 12:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nPwKySPt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ctiw6NnD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8513B777F
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776342395; cv=none; b=XBDrN28rihTmZXeKFvh9Vu9KlliJQoKm5WBijwNkyVCrF477WMoOz/z6+GO0csTfiQFXKcQMTIpw5MEi84u/QUQltAzm1wiB4Jlfjk6JJ9bIt9UwHJ+q7IymPLMJdHnjzHidGwQZLtIZMteh8swJFe8OYO2z5j83Gtn6pSf++9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776342395; c=relaxed/simple;
	bh=kjNsbbAnPOWPulYetNt2ZDY/hOhxvWSIpvkr0u4y45o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d6DjFX/9DmJhQnL754GVplsMFT3FXJNBEuoQQmosFjfjuGT+nWP8mREk4DLbG5FNyBLL1cSRjSTarBs6hTKJxsdsERimHg97ch5A2FwcqI1/KR2abAPFY+uFUfWLYnDt8cErdrQsfnkkrxMP9XosSlzb9a/i7N0Q6mmas28MYHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nPwKySPt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ctiw6NnD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GBWkl61668246
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oT3Z8KkeKnk8nY9vPJQHBiOQiJXSF2BmoMm4sJGTvYs=; b=nPwKySPtbV29bhEb
	0ZF4M/m5gSraytVO5hYisHzt7VSEi8JYyzTITlbUkwhPY3qi77gtbTOWtELiGzsG
	y+ogS16Qy7ymmtFG0NePx/NDl7u9Lf0LCAfy7C/hFqrJImIltr+E7C2h32jvNnxz
	rfPKGBJ+9QDhKBA//DrZo4up/EhF2xw8TEpc+KrUfoprNfUD5EEj91wd7nzZwJ7E
	zmUqiH3Ieuq9un2+u7KoirCKt5+OZyzIOI466NSDuua2rVqTl/fwVXOFD1f8w6AV
	tjUaRbi88izcWmiXjyptZZb0RkA+8Yyff+JV6OTBzI4BImuuhBcWbujiEs577oOG
	TN3vGA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtd919md-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:26:32 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f37353f52so5435037b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 05:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776342392; x=1776947192; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oT3Z8KkeKnk8nY9vPJQHBiOQiJXSF2BmoMm4sJGTvYs=;
        b=Ctiw6NnDhN1jLJ2wftB9SCzFv/e3D7HpFFW7PZBJyxPAfMiQsco8vbmYpKYsPo3ouV
         3Oz5WHQKlHEiHCru29dvq3seEu4+Q0Wm2SIbUgRS2my7tey/mQ+Swkl3LABjBwltSy3X
         WaQj1VIgCQLbN5CW+Uxcqfp0K5jJPs3gWbo5rS4t9mSly6h2P1QjjhNfmQzmjvSTkJNQ
         Dwb4UB+dCWiF5zTfQnVO0VHEOJLrKqhKmZZtJovl9j9xFZyorKgBwQ+h5ANd6isy7VUy
         Xbnz+Af6ehcAssDxd6W2tEzkwvOaEjVMgoqjdoXCCaVt/9agIBgNR7NODw6E7UzPT5Wz
         eZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776342392; x=1776947192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oT3Z8KkeKnk8nY9vPJQHBiOQiJXSF2BmoMm4sJGTvYs=;
        b=fhaUfsZ1x8w8LSdtNxegJZuJQIHz88RAHuWuBeGzIpOnhwxUwZwa20fFCIeTLrEgxN
         Q4ZTXPsaOkRRQSQbuhd7h90MTOluKGPOn4NE6zDTJaz4IEnawWHV1yjg8TVCdw9qesKp
         pCy7Bp3xULlDMSGs8B5rtZ7RELtL4DJE/wd1E+7Ai4lrMEaXWB86qE/qCrXh76iEBh16
         FPQdG7BN2d/ei2WHQJ2VJosRYIesSnlJZrhmSV6w7RUo6dWgnzDO3TiA1hAUM7o5x99n
         DskFrLiT08aWZDbhcg3QRJkwcz2dEi3W3ZzyyWyfHwQvh8GHuRlBNejTZAyuMsiX24nt
         6img==
X-Gm-Message-State: AOJu0YzCBfkZGsY/CUTOhodW4AsfBAa8cykogmaqoeFSK30zvDOsSyqt
	qcPJqF7tSetPirVMsNUFrfR5nDIt17wgJDUzNDP/jKrJPVYa6Qdevc/mFYBjn4+cokmG005sxGZ
	b1BZXw3JRJPZIVpotPZY5pkrjGHbQFl75gXiX0f3CPP/WDKM4cIY07dr3rHVT6vT62qfr
X-Gm-Gg: AeBDieuAVAloqBXjAPMdag77swa3o+P2eGvgpSe7AJpXOJEvBQRJebq7PKMeDPq7sZ8
	nPd14WzRerBmqMYazXaGryfF0aiI6RcRcbbfmPQ1bfbe12PRsVcFyO12H50ORko4IT5IMD3ux8v
	FGqnastB0Pf+AXEt3w5q4nSMu1AflpiRJdUUw9LXEXHcJ8pTIioa0NAUKYAfEJZLFtCdhYBAGEU
	+ljNoioDoptfaU2S2tgj9qOZU+r0J9mXdAP52EJ15Gp6mUAkHPBzfe6U+3iexDF0/QCCm3oNSOp
	zzgrWzTWMkyNO3xVjdJmudicEgmiqpTRUFIboawbn6cxLpK9E8RmcGfWaFV0SP5HFx2jWtE2cxW
	uk0bPkOPmkdNSE5NasDFjv9VGD08jFe706Z1VZMyb8FO665wXEBxqFhE8og==
X-Received: by 2002:a05:6a00:4218:b0:829:af4a:5ebc with SMTP id d2e1a72fcca58-82f0c1d9bb7mr24470664b3a.7.1776342391852;
        Thu, 16 Apr 2026 05:26:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:4218:b0:829:af4a:5ebc with SMTP id d2e1a72fcca58-82f0c1d9bb7mr24470635b3a.7.1776342391402;
        Thu, 16 Apr 2026 05:26:31 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f673e0b56sm6227542b3a.37.2026.04.16.05.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 05:26:30 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:56:12 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: glymur: add TRNG node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-glymur_trng_enablement-v1-2-60abcfd45403@oss.qualcomm.com>
References: <20260416-glymur_trng_enablement-v1-0-60abcfd45403@oss.qualcomm.com>
In-Reply-To: <20260416-glymur_trng_enablement-v1-0-60abcfd45403@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776342376; l=795;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=kjNsbbAnPOWPulYetNt2ZDY/hOhxvWSIpvkr0u4y45o=;
 b=TCQkWlAyI6ZWfX11Ipg2FDPp7BfXrvk8GlM07IqZY7QC8A8dbTDcuKDFGYejvRT7ZvTEtH9TS
 0tCoM5hEbBMByjKtNS0xNeKUwrFeHR/Ac9mBoW+Yy6bGvTfqJUUcdru
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDExOSBTYWx0ZWRfX8DHc4vVEWp9v
 yUg4EB+AmxFaMXJD9tplDA/MHcvKvYx3d4sXmlrHfuDFhxymDAxBcTmPtcujetLLlc9ma+PuBxk
 WCB6a4KUMwFFwyePGem+hbq/NRcTlkQi26Nzqz8kDCxXt3GdWNI63RIpeJXGvmFIjOM56o70smL
 13V1vsXtAM7kHf2yHByxuQLdFG3JohEib1VdD9Wmgn6dAu7CVtFZviH62e7ygqFxMUPxWwTALGB
 dXut+XtjazjMBFgF4KbebOpRQsqTrKQyfeAmBpuO/6IqdwQ8fI4UGlv31LpPP3/gvSChfVHrQib
 L0SL7tsyD9p2iDG06DcL+Iv0CaznfzDRV7s3ePtXFBZijPZVAa5j2UvldFhdimz4wT2kTIhd2JD
 bsivTwJy3JiVIkiChZSDumpkZSZTInwH5ff/9jovOLd2gNwMU3a0WJYf8DG+NqWW8bv8zb9YJZV
 aT//ARwyuVbO7wzaswg==
X-Authority-Analysis: v=2.4 cv=avuCzyZV c=1 sm=1 tr=0 ts=69e0d578 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=XSQ5iGHSRndYU6rLgXUA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: fpIAHJdeaU3ScXKGjB258VuH567ZuFN3
X-Proofpoint-ORIG-GUID: fpIAHJdeaU3ScXKGjB258VuH567ZuFN3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160119
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
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103407-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,f10000:email,10c3000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,1f40000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5DE8440E1D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Glymur has a True Random Number Generator, add the node with the correct
compatible set.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f23cf81ddb77..c9d46ec82ccc 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3675,6 +3675,11 @@ pcie3b_phy: phy@f10000 {
 			status = "disabled";
 		};
 
+		rng: rng@10c3000 {
+			compatible = "qcom,glymur-trng", "qcom,trng";
+			reg = <0x0 0x10c3000 0x0 0x1000>;
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x20000>;

-- 
2.34.1


