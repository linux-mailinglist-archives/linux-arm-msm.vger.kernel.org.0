Return-Path: <linux-arm-msm+bounces-79513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2C8C1C20E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 17:37:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A86F960CCF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 16:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37275354AF6;
	Wed, 29 Oct 2025 16:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NOOEL8vj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VB460x2W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F72733F8DA
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 16:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761753679; cv=none; b=AlCnhPt+T/fwF5waI7+Q5I/Wepplm7LArTrrXoWFAc9a2bNKMNsL4s0DTkditUQICg7aR9NkGGmolSDwvxet2+vNYNGhRA8ren1a1Oq1WnJjDPThj34/mQ8eYox5ECtOzqmhqywK/VRtzCTf1aU3sp86WJmCnqYXnVxEnBxOq40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761753679; c=relaxed/simple;
	bh=iZXJ+wvYSZ5S6EtMrmxWZW14bw4Q9snvePaLf0HVOQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mbqp1CuxPoUs7Id7mY80ri+crvIspbu2TaySzMQCCDHyZoMvTy3zs3+0fkE+BSAwUvOSPJN4rWFTExzNsafnaRJKoGhE9/wM8VlFqzPPUQTznQCdDl6rouFe+MbUho+dj23i2fDxDGG9p8lh0ONJNcuXxmrMvMQ2GePValeAEUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NOOEL8vj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VB460x2W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TCwxXB3720718
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 16:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xd6tUxrDmZV
	yYkpH6AHK/2JkgivGrY63G9FW6CayDw0=; b=NOOEL8vj2NWA1GTOrvp+0hoMfod
	hfSfTlX58IIOqKdai/Pwy8kBLc3i5BtaKYAuSDXg2NLnUiaGPp5PrXmCxs62xOQZ
	TOSbY5brM2mR8uyXCdJdZEgn02oZ/C8mWyAQre9lj+MuMPOyH372zNfjRjHjJOAa
	gy9A5fNxX6GGpSXXyzk7F/XeDQVSf2itzs7KB8gPSJcKnju40EFnpyzUCVNdwkYz
	507M30s9UaqLo62GPbz7YUblmSBh9ZWqHAevCS6DRo9iQfAsurWtpUgqh0rljSfn
	irlnE/VJcBukpfrNvTj4GcwXRhnbFVIQRHPitgpXxEjSfjPi1uR7eLvmJYA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a237fs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 16:01:16 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-54a7d8436a4so4791097e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761753676; x=1762358476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xd6tUxrDmZVyYkpH6AHK/2JkgivGrY63G9FW6CayDw0=;
        b=VB460x2W4XbxVrN9/6yFB3sAgIhrq99fG4ecGqb54Oo1mf2Uo0EeSCsbo6MCtQcLp+
         FboKH7Qm4VA8QCBlHuGWt8fAeyrgIGBl66cDmsqChuJbOfYAuruNXJehpaudTJMgekDT
         LvgPfOgQRMF3z+JLtG2si3hw4gU68W8cV+JEX4HkM/Al1ZiZNC90sqNHFuRT3zPHdVO4
         RirGiJ7nNXNR69FspHBHjSbQK7Le9D5ZBxz7dNizBB/G4Ud+b7+und8kJ2OlhPMQMZL8
         CQZRxDGmhWkf+qIR1xlvLxbNy5thICTTdSOTUFski/YDOzL0H7BuuMKS7NEjhedboIhD
         87Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761753676; x=1762358476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xd6tUxrDmZVyYkpH6AHK/2JkgivGrY63G9FW6CayDw0=;
        b=aEY+jadc1cLxbF+2oF6gZ5pjfffQhAch4ZyfYpa8eCVy+b91z9H2VAwDCP19csfwvT
         elkiVHXF0QZv6eqZ43K6resPEl251RCy5aJgcETn2kz0obcr3Um76z7Vt961wYfnO4Ig
         qRtl+aSteZj6vE/Buj5LNAZUmTBg9iOX2YQXJYtSN3tLQzt15FopryY9nmh+RA+GSGH2
         hRShuzRe7Pt3s7uVvvW0xLkS5cQr1vx0EvT2T5UwwkL/jjNhKVzedt5lFWeD34gQsNbw
         yS7uGI4k+TwcksxgBvDaGk9hVjyIxtfk3uW4+zdY7ibv9WI3KQvvGdB56jeW1D2saX09
         ThfQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2M/VT5H6BUl8R49rT2dfraIj/bumlixyEIOJplyd7Idg7TkNu2m9xgjlpGK4/85P7CrE7hTZdpxRw4bu8@vger.kernel.org
X-Gm-Message-State: AOJu0YxVysz6Mq62ZJ6JBdIDdeMY5/mJJvusDAA7t9GDOVzRuoADx41x
	YLMVvbqvQ7VVZXyvLwpxevUB2gth9Y+vThGzTHxoLqD/jTPuTwxa5BGN3CBvQZ9KiltmQjn6L1J
	ccTt8wTjYjAcncPVPZA9moIgFPWBmtByjVGuHNa01Ky9jp4+qeoSO+jQflQaVoI8TzzuJ
