Return-Path: <linux-arm-msm+bounces-96013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id FWrKHegbrWlzyQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 07:49:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E684F22EC02
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 07:49:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 954AE3015C9F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 06:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D5623EA93;
	Sun,  8 Mar 2026 06:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5epL4Z8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE1B217733
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Mar 2026 06:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772952549; cv=none; b=fnkfi7zNV4O+jl/mo7Y4B4Et4g7O+3Rkt/w+gkjX1uNi8b/JAIOume+oAtGTWT/9fInheJMXLZoeWNVNBcQZExx+p9GHx84WzaU8pX+HMInLaBYnFSW1UC7llDewKaJb2OVjowcJdBv3KvHzZGq/lxhLDEI1b9rViPSV7lWdHvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772952549; c=relaxed/simple;
	bh=SVaTT9VVB/RsaHe6KVeVDmHl9hoZiBubbZwO1KwYBnE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AQo0/LhXcLPrU4SEwcBLZzVf52EDprYM8nAt/OelIPqRJckN43h8+D7S/4Jra5kn0hJO3bPO8Wzt2J7dbEHs0KpQW41ayfjnuvl4dAXkgY2RdDtPeISJNpOxBmVS5nB7+rFofeaWy8XjW8riXNt+Odm4VjP4+gVuU9t53UP+4PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5epL4Z8; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ae4e538abdso68469195ad.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 22:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772952548; x=1773557348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aNIHEpkAqWiAErrHYpSRHcsVSQ/YY6yHFTO8cE3ikuA=;
        b=i5epL4Z8zKPzaU7/Us8G1uJAdGVTHGu1+ci1mTslhOUZmzoQFpCnxFwIqEjOlo1I+Q
         yLB8aPUg/mIK/uvOSlnU0kUC+dvAhg0asNiiv+tshGwMQ8V24Fp5iFKUbQFuxtMwdkLw
         PuyPeBzF4pMji8AlhUq6qtSAS/mjS/Gmj62DljaM65lTZOn54FM02FOTUVTB0zYig3p+
         LRTMnbY8VF8CJKiX+DLzO9ORBEPOi4VhRiaFlAMOYXdLGssyT4OkST0T4By4j2/86xIk
         o7d06xOuxbyX0uxTVjFYYpo9DEnLu/6vRv8RbMOHfL85T1P8TdvD47PaTXxBwi5wWYus
         mfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772952548; x=1773557348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNIHEpkAqWiAErrHYpSRHcsVSQ/YY6yHFTO8cE3ikuA=;
        b=cXvg2HlNxfTQBiQEKB+OY1k5MJeZiPmgzdp3pfS5vnkz58Uw3B4P2aQxN7asco4rnc
         Y2/TbDT7mX71WlZvZV4y7mvIfHHly/MyPgJU+xsROXXtofImcBAwwP4qohfwAdIGlZpQ
         F1UKt69KDni3f8CGRyyQw5w4MSyTpelAG+5QrK9Qhuy3GUsicZVYwqsHyuY3XOWCaqbT
         5iilb7CmBaeiR6Hst1JCBA2ZMN6TDbQ6SbGoEZR5PE8znN7j95AVnrtiMqfgKxprcryU
         8mQ6GvKa1mILFA3qaW9yM1juifO0wMOJ5ie5aet/1tTlj1oeH+iuS/Aw/bT/q+6GbIVI
         EmxQ==
X-Gm-Message-State: AOJu0YyekWL4oIL4p+igv1aWLJyOJgBSADBaZ0qWrw79Nf/BTexNOma5
	qnhqQSs0hknxRE62MJmu6alCbKclvr77O2EG/+QtiLQt/d6fEiYKcEna
X-Gm-Gg: ATEYQzwxeegRprSZsgesonS6rFXKpFxLeAb0YFnxrtRP32tLhF3mfOlHmYsqXuxXeav
	f3gvrs9f9exGWPbup+BO75YTlI78aNivyiW7cWYjwNAF2OJLiDKZ06Anp3pIZ45OUT2vWJ9ehwK
	FMkUh7i1MXDzyOcyzvwKx2ts3cOPtu2S72rA1nFadMRbT7+MGkaleZviS1K7MDoM81KAnSLmHTT
	WIwBsEG/vgFpmfMouxqSQqepAKxUDhVJ4miM6wlQ44zFTThTXee2PPNPHelEJj442dZRhL4KX3d
	GOrmN8NZnqQfBOp5gEyktnNruCYP/j6Mir6LIiqUlUX1BuFmlxW85eMxfWP3nnC9GUTU/9/ppNk
	r/bDa3K4Gs0cA7fDXkmVjzjYLXP5oi+73+7WvKjfAWn/nxXULBSh526djI6lX8nsMV7Z4WP2+rm
	JDv7HN4Z2i1USuvValLg==
X-Received: by 2002:a17:902:f70a:b0:2ae:8253:1a78 with SMTP id d9443c01a7336-2ae82531aeemr77776095ad.17.1772952548110;
        Sat, 07 Mar 2026 22:49:08 -0800 (PST)
Received: from nuvole ([109.166.36.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840c9a0csm72503225ad.91.2026.03.07.22.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 22:49:07 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tianyu Gao <gty0622@gmail.com>,
	White Lewis <liu224806@gmail.com>,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v4 0/4] Add DSI display support for SC8280XP
Date: Sun,  8 Mar 2026 14:48:31 +0800
Message-ID: <20260308064835.479356-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E684F22EC02
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-96013-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.993];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Add DSI display support for SC8280XP.
---
Changes in v4:
- add missing comma in DT
- collect tags
- Link to v3: https://lore.kernel.org/linux-arm-msm/20260228141715.35307-1-mitltlatltl@gmail.com

Changes in v3:
- add the missing refgen supply to DSI (Dmitry)
- Link to v2: https://lore.kernel.org/linux-arm-msm/20260228101907.18043-1-mitltlatltl@gmail.com

Changes in v2:
- fallback to SA8775P compatible (Krzysztof, Konrad, Dmitry)
- fix DT styles[a newline between property and subnode, property order] (Konrad)
- use one dsi_opp_table and all dsi controllers reference it (Konrad)
- resize dsi_pll region to 0x280 (Konrad)
- update commit message
- Link to v1: https://lore.kernel.org/linux-arm-msm/20260225054525.6803-1-mitltlatltl@gmail.com


Pengyu Luo (4):
  dt-bindings: display: msm-dsi-phy-7nm: Add SC8280XP
  dt-bindings: display/msm: dsi-controller-main: Add SC8280XP
  dt-bindings: display: msm: Document DSI controller and DSI PHY on
    SC8280XP
  arm64: dts: qcom: sc8280xp: Add dsi nodes on SC8280XP

 .../display/msm/dsi-controller-main.yaml      |   1 +
 .../bindings/display/msm/dsi-phy-7nm.yaml     |   1 +
 .../display/msm/qcom,sc8280xp-mdss.yaml       |  30 ++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        | 404 +++++++++++++++++-
 4 files changed, 428 insertions(+), 8 deletions(-)

-- 
2.53.0


