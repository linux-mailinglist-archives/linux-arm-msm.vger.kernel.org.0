Return-Path: <linux-arm-msm+bounces-84922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B29BFCB3CC2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 19:59:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6804D3061A43
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 18:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D161832938B;
	Wed, 10 Dec 2025 18:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cNLajhpQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KTHq8e63"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261D72FFFB6
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 18:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765393152; cv=none; b=VwJr7Dph1m8sIzjoLommWR2lRX7TxIO5rfj/CiTQQ5BgUJfBMPLoFN77Wifw2bxr2pday8vgpRZcTKzfsIPrmHHk2Qagw8s8m/gQguHE86XbedTn96/NwEnaQxSe38P7DHVv0tPcqN7SwNiHyq/FZkx2ijxqQAlgWnL1E9mYQ3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765393152; c=relaxed/simple;
	bh=LM5cLcvrL97GVflWOVSbpoD+zNNmsN4BqP7GlTU2puY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ikZ2tgJw6g7QebaSWi329Od7FsIkzBKWJlbbkSsdcXEHaImm9js9EYGxI9bjOAueSK2AQIkaElX1O8/E4WrZOuwlkCYddZCGy9ujR0iSAl9Rh6LuMNgMzY80l+KAewyAfxnE4+dcsGKcguoCkXhxbop/S+YnHQB/1htGN92BxGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cNLajhpQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KTHq8e63; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BAIRSDP3192552
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 18:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	15Q9ck6ovkYMJTPJoDc2Dx9iK+2vuB4WM6abfMTFsKQ=; b=cNLajhpQxYwx8IGy
	3VUuW2sqT6bFN0+n8VQpgG2Q9Aj/K7M/oIuCXaYFmAszSgtdUSGwOW9BEasPwq5C
	UBz1xkvcGtNuuAncLE+4zRttUzpiJcAmxo3A6A09ho/tS1NVebMvTlAxHran/e0p
	vHakOFPm7Wy6TncTFTxZfnvDQE34jiuPSa5pi/GvZaRqOGzAMvnsKoq1WwRLopAi
	iYAjCQJldsuRcJafpUhVPLoLvO1j8Eq8YLsx+Up3y18609K4Ev6Er+Z/YRO0O4bY
	zIA+dBfDL+T2EnTLeGJgjfYoVX6YlEx2Ngc9xuTtAYza9uF6caeYV2QA+FKhMg/k
	5AOypQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay505j5gf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 18:59:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297ea27c814so369125ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 10:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765393149; x=1765997949; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=15Q9ck6ovkYMJTPJoDc2Dx9iK+2vuB4WM6abfMTFsKQ=;
        b=KTHq8e63ygjvB/Cd4tROymN4ZLz2CpRe86Qk6QQjEL8qOTe5ou7bpka7UIOkBEKrLc
         ORYWKV8+c7wH8QTvngEGlKutNUR0hvGXco6VSqyBZKTJ2XJ8almTCNgWXZBOveD1RJae
         VtsVWFEpSMOjZ3XKjrgfnVbEWZvauuvDfOps/WZuZOcqPqMhVe/l/JgUdUdmKlc7UkpZ
         zB6m5tqD4ER5usEPUpdoAZtBfLFPOs4B6x7RxGXIPTYipdy+dM4aKPDEP9EFXax4sGb3
         iqqerutiwMzK/IO1gioUQx2hdNpzrtJUpkEPNPMw3v9icwHe+TaPMH3+O2r+GmnUxpMy
         AQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765393149; x=1765997949;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=15Q9ck6ovkYMJTPJoDc2Dx9iK+2vuB4WM6abfMTFsKQ=;
        b=PJby98xFJO7MUMEfDLbORvVulkQlRxWu7UqXZOP1zlGkjhKKwFk/xklzMR2BXGV9UI
         pWSsB7BYH+bifjAhsICH5QtLfBIu1Z43/ZE5BCjoa55QmfQXQkLKtOebB0LfY6mzpVol
         oourhsvNVrsWW5xt3WddCpdM2AEkNfWgMghoi+hdKZXXjhqF08s/mgfXPHntqokM83Jw
         ShqCuWfcKx8gNd56NFTlVtL0poZtwwvuA7vsHUVAChdNeB2WiaPNxDZ+1WfcJERDODfH
         RjdFhmXbhWuNt8No6BJijPb0poYmf+Evbd1c4PRD00aQJEZOuVIagaJuLpyYRetmo3sy
         5oeg==
