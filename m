Return-Path: <linux-arm-msm+bounces-100687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIMuMrEyymk66QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:22:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F6D357086
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:22:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 89F4530080BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 08:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 468B73ACA74;
	Mon, 30 Mar 2026 08:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jzn6VMyD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NnIZJKFN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59013ACEE1
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858903; cv=none; b=eMFpGZrlJiJCGiBVFa5dlsj7DCocsFpnZB42g06PU9M7VdDmPcKr2j12NdRCNa5wao+VkAkF+QsGeFc9fI0xeps1cHlUlaLFoGQGeucIiWLQ+KER9zie/PmLzE3Id26wk4DXCnAOUVEr8sss6sDRwm7G3Y7oNGJOQCVXuI1baZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858903; c=relaxed/simple;
	bh=Y2gMg9r9rY5Id6C816eYq1RewX5CB2zXG/L5mc3pjP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ikBs3NBNsbYEvbBroes7Iw8WRVazLVyZtV1QUgjRQk8wpZM+ZcT3wGmR6/+Ue5LIw3gIlhwe2TtjJ2cyvLFNRNm3Sz7vJ+DRsn6uEZEulAwLx0skQ4FY5c4EsExBw5x+uDuX3KM3+HnfajF6YdyOzNeRy597uJ5GVBcBih9QqFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jzn6VMyD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NnIZJKFN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7sFNZ2418508
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7B75lNNFNuA
	Ypi9X+NzbIbx8p2NgysFuyaIXmAqO5Vs=; b=Jzn6VMyD/t72QhmbJmpDDhXFs48
	Yh5GEsd+nAQ4nhJGc6i1wIlee03pm2x7L/BlTw4SPEDFdlmAdB2T5QsmFYccbL9v
	O1Zw4jG6vCr5GAZJqkx/OLjOel1RF3ZZQNwlKY469bh6twYAP4cguBXHoD0ZOKBV
	86eoPuQd11CioifkD7zgu1MqOTXHYNNEVTFuUjd1/0YOiku3gaxu4mkHS9KtcG5c
	YKenPo5iBglxk/SRkJAmDLEb8/jhHoyTqoLIRpXDUw5T9IHGNgpvzU/PxFb+pw9C
	PD1wbskWyea6glHxsz+U31iHECwwpxaF6xPCVXgAKjhGiccnTf2RHGlkUuQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d685hd3r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:21:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50911c94db1so104382541cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 01:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774858900; x=1775463700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7B75lNNFNuAYpi9X+NzbIbx8p2NgysFuyaIXmAqO5Vs=;
        b=NnIZJKFN2UK1MgoNG1UBIhSWAiBvBiutW3sohhdWihKdA1uEcjAufvjQhTA9j6Y95K
         1LKd4ruHNqytfQHa+4OdMyxxAD3kcR+ljUe1mI4yIfiFsC1gjSPCgaqnwEDZBKn6kjwn
         DogMssGEMjO4Rpn/KkePvOxeNmHjvzFP+/yI7CuRJQvIwsgDNY7YY5CnIYC/GDkYS63d
         JE8y+GAg3BgWSU3F44QwfYjhEBdzYv4Sxa1Vo3vsRo01G+TQYYdh6v3D3pHTiCiozQ+d
         R3PvvhzMxGoguLbsJsSYqyjp5SKZGhn2WdavGZadP/AzqDzEDy8CDV6qQfeCPTqr01IJ
         U7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774858900; x=1775463700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7B75lNNFNuAYpi9X+NzbIbx8p2NgysFuyaIXmAqO5Vs=;
        b=gm2DPbjvEAe0myCYZbNsQTAC+4xlzBZMI83SJMsqH17HugrpdpKPch8JRo6EhpZN43
         YAaQj6DQLohhNR5wF0nql7Qu+docwVFiHxl+yJlMSnO921OoJwhDBCgSb6ZUnFKpJDI9
         UsFW0bNiHOtu3U9adhjA3qSaNbq4q16le9VPNPxIX7gb8PkbmOOfvrEWanc6Ge1JS6sy
         YUGr9uP9EXdwFqX/kr8Z2iCe/TZzT4G/8ji/EAGlAeC1OHQIOCMJmcNjuLjOIGqZwMwe
         to2l6c+Aua260B3w0qn2vP7CQsJxkogMNMSgMGo7v3Hw/GeBDl+o7AvofBXvhDkq2sIC
         sdeQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0LJMgeChkgadevwWNQeEQptcNP+Pq9bdHfzEvchJbn9PElA1Hg6JISgAKXlZENyy9ousRy0RP5M4q52bM@vger.kernel.org
