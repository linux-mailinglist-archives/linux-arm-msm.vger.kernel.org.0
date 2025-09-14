Return-Path: <linux-arm-msm+bounces-73423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C68B56929
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Sep 2025 15:16:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D40141630A7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Sep 2025 13:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3CFE19F130;
	Sun, 14 Sep 2025 13:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PX3oYHsu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B312C9D
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Sep 2025 13:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757855778; cv=none; b=fflkwAJhYwdJBKIKIKWagjLLu5w8rjPoJywoZM3WNlGFtH6E/rodo2i0pqCNancJ5gPMmShE6hewFR4C/s5dmseUfI4aa5jaAaAyg4L+9LpUg7z+ra8V+AI7h/OkpousA89s/jLSeXZGMJxM4YEPvD7THM/D0Gt5eeIpkvSWwio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757855778; c=relaxed/simple;
	bh=ASTRe5VOEhSFShtU7AUd8KiTkDSRQRHKvy7Cf4rPWBE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nIxPV2sqEEdKaWtO0EoiUZ8AfjISedrFZkp0NAwhV4m0clPjXbvx4puvmzTxwhWtoC0n8ZX+xSqiU6nPL7MIYEDjto4iTUHo14RvM+XEcQuPp5/ZfA9KebILDhbOkw2jsK37E7LD1y/Ri1M5C4fueUdvjlAzQuPNkqywdjNCMKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PX3oYHsu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58EAx02X013417
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Sep 2025 13:16:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=cFsUhwbH3X0sd7hf9crCeGPj7gKsS7ptnZR
	waiXgaJw=; b=PX3oYHsu8T4Z6xb2oqG3grWhQA4zLO3eQsKhLHqogZoHw5RWlT4
	KI/zzo2H2Y/Tk7uZzv8lOiB2LutOJtU1MMXT0qQL5RmPPwa37zyVbCGPxRtFPJGT
	kBqv8fXlaUPKluNVTQl4bWRUs7A9d3zI0WoAtTlZw1GZy4zR5tsJliT0LEMxaZIw
	d8y0V5VyzbS3kSQk8jl4It+PywezVjrXyU5Wceyb47YYSp5nOKovHG6B8dnx60Tf
	FlKo8YNBA/xUEk/jkKTrLComVq9SV2rFj8cPsvu+nUCTNF+iptPXszMeWSy+ai4l
	43YJ5uTRBYrtW0h3cRMT9rTYOdS7NcWFjPA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951cha72b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Sep 2025 13:16:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-244581953b8so38464765ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Sep 2025 06:16:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757855775; x=1758460575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cFsUhwbH3X0sd7hf9crCeGPj7gKsS7ptnZRwaiXgaJw=;
        b=leD7mDjfXYXbwJk45d0tb4ROhWB8+c92B7x8EW+9nVBMjBydeIfKHQ1+IM/SrsCJyl
         5j5VygkMXieHFFXSZRz+Hao28DCzX+dkK4uddM6ZyqJ1tl2OFxHgPLOQQiqBX5qrJvPQ
         1+rAKrMLD2EqFkFMPOZ/KzATYInq2dYDvQljWJtkBD5jMd2ZYyfrVd78OvPCz/Ziwn7l
         uWOVIkoXgD3y2CHnGYxy9V0IOdgsnXFNX/VFBvhVpQxXQrQi6OIg/2QUJV3nnOuP2RWE
         HDNN/eTiwKxjQQw/s2wh/K/UGeAXSptxVcyuulLUvrEORAFFpwuxpHRyiDnsK+cZx/lL
         Y4QA==
X-Forwarded-Encrypted: i=1; AJvYcCXBU4XvtWj5bPyzBrxX++/oYx2MUSz4TBZjojrSgjOxv4jSRq4SXC2ZwCx+q5jFEThkTCtFj+eXdTFWIcXq@vger.kernel.org
X-Gm-Message-State: AOJu0YwycCBBx8yDtSgFt6wTTfw8Lww86KfzRDAJeMgWulBGt8KWtM9Z
	fqv0dLVjbBpHt0k++qitgxvrG5bANLL/8VVUTkGCdfkxdFLIRbzIzTDFrhQLVSsAU32KOgBpZZw
	qCyRgBmns7wGd5z1VwhDgFHY9kheBowxk+MtyCvsSgss2sG4/ka9t9KGNHdjB3unRvRYG
