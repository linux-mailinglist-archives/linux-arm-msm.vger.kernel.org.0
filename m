Return-Path: <linux-arm-msm+bounces-108508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAgHBWFjDGp8gwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:19:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7C057F741
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:19:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2DBCB3005659
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8116E4CA260;
	Tue, 19 May 2026 13:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f1ON02rr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ckIh+6Ew"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670F64C9010
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779196535; cv=none; b=YBcq+F10X4XlPVM2QYXa4x86a2ygeh0/3skknalcjjXZ9LBosFX0Mt8txldAiZpiCXTBpfnyA/LQsy3HxXnRH+HcTQfLvZ64nxWDfP8OPSjTXKh+oPvnvXSu7qKf8MoC8uaA0Xn/blLiZFSogGEVqOm1CcVgajD1Ns9QK8V/5uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779196535; c=relaxed/simple;
	bh=K/hVO6qPHgKUGTSudx4uDg+YCovP5hpQlsKCypYbQ1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kphu1ZRc2OLAbQEJL9J3pdgLCRmdl5vCsZddzAaZiIY7ar2SXAX3if9wLhVed5wmM4tB1s5EmKB5S5eIEP6p7NGNZdNA2P4fnn1vAz2VbjEGIuL73WZ+tDSkD6qTo2DHmzCQx24SgpO2LkLDqh5+/ywgKkIStXpfgmKuqKWsaU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f1ON02rr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ckIh+6Ew; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JCTJrU1737169
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:15:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0yq9S2r8Arp
	oCxn5kQzyttucSExAujLx06AGO3snZjs=; b=f1ON02rrSqP7FX1ciEogJIv0IJr
	CfSiJD3jynepNykVBF3YxXnoGnqybrL9coIsHPE2/kzbRNI7OGzL6DP6o4VSWWuR
	0QmUZrYOFeaOiJ4qZ5bGYv2F+j70VFDRMymkYvfJ3+UBF6maFsMe1jgX5OK0m8xW
	f40gTmvfhxUGGbmAzMJzU+Gy4DryRvPw9oVxN8qebXs6ZKQW52WXndF7rTVf3RZZ
	Bi2kQLGvlL0OgfGXKjGZ80qbc+yHhutZ/H23l4BmSZncnI8T9pEqdNiO6w7Px2CB
	tbCT1ywTZlUlRc/8ZUBJaT0PmDNxQlFOEwkP5A6K5v9VdHMg0NB2M1EPQMg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ju91j4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:15:32 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56f6ef62af1so9981688e0c.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779196532; x=1779801332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0yq9S2r8ArpoCxn5kQzyttucSExAujLx06AGO3snZjs=;
        b=ckIh+6Ewx/l6PToOr5Aa367R5k8BReAF8p2itYQq1oYxRdhxEVmeuti/bmXWVVOKcS
         Qlg5bxpOs+kF7UKrPwSyc5fGhVcWhF91VObzId/pliANQTTmMEtpseHNmUgYnD5qX51R
         wttNEqoF/rXcx58IeFEYoh+AOAf+qoEmhVhRdOTzbqtoqtTKUNSbmQKdP//RX+IYsGFv
         lDzcmFAkJ9L6zfkQi7LdstA2zIyy8ejWWWKhjiEFIvbEqE8SdKHtPo74VNzDbMxlJxZi
         u+cNm5mkhj534ru35Gc0TpqUeXKLYjhAInfBRlt0uGAfEWHT3gRPTCjB/dK+8d+xi7NY
         yHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196532; x=1779801332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0yq9S2r8ArpoCxn5kQzyttucSExAujLx06AGO3snZjs=;
        b=nR0BK5st2ZticMmpRCSV+NA1lV7KoXuZ96GcmkblW/xsTI7VLNA8F2MoNFXR3sCedZ
         jbyY/eycSNf7ZU0UW11vMxiWaCBkmDRMx5Qb6FD+oAeAxy5V/vy/m7OcBGR8fo/o5w2r
         RUSuZ+euzqQlTG30lEXIKpB77I0KCBTl27LjolILr1mGx6fm/yIsCunZupP/7gP2rQVm
         nrd4kZWx+FbDGZOXckkZUoEoKpEdfXNPUf4iEhn+KirDxynvyp9O+I4KFg+PIEQRsN6a
         Zey8yDs9/PSaRf1ulaQHzel1q4Bw2BVomFNN3furxHLvg7KGlqCCUKT3SMDp+nt0/eVm
         7WNA==
