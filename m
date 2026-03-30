Return-Path: <linux-arm-msm+bounces-100688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHEmMesyymmN6QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:23:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 834433570E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:23:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7DE003020EB4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 08:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE73E3AEF2E;
	Mon, 30 Mar 2026 08:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hm6gpN3u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZKQJJmQE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041C93AE1A9
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858906; cv=none; b=ADWSTVuZV4VwI1LBW3GOBv/Uy1omXYsFPTkLVgJjKABPeQOAeGYQMS68mhp14mN55LwvvBYO+1KjswSmZvouJr8KM8YTPuRgmn5TxY6aQ4Twv0ysQVLSimAERF9Xikb+9rxUcJaiahET8TuDQvlzZSuU1SezeobFVl24Trr1WlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858906; c=relaxed/simple;
	bh=aiDV+ay9pDagfXi99dECc3+gFHUApEvFgcp/SMLLkOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HRVCPe5W0lHoIopE3KdTyHMWQykluQpc0erdEZFxuZXBd5tORnx1CWIcFH5DB431mWLG2+u+rENWOpvqgyv281Z7CNa0ix10YHur2LGknKGi6fMAzhk+R40YW+xnrkj7uQjcLL1BCCAhUlSWBThvxXSG3BHZNTqgv6Xxhv6U3Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hm6gpN3u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZKQJJmQE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7HT4t1333673
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yFv97piS34p
	vw8S7ZuPziYbAwBwFldQJ4NalWJR5jGw=; b=Hm6gpN3uVmzLfqZbkE992WozLU6
	KTlx3d0Ta/UswVXL2uMYfrFOxDSjGPefz9hhlPz4WmUpSxZqCr5v4Sh3ikhA47R5
	cEppGu7D75F/sE6jQ81Y/l18NdFsR2wsSVuh8iQVrkLLvQEUYSiAjjaEjV/59d1t
	nqrMhUpBQr/6Gk17tfIjYHLk+M+bGpBAM37Vq7hjc9rMaNya4pMiTZmEALRMbcVi
	/hLeBmhvlX9F/pPFQwHLjv4kXb7kZZ8ZJXyhM/kRd2NdRHzOB0w1i+9T8Z8Cszl4
	kPWK+XBAEStBTam8vDUtdkoV9ShoAOUv1/kiZNTccacI6K3sJty9HkKL7sg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d677155x5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:21:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso175510251cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 01:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774858903; x=1775463703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yFv97piS34pvw8S7ZuPziYbAwBwFldQJ4NalWJR5jGw=;
        b=ZKQJJmQEm3GAgJJHVW4ZkDp/RYowwV1iWJ7XFrMViFnBHDm0DSCBOkhisrsT56pVE+
         qnTgupqcbXbyNssBjgy65sR2wv1nHIocux+QfAlqxRKTqHWhVaykTqdGJpg8ZSTlnQpH
         RpP6SNASkjUzRWmlKrdEXfE+j3DK12EyhcttDeSMsoTlri6/e71L57C7ReagTq5w8cpl
         m8kCExOKiQM+0aC/o7gejVY/Bkf4AuzMWiGgK97kjRmBU/59+/vqRr2T6hnmriXuI8sC
         TJqH+FFPhoQL2jkY9N5nuyxsy1HvC23D9nePcSUvrM6K6DLGGCcmR0oi7sGegdDuNXbv
         xy6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774858903; x=1775463703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yFv97piS34pvw8S7ZuPziYbAwBwFldQJ4NalWJR5jGw=;
        b=LGgb4T8Qb+3ofEGr6jdH6FiIK6jrOzJcKIrZ27Iz7AGyHiJb1eForynNN0DOrkinqW
         Mg3bqftp1yd6A/ArRVefxPUoD9pWKXfdK5KQT+tAM5IVUy0cHlTXk8czvXMd94CQlsNJ
         fngkrHVSBVf43sQXcyPLMzHkcG/KW+WzGHbtnYDbEXajEMgC/c9NWl6fI3lyVoPolp2D
         0ILBqhUjxstp+VS7jwM8T3b6C9VMKYKdDhs57I+38lkZUr9pPcCMtBdCbhB+BDG+Z0sU
         HT7ZE5hE+IhnTP1aADlCzcEeFJ+z7DGx2pDNeZjONOFCOjLyoAo4Yoz2rDVSJORhJwRb
         QPeg==
