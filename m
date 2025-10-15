Return-Path: <linux-arm-msm+bounces-77398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E1107BDEB81
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 15:19:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0F8C750598D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 13:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B756321D3F2;
	Wed, 15 Oct 2025 13:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lVA/PdEc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFB61FF1B4
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 13:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760534294; cv=none; b=OSQMbMNk3P+5r3xyIIdMCa7PD4+x9qHhbRXmmJ04Bsi77HdWCzn+6lgPG5n39tDQSZKiTSvM/2HhwMGK3nXBzyPJmLYn8dqMCUjkJBEMndrL4NcemPbo+uSQ4yMinSCqx19OgONfTMSEBijipqeNWsiHXKQL19aSuhr8zRGATxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760534294; c=relaxed/simple;
	bh=L098FDafS8pm9ObOLw9+1ZKs3tCLohX1/Ibu253xq/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aDv7vxoaJcDGd4S/ujt3CXouclFILWbF5Z7rKZzO858w27+jc17mzpALRx9/iqbsIEhkw2EaodIb3XC7FVNd8YMVkvgxAdS/aYzjIOU4RdrE7yNx9bYqgXTbX2jO6L53PBWtCz8cLwyetkiuMM6kcyFxA68c/SuXGgpFvU+gejc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lVA/PdEc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FArJGW003664
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 13:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nnMgSGQvZWa
	892OSdBf3qcySVN9QLFS9/sViBiMJgyA=; b=lVA/PdEcyNkWadMnx9OhqO4b34k
	jBIKkQ0EmtxqrF02yhgh0lchJncIrev97kamcBArfQlzTTSTa7DyglY4McI+hL9r
	AHRBKdOTnIrGEdMB9q3vznQtJsH/NJmlx3bBfvyrsFu8RV3Wv/6dGZBnN2QbI6ql
	Fsmd6ZNaA3Rt2IRrJn3eqam5CZ/vaad/vQDlurKHBU7KzgYwl+M36qaq04Ek9ZQM
	742QX6cBjfAdtAmAYCDC2dTAr4zwH/Tl7bAk2/Q9ibmlBnTFNWO3GoRHIoIkdkmJ
	JUyCIt0VLDmvHkAkZzZmLogQyrJFt951G0r2KyvmmPtc+lYOvMcZt4vbMqA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd94jqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 13:18:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-887c8b564ffso298105285a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 06:18:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760534291; x=1761139091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnMgSGQvZWa892OSdBf3qcySVN9QLFS9/sViBiMJgyA=;
        b=dZqge5hLcIxhScQibng4vIuCgkNQ4eByqGmOD94gR45btqyzfViy+eqVFe/vbsMyAI
         qh7jzMj834KUmK0r6073iHLOOmHgVGIEegK7Iat+ZFybBOs9sBQLkLKSXrgBXkTYtXNr
         H/t2WKTN90WGYPesu1fLtub7fMrZkgcaf8S2a8yyAdqC5T4gQZFiUnkW0HHHEZi7jHyd
         2Dsw9Xr6HvSFGTt5TZfQGeszfsR0Gd6VUZGDFRWE8N7qzau9HXi+WagQ9pgaejMI4Unq
         iO+oJLD+dj+fK+zHiOInlJOv3CbPxvFAh2Ou0thJcvqDCY21ViR5sr56mT/GdRM9vr/A
         KzuA==
X-Forwarded-Encrypted: i=1; AJvYcCUKQJAlHs04fIQTp2QUUsxZ/A8K7rxd42iJjziykje7QiE/rYjdYol+IJ/KioaxTJCCQDbsXVmlondz2qfn@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/qSof8oioS+JkH5QVCVWtRX4rvoNYtHhMjTB/ePDqiBXG7lpZ
	Y6wKBUbzECebU0YME68ngVqQj4jtzJXi6mCph36+EgKNclmU5e730nELL0Vf3Sn3T6lziyOXzpk
	R1EHqUaou1yzDS82Z/NeR1gJ3ddRGL482SUSvos2zVTz1ByTGwecfDxtJghGe54VGYAja
