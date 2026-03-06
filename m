Return-Path: <linux-arm-msm+bounces-95800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMJgN2bHqmkyXAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 13:24:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFE322084B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 13:24:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0E0193023D55
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 12:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 294FB35B12B;
	Fri,  6 Mar 2026 12:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VYETanTp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OHrddHAo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACAD390997
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 12:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772799733; cv=none; b=B64adkG/TkD6zPXWp1YP7PyXw8odkT1iSsm6kHWwF6+o+p2jB5L1BJWqqWtNP/RpbQAhIxGisNxZ18Bg1Pz6zRVTZrme74NgCgN2JFvnZeFN4DSgcZho8zEWtpgIntAL6vn6jBLbMZ8wi1QY39SrabFzRr8siqvUvRLxLGN3XpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772799733; c=relaxed/simple;
	bh=AhoflfyPSEypIadA7rENraHqNcIi0OFcEnzEL9v8we8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oD1pk456UWcs1djx9oYHMuc4UHMLK759KRC3z+XspE0UeMLyYiOiYThRiAPQJuQ83VM3L7q+ygSiLz7EaOm+wRE2bthbB7Kx0CnzW9CDDFIINCS5V0iZLqaAHUC5M59M17SS6RX7N8Npkfo9aDeBChPhszkUJYtCLqANAfmpkCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VYETanTp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OHrddHAo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BbJ90037698
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 12:22:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PS19lL6QwLa
	ikI1GyQO9iydtpc90HsQ6A4ACO7BE4wA=; b=VYETanTpP9TKbfw8VB9Q1wzGu2f
	81uLF3VdflICc8WVRkd1rvVwhCU0iaAZSYRe+unDyhiY3uBXgaTw5T5a6xGtJu5o
	v0Cosrptta2XIYPalxG6L631WHKhnC+6i5f3jf4M/HFrTK6eQyI3ORYhStO101MW
	q1rdH4DQTZumHS1d80YmIz9musaIzLNRee6uOzHdX1ntq6fwzriEOD+IKTNZsMEZ
	oqzgAHxwSA/efwk8DSGikwhsP85ee3oEznxbDFq+IJCdGc4X4ZcY4PuWgz3vKIyw
	lFoAhp4rZSZRfBmQiQln8Iy/59MOPQ2hTgohXfXGBXtBDfuYKLiLSHJAksA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqpxdsqjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 12:22:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3a2eb984so6320234285a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 04:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772799726; x=1773404526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PS19lL6QwLaikI1GyQO9iydtpc90HsQ6A4ACO7BE4wA=;
        b=OHrddHAo83B86rMGxrGrGa2eUuvzQmYMnxpA361W5V7qoTwTz2v/nJIov1Xc3vnnJ4
         hAQvodmRq610hxRuQR7b1SiuW3qNLBtvMt2xypB0DIoTYFhqWt70wYma9hE0Xt8/HKKH
         2vFu72LndCOXlUPTO6XeDMfEsPpR4MPbiy/e1t7oX8tFwn3vm59yZqDm9sl4ZdV7bkSj
         lw8hVar/XoDITX9upja7IWfWFiBAKyQsOW/87JycuLn/Ku5SvIh2mXq6P50CGRPUbkQB
         90DJ+tH+Reyo8IARq93H8yoSAmG/rTmoHnHZiKb9THd/7nssiaVuRuEg04sZa4T1xwYn
         s5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772799726; x=1773404526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PS19lL6QwLaikI1GyQO9iydtpc90HsQ6A4ACO7BE4wA=;
        b=cRLwmZP8DSMOpE06LlMW1kCICnUOKc3+HXoSXUK37s74Kx5KODLgutC92sXmkipHN3
         Bhu6yd/JHCAWwW/N1WgxlJnXJvnqCCCCXePOyQIR30ex0SxPlBUT3QKmYFjFWMCunjO+
         5fTKSX51EfRTq80a2NvsYOdnnpdW3aYHx6suojJu8+lg7HUvlRJtQEF+l5lSkeGA6EHA
         aIkuTFOlQ/kqCErKdMkzwHk8p6QKm8JNEyUEK3JDY5jciTqXZDGbU5GdBuDrfA7xbq8B
         OxUA7J1QbGGF5ANJz5Dkl/3pHhglxDnFrEHwZBAP4PB6LGODF+LbC8aMux16rpmBvnPF
         PKaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQ0Pm2iE3DHHJ+Bj99FHFG/ByZb2NR1b7QlRMK7g9uXEkIGHrgMaD4IaJs4Iqfwqz0ysnNM8xpXbI1UdJ4@vger.kernel.org
X-Gm-Message-State: AOJu0YzgtoWRUl/0ZeBFvR8B77cHVYQNcdkgEa9WJcj0+M5zdS0vYGi8
	OrlQwck1+M1Tyo0DaCsICo/maIRlLYReAyT9/9RQu28EzsYRYVRO3pnbi0aiUuEwgU2skfFZgOs
	XjkcsfcLPfcltjgW8pSJcKX1ZFdPeQWa2DVEM+C7Wc/f8T5iH5+jq+jZcEsuKVPofnokr
