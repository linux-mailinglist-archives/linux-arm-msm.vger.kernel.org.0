Return-Path: <linux-arm-msm+bounces-99419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNUyHrTBwWkHWQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:41:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BA42FE61C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:41:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 335FD30A3CBC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 22:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16FA6382F2C;
	Mon, 23 Mar 2026 22:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FPNH7VQ4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hap2eZjr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AD5383C64
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305543; cv=none; b=Uf/dq476lmvHtfNLVFCpmzbfpDT8HbnMaaTAlGAR3MST+f6J4A1ZPX1hotgzpTHNdphOy+HrhoOUTGpAJVLRn/jdHG07WbC9A92XDTZnYGQ5WLovZFsWYshxRUq6yr6sL+6zNyj18GgyjmWfl54CctZ29nYCv38S5lIx/z59xjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305543; c=relaxed/simple;
	bh=6jShP5otc7Z/xglFZY5mqaUqDhEckaI1JOm+jwe6kcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LXR9voeYXj0rl3SQMPEaEyHuulX8cED5RkWiOYaVVS6pphQhDHfE0AdU9BASqpD7l9Yj4SIIKz/GxXsAWoWTe2jkh2X1aqvwLPPyGSoWTXpZDgFlZGpMN4yvIK5e+5eknZdJzQv5p/BuGXf/j6t//oCWmPS4FmtUbpTNUi+T7UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FPNH7VQ4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hap2eZjr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqcTi943586
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:39:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xKWL+GAYqNp
	+tTujHQMkzR7HCGoYVVs3sPVjIKR0hiY=; b=FPNH7VQ4erEtxC/8Mwb9Y3Nnj8l
	i1ArmT01rOSlVdzYTbM5M6OWLFeaFg8Ggw5QfvHa8l1H6EkePTMuRKoBhs7H0wwH
	G4PxmzgO6RLe4n/LTDf2B6cz7nLfUOXsy3rOZOcwihssgxCXJAjRHaeBSLFWLRtI
	zW1zDsJdcMo+x7nORRXlFhS3yDUjYzjrk0HBOKASRppW4A3xI6nXGRLqCmxgu6C8
	D+gktW00VUTxY3rcY0B0xFQaorr5gbsTTFaDoH/xXICbExT+lxLzkpSYODVj9rL7
	UlqAPY9Mj42OpfptyXXLiVQ5Ghy7Dr4hb50iBtSai+01SF17L8Yvm5ZVU7Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34vkt575-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:39:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b469e5543so7322551cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 15:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774305540; x=1774910340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKWL+GAYqNp+tTujHQMkzR7HCGoYVVs3sPVjIKR0hiY=;
        b=Hap2eZjr9fptovNS3B6uIFH2F/ZQOv2pdHfMf4JAmXGxJU1o59kHLCG5M9Aqt5H7hV
         Ie8o3BeExlozARIuAdCA5zf8+XFvmQs1/Au09JnXJEpXxxDCsUef5U3sRYLnvO3K5D6X
         BSID7eKUMoFBXYV5zfe24ik+FyDzvToJXcCBSzVmmdjyQGMjBlIQpUf7ZUA+oFYY6w2L
         Gq7d+yB9e+jBricWlakCvzzPcl3plKhBrWIZ2Z47i0uCdHPhzWUez/NG3AhsIzulL/ed
         NFt94wUfuPtUojJPPQqxRxr5qPcDBN/aaVhSHxUpoHkjH6pQ4iBzLHnvoEqp5ceNN7fd
         cRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774305540; x=1774910340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xKWL+GAYqNp+tTujHQMkzR7HCGoYVVs3sPVjIKR0hiY=;
        b=bKUSBx62IhKThBUH0AZdHwydpC1E2bxOh4HsUi8mwTRtDKHq3H0AlQ5RxMD3whWdoN
         wT9SK5ZNKVQyVmbK7jL1WVjyhWsDRZyurn8SfpF+8LxQY7RQ/Im24BP21iI24rE4ix1o
         4e+jZCUGhuDHB+kEDDSI3/Hfeb4rb5EayKCeDtAhrgqqCUEdi3wFFdJAIazNe2EguhMm
         zoKdDMdXxFcxJngXzLQHupvJ4gDiIv6H/AXUkM7QxQ2eR5svW7ywY5D1WoRV0B0LlsAU
         Mcw5Vw0azOAr6xA0gbtxfah00fvb5vIiVua7oqv8QJwDoOR2Gu8aUuOdkHykMmUlrsQF
         TXAA==
X-Forwarded-Encrypted: i=1; AJvYcCX8Tz35c9mQPEgYoQQ0W7S0iu0XuaMr03jpal45fKNUOI4LmDiDGPHpGKPAhg4WivdTh2dFYwlNPnPseqN3@vger.kernel.org
X-Gm-Message-State: AOJu0YwrRMuHyp54RQYNdFhisiv/iKFcVxrgyv3w/ojj2WFC10u7Zcbk
	t0BnfcF01AuUkTH+MPY3vpBpLFUOiySwYGQicuQ4YE7HdH8U7NHmFgiZTljHw8v1cCslU3sxn5m
	/V8h+IMzHaLfjUhc5IhPMf4EVrOwDvkLM89yxsDH3N5O4YNcdHQ8q9bkiBAZj6DBG+QGA