X-Gm-Message-State: AOJu0YwSKdSBo3jWGT2dPofe4d0H11duBFiW49nbgZzTud6RBJKqoxwN
	JmCiCkc6WcSiFNzklzz/rzY3az5Xl5MSdFbmlMHmUTGOmu/XybpK5AXoD5idnT6UBZ9sxt0Z6w5
	TVHnleYFkAFUxKYIUhAIAiuAAtuFgrRpJ5fo8p8karj6kI4fQ+KDQT1uKJFwrphCLDoL7
X-Gm-Gg: ATEYQzz87IfjKZIuzVyF5qQna3Coc+b342XzmEKTrPxcn6fRN9KWPHX+YG6sPlJOHqM
	antmwIWYJCwUkphbyP6ohVpL5rghYhhSaYmY5eFEpl69rV35K4/T4HSSWlvdTSBHwMj3gZaGGvR
	xK2xmk2KqoiO8Ui9t3qAypwKtmNQMM5G9zbjeXVCTUO9p00TIUMyLazwhlmg4tkFXyMwYBTq7Ik
	2I3fmHmBHdNEdMdzSNZ/R2jUrKSjkAcXPLgcJ0CeH1ZI/GPTUcNyOs7s/WFdDWfNXonJ+IBBDyk
	/z8Dsjj+5QGIemXFsTWqSi7ZAoH3IMQIgZaR1wjYrCoEVS/URT4rlwdESv7otE65ADjzBDVrxry
	8p11VX8xGZti/as8fCw8XWpIbcP8Bmp5Sp4O9KxRl6oGxr7ShzAUSW8Q=
X-Received: by 2002:a05:622a:5e16:b0:50b:51a0:f744 with SMTP id d75a77b69052e-50ba3816a05mr155380241cf.17.1774858900193;
        Mon, 30 Mar 2026 01:21:40 -0700 (PDT)
X-Received: by 2002:a05:622a:5e16:b0:50b:51a0:f744 with SMTP id d75a77b69052e-50ba3816a05mr155379951cf.17.1774858899803;
        Mon, 30 Mar 2026 01:21:39 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf1db08e6sm26244773f8f.0.2026.03.30.01.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:21:38 -0700 (PDT)
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
Subject: [PATCH v8 03/13] ASoC: qcom: qdsp6: topology: check widget type before accessing data
Date: Mon, 30 Mar 2026 08:20:55 +0000
Message-ID: <20260330082105.278055-4-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=csKWUl4i c=1 sm=1 tr=0 ts=69ca3295 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5HTw2GpdgXbBP0wXRk4A:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2NSBTYWx0ZWRfX4sns1bEORXZo
 0FgKVBAOsj225eyXJRXL6fpRen7p7TOK7jOkdeEm4GdRvB+y5FLii+kViW1iYkTXq3d8C4Hwc+e
 tEOEy7/i/l27GPK106m70centci/0BLegq1VGrkXmpo4VmqfsNzLqkwQGYcGJ3VvxxVpOy60xNS
 u5hwnFhSXwCirSQIY5pq4uEROxlx8aMbX+HKYgJ0dnM4+R0TM/zay0RCTwi9linoe4zaZ6kAe6O
 my2Px7rTK3R3BAjkyegaIkIHKNp8oQrI5su+JcY+EgyFwUMD6ClYR3iZugiDV+1eXEcZcdgMyki
 47jrFSV3vcncacNiUn1J3kNDA2Lz7jheM9Oe7eX9MQmc5W1lcOktnBnZ0LPOoB6ZqEKJu9C1pxs
 2xTFJlZE6r2yp1nR8WbASFYDMherOEWN4YTaCjhspJJ966k/fm24Yd0ScT5Q8WlkH1wmNXBNCyp
 nwKebk4l/qBKVWHjDbg==
X-Proofpoint-ORIG-GUID: q4a4i83gxPgl9-bVS44xxUhmO0Q8-qW4
X-Proofpoint-GUID: q4a4i83gxPgl9-bVS44xxUhmO0Q8-qW4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300065
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
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100687-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F1F6D357086
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Check widget type before accessing the private data, as this could a
virtual widget which is no associated with a dsp graph, container and
module. Accessing witout check could lead to incorrect memory access.

Fixes: 36ad9bf1d93d ("ASoC: qdsp6: audioreach: add topology support")
Cc: <Stable@vger.kernel.org>
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


