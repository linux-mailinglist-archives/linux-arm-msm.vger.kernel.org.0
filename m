Return-Path: <linux-arm-msm+bounces-110172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MzQHGORGGoMlQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 21:02:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF115F6D1F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 21:02:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B598530A3588
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 18:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77521331230;
	Thu, 28 May 2026 18:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kbs2VywY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W8Oy/KeW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0C932FA3C
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 18:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779994710; cv=none; b=auGU731/dS6+JekAqDL6LeUufBtE2jJM7RFTYFh/DaTcadwQI8uRXBKpgl3FsYYjTOaQALGMoYBoT/E4qcY74h4rPvy0fUc3f3k7W+ol4J0m/l5olPzhYMdoR1H411ljHpA0R7g6YBWhr+WriZDyf61ia2rofZ8JqIclkiVEmw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779994710; c=relaxed/simple;
	bh=JIyAc8HzCFIctpaTaYCtShxqBl5dQxTPCA8RyRIQEs0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nb980bQTuQTrzdULo8DZ+gzFQfliV1h2iw+qmUMpmWg0q1AExx1pKy5tk1siMBCXt0Uf5FU4EVxK7uh6lEzK4TxiVIiOs2STCaiN/Rypf24bORfxzjkJMBjotfydTqQoLuKH/fSxMK8qh3/tc881AwpZxMHhYrK1EBSN9XOgsyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kbs2VywY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W8Oy/KeW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SHFTbG566549
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 18:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jYL+Urw2JHq
	HhWlEtb/v/2zPyR0WLaQqmSD+Jj+rY1c=; b=kbs2VywYzanl0V4veyQlgkKDouG
	D1BawuHqwYgQAPBbwsNxQo8vy1m+Pfb9eXlUaYTO+VmlpjAudfsQvbMYEIJqIV0T
	g/O1tHAxzzSFy+kHtWubAPTGWEhBmar/byXarA+ULtiPQ1huMY1HuUSAP3Z5sbhK
	ogtYEWKo3/PP2EnVdk43x4sZiDB5UeU5JaRAUdbzBd/1GPpbIpS0qqwcXBpRHm0u
	AT3ijRV+ykxjqME6LXt1nK2iQnyfvh75lnyGALruaThjU14QeRfMYLPWdzABDmNS
	lSX6b/rMJ+9AbE69Oph74qE5bofZQbkd+JFIYwcy96NmPGuGwSpzBROIttg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7ynm8v4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 18:58:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516cadacf92so111837781cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 11:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779994707; x=1780599507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYL+Urw2JHqHhWlEtb/v/2zPyR0WLaQqmSD+Jj+rY1c=;
        b=W8Oy/KeWHNxBTIzB4uw7Oy5V0/aGrBlp1oVzk4vTZGnS6A5wfAY2EwP7cGW0y9G1zB
         YBWr1isgqbvH7dicpLZW2fTaUTe2JpQUeb/ocDxA4FZ+Qx9Uq9k6+D65IAv9XvBIL8sY
         uMmeSbnJLSW1BbxZVz3SOzcsNsQk6JXYRSvjx7vcj5sO2MNT1JqBEVfSeOL2uOCHEX0S
         VWQ+PB7FpLfbGFd7sZBG45HVTTsTdiZhmpBY/YFoiwEVZm+iN3FOTIjSb51aZ2uiOt21
         jzTOBKFxzSs0doprT0sCEaY4ZTsNPpkKBROihNR6Yb9ILvmnLC/WG/fWOCGLQ+weg/QC
         abVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779994707; x=1780599507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jYL+Urw2JHqHhWlEtb/v/2zPyR0WLaQqmSD+Jj+rY1c=;
        b=GvQ/p7vbtupsRQx9ZLjMmgvnjk3MSLr7qKzC50vFl7xliF3OdNJCt5MgsJPLArkJlf
         rH8t+NJqtz9flX7OS3twoftAjjnixGwdBfaIZt1IU7vPb6frE5N3H8PXonVipZhtDI7v
         exCh/Pfk+rd7iX36PVP+C2SgUyLe5IjbkYCwy6cJBq4PqX/yNEf3MeooLCGW7By2eo6u
         Y/S65GcKBG1zXOg9PyZm+86S2snH1AtA/Wz4Bl3W3iV55+TpW1qds0yTYTo8RCe2G6oN
         G82+DOli94anQfsPeBBFzHoYpm1DArN3IsWQXLqaARvMlcJzrlIdkl3G+oAqUFTf9GWz
         arMA==
