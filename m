Return-Path: <linux-arm-msm+bounces-59713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4594EAC6C85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 17:08:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F8DD1722A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 15:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 759F428C016;
	Wed, 28 May 2025 15:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N7heSTcY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E97C28BA9B
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 15:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748444877; cv=none; b=eU1/nikLCnBt4gOoT80aAjOru/VNAGoIssjglmITD4IGllO9F6loe5gMXc8IMkXxp1rlTzWvmZvJ/vV0iW8TRHTH7efl5cAh0Alybh4R4kXYfDU1SGtKYvxArnw6FaiBkOhhYG7Az7c4NiK9bhfZ7GNhAMEffeXRu4W7fPdGccA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748444877; c=relaxed/simple;
	bh=eP5T/3qpa46WCtYicGSqpDmblYqTBRA3wTFS43IZLJ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eMnObYWSG7CuDG0Wd6wxdvO25umZUFs39gW31TxsHgMXL+p54tSqi0WSv/SrrZzQfIuv0ebTDla5T3Vg1RaksmF8fhqXYbI8U+pVuf2ZrBzHg862/EA2ETnwUTaJkejIqhRaiR/QKq1Zb2nOuQOPxCm5fZe1AiQOrf5u4ACVrZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N7heSTcY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SEWTYt028066
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 15:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Gb3xYR0twSf
	q1c//vnklZfUitvGdMHO5hjz2yEsPShM=; b=N7heSTcYMgQVcfh1o2dxo8/pNnv
	hivx2q0ojUQrcqKDhtFmqBZh9Os63/Aayc2nv6TVv25dquQN9E3WXOqz/3als0Kh
	uHCrdisqNeI8UOLiXRqpa+Lrs/DZIaImgjNn/0Z6l43oZ/5Lw/wnzTJefTgRtWRZ
	hLnrt/GPBfvPPIHvCA1FXVrjyAomXy7prBlyfCikxbZwwKoU274Q93C/o8Kfzqx4
	PXyFk9TIJvcYil3B+H0CLHqZ01jK+mX6U3Rj106OEmenEu8oKWHwwAsO4+b2I0l9
	MHuo1rEspv7/WtUqflvbGdjWf1dwikkSZe6ahIQVSharCdwofgh+CUz2tHQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992mpb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 15:07:54 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-742a969a4d0so3832480b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 08:07:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748444874; x=1749049674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gb3xYR0twSfq1c//vnklZfUitvGdMHO5hjz2yEsPShM=;
        b=J6RRkacIngK6uXKMA5MuHcuHMgenF2PQvUhSPtL40xQ+WuF45sNafG5FNXTPLFhkh/
         BiMxzRa4wwcL/xTQGnp+xlOKRGZEiwvQaBRMW//P7gOUebBd3jB8mHb/RpUu1fvJBU1y
         O1nfsX7tSU9Vp2MG6Ct2h+YwZyNbx+9x108Xqkdf4fkky6llU5fRpryMF7cyawM0GK5A
         hQluEDpsi4XAT1gm8X0stTRceoKH45XOnl1OUD6Y4Uyds6tBwjSulGDlwFNJpmUtX1R/
         hfLIiMW3bNdgqweBkaVHWdNG9zk8ieJqekT9NIENYDKLqua/D+783uEtDs/ynhjFHefh
         uNpw==
X-Forwarded-Encrypted: i=1; AJvYcCUYthXKFfyTRgqN1u2C/1/xD8RNgqVqLvui63LOWvSV8FbiSm7As3IeIaL9m/gY4ttiMHh3vNoMnqb8qwfB@vger.kernel.org
X-Gm-Message-State: AOJu0YyRtZwDWFB5jo6I6xRaZZpjJsbiHNI4RNVPrrNz91jM9Y8TBSZi
	y+n5kyIP3lOZVx00cyw1VeJhBmVjtM0fbPm0/6Nvz51p6vnO8q/V7YNS1gqSKUvNkzBWIiMvGO1
	77ypXuFIPjWexrlAEpDmS4VU9WEuxxvS5Pg6mXZalTYpYb0BeB1SO09ER/rSRhp/Z0hKh
