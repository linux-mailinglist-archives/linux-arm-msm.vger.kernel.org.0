Return-Path: <linux-arm-msm+bounces-93752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CGdCqmXnGluJgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 19:08:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D25017B450
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 19:08:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 234C9301FDB5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 18:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32C2933BBD0;
	Mon, 23 Feb 2026 18:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H8r2I+7K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gNU4R34I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83FA33B962
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 18:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870082; cv=none; b=SCN9VI7gvmNntooo75Tcxor5F9CZ9vJF7KRfGq/l5yGoN4ALt0i/jfhoVbtYpSpf4EfqS5Z4/chTfkDqtFQoIuib7KA1aXOXPfcIIYkqsTnIbEBZ2H0cmdBz/iGIAyXiESqezDqpt7XjqUo01cXxu5vzbU8sRWIPkAAMAGS1YlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870082; c=relaxed/simple;
	bh=z0nBWK5+F2wsJrQIhtl6TV5njKOz8lu+80qf9G2Sim0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dp7zmkHqSfrCDWp0Uk30Yog51fBZ85F2z3Zo8yk6yNTMmEKmXQ0p7amn5Z1Y5Ko6hHb00VnBpYHY6JI0LAdHYK9plYe8DXBoP89TgAJv/xe9IxEa7cZrYTFMTMIuT9NSbwBYkMB2uhpH3mBCmKwszmAVPLx1DBqnV5c3r6fvv64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H8r2I+7K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gNU4R34I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAXVbL3700101
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 18:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vJxFLg7wg9k
	swXDRQsScAbUneSzeSw/ohZQ+0IC4ocg=; b=H8r2I+7KV8h3oqSJmnLDpVD5DrB
	TJAJH1j9/fPIoXssIrJ7o8VgeLWj5xTEq4mugrSm8EvoZgZ9DK8gpjFF+C3aJfCc
	p4KBiRrQmTADUN/TTtixKoLRU5nL1Xxz8OENvGrfTe9qkx8GKAPPvlzh1GkG5fUC
	EzW68UON0TZ4AfPm5VxTp7881nOW+R4Py310JLdoW/G3bI005QNpmmO8APk5ZaJN
	BXbXiMZgz1p4pwvBXpgu6V3kqbBKV73QKCOSoe+BLTzlcu/qImKRvr03uf9IdWjy
	0DPKS8zrKQlzuorSIYCuxuKyXcj9QOGPhr4imCSebQlUCico9gBCf4NX/uw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn819eg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 18:07:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3b0d938dso4795467985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 10:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771870079; x=1772474879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJxFLg7wg9kswXDRQsScAbUneSzeSw/ohZQ+0IC4ocg=;
        b=gNU4R34IkcLXbdc5o9GztyjYW24HM3lcc8HC2O+wIHO2sF3Bi0/yNTaTX6PBwxKEpb
         t8O/zpJhX6Ekggb0QQ2r2nPpESaVy5IRUksaAMJQGqcGMwfLiGs0eOgvX9hzI52ITAa9
         QafDfO5fRyBK+mi5vBVUHyfQFYMcaM/m5pVqod2hmpjqPIVJ7rQWw4BmkftsiCPY6NW4
         vQis1O0cNpirHcZITg62FavG68CI8flx3CAECtQLjZw1lJJwHK8qmMwx8OAwCO98MKbF
         Z7G08THef+9HwPHiptNU2kYAhyuH0cPmf7y/tFuUE0ShSyykFHms02d/b1Y7UszWsDYJ
         USXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771870079; x=1772474879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vJxFLg7wg9kswXDRQsScAbUneSzeSw/ohZQ+0IC4ocg=;
        b=JpFTMwQG33pyBE6dJaTbhXgLzTgOEDA+mSltoI8fK6gqrMeum+tWVI3skBcklmgpaV
         LOZ4pTsJs0D6SmFOrXysXiBp9MPRPpshGtm9l7EAVnN6hkHWSv0Xq9Kh1drPGwTOczjO
         /H87+437uzopu31oKlaUlVWzPsxmEzxAnzH1PFDLJuzLIvnjQQEoySJTLjj2KImzXPah
         NHgXOOGiUpGfY4rjIfJPvLTn53POO2sV2ZQ8/EK2KzcwbIJcJRVqdNg/ZNtSJs+5G30C
         ZLdpzfgkZ6/crEhvKFziolzsXKPdM3nx6+Q7IiF9fVwRLJAFuAQpuQv+YCj1AJWdElmd
         VnOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyy7aS8eym/E5hxwZHVsAunt9JM+/35U2kzD9GCRhfGVsmvgtaLbIiwrgpHeyobVWYusVJtlSW0LQEaBpt@vger.kernel.org
