Return-Path: <linux-arm-msm+bounces-99748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oD1zMVQLw2lKnwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 23:08:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 279BC31D21D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 23:08:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFB3131471E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 22:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9293B19BC;
	Tue, 24 Mar 2026 22:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fJAPU+pY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dSShO2zf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3CD35F5E6
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774389928; cv=none; b=Dfc/4AUWulZoUt1MTc0zv/K2OR65Clnvhfob9Ua+ZbOIg1/hjkvYGRnFm/EHv6oKPeADKEF7QXjSJC+FeTEb/KtffkZk2mz6nJwbX+Eg0sBJCdl4TA+LOR6pg85cRgXTUpbywVYRQB0EUNV2Ypy9yGojhXC39JszmhW9jrnFlUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774389928; c=relaxed/simple;
	bh=lsZonjfjzJKT7+6ydomCeBM7wv6iUepBNlIAI3o4Q+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KVdBy8t1XBQ7PBsdiC42dQ10WEcRYeCapgNIA0lH4BxrZsyGTrxlS+mfiCh7pmGoHH/eReU8prekINT8HN+dDg1yY+JzYysR1kqT90Kt68OmKKpSgTE2/wpF2GSWDLjWycWU5XsJ4Q794EvshudwFLlRbGbWom2cZJ/EVDxr2jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fJAPU+pY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dSShO2zf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCtsB2807986
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:05:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IF7sm6F9k2U6hKgZiGl+W/MIYZz3asqaIEZ
	HCpg7snA=; b=fJAPU+pY/CmU0q85qCBPCNS3vAhNPTZqhzGSNkY1LXGwSwvYkRV
	bY2Wo295vdqSqpspOWVhFsZZ/4RON+4FFJu6YBnWKNg84NNGsfXepHMSRIGl9ICt
	iAtEsW3qxpKLh1YPNYFmTGqAYpxIumrOvoiSNu1kZckP3t8LI0zvKVHprVpvE/BE
	R+DcTJ4zsvFa5qGcypysrAj/NqBimRZm3GNN+S2TZ+UX61wjYhxdtIipWs++Ge6e
	30x8VgSnMiHUZPQEw1C4o4gJnMj2g7ZYy/eik/cQc0W7YGez/sUHXxg3ZIljSfmh
	1YBqFMjAzvhCEOA2ThIFiDT9vsE0690DHXA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3t9ej8p8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:05:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b05d170cadso65288645ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 15:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774389926; x=1774994726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IF7sm6F9k2U6hKgZiGl+W/MIYZz3asqaIEZHCpg7snA=;
        b=dSShO2zfIdueFCF/5xOf4x0vG0tQKKhym3WIias1fca/Abt9TkSJ5WE+6G9iZijEjQ
         gUIVPHxcvshZDgvYg/5GzNS7iALo0JgIkuSQjLjzWcUgyhT9fpafYoFx9x21j/XwEaP2
         FMfQMK13JIsTVCewZGACh96VLEDtXCaH4SZaQ2BmywLN/ryJKzFVai5t2/gk3iqxqGHI
         hUx1OWDFw0LBtOLtSyV6oVtlXizgi2AnY/0h3Lu/XN1FQrDmpb3TM7bZxzwCdHklsfmj
         DS35G04h0CY88hosnovszcXNi+2nxn+8EU2Za2sBz47eYROVK9iPQXE5FQQzxfMwHOou
         MNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774389926; x=1774994726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IF7sm6F9k2U6hKgZiGl+W/MIYZz3asqaIEZHCpg7snA=;
        b=Hlslshk9NHPmML0Jp2djEPusORnRS5T/VWL6KKT4sk0fuTQ2ZjWZRLyPIzpLPHC9fO
         3zkLtwnnq+mu0ybwcTAwrfrohFsmLRD7wCIIc17KY+flF3Z1qLLSe0SB/cMq0w532ULN
         SZgyUZ/wmYoNnsErGn1mnhxxgfYEl68CtdaOwHGyREITbDaJSig2c5h20L8lM1xAGUFV
         xrIdkCu4d4zlHGDyxsclggjpNiyur6kV7DV4qqATR4Wx5zcJhKtOP3K5WkOUr/Up6ir0
         HYkp+cRMMMaYWYVl93tU1/WqmiZ0Feau18QXkh0/0rKduDPhFcfTHSfEO4enjLyxQGKG
         9ioA==