X-Forwarded-Encrypted: i=1; AJvYcCUz6WRuNZroUxOLr38Aw06YogzBYMd6axz8PmGDKNEb8GAJPr02vbBdMH9EbAyy9amc3zjfz52qVZfvdJxC@vger.kernel.org
X-Gm-Message-State: AOJu0YzZEgAN+100seRhXw/+GVO1y9f3xTyhd5/ScDO6URhHUMS8YDVL
	QNT2PvVYaNXTGcIEUrGPbFV3AAOy5K8xfdZhabaT6dHNApMOFeVCwqRM6o+zWRawi2h6NS1ACmf
	gH5VrBfoUoV0ROOEwrni2TufWRvXl0C/AldlQw+s/4gCiCVajOxiHpIPcrWF6gytDt+vNixFlFJ
	3p
X-Gm-Gg: ATEYQzz19lYM7e6TX7R/ZsqHxOu6MYoNscvNH1lS8kmFWt0nLy9Eh9rN9+UNZoX1tIf
	3si1c0kV+xGA7StuBT1pLNnCL57WIMsJGHy2pG+NYtOuNii6OU8bQkn3Rda2dz1bIGoyW2NiiOZ
	qZ44DCfXtPw4Nb1MaWDbOP19eLVsyPC+i8347JqTUGkyLf7Uw9xp64wJzDDGx2BAX3diQxhe+UT
	+9LG6WDTpWqHkinjtoMq3UnVNGcRgOidcaun1L8iMgxEA1G7dJu77y40cRBnNv9FVElEKEctaaR
	qk6rLrbEILLUhvssaSrzcVpJH38Udk6cU6A/Qyr14DuqKoIreH3D1BX3UJVYeLZDl1mf/xf/2Ic
	V0TQAcxY3qYqo/nJ+dIDsq2mtdXLEmUUtxbyuNxKhFKrFlQkJ7sSjJlc=
X-Received: by 2002:a05:622a:ce:b0:509:16fd:ac37 with SMTP id d75a77b69052e-50b9950036fmr188614551cf.29.1774858903183;
        Mon, 30 Mar 2026 01:21:43 -0700 (PDT)
X-Received: by 2002:a05:622a:ce:b0:509:16fd:ac37 with SMTP id d75a77b69052e-50b9950036fmr188614371cf.29.1774858902706;
        Mon, 30 Mar 2026 01:21:42 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf1db08e6sm26244773f8f.0.2026.03.30.01.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:21:42 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v8 05/13] ASoC: qcom: q6apm-dai: reset queue ptr on trigger stop
Date: Mon, 30 Mar 2026 08:20:57 +0000
Message-ID: <20260330082105.278055-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: l_37bCRnJIbUyoaJg8YJudM5Livje8MG
X-Authority-Analysis: v=2.4 cv=efYwvrEH c=1 sm=1 tr=0 ts=69ca3298 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=w9bA4Yi6UXS1dLCTJJEA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: l_37bCRnJIbUyoaJg8YJudM5Livje8MG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2NSBTYWx0ZWRfX4McjaI1Uhg8H
 mYWr99czyhbbSOGIUq9cVF8dd3iMiwQ/czTEuBG/C8txFs3+gQ+3vOicnjtT4PXDq4IGZXbzwbN
 lgm1cYTfn2EL5n784h/F3aiZQhQ3k44QSwNohpXpq/a//8/UQpiFIr9i1CUZwbgT8TjnHG4Y0fZ
 npck3xzIRKMPwLgkdU8NDiharpTl9kdyc/7r58AvQy3bqBSSH5QWZArgHvtcbTZXxOd+7jioy+B
 foqrIse0IzbCHK1Wtod7QWMsVvTh4VsmURBMczaIQisJDdzgnXqawz63N3RRFOWiTxCMhfBxtHa
 1Ybfywl0SA98oxee504rcRrKNbq+bKQ/i3JbdeOHLDKG1UNvAUthXqbKw4oEh8mg1wb9hCiEzED
 uFayZ2OxZM1Y3D0KrG3wAmGrAC/qJ+6HuUiswFhixExiOA0vGATxtqsDqwc5T7rnja+zgC9aav8
 Y/ZJS0dF1akhkvBRzYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300065
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100688-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 834433570E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index 306e928e7b49..292be457764f 100644
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
index 2dc525c8be42..5751e80b3b92 100644
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


