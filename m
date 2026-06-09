Return-Path: <linux-arm-msm+bounces-112030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VTJ7BGnDJ2r91gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 09:40:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 786E365D500
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 09:40:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LcEIewhb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=adObyBkA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112030-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112030-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C5B5630CFDCB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 07:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74F173DD852;
	Tue,  9 Jun 2026 07:35:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF7B3DD530
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 07:35:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780990522; cv=none; b=WxU6ywBlkGMd4wqn8moqzLGDHq4e4IwxZ3Ma4fWcAYzYcQdHVcUpYS9oQFGD5ABSkT1QyVrLp27cH954bZTYgcvF82koAV6QRWSRDw2MJU6L5fQDV29WZRian3Up3ZVbSgmAs4OCO9J6k1UIHEudyZYJvI9Gu+p5JNH9rQrudSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780990522; c=relaxed/simple;
	bh=3yDThcOnbF2KCDvNFLK8o0ylkBvCKCemb57a0haJedI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OtGWLvg5sIfUik1RDPy8vQLWxqzPX9c4i5pEdnloz7OUCNSP/+IzCb9Yunb0sR5TMjpazHDUBMtk7wMV5GPeXcPKYJ+T7pmSTv0tOykvznTC7wGuArlhPe4O3GBJbn9ds9h41dIk90CVKiwyHxUMA9W6N5QdBDzQXADSiVJH8ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LcEIewhb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=adObyBkA; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6596xi3K1878500
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 07:35:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WLiPN4GyiZlceYQ34rrw22J23P5MVS/Mlwv
	ELKMSq8k=; b=LcEIewhbNiT2QQNjFWsDvZbkGkp5Q/pVbpZyBIjiRJOt2KuqfSN
	p0h2lkg4M0MsTd/AOy3MC0tGxUSsZ0P0nFTEB2eGeU8Ki+MxJoaZQKz8BPyvuc7Q
	XjEzmBTElNgY2iUlYJUpt2CiJ54c6e8Nvous/R7terrIP/ldsSBNk/jrKfQ9S7nB
	Rq+IvfGrmYE/WN79sSRk3PlhOaMoLQ3eZZNOixVVeAJTC2JKdMsrkRALoiv6E4Ub
	fi/L1xtrqvX7SJPnhRRwRg5BB2ZQgX4CZWCTpv6s6X6WdGhgMAjjIYVlqBY5mwDh
	viwPvx+cyMen6dnqpjFr92NJLaLmU7h83tA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epe25r4v8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 07:35:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf281d523eso39688315ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 00:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780990519; x=1781595319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WLiPN4GyiZlceYQ34rrw22J23P5MVS/MlwvELKMSq8k=;
        b=adObyBkAxjG54fVB1xpxpJ9/B2LuSzJQKD/1LWyrRQvP+VRqQN1Im/yItZ7Q1j5oQF
         EHseJQJxP9IVw+t+a+zYPB0VYGrzdMAtfCVKUgWcAJZpMLgEcl5JB+1nv9bCdEHWz1pR
         6SCMFjKv2x8SvG66oM+HIVTmgv74Nq6SfKSUCAvU1zaK8cujcZAHILQQePbExTIJv53m
         Y+VoFyS3MPCgjn13KHE/anVlE53rI17fe0suDtd3fhWh2uoP/i/4c0AX/qKfUEMae5O+
         pO2L1xkG9I1L90AolDDH8L/2lUfhEdqT2Y6NMDff7aimz2J+91ADljwHE7s/nU9/tRbw
         Paaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780990519; x=1781595319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLiPN4GyiZlceYQ34rrw22J23P5MVS/MlwvELKMSq8k=;
        b=fI7icgVHH38riSLCDXXvURhvfphQr5xYo8vJL7QA8div9NcmRKGtHFzVNwKsJGISCx
         rrqHG2QaKh2V5g+495TNuntbXu+flviDgwCBVDwZg1r2OkiNftq3+HIiLyIQJ4WqCYoF
         PHXF1/gldjmY6+H8BNWD9qcSNahhhBLKTcB+SYQcwxQ9WHYy56iDiejW3PMDj2KkC25b
         PbUSwIslNhggALz/ZRkNho1+NvL3yI3N6xFcBAupKLegAYvaQNegWtZ6TRINmWDSGLJj
         O64LjJzGBc0w7v/mBNi9iFOHG7lHyPyXPCyK33yYjJj3xqrCO1WeNDdYDRACSkURY6wu
         E7Ig==
X-Gm-Message-State: AOJu0YxEB/DvmvzLxbfAt4QIYzrVCNz74MRFHgumpKKzAh63Bzj6No+9
	RnM9U2cIPrLqt2dMLpUUZs7i4KXDGEZbCensf6+LKoSuMF4Nkfej9TBMJ51pvV2syOGyqiF2zIs
	D3yEv42i3V3nbhZYpsjyfHaYfCQKNThqSK7qTpMcz6Q6aS4YPOge1HiS52NopPtHxecy5TWWxVw
	2f
