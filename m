Return-Path: <linux-arm-msm+bounces-110171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMlhNdiQGGr9lAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 21:00:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 568315F6CBE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 21:00:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1833311F8F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 18:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EACF330B07;
	Thu, 28 May 2026 18:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MxtYe28c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IFMY6UtJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2BB330B3B
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 18:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779994707; cv=none; b=pSJazlPTKyOby0MEF4oKZdDgSH6vgsYj0CWwsQ6chCJ1jO9sM9z+EGJwWoQ8H2APeF7cDELjAEUwAX3lJCDLMj1F0cZpHxq79Qk6sGOXeuT23vM1qoY4CE3Nbm3VRtaluY3VlYNSZrWcPHpmDo8l3CYqJ8nQ8+459+DMviuf1jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779994707; c=relaxed/simple;
	bh=3uufymgDjrfmRs+0w3ITYF149b9XqCSZt0eWOf3mE9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uwU5Crx8UuJrvqnsHY1qFTMx3flfWmcjC2QzUYAFWS9+N4yfJyQdWRtxel00R6NI95AanLK9rZhSImD9J6CgbLIQCSvAANhw8R4lEMD1eZYv6PB6d4G8Oi6V+6xCCrBW+pcFtmYIDNjht90g59SpIwLrqE9hHAojPkFUvAe6PNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MxtYe28c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IFMY6UtJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SIOQgV1064605
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 18:58:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ro7jAEZHtS1
	9BWp9r4OxQrpxP6WVAcio2xbYmtk4Pwo=; b=MxtYe28cwv0zkdGPJEsb6qzPoD+
	8z5CeY7J/zsfkKhIpIGl737rqTgc8Bcbz0Bv18GaLGzsaQYVh9lBh4fEi2vYRuWK
	sUCSjd6lTiDcMu5h0eE3hztsJ8+FHQESGn8RR6kap5qD0xsHgzltXScuIJUg+kLm
	nMN9bK8uBgJvhDatMg7hBt3Dk6uC0U9ADkBAOsd+Z2Xz9PSrh172ooWpRgseBO7F
	p9U573SOKtzOd2IopcqFZYLgkONp1a8u031pbKIY9EjSo1OaY5Pmrre50T9a/lbo
	SC1Je813XJXZZpvMKDpzklSEUp00IGUhHjxBr1ZCXeRGW5pX6zaohHCvcog==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety5r487-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 18:58:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516458449d4so1091221cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 11:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779994705; x=1780599505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ro7jAEZHtS19BWp9r4OxQrpxP6WVAcio2xbYmtk4Pwo=;
        b=IFMY6UtJdynUBzu4EpbggxNvZUvnwEK5t70dpAsz7mLMkkdmojAJum52UFB5o2zAHP
         XalbiFWe2WtTzNuPhE3lgOK+u/AM9uGxeo2WUsQ6cPTkIP7k9281uHdyJlIerScclUkq
         M20CXlh+RaUO/CsEOeXTFEsAtTerNh2+xCZxUHsO9gQkLVBT/mxwLHuitetaiNJZeZg+
         l1eE7rFDI//JApBy+Yu/67n7bTqgYqKULvPufMB9ecTIZaYx/MOoehP4QHXeUqu6SFEU
         xgJm4+LDUjBYQhmAu2QvfAl2rWFd76Q/lQhrCW2EKzKekZi6XoguA9qXM/UotSv2Z6Gx
         8yCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779994705; x=1780599505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ro7jAEZHtS19BWp9r4OxQrpxP6WVAcio2xbYmtk4Pwo=;
        b=iBw51j35KC86xLbYxWTKPfvVFoA3QOsgs1yI0KnjuIcPy0TE2am8DqdktElTtahBEX
         YzguilOU0AQaYFn11fCQ/w8V2zyXLxr6IG+xvyKmVIOtHgnKLi0IFsgxGz7EwGKCPD4R
         aLq1XolYpsWeZThwehFt7WmubnhgBfUAz/YCHivh4Mw18O7HzzhxgE9HM+9wRpw+G6lS
         ByuyoTrazxRXPVolYqMKNNN+PaMmApIyxo559tlG9fP5eu7O5FmwjZc5zBuQJF2T3Qks
         S4KollW8o7kb0Tk9vS2AtHFFnPB0vuRh9Q/7crMfRCdmGwGh5pPqT4OiFQXI8t8pVeGY
         fdog==
X-Forwarded-Encrypted: i=1; AFNElJ+DHQzDT0jdptT9dbZww0Z3K5nnvsllaabRoVJA1olIeTV8FU7ql09eM4a5KbL76FpeX4/06+vqshXSkVw0@vger.kernel.org
X-Gm-Message-State: AOJu0YxS0foDsQj4z9wAoAEMvFBXjbWwv18Kn6u865ABTaXfMR0z9785
	6eLpFm/caDKoLUgIQoltzM+cu5kNVdQaU9qYqVxugmTBXWn+cAhAW1bPlM73xaU5frIE2eQcpNR
	mGWWUOVJKRgnpP0EbaqWx3HCSGj87xjajgXmPwq3MCUTQd71/oRzII1QBlZLxvbpKH8X8
