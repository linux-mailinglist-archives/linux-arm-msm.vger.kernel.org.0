Return-Path: <linux-arm-msm+bounces-80632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B9032C3C22D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 16:45:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C8135351AE3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 15:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8272320386;
	Thu,  6 Nov 2025 15:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Oj2hIZ0f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22813043CA
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 15:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762443901; cv=none; b=KVwnlJKzAf2n+krMXS70w+mIeuDizRnL+Tv0fzgo9//DR6ywCWfJEsWIWaZKT2ezqY1d6GgiPhXgOuNWeAZMOpz9quSrlMoOpDVw7V7vhFwpMYy6Fpo6tHtwAGDCHmcyNyiRz/dfD8OqI09BiXO2756YSYsXT99S5Qj4/J4hU98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762443901; c=relaxed/simple;
	bh=m5IGuc219hR91E6jxj726r30nxaBrIgbepoJBLfYMuU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nfw9r+Y09do9yPak30NIj4YDuVNyXB1jRTz8avGNlBe74/tjBOD37pDzVtWuP1WiSztKUwuMovuVCW9XxJD8RsJNaRCHjp4NnnO/2EuJKDM00//Geuisraicyz+ZL8CMLbDL32bA7BN7lYMrEphaVaS3Vuy/lJQ95yVmCHl5ngg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Oj2hIZ0f; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-470ffbf2150so10570915e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 07:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762443897; x=1763048697; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aT/t6a4KBrR+Dsl/bounBEPokvpfPwhEHbEcRC2FxNM=;
        b=Oj2hIZ0ffij1IL671TsaxYfCizRNi4PiWHj2CGlxxuWJkg+bS43UlUlghY5QHuovEv
         UDyHqUBtbmoKFbK8ypGY2KvCQxzcgTlPEPfDry9L0xL3mf7kSw9s02eedusFOuDvNe3N
         pS1EReXYleAsf8LN9d8Fks0/GyEQ7f0upAajCat0ce24YsJftUeTs8eaav7e8Ie8Ts7C
         0K1BNqBJ0q/3VoWyqXZ8AQboWsl/SAf4XVU2n1RbWl+IVKpBREku8ik69NSRxxZ4fmfI
         xfKECQ4ZHfEtipb0IdGYQDNNqrGlpG5ejKs421LehU4TonSneUIqfLRT+0QZJQjBvgj2
         vYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762443897; x=1763048697;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aT/t6a4KBrR+Dsl/bounBEPokvpfPwhEHbEcRC2FxNM=;
        b=IFVDEYtMMLEaNusWnP90JD0QkR6V2I+3y1Oj8b59t2f50fPmn69zOCp+24H/DkSEvc
         Z/LLvN8I/HNI1cSf5NnlC8LnuC/bNvmasd2WW4loN4szufKt1ivL4nSlIPex/VsKH0B/
         UemOBxZNMZ1SEqSL0Fa9HuBDnM8d6pLtOX4EE2uGRkEjJi+pbCW+BeYBDZ08sh0wHxvS
         UCXuLF5JKFKB//GcXyKU11WG2sGbxQmd23piY1Ss/w3BQoyyjsWgdF+GxviZZpmFzKZY
         wxEv8lZPxu4dtK9W3fACeYN5kuyr6smz/aQtR1fvLDAbb/5hOyP2ZB44JZHXmmhmKnn7
         RUig==
X-Gm-Message-State: AOJu0YxPY5gfAX43CKBzjNmP1s/p7aaIcW5+/VJZmXbh2LwHbfdUn9Aa
	jNma8MslsxN+GRCI7jIYpYd3aihioD6vivyMoxfvmYkMj+JqIpCPFAtMJhjFm6qT1pUp/z7mMca
	1HpUvku8=
X-Gm-Gg: ASbGnctLnEs23eXOdmv+b5LKkeXTeCLBUpFDfDpcnXzm2Ufznyd0YrNI0p4p6rIPK6E
	qBvEOSQ0uLfACAELuR3NOUlmptRj9J7v1VMEywxtpVVHAo42NFw1rQ37oI4zlwXOv7Kdqy1nj9e
	/aHEamF/+ISToZNKRdg5yRXKr5Vs8/7ua8dqdBqFwkFUwt+XnhVNSwqlnaGb0tfinUbOao4tsIK
	SuNL05s7qpfHpJEsGg19nmaQ0MQ3rs+u1knBTvvdKq7jQ9nMcpgWio4uQoq6uuFdAUseoLyZ5Fd
	jdzDjLJP9BBn5K5cINeX+k6IkBnxODq5kuUce1+hFL6EAKJqlR8sfixN8mqqa9rRJm/QBYtDOWn
	9QyoSjHf3YewV0hkT/ZS5d68YUh/bk6gwC5W8Y6CaQQT3ENgE0UaRHmdIg3zkhvFYTsjYvetUjq
	EABd+r
