Return-Path: <linux-arm-msm+bounces-70449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F01A4B32155
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 19:15:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 296CA1D62AE0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 17:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64FB0321F4A;
	Fri, 22 Aug 2025 17:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fp3eIFrK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0560322752
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 17:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755882909; cv=none; b=k8FoXlhVkxIUKy8sv+SeDHbZE+/c8eeSgGGMG/pOBv+YEh+11vkiBFjksiKAsJ3h1MQV6Fn/c9ug9Ca4fiMGYoHuBdmmAEbXg+oUaw0bvWm1InIU3SUkNayWChVymXQD1ZUdysPNaQ1iD9bBwywsRn4gcti3dSyhGU+yNpfgl7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755882909; c=relaxed/simple;
	bh=NxFxH1PVJ8Nv0cTYQx5eobKGNaG3ah2F+6A//LoAzKU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HUxlA0aK92ZutNNQujdUQD7ZlrPaeU/lczF2VqZRA8rXg2J+WRrwlPZyi2hrqhiuJweYrbqFTRGliP2LWv30wt2VYvR+Ns17S3pCr0ItXwoV2p5p76RLEXPApDOEnUL1yG17MD/m+wp34DD8dagm7+S+CFZ7aSm5Vwww/AHBawg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fp3eIFrK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MGZY77003755
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 17:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yYwBae6Xgid
	mPtjoDgfyrfegas7X3oCKUAh6mAOW99o=; b=Fp3eIFrKYMmEYLEzLt3RrtD9SuJ
	OYvD5kcLR3fLxIs/kCvsiC1bemUZexVLvW1/jwK8rku4TP7G8PKgY6YEMdpMtSod
	NBfbxawkS4NUjUviTZ6Zi6VL+Q3H9Nxb6cdyx3v8MYaEx/7DJDh1VVfZaesIyXYA
	BK9LsncwgMOftemUruKOOc+ArVNrReASlw4sLZQ548Id9nz1p/vA394NmGeG5SSi
	aODjBpXpE+Gc3CLY5Bn6oOCp1gsghhPRPGtHPKGxH5qhM9hNpfC3Qy9Vp/OH4o+N
	nME5JtgUQ392E6spotrDvwwHcTorKBWY8TJjje/IZtXP9EOKgIjfl4kOHKw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5299xxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 17:15:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-324e318d628so2725107a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:15:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755882905; x=1756487705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yYwBae6XgidmPtjoDgfyrfegas7X3oCKUAh6mAOW99o=;
        b=eDhRUor5X3JgNZQehI/q3lyy1dXY1fVsfaT1MLe/ToyFVsfC9J5AQkD6JnplRjHUqw
         vdxdLee2/+E30bxOFlVXTPJRR9D6smD2ZdALSbU4jDPBe67xLtXvSc7IZnuUDH33TA/W
         t3nhnCnCpC7aFmvpp6hYwAaSQXLbzEryu6EwI7YVt8Ta4AoPPA1xUJkFbmot+s20TGFE
         IVrW4psoLWH4j3N+bQtTjnGFsfUjr8w3XQ4I1q6ENMAaWdotPi0xiVp0FB0/pHmWz7kA
         qvPHZeeCQqMvnbwFYpstJ67vzN6QCOKN6LfvRNPJpsAxKOUBWiKAL7ocMCBhlAZIdru3
         vr5g==
X-Forwarded-Encrypted: i=1; AJvYcCXfsAXrJG9GCct/XfJQO/xemLp42+3NVL/x9nG0KdoUx4HW+2qqxeLqfGdr8opm3xiYu3zZD5vI7ZUzyEMN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/eGpylbI9+slj6D8trrBGaB54KQHqq2Tksw+Y5kjI/YliZC68
	Sqk1U3xYqR/hJunzqMdCRKLt54WNqXah6VgK0LUOih2cpRpQ6+AaBnsTVZxaKxosnRCZNw5Ucsm
	/S6o6idyLGspSii84FcGsj+mg/GvqS4cMcu1PF2vfX2fo3OdZlZ9r4PKGs0isaTAWKsQL