X-Gm-Gg: ASbGnctd0vliROc2F/8xgPef1X2VPN2AEcjomdslXIfvyS7s88cGYalf76UimrU/MRz
	S6htYgRlrHrMOEwUaa2BcYyT3jZHRfhztV+4y3z8CE78oWWL2UVnSwFpYYyhrZHsPnhoCqbY8yq
	zNvysUyeWYSm/XiyaNxtnH4yvmxRAtr4LQnAMxyFVpq2p9MoGStU2YN1ANVJyoNQ70UzJZbtEmM
	iVOmagFT9dsLJE9xsOD6oHv1+TAEcodmIac1t7okQMV+ZGX4s3OkOpO5cbH3VLV/KGgPUYo5QvP
	0UvNi7O9by2mdZdHpwoCjR9kxBmYjV7Jbku61gE/ftnaq+j6EU5YQrRGkqmoW+aTPMdkSW5l4RU
	CQaciVeAbEriC
X-Received: by 2002:a05:6122:1d9f:b0:556:4f4e:812a with SMTP id 71dfb90a1353d-55814105b1cmr1156461e0c.7.1761753674923;
        Wed, 29 Oct 2025 09:01:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmMyq2OMke7b4038qoWowzNVA9IP6dPgXk9UEoB7Iao+WLyIdArUF4UBE7roEcnbRQ9jmahA==
X-Received: by 2002:a05:6122:1d9f:b0:556:4f4e:812a with SMTP id 71dfb90a1353d-55814105b1cmr1155604e0c.7.1761753668177;
        Wed, 29 Oct 2025 09:01:08 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e27f7b8sm57154535e9.0.2025.10.29.09.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:01:07 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, broonie@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alexey.klimov@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH 1/4] ASoC: codecs: lpass-tx-macro: fix SM6115 support
Date: Wed, 29 Oct 2025 16:00:58 +0000
Message-ID: <20251029160101.423209-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029160101.423209-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251029160101.423209-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDEyNSBTYWx0ZWRfX1Ee/A0v2ZBZo
 CJ+AKvzzI2x8Q/WjVQ6LPdOVCR1uDHG553hCJBFCJ5MY1t/Li3woh6oDwt4rmW6i62DmHM6C+cv
 jzk4xAaVr885jGKrkTQca+CvzJT5BR58w+a7ygr8DHSmQFqa3/gUfAVKVq77AGeMjxf/t2g4q6Y
 jyy2CaySS91yp4kmSdq0NTdafBONIoCdhFvaO1+lPMTfIW5P2Ewt3prNfEkaT3ut9OIh8HgXfNg
 2WcqhDNvln0iNSIR/ABdBjNBhn2rstTlqiaM5Ru4YoEQHw6V7KZzKAYgU7/90nhKCcqT4Mu1gam
 QSDXbsZU73VjCF9u7TR6AgYgZ9L7R7zrUiXNi835nedvOFgg7MuagWfVuRm0ZGho3i5qMdvBPri
 HU3O1nS8V9Y6PZp+SccQQMR881pjUQ==
X-Authority-Analysis: v=2.4 cv=V5ZwEOni c=1 sm=1 tr=0 ts=69023a4c cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WUhUZdYVz38ogwO1su8A:9
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: YHr4YRzd2XskNMvaPqQ3222liCTe4kSm
X-Proofpoint-ORIG-GUID: YHr4YRzd2XskNMvaPqQ3222liCTe4kSm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510290125

SM6115 is compatible with SM8450 and SM6115 does have soundwire
controller in tx. For some reason we ended up with this incorrect patch.

Fix this by removing it from the codec compatible list and let dt use
sm8450 as compatible codec for sm6115 SoC.

Fixes: 510c46884299 ("ASoC: codecs: lpass-tx-macro: Add SM6115 support")
Cc: <Stable@vger.kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-tx-macro.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 1aefd3bde818..1f8fe87b310a 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -2472,15 +2472,6 @@ static const struct tx_macro_data lpass_ver_9_2 = {
 	.extra_routes_num	= ARRAY_SIZE(tx_audio_map_v9_2),
 };
 
-static const struct tx_macro_data lpass_ver_10_sm6115 = {
-	.flags			= LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
-	.ver			= LPASS_VER_10_0_0,
-	.extra_widgets		= tx_macro_dapm_widgets_v9_2,
-	.extra_widgets_num	= ARRAY_SIZE(tx_macro_dapm_widgets_v9_2),
-	.extra_routes		= tx_audio_map_v9_2,
-	.extra_routes_num	= ARRAY_SIZE(tx_audio_map_v9_2),
-};
-
 static const struct tx_macro_data lpass_ver_11 = {
 	.flags			= LPASS_MACRO_FLAG_RESET_SWR,
 	.ver			= LPASS_VER_11_0_0,
@@ -2500,9 +2491,6 @@ static const struct of_device_id tx_macro_dt_match[] = {
 		 */
 		.compatible = "qcom,sc7280-lpass-tx-macro",
 		.data = &lpass_ver_9,
-	}, {
-		.compatible = "qcom,sm6115-lpass-tx-macro",
-		.data = &lpass_ver_10_sm6115,
 	}, {
 		.compatible = "qcom,sm8250-lpass-tx-macro",
 		.data = &lpass_ver_9,
-- 
2.51.0