X-Gm-Gg: ASbGnct+Wo5L+S7TeYmv7q24adfc4D2ab8RjAJx1wEPsvJCdPZs95c+tDXRYR6s3PXC
	JiD/PZhYiEdmamFUHJpVR4hHWz9oXeHTVziWN7C5X2sNCLwsdZ1yw8QXpQCj3S+2KFZ7bYFCPZS
	jLNk8OKXoDSNANu7hdD2CjPJHYGNRCL8xakng92c92luw1cQ0pW41ca1OX4NpzwfBiTk3OZjWQ5
	fM9SMpsQ/OqEM50Zg9QXdKWDEmB9f0izqJvg3zRrwENa55bTuqI4jZFalaV+3kZPyjKuBVdWbBD
	eZsB+SUDXHifrRy0a9gSdcBHNHK2DhHWalsOMFGU+0u4ZxoO+RUBcw==
X-Received: by 2002:ac8:7e89:0:b0:4d0:fbd5:4cd7 with SMTP id d75a77b69052e-4e890df9b42mr974701cf.16.1760534290510;
        Wed, 15 Oct 2025 06:18:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQPK/8F9/L9WtmiMGFpf77cZuz+9kWatOyQjFPz0hd1jWTnhTVvG4UfIIpB1jflL+E3HXJNw==
X-Received: by 2002:ac8:7e89:0:b0:4d0:fbd5:4cd7 with SMTP id d75a77b69052e-4e890df9b42mr974021cf.16.1760534289820;
        Wed, 15 Oct 2025 06:18:09 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fc155143fsm262081245e9.11.2025.10.15.06.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 06:18:09 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, m.facchin@arduino.cc,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH 3/9] ASoC: qcom: qdsp6: q6asm-dai: set 10 ms period and buffer alignment.
Date: Wed, 15 Oct 2025 14:17:33 +0100
Message-ID: <20251015131740.340258-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 24JvLsqKB3CpPJe1dwPhTxhsvPrkZ7is
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX5ohMJvSmy+7u
 Li0tbSUqXmmIXPgtyQ9tNcpFrHGTPW775MXdV+PtEROKdJib6hJYnMN86gfluVoatKyNef5yvEN
 p/LJj2ZWODzeBbYheTgRrhyEyWNssuyNtR0QKJBTr9eVFA4GO831AvZEpqzidYOtfbtomMQYYrX
 A61YDCFGax646hWaSErjS7IvzYgbZsMyCNtMvY4OqD9dMfkujMPoBLRI2fyi+C8FwRNNWLlPf3z
 FAb+IA7HeZqqYU5TcYFP8/m5GXM6SHZ6Q2LFmJ4nsYH2hKvIJJ1Nu/f8koNjO4MrxUvmPC6HK4r
 A85cn2imTf9JvGq71p/1c4cqe5Mt9kBnXCMNxjIJhPA6OR7eBF3BhfX+tNqoJKELrTT8EhTbGNU
 iLrktVL6fdqsRfTGrAurFlg/SjVC4Q==
X-Proofpoint-GUID: 24JvLsqKB3CpPJe1dwPhTxhsvPrkZ7is
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68ef9f14 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Ubk33e6zxpvlPXQfVdEA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

DSP expects the periods to be aligned to fragment sizes, currently
setting up to hw constriants on periods bytes is not going to work
correctly as we can endup with periods sizes aligned to 32 bytes however
not aligned to fragment size.

Update the constriants to use fragment size, and also set at step of
10ms for period size to accommodate DSP requirements of 10ms latency.

Fixes: 2a9e92d371db ("ASoC: qdsp6: q6asm: Add q6asm dai driver")
Cc: <Stable@vger.kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
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


