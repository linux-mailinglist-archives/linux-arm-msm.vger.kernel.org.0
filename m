Return-Path: <linux-arm-msm+bounces-72754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E509B4FA90
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 14:20:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7384344455
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 12:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C5D322C6B;
	Tue,  9 Sep 2025 12:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GsMI1YeW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84A631C56D
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 12:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757420422; cv=none; b=iHutQiamcKU3FC2xpCxETM5qN5YcX5SO+ix7XQvRWx5zHxI7Uy/yTJ9u8+QM4glWFGUW7lymSO7UthBUxPQZY75+15/+uUjnXiPZ+m12eEBQD4d11R+bzjKDD/7XMB91wu7kQerWXAWrV5JAcVcAQCoXkdyzgnxrBXG9w1m2PGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757420422; c=relaxed/simple;
	bh=vmg0oYOxevk5nWCek+pJEZ1daibBK7o4kDXZ315AyTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dCD7Li0xE34Ve0mm/W8MFaIXrZJmhuzIHgT0uHHKYKW1FUZ6EHb2QkHdetnUb+GlYUlpgdzpJQsxbhUt15gdJH2KAoC7u461BQZ46T1T2z+HGbPlqyaIq/sZcH8iYkdpML1mdnS+c2VfWZHeW0blCLg4LjS9gav0HW711W83ASU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GsMI1YeW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LS19031513
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 12:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qv++HabcA9y
	4aEMaW0PNus8L2anA3PVptVFL6UgEzvw=; b=GsMI1YeWCpjDMjfMazHAqet5DzD
	sVM987n0ADM805jh+AE9gZt1ky+LlFmkObQVMvgFZCUSCe5tzDxerjwMMBzMvwBk
	fuBXhuRzYrcDbfYIlfty9GrJrp6Hpw2ncniYAZh6Wg3Jdysw9NuJSTeobbJPq+0y
	byrq+oRria7UsrmaTeB9nAVAqngTlWEtrpr9g24QBZWKR2NS/Eik2EwFx3BsE+25
	2+NDtxBo/80mNhw4yaMsdJ5zAY3RFEaSp5IWZA1dkrJCP80SeFjRXduOD/TIhSV2
	JqpB8BJdP5/nGUr7QZqxSRwbTv+Ysj29Zuo2xqdB8ouWEDqINB3BRlFVlrg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bws890m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 12:20:20 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-72108a28f05so219379776d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 05:20:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757420419; x=1758025219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qv++HabcA9y4aEMaW0PNus8L2anA3PVptVFL6UgEzvw=;
        b=YsPQN2gwM69tFSVp7bqy7G9mdbkIb3cwnu92Gp4px9iM8jq+hFqpd0gWtpDLRf8Mhx
         c9Auu0chJzRaL9VniAG2FCwP5uSC/50BUzBZ2qR+FqNeutSpg+NdYlOU/KW4fe+CVXTH
         eLxwaZxgCKhl4ahi9fkJ2NYG3iKpZ7rr19yUfNG2DSOlIWTEB5YCLoLZjbDyrH8FaCqk
         TO+pd1bEWjI8RLAxQ5i5rtMcCPTH0gb1+0xVwB/+gt6yH4e5Jj5zElotoYZ8JtrQC/ue
         XKrPbg5K9v6UGVWuuey10jEW8RPtByPb/uTwVKECOAQyXUygoZYy8lgVnb6GK1Sw/sLK
         c/RQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNBXf61QT4bFacZvUbCvbUMIYYwWi2fVTRjyJzmUfbZRNvDC9iKA8RqxuJ/W/i4eFZTvAgAaP+PAS2p8gN@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5L1ocFD0aTNMVM7AIv+ueOU0ze9oBt5LExjZh2daagZWhnrvK
	H/kj3PYDYS0rnNJqUrBGmyQB9HoU1BLM4c79c/TO+M8NEBBGuWw+P2hk9aFDcxBf3wjq20SiTKt
	ukFWUPpwuV/nZ7eECBQjXP8iwHaPYyXax62fPeB4mvB8pytJY8qAEFfnMOx8mRdnkaliJ