X-Forwarded-Encrypted: i=1; AFNElJ8bDNN++kWhn3pK5rrxbsrLnMK0kUYlKuUDuVDK18vclBUfxcUsG9yHj8ug4BdOrzBTgany1SjlQZVykRGF@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6Oj+zRK+f7OniYuaWCoFz78OY6qiiI2/fninpxedpTNyaMu3/
	UchXaPXRQPs8nh6TbYrma1h+S2CF1CzwUjXs/ZKYsRr5o4Dz4MtGCVr44GNrT8BnLl+B0lHh+VL
	TuCdHVulQhBHSUpE5mpfSMpkMFzAPKf7M9KJNWEIGwt7dFz0wYX9kPv54/7bTJ2spRN+o
X-Gm-Gg: Acq92OEoGacXX+mAiSchTXbkn+DU7yEZrsreOkknug2lc1/nP0Gz489BTLbziSSzkmE
	BkmaHUXro6GTx4k8pY/37dogAL6o5LY4DVFeEjk0JACEzMRu9MOffP6r3nHKE2iJm9B0biuWQk7
	PbJDx898VqzAqZZY8kadZJW11EgvCt7wLsxiNuDhY7uNLFNcwN0gdnoTs8UHLSYlHZe2UnOLBc2
	t+GMOhJI5EFX7B5oRq6vgol4C6/XdHdlge8HNSH23hRQeEVmlsPC3mmK2/pc7ZgouUw3pCws3yu
	7cHW6p+PUwLDPSza4ky8GEpsAWM/5Ock5RAZbp+Rwj3m7WseCbpC4eSSVcLfEH5xHzm0MGD+msc
	CMghohhCH8X7kszGzJKm7TJvULj8QNUlk5cd2EBJkZju9zpLPN4UOfrc=
X-Received: by 2002:a05:6122:4d0d:b0:56e:e80c:bb25 with SMTP id 71dfb90a1353d-5760c0a673cmr10979867e0c.13.1779196531858;
        Tue, 19 May 2026 06:15:31 -0700 (PDT)
X-Received: by 2002:a05:6122:4d0d:b0:56e:e80c:bb25 with SMTP id 71dfb90a1353d-5760c0a673cmr10979779e0c.13.1779196531415;
        Tue, 19 May 2026 06:15:31 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm48018609f8f.23.2026.05.19.06.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:15:30 -0700 (PDT)
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
Subject: [PATCH 1/6] ASoC: qcom: audioreach: use cached shared memory module IID
Date: Tue, 19 May 2026 13:15:22 +0000
Message-ID: <20260519131527.4002526-2-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: -SBFIyWHZiLqmnFZmLtymqW2TxOoF3aI
X-Authority-Analysis: v=2.4 cv=eeUNubEH c=1 sm=1 tr=0 ts=6a0c6274 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=IKYrml1x1okdUiGWNaYA:9 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMSBTYWx0ZWRfX1JgMG0nt8xcB
 vnP9fhsmlUzXFsPITKThin+EjQ7Eo783Vggluw4QgFY5/oURAenbXvkgwrY7rguITyUSgPbtIA4
 h07wdISQBR69Tmfimcl4eSKy/ie/SgXN1TDpSRD2lMkJ0is3NZ6BKKwTbtXDZq84NPhhGeha7g2
 kPtyFz1OKQlrRU4FC0rJwnXQUpQ900/BO25wrEF/RpIKJ78SuZttU6wNb872K9A1BX9LAv9JrUk
 ZjhKqKVL9AU+ycMM+2KNLgcUEjqbMKUQrEYuaCMSw4mhOtVwPIJaGHgHtnyqG3UUww9mvJhLiHs
 X20Abrt/KgPQAdPkV/9J5H1tS6Oiqg32jlUrrNmvcYhVFlsM5aBFM02EfSYCM3qcGERJwUZxkyt
 Z4nQ3DOJxrS9nCJXYerR2dJJQUtJw1qLdFvO3p+7+CvTxu0KCsUUaYWPlnLa8hGujRn7LvWCyuL
 ERGJyn5vQMSBkw7TOTA==
X-Proofpoint-ORIG-GUID: -SBFIyWHZiLqmnFZmLtymqW2TxOoF3aI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190131
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
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,linaro.org,google.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108508-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7E7C057F741
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
2.47.3


