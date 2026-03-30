Return-Path: <linux-arm-msm+bounces-100686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEW1OZA0ymnn6QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:30:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAEF3572B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:30:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CFF7D304FF8F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 08:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88D53AD50B;
	Mon, 30 Mar 2026 08:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S4PbbO4a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cXrpcbcd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3E33ACEEC
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858902; cv=none; b=gp0FugFF+2wgfT0Hfh7DQj6jnsYTfIjbrwK6dWNFd7/LQgGcgXcKCWhLTqcvnar3WqlIRiA1Q0XpRuFXUuboHz9oNYT4dfPvqT69YoXbAOW84fNfIs0/abaapikmj4+xUYVc87XsB9+dA3eM+3dF+lmhuljWol0POpB9BT0jI8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858902; c=relaxed/simple;
	bh=BssiN8tl0qU1iQXG8+lB5lBZKyz1PiocGJtwp+eWGEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i6PeElAmIu6ceKw17gtgT/63UuZNoVHmLQDgMcnTJjxamjRxhMobcp1jdUFKz9WShi6RLXYykNqH7QxtCTDpA778eIGhiykN/b+7pWHtLhK1x6y1h1oDlfd8yYWFQZAq6rkm+qfMG5i5MQiIvNjRJ7fHmAm3C51oq7BGD4iGdSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S4PbbO4a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cXrpcbcd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U3NnuY1974830
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eSDnacEmZXI
	09UfS9vabkH7g9erGJLEY42mHV3XwiZ8=; b=S4PbbO4amhIVk0MU668ofluRjRu
	BnIk6RoHSZWFrF0RjJ2k8e+mBM70fnL64uTC1bDlgZudW9UQopH5EVG0pByj7TPa
	O7xAr9f58gzKLyQlNtpPCt8XgZXUmgD46nYaxKen5x/O0k8y9DbtmbCWszJgynHH
	PQKVZlvadTeWvxZ+XOy/BRBoqZqXlX4Uu9l4ZAsgCv6qYsa9epIFpN5UHAhArAuV
	rdXBn6EJy102IoE0hF0CnPGigECI2MgE1KlsPSYg7a3qh6EaB9VBXOs/7sKbpzUo
	xkxchu50O+S2kOkswhqiCc8MDKTXE4CXnqskFrSndyrmsFuZAXja/67O13A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6ufmk8qg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:21:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5091782ab06so223016271cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 01:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774858899; x=1775463699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSDnacEmZXI09UfS9vabkH7g9erGJLEY42mHV3XwiZ8=;
        b=cXrpcbcd/Aeg57NorRxGviXiIzyX54NhQvzli4vxMoYz2462fn5Qf5V8yAC/KJXThr
         dVASP9+s+qWXxR6isJMs9lLEqkyxmOsgjl8BikWwWSmH3R602QDZkp+eiOSQqMsQKfaL
         spb0x3GVVX9tuOi+P+EnZsUsbvTpb6GqyAS10WunXuG2TL+CIgnlcK7MxIF5albNrOC2
         7fwascp2XAlMfSs1/PRUGOLZK96EocL3YW0oqK6TAgN86Nfhq+bvQigUz0eMTdpeRgzr
         m0ZpuG9gG4QFyPs3v2D/lbWiI2cMlzf6dmOCj7yJUPqycDQdbH+zSwjMS/gn75LB6wbN
         bDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774858899; x=1775463699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eSDnacEmZXI09UfS9vabkH7g9erGJLEY42mHV3XwiZ8=;
        b=W17Rr4oOC92e5M8cPqHbaoUq0Gs6e3dbNumeVMFoZoLpZTouuGIuMxEIauT8BYXb+Z
         +RIVW/3zKCirJFhvkkg40/gCRRNpMgjAIU5GhwEzUjL1ueenvpMOrjbDeo0XTlxah6Lw
         DRVWlZrXhB3hItt/khWKfxmGwRKHRON7t0CAfPExPDZkeW8ulX1q3/WVJuAWX1L8kVyx
         HxSSag68UhtKlDvhEfhZEZU4HUES8JA8iPUmjlyn/qsGdd7XiWNFkTiUoQxST8q6rwfh
         cpqUBMBpuTXh4YaRUjuKYiTkeQ5GdzaBIxwBD/OEQbBty+PMg/8vtwR3jPwpFQmfZ7I1
         nAWA==
