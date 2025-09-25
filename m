Return-Path: <linux-arm-msm+bounces-75184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A25BA1397
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 21:38:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B69F91C20BBB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 19:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4439231D39D;
	Thu, 25 Sep 2025 19:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJT7hoJ7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6434831BCAA
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 19:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758829126; cv=none; b=KKYhnXvzyKfiH89lDyMVLyxI9RKXJYDy/1QzyDLGZDVKyBe381nY/Fku9rLQKdXvQFZnufIXn7QBshn0MHzXXEeJM3JAZszwLlgDvNUqMgKRL+QrIRT4zXMoE8qLev+1KNVtIkmTF2i5RrO6IeHmqvKWLFAcKXO3NLXxBHPc05U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758829126; c=relaxed/simple;
	bh=3jtritTomIIJOGP5bQqL6bgfQshpJwLoGR/rXMYMm5c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nU/1bV6sbMUB3np0AKrIJgQIzwqHqr2nNNNdYeatk+4JCii6M0cfGsJrz75W4uJmk/o3JIleVZ9sP5E8FNaWCKRKZl8uVDmf1VWLB6jQzGSJSL+hF0mymyP41NWhnQ9ACoe6/1zcyvEhPASyEbf9daYoo+iaxdNU/i0SHpTcB7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJT7hoJ7; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-63486ff378cso3343818a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758829123; x=1759433923; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/9Wvpl7tsF8zVqpRGGfjh2Xv56vwrOQHtzvQulfV0B4=;
        b=aJT7hoJ7n2XFQiKBhIgO5WGs78w978ZeweB6CJmXHcZgSuF/7atw6bFaKkFi8DtSI3
         psp6kIKvBYVmcDWdUcM9b1sRXG3fRyfmMPrr+EFxYdLyM8ix2OqpkFKFSMRKkIkrzPme
         9NAG2oL1C69wGdMHl146iJ4hnlCFxiREJnC/Xn43ONIs+5K89K12eXBRzCigzRj6xoaN
         TMcUGqacjaVMLBDoUjX0nAP8QXTP7j91g8zftbWisZ4JXBjT3TlmS5rY1V6mmTC/+VLT
         2TPveR/lNPodLFmHx911G+8Y9WuKCK9U9gIwc55ZPFJTmUi8Ezewej89+UGlzBwkG3Lb
         qPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758829123; x=1759433923;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/9Wvpl7tsF8zVqpRGGfjh2Xv56vwrOQHtzvQulfV0B4=;
        b=xL52QNWtlkNNGNN+xwNyO5fjqF52kpQLjndq9TskFnQqac0hxMHrJtbvMWq3z+pdMD
         CU8IKu2sAzlcKTeF/mWq0oS2qWYj99qjIjp7JPV7dCTKxNPNpd5yMP4oNFsMRD2oK0L+
         04txoTS3BYyaapT/ywIuJCTZ3398fKwMyPLGE9JfaOYp5pWjzJici32QLh5F6GKFcz5r
         GY5NzqCIApBg9QwFotTNC37OOGLNEvWVrw+zNwB3ZLv+YCn72aT659Bk6RjiFXBYvt7r
         AfI5hR9g3CIgtstKFG/Ew/i/0PQ7dB/5NRdG2tEsSDCx1+vKhgekd379NrID0+AroOeY
         kL1w==
X-Forwarded-Encrypted: i=1; AJvYcCUdVRPXur3oGNa9zPbxsSGvPY9Lcresf9SXW/jbKLBqB3H9wCtEbthfZwo2xkvFbDs2yDN3BVkXQYGelfH1@vger.kernel.org
X-Gm-Message-State: AOJu0YzHqbZxjD3sYkghbjdxmP9trcBBZleQ7mpd2NzvVMEQkyALvZq2
	da4ra6SapRJH1457/X9ccv8lBrXkTsK3LJzUmNkSjTaMzlApU4Mt6NWa89oEEw==