X-Forwarded-Encrypted: i=1; AFNElJ86Lgkr5SnzpWrHoqTaGJXZtIT+uRx+6rXlyxFebUg7YwSj9MlwEuOXqcL0cmKL77LccH88FAsVfMHcXyCU@vger.kernel.org
X-Gm-Message-State: AOJu0YyuatvQyA0EPBGyKyKbPUpXjgVOfn2yaZDhlQeam54T9C97ACHn
	ty+dDLdMFBC79+owq5W2r8uSVud46d7fN1Nn0ZkADCqXfv3PBtCn+/Npext7hIm4qcva5XoP2kT
	XxE0RYw8P5XDVpxGD0aFwRuGXD5+NaLMwHQRsPxaZ9/mQD6mVQBsI8RLLDtSFydjz9BJB
X-Gm-Gg: Acq92OGMRKgpFf/Du4YOx0XWh0f1UKL687eTqCGWHgzPYlxO2J00vXn9x4nypC8wWRV
	4ptxGzVJdm8Ea36IAO9aLiYEulPwNY5K506H1D3KmYouOT7Onjou9bOyVBuoRqAnEPm3mgbBTTV
	/GgzhIfPvIJpS60TIPyu4gxvyuXG781E/EhhHbt13HWKZsXKaf1mIe6I9bNjtYFsbQnPfw3ehSr
	5jOOaXDgHUhi2Cd4MxQxDm9XvmfZd4DofpQ34CE35FzJthi7fPAaxK7hdiBDPlgNzUgeJwNOdeQ
	A/VwD/JvF615VcU+r3zggcDnH1fcszR1xsPeU+8+ET5mEi6jLiK8penoZ6YbeRo9K8tPgRGbO6z
	UlJV6TzEIqneQ892B5/oaE2/rOuMRf+W1AYqPJSGfCWCACkkNIOwG01x5qBSf9X8JpjZC/A==
X-Received: by 2002:a05:622a:40c4:b0:50f:b904:457 with SMTP id d75a77b69052e-5172cbd6423mr1002081cf.25.1779994707573;
        Thu, 28 May 2026 11:58:27 -0700 (PDT)
X-Received: by 2002:a05:622a:40c4:b0:50f:b904:457 with SMTP id d75a77b69052e-5172cbd6423mr1001741cf.25.1779994707084;
        Thu, 28 May 2026 11:58:27 -0700 (PDT)
Received: from debian (71.248.69.85.rev.sfr.net. [85.69.248.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49099feef7esm3107165e9.0.2026.05.28.11.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 11:58:25 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@oss.qualcomm.com, alexey.klimov@linaro.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ravi.hothi@oss.qualcomm.com,
        mathieu.poirier@linaro.org, andersson@kernel.org, kees@kernel.org,
        verhaegen@google.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 2/6] ASoC: qcom: q6apm: return error code to consumers on failures
Date: Thu, 28 May 2026 19:58:01 +0100
Message-ID: <20260528185806.6316-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260528185806.6316-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260528185806.6316-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tCvvlq_qGpKUzIAEnS6_9UQPHnBQrXV2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE5MSBTYWx0ZWRfX0xR40Y3kWoEs
 MyYlO/qd/HJLTD+AtvXskZoHPtbnsWej3iZDIXa78TxKgmCJv3PrBX513yO+4NObC0Nh8cAWe/N
 tAphCmLCUhfNYGgbj6kAlIQOfmSL2JYwjdA4kyWv2X4id+fRUVF1kx+vpPvxA+HMC4SS4OS5Qi8
 XGaaIDTk0CJ0bTwY6+gVOiO+FgeIcaQKA6v7qcx2R+kEMSR9CRRkJ/tSYoEeIHxRqUlm6b9zEQp
 lL0wddcRajD4OvmSXLZtU0eKmHdQv4gj8vRLCm01F/Shai4tQmS7UvfK1Q7UjKhDZ127yaQ6414
 LMheIzJNJDpDPoIX+a//t3IoIMfnEfyU6g4gvjYLNrWFgOkHiqCgOilZ3EY6NsY7s8+5rcIAx3H
 iffWgFVBoUVb9/4xhEbjnS0qf1/f3rhgwu84F+FyEvIMGp2OPRhuwlLkP/EZjKxa4QyYlxjfD8v
 mlpLnZSnvQDSuzyF//g==
X-Proofpoint-ORIG-GUID: tCvvlq_qGpKUzIAEnS6_9UQPHnBQrXV2
X-Authority-Analysis: v=2.4 cv=Eo7iaycA c=1 sm=1 tr=0 ts=6a189054 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=hLrqdhl2Yb02WBc7oxehMg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Kj_hsjq-VXR9WAeqRSUA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280191
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,oss.qualcomm.com,linaro.org,kernel.org,google.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-110172-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DFF115F6D1F
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
2.53.0


