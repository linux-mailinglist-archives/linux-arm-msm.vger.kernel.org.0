Return-Path: <linux-arm-msm+bounces-77399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B34C0BDEB5D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 15:18:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EB0A935344B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 13:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E691F223DF6;
	Wed, 15 Oct 2025 13:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TfVNaGvx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8283A205AB6
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 13:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760534295; cv=none; b=AwWxnS71N36KRGN8qqwoa2JgW72FZSqRelNncwLFn7jaleDkqKuKcQkGJBghPpnFJb7BA19ue5Bt+KB5IN2ZMMSnoKp4L09Rep+5VLsdaoNBlfo8ETbNE1CVCXTI72RXRho7Ov+YapU3fSJXYBf9S69iA2uxyXTzeaBmMHF0F+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760534295; c=relaxed/simple;
	bh=FciMJV9TB+OlUWS0wBBXljHH3OORGyEACeJ2UfDr5yA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FWgCKUqWwY09zgClhijvN2pWdaCa5Q/QVnHAEUgmafCT84UlrGJNHRVku/eThlameZJArKY+KPbg4V/rZI2NirvE9Dm4/dyEn9Dlt3GAtHiK1gk2T16aei5wWUKwsCicxoribWDNYczn2dnJ2WDtHq/am8pfH5AMj1UeaiNpQV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TfVNaGvx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FAjK81005021
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 13:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qHkE+bKT/J8
	nbQ5S5gGHutvtvukdRZt0lHpKcZkg+54=; b=TfVNaGvxxRSKVcbpPC/Wp1JJJec
	YlsdhhhsEh5aeuH/7/kzZN0kVr9ULIK3W0b3ZuqtLUY+wazTc3YN6YtUTFITAP55
	c5Bl9XBUJ3Mb2xX+E0tj2YKVMAypXQ6+6J6Gaj0Hnzy3I2sFRDJns1D+nWa/h7XQ
	qRUKvF8YMkI3j/eKwidoNIc2ZkhCDdBvuCREBIzUxR3wLafIMmCyuOEOGQEhP/bt
	F+4uxX/hpKRld93fh4EfiNd8coNXHUZci/HtUzLhrGKip02u16sJqrkP5o/yOAxT
	1AN2wy1nfOCFLR6avE8THRn23OvklOjPMwq4T77rzG0Xr1DqTNirboY/2MQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdg4c6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 13:18:12 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-86b8db0e70dso33977746d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 06:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760534291; x=1761139091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qHkE+bKT/J8nbQ5S5gGHutvtvukdRZt0lHpKcZkg+54=;
        b=OVg7hd2VDtRAtE1RsjnbIYvj9dlllPwLDaqgyCjeKATNhVHfRK9ePeJtz70eQ3x2X6
         5K6zaIWc3K2JORfgQf/a/9tAZyMhbfRT3O4Up5Gy/Daghs1F2ur7jidsnKyTTnezN+fr
         9O5D0zw6P51SS53G1ZbvxTeg2ezFoFg9Gm3MpD10/+62WMg9Gn/P9ftlDv9pBE6yB+5I
         f4c2pBZUC8WBjKyyGOC1MegFRFTcKFLyNhcKZNvtMgfybQuu4b9/ewyy4bDMyARyHso7
         PdC2R0rM0Xc4T5P1ycjGOMH+C3+7RLJdesTTivZyMdKKSIz2f3Zw5psgGX0eQbU9uAYk
         IjVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsBkO9ZQ+Qkhu0c9ceEfAJ0OwrsScriL0XxD4vk8+Hy+INcryQZnrGwuQ6fMK9gWMvjxrmhq9X7L73cF7s@vger.kernel.org
X-Gm-Message-State: AOJu0YzE/wcYx+Z3ZxaNeXJpgM6cePbgrK1qOi+pu/oDAjKkgKL/uXgs
	lKWCgVxrTLGLiM/WR2TVQddEIkiiCMqUu/RZ8zjHsjoH0pwYYGnafrnNas3sw43Pk6muuPuKMYZ
	hMzBg+1kOPOJDk0Az0eWlBcuNeDL5g9gZn1UlLXUaUXmuo6+cNRrGb0kuvRrNgtuaOwtU
