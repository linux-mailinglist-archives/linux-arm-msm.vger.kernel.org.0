Return-Path: <linux-arm-msm+bounces-74254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FD1B8BCE8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 03:47:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A9555A3849
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 01:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9408D14A60C;
	Sat, 20 Sep 2025 01:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dmmgozi9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE082AE99
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 01:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758332824; cv=none; b=A731LAe10hCbnlrJdc5IeeTxiEwbXldc+aDyznnIkGTgvVU8bZdEuvY3yJFISP8riILbjudKiqzcGcQ8rWX0GmCkRAbAQhvU+OHwNE1jdpFjJcCU5CSyFEfhLrwXQur41AFJ9ePc3W5luOkoHAsJ5e0vzfMV076LPYBgL8ZjZFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758332824; c=relaxed/simple;
	bh=wDMWA1XDRYyfWXmf2uFObk5LPGfLk4nxYuVObBjxLQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qAMKsZdM35va4rjzKhk3ShORIZbV2nbAQKivwyCtnxGPTF9ywNrxB//TkELCuUA+dBacWZEIXMUhkMWpUByNUI8rg5OUuOgbwd/DIDWm+P3buGh5odRtlkSeS6rz/dxqRL5wCQCSJGMPPDOTlEL6ENMtuFqPTymksSS/nsHPDEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dmmgozi9; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b4f7053cc38so1997180a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 18:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758332822; x=1758937622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ItqGWvE73tEMGd0HU8fsZkdI93BYRYkpjepUbVRc3aY=;
        b=dmmgozi9j05dxQDBS8nX6IBdyiU4VhIvtQl35ajIz65Kq1+gwI97pkJPI1Z3SuBNGx
         8TFwjvGX2NwRpTcPVbYG/Onrfvd90S2A0kAL83H8Wxu8fOaU+DVWwfoafpF/jeyjd2Pw
         agsGyxG+my2qfwUats5rX+3zLqY/5u4b8sHsDLaiTWk8uefHnKKamNtq5c/Q1qNlV0fO
         dQKuTu5lbNyrCfp04ctzlGJY6mYhsy8aahOeI81tML56y4JNgV964neMJVJuQdBxO5cG
         R9ZhQ9ma46p0bn38iAmd3v86pCELtHVFkFm86CtwJlxD6xX7Zph3SV+i+o5zEQRG5D3Q
         JOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758332822; x=1758937622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ItqGWvE73tEMGd0HU8fsZkdI93BYRYkpjepUbVRc3aY=;
        b=KHsMhgPSzxRBzfgmrMeyR6568SZ7yGmEIzAuaY4fUtVs2IiAh+yYRzGodhCxP2DxnX
         7g0yZdU4GIsoufzdTWpZTuqEwlzBAIwkR3PY4vhDo00bJZsAdx7nB0clHkd4y16365w3
         YX4p16OD5lBS+K9gutzdzIzX0A1rwmuUVfO5R96vKvTsZfjk756VPnkrdwT9kGJjYo0H
         ffHg0MfGNk1FS2ZhVI6FeE58aHjANO2TW23epmEjuw7hoW5a7GjfjVMMcunzCBPnlPk6
         AVlGHcAS581HDAB3StUSoV/e0m8/TMk2X7sFitqByE1LvUDWQnD4UdcZySqMSLEFfI86
         T7pw==
X-Forwarded-Encrypted: i=1; AJvYcCUXE8C5v47+h1x0v4XrFADRkhJPSGQ+kld6Im/jc/1HXrLQbfuPrXrpwynQq6TtxRhyNQS5ZVO7Coz09Ngt@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1NET+3YYvcOiKuY/nZaSPdbFPQaRLVajEvR/i6QQIVwZjUx2c
	kmE6Sr0MaBbNMoYXbSge0c+01ZSeUXJWgI2csSxYE1GqW2JUDNI6/irqFO2JqI6Q
X-Gm-Gg: ASbGnct4cIfDf1PA954OODsZ1sTjO7lTz9Y2Bxkic6g+bMqAQQlTpKzDkcR0Ne9USto
	zANKiwitd5pQZ5O3tgge/ugehd+MJMJVTv7axTUxhNac2ErqgBcXRTsgysrkaYMOIcRgSgWcvR5
	kqp8Q1e42D/gFwtVBzZeCA+L2j7aaDEd3d9QXfNZbuUE8+ascha7QDE+j+VPndqka8osREZj3T1
	o2hYW6Cx3ESVMu3HPU7jdXuXir8EVKQTuk+iFn0tgl+R75SS6K4O47NbKG6Gjg1dx1EdFqwXa32
	/EIx6v/mXiuQ2T+SCF07er8pHSKeFzHnec/shnPnFxM7hxbQ7sxexuWVxzuai4X4ccpBrnEX7Jn
	Q0MsgSg1q8RoALHwozcp0
X-Google-Smtp-Source: AGHT+IFhVtPRrzUa1oA5+mrndWQ6aoOCM+peC2mKSWqQa5wNTYiIDbb7fZTmJbOHy0FXAk8jpurd9w==
X-Received: by 2002:a17:903:1cc:b0:24c:ed9f:ba53 with SMTP id d9443c01a7336-269ba517018mr68430995ad.29.1758332822392;
        Fri, 19 Sep 2025 18:47:02 -0700 (PDT)
Received: from archlinux ([191.193.70.152])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698033c922sm65709455ad.131.2025.09.19.18.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 18:47:01 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] arm64: dts: qcom: r0q: enable more peripherals
Date: Sat, 20 Sep 2025 01:46:32 +0000
Message-ID: <20250920014637.38175-1-ghatto404@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patchset adds support for multiple devices found on the Galaxy S22,
side buttons, touchscreen, max77705 charger/fuelgauge, RTC and UFS. It
depends on "Input: add support for the STM FTS2BA61Y touchscreen" for
TS to be enabled.

Thanks!

Eric Gonçalves (5):
  arm64: dts: qcom: r0q: add gpio keys
  arm64: dts: qcom: r0q: add touchscreen support
  arm64: dts: qcom: r0q: enable max77705 PMIC
  arm64: dts: qcom: r0q: enable hardware clocks
  arm64: dts: qcom: r0q: enable ufs storage

 .../boot/dts/qcom/sm8450-samsung-r0q.dts      | 308 +++++++++++++++++-
 1 file changed, 299 insertions(+), 9 deletions(-)

-- 
2.51.0