X-Gm-Gg: ATEYQzx8jRW+uXBlC0ZHSsct/MfZVWuRlbFqZxcPBGI2dgAmF/YszVZ+2xTu/ykxwRG
	n8iVKQErISszuIX1r+m0J0e0Jv1GTktwVo2vt4L7T1orTy0HGbbvcXpJuXbbZvWboy0g6Ouj78U
	1OZ/D2fb7JaUKhN0oELehYNAn8tvjPrwnjrMQo9eYNSQO3x+VXKsdGpXweWirasw+EfUOikg5Ma
	zzhEtBarDlGdBkAEbs7UFQNa3T1+iFCgllqBGF9HA+PCWf1SE8cZSM0IMbWG1mJjktn0y3dbVXk
	qAJDTb3TTODkWMz3kXOQRFp7zf30uPySKy7n37AoxBlUhYUSJAtTVZSMao/3JDlzG6Ijyzei7xp
	MLm5JqGY/sgKGoFi+kmMv19EDR9HkyUdKvZd/xOujve7MJEodguZx+b8=
X-Received: by 2002:a05:620a:d8a:b0:8c6:b247:4c with SMTP id af79cd13be357-8cd6d3ecdeemr229073485a.2.1772799726346;
        Fri, 06 Mar 2026 04:22:06 -0800 (PST)
X-Received: by 2002:a05:620a:d8a:b0:8c6:b247:4c with SMTP id af79cd13be357-8cd6d3ecdeemr229069585a.2.1772799725934;
        Fri, 06 Mar 2026 04:22:05 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fa87e56sm111972395e9.0.2026.03.06.04.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:22:05 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v4 05/13] ASoC: qcom: q6apm-dai: reset queue ptr on trigger stop
Date: Fri,  6 Mar 2026 12:21:07 +0000
Message-ID: <20260306122115.509705-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260306122115.509705-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260306122115.509705-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xAoDif2ijz6ZiwKB648Mh-1MMmyxRpsr
X-Authority-Analysis: v=2.4 cv=E83AZKdl c=1 sm=1 tr=0 ts=69aac6ef cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=w9bA4Yi6UXS1dLCTJJEA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDExNyBTYWx0ZWRfX6ti3kNoRihAP
 eLphjpH0Nrfjp8MIqb/2LxjRErerhNbNCbjKmrRZCxuycHnf97Kfn2dZm+UCLHPMFMYE1b2mNJh
 RcFktkxAoa0711pdgnut7ORgglpjv1YP1BCiZvYjUcniS8GQpzJ635tlyGynIbSXjtuEsOtj3Jb
 5RD40v5BGC553yJkpmMZYMH0eup1xPMDj22NBS/Eq810xqxrtTDygnvop5UXAOWplhjIeoh91i5
 gReXKx7QMUtikcKspDq3vmCtW56Mtm2wgJ6HMHkQI99CKq4+g7k9UsX/glOqEYBGkFTvWL0Ofxk
 aE3NIGchQ9mltYwIvHiUdcmZFiUZS0EVZDblSC6drUYAsF0v5z/PPVf4V5lYFVXw5VKHxhHwx4q
 ztwL6xiPq2BkTSRq36msEucmxTeGu822cxgshyY+1Hts/sGjZcVkuSfgk2+L8u6582Ff5yD5hvo
 uczEqg3m+XtsEXrpOtQ==
X-Proofpoint-GUID: xAoDif2ijz6ZiwKB648Mh-1MMmyxRpsr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060117
X-Rspamd-Queue-Id: 2FFE322084B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-95800-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Reset queue pointer on SNDRV_PCM_TRIGGER_STOP event to be inline
with resetting appl_ptr. Without this we will end up with a queue_ptr
out of sync and driver could try to send data that is not ready yet.

Fix this by resetting the queue_ptr.

Fixes: 3d4a4411aa8bb ("ASoC: q6apm-dai: schedule all available frames to avoid dsp under-runs")
Cc: Stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 1 +
 sound/soc/qcom/qdsp6/q6apm.c     | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index de3bdac3e791..3eff45b241c9 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -317,6 +317,7 @@ static int q6apm_dai_trigger(struct snd_soc_component *component,
 	case SNDRV_PCM_TRIGGER_STOP:
 		/* TODO support be handled via SoftPause Module */
 		prtd->state = Q6APM_STREAM_STOPPED;
+		prtd->queue_ptr = 0;
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index ebd5e3ac0366..f190ad5e912a 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -215,6 +215,8 @@ int q6apm_map_memory_regions(struct q6apm_graph *graph, unsigned int dir, phys_a
 
 	mutex_lock(&graph->lock);
 
+	data->dsp_buf = 0;
+
 	if (data->buf) {
 		mutex_unlock(&graph->lock);
 		return 0;
-- 
2.47.3


