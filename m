Return-Path: <linux-arm-msm+bounces-94608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eC2LKSr5omn18QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 15:18:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AC21C37A4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 15:18:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 883203039CB0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 14:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5C353033F8;
	Sat, 28 Feb 2026 14:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eg5lJ0ao"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD8A2EA754
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 14:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772288295; cv=none; b=E4iV9mGz5MJbzItmewCbzvNDCVDB5z6UWUtCb/B2X0lww1a5uNaa7RskBoNYgbjF9vaDWntHLKSQBMxjV8LCf3Yu6oFo9yEK7SjZk0TRlgHMcHGygx3Zbu4f0Ut+KgznlsiBvQrqJlEyasQCFh+aESLH/wVZMHnpsQmViXMDlm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772288295; c=relaxed/simple;
	bh=vT1sjH4NX2oRMhLpZYQIpzkbaxRT5wzSfNuNo0OdZyU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QRyJIs4hfLetCARqvtLXxtAPPkhllB2blrzgzbu0AYPe81s8uvswz02x8iSw3jBtMGDwAimZwvzahxXoDnYDH1gkAZqcgsvM6GFKjjCk/AjgEd+T9X7I4WhxHMDVpjPE1MGkg4/enAfpjHa60Bpa+iK2fAk1KBHeEOlN3OPJNJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eg5lJ0ao; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ae3a2f6007so3521965ad.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 06:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772288294; x=1772893094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VGK+4J+9vPRIz1dRy0JtbK7lizI0aiu8a5dzBxpbALA=;
        b=Eg5lJ0aov1oOKCFVctyc5K0zh7K+BC3HWcBYMXEvbuoLmdlC60EAlGI6BSbmLwKLfn
         SPfR5vapzNj0+hUejNbqRmDMGnF/odZdW7eLbY9VKheUx8fO//i01PvrZAFo9bhalY1N
         r5d20n4zjaHwK7DtAgQy7xWx0Fef40tKKYIPIb5GX3paIeSnA7GycIMHJNzDG1QqrCYm
         ftgz6DWHAanWciqtOfImtOAsWO+9XComJXu4kjfIe1mvPAjoRFg0os/c9MZqa5xjbyaa
         1IUP+JX6pC1ycUmlwJonzJsPmzbo6lqMJXypl5KJReRSKbcot1U14mdMDPVl3wVxaflj
         7Kgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772288294; x=1772893094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGK+4J+9vPRIz1dRy0JtbK7lizI0aiu8a5dzBxpbALA=;
        b=Uqx754NiF9+VGwrcabky4MnKLD7wq/6bXS36ia4Tg4egITIVJiKjU/w2K0ox6xYrX7
         HgBXyJzHyMUZ1QgyrNWEookSJdPIGPBSPeR68HymTHxUpTS6N45MQnImeXIjfHGGuPKr
         oOBWvGKBAeIhN7GD34hqfqaIy6fZ7KeScdomaW/MGpnnEgY015RmcXjEDMr4rLr79jj+
         wBZcILuX2FKthkmpW1n2fvZ8tiBmJIendHuW+S53iLbR8cYrZ+il7XkoB8FFCMiXPyQq
         4Chvt14mxJhwUSXqTB/bh6q705BDR8hYr4UGhQ4c+ukfZHeZh5J92bXXRnmnwCcx2ikT
         yprA==
X-Gm-Message-State: AOJu0Yx0dekyByIi6kTIdT42lgSdLtA5hD4bzDG/VmF77i/L55GRshc8
	MYELAOBunjajAV7liLlH/TJe0iszd3vgmQaEro59USgFW1pbeAulpdoJ
X-Gm-Gg: ATEYQzx1pnuC2fo4fCLRzmu2yZf5OLzbbSt19BVJjDduzwL0LQ2snhOzsITsOE4NCkW
	2nUakTczkIZi4Zj49FlZIvpw2kldazvhYQFzZZQro/wCfitgI5jCvJyrHjQFBsabTfok5FqVmYt
	kLmkcDcZGZxrq02zDoJAUNHEmti6wH7H/Q6FNvGLJGGvd4/FsBKJBeTPb02t+hk9EIzSrzx5j/s
	UtUVoKJDaArjpxJWGk8K1cxUVBZo0XB1VdKq35d/5ozhFeKE/V5a1Dd32Epfi7fBSyktlckLhJ9
	mWCO5hwr6xguA07yKgJWe+zlIT1RGhyewOIrsV1Bo+RbbPWC51W/vZZHq4FDzS3Tgp5tl9sSwTF
	L6zRDtK8YITxFyV9FagV5xUEuIVe+vyo7/jt6sxJTsuTWRHRqV5kq3Et9125+TTvYTGeogXiHLU
	XW8sJnrrpiM9XliCx4XL7a
X-Received: by 2002:a17:903:3bad:b0:2ad:9b86:ddc2 with SMTP id d9443c01a7336-2ae2e401fc6mr54787835ad.22.1772288294134;
        Sat, 28 Feb 2026 06:18:14 -0800 (PST)
Received: from nuvole ([2408:844d:b08:3702:16a4:72fd:8170:4ed3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3d1b2c5esm18697235ad.6.2026.02.28.06.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 06:18:13 -0800 (PST)
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
Subject: [PATCH v3 0/4] Add DSI display support for SC8280XP
Date: Sat, 28 Feb 2026 22:17:11 +0800
Message-ID: <20260228141715.35307-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-94608-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 04AC21C37A4
X-Rspamd-Action: no action

Add DSI display support for SC8280XP.
---
Changes in v3:
- add the missing refgen supply to DSI (Dmitry)
- Link to v2: https://lore.kernel.org/linux-arm-msm/20260228101907.18043-1-mitltlatltl@gmail.com/

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


