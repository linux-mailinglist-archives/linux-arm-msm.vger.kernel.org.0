Return-Path: <linux-arm-msm+bounces-84358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D44CA399D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 13:29:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 178F3301060A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 12:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E517033FE10;
	Thu,  4 Dec 2025 12:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="HdZ46skd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A0433F377
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 12:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764851356; cv=none; b=Z9w++q71f50682I1QT76iZVSpWn396cIA4Ltb4tUv6BDhnQ8eTkqMw1K4MObgfFstzN1jkYSJzxAXM16BFh35JbaHrq+7lt/uuG1slnFSKjlfbVInLQjcYcXAU5CWzCZgCFLzHYs0sOmi0EMYjcKmAZU0lwfFWxuF7b2JXeZdKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764851356; c=relaxed/simple;
	bh=LB5TEGmDMh5yLvSwpGpzXafz4FvgqYKihYWPBJJDkxk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uUP+W1qatUCRBE5DQlsBBOulkCgLlz7TD+ngFokB/PZnqEjD95E9jpMKfwoNxm+Y4WELN1xT+pdJ0Kqn3xdAL4s5Q9pdn0dcRfaR51lyek/3jjsDwr9uBPjA9eqmxoXJ/Qw6CGpqRYXtLssy51qhMnEtGGLr0IbYbiWABYi9lEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=HdZ46skd; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6417313bddaso1182627a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 04:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1764851351; x=1765456151; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bHsQUPlK+IEcR0xQXz/MkrOR37iFH2osF/J07YcqgOw=;
        b=HdZ46skdw1PRPI9upCZQJA/LUGYmn+cRydu40f7n2/cao27NtX8KVwTs1IK0EvCMhY
         YaxhvuLqbSLEN7y58kOtTgT3kkGYgl1IoV+WPkFGJ5CdI7+w1yI3CO3Trqq/3pUFrz2U
         BpFQmbD7nNdtM7Zl0Jibg01kf6Xt/yL6gP/qZVfEGB/y1wKggJsHlruxkh9mrhNoz8F2
         i6ug/9QmKK/2w7J1DfGCK5Tibcc6l9Tdz6ZmbD1Cz80/o65buNsxRAUyyF4StQ/9hzCB
         QTJnO8QxrbuGMMljHmpc8TiCeXJP04pmjuzAVvlHPZjUsN5q6ezFipRO/4AiBAZlIats
         hFQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764851351; x=1765456151;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHsQUPlK+IEcR0xQXz/MkrOR37iFH2osF/J07YcqgOw=;
        b=H3BDaTD8ZmIPRyuMtE250ktwJazGQ/7RLIZFXNqF8avREHO9dhAXZdPa0Mia/c7mUr
         BJyUleMA9alvbSeuBWUJUqzanwOzkk0ac9KUXOkGR7sOJx0cu6bq+gwW5iTMxDzsf5dF
         f03YnmOE6tLRKBdCRgFJRxx/PZeCwpOumm7uUII5F8NGdG74Pa7ILrzhE38vlc4sMSRk
         4uGa7Ym7vKdLK4zkys+pq5ohnOQF8eS+UWQ0j0qbs5rsfbWZiqbcGOydFq/JS5deeoAP
         VeGwZoKTl0xWhhOKqDtrBcoADhkbsidjEOYr/Pd5RzZvGzpFU8fcvUFFZicdfEG/hBuD
         MuaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqDK7BBdDrZARiI8+DFFFmn1YmbRBm+WXgwqfMjVBG+zEqIwp8z+c0QHkb6XQYOlrF1/cmr6cytrrfcu9Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwJlHuT/14knS+S0h34dHxdfonXqlfH3TZFGaZKSa6s4/vo1goH
	PITaZ7mjOTjZwKWTb1yFinmGWLCnBx0CtTJGprHt806Y4CwtwBm32lPZbe7MzwRzhMOQGUNmIHG
	x4ndJ
