Return-Path: <linux-arm-msm+bounces-98007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDYcBV5NuGlHbwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 19:35:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC1829F1A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 19:35:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADE21304A166
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 18:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D83B3DEAF7;
	Mon, 16 Mar 2026 18:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NIeuQN3/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F9F9e8EK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EBC3DBD5A
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 18:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773686086; cv=none; b=haOmgy6pfXMYHnlb28/L9VEMIjCe1ci3BcNWrvE3m8Thm7lfIrQpDQVZI/WBN6HY8TqRZ2h18fe2zXSID9Z+rTRmxbCQyFBXXUbw6BaHRKBbVAD2dF4/LeBrful2K4+4oz3UI9ibQOcylrgXM9MQExFqHGC3WEEUUBC7XmYTo+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773686086; c=relaxed/simple;
	bh=DBq9pbfpUKTE1pS/7bkh2ti4lVqkDjgGftBV/tkqvys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MtSVmWiUWxkiK3EZyWGcK8t7I3VZBYWQmXkgtAsq7afeECAHgEe9et5VRI1jnpMq8XKCSOFXkX8gLHAkQkg3MRs69BoMGryhHn+kfmnddiYFnMwy7ViHj3LM35v14C1geXnM5DFw0GSes8jTkWxVcieooesfvxMUaOFFDRoCf00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NIeuQN3/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F9F9e8EK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GEgGUk3295924
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 18:34:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UhUoaqMDDgYxAD50EqOlz+T5/cx2aWxQ94W
	Q56aNaoE=; b=NIeuQN3//GmHLFATmu7wKxi00TLBPzjUocnjj7svOxztTcYGHPX
	8j2Uje6E2aVA5Wcvdblt0ZqWz8wv18gKnIFuTFLK+2cn6nKPJ1xR5rMI/AaO72xl
	wW+KrYaGoxRtfqPkbf+1iSsAJZjDdVvXBMi4t7HdfGIrYj1rc4tDVcVHWck7kp6I
	75FQHp8WDV+P44yR/Tkxo66DTLDIbQHHbJMVAtuTksj5Ig0E8bvuFcpAkMRvamrA
	k9Ymo/ct2j5vd11TLq8k3og+orRBnk2jUqYNyeFxdWyXfzDltA4Roptoul9789yc
	mXpjCOUTVmQMaG+PPDlefBbWM+zwh+xWjPg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxkuy0txc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 18:34:43 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82a18d37a91so2138751b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 11:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773686083; x=1774290883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UhUoaqMDDgYxAD50EqOlz+T5/cx2aWxQ94WQ56aNaoE=;
        b=F9F9e8EK7f0xDJ2Sje0tROj2cueL451ViVk0zN/NO72yPoDyz/SII5oyP0ewX1qfMK
         X6fNleJQigpr0z52P72HyUVfnNk8KlqP2/gQbIqD6HUSLXlfPM2y2zvonEZw/qDLEoZ3
         /4knat7R8NZjE1n/B62HkOzBnRQQXnl+tNbfxdL1NXTvXkShxRXNflwsKP3q6+6tsuFW
         bf8bAH1K2poGCXXSZC/4chXt9Ji+CIHlhhSFr5iOtkM3tYMbTRcHmcMnSsJ6X3NsYR+x
         y4WSzxi2Ij7hajdp3at2LxBZ5kq8gwazU9de4xkG5HKrthzV97MqPH+qx5S6VnVMGPTT
         s1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773686083; x=1774290883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UhUoaqMDDgYxAD50EqOlz+T5/cx2aWxQ94WQ56aNaoE=;
        b=BGgmx7KktvQ5mpFT5QDLJRgsgaESQ2H/YVYsbKzxvZt4bvaE6r8l8h5hjORKYX/iJm
         AZ6HkqnMkv/BMGSJqAwN9Vaa4FmquHsa4q6QbGRzr1fAeO8JtNMcac6mOpqGZZ9Amh5i
         cyOioJzAWTx66rhwAyCyr6H4D4efoF3cVKAoSKUYRORiamoFPKOGT85Fk9l/mJloK8Wa
         lgK6tJTWQ9aJtaL0c2GSB/1wYMCIOovAaJXgErHCiRL1n0b5ASyrUGAhcVObIbQecPqn
         USPXkwDrc6FVc/1SsRmXPWCTQXdH48f1sHGzsQcAHs0HHkFgeFhIxwUYNFmnQxh5gZlk
         uedQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4MmvwtK1yJuTYh2fygyHeVVx6Qbl6qykTpyR7i2zD3CCcit72lxkgBQo2bbZxx5rdd5zbJWqsQRtAhr+6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9oEw8DbjzLmjaJjj5ZhIt7aJoZN59NlPN1nNV/6ugrBkp8CSi
	OeGjvQnk0o4gwKDyiDAO0SPZMa7caUG3fP/m1OZX1G6mcGi9hU9YoWCFN4/6oqGK+aulzXOhUXV
	RvzS1ddRvokdHt3VBp2L7laxnqPEubiZZ5LsNoyKhJ1R0dY2PF/l5GpufiVjASju4BZEO