X-Forwarded-Encrypted: i=1; AJvYcCV3WzOjx9XInQsSNafhCni9mvT3hTQSa/za3py8VLIY9Qop491pI/A87VDgSUXGs4BHojHo1528l2nZyNvE@vger.kernel.org
X-Gm-Message-State: AOJu0YxQuL5M8FlhzCIS350Y37nZh/cSyg2XXXG3nNL9h+S2mHmbCWTp
	Y4uvQq2OQVI4y8R+Zcuw+PJ71Bo7wZGBMqQLvoPpO+yrDo6aN1jcV5c1y0wTj6p+9/H3SLJdoMH
	20XTESz5Onzl0+F1HR3bbNnJ8nsD8z8zjSimyIz9sX1+T5+ecCsiKe0bv1Cze7iUOZKGh
X-Gm-Gg: ASbGncvG85Y210HvwSS8BfqvNpcFKSdbKyS7LV8ccqF6y94Ml98N9zsEVnfPDKkhFqG
	SnsA2LwM0M8QwR5ZCiOem4gWVEdxhrRnVw1LgheM3YiNaHgiA4e+008ZV9DRFrIEHJ6FJoelKJp
	3AENDlJUEQO337vNe8fF1nh/lAn06TxoqxKXSr2yfBtLZi9jU3npjh7vVTuGWJqFeZ3mOiQQT11
	8R6KW1RT/wGemDJZAxxgnvqmY5Z/OhME07IKB4XqyZs8L+VP2t580tDzegT5H0iX6UnokBQkqL2
	jTCNYBOMkC5IGiPFzLW5oAn2ueveXMmroyXZkvSrPAbBaeWtKS8Gx94okamGSk3LIEI3IRQuBqB
	LGpk6sk62dtBeV0ZRbqClwIIa2s8MWUETdss8ZpaugIX7H4w+BbEU7oCQSZ6FqdCIjLWSHg==
X-Received: by 2002:a05:7022:3847:b0:119:e56a:4fff with SMTP id a92af1059eb24-11f296c903fmr1367464c88.4.1765393149455;
        Wed, 10 Dec 2025 10:59:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmm7TOqb5Wsr9vjMnsG/AxVUxUEuqG+eQa6sUBm/Oe4q0VNYvOhbHKhM0y1KW6fNblIaPANQ==
X-Received: by 2002:a05:7022:3847:b0:119:e56a:4fff with SMTP id a92af1059eb24-11f296c903fmr1367455c88.4.1765393148912;
        Wed, 10 Dec 2025 10:59:08 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e1bb45csm778008c88.1.2025.12.10.10.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 10:59:08 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 10:59:04 -0800
Subject: [PATCH v10 1/5] media: uapi: videodev2: Add support for AV1
 stateful decoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251210-av1d_stateful_v3-v10-1-cf4379a3dcff@oss.qualcomm.com>