X-Gm-Gg: Acq92OFQ7II6sCYmAAmDIaPzpXe7dS3woRprLBHMp512WB07s+WZfsBvFGH+GMjwVZB
	eGLQLNz6sHmOZgMmRXBSJ3Xv1ODPzykG9CRlIt5QqYUQcfFXleAtunRYgwERcSb1S2guVVya0QO
	8p3xf76qBft8I8ShGK68jdQ2pbYYKDJrLf6+/REiAWYkzvueE5CYa0iUxDOxOT3HruzQ0WACOaJ
	HVSmgbgW6FVWS8ucJTOWcQaP5HvU7bupZHIfGGCKzi8U42Y6qUbsbdsfGaY1SFfoma9WiCUvtjZ
	IWUqrKp0WJO47+6AKR5+xjTt6Z4q/PmSYHiHDOvWXzJ1QiIPnOXpn3qy2rBItn/qkhx20FzkvZp
	habnP8payq/2OYzbG0xqGYLThh2a1pP3OF730zSpvH4S7SLNxvV6bsSbtGn8qvOvFaDkrxg==
X-Received: by 2002:ac8:5808:0:b0:509:3940:30ea with SMTP id d75a77b69052e-5172ce1899emr239931cf.55.1779994704842;
        Thu, 28 May 2026 11:58:24 -0700 (PDT)
X-Received: by 2002:ac8:5808:0:b0:509:3940:30ea with SMTP id d75a77b69052e-5172ce1899emr239521cf.55.1779994704324;
        Thu, 28 May 2026 11:58:24 -0700 (PDT)
Received: from debian (71.248.69.85.rev.sfr.net. [85.69.248.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49099feef7esm3107165e9.0.2026.05.28.11.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 11:58:22 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@oss.qualcomm.com, alexey.klimov@linaro.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ravi.hothi@oss.qualcomm.com,
        mathieu.poirier@linaro.org, andersson@kernel.org, kees@kernel.org,
        verhaegen@google.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 1/6] ASoC: qcom: audioreach: use cached shared memory module IID
Date: Thu, 28 May 2026 19:58:00 +0100
Message-ID: <20260528185806.6316-2-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 8YkAn5watFDADHIiXKDkPKTsSNUm1Jpb
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a189051 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=hLrqdhl2Yb02WBc7oxehMg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=IKYrml1x1okdUiGWNaYA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 8YkAn5watFDADHIiXKDkPKTsSNUm1Jpb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE5MSBTYWx0ZWRfXyLEGyYjhuWa2
 MhUlFadwUbUWQFGdHELMzJ2UKT0mq/oxE6Jb44E1QgaUK80If8gFmimZE6ffLBYfwc8v5Qdw8fL
 77Ln3v/qCPnzB2nwaGtW/YzUo8YSV4lsMJgeNiLk6HX4ebBjrf/b5IyEotxETY43W28tQ8iuTo1
 G+pcF7BydXwXKk8RjKgSneLM4am2C6EvkX9aWVA/FGdIxnlEwMxzAh+Zj1zG9WlR9s1n+U989BH
 0hybANA8R2/MDT31fMgQN/dcLbObbjzffrT/7hd4TQEXWEoA1PMMvv+LPnfpqLlvLfxFWiHfEF3
 zB3JVbFmrLmEwc4dSnaz+eyhZdCoh9dmkVGPht7M93r1fzqJ4h4Kc1P/rD2oIm9FEZe2O7gwBf5
 nMMHSuVCJppAHf+uo/y/G2cFD62EW9KWhaf4fSJNOjeV9NojnxSg9S1affbnSSLEtldF2OX4IZ7
 ld8tGUAcjlV0XN3gJ0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605280191
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,oss.qualcomm.com,linaro.org,kernel.org,google.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-110171-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 568315F6CBE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

audioreach currently calls q6apm_graph_get_rx_shmem_module_iid() to get
the shared memory module IID.

The graph already caches this value in graph->shm_iid, so use it directly
in audioreach_compr_set_param() and audioreach_shared_memory_send_eos().
This prepares for removing the helper in a later patch.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index a13f753eff98..5b73f1d81c9b 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -955,7 +955,7 @@ int audioreach_compr_set_param(struct q6apm_graph *graph,
 	struct media_format *header;
 	int rc;
 	void *p;
-	int iid = q6apm_graph_get_rx_shmem_module_iid(graph);
+	int iid = graph->shm_iid;
 	int payload_size = sizeof(struct apm_sh_module_media_fmt_cmd);
 
 	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_cmd_pkt(payload_size,
@@ -1404,7 +1404,7 @@ EXPORT_SYMBOL_GPL(audioreach_graph_free_buf);
 int audioreach_shared_memory_send_eos(struct q6apm_graph *graph)
 {
 	struct data_cmd_wr_sh_mem_ep_eos *eos;
-	int iid = q6apm_graph_get_rx_shmem_module_iid(graph);
+	int iid = graph->shm_iid;
 	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_cmd_pkt(sizeof(*eos),
 					DATA_CMD_WR_SH_MEM_EP_EOS, 0, graph->port->id, iid);
 	if (IS_ERR(pkt))
-- 
2.53.0


