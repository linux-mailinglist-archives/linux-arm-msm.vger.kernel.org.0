Return-Path: <linux-arm-msm+bounces-78530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC945C0074D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 12:26:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85FC03A4043
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517F930BBBD;
	Thu, 23 Oct 2025 10:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bHD3C6ag"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297CB30B50A
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215163; cv=none; b=tV5vNfMIZOwdnOQTGBKZqhGf9qlDYibpaahy2DgUnWpswQmh4zSkVncvIWYnymmEUPr5MJXys/q/PoMx3BYq9UzQO2ZVvP1wJy8E/8O+ljND7/cnK3PKbaeHraEHT/pVZivox94mZ5ZTLPq2+COl3eX0e4KOI03jZwGXZqW6sHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215163; c=relaxed/simple;
	bh=+pEzU2CaP92P+tjHZGLYMYsO+p/lLdluRH2vfoyibvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HA+l7k9RC6HEB6RaaEXQax4VaTntI3BK/CzJV7mkIqAx5uE94eSYzqDWxAPS7KZy4s1/Iha/ynxMxm5SMyZFtu1mOm7ZlTjqDGXfE2qe05fzEuHrvAtGNZOiwfnsCoUj4XkSlS00m+en3IQeifZTxm3A4rFLfAXo+LMXAHmgPfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bHD3C6ag; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N84wtL021340
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hugy+iqvLUJ
	2cjxOk55z+UZwKkAMqHXBccnGqDcDbTE=; b=bHD3C6agXJdHa6WOJPjq+k2cj2e
	Efmk65n6JaL9JQox4iXtAsYb3tUz5HRd2dNh03JvSMyQtls+BNIfRxZvW4HZAJRN
	R/FJ1hCidjA/3meuFLicg/UNMQ7U9Hl3/IAndNM5JK3dzuRD1j72gruOQv35jdmu
	OuhMW7b3Qrc1CjZIIj4YzBEyseY7jF12jWxMzgjlqUafKIFybYBXHImFYPxZGQIV
	y8IuxH5luwGauiSOSHgMs7FaHx1Qa/aoLVJo/igQJXK8wrT775Rh+9qYj8uK0nEK
	0rbJlfPmxx/QSNrZAMeuf/9hUSQqtBJpVarEDIJtLDgCr2LFJpCfLwAJI+g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y67qhywg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e8a13eedecso18074101cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 03:26:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215159; x=1761819959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hugy+iqvLUJ2cjxOk55z+UZwKkAMqHXBccnGqDcDbTE=;
        b=RxoRImRzBGc6jeMVo3vt6Vq89fwEUgIOHZVyPoGmHIFlCSIevWRmLnUtSZQOdZES0I
         fPyIzD8hxLP4SJE/0McrVc7Gff8zSK/0wBrLpwqAT2gNDoGFPJvD8NcIKGUgJaspKc8K
         1/gqDXxv7wgvhVrzpmJhg0qSYAOWNgwDW6KT+swhcIw+AnouaikFu6HO5St67vSh/1wK
         AWMrJVOWjLZhlM/JoAMDOkWvpB59gg9eDqd6oqW6CnuuSbj/ymNRUlU5cuPbsU0gO+ii
         Av5E27N3MsoP4f/4pvJVSYpxszDhOol6nY46liSuD7MRzwaxk2PylsE05d14efTcSEtO
         9QoA==
X-Forwarded-Encrypted: i=1; AJvYcCWxCSvY3iGOQFn83Jiitf3rFddw7Py6iVJJzSN0Th481RoKcbgiWUTeT5iSbT8bw35JmRNWvUxHbEtmLiHL@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1KO/Tc92LpZfioKmnzVPWeoy+b97JqE6VDOI+7jswHLzcvTTE
	SKahymuiRw7vDwVTy4rYsEWgGe2oNjl163i/FmpAq0i0eiY2XpHKkyfmQaQPat+aE3s6ZBGJ+Vo
	wWEntE5BQcNzXBasTc0r5u3s4NeaUpJcY1HPduLCtWaWqjvr4cTu3NYenSxwsR1EfiLq+
