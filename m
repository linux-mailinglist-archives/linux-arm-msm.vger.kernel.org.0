Return-Path: <linux-arm-msm+bounces-90670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AG8HG+Z4eGmdqAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 09:35:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C240791224
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 09:35:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 975EF305ED36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 08:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D0D2BD5AF;
	Tue, 27 Jan 2026 08:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W0lDRZpI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JPUjrDKm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7015829DB9A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 08:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769502861; cv=none; b=YOwt+2J9SoK6mjHqGpAz7KQbxhgsoMHOqje7S3qzQn4kWnnTdNHp2TS0lr3LK3Frfwu6hyVnnntdu98mpnstORBNtUNBPqatcPWcW62Lb14hwUKPXcwtmopaDh5NmE0q/8J2C9M6Y+UfIkF12Iwj9xakuoPxXuUHe7zNvzYHQ6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769502861; c=relaxed/simple;
	bh=Evg9KaSPswA6me4Nz5cy15rYx00cS6FHnpc1BK9z1Jc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CD6gHNBXktS4CC79RdqyJQVsce20PcRTVweXA+sIUn/aRDgDMXfkkiTXASjQgJzkEWB7a1B8vFhlpdshn3Y+tVXs+Ihpkh/k7UpJPlTVHNd2EP55dAK8Vd4sRRRlBLWPHxbwaycOjNU7G/YDiPSsY6V/naDQJNFbylVmiTHh0G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W0lDRZpI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JPUjrDKm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R86vi0621204
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 08:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Rs1/shu5xLSU4Fstnkbo5NKjASqKYfDpiaUcIwoXDg=; b=W0lDRZpI0cbfU5oX
	ibSwMjbLr7aFfLUez5r0naLlirzJQ0+sVjJ2fcxp49CNhizZ+GZczwmyU83Iz6Wj
	8Hw9OmwovUNlrY6nDhffuJAne6u0zwo8zXipcwVpZ6UCEPIs651qpGOKwbOfFrd6
	ZLj1OAOAzdvhnCKP8KBNVQuyvp8ti+7eFZ6la9pafBlFf7trXKN9VPnS0az1UuEz
	RIt08Ysf8buyv9jllu1gCz7vHddjKQM0oTqXY3VyciJA/8L2nGboKTr742zxUv5x
	zjsLtIjOfKIWDlm9a/zHHkJD3H6psoXSpwHEo5rf0L0as9ut5moa7mRS76+uapyy
	iompbw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjeg2qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 08:34:18 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-124a5098029so164577c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 00:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769502857; x=1770107657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Rs1/shu5xLSU4Fstnkbo5NKjASqKYfDpiaUcIwoXDg=;
        b=JPUjrDKme8EN/Ude6hg/oNnQoy9WzaJOC+FWMf0G2Y8EWGGSXwnerlBsnkOdyQb8kd
         DAaBcxi9yP33oZIm5UJ5D6e+WGqmVpMyknx6ibafeAkHmQdYMC1oNTC+Jf8Kt5EzeguC
         mE7Is1lssdz6scOjQPN325bmlEeY54pgGaYGhThMIwvC2k6fgVyNbPdbldJNzFw60dbk
         zn+VvF9aXy9/9vPRoTN2HncwcTpuLsC95yJqHar41ht5/ZeNbAHZIP2A3ht9c/5kUlp0
         /j32xvSRtR2381BXMRDiChox+jmhc9jPCjIBc9qfxevCfkA59gHLLYwJI1F4YIHKtTeq
         Gn7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769502857; x=1770107657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3Rs1/shu5xLSU4Fstnkbo5NKjASqKYfDpiaUcIwoXDg=;
        b=QEp3YDMblKqetxshAJjNaGqOyOYrqN9bFjN/Ol0zb/06Gd36h3d/8Uj8MlqzqRlXE5
         C9waD4EQvmJrqcGU0Y20PkabCcdi/+zq5aN49Iq8+JNeDcd1rBZ0YhxPYrgenvKcx+NF
         QQwBKDk/kUUvJCAwrkLW+B5c1zc917fY2ToEW//+uM97KY4r5pREBn5pEHHQQ2FJpAIg
         jm4DOGWXpeAy4dAyefLItUPTx1xEm1QnV44ibAjq3+AgnyC0xqJEz4c5pBT0MqiOjxvM
         80C2l62BvqnEQE/jozFT75lmQQ7e0dJualpCh+PVYhVuQQ/Pjkm7DF8IbtgozMMiuIov
         kMEw==
X-Forwarded-Encrypted: i=1; AJvYcCWRJ5x3w1IHbZNKnQO4fPhP7bVKXdraP7hM5j31ivUJnGkbdXHOoV/5ekQWC9y6CBurQCXD9PI5O07TN4rQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwEmYdgFmaNtORHl3cyWJ+0fqAsnlY8lY8E63Rlep/txRgBIqzD
	fz3gQdSt1xG16GSVUDlDjBJWBpPx3LM6NTVN/I926YhxG4+FLJkyCctfwFXDQZrfj5ngRUnbnOH
	wjUZefbXG+L1t7PYDSXfP3XqZhmgDikoeT5fUOaMsq+7IgdAuVwdmFHPK0NXTOL/qB5lA
