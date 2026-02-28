Return-Path: <linux-arm-msm+bounces-94581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDSSFETBomls5QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 11:19:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1B41C1F19
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 11:19:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 52413301B79B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 10:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4569B41B378;
	Sat, 28 Feb 2026 10:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxS+MmMI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223EA2E0412
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 10:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772273986; cv=none; b=jwoCOpiUntSJ146DHG1aKjUkRY4QGh8bxk5UDVkGEA4BekjvWyN6pbzCP4ljqLYt0KTTUKNG7DrWR0skAquZxJI1d12mrPb8cwjeAdX2Q+tfYSwd9+admz9rdNSHQMLquR3iHft5E8JEJAfU6Di5kD2gJ5vXnlatZTVOZxgDyFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772273986; c=relaxed/simple;
	bh=jqcQz9pi29KpxpJaeE8kTl5uMwNoTZtobvvStfZFf7M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uvEofb4dRrIjdDfI93cpPDd08SDIxoteeQX7l4rx8xvtAG/7Yk2WWuvnejKdvyTzjKLFfVZUtbpX5c5vOne45bOlmu5bRYRufNj/wBwUHL3a80f+IZW6vhV5DMUYrFaIyTLUN7i/Jrzi1SRTmW4yHBXrEJRtauMlVnl7uFajC4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxS+MmMI; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ad4d639db3so13971685ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 02:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772273984; x=1772878784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRVqqul3/pfy5o1UTViOLOTR76RCMcD2+rnW+WmI/mM=;
        b=cxS+MmMIyBIBSepZmLjzB+EomzS9nr9zGGVbl+d4twilMG5UjEBra02Dd7Py6IhhwZ
         /kZPcariXs6y3pti8iV095T+edu8/X43WyoCc6oi4cu5LF+Fp8G4JutP63oISJu2ZOWI
         qZDfCgfoRWV5ICogRr/kPSSgHfnj0KqEyZrUnJzAlWJ4WaIFKTidtXtGCxcX1uRZIvG5
         XLMOjCKtD7Kt7JlIePUJw4LFMKNBSVrD+tqzsHNIUoCe3SGWvEzwjyXYoJ++IVQGyqSA
         rHa9s0TLgxGBjxmnZF64ZF1hs2eelHb+VnfeOJo4LVvtaaJYXKooxF2ZIs6LgeufsD4j
         GugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772273984; x=1772878784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZRVqqul3/pfy5o1UTViOLOTR76RCMcD2+rnW+WmI/mM=;
        b=jO0tS+xzhiLSpSG32hvVUPov947ApdbJS+e74p98yyNkDlf/Zn906KidwAWHT0lgRu
         oHdmi94L/RYOiSisYAOuVDSETK74hRd1jufJ9k4ayfukIvPVnJKJjOKU99xm6rz6IZ5Z
         TKVaKbd/NWsxYQjatxE4g4r6UkpEeKSxtS86sNHpowxp5lsysqiK+m6VqsyzHd4sv54q
         oGCm+Q4Gz2F4XEhnEkxaM1m04TVNsi7aIfahqBQWzNL5EYT2sxqjMW+5A/oL3wkKi5np
         0sZLuzaKt/EqCl2PQyi8n6T9mz+O9Nz390lycgbqW4WH29t22VOPz6onrAqlcKs3jstr
         oeGA==
X-Gm-Message-State: AOJu0YwsNGSzvwKQOoAwxC/J6415zJ0Peu7XG4PUzYrA0wvrhe4OOsQe
	tQHvZEWMEjYiX7Aecca1g7Beyt4lz//8scc/MjNQESkztXulnCUx5AOu
X-Gm-Gg: ATEYQzzoJmTPEZPhBFuj4q34XiovWQjPx7itn/eWvxpyg0xf5Q/sSlPMg+kmaeV/JrG
	Ji2WCV2qn0gGynsN2QSfak0RuQGBmFV63rGOpMf6LpSl20IOqAmzXhU7hfk8srUxIjLKgadEnXE
	Fw+2uHv51pU0VybrMoRI5fu1CBIqYIK88rMyeHQN6XTFRjcYyrb3vzSfX1RaIqoCTv1yQ0FeKxI
	wIIJjJxm3agk0J/Q2406mA79OYW3DVvicg/cU3eDTNwJTF/GS9edJD2YVopbJJOgGQbR5k4uEXR
	7s2nBQDmoE2DN8hNoVFBLd8xBz2EK6J1l5/XnwgEjwFp1/glQAw4nNCFXkp3mtEjFtjagmfggi5
	5d9i13D36mP+yzTYR/ysyve5/TQHSWrKSH2kVuyImLmDZ76xweddwQm2klO2qLDSI3IohSRPK7Z
	BgytZZ9EKnna7+MEKakT70sQ==
X-Received: by 2002:a17:902:d483:b0:2ae:3e4a:3cb8 with SMTP id d9443c01a7336-2ae3e4a3f61mr13106665ad.53.1772273984400;
        Sat, 28 Feb 2026 02:19:44 -0800 (PST)
Received: from nuvole ([2408:844d:a00:16f4:279d:1459:9faf:9d87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5c111asm82361855ad.21.2026.02.28.02.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 02:19:43 -0800 (PST)
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
Subject: [PATCH v2 0/4] Add DSI display support for SC8280XP
Date: Sat, 28 Feb 2026 18:19:03 +0800
Message-ID: <20260228101907.18043-1-mitltlatltl@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-94581-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EC1B41C1F19
X-Rspamd-Action: no action

Add DSI display support for SC8280XP.
---
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
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        | 396 +++++++++++++++++-
 4 files changed, 420 insertions(+), 8 deletions(-)

-- 
2.53.0