X-Gm-Gg: ASbGncuVsCJVDEj7yy42Nn/lIRm2QbilA8VoYhU4Z7gRJXsAjVc5tLYPJzIt5A8K2OR
	M5UScsfh7DUnN+rgprynTprbe1Z9KV/uMgjWtWopPPdpbNbChUMCj059+czvsoeOdEg+n/OqWYi
	F4EyliN0CTYTn7c6wU6Ijk0d/jGPslNSZYjknI7Hnte+qZZVT12u91R9nmxQ7uceu/4T+plK98l
	fYEWBqvl7QE5vSDPC0gH5vGiWhNgzpycV24iNRg0ol2u051nXDJYeyxPLRjvPFv0LUMwbnxF1ev
	gGKElgH8LLFTdSQzKBkibQwX9FFnFOQhyZ1BbkXIwpJjCWbIV/zHRRQQ1mTHvhZbWd46k1pH8b0
	l1xXBFXs11wjb
X-Received: by 2002:a05:622a:d:b0:4e8:b669:990 with SMTP id d75a77b69052e-4e8b6690c9emr204361701cf.22.1761215158914;
        Thu, 23 Oct 2025 03:25:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbFZ/aAh022rvOoagwONZHMEh0MEWdYvgy0BQ8CSY0tqtrarJPhK0oSiMEE6Ys8biKzppMkQ==
X-Received: by 2002:a05:622a:d:b0:4e8:b669:990 with SMTP id d75a77b69052e-4e8b6690c9emr204361541cf.22.1761215158490;
        Thu, 23 Oct 2025 03:25:58 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm92220685e9.3.2025.10.23.03.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:25:58 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2 03/20] ASoC: qcom: qdsp6: q6asm-dai: set 10 ms period and buffer alignment.
Date: Thu, 23 Oct 2025 11:24:27 +0100
Message-ID: <20251023102444.88158-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023102444.88158-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251023102444.88158-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2OCBTYWx0ZWRfX0ZQem3GgpX1+
 Im2W6sXO/MTG+JUwLEwCDmXJYrLzjYrJK7ExqVkV91vOulYzq46Dq83EPpMx0HsgUZINx1MLTo7
 5rvKA8l+Sr1NytHaiOVHO8tdvtFtf6syiQPpnntSIEiG5tZUKLkEExLLYw1Sy2kqD6kxZo0+zki
 J/grvyWdn5voTnCf5mnOR1gEY5eIk5jHhzAcZdu0Y/EE3+Ywf9ijAEcT1OvWf3A9+S0LWqeIu8i
 o9f+uAf6rXLHORo2uP7AM0dCe7WMFMqjx2jCtsgD2LYlXDZY1/OyraP4bkFUjDIaX5QlS486cgg
 FDLpyPCIgg2fUJsDZUrT6fO/zGh0gGrD04HWIa5sSjg3++WPekIiQh4EdfHOQn/I7hovtRntwI4
 j03x7PlnuVNFK8nrKe4oLmGTMZ4gRA==
X-Authority-Analysis: v=2.4 cv=LMRrgZW9 c=1 sm=1 tr=0 ts=68fa02b8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=Ubk33e6zxpvlPXQfVdEA:9 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: qmHfjvjcAhaAXDJCu3E66Rc0gw1EoDsX
X-Proofpoint-ORIG-GUID: qmHfjvjcAhaAXDJCu3E66Rc0gw1EoDsX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220168

DSP expects the periods to be aligned to fragment sizes, currently
setting up to hw constriants on periods bytes is not going to work
correctly as we can endup with periods sizes aligned to 32 bytes however
not aligned to fragment size.

Update the constriants to use fragment size, and also set at step of
10ms for period size to accommodate DSP requirements of 10ms latency.

Fixes: 2a9e92d371db ("ASoC: qdsp6: q6asm: Add q6asm dai driver")
Cc: <Stable@vger.kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Alexey Klimov <alexey.klimov@linaro.org> # RB5, RB3
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index b616ce316d2f..e8129510a734 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -403,13 +403,13 @@ static int q6asm_dai_open(struct snd_soc_component *component,
 	}
 
 	ret = snd_pcm_hw_constraint_step(runtime, 0,
-		SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 32);
+		SNDRV_PCM_HW_PARAM_PERIOD_SIZE, 480);
 	if (ret < 0) {
 		dev_err(dev, "constraint for period bytes step ret = %d\n",
 								ret);
 	}
 	ret = snd_pcm_hw_constraint_step(runtime, 0,
-		SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 32);
+		SNDRV_PCM_HW_PARAM_BUFFER_SIZE, 480);
 	if (ret < 0) {
 		dev_err(dev, "constraint for buffer bytes step ret = %d\n",
 								ret);
-- 
2.51.0


