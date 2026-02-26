Return-Path: <linux-arm-msm+bounces-94290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECEWO9w8oGmrhAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 13:30:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFA51A5B1F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 13:30:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB2B43033D3E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 12:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898B6336ECE;
	Thu, 26 Feb 2026 12:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gSAgjihv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53A33803DC
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 12:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772109018; cv=none; b=WV6ah2ngHH92tZMw7f5Ejvdm83NnqG6kljJmAsVuaBwakCcpZf5JyiSi1rD3/AmzETCbsvfzSQzimXioCmMGlN7zetex2fskCTmoS4K1+oj21llF9P14k6Aj9cTReGLjlgXj0SzfGGRpUdR9crIydsy4fHBMkimznTl8ic2TjTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772109018; c=relaxed/simple;
	bh=8WRWEyJgn/iAHBtdkmQsC9c2iEzaTuNZKSPYGoRGoZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t110FdgcS0Ha6sh8FVe14GcJbN55ntgr3EXUH7E5TtRudqpXB7oKI6ULq/uJLaYgdX0BwT1r9jWJBRYlDgkK+nDFuWiHva7G3n1/34FPEoF9ZX/07sSt8jr1RXV8AXWHNQ3aS+8JOPuaE26DcX/QkddzhK6rcXAIVBD9l1zBgik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gSAgjihv; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ab232cc803so3940285ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 04:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772109016; x=1772713816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NqcwDzw5HN4ZLQrwd1zkwQ8pFoXvNQgRaA7hrn50J+c=;
        b=gSAgjihvMG/j+OoJ+qK2S/g4V1MW6el+Stp3UpB6iKmE7H711n1Q6+Zp2M9yPmW9gh
         IabxEqetRGhgViPT93u8fNt008y2CL9yNbkkHdsJDh1eePE6XBns8gU0YXC4Cw5m4Ue5
         8DzPuVUGmwM0YcLpB3hksTEIT+pOmStMJeujpx9IWdfIqVNKh47+i1dxilJXJIIiJmfY
         YhuvdzZD0F0HQLfi4zXS7la5vMv2/JKCWr12s1Xo0hplE4j4jhrEBB1OZMHkNieTqM2C
         8jIIVU4oc3NPgVwL4G+zSE4+sh9AXWMp9OcgTA7oqckqXQgxTgOfZGnXnuZgquGaKTCv
         Lqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772109016; x=1772713816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqcwDzw5HN4ZLQrwd1zkwQ8pFoXvNQgRaA7hrn50J+c=;
        b=HrbbaMIaCkkdUmRPwMvVmkw5XnfRk9ZGCpKmWvpVJf27KTH0hMsvw89PWsBJ95vDps
         W79ZTo+L8vEpuwgrtsmzE7gGL5FW+CJXdNiRRBKFAMG8zrmWeHDAXEcU0z/6EbmZEez7
         mVovsDV4n0BYjW/Jmvs+EaWyTGOrI+gjidILyCUftAol/XKFJ6DKEx6Vdqh5WlHRraSE
         pS0rj2THthz8vrL/mCHROsJqAkS61BuhKQvYqwz1MNiXc1YobVt268Plu3+HbvKSz4Jc
         iNMY6LVMUo0iiEZbuY+LNZSLkrQXJYo9uQLDL3KWM6KE+8/bcXOJAGYkwix3fG54JdFf
         cZ1A==
X-Gm-Message-State: AOJu0YxvYTK6PKo+uJ5KTDLfNOyIpFmqeUdUCcB0PKF3QP+M1yNfIr8P
	CV1pawAF1wv6n3gt+2kDez6rl+ymn/zOz0QLUi39cG0DX/AGFKgaEY4K
X-Gm-Gg: ATEYQzwAo0UCzEFaEscBYddK4FKfNJBuL+f32PYXj6/2Z9ot+RmnftrWvH0hglZWUZb
	LTPi0eZc21ahaoLqvKzuFpurhmg7RK51hAI/4xkUMp57he6TViiYAt9JwDrjXtXCwvi2DMxAlg4
	dUqPc9r563ofF1SU89lo9fu7t6rTzR/hCe6L+XHC2O2oWVv89jVGMb9eAd/ol5RBi0KY+BK7K2Z
	4Jr2OFrcqUrfUrf1cJX4vns6X5HzLdvWg4MCQoSEG4OK63gdxIrwGIBNmEdfgq3ibZZrvAQdsy+
	5A0lFtYtYGHEaAbJCOUc+Gm1B0Rm8RosgRe9/IV9FxenI/rYaRDlo61lETo3CRMeX3S767okOOL
	fjnXKoURYxmmbmCxRJVLvj88GnlYdeochJUyHBzoDiPNq0Ys0SMPCymOPL+Q06NVJORdJ2QGcM5
	g2rHMRog==
X-Received: by 2002:a17:903:904:b0:2ad:b98e:35e9 with SMTP id d9443c01a7336-2ade9a8ebffmr39412815ad.45.1772109015647;
        Thu, 26 Feb 2026 04:30:15 -0800 (PST)
Received: from nuvole.lan ([2408:824c:a17:8230::c83])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b22e7sm25504125ad.3.2026.02.26.04.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 04:30:14 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm/msm/dsi/phy: fix hardware revision
Date: Thu, 26 Feb 2026 20:29:56 +0800
Message-ID: <20260226122958.22555-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-94290-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4EFA51A5B1F
X-Rspamd-Action: no action

This series fixes hardware revision for DSI PHY. No functional change.

Pengyu Luo (2):
  drm/msm/dsi/phy: fix hardware version
  drm/msm/dsi/phy: rename DSI_PHY_7NM_QUIRK_PRE_V4_1 to
    DSI_PHY_7NM_QUIRK_V4_0

 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 38 +++++++++++------------
 1 file changed, 19 insertions(+), 19 deletions(-)

-- 
2.53.0


