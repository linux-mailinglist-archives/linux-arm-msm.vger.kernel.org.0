Return-Path: <linux-arm-msm+bounces-75681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE33BB098E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 16:01:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E11D0188B4EE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 14:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 920273019B6;
	Wed,  1 Oct 2025 14:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ibx8owUy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E892C3019A8
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 14:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759327259; cv=none; b=J/rIixHmy5ZvJ6AsY1QPjTNXuLOkqd3KgqBLmU5HVmSy/NvKnAmOHs0W7fad9kxqo3nsFzZ6XE9nKNIUVQt4qpk/2/Rum52BfvGv0Tl4ffmVwiiTRPdVVtwJ0suoLSwoq4iKXtPneJQFSMB7cFAc8hPSG/fbERpa+n7jo2kIKag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759327259; c=relaxed/simple;
	bh=NC3eeAM5DOVTDlmWZ97SXYb7EY5dN3ENSk5pS7FalZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TxF5UA7HlISN/wG4UPZtoaNT/Yo8bVAc624RwuXtb4bwp7riFGEKzZV/D5jpup3jEVgilVqZyeSsg+haUBq+M5icskrSwXFzYqpdGIIa57XUq9vAHyJS9vnoq6vEAG2BWo0cNZviOFe34aKTdD4REzcgDiEzbN6nhJQzKg/i7WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ibx8owUy; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-3ecde0be34eso592851f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 07:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759327256; x=1759932056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EYsni1VBvs5YqLN8WcctEz3qmuBiq5eihYcUC9RPHrc=;
        b=Ibx8owUyE3GWKSXaPZAX96wpg92fXZ8L8lT2fO94m+zHspJ/cMirVhyk2uKv8OhzXZ
         0uPh0tuGWVn2siDo9kCH+2z64ow2+c9IHQpj19aHqogUZTNUT2ZNcZyiYcG6sVT/z0AI
         2dR80t+PY5l75CZxo0zSsuek1k5GP2L/TThuS+tAASBO9Pfwl9J/brOsd4gnoXVg+aBh
         oGq6doVPAIxZnQ52s4LzbiBsirzzMJHxSZWao9mPC3082y/cOmDQJw1mL7EmNwh9oS9a
         GDafW503Ph+xLI0pmSVc0G5Jj6J0AqM8V6BLknrbqDqbo6eurpLCbhteTSbggPNR+rZI
         JVow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759327256; x=1759932056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EYsni1VBvs5YqLN8WcctEz3qmuBiq5eihYcUC9RPHrc=;
        b=sHpJUNFCys3iCNGHYoTLT92JPs4WKLY3hFW4SY8b2QAhJ7WtJBq/CqekXP8e13SFaV
         wHhtEzHxOFMyxtO/DzCKfLq3MMoX/+OqK4z3W5624Zd4Ji0s+Ww0rj4jXqdviyn/wevq
         x750TFzpwDx8tclEVn5wWkZax7/yT0wOEreNySKy06xoZEvL2t1jky6PNAVYJpx1WZT/
         2D1RCyJt//zT03NGnmEkvcLi5Rdwpsmqev6kpEeDExCEf7vYl3j9YWRraX7vOhkVqwfr
         I6WMWKkvaGAVaiyFX6sEj5L9QE7L3vZorgYnRKDnGw0WXwHX4jHOjgS+XEzqwGCr/MMy
         a26A==
X-Forwarded-Encrypted: i=1; AJvYcCWtQZNS2W1KNF4QrWjfXJ3TJ7+3i9grXPGerav74/G+qz1jPUcDkObeMLhf5vgL/JFsi1jNW8+YedS4nmZR@vger.kernel.org
X-Gm-Message-State: AOJu0YyX1bynmfZjMNCzzv8OVVXTVhdloPg3xvdcMFxil5B+jqf/FRsg
	zvfB0FhFNbj0m84AMslMb4zVn7r4QlsL1CYNlOGaw/j3akDr4NPcphwb
X-Gm-Gg: ASbGnctRA+NLKHLE5ODURAs91UXN29nCNuDEJj6w/jnb3vPnj0ydRv0DGBNUve6sF+h
	yy9ChHNFiKx0imjWG5wbkvjiryS0/9MPXu6SpGgzCtSwCFoEOT1DXwd4f6oCXPB86BS08VwhGq2
	71HoOpCMb8ZfGZ+kGgikEP2jt0mgYqalirjN0m4EqayQB4TNJ2Xp/cPYm8xEvIzc08iEHUs49lw
	1ipQdxZpHYC8TIOjkG0/MC6csIRFf/U+Kr1sI81F1XYR2D0YD4fWaPQ6mSvkAd8IW2On/QZQqlI
	FZ2ZARtz3Tp4DliU8F4YPqe3nnofHzj0U6SEqdhBBfVGrfMBOZq4Dwddev4rmn4UBVl2uXbPh81
	F3NHR2vZkoWACOnnXqSM7v0entLfmPlyZBhD+aPn2YnFbTrcZF0sQJIQzOdYtonUDfRyAiJh/jL
	fpeURjY+oPVtRYPM9Ka+Rf5GIksndFGsjwcDscWbgDQWKDf9mNtsvDUtFxQQM2ZnEJ
X-Google-Smtp-Source: AGHT+IEbCi0xm7TZs0YjOtrOHHNATQAm6IprX3ckD0OQpGOtjk01tDJ8J2LVgeXv3ddJgQ52ljhLtg==
X-Received: by 2002:a05:6000:2901:b0:3ea:6680:8fb9 with SMTP id ffacd0b85a97d-425577761c8mr3272501f8f.3.1759327255965;
        Wed, 01 Oct 2025 07:00:55 -0700 (PDT)
Received: from LAPTOP-AMJDAUEJ.soton.ac.uk (globalprotect-nat-extbord.soton.ac.uk. [152.78.0.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb89065b5sm27029828f8f.17.2025.10.01.07.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 07:00:55 -0700 (PDT)
From: Junjie Cao <caojunjie650@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Antonino Maniscalco <antomani103@gmail.com>,
	Jonathan Marek <jonathan@marek.ca>,
	Eugene Lepshy <fekz115@gmail.com>,
	Jun Nie <jun.nie@linaro.org>
Cc: Junjie Cao <caojunjie650@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 0/3] drm/panel: Add support for Novatek NT36532 panel
Date: Wed,  1 Oct 2025 21:59:11 +0800
Message-ID: <20251001135914.13754-1-caojunjie650@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for panels using the Novatek NT36532 Display
Driver IC, a dual-DSI, dual-DSC controller that requires DPU support
for 'slice_per_pkt = 2'.

Since the current DPU driver lacks this capability, PATCH 2/3 is picked
up from Jonathan Marek and Jun Nie [1].

[1]: https://lore.kernel.org/all/20250220-dual-dsi-v2-3-6c0038d5a2ef@linaro.org

Jun Nie (1):
  drm/msm/dsi: support DSC configurations with slice_per_pkt > 1

Junjie Cao (2):
  dt-bindings: display: panel: Add Novatek NT36532
  drm/panel: Add Novatek NT36532 panel driver

 .../display/panel/novatek,nt36532.yaml        |  83 ++++
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/msm/dsi/dsi_host.c            |  25 +-
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt36532.c | 437 ++++++++++++++++++
 include/drm/drm_mipi_dsi.h                    |   2 +
 7 files changed, 550 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36532.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36532.c


base-commit: bf2602a3cb2381fb1a04bf1c39a290518d2538d1
-- 
2.48.1