X-Gm-Message-State: AOJu0YzO/8dDIc4oYET9bQ2xKhHDmHOuHGjDrfGxv2UYG501eQFuewqe
	NoMzwjoKbxu7fdn+pjxv/XePUlFdvWeygWCf8b9ZFQbg5p9BoXvT7IeiYv01osOsBik6DU5z63N
	pNjaUfDt9xk7bNVzml3CPZqR5T34LHhkk1MNRHtSXwFzU03J8ufzSpGINWZgQS5pZSS3a
X-Gm-Gg: AZuq6aJWkfx/EXxzWN652fEHP4qiPw4yO/rQCeg9Dxcq11wI79nexng73jNFk3ftLMT
	1il+B4PEqDcLnvj/euI4zKkbT6N6QFBsacOEyFe92XkEs4CwNUnXNdBxLfSgy7UW5xUOkEA+66f
	1rHTtjjmFgbt0EuQqwaic0quaLD5I2oi7rx5OC6DQOIdc7+u6RuZ6lU80q0Oi6CviIN+f4cjCZY
	dlKLMUW05HOZTpUUj9ScJq9M+xxM5epHasHo2FQaUBbrpWTzEHXG5EHl8JXMP6yasyfHJUh+uh7
	2EohV3eiOiab/tHxdZR8Uh2KRgVpdpRCc5/5zRkEkQskCcY6I34VKxYQ9DYC6bXF/JvSaKf/RyK
	v60J77qedoUjeEWK+tFivhGhisDa3b//4JSRZZn/WKfmUuDgFmCPQ6do=
X-Received: by 2002:a05:620a:408c:b0:8cb:5176:f00 with SMTP id af79cd13be357-8cb8ca6731emr1093333485a.45.1771870079259;
        Mon, 23 Feb 2026 10:07:59 -0800 (PST)
X-Received: by 2002:a05:620a:408c:b0:8cb:5176:f00 with SMTP id af79cd13be357-8cb8ca6731emr1093327785a.45.1771870078795;
        Mon, 23 Feb 2026 10:07:58 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d401aasm20458574f8f.23.2026.02.23.10.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 10:07:58 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 03/14] ASoC: qcom: qdsp6: topology: check widget type before accessing data
Date: Mon, 23 Feb 2026 18:07:29 +0000
Message-ID: <20260223180740.444311-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wfU2Dx7m_Ud8AQLCV1XIEH7f4dSVL7l7
X-Proofpoint-ORIG-GUID: wfU2Dx7m_Ud8AQLCV1XIEH7f4dSVL7l7
X-Authority-Analysis: v=2.4 cv=CbsFJbrl c=1 sm=1 tr=0 ts=699c977f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=5HTw2GpdgXbBP0wXRk4A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE1NiBTYWx0ZWRfX56yMgshsJyFS
 ByggORyqUAh8vCE+cbWDcYzpVYMStsFfIjGPMTMJN2YGWVtysBr0xl5MtNE4ddm4gUoBVBtEVy+
 826UBqwXhO3c6CiMb7f3NCAQ1Nu8bCP+J22BrGzrgZXjgf5QkPqJU+MZFArhLcaOob6WLmua8TY
 RQqIGlhPcQm4mryUzJs4fYEnbdNR4kthoXbJ2EP1i/sdjwBULzPdmUnElmRYdddwLSbQ4IMpDYt
 wsexxtttGbv2EDo4flK5aJkjTtYxzB6F/+gD1LNKgahHnMD0nH5hlYjbli+osIdvIJRUGiwPohE
 oKRuSr422lpwOyPiEjjoobK5F5cCMte9MO9/KEPbrwktCkT876V7TSEShvawm/gdWSPip0F++IL
 PPqkQssNypRi8/8WaHOIbgC5H4vgkZvtuW18yFn7V9Vi4mzbBVEdeHIi+l9QqGIbmXUubGDjczs
 1L2PXtp6e9DbstlXDWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230156
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
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-93752-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3D25017B450
X-Rspamd-Action: no action

Check widget type before accessing the private data, as this could a
virtual widget which is no associated with a dsp graph, container and
module. Accessing witout check could lead to incorrect memory access.

Fixes: 36ad9bf1d93d ("ASoC: qdsp6: audioreach: add topology support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/topology.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 2e71eaa90441..80afcc817d78 100644
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


