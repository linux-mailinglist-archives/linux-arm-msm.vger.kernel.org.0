Return-Path: <linux-arm-msm+bounces-77402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 380FEBDEB75
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 15:19:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 747BB19C49F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 13:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC0DB2405E8;
	Wed, 15 Oct 2025 13:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="azpZgUyh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DFB2264D6
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 13:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760534298; cv=none; b=qAjSh9JjT5gAShxZUOXEso0DHARNwoddTDRZ44Zz4o3jckH84IJZJMq+FVZ8G6tLdT/LBduJ58hoskBVu1+xIjiu74CfYSSe9CxemFjKTX33/4zlzlpfrzVKolry3hL5ivTzqoAD8P5XdnVsD8CaP3PvBmVA4sIrfMWJes7xrgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760534298; c=relaxed/simple;
	bh=gw6jOBRXvp96kuxuVwkfEFK7rpHtMnm9kKwZNmCz2N4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YxbrOeuJ3ERjqUt8WksELAi5VSiS123RNGHPkWMZuvjhCJX2lHoSMeFdHJf8NV6zQPvbi5OHJuBbQkVH1aM/uy0WPm5dW2A14Zwi4+18ooPfCHMG7kB+Cr8jdsiCt9BxKeEMCVziOGv72pYVljQCSMq0IsQBXVCJly+3wOTiGXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=azpZgUyh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FAixRC002544
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 13:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=C9C2sc2A6OP
	brM7m6MIVjYsiz10pmNe9evy2xuv6tEM=; b=azpZgUyhP+hcg5yBdlxmqdcyX3x
	ompOsmYcvwietzbHAu0Or419FspEZmUtfJFlV8XGPbj3FetpE4mLgVZKh0zB6wa3
	FtqOEtOnibt0R2Zw32NCD/P/rTXz8nEKwzVQkMkzpHr9KMGrPBgnZjcvNoXOltXq
	IiFlEGz6GOiRTI6ygSYeIZzTIYRNYCMD8+ncPN/m3g8/xnWO7GL0MjNfpbi1Ijf3
	/sxOkYzfAFv18ZO22zcfeygpw2FuYX/MoBAfXX8xwVsH+3+Y4s3vepMNL+wN7fE5
	sFYjDXpuOFghaJeNcfW25VB5qkqnaRAvhP7XV2E/n+w5G6SB5tFlFZtKI+g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa8cj7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 13:18:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8544316ef6aso1913385a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 06:18:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760534294; x=1761139094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C9C2sc2A6OPbrM7m6MIVjYsiz10pmNe9evy2xuv6tEM=;
        b=DQtmWdxFw6zq/PJHGsbJxeVLdbhov15anEyWrylVvJyZGUg3pFVBXMZ10nz3TcduAU
         IW9yEhkzJjfnzkI1HizZb24jw90y084ekgcQTAuAHzEF6AyTh+4EowjaEQuKAosnhivi
         4Su02JiQr4a9x/eifCFaFP3uvZ4lpP+HkSGYD0MMyaUIjccLzOmbo6iuKRJv2pnSKiRo
         24iL1t+002hDe+4UG6U/1BQJXMlWJvE21rFWfkaRZv170g7MLDHxJkJAGOF2o7Cmc0yS
         ioRrhpfEVKFBV9U+UfmlIv2MrlExQh11+WDL5iK92X20QFtyAFmAOOjKKxSRDamaa/Xm
         ptIA==
X-Forwarded-Encrypted: i=1; AJvYcCU1xTj+x8xzZRbD++wevs0vLl5QKj7Qo8Ep4YP83UDce9FHwJKnqJWowGV17+KEfU8qTh9/7oW1npv9KkH2@vger.kernel.org
X-Gm-Message-State: AOJu0YwvBvzdkRDkV4OLxL8vLDLFQ6XIlZHWDyzSW9fr399etkdfH2PY
	Dhqort0yVWqF1sy1XjM89TSZgP5q5wVmkBwJvLOIF5GgRFEEdNK0tsAuplV077jF1PvJZTBMXMS
	aEsHIX8XK+HlVzdXzgxIUNpvj4/C9/kdXdRRWyGNJKs8T5il2cuXqom1ZW8tYJhzCBWFMd5NGcY
	tf
X-Gm-Gg: ASbGnctGi0sbbPGAcIo0po1dnLAzCh2jqFLiKQFeG3g4+jXbmAMhoNGTVrDEoEpov88
	FVBdQ0DRyAkLUi6Q4tySQt1eQbstAhAcVhYaMEdjnW/ljOvfh1B+0DYLYwZ+JQGFQmI4v3t3Mjz
	5YEhpwFt5IkHkhgNAe+vZechTowj92VNYYdZ+QTz5NlMUgI+mAIMAfErk6WubTgDSnpMZMvxJDC
	d4OMqv6jZUJhKnuV+m9dCtqkxt941wEed2YOMDAMQAGDH6zC57/Ft6il3MN51oiP5P+QAcgRbPW
	ZvxnNiBd7ZIopF/6J4WIzXiIQcWvJutj/U6L3e47hJxWqlytvfCkSw==
