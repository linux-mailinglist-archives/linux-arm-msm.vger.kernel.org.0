Return-Path: <linux-arm-msm+bounces-85386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 299C5CC402F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 16:42:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7EC8330303A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 15:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31DA5339B3D;
	Tue, 16 Dec 2025 15:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MuJyvKtr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921DE29BDA1
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 15:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765899749; cv=none; b=esg76sQImPVCDz4kdU4pjTQxXVPOun6nlLGGh0NE3/WN/Gp9rJlQ+koMH2yOaxxQGIgovp2s7Z0QSDApWwlhyekUCV22FEe9DBZqoGeMFN7hQrtgI2JOnhr6L5evQSgVkYLsKbnPTWOTL7336fbe5OBg7KmGRnK5vgX5uEaDx4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765899749; c=relaxed/simple;
	bh=GjTksOg/GY9xK/089E43Pg2FZR+qAF/QxOIBzlDRHrA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZcpsPCBTLdWLU4nQ8SXp88xBK7PRE/fQBGQxuzRXSArRD2nwaNiMc4KxEZcoCv2ThkhSPgfYIbF9/XKuxcL0Ft/Tr/ZECq8L4VfNKm3MZTLqEHXV8F46jD8MTEMRznqTeyzsTcxzQ6Td5yWlZQwm+LV/TnO1Dsz0wp/GykLR8MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MuJyvKtr; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5957db5bdedso5988755e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 07:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765899745; x=1766504545; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7mryX1pPR4ud4oxX9lWcTv5qZ4b+nUaJACIVLq8hPY=;
        b=MuJyvKtri569s+d/9IlbUzIwqE6cDTGVv7GQ8wSY0Rgn2jSjyEl42X8HmZD/1jLeyj
         7ILZUMSWqarzzz7CMvfsxdr7Bzv2pPz8V1fsQBEQWCUj2CXS11K1GAMCt8w3Ll0mkhpb
         kVc3L4Zrj80NHaHp1dFwujLZ3PDZkLX4AjGRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765899745; x=1766504545;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7mryX1pPR4ud4oxX9lWcTv5qZ4b+nUaJACIVLq8hPY=;
        b=KT1vVyXF8m5i0DXZEixcQl4c9j/KiJz8xkh0EMLRWzi+fj+zLzCR8CoBuFRCGA5wJk
         wfXgyvUw/F3rjxwg3PCapQwNNpcRquVV3EaTmtSsr48XkYYhx2BOpKgspXGR1Df8GWoe
         r7W/PL4dssOHGwklywIcUmRXsVwkdexlZHe5f8uiF+jKFAhTIerx9iuKkPHPQD1M4STJ
         RVfRLUs0L4hFGCif9R+v4uz01AictpqeuO1zPJU4z/TvsSAeWar1GwiOHNIqbl8qjJoz
         rCAhBsE2BMLvvKxPwrfBShvBXYR00CcOqxUEWOVU5lvIb40SzN8mgwnfGDPdnJtYWT+Y
         gslQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQg/P6gFAQYi8t5rtVr6Vr3q+ZWmPI/gfTeiBrWomhdg/fa3eQAbZ6bj9DIxd/v+lpBsMw/siJOA2Dy9OI@vger.kernel.org
X-Gm-Message-State: AOJu0YxM0g0vDmeFMoQdm5OmWhVUyGhsnld8BufztMiTYOS+QT++mVm6
	8QzFXRykdJmMseF3N2OhnWxrhA6ZHk98Szxidb/PlrW/D6Wj84F0VQYaecDgkdRXMv3dBXTw7JI
	4A/InaQ==
X-Gm-Gg: AY/fxX5us2AJ6BV/HfpYm1l38x+wStCRBLak4Ui0ECBs0vED24LooYniynKJSUCJTfd
	IW1SR2Hn5JNsMoSxMeZRy3npqsFZKwqB2um0k739TgSCF/UNiFBE16Ez8z8LEMh94DdfdwoMFxp
	/3TVFyMcJs2Wyej141Kr01yl0/m1j1iFo8ESKarMUxYS1Jproy9MbeK8cBawB9d5j3VM44vZ6BZ
	G+xhr8s9bjPy2I4Tg8RwXs/1LRoydRPNBHPevbpcenOCTHYzf3odp3RbY6Fb2Vl3CQh9k8CQNSt
	GZxvoClLKPihNn1Jb/gwjGh4r4rqmLJ0vlVSzrruBS/WrRex4CMTg4e+w3LeOPh6pXfu4BC0G6I
	27N54jPfa0n4NFqUrPpL4btdXiPfMsoE8WDtQrmpWglwa/6clVTvgtiKYfDk8U0vaHwpBjIKL+N
	9NqeGMsiTkPBScAkiw3v4Vr5spVDW/Wy0xD8SEB+dUqRRndzwAAgG30JQuZsXyrRKQPXlniw==
X-Google-Smtp-Source: AGHT+IGKZHv6lRA/O8HWR45tPSrNpis8zn6lvRM//u5qtyU7drZ8s9wFk27hs9CDZJAlQRCRTTQ0gA==
X-Received: by 2002:ac2:5e73:0:b0:599:fe3:779 with SMTP id 2adb3069b0e04-5990fe308c9mr725665e87.27.1765899745397;
        Tue, 16 Dec 2025 07:42:25 -0800 (PST)
Received: from ribalda.c.googlers.com (165.173.228.35.bc.googleusercontent.com. [35.228.173.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5990da1a4b8sm1003489e87.31.2025.12.16.07.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 07:42:24 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/2] media: Fix CI warnings for 6.19
Date: Tue, 16 Dec 2025 15:42:23 +0000
Message-Id: <20251216-warnings-6-19-v2-0-12075e3dece7@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN99QWkC/13MQQqDMBCF4avIrDsliRi0q96juIgx0VmYlIlNW
 8S7NxW66WbgH3jfBskxuQSXagN2mRLFUEKdKrCzCZNDGkuDEqqR5eDTcKAwJdQoO+y0GLtBt9p
 6D2VzZ+fpdXi3vvRMaY38Pvgsv9+fVP9JWaJA1dSidbLWgzVXO3Nc6LGcI0/Q7/v+AS9e1IytA
 AAA
X-Change-ID: 20251202-warnings-6-19-960d9b686cff
To: Keke Li <keke.li@amlogic.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

New kernel version, new warnings.

This series only introduces a new patch:
media: iris: Document difference in size during allocation

The other one has been already sent to linux-media or linux-next ML,
but they have not found their way into the tree.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- Remove already-landed patches
- Use ->inst in Document difference (Thanks Laurent)
- Simplify division (Thanks Dimitry)
- Link to v1: https://lore.kernel.org/r/20251203-warnings-6-19-v1-0-25308e136bca@chromium.org

---
Ricardo Ribalda (2):
      media: iris: Document difference in size during allocation
      media: iris: Fix fps calculation

 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c |  7 ++++++-
 drivers/media/platform/qcom/iris/iris_venc.c             | 15 +++++----------
 2 files changed, 11 insertions(+), 11 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251202-warnings-6-19-960d9b686cff

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