X-Gm-Gg: Acq92OGXN4FJ8/QlBQu12e+jbVHtncFof+pqgLsh1Ln+0Rl68kmuYCzGGookBAsvx9+
	PWj6jzdlYVKK8LaZy3Dd5SPu7qNVxjyix9Q/UTjviBatyhaTxpe7q0ACQNKlS2eSKS0D8BpNw54
	WiPzCI16mfNfsNM3D3E1f5t0gBt0QnZQ+hzu2DImc+2cBuYZJv0ztWEDD3HpxruWUhdMQdWxgiF
	3gXjW5MBWxb8DadSGy2DNT6bBJRhr8xPMFGmXXY030exPhV1/gZPbO77Zl4iScl6yYt9a48jHXX
	oWeq7TzVU6Ew6DAfnMzP4hVMi9lSm+N/nJ6KpjyZUTQkz5XmbGLE62CMUqRSWJJMaheYNBy2eB9
	iwCNY2TXotzxZll1Q+u9svNjTipEXU8ojPfGKBT78aO2Jp1iktB68HS99fio=
X-Received: by 2002:a17:902:ecca:b0:2bf:26d:3f42 with SMTP id d9443c01a7336-2c1e7e61c68mr242236085ad.18.1780990519031;
        Tue, 09 Jun 2026 00:35:19 -0700 (PDT)
X-Received: by 2002:a17:902:ecca:b0:2bf:26d:3f42 with SMTP id d9443c01a7336-2c1e7e61c68mr242235535ad.18.1780990518553;
        Tue, 09 Jun 2026 00:35:18 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm205521505ad.22.2026.06.09.00.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 00:35:18 -0700 (PDT)
From: monish.chunara@oss.qualcomm.com
X-Google-Original-From: mchunara@oss.qualcomm.com
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        ulf.hansson@linaro.org, nitin.rawat@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, komal.bajaj@oss.qualcomm.com,
        monish.chunara@oss.qualcomm.com, jsodhapa@qti.qualcomm.com
Subject: [PATCH] arm64: dts: qcom: talos-evk: fix sdhc_2 vqmmc-supply for UHS-I mode
Date: Tue,  9 Jun 2026 13:05:09 +0530
Message-Id: <20260609073509.2453273-1-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: N0zi2DrdQsTpgxEwh_LVFqM2qNUT_adx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3MCBTYWx0ZWRfX0i+VsRGtIWP4
 zNsb/uc3VzAPauvuzLfzT+SJBPr3hyPySnU4rcBMn1DfG2UYJzRJumeTrao9FgN3RELirr3UJR3
 y2HXn9kETNI5ybNDbxrZRsJOS3LJ84teVvBxMarnCow4FBHzF3hnkfQP9bAKHJ1+1zsdKErV92w
 287+aeRI5GH8pe2QhKUIw0m4XoaDeP1zEpp+JN78Gc6sO9/yU9Ab/i1rj5V7nQzmLpNQDy6Yn60
 JA2JJWCwL8DkexeaBL/VwQR1oA3TAQqrKczBS5J7tL7CVP6wmHeao/zAy66vYVx/yyrqEIwqvwW
 aIeEc6Q7c4Px6QUKnqwPUsA8w0V65S0gYZeaIbi2uhGfYV//TQUywoFh+la2FEVITpJTbHltHoZ
 OdA6QIXtjNIUdMfAzIk3BPU4emjPhMDk0ILUV9dtLbAjoxoyBANyVpQFNs4Imijqct8+2gxOgz3
 GA+HCweWA/UX+qgPfGA==
X-Proofpoint-GUID: N0zi2DrdQsTpgxEwh_LVFqM2qNUT_adx
X-Authority-Analysis: v=2.4 cv=LoqiDHdc c=1 sm=1 tr=0 ts=6a27c237 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=5JD22pyS9HkwBMopzcwA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090070
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:ulf.hansson@linaro.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:monish.chunara@oss.qualcomm.com,m:jsodhapa@qti.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112030-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 786E365D500

From: Monish Chunara <monish.chunara@oss.qualcomm.com>

SD card is detected as SDHS instead of UHS-I because sdhc_2 was
configured with vreg_s4a as vqmmc-supply, which cannot switch
between 1.8V and 3.3V.

Switch vqmmc-supply to vreg_l2a and update its voltage range to
1800000-2960000 uV to enable proper UHS-I signaling.

Signed-off-by: Jaypal Sodhaparmar <jsodhapa@qti.qualcomm.com>
Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 4 ++--
 arch/arm64/boot/dts/qcom/talos-evk.dts      | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
index 294354c034c3..f70823b31391 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
@@ -195,8 +195,8 @@ vreg_l1a: ldo1 {
 
 		vreg_l2a: ldo2 {
 			regulator-name = "vreg_l2a";
-			regulator-min-microvolt = <1650000>;
-			regulator-max-microvolt = <3100000>;
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
 			regulator-allow-set-load;
 			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
diff --git a/arch/arm64/boot/dts/qcom/talos-evk.dts b/arch/arm64/boot/dts/qcom/talos-evk.dts
index b7f514fbc7b2..9ed48765ae6e 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk.dts
+++ b/arch/arm64/boot/dts/qcom/talos-evk.dts
@@ -189,7 +189,7 @@ &sdhc_2 {
 	cd-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 
 	vmmc-supply = <&vreg_l10a>;
-	vqmmc-supply = <&vreg_s4a>;
+	vqmmc-supply = <&vreg_l2a>;
 
 	status = "okay";
 };
-- 
2.34.1