X-Received: by 2002:a05:622a:18a9:b0:4e8:8c91:1d0b with SMTP id d75a77b69052e-4e88c9129c8mr11072121cf.61.1760534294174;
        Wed, 15 Oct 2025 06:18:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0CMlu9MhDFwvPcSu58T/hp5Z9HiQvZdCOtofLyrFvYZAEP6D+IxtDxCV4LRU3c7gZPSgu+g==
X-Received: by 2002:a05:622a:18a9:b0:4e8:8c91:1d0b with SMTP id d75a77b69052e-4e88c9129c8mr11071621cf.61.1760534293674;
        Wed, 15 Oct 2025 06:18:13 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fc155143fsm262081245e9.11.2025.10.15.06.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 06:18:13 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, m.facchin@arduino.cc,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 7/9] ASoC: qcom: q6asm: add q6asm_get_hw_pointer
Date: Wed, 15 Oct 2025 14:17:37 +0100
Message-ID: <20251015131740.340258-8-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: 5oFuAuYMNxEZ-ODISZo5Ao1aVGdq7wCk
X-Proofpoint-ORIG-GUID: 5oFuAuYMNxEZ-ODISZo5Ao1aVGdq7wCk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX6YPyEemqbki4
 CkA/UGJOiln4H3YutDYEvpytnZQ0jkVhbIT8/hK5OAw6FlNqT12Hq4K8abFvGQ8cS4eDW0oG/DQ
 JROawSupMPURBBRn1ghbehzHk4Ge503BQAk+zI6dezLqwAZMkFoHU6w4Zj5hlUfzz3NDFR7BpBo
 xHNzMxOmHxKadLAvzCapjXNMmLXtj+1MuxxngkmlWOVSmHNU83vvJuvW3Bt57W74GCtuVeGRds4
 bs5saDBRgbwr6Zo7flsRoA98KdzNYB/IihnnaitS9UpgVho/cNDEfGgLg4Tc0kH+ZkWwDGkbgRN
 pjGv6ICPdAfB05ltipxd5MIgY8+KbuymKx1qyzndPyEVE2u1HhDqGqqox2bzQ5GnhrygIcdMGck
 8SAGI43ZBAwM+O1MtVVmdCNttANvoQ==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68ef9f17 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=Xpi1c-eeJLz4SkQ0e-MA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017

Currently we are performing an extra layer of calculation on the hw_ptr,
which is always prone to errors.
Move this to common dsp layer for better accuracy.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6asm.c | 12 ++++++++++++
 sound/soc/qcom/qdsp6/q6asm.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index 371389c8fa7a..643ca944b1b5 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -6,6 +6,7 @@
 #include <linux/mutex.h>
 #include <linux/wait.h>
 #include <linux/module.h>
+#include <linux/atomic.h>
 #include <linux/soc/qcom/apr.h>
 #include <linux/device.h>
 #include <linux/of_platform.h>
@@ -248,6 +249,7 @@ struct audio_port_data {
 	uint32_t num_periods;
 	uint32_t dsp_buf;
 	uint32_t mem_map_handle;
+	atomic_t hw_ptr;
 };
 
 struct q6asm {
@@ -598,6 +600,14 @@ static struct audio_client *q6asm_get_audio_client(struct q6asm *a,
 	return ac;
 }
 
+int q6asm_get_hw_pointer(struct audio_client *ac, unsigned int dir)
+{
+	struct audio_port_data *data = &ac->port[dir];
+
+	return (int)atomic_read(&data->hw_ptr);
+}
+EXPORT_SYMBOL_GPL(q6asm_get_hw_pointer);
+
 static int32_t q6asm_stream_callback(struct apr_device *adev,
 				     struct apr_resp_pkt *data,
 				     int session_id)
@@ -703,6 +713,7 @@ static int32_t q6asm_stream_callback(struct apr_device *adev,
 				goto done;
 			}
 			spin_unlock_irqrestore(&ac->lock, flags);
+			atomic_set(&port->hw_ptr, token + 1);
 		}
 		break;
 	case ASM_DATA_EVENT_READ_DONE_V2:
@@ -721,6 +732,7 @@ static int32_t q6asm_stream_callback(struct apr_device *adev,
 			}
 
 			phys = port->buf[hdr->token].phys;
+			atomic_set(&port->hw_ptr, hdr->token + 1);
 
 			if (upper_32_bits(phys) != done->buf_addr_msw ||
 			    lower_32_bits(phys) != done->buf_addr_lsw) {
diff --git a/sound/soc/qcom/qdsp6/q6asm.h b/sound/soc/qcom/qdsp6/q6asm.h
index 519e1b3a3f7c..6fafda5bd849 100644
--- a/sound/soc/qcom/qdsp6/q6asm.h
+++ b/sound/soc/qcom/qdsp6/q6asm.h
@@ -148,4 +148,5 @@ int q6asm_map_memory_regions(unsigned int dir,
 			     phys_addr_t phys,
 			     size_t period_sz, unsigned int periods);
 int q6asm_unmap_memory_regions(unsigned int dir, struct audio_client *ac);
+int q6asm_get_hw_pointer(struct audio_client *ac, unsigned int dir);
 #endif /* __Q6_ASM_H__ */
-- 
2.51.0


