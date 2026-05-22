Return-Path: <linux-arm-msm+bounces-109167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cA5pDqXyD2o2RwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:07:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 190615AF5DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:07:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 61396301437B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 06:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA4439BFF5;
	Fri, 22 May 2026 06:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tDHH6ryC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0234019CD1D
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 06:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779430051; cv=none; b=o4DIFZTGOH7940n2r6dc1RlMKWZvLNvDbRVG/7R+dlxcTPWNuHUkTCFMLM8qqOqCrtLJZzc3FHqUYl2Gv1UfTIINcfNRcHqlQmAACZV7q1aqP43p2rZ6CaeRI7spSXOQMm0gkx5ZWOh/0xvcP8WzaM//4ZOONSsly7OnjS2L2Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779430051; c=relaxed/simple;
	bh=qFXBmmvUeTK1exabxEjnNxEYc9NefmCZrUqDcKd9UHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y5aPW0+Ej4YNSXILC4JKK4E00Hf1DeDdt9dBCxAIW/Hdgqn+xQUvgUmmpen/5Ka24eDStQ40C5Q47wsqeCX4nuU0eUELq0lIFQT9EWdOpH8UvW4dy+io4Q7Ycpn/7UJhsvkwp064v3dH1FsqNPsr8HeNorzkE7lb3OccmUH+1Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tDHH6ryC; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3684a6f3b0bso3461263a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 23:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779430049; x=1780034849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NXHEsP6MIsIy0oSjkFIfzW+qvl+16XTQ6Ealt2erRAM=;
        b=tDHH6ryCDW4kDmZE3/UEbTtq66FBojELhpUQWL044sqnvfmCkfdF2ugIV53BM4RLyw
         NeESeAvshAmIrukTP64lx+RiYswE/uzUjxP7TbXuwa64v22z0epaRLbcTc18vZ3NG3YG
         ryoUy7DxzG2pNHx5LhAJ6WERaRpy3zpC6qvYvO/pR2czJvX1WRoWjUw9KUqCfmjyeHny
         2awzxxLnPVz9m5wL83+M+gfAnCN+J9ZMvqrcTowILST0uWsVuzbpDZgapvqyBWL0yh2p
         qdQKBfS4ic/F5MuwdUH0V6kPuJ2zVzKZvQ1HTKyHaj49bYDxi+7hvD7ehEDPmuCPwq+x
         BQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779430049; x=1780034849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NXHEsP6MIsIy0oSjkFIfzW+qvl+16XTQ6Ealt2erRAM=;
        b=DBWN50VxtrWMNLOdhcDFXxhXJlxVa6lqVocsIdbiycZHiBbiuL6cdorkSgzR8RMWNi
         Vj4++FU7S0PSqxjdugUgLhLa9ZytZz4Cd1ANNicGf5oAEf45YEW5rMbPPv2cKcEjjABK
         OlycESvgT6X3+KRrlJ4mIzHa7ntAozDLEk4Nez003tNuwdCMZescZqTcIQxsa5280iRB
         OTN6xh29wojHcZs1dC8ZfDapPRscf9R2j4A4QF4cdPOg9pV5CLwzUK35mWsysr09TAzH
         RdtZtAFQqXHn5lUYHOBA0M2Z19/s/ZXiaN1h6U2lSs0ueCA8f9rOStDOlwHX30bemx3h
         hzWg==
X-Gm-Message-State: AOJu0Yx2xxqsgnAgmJN2+mMdtoLlsERdtsubr9E8fV7taXL8LQBdmvre
	p6e/996hoYvLXau2yQOhdK0PPa3dvefRHnWNohCV0GC0tEw+FM88youjdIDi4usYjqU=
X-Gm-Gg: Acq92OHo7lMbTeVBKBWu564/TfhVE6Afc29uDDteTCFmYE686e8+wxuROcIQ8IN5MUr
	J+fsUEXlpabPVEltXvl8hH5L3SqyAjGu+zHX7Ihq+Bwv8lyDPbbkUXCQ+/Md/+ojq1y+x8F68Ny
	iCdhyAD+fn734RQU5ykiONvcQT7Xt+zs0wP+fWU9bOPkc3xJL0Nc3R8Yyeobw49HVVYKlZebvFL
	m0ca3UUApcgfIxBeKmC1r9/hoDOpW9Z0Qlm1uzJUuyw6s0sjn3ws0G9nMuTQiN7VdH38cd8MOYc
	tAD/kbB/G7ZWyfN0/2qUY6wh1EhtNuOnJa11EbwB7HFb/pOJExaB3XDiRzAAL8QNYjKGWd1MFze
	4j8fOHfnuGx/b7UHTlZ1gykFTSGmlavtmI7NFKsNe0NmO29m6ydmUWS1/BPOUCBynt15XbMrGQJ
	nahVndQaK1P0E9m4LCQW+Rzo5GEIH4iBg3dpcT+r1oTykvR0bLxS7hh9CKWxKia9mRMw==
X-Received: by 2002:a17:90b:6c8:b0:368:7398:df8a with SMTP id 98e67ed59e1d1-36a473cccc4mr5285786a91.4.1779430049070;
        Thu, 21 May 2026 23:07:29 -0700 (PDT)
Received: from radxa (122-58-25-162-adsl.sparkbb.co.nz. [122.58.25.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a7212aa06sm428572a91.3.2026.05.21.23.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 23:07:28 -0700 (PDT)
From: Graham O'Connor <graham.oconnor@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	abhinav.kumar@linux.dev,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Graham O'Connor <graham.oconnor@gmail.com>
Subject: [PATCH 3/6] drm/msm/dp: Limit voltage swing level to 2 for RA620 bridge
Date: Fri, 22 May 2026 18:06:42 +1200
Message-ID: <20260522060645.4399-4-graham.oconnor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522060645.4399-1-graham.oconnor@gmail.com>
References: <20260522060645.4399-1-graham.oconnor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,lists.freedesktop.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109167-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[grahamoconnor@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 190615AF5DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The RA620 DP-to-HDMI bridge used on the Radxa Dragon Q6A does not
acknowledge DP link training at voltage swing level 3. The bridge
requests maximum voltage swing but never completes link training
when the driver attempts level 3, causing HDMI output to fail.

Cap DP_TRAIN_LEVEL_MAX at 2 to match the behaviour of the vendor
kernel, where link training completes successfully at level 2.
This allows the RA620 bridge to establish a stable HDMI connection.

Tested on Radxa Dragon Q6A (QCS6490) with RA620 DP-to-HDMI bridge

Signed-off-by: Graham O'Connor <graham.oconnor@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_link.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_link.h b/drivers/gpu/drm/msm/dp/dp_link.h
index 76125e9c0..ff0d8e99d 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.h
+++ b/drivers/gpu/drm/msm/dp/dp_link.h
@@ -24,7 +24,7 @@ struct msm_dp_link_info {
 	unsigned long capabilities;
 };
 
-#define DP_TRAIN_LEVEL_MAX	3
+#define DP_TRAIN_LEVEL_MAX	2
 
 struct msm_dp_link_test_video {
 	u32 test_video_pattern;
-- 
2.53.0