X-Gm-Gg: ASbGnctT/7lxi8OGbl45wvdvcyxw0gn7e4jU1tNyLkYMQ5UPA7AXSwFOKDX7hRapNmJ
	YdY48E9MKQg1X/5yr1sz7uwoNM+yyhSNoU1TscscUL+9xRx+Ugd6OqAtB7h9LtcuMvoIOYW9k0Z
	bqqsqTWABKinMcz0HM/u5ALmtZXRwVZJ4ApzTptHu/Y8p9YJywfcBixn467A2unClQbm1S4zfM8
	a/n1zBdGfci2gVXEGvAITg5NGTCF5zl84hrVbNvXolJQ7Ufsz7askFAS3BnznCfjBQvMMmfDQT7
	NqrZf4v1GZkyPovt4wdFFYq1nrqpkIThB73FqkzojWekDNHc1eXbUA==
X-Received: by 2002:ac8:5a45:0:b0:4e6:eaa9:8a2a with SMTP id d75a77b69052e-4e890defe64mr794901cf.15.1760534291282;
        Wed, 15 Oct 2025 06:18:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYMWisWH0+ZGB14jA4jsreCXonf5bTEm2tvxmjYdPJwPg9hoSqnxhGbMTLY6h3qG2Avbm8MQ==
X-Received: by 2002:ac8:5a45:0:b0:4e6:eaa9:8a2a with SMTP id d75a77b69052e-4e890defe64mr794491cf.15.1760534290799;
        Wed, 15 Oct 2025 06:18:10 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fc155143fsm262081245e9.11.2025.10.15.06.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 06:18:10 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, m.facchin@arduino.cc,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH 4/9] ASoC: qcom: q6asm-dai: perform correct state check before closing
Date: Wed, 15 Oct 2025 14:17:34 +0100
Message-ID: <20251015131740.340258-5-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfXxw0v+mGaTdPc
 BpcKlae6V2TDFlOs+0N57Q32Tc6uFJOzAtvvAKKQvdrVm+lgqpYASGybAbZ4xC/wjPRgG3y7N+I
 gPcJ9fB3dCgKk7R39B7ztwp53r+Bt/02fqQqgwQchvhowesDgYLNAohiHOuF06Z42kIVESEI5FF
 plHvXLTyjA7sAKsejYXfF6GSZPK2lEx9DXDd8KVTcu0h49+2Op9qeqKF4OosPXol7U4GOfLzIsl
 /8kI4YoyW0e3PFOR/J+eOEArS/z7ahVyCv+2nqWNxft6K1isbgUkqnWecT3n3lGBQZA3udgufHo
 cI7cwGovmKInLv6lJY3q6n3ShSGAzfpsG7SXSE9+005XuegOaQ4BpHTNwSPRSegEXjG6lrXEC3/
 alMtWRYCqGV7nCmqTGthYCZWT3hSJw==
X-Proofpoint-GUID: ShvdZaHM6c5DzCvtGFKTh4bZvHPcJBZV
X-Proofpoint-ORIG-GUID: ShvdZaHM6c5DzCvtGFKTh4bZvHPcJBZV
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ef9f14 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=MOmvoJmQv4oe-d1MVI8A:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025

Do not stop a q6asm stream if its not started, this can result in
unnecessary dsp command which will timeout anyway something like below:

q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: CMD 10bcd timeout

Fix this by correctly checking the state.

Fixes: 2a9e92d371db ("ASoC: qdsp6: q6asm: Add q6asm dai driver")
Cc: <Stable@vger.kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index e8129510a734..0eae8c6e42b8 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -233,13 +233,14 @@ static int q6asm_dai_prepare(struct snd_soc_component *component,
 	prtd->pcm_count = snd_pcm_lib_period_bytes(substream);
 	prtd->pcm_irq_pos = 0;
 	/* rate and channels are sent to audio driver */
-	if (prtd->state) {
+	if (prtd->state == Q6ASM_STREAM_RUNNING) {
 		/* clear the previous setup if any  */
 		q6asm_cmd(prtd->audio_client, prtd->stream_id, CMD_CLOSE);
 		q6asm_unmap_memory_regions(substream->stream,
 					   prtd->audio_client);
 		q6routing_stream_close(soc_prtd->dai_link->id,
 					 substream->stream);
+		prtd->state = Q6ASM_STREAM_STOPPED;
 	}
 
 	ret = q6asm_map_memory_regions(substream->stream, prtd->audio_client,
-- 
2.51.0