X-Forwarded-Encrypted: i=1; AJvYcCVSwAtzDWDk9nPgI/aKcSMSRnVJR/mSbPQIIOuNwtNOOMll7pe7ZQc712HBa4u+/WmchAQI5K4Ss0EYEiX1@vger.kernel.org
X-Gm-Message-State: AOJu0YyPJTUss2UkinkOcH5bE/yPQvg1H/1HskEt32NGgQtthN0IbarK
	gRAuWMZ3U456NyBcBjRAhYRSdsdJYZzzJzV0Ja833QqSCVOIp1exCqlHYXFvs5j57dJ6K4ewMmq
	4/X2vBGnMLT027nyTMxty9v/xTCuyH6n0xOcsVqW2XCCGL7y9iIdXXXvMiuKhlEJcbe48
X-Gm-Gg: ATEYQzx+0zS94BNBVvLOqm0aMWP1gM7PgED6hU9kvqszioRYyi3RVmYWx5legUJAtb7
	KK2ICZTzlINFsAkTYeiCAZWu5iXM1DUmmlJ58VxaPKJV0Xd110HaKAlA+SG12wqiK4Q2T5fWoPZ
	5muYjunpl4J21wDWS8zAOCYyVnM5DSRN8v842QEYxy5uPAAzDqT+NVwvRTaw2N/+4JqpjKMcIup
	mmmHMlLrujMVhAgUhYnj4WFQJRdygelmP97VYnLrjR1MAphsOxs6rdUSfM17gf7jG6ChhmrMhR/
	tzZL80eOAW5pJxLcsnrg6IvzMcthWcx12fUIqOn4vmLucY0utGo0FZ2NUFhTkvhLfPyJUaG7wvs
	WGAmBnkEcHic1Lv2ryKKDaAnN5wfmACU8xUgMo3+OeHMERDaFeKt/h4Q=
X-Received: by 2002:a05:622a:53:b0:50b:2eee:4b3c with SMTP id d75a77b69052e-50ba37d1909mr165999701cf.15.1774858898705;
        Mon, 30 Mar 2026 01:21:38 -0700 (PDT)
X-Received: by 2002:a05:622a:53:b0:50b:2eee:4b3c with SMTP id d75a77b69052e-50ba37d1909mr165999531cf.15.1774858898299;
        Mon, 30 Mar 2026 01:21:38 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf1db08e6sm26244773f8f.0.2026.03.30.01.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:21:37 -0700 (PDT)
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
Subject: [PATCH v8 02/13] ASoC: qcom: q6apm: remove child devices when apm is removed
Date: Mon, 30 Mar 2026 08:20:54 +0000
Message-ID: <20260330082105.278055-3-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2NSBTYWx0ZWRfXwvTc/MFkSE+K
 Wtzv+/pnb6cifR+jeg8uaCW2mB+LOIFbAlopNKcfYkSuQWyO8z5g/jx6v0QH67SxMKItcD9LFq9
 1Ny5kbiqr6lFDAlhq+3D0Vrr6bqEXJde4EH9fVfy7qtbZBIiVvi9Nnzzrlq6J0oQi0om3iLSW3Q
 Nbuvg0zOEoKWTN3yscFMvy96ars8HfHjFpcD8rMj2Wv5UEstaVdObbQ47I2PZqDohrFs6BC+E3P
 xHmNAEn97K/o+p7GBK2NVexosrL/VKEAsKLIYAuUb1v29wTa3nDI8BYXoU0GeMQ1fy50RauflbS
 sB994KQYUABQEsQc89BC9MkyOksFixOPgFmfSgL6eAiWoIe4uOUyD3H2QpxrFyAOIJEWqhjwk3F
 cxbsZ2DYFnTefiQQ/DTI0LkvA5a3Y3Ol2bLsNrPUWqHhiJbGFvtZiZtLUBRL8k0SYsN+J/NG2sr
 lWY5SOBwu4OEyU5z62g==
X-Authority-Analysis: v=2.4 cv=aOT9aL9m c=1 sm=1 tr=0 ts=69ca3294 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=WbEMVPVtDBSXEMPt_8MA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: VmYxMHeqcshC9trdsIHSa-qYOMSBXkWq
X-Proofpoint-GUID: VmYxMHeqcshC9trdsIHSa-qYOMSBXkWq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300065
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
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100686-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4FAEF3572B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

looks like q6apm driver does not remove the child driver q6apm-dai and
q6apm-bedais when the this driver is removed.

Fix this by depopulating them in remove callback.

With this change when the dsp is shutdown all the devices associated with
q6apm will now be removed.

Fixes: 5477518b8a0e ("ASoC: qdsp6: audioreach: add q6apm support")
Cc: <Stable@vger.kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 069048db5367..2dc525c8be42 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -762,6 +762,7 @@ static int apm_probe(gpr_device_t *gdev)
 
 static void apm_remove(gpr_device_t *gdev)
 {
+	of_platform_depopulate(&gdev->dev);
 	snd_soc_unregister_component(&gdev->dev);
 }
 
-- 
2.47.3