X-Gm-Gg: ATEYQzytB5hWXKF8dTPMUJLUhov5VB4rr06lG61fL/yo04nBAfF49bwdtQOAScA0f5G
	Vrlr7s1ZOgT3OAkVVe5NKii8vGXz+MRQ4F4Y9F6t2h4atRnunWv38ht7UjvhdMQe+3FhrjX97OG
	Iazyq8+7nCdmuCMtm+siAdsy7Ll6AxebinH7M+8OEePGNHd5ZdyIvt82iU9EqKTZAbiYa9Xx37y
	4Zv14qWDh45WmElnX/V+lr+pArt9KOyAR6/jLUhBnVqP1v3YyoVEFVSCxnsXTN33ttksekbGmEk
	NK0DrjOKtOrZYeXasOuv21CH1Qm2tnDSwRdRZllGJOLe0FO1Y+mxDkbpt6ZKO/iOCpxqQAc9pPj
	9XoJbt+fmeunQyV8nFWDoNzAyF/DBGx+Eh9rWoQwR7lCAL+JEz3+jhmU=
X-Received: by 2002:a05:622a:6116:b0:4f1:ba0b:90 with SMTP id d75a77b69052e-50b373d08b8mr192255181cf.8.1774305540069;
        Mon, 23 Mar 2026 15:39:00 -0700 (PDT)
X-Received: by 2002:a05:622a:6116:b0:4f1:ba0b:90 with SMTP id d75a77b69052e-50b373d08b8mr192254861cf.8.1774305539641;
        Mon, 23 Mar 2026 15:38:59 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64715539sm33320351f8f.33.2026.03.23.15.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:38:57 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v7 03/13] ASoC: qcom: qdsp6: topology: check widget type before accessing data
Date: Mon, 23 Mar 2026 22:38:35 +0000
Message-ID: <20260323223845.2126142-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2NyBTYWx0ZWRfX7ImRkil2ThuT
 dAl7sTknbIdMUOhQt5pLfGFDYkdmfELRQy0v6mD5J71BLiG7VlAoqC16lRVrudupw0F+A7+9OIO
 wMBaBllO435a9Rgd0++QvgJ8s0B0jdCmA9sm3b6/LsTB2Soa7dWY+cc7TmkUFe/JjQAODDLon4C
 ufNXhRPsVSLhOIvfr8l2erhXSAwwE/cx+w3TbRHk6VGf+/q+6BOdhy6adNndSQRdD29HoM/+6Q9
 jai354x0NJ8xwtYKS9vrpD68qptXRYUoSXBPXMX+LFywmR+fQfsBokcgGt88DNOC3Q8P+Md5WvO
 X0ya0WaRMwiFf+1nNHZthSlCgT7bCwa6MZCxUGjc1buIq5kKmhUl7Ee6Jm1rUlkjyHo2IhksQ8n
 Ny8MK9zFcoVM8dAztbBM10aA5iNslRJA64gL/CaoxHRfZ/gktFyxifWaiwVLJ6s3ckvctmhOl86
 suEAq5Ze0So9opyMSKg==
X-Authority-Analysis: v=2.4 cv=eMoeTXp1 c=1 sm=1 tr=0 ts=69c1c104 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=5HTw2GpdgXbBP0wXRk4A:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: yj5R3x-pE_EFKMLABh_68ruQCyoTYH6m
X-Proofpoint-ORIG-GUID: yj5R3x-pE_EFKMLABh_68ruQCyoTYH6m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230167
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99419-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D7BA42FE61C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Check widget type before accessing the private data, as this could a
virtual widget which is no associated with a dsp graph, container and
module. Accessing witout check could lead to incorrect memory access.

Fixes: 36ad9bf1d93d ("ASoC: qdsp6: audioreach: add topology support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/topology.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index e732fac9b8ca..1f69fba6de26 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -952,9 +952,6 @@ static int audioreach_widget_unload(struct snd_soc_component *scomp,
 	struct audioreach_container *cont;
 	struct audioreach_module *mod;
 
-	mod = dobj->private;
-	cont = mod->container;
-
 	if (w->id == snd_soc_dapm_mixer) {
 		/* virtual widget */
 		struct snd_ar_control *scontrol = dobj->private;
@@ -963,6 +960,11 @@ static int audioreach_widget_unload(struct snd_soc_component *scomp,
 		kfree(scontrol);
 		return 0;
 	}
+	mod = dobj->private;
+	if (!mod)
+		return 0;
+
+	cont = mod->container;
 
 	mutex_lock(&apm->lock);
 	idr_remove(&apm->modules_idr, mod->instance_id);
-- 
2.47.3