X-Gm-Gg: ASbGncuys+M5K2xql9vPVkOiwrGCqGfLsMQ+AitykCv4OVkw+zHdgNdT+Gu4/MrvoaH
	kPfCBhpC/y2W209SObb0j2dNG26hKjPZw+E7x49BqiF1aGwlg+77rl33Iq++J881LH7EP83f3t1
	t2OMRKrb1pbzEnLo41+cY1YXHiNFiw+eDQVsXxm5YZMcfYdPPGI9rOjW3u+qp8jql4ztBRnbldV
	BhDPNq3iA259XUqbxM6LMUJmDeeVUES2Y3f5pPxZgGx/BThVMGkoZ+zTZ/FtQHlHu3DC6mXoHUd
	/S7ztHdfEUHxDCrPVsRoIzXXlKnFu9y4CLXB89UIYWuNDuYRxUR4AIIl98vxWMxyDMOLG0eDgiQ
	iyvcanKE4bk3BesOLU8GD
X-Google-Smtp-Source: AGHT+IHVfiZc5UUcQsfZ8VprnirPFyoO5q03AQaUP0MdlBl9vBg3XfFQctzKjLM1COCQempCX+djBQ==
X-Received: by 2002:a17:907:86a1:b0:b31:5c00:4fcf with SMTP id a640c23a62f3a-b354a8a6b48mr461767066b.11.1758829122436;
        Thu, 25 Sep 2025 12:38:42 -0700 (PDT)
Received: from [127.0.1.1] ([46.53.240.27])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b353efa4c35sm222820766b.26.2025.09.25.12.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 12:38:42 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH v4 0/3] starqltechn: fix max77705 device irqs
Date: Thu, 25 Sep 2025 22:38:36 +0300
Message-Id: <20250925-starqltechn-correct_max77705_nodes-v4-0-93b706bdda58@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADya1WgC/43OTQ7CIBCG4asY1mL4q4gr72GMIcxgSWxRwEZje
 ndRYzSuuvxm8bxzJxlTwEzWsztJOIQcYl+Hms+Ia21/QBqgbiKYaNhKMpqLTedjQdf21MWU0JV
 9Z69aa9bs+wiYKedLAU6A8ahJhU4Jfbi+Itvdeyc8X2qrfI9tyCWm2+uRgT+vnyaf0hw4ZbTxw
 noDXIKFzaGz4bhwsSNPfhBf0jAziRSVRMW1AqkV0+qflD8kF5NIWUnl0PilUejA/JLjOD4AQaM
 Wuo8BAAA=
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758829121; l=1505;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=3jtritTomIIJOGP5bQqL6bgfQshpJwLoGR/rXMYMm5c=;
 b=0mONWX92miQ1ca78JbDbjDBDbVspDUbXjhToEXoIvvgAzItRLrTQm6f1orWnhVflC+F64NwU+
 lNH16APN+jbCf1C/3cIOZd66BTbgs5bJzmmMKAFI8Kq9Y2QP9i3G5gG
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

For max77705 charger and fuelgauge subdevice, use max77705 interrupt
controller.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v4:
- update trailers
- fix commit message
- reorder patches - Fixes should go first
- rebase on latest linux-next
- Link to v3: https://lore.kernel.org/r/20250912-starqltechn-correct_max77705_nodes-v3-0-4ce9f694ecd9@gmail.com

Changes in v3:
- fix commit messages to be more clear
- Link to v2: https://lore.kernel.org/r/20250909-starqltechn-correct_max77705_nodes-v2-0-e4174d374074@gmail.com

Changes in v2:
- run dt_binding_check, dtbs_check
- make interrupt-cells 1
- add patch to delete unused address-cells and size-cells
- add binding patch for interrupt-cells
- Link to v1: https://lore.kernel.org/r/20250831-starqltechn-correct_max77705_nodes-v1-0-5f2af9d13dad@gmail.com

---
Dzmitry Sankouski (3):
      arm64: dts: qcom: sdm845-starqltechn: remove (address|size)-cells
      arch: arm64: dts: qcom: sdm845-starqltechn: fix max77705 interrupts
      dt-bindings: max77705: add interrupt-controller property

 Documentation/devicetree/bindings/mfd/maxim,max77705.yaml | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts   | 14 +++++++-------
 2 files changed, 21 insertions(+), 7 deletions(-)
---
base-commit: 8e2755d7779a95dd61d8997ebce33ff8b1efd3fb
change-id: 20250830-starqltechn-correct_max77705_nodes-1162dc2d9fe7

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>