X-Gm-Gg: ASbGncuStiUDgHz0Z4DlLE9G0ZC3Gf0SA3/xiMCsa3RqWPtsKVsGpVKCR9CQfWzyaZ2
	42LNas5yMUHM67mywFo0Px8tCRvpE7pHYBa149pkcxEHqEERMPca1dGvsYZnvOWs81p5rmRULEp
	32JuTNYz0VX39dPCsdMSdUmyxXsAWjhSWDJEUGnoQYLFUPoygTBggOUarTOazPS0Loum+5sIfGI
	Jr3ze77c93sUk5m3wXWFBbFlCDI4hJxu4nwSgNdee8kf9kL8JqNJKBKFrJD4UsljLdWkMLaTnRJ
	q5qIK4OpWX/+vO3T2KzCpcEl6cyTSW2sJKBilwA3gYkNhceWmY/Whw==
X-Received: by 2002:a05:6214:c4b:b0:72a:c6e:c716 with SMTP id 6a1803df08f44-7393ca97abcmr130511826d6.31.1757420418649;
        Tue, 09 Sep 2025 05:20:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjdb+VN3e5HFiDLcN4GJoLNoIuWhH6jlimmrGYroWFErjQGM2HSwWtl3GgLtlVDVdSH+RylA==
X-Received: by 2002:a05:6214:c4b:b0:72a:c6e:c716 with SMTP id 6a1803df08f44-7393ca97abcmr130511316d6.31.1757420418043;
        Tue, 09 Sep 2025 05:20:18 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75224db20sm2414629f8f.60.2025.09.09.05.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:20:17 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v5 01/13] ASoC: codecs: wcd937x: set the comp soundwire port correctly
Date: Tue,  9 Sep 2025 13:19:42 +0100
Message-ID: <20250909121954.225833-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250909121954.225833-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250909121954.225833-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Q9BrW-6dRLSo1jWvKBzOZOKuDBxp2bwg
X-Proofpoint-GUID: Q9BrW-6dRLSo1jWvKBzOZOKuDBxp2bwg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX69HlTywDX9Lq
 bpk2b7ErS110+JsMss1iW7etK7dVfgsEuWs6NjDmAybXqA0YCDTi+RCkxqq3G8pVLhqludJJwSh
 3Lay0Ejv4U3h5oJmOQK397J9ho2+R6VNK8vsimCOauE2Varjp+mnIuJ7c0F79KSeNDxYlMcJrRx
 f29pxSdJ0KINA1foCWAkeYHwV+OzF9712VnSZ1eoo0liISmFNP2Oq4OXxIuxFXFivDqbCAs1DZq
 ZYtsX2YzLTGPG2CsRInRT/jSWFpPO3Pa7RzNnMnb8TyN1VM1na49IqdBzNROap+XAq0ZSphjRKv
 y3aOhNAtPqJ6V73nTHw4Kfr1RdoTvgN0gXvOZh6mUnO6euoh52fi0O5vxrGO3tFKl1XDwIi32yR
 ughH/39f
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c01b84 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0i9YUgi2cL8IzqKwLzsA:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

For some reason we endup with setting soundwire port for
HPHL_COMP and HPHR_COMP as zero, this can potentially result
in a memory corruption due to accessing and setting -1 th element of
port_map array.

Fixes: 82be8c62a38c ("ASoC: codecs: wcd937x: add basic controls")
Cc: <Stable@vger.kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wcd937x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index 3b0a8cc314e0..de2dff3c56d3 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -2046,9 +2046,9 @@ static const struct snd_kcontrol_new wcd937x_snd_controls[] = {
 	SOC_ENUM_EXT("RX HPH Mode", rx_hph_mode_mux_enum,
 		     wcd937x_rx_hph_mode_get, wcd937x_rx_hph_mode_put),
 
-	SOC_SINGLE_EXT("HPHL_COMP Switch", SND_SOC_NOPM, 0, 1, 0,
+	SOC_SINGLE_EXT("HPHL_COMP Switch", WCD937X_COMP_L, 0, 1, 0,
 		       wcd937x_get_compander, wcd937x_set_compander),
-	SOC_SINGLE_EXT("HPHR_COMP Switch", SND_SOC_NOPM, 1, 1, 0,
+	SOC_SINGLE_EXT("HPHR_COMP Switch", WCD937X_COMP_R, 1, 1, 0,
 		       wcd937x_get_compander, wcd937x_set_compander),
 
 	SOC_SINGLE_TLV("HPHL Volume", WCD937X_HPH_L_EN, 0, 20, 1, line_gain),
-- 
2.50.0


