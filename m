Return-Path: <linux-arm-msm+bounces-84168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FE0C9E504
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 09:55:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C49F3A6152
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 08:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F712D5937;
	Wed,  3 Dec 2025 08:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BczPEQLL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D932BDC1B
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 08:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764752141; cv=none; b=l/+v74CS6v17zchL97vn8LxLzLzBrVpAV6O+BpjhQZyPSpJiN8J0Qx63RHsIhaZJppNzmyGu9bI1KlafJBHT4rLf+sxcI/ksiph07T8SHPEr3hXpLBYI/7XZYLGB9CoZEZs4HIwhwkLkTuxFBPKPWrvcjE5wdAb+tb/+Ofnwqos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764752141; c=relaxed/simple;
	bh=WZwTc3WGipU1rxTNrNT9q0JuopH580L2gUZ5qc9A4bM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HbSQYcQA/TnKPm9zBVaORz3GJoJZhX2Jxo9boMmaZynyi9AB8vs412aTpRNXIOimkSYXFG2KPNAJlU7Yy07allqostgCRUNQBe04HPMFpnTbY6R2xIpGQfWY0ecFpdL+ymJmXuhYqKxIeXkAoRSayncbUXwgBkqG1cT2teM4Jy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BczPEQLL; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5959105629bso6000372e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 00:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764752138; x=1765356938; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nLEuON7y1u9cDHc+MoWFTkLv0fcCZt0Zegqxsu+jQjM=;
        b=BczPEQLL7K9eG1OhP1XvbgvhWLu+ma8QxLl6c3Js09CIKt8o1hlW9zULnPOUF/QDc6
         qzaX97VtDkN7xqiGB/TUw/G70+fyedGpRyKHacjqJLxsS47yhvnx/OEahD3omBXhDXEl
         QE9a5Sjk8tCnh+5wer7eWih2tXxclpGYB+lkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764752138; x=1765356938;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLEuON7y1u9cDHc+MoWFTkLv0fcCZt0Zegqxsu+jQjM=;
        b=hX85C6YaZqIb6NNA4paDUQEnJrZ9oRDZqW7tHVfBVVr2pDaeB6q5yBPZPEv/XLOO10
         wYczA+484DWwsg4uRVjBNj2foixKCL4r3TyFa4GzrtX07/mOZathIlzKViWmTuM+KYpH
         fYpUkY+GoX3ClXruYsBzo30bGi2hbYN5zMD4rpRk9Wm207yNwI4rpH7u9CBPFYuhqlCP
         h2/C55UBchPru/sFNI5a607zLSNY6yB98LYt4265lrXaqoyM0fQ7/3T6SSI9ASWfgcV9
         l+N03xen1pW/2z4fN6FPSUROuS9P/0TC8LXIAJUl2qpZ0kTvoKYQXIzaqqr7wDmIR115
         M57g==
X-Forwarded-Encrypted: i=1; AJvYcCUmaehNIvypCeyzPdRxcCUdbHVtgfMN+36lVWYt/cjEEjxlAs4HmqWYKI5ih6i7Zxq+6MoymK0U5zqtJx/p@vger.kernel.org
X-Gm-Message-State: AOJu0YwhLYh6H8BUQGZhubR7OSRbDsSbw777p1bD83xHmHqxWvrhXdbL
	Mb/FemBuFsd7zdr+7fOaJen467/vBw7tlFuV5gkHhTLWCxSgqbEJC4EtzyrEJiSZsw==
X-Gm-Gg: ASbGncvVPak03bgghVfltZrbXfXao6KE4hcF8oRV2Q5D+YPYaArYCuyEGgrzOpUy25V
	L1aHtNcy/F7fdKQyykw9frueWUc8rWITr/v/CdoFhDRl95RaZBF5QwD8hKpSox9GGYdmAFufLNu
	EnqZscCb4MhcldaeQ5LMGllbJJULXfGACg2DzwlvkLJdnwnk92AHVjIe1H708Sqvoq7I+3K93o/
	webWJAcA9I2ky8rvphdqrcPQpYi9JtUg1J+pWuzDEwklE3+hAbePWnR6Bm+EcD3tXZO1e4mHx2Q
	sB8epLxf+ong2rDG2Cnphj6OzvI2tmPbavBWEr3mIHz/97VuPe5SEpu9Y6rCUgEEQjx7xiMhlIF
	3oMz2VOlaZUSa473RXbEwpQu/U186NKPtnRpzT0hcXpDLbA3vcJoloGvtqOGDvgzVn7LGmubk64
	5PEH4/wyVR/2S534yEhqbGxGpd7wJzgYZBI0DSa7wdOan1Ucdr8BYJlrTEcEcurvwS1r9jZQ==
X-Google-Smtp-Source: AGHT+IFJK3gmRvM23rF/5dH2NkTCVXsct0rPtygHdd/7NJo5i6wrVlVL9QhzHou3oQOeS0kXE48mpw==
X-Received: by 2002:a05:6512:10c6:b0:595:8200:9f87 with SMTP id 2adb3069b0e04-597d3f63d64mr733419e87.17.1764752137618;
        Wed, 03 Dec 2025 00:55:37 -0800 (PST)
Received: from ribalda.c.googlers.com (165.173.228.35.bc.googleusercontent.com. [35.228.173.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa43f3esm5315377e87.47.2025.12.03.00.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 00:55:37 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/3] media: Fix CI warnings for 6.19
Date: Wed, 03 Dec 2025 08:55:33 +0000
Message-Id: <20251203-warnings-6-19-v1-0-25308e136bca@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAX7L2kC/x2MQQqAIBAAvxJ7bkGFJPtKdDBdbS8WChWIf0+6D
 MxhpkKhzFRgGSpkurnwmbrIcQB32BQJ2XcHJdQkO/CxOXGKBTVKg0YLb3Y9axcC9ObKFPj9f+v
 W2gf9dPQ/XwAAAA==
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
 linux-arm-msm@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Stephen Rothwell <sfr@canb.auug.org.au>, stable@vger.kernel.org
X-Mailer: b4 0.14.2

New kernel version, new warnings.

This series only introduces a new patch:
media: iris: Document difference in size during allocation

The other two have been already sent to linux-media or linux-next ML,
but they have not found their way into the tree.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Jacopo Mondi (1):
      media: uapi: c3-isp: Fix documentation warning

Ricardo Ribalda (2):
      media: iris: Document difference in size during allocation
      media: iris: Fix fps calculation

 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 10 +++++++++-
 drivers/media/platform/qcom/iris/iris_venc.c             |  5 ++---
 include/uapi/linux/media/amlogic/c3-isp-config.h         |  2 +-
 3 files changed, 12 insertions(+), 5 deletions(-)
---
base-commit: 47b7b5e32bb7264b51b89186043e1ada4090b558
change-id: 20251202-warnings-6-19-960d9b686cff

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