X-Google-Smtp-Source: AGHT+IE9fxs4rMTAf1h1yPirBF6DFkbLD1LQP4bNnKenkfRTYH5bQ38vhZIY+6TZBwAkKcgCf4p+PQ==
X-Received: by 2002:a05:600c:1988:b0:477:6373:ce7c with SMTP id 5b1f17b1804b1-4776ba75d9bmr501805e9.3.1762443896962;
        Thu, 06 Nov 2025 07:44:56 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d9de:4038:a78:acab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47763e66b1fsm20621705e9.1.2025.11.06.07.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 07:44:56 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/3] dmengine: qcom: bam_dma: some driver refactoring
Date: Thu, 06 Nov 2025 16:44:49 +0100
Message-Id: <20251106-qcom-bam-dma-refactor-v1-0-0e2baaf3d81a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHHCDGkC/x2MSQqAMBDAviJzdsC2bvgV8dBl1DnUaisiiH+3e
 AwheSBRZEowFA9Eujhx2DKIsgC76m0hZJcZZCUbIaoWDxs8Gu3ReY2RZm3PELE2qpVdY3qrHOR
 2z4bv/ztO7/sBAnI09mcAAAA=
X-Change-ID: 20251106-qcom-bam-dma-refactor-4b36275b8c3d
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=703;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=m5IGuc219hR91E6jxj726r30nxaBrIgbepoJBLfYMuU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpDMJzgNgQRm8qx7/pmdbGI2+JW/uD2olQMBTY5
 5r3mhZZLh6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQzCcwAKCRARpy6gFHHX
 cjIHEACCwHmB0cdbopPZxqv/VaUmPRQSXbSe9fvcixEcfilOkHFTELwlKm2in6/WaykAMQUY61X
 vvllhAECOdGGOnfLcF8Wm/Yaixt6eJWJ9m9lsANmehPCtkBbYtUg2HkfF/rLV2C576YjerxfrJD
 2+fLZwOtBOMjk9kziEbUWWE8fptx3JFFew9OWF5dS2eVVPT7Tg9yDCnFo+L8dUlFxLoqaE/EmVy
 EY/l5wGDSi5Le0YODuc4qSlwfwGY6CGQRFiEpzfMHAmNE9c8Iq0vqrmlG14IowjNHFSlmyJ1UCe
 9NPOJmTWBc8zFxdBq2ZITP4Hiv2zF4Fmefjyfs8N43+5+HWZIr4K0vm94Mcgr7IEObiq58bKMuT
 g9aOO3aVBiRJga9jI9RCOEbJZoJWlZ06KWbTQl9v/Q2aNXFoZA2NYlXhC8bGH68jh84BG7nvrVQ
 LPCSzu9LGLiVAdoEz0J/6nIUwBzXzXiHr0pDAyv11s/6X7Pr0edUjmtLyn8h9QX+kdHTX/0vLrE
 LpR8hH65KFRLnml+1Jc9wLmJ+r4LwXAJvP8XyUMla0J/HkzAgO+1s9dx4cBlI4fW7cZusADRas8
 XEaJaf0h9RkOwd4HrhK2GML4dVtV20ePtHpRAEBCcoQY8/YKmljFaAz7Un1rO6evOlfu6OvsgNZ
 KPkdJ4aCFCPKTyg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Here are some changes I figured would be nice to have while working on
the BAM locking feature.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (3):
      dmaengine: qcom: bam_dma: order includes alphabetically
      dmaengine: qcom: bam_dma: use lock guards
      dmaengine: qcom: bam_dma: convert tasklet to a workqueue

 drivers/dma/qcom/bam_dma.c | 184 +++++++++++++++++++++------------------------
 1 file changed, 85 insertions(+), 99 deletions(-)
---
base-commit: 0297a4fa6f372fd3ed8fe9b4d49b96ff8708ac71
change-id: 20251106-qcom-bam-dma-refactor-4b36275b8c3d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