X-Gm-Gg: AZuq6aLRfxrzHS/0Dc/qSITRGsTX6eDfh9mSwYM+YpeQokpgCIeKtkgRXY/qKa9jBYR
	d6d2DW+ihVWidoS3mRJwySiQzecMePPjz2Aq3Gq+SKDIewCfr+nteMqUb1zt0a4EuVoWaRblMgb
	oDZ4nHbHiJhGNlUwrIjiBhvqv2G4XVodN2oBvwVKu0IXbdI2Zw4AVh9tzYYm1tuVL8hwKoeEud/
	BDgA4UUhuXp2Dc0uX35iJ9hgEpNRle7OgFdl4vNjFJHN71T2NRkYUswLUB4b3MMadhs2bXT6MPd
	au4jmvSu5wpJGwQIeFVW/dKpHcavXyaU4vdEhtBb8HSwkrMOByPD8QzjQVqcgT7RN8yh/J8H7H/
	d2PyA4EEvB0+xjS7TtKkzWqlI8LBNaxaL3APnHls57Fw8/7TSxFNJhbniLsDY
X-Received: by 2002:a05:7022:6714:b0:124:9acd:328d with SMTP id a92af1059eb24-124a00ae7d6mr577249c88.22.1769502857256;
        Tue, 27 Jan 2026 00:34:17 -0800 (PST)
X-Received: by 2002:a05:7022:6714:b0:124:9acd:328d with SMTP id a92af1059eb24-124a00ae7d6mr577232c88.22.1769502856714;
        Tue, 27 Jan 2026 00:34:16 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d90cda6sm21064235c88.1.2026.01.27.00.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 00:34:16 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 00:34:04 -0800
Subject: [PATCH v4 07/10] arm64: dts: qcom: kaanapali-qrd: Enable ADSP and
 CDSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-knp-dts-misc-v4-7-02723207a450@oss.qualcomm.com>
References: <20260127-knp-dts-misc-v4-0-02723207a450@oss.qualcomm.com>
In-Reply-To: <20260127-knp-dts-misc-v4-0-02723207a450@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769502846; l=959;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=Evg9KaSPswA6me4Nz5cy15rYx00cS6FHnpc1BK9z1Jc=;
 b=a3NB+BQCaDogF8T3xQ0tQLC3wG+l6K2pqE+z1vES1uVGWWP2727klmRW0D+BzPgzEbJ2FA1sj
 jqa/lGEUQW2Da5PBnUZJgiimTa27SzHN4mzeBdq1EefoeWye76vqzEz
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA2OSBTYWx0ZWRfXzlUspIV2P6UL
 gAbQgnyWtaKtM5bmOtPgiCI8Vo0YnEg5u5ys1if0OfKS1pONwy9q8BQqKkIyhoj+RvJyeFIEpkp
 MzLlFJk3wT76HXqyjXvDdYd4cv/6iW6VGMQHb1eMa3Kgty7LTc+T6UhCoyz+nM8ub9W6bENJyfF
 xEPL1bEGpCtyGDL4fephk+yzIq/QVGnSGGuTmjQ4dPOLXZU76OrZN/7MXDr1CXK9DN3JhZAZl+v
 B3t++PvjZFtqI7LKorAdPLOQtfL/ThqkgRfBYA3+CU3jfiv9U6DxKT53W1x7OnsdwvCVTL5dzSf
 y7CI2E2twJAK1oByuti0rngH5aCZsdbAYX5DHqr+mocvIeGyKJZYc09LcC7alZFnkRprQdBAqdy
 fJtbMvdjNMUsEsjBt10+fN9HuqeHbNaLE6SFL3FP9ZULk2ZSMbwT5xtk4kbBR3ofOJPt7iLO8CO
 Setl65dKMPKaISc0H9g==
X-Authority-Analysis: v=2.4 cv=Qelrf8bv c=1 sm=1 tr=0 ts=6978788a cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=lIVsHN_WdLZ9tVWbX6YA:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: fLqjt4AoYL5wQ6W0Admj7mYAJi3OheY_
X-Proofpoint-GUID: fLqjt4AoYL5wQ6W0Admj7mYAJi3OheY_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270069
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-90670-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C240791224
X-Rspamd-Action: no action

Enable ADSP and CDSP on Kaanapali QRD board.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
index 66b423a497b3..32034eed03eb 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
@@ -682,6 +682,20 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/kaanapali/adsp.mbn",
+			"qcom/kaanapali/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/kaanapali/cdsp.mbn",
+			"qcom/kaanapali/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <36 4>, /* NFC eSE SPI */
 			       <74 1>, /* eSE */

-- 
2.25.1