X-Gm-Gg: ASbGnctP3PtiqVaho4cT8dQAmYH76ggvVsyI34jIsSrZkzW1alSESLtzT5tt0so6GuC
	Ivjrv1zvHo4ucpSoKl4ITJh/LbUMs4M6vlDNUOAp7EV4WYqUPxDwxurnN1Q0NP4cWRvwuyvx9HW
	S/iT7Lvc5P5rqBglKbPtvo7l+jagmwfSOY3Rb/3e3Rms/lFTn1tA4jgkVG4wqSg10lZga2OtYCh
	R0gFhInb1cwQDXxY1qdM1N7zyMork28pIue9UCkjabCfOoSmL8ES0O8/LvIB3VJlvI1RiKUWSER
	W5g1HdCKAR6+hQPe/9PDUgTYJaepJPEFmNM2TAtJr66LwdpOvOT5YVnqy9H4grnKoQwj5bjEh7a
	/rIk27oG5UMU3sdEFvoWJxgv/jRTTMNwxI4zjTJsMhZ4y3PgUl/ZMDxJ8IZrD6ltRb3+hhh7GzH
	6z1CHGUJfrEpEUvervTL3r/Cd7CBt32yJLVLfqtuEjJZEmadvfXqr3Dj87V2RAkLd1cGMA
X-Google-Smtp-Source: AGHT+IGUBBqlucug+tYhzmQg4/LBhzLEpyPWU0/sKAK0VNUX8ID9+4dvzjxcp40ASdBECjx5Wm0gXg==
X-Received: by 2002:a17:907:7282:b0:b76:d882:5c8c with SMTP id a640c23a62f3a-b79ec470f4amr285629366b.15.1764851351207;
        Thu, 04 Dec 2025 04:29:11 -0800 (PST)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f4a2f19dsm121351666b.64.2025.12.04.04.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 04:29:10 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Subject: [PATCH 0/3] Add support for Awinic AW86938 haptic driver
Date: Thu, 04 Dec 2025 13:28:59 +0100
Message-Id: <20251204-aw86938-driver-v1-0-ebd71868df3a@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIt+MWkC/x3MQQqAIBBA0avErBNyrLCuEi0sp5qNxQgViHdPW
 r7F/wkiCVOEsUogdHPkMxTouoL1cGEnxb4YsMFOa22Ue2w/GKu88E2ilnZzjTeI1iGU6BLa+P2
 H05zzB48SKbpgAAAA
X-Change-ID: 20251113-aw86938-driver-b4fa0d3228a2
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764851350; l=950;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=LB5TEGmDMh5yLvSwpGpzXafz4FvgqYKihYWPBJJDkxk=;
 b=xZcZgr9pzoW6jqBNzXw6T8sWMYI70N1f5oWJLEddBbmoalgBmolK9MRjkXIql0zVlNdvfpAf9
 omoDtPZnWnZAj70sie49sx0+bCwfX3jQ7l8dv7CM0LU96DJ9zOdeI94
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Add devicetree bindings and a driver for the AW86938 haptic driver chip,
and add it to the devicetree for the Fairphone 6 smartphone.

This driver is very similar to the AW86927, and shares many core
features.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
Griffin Kroah-Hartman (3):
      dt-bindings: input: Add Awinic AW86938
      Input: aw86938 - add driver for Awinic AW86938
      arm64: dts: qcom: milos-fairphone-fp6: Add vibrator support

 .../devicetree/bindings/input/awinic,aw86927.yaml       |  4 +++-
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts        | 17 +++++++++++++++++
 drivers/input/misc/aw86927.c                            | 14 ++++++++++++--
 3 files changed, 32 insertions(+), 3 deletions(-)
---
base-commit: 1cc3747c5a6764ddc6b2d1d8fadb654493ac4ea0
change-id: 20251113-aw86938-driver-b4fa0d3228a2

Best regards,
-- 
Griffin Kroah-Hartman <griffin.kroah@fairphone.com>