X-Gm-Gg: ASbGncuvFkPJm73Sgu5EQcDPc2lAdOsedJ2zEenzmqFuxo5LMuNovEp4VJPmyFe7Je+
	bDqvA0LKPAQNtyAKyzGFfyVN1Z0MVT9UeMT4vn9IrYz5CINbo6Y64IA7XPXo0xbqrfuC64cixou
	EZm6TyP0kMo53u5ep6AoBgVM2HyElY5WBWMbpXH6eQCJQJ+Uz0TngN6fD/XYWfrNMfeU0F+bo76
	mHGbzZsnobwNKd23o7hiFRWvU+TtKrbz0eYBqM61DiyEOGGDYMqh9Fmf9S9UuDcWsvhx3w3PJSZ
	50WFuSHSQJbTe05EpP57Clc3l9oonvEcVYNWJCzovvAl8xsMVwovbvM6y19BEzHKAUFypEVKusp
	B
X-Received: by 2002:a17:902:d4c6:b0:25c:4902:7c0 with SMTP id d9443c01a7336-25d23d1bb3bmr118454025ad.3.1757855775135;
        Sun, 14 Sep 2025 06:16:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJuy1SPEO/XjEKKhYEvmFIgN+JNIp7NY0Hu7kXU50Dz/94OCkRLrYzCtcat0KvAIgfcL9GgA==
X-Received: by 2002:a17:902:d4c6:b0:25c:4902:7c0 with SMTP id d9443c01a7336-25d23d1bb3bmr118453725ad.3.1757855774712;
        Sun, 14 Sep 2025 06:16:14 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3ad33ff0sm97871205ad.115.2025.09.14.06.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 06:16:14 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com,
        stable@vger.kernel.org
Subject: [PATCH v1] ASoC: qcom: sc8280xp: Fix sound card driver name match data for QCS8275
Date: Sun, 14 Sep 2025 18:45:49 +0530
Message-Id: <20250914131549.1198740-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eeo9f6EH c=1 sm=1 tr=0 ts=68c6c020 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=687F3S6WDAOtLpWcfGQA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: lo2UCqJHTVo8ugPPqGP5WX7JncKPQ-Wb
X-Proofpoint-GUID: lo2UCqJHTVo8ugPPqGP5WX7JncKPQ-Wb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzNiBTYWx0ZWRfXxjO6bLok5Txs
 yDdzWqOdwYS2yG8DmF9RyJ1RunD4Fk83EOj2jisS7uOCV0QIf0LU/jb7sd+KNpAC1QP5CNOEJzJ
 7L4hVpeHlvb68LquA4/VdaH2ImoXwP/DVJomUcCVTf8XMZa4xYJsrypHpM9EtYMgyeUGAtut/LV
 LPL1I8++T8CV6cXOoag5o3ON/pd+ro+KhujjJQN/6t4eqJCVrxK9BYM6QMKAOIY5Ru86sERk1pr
 30pYurelGqi/YwU9WHJHg4TapDdUagKHFyTKziEGF1eOE5EZCLeLelEf7CiMOOKNICCt1Q/uRsS
 6pZ92RgkMm724f5WmcjIwY23Pm/pzT+mnfEaHNqZSvPdZgzmhMdW44BUXK34my28c51HLMcgKIk
 Qxv2jPIX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130036

The QCS8275 board is based on Qualcomm's QCS8300 SoC family, and all
supported firmware files are located in the qcs8300 directory. The
sound topology and ALSA UCM configuration files have also been migrated
from the qcs8275 directory to the actual SoC qcs8300 directory in
linux-firmware. With the current setup, the sound topology fails
to load, resulting in sound card registration failure.

This patch updates the driver match data to use the correct driver name
qcs8300 for the qcs8275-sndcard, ensuring that the sound card driver
correctly loads the sound topology and ALSA UCM configuration files
from the qcs8300 directory.

Fixes: 34d340d48e595 ("ASoC: qcom: sc8280xp: Add support for QCS8275")
Cc: stable@vger.kernel.org
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 73f9f82c4e25..db48168b7d3f 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -186,7 +186,7 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
 static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{.compatible = "qcom,qcm6490-idp-sndcard", "qcm6490"},
 	{.compatible = "qcom,qcs6490-rb3gen2-sndcard", "qcs6490"},
-	{.compatible = "qcom,qcs8275-sndcard", "qcs8275"},
+	{.compatible = "qcom,qcs8275-sndcard", "qcs8300"},
 	{.compatible = "qcom,qcs9075-sndcard", "qcs9075"},
 	{.compatible = "qcom,qcs9100-sndcard", "qcs9100"},
 	{.compatible = "qcom,sc8280xp-sndcard", "sc8280xp"},
-- 
2.34.1