X-Gm-Gg: ASbGnctNb7W1u2afOK+aATLN4ClxaSGMu4Ol7xRhwFor9ivP65ViPBj9AUtASfj/pmi
	O//LCGsm8I2suttaYS5+QKbRkEQebRRuQHF/X2feoLciWb4aXJYRFESZzihS4GDFWWnnVRuPROI
	AMr+sPZoXqJ7DCxKpDmLleMBfp75xmp7sN9N0LD01x7+CmUumLFPtKPVJCl7fCnDBNKRhjVqbx2
	OjyY+rbx/ExD2NRnu9Zzg6qoW12Du6//9nLjz/DmapCtEFycH+23v/tIeIcBcsS5nQZ9Ps3RCxm
	XQnG3xDjCjNffN40AJN+QwrChdX2kgYWcGPCgXhc6qW+WOzv
X-Received: by 2002:a05:6a00:2287:b0:73f:f623:55f8 with SMTP id d2e1a72fcca58-745fde779e7mr23275022b3a.5.1748444874055;
        Wed, 28 May 2025 08:07:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2DPZNzIWOgIK1UTiCkv93RY2irWaXKYNcC4GZJqV7teGlU+c/3gBg+IH85a/2jZay3rIAgA==
X-Received: by 2002:a05:6a00:2287:b0:73f:f623:55f8 with SMTP id d2e1a72fcca58-745fde779e7mr23274987b3a.5.1748444873687;
        Wed, 28 May 2025 08:07:53 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-746e340fbb8sm1373211b3a.106.2025.05.28.08.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 08:07:53 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
Subject: [PATCH v1 1/1] ASoC: qcom: sc8280xp: Assign backend ops for multi codec dai links
Date: Wed, 28 May 2025 20:37:16 +0530
Message-Id: <20250528150716.2011707-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250528150716.2011707-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250528150716.2011707-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEzMCBTYWx0ZWRfX6UUft7zb76k9
 IJbf1rbIZ8GjTn+ndKMt7ChK8gf0vRCXADqP2v+wSoHGbaK21HIlKC5WfhyiahZhNiw1XuBhmQN
 5h8XJ3W40NZ8MKrSU6URqAEmFG9Fe7ff02gzjQV5c68Cn+Bg9SP6Ak773vYYEWTMMypYxpILONL
 JRBb3KAFBAr8rCUA+4FJOaHORV3px+RXajXbR8MfUT4INDjdhVzrMGSzlkNw8EvexKkYPFA4aNe
 Kcg09ARc3KsUkPnCQzt/sVOu4HTODHxbmM5utIWvLBOqYm9pleWg9QMmpqtHmsxCHTiY1oLY5Kc
 lwOv+meGt9y9roVz1gdMOSOzy6Puqsy0N7HhIyaVnM7lliyAR/+cm45KPxiuFZ3Ieylwo2CuKcl
 YXTdbUSmwEjKP9LOotp5bQbvbYJUi4P3kXBmJoS0YtynBNxUkwBjy7DZfY8cGQn8e544Ia0c
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=683726ca cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=Tf-tFfCcsC9FfDuVxHQA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: OfE_DttZZDErHgt-XlQll4fUa6zzPK0a
X-Proofpoint-ORIG-GUID: OfE_DttZZDErHgt-XlQll4fUa6zzPK0a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_07,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280130

In the existing implementation, the link->ops assignment is
conditioned on link->no_pcm being set, which generally happens
when a platform entry is present. However, in scenarios where
there is no platform but multiple codecs in the DAI link,
backend operations (link->ops) must still be assigned to ensure
correct codec settings.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 99fd34728e38..b1b31d197b42 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -147,7 +147,7 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *card)
 	int i;
 
 	for_each_card_prelinks(card, i, link) {
-		if (link->no_pcm == 1) {
+		if (link->no_pcm == 1 || link->num_codecs > 1) {
 			link->init = sc8280xp_snd_init;
 			link->be_hw_params_fixup = sc8280xp_be_hw_params_fixup;
 			link->ops = &sc8280xp_be_ops;
-- 
2.34.1


