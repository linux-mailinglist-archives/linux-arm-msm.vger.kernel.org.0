Return-Path: <linux-arm-msm+bounces-94020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6O1UKpGMnmltWAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 06:45:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACDF1921F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 06:45:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83FBE303D73D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 05:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0ABD2C15BA;
	Wed, 25 Feb 2026 05:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OrnY18UR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C41D220F38
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 05:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771998350; cv=none; b=P27wBcsPqmJqK/FwSsVkpl/eK3GIOQk957cq+5Y620qhiT5BXJsy0MTP00J9hA6KsIMtX2YuORxXIvUxA6zOZnj5wesPEkkpMbJ91lOyGP4lTU6oXCiEpSdg6k2363U+fOD0jLgjggYgZlh9wT7XpRtT5IHAR1bsMIQJ+fCzUuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771998350; c=relaxed/simple;
	bh=MLDDEcSRlhmHWVYr8YP3sgCaMCSed1eRVctAI00HjBI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RQYOgDgG+ky2eLOBWY2vv/S+wO9q2esVSltdUnPTQOZAATW9kGeQroz7W9CfE38cAzTHC1D/DabIxr+An3FPGtwXcFyaFRwHKpiNauFozLxGa3v66HsAlNefe4G+oKEXQOlSBTw1Id7maYogKJdXHvVe61j9j6diM6uNFn4ca5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OrnY18UR; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2aaf43014d0so43766795ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 21:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771998349; x=1772603149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W28tLa7N7ACX/AmRjBGq6ylf0W1jR0KpZ+vX7BOo/xc=;
        b=OrnY18URrsnJGdD49nEaUBRI/QVbd4vPhGI2cxrbt5Xf3ASR+8egXiVlZMk1QR9E5E
         9ksDclXj/4DBdEblNTYhDW59LZ0Q0HZLeIxye7y2GkueaCLP1fY7azdgzjs44S77UeX9
         SkmyXkahxMXkJLnfIYnho2U6T3EAKj4LUORAfGwI3CyN/02BjKMoj2+vfPa2/tix3KUi
         0l5XThGNBhkvwdiZHzP8X6EEa/ubWPerJw0UEBDtdcvi+9b7FHN/wkaYkjart8+6MeO8
         vYPk42tlRNHGIVNDPVms5siWUiof8ZW6nqVIuleJgmkJZOlcAjYVuRe30cG9jXrHYn+W
         56Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771998349; x=1772603149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W28tLa7N7ACX/AmRjBGq6ylf0W1jR0KpZ+vX7BOo/xc=;
        b=eKjgyAWYG3DsoUxb5zButC8Xr2IA8z+hPG5BVfj/4L3qHYzDzeHPYUCoWOvjJt+p9D
         mu86G6i34xysj0UraawtcuZ6ilvV19M2kys43SOh6vidFUZQYd5rzUHag1XSx2u9HJez
         9bDEJccYuxEDTTBrFbyyQ1rnULUZerYZkl0FPmjoeA+/mQCcY9cs3NqWy8d/s/WXE5oU
         PrhKktsoRpZZ7ezIrhZNjzICLkevc5HHiXWW5qa98+XGvV/Sw3VDAqDhIlOotHEbwjWk
         G/S37sTIzPvaQADGFCZNILu83gx91u7ZR2qC5rBAakDFyMRzsS0+Ool1xmt6W4z1F32H
         TgZQ==
X-Gm-Message-State: AOJu0YwNqMs+V6nKtFSlRgnsXtwTnQg/WYpPgYios6wg88I2sElHhJrz
	iWDXMyogAUVrpDfg5Pzz/qWFNoaio+lBo47YEivnwXsoTz9xfxA805Of
X-Gm-Gg: ATEYQzydYEA+izAVmU+3eqQNbRAoqyNrGjACb6gwuoFXkJWhAic0ZX9Xru9/P4iIkhS
	JIrKXrsABspsmXp8Xo1DMXC1UVlYdHoFseoJ1QsW7Cv3pGQ15uWnG9SVK7DD68hnAJmyViNOLzl
	AVrp/STI8sZljH/YY4WGhysT2qTZ82HX4jKjOMiL/HF92g1TMoqpGAso1Q89HWTndHwSL+dw167
	Gofk85bVOGbZrjyA1AsWMtjYyjFCeGM7vBvVMkBY4BfeFCPuinSzkSsfBHUaTToZ4wqRIYPLidU
	OJqusXLQu96hii03y7Wtp9XH6ari5puAh/e/EEc+OEU572bMiRVFN4wiYu/Ox1DoO+MC5OASfCY
	23lq7FxPOSiLqhfACwbRXlLQW5fGPqv2KD+P32a6dIP1dsnNgEjqLEpadhEJfZeCmgS+VksByAc
	Yvgkf9t4fJPSKqU3CM
X-Received: by 2002:a17:902:cece:b0:2aa:f0ec:3701 with SMTP id d9443c01a7336-2ad743e22cfmr154733605ad.2.1771998348825;
        Tue, 24 Feb 2026 21:45:48 -0800 (PST)
Received: from nuvole.lan ([2408:824c:a17:8230::c83])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7500e318sm119665295ad.43.2026.02.24.21.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 21:45:48 -0800 (PST)
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
Subject: [PATCH 0/5] Add DSI display support for SC8280XP
Date: Wed, 25 Feb 2026 13:45:20 +0800
Message-ID: <20260225054525.6803-1-mitltlatltl@gmail.com>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94020-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 0ACDF1921F1
X-Rspamd-Action: no action

Add DSI display support for SC8280XP.

Pengyu Luo (4):
  dt-bindings: display: msm-dsi-phy-7nm: Add SC8280XP
  dt-bindings: display/msm: dsi-controller-main: Add SC8280XP
  dt-bindings: display: msm: Document DSI controller and DSI PHY on
    SC8280XP
  drm/msm/dsi: Add DSI PHY configuration on SC8280XP
  arm64: dts: qcom: sc8280xp: Add dsi nodes on SC8280XP

 .../display/msm/dsi-controller-main.yaml      |   2 +
 .../bindings/display/msm/dsi-phy-7nm.yaml     |   1 +
 .../display/msm/qcom,sc8280xp-mdss.yaml       |  30 ++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        | 425 +++++++++++++++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |   2 +
 5 files changed, 452 insertions(+), 8 deletions(-)

-- 
2.53.0


