Return-Path: <linux-arm-msm+bounces-108509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBz+A3pjDGp8gwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:19:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C74257F78D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:19:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2EA7F30B2C16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BADAE4D990E;
	Tue, 19 May 2026 13:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ONO5jxmN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CEkL3+go"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112DF4DD6F3
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779196538; cv=none; b=kw6/jMt5T//IuHtZ4FXdf6coG6SPFlVVe9sjlgJR3HOZ3wz13zvZ/ZAsJtnFiRrxTxhYFt3RlMyUAlsTWjnbaBHpyDMVKCC4eRnZN3RDvBztQtmNCzqoUjfVQOwVIUEx6vtaSi9TWQlxwE8Ei/39rgjLzlmrGx05PFy5lzoFH2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779196538; c=relaxed/simple;
	bh=oN4YAwisdhuOOBqKPXKvtfaC8/IwBvjgjFO5k7lYNDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dTOMEcbb90WkV/diHnRRxfbjouMPlLZ6tEkaKSeis3YtkZn/pDteNNUM2LSpfxwu9GHegKapFsKzjtT/oD70x2ClVLfyTB8GEgbKaoU+kqZncMxq2VPKTJL0tJhgDy9UT65qnvr/u7MncgoPzACqe1EAjfSkpIvTK6ZLUPaT6Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ONO5jxmN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CEkL3+go; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JAab5g867055
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iT2sk4+d3te
	ABIp894CGle6jPBeXLUcSVA+RvxJ/hQA=; b=ONO5jxmNXuqKjsEVdNjC9qMlaDd
	W9Bd4bzGElJdm6Y4O86fYKm/UpxZYIdtNyhl8G0B4p7xStVPqQgYSoQxAYwb5ZUk
	2Zl6Rkjadn3RHt7gA1PayyXH2Ov7ZEcK/Am83+8I7q8NDI0a1oozdV77nDb2q1bc
	L0Asd31Hv6u39WF77DM6bUA4zxa1J7fUPylIGiUwxp0LQsOKGW4A0Choe7uErx+b
	O9QoN050qOt+AyKz6Wy/HKli9NxC+OIgE4ZpxSDMejQTKgCTbsCS9jdB2zlvMYyN
	XlaHsrvI1fEl9ii0d2IwqP/2JHcEHXBLdEZQFy/KIvrKyoqfL+AVBrTi2VQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8hv1hv1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:15:33 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95d1b7487caso7173524241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779196533; x=1779801333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iT2sk4+d3teABIp894CGle6jPBeXLUcSVA+RvxJ/hQA=;
        b=CEkL3+goNCFTG9Es5YHJ1KyS9Prq4+k6BOeY0mHvE4YcwBqpljsKyMTl7bNwvZVhzX
         Rud5diX4rPVBDxkhEhA87jahyDwzIa4KkbhLkZmytE42skWEBjSjcGT3Y7CsRfZTFhpf
         YU+RNmkuUzfaeiA7JiouwVCOJz1P9utDaRT2W5dElvhV6+1uXLGREMdtXORpMNZOOCSl
         6/kSnu1sRJRFm5FM8xMr+dF5Wjr5AQNjVTqe2JSQ6S01j3PL5xkNwnupece3H+us/8Wc
         A1LUCGf0P4RKOIYmfJf2U81ACJtez0Dur0J14tHpZnRmOPvIjVyS4VE9sq536gSinfc6
         tDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196533; x=1779801333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iT2sk4+d3teABIp894CGle6jPBeXLUcSVA+RvxJ/hQA=;
        b=N86G1v6oZ3ip5jQV1E2UlGayUyH7cfWBFXYrA5c4aFbjXWGZJ2d/cOomiQwx0pv49V
         TJGz1EURxgETNKsascBFQSjtm5VMjdukLT6tQ8qH5Xm11/+TUR7Q2yuBJQLsT+iYCIeQ
         FxSc0c7oEvNJPvqs8L5iUgcJcgdE4K2bcvDFsoAugwBDGz8PWwBbkh/l97nxxZnR0PXt
         tavidlJjlcyEt0Vxnyg843KGeLiIz8A0K+wKQNtiDpqJCb/pmyM7nuflbr23KbhxoWXD
         X/Up40jWQ/Rlk/X1MWs1atqHWDX7ue/coPkTaJKvKn8TdXF9rTKo72F94KmEf9zKmPpF
         72tg==
X-Forwarded-Encrypted: i=1; AFNElJ9rCHBz83jBn+8ttPhijj1zf5+uGkjAfSktxvx7DBfop+0y3tdFkIWxxDccDn5T61o5c8eTQPq+tD92qPhm@vger.kernel.org
X-Gm-Message-State: AOJu0YyAN+gH24Nfua4PJO6kgi3lIyFLXJ7Paxdom42mS7FlVvBkZdaT
	s83j8GBbAQachdiFc23n3UM8uC62+AXC5hIuzorn7baFeZeUUIELTt16mWGPZeB4eC6tEYv/Hqo
	iREWRyitTFiBhxAh9LhG7rY4cLkopPIrr8oxjPCNn9g3h9NPEO1Uq9hTBtwpqvHt6mOB2