X-Gm-Gg: ATEYQzz8TaGKe0WUIn4myvTXvD0Vy1zbndWNhHpBrr7KkAwUDGcxTZagxdkb+Q2I760
	Y1hYcH10+ztXd7pJElDGfk6udxig1f7D0ugcWUN6QlG0R8ACsW4M4S1ZEiUQUB3Ge9YhIEpXyFM
	oy8mcLnUQIKi7WtrRPvKJ65E4FxHCb2GSp+kzCx06em59HSAG+46KMwhAR4y85XaEiHiDbkP3aJ
	xo6uUTuxOhRyyKrAEFYZBtz+vQWDMT2DiQk4aqlpGqcpCS4Bc/+lJct7YKV1+OAQMEq9GCGqTBD
	LL0BMsyortilyw/PuZLC9OBxQGS0Wo8fkw59kkKWdNNfLd0cvafrCaHzXp0X4k6xDqdqxTw35rR
	TIqkFz9gY7kqutDI9JRfX8qUHhZDb/CT9
X-Received: by 2002:a05:6a00:2e9a:b0:7e8:4398:b34f with SMTP id d2e1a72fcca58-82a198c6c3cmr14086607b3a.34.1773686082810;
        Mon, 16 Mar 2026 11:34:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e9a:b0:7e8:4398:b34f with SMTP id d2e1a72fcca58-82a198c6c3cmr14086585b3a.34.1773686082329;
        Mon, 16 Mar 2026 11:34:42 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0725da07sm14144189b3a.19.2026.03.16.11.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 11:34:41 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/2] drm/msm/adreno: Update GPU name format
Date: Mon, 16 Mar 2026 11:34:32 -0700
Message-ID: <20260316183436.671482-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=br1BxUai c=1 sm=1 tr=0 ts=69b84d43 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=QRM-0k98RqYhvG7qax8A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE0NyBTYWx0ZWRfX1ai+W9MhKo9R
 Wy2vJWRUCOUJy5rlhxfmXScad8eMz5G/IVqdjEr8+MW8U2WL/K/p/4QmCm5ClPIYjrkFe3hP/Gp
 awCdgnyVvtGBV8RYPYZhEgkcGO2NMHEKlhK5Jg3oOdG8i7dhsU5KuQLvY/b/u962GaSqRrMML5f
 IsV+1T6Lxr2UqLAYtqrZ1FcMPhvWUc5ptknovlQk6R9b2cpEINseXfpRS0D5m+zS257fIrWsVrV
 3tXxU4uNP+QPGxQCWEaEmxAh/bsly1J1eyzbgxPZ9+npff8hXBFGcB1Q/bzqNySrnRqKQ70AYhk
 QllTt5uS5fJda5ER7FjMtIXz8pxYO7iSey/U5Z21QByEm2N/msYzeK0uRR/ZYyPL4j1xTx3KN5L
 whZY2IxBniifxypUYb6W2aJJhQIIAx5S9hIgJNXw2O/JEeUmBVDMtTBPbeByw0fhSk9/3nvMHzI
 I3H7LpgMJKsD6zj7iSw==
X-Proofpoint-ORIG-GUID: v2NamoY3z2rxn8IIV1ZRBJbJebcaMycZ
X-Proofpoint-GUID: v2NamoY3z2rxn8IIV1ZRBJbJebcaMycZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_05,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160147
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
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,linux.dev,gmail.com,kernel.org,somainline.org,poorly.run,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-98007-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8EC1829F1A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The "ipv4 style" of formatting the chip_id is less useful after a740
with the new chip_id format.  Rather than doing dec->hex conversion in
my head, just switch to using %08x, which is still easy enough to read
for the old scheme.

Also, for a8xx update the name after patching in the slice-count.

This series only changes things for kernel dmesg.

Rob Clark (2):
  drm/msm/adreno: Change chip_id format
  drm/msm/a8xx: Update GPU name with slice_mask

 drivers/gpu/drm/msm/adreno/a8xx_gpu.c   | 10 ++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  8 ++------
 2 files changed, 12 insertions(+), 6 deletions(-)

-- 
2.53.0