X-Gm-Message-State: AOJu0Yz2C5Gtvo6yS9XiHNPPSF6vFeHMNYDE7euoY25fNRH/wnl9mLMO
	QKbyyCiZZ5KA1VKfNeBi8fkG1Xh+uivwBCKJeu8hUTfclRh87GSCK7PCa6qNsPgw0IBApJvUY4y
	gCVSqMEj4TIsyqqkcHagRTRf5T/BEtsFqmfgOMKHy/gd2CHKdw/QSWobmB7qSUa9VkgYV
X-Gm-Gg: ATEYQzxZYjvx+/XEzuQOLvTDHwC8BtknBfoDCq3WKNV7gbloT0w9FUgFoxnIQ6jDlcJ
	VO0rD3fHZQjm7Uezm4e8pbwt1QcfjF7btYDJF3B97HHZspGK0WGe5gZbgQHxdFz2IxaB3iRcxOq
	keKxa+ViWW0vjkqs67LaiYLNUAIRowOm0cqozWX2v14YfcKpINPzS7cC8kBL8I/6O5BwTBG2Zom
	rGT/JZAjO4QxvWksBr3oLNsBm6UDc8WblXviIkNi17zltQSO6+bZ1CP/NY1IomX/r0LFMKvHo5M
	Hv5nK70P8KSnnNh+H0o6JTr9kUACqMvZHsoDVCZwPfoREP95na1TC7ZB0TaUGH9UGaJ9kI1sP3U
	34gnQZmbV32ZE0DO1sCwf1eTYmWEVvFyS
X-Received: by 2002:a17:903:3808:b0:2b0:a957:302 with SMTP id d9443c01a7336-2b0b0a03c9emr11997505ad.20.1774389925312;
        Tue, 24 Mar 2026 15:05:25 -0700 (PDT)
X-Received: by 2002:a17:903:3808:b0:2b0:a957:302 with SMTP id d9443c01a7336-2b0b0a03c9emr11997335ad.20.1774389924853;
        Tue, 24 Mar 2026 15:05:24 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516400sm154973585ad.11.2026.03.24.15.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 15:05:24 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm: Disallow foreign mapping of _NO_SHARE
Date: Tue, 24 Mar 2026 15:05:17 -0700
Message-ID: <20260324220519.1221471-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: cKmBYVfAKdlejqUV7qrSM4quMIGOKWOm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE2OSBTYWx0ZWRfX9/qhgBwtApmF
 xo6JBsWO7VZTXvamkhhgiINky5HJ4XTY2KIj4Cg0GGyRNU4jy7ZlBGYMyVlGBZqaZiPsi9MHK/q
 8CH7w8SlqKC4lFbgolGKq3psUNGo+d+UmdNQ/j65B4RCh+7mdZJ7GDYKrmF8INgapjhYfVuqpB2
 i7+poHktPDC0p3QURc7oQhs9zYunzPbWEYqVXGfmFd7qGcHbk8fP2vlxzSX544wpTjthn9ZhFtn
 bOnVxWO8TtEv+cCMgqmGq2kXC/FShTYvBiePJExXKujYWH3ixc8alJucaV0LnaxGi0n445Xt5eT
 SSZf8Y6NsPZ/pvrXYLU9bgfNkSh8riUNSTdXWCbGL28LhzumLqZGIGV7L1fkPVwb/EJtkjFNyyn
 oE08yc8WgsZ8dAgRw6ijPzK/cZRP7y0Ar5slzeheqEg4s3uF+8ArHcwyM4MYPq9Z4UERp/fWgBe
 iWL8HZuYy0sfTQZqJRQ==
X-Authority-Analysis: v=2.4 cv=DdAaa/tW c=1 sm=1 tr=0 ts=69c30aa6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=rycHe8qCt1V8VBfbKgMA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: cKmBYVfAKdlejqUV7qrSM4quMIGOKWOm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240169
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-99748-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 279BC31D21D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This restriction applies to mapping of _NO_SHARE objs in the kms vm as
well as importing/exporting BOs.  Since the DPU has it's own VM, scanout
counts as "exporting" a BO from outside of it's host VM.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
v2: Fix issue with MAP_NULL

 drivers/gpu/drm/msm/msm_gem_vma.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 1c6b0920c0d8..43d61e0919bd 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -373,6 +373,12 @@ msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
 	struct msm_gem_vma *vma;
 	int ret;
 
+	/* _NO_SHARE objs cannot be mapped outside of their "host" vm: */
+	if (obj && (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE) &&
+	    GEM_WARN_ON(obj->resv != drm_gpuvm_resv(gpuvm))) {
+		return ERR_PTR(-EINVAL);
+	}
+
 	drm_gpuvm_resv_assert_held(&vm->base);
 
 	vma = kzalloc(sizeof(*vma), GFP_KERNEL);
-- 
2.53.0