X-Gm-Gg: Acq92OGPvOakWUiEjiTgAJqQn/Rkuves8bDNRA9vVcLk/L/bGQ3LYpJvuBYd2JdxdGF
	YjOzZ2KEaerFD8POxG2ota9S6LnxL8fnI0DXRGDPjvecjeaZHQwnlnQSTIwencHKBYyV8tj4f2+
	88pFj78FdxLWmvKDNfzO+LhRXFdS4B8dSaPiyGwopVds4JLqkuhIExN8wISpPJeLm06RcpaL6Y/
	jDtKkNTtC1Bw4i92v8L+ATCJYidkBF9i7tSlzp1afgbqCqMD0GIrSHvooSG2qCh1hKNJ2APDoNS
	k1NmDszFfGqGu5jYP8XgZNse2ZHg25Xl3gGANPTNUyy8w0dSFLfrxZymtoXN19X4WRw/Pq7SLY3
	LW00U1uZoaAnKzyk5qITaGotSPy+Qbfe7krbKhUT7DVNOI6koTC/GJT3T7p9Td8+LsQ==
X-Received: by 2002:a05:6122:d1e:b0:575:27de:3eab with SMTP id 71dfb90a1353d-5760c057c54mr11756772e0c.9.1779196533157;
        Tue, 19 May 2026 06:15:33 -0700 (PDT)
X-Received: by 2002:a05:6122:d1e:b0:575:27de:3eab with SMTP id 71dfb90a1353d-5760c057c54mr11756699e0c.9.1779196532737;
        Tue, 19 May 2026 06:15:32 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm48018609f8f.23.2026.05.19.06.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:15:32 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        mohammad.rafi.shaik@oss.qualcomm.com, alexey.klimov@linaro.org,
        ravi.hothi@oss.qualcomm.com, mathieu.poirier@linaro.org,
        verhaegen@google.com, andersson@kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/6] ASoC: qcom: q6apm: return error code to consumers on failures
Date: Tue, 19 May 2026 13:15:23 +0000
Message-ID: <20260519131527.4002526-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260519131527.4002526-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260519131527.4002526-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMSBTYWx0ZWRfX5xg1uSYmILib
 8xZm8zBAk0QO38idlJASVpgRB6tssI8h7gIcZnD7jNScAN6YEHMdFA+Py6ZlAwdhH6tY6nCO4Yn
 0d0SqjP2dWK/uh3zGlJAI1vwX8rrjDgNJ0ig+Th5AhTV/X0t7PebOeRbAVG1InC1n+Q+57Lzroy
 UOA2ubIKlDscis/LKwlv5aki+YgiM1nRrBVLtlrN6mTZVeZGacMjeETCbP4RJXsZCfgbDiU6AGR
 grdZpCeKrpcVrFtfV1bHuesPVwjEMGLtRE4ZnRIBBQvSEIy9oQ6DlhhYwNn1yn2UyyRUiOBA+wZ
 Wciofg1voaOb9e2hBU5d6+/sGj+a36Cjwxyx1OxJXKbWASfW/B4RZiygYCFNJRL2NBjeyvX12yY
 o8xbxi612PE6HFGuNE/H+Ux6lY4t6wJxKIXYErbQe+1Bgf6O1dxQcGWuqMAj9yKdpdN1h9kerjQ
 icoxv1/3Xw5SCXpVc+g==
X-Proofpoint-GUID: CvbydikWneC-vO9a1HudBLNSiteh985X
X-Proofpoint-ORIG-GUID: CvbydikWneC-vO9a1HudBLNSiteh985X
X-Authority-Analysis: v=2.4 cv=WZM8rUhX c=1 sm=1 tr=0 ts=6a0c6275 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Kj_hsjq-VXR9WAeqRSUA:9 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190131
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,linaro.org,google.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108509-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6C74257F78D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Return errors from audioreach_set_media_format() to ensure callers are
notified when media format setup fails.

This could hide failures while programming media format parameters for
individual modules and allow graph setup to continue with incomplete
configuration.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 2ab378fb5032..2cebeb767cd6 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -194,10 +194,7 @@ int q6apm_graph_media_format_shmem(struct q6apm_graph *graph,
 	if (!module)
 		return -ENODEV;
 
-	audioreach_set_media_format(graph, module, cfg);
-
-	return 0;
-
+	return audioreach_set_media_format(graph, module, cfg);
 }
 EXPORT_SYMBOL_GPL(q6apm_graph_media_format_shmem);
 
@@ -399,6 +396,7 @@ int q6apm_graph_media_format_pcm(struct q6apm_graph *graph, struct audioreach_mo
 	struct audioreach_sub_graph *sgs;
 	struct audioreach_container *container;
 	struct audioreach_module *module;
+	int ret;
 
 	list_for_each_entry(sgs, &info->sg_list, node) {
 		list_for_each_entry(container, &sgs->container_list, node) {
@@ -407,7 +405,9 @@ int q6apm_graph_media_format_pcm(struct q6apm_graph *graph, struct audioreach_mo
 					(module->module_id == MODULE_ID_RD_SHARED_MEM_EP))
 					continue;
 
-				audioreach_set_media_format(graph, module, cfg);
+				ret = audioreach_set_media_format(graph, module, cfg);
+				if (ret)
+					return ret;
 			}
 		}
 	}
-- 
2.47.3