X-Gm-Gg: ASbGnctNaJb1XvoXoH2jp3TQmn7EC0LqYEcdj4qZFXSTXQV4sx7a3UTYQcNoQc6p9h0
	iO9FwfIJRKX0StX2XmVDTXelRzL3eS6itc4PjStAb/6wTZFZRGjtyu/MHnPiFMqcywNp2Z4bR+F
	YeB/GiUvWl1sIPHZ3K2IIkh5O/WmXWD7JNBbgzbDOsyeENzFtJ1GNhbv8pl3LjBJpHM+hlGU67M
	Q6ik/ZGK7s/DMpjWe3UO9i/WAfsuL8sh4/eHl8zKfx4n3GOGGUYori6Nc0Uctdvor9K4yzNukWX
	8EeEOdWkYJuRlFDW/9ILGSnMJE4xN6AiBq9Wz7B0TgTcNku1V4hNpBY+iaoNs4cCkoI74wOvJZ1
	M
X-Received: by 2002:a17:90b:3bcd:b0:31e:ec02:2297 with SMTP id 98e67ed59e1d1-3251744bd07mr5539857a91.19.1755882905402;
        Fri, 22 Aug 2025 10:15:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3iOOqhGrWXgR2JO7VR3W11A0aVF7Bxe/6lQtQ8/h7CuPINehM98MxMjz1rao7k09JmOjHEA==
X-Received: by 2002:a17:90b:3bcd:b0:31e:ec02:2297 with SMTP id 98e67ed59e1d1-3251744bd07mr5539823a91.19.1755882904950;
        Fri, 22 Aug 2025 10:15:04 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49cb8afc56sm309995a12.15.2025.08.22.10.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 10:15:04 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
Subject: [PATCH v1 1/2] ASoC: qcom: audioreach: Fix lpaif_type configuration for the I2S interface
Date: Fri, 22 Aug 2025 22:44:39 +0530
Message-Id: <20250822171440.2040324-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250822171440.2040324-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250822171440.2040324-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Aui3HO9P c=1 sm=1 tr=0 ts=68a8a59a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KhSO6HZblKlzq0T7JtwA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: lKsAI4c_VXcFL99rnklukLQVOYIte32r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX+dLug85Pg4LH
 4T5aC2U4bdlyv1Ysq2e88GEBs51vWQtYVP3BusiR5/ONQnhyQ6Qwdg/fnK9fjfDPKMjvHNv9yvy
 ZdM1FSY42I2bjVkQB9ZkXV1MQ0qbGr1yNhb2GXU27Pj5pneD8hoPAIkKXrVRa08WIVDGFnFNCDa
 tBkyghTDqJz8hokK9hia+Tcv4IJOqK8jv3eTWlq57o6fpZeh9vAV5/nYANuArD5RPZnjxDom+vU
 mqt5kiJQ35QT60eCTTZLlzUw8eFIewNIeqJ8NFRUoluGJWCH6dN3BoV9sZRG40l73wbySADD2ge
 RZVNTJf89+rxo3bwTa8mDfZn8kMchU26hkqrhIh8hw45fuUYGKbyjLtlx6HcDEf43IV67QB+R3D
 y1+3Vsi7VuFfAi5twWtT5WqElw8eEQ==
X-Proofpoint-GUID: lKsAI4c_VXcFL99rnklukLQVOYIte32r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013

Fix missing lpaif_type configuration for the I2S interface.
The proper lpaif interface type required to allow DSP to vote
appropriate clock setting for I2S interface.

Fixes: 25ab80db6b133 ("ASoC: qdsp6: audioreach: add module configuration command helpers")
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index f4c53e84b4dc..6d7b1a4b0b2a 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -995,6 +995,7 @@ static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
 	param_data->param_id = PARAM_ID_I2S_INTF_CFG;
 	param_data->param_size = ic_sz - APM_MODULE_PARAM_DATA_SIZE;
 
+	intf_cfg->cfg.lpaif_type = module->hw_interface_type;
 	intf_cfg->cfg.intf_idx = module->hw_interface_idx;
 	intf_cfg->cfg.sd_line_idx = module->sd_line_idx;
 
-- 
2.34.1