References: <20251210-av1d_stateful_v3-v10-0-cf4379a3dcff@oss.qualcomm.com>
In-Reply-To: <20251210-av1d_stateful_v3-v10-0-cf4379a3dcff@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765393147; l=2597;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=LM5cLcvrL97GVflWOVSbpoD+zNNmsN4BqP7GlTU2puY=;
 b=Mc9ERiswvO7xPCDBJYucmt77ZdjvAUaLqQj25sFvp5KoxkrExFdX90DFU0El3qUbLeO+gw4KH
 yaMS62n24d+AUPz6lgcCBs+VUqV/EdIjdfK1OI+rbW8ek8Vy2QqSzdO
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-ORIG-GUID: RCCSi6N9f1lpVYo4tIDcNqm_F35HfZTh
X-Authority-Analysis: v=2.4 cv=Bu2QAIX5 c=1 sm=1 tr=0 ts=6939c2fe cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=QX4gbG5DAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5q8hE9cQKCNJD2usWYQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: RCCSi6N9f1lpVYo4tIDcNqm_F35HfZTh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDE1NSBTYWx0ZWRfX7eesC9mXcI5c
 Fa3O7oqJyfCucm4jeEkM22RwRW/7K41g2WEZrp7sGgO4BLTWm1vgPQESH/f5CL+5gMT6kr7wUd7
 S2S/bVyMspXDzKh10CriH4f2tUjghedwnM5S2q3jFNW2h6gcfC8wQqkHihjsd+FJU/zrHgaMdDB
 Q6UOseH1LwUvZwe8RUEub0SSz8xSyBgdr01QFvy5TMUkepQ41XTdkILtMrrBmIu8pBHVkVEcStk
 f8PZ7+f2llOpQ/u8LeTi+Z8ePXotXlf90EQN/49lAV0+RqegtsszRhZxgoWqw5mAlBkwhiF75pu
 7NKDrOq3JrslumD00k91ejHCgBtHjW1T31SNY5t3cs07CQbjGD4g3t0GPZcmPGzTXKY4/XlY+xf
 G7Hi4Z/N0n27F06HlL+Z+4yffrCdrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_02,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512100155

Introduce a new pixel format, V4L2_PIX_FMT_AV1, to the
Video4Linux2(V4L2) API. This format is intended for AV1
bitstreams in stateful decoding/encoding workflows.
The fourcc code 'AV10' is used to distinguish
this format from the existing V4L2_PIX_FMT_AV1_FRAME,
which is used for stateless AV1 decoder implementation.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 Documentation/userspace-api/media/v4l/pixfmt-compressed.rst | 8 ++++++++
 include/uapi/linux/videodev2.h                              | 1 +
 2 files changed, 9 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
index c7efb0465db6480fe35be8557728c196e0e530f4..235f955d3cd5cfc83b0d3d424e6625b14c07266c 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
@@ -275,6 +275,14 @@ Compressed Formats
         of macroblocks to decode a full corresponding frame to the matching
         capture buffer.
 
+    * .. _V4L2-PIX-FMT-AV1:
+
+      - ``V4L2_PIX_FMT_AV1``
+      - 'AV01'
+      - AV1 compressed video frame. This format is adapted for implementing AV1
+        pipeline. The decoder implements stateful video decoder and expects one
+        temporal unit per buffer in OBU stream format.
+        The encoder generates one Temporal Unit per buffer.
 .. raw:: latex
 
     \normalsize
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index add08188f06890182a5c399a223c1ab0a546cae1..848e86617d5c87d76f15663403c2f3f0e709073b 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -775,6 +775,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
 #define V4L2_PIX_FMT_HEVC_SLICE v4l2_fourcc('S', '2', '6', '5') /* HEVC parsed slices */
 #define V4L2_PIX_FMT_AV1_FRAME v4l2_fourcc('A', 'V', '1', 'F') /* AV1 parsed frame */
+#define V4L2_PIX_FMT_AV1      v4l2_fourcc('A', 'V', '0', '1') /* AV1 */
 #define V4L2_PIX_FMT_SPK      v4l2_fourcc('S', 'P', 'K', '0') /* Sorenson Spark */
 #define V4L2_PIX_FMT_RV30     v4l2_fourcc('R', 'V', '3', '0') /* RealVideo 8 */
 #define V4L2_PIX_FMT_RV40     v4l2_fourcc('R', 'V', '4', '0') /* RealVideo 9 & 10 */

-- 
2.34.1


