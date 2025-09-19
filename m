Return-Path: <linux-arm-msm+bounces-74180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E16D3B89675
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 14:17:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1DA01C862C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 12:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1FB33101A0;
	Fri, 19 Sep 2025 12:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XJwyIpea"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA8324DCE6
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 12:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758284257; cv=none; b=uvOGbe6VRMYD2AkEycc6/pmWap9Ec35pO0H5lPzzKJGyUvSAIKVff/CDxqcYEFJNn7s9ZidN3Ha5pOd2caRBPDMv4rDaqglFWGNbPpm7bX8qEzicmM2X7L0w0EDM0dwtyjMNMGai9ByYNP+fRDv1eisrwCMKvgIZW78DQxl7Hmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758284257; c=relaxed/simple;
	bh=R262FhlfMsFW0q5HHRD+q/V6p5+fuuWiE3osv+OGGWo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lvv5e+Pe5bA7SQu0/kLMKMXwFLKJZNXrysSkZf7H8C0yC67k3fb4jkp+NjxdcQ8DOgUDh7R52Re83/XeyJkQi85RCEMvR7gSxvK0kK8v1qIDfdBTIyULfGaqQizS/LIE28YYP0nUC9qxt8UtbK8wS6FhhOeLYY3kIJTf/5M7YW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XJwyIpea; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46130fc5326so14073125e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 05:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758284254; x=1758889054; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sTcOVCXQ8KqzC5yCQ0h/griplU6alFzdRxVKdGTYkrU=;
        b=XJwyIpeaXmBjkRJfUFL3RX3QO4FPwhRZqd4KE6eN2nPu3cjHy9aI8LiU335/+g0DUs
         s6iz6SHQLshUeT7LOdmIHEhBvWcahbgvsdDWo3OMba8ktDV8fDLL5PvAXUlVWLiuWP+b
         fJcyeOf69++oOFDIG8tp/Cir0I2/CRvCb4dFOWFYgZCFY0ziuPG+ji63ATCNcf71RD3X
         PL89amlX7/VVBit7mHmd/QRYohjlQtGRvad9+0UWd4VCeqc2Wjtn8S5ObbLQow1KWrEc
         GRuMxyULXmZzeG6RvnvfV3MTXxf2CtqRaqXWzOAoOjMmcK0MVhHsAfM++FR2tXFM8tNL
         Igmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758284254; x=1758889054;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sTcOVCXQ8KqzC5yCQ0h/griplU6alFzdRxVKdGTYkrU=;
        b=TrZSQi3klSMBTGATE35XGpkwy5SgwbYbPNR/nytqzwK7e5ey9+KoGFFCnIsFXANmjl
         BjA+QeDDXKr1HxfNkEq45ol5JqEBna/5IOqwgqtC+06O7wlstA4E9Pf/ty3l/u2noJXj
         /fNkqL36pzGoE2pJly0tonV/Pnd5Qn5qPHr+lGTmmLXOVHkKoqd63so5/VYRjOEGviUU
         BJzNrt1dXchHiovhwA9jLQ0h9DTlphlwX0UW9k5CtsOy4xyv61wF7UiWp/ePqrmvF8Oi
         oaOQlSwHt1t3uxXtgi/4F6D+RLSats2Eev145DnDYjHAL2HIvugADhenImWifG+O37bS
         uGoQ==
X-Gm-Message-State: AOJu0YxfWJ7IDzdPFTySxhkBPUb84LqvLB6wenoWsqUMREo8H0Flrvx4
	+q0C9LfNEnWyYjGcxHdEidOwSxe0P0yQWg4aFq7CjJ+kZuxDraY/SxwBvHjh2wJ+Nnw=
X-Gm-Gg: ASbGncsbX2noneJLMYfAE+9BzW6NIxhr2sC2pbcuwqMOwD7nl62YtzVWRMQ4ldT6L9d
	XhL1V8twiyIrs3o+DIkKVVVN6kFrWsY2eZPVAFBCgvY1w3lrC9Gh+aQ4JTqBjtwVjGkIIFztjx9
	kqcRIJUVsNHuUXvnhVmVI6l77G9iOashfOFMdRcC0AWeXGRTgJkhoysilYJDKm9e0Qe5lRNJ3ZV
	C8MQJ/ynxmcURT6WR9CTuQ9oHt/DPAgRlH56ccLLljsZnFEaoKB9CKYympjnewDY4CVxzCYkwSc
	IjWp6FVO/472bKMmcPRempJk276zhN91zR4zadQ6kuQs0umvwnjEP6+M5FH/tAfosKfcjg4ce3k
	04/bYblk/AD4Psoj5IN/ko18=
X-Google-Smtp-Source: AGHT+IHdAAsZy+REyU3RhOvOyagGKottFzSw++8bG0EdOWNNXW7I3fY5OjUbfyjqPu4Dwme892bvOQ==
X-Received: by 2002:a05:600c:4748:b0:45b:4a98:91cf with SMTP id 5b1f17b1804b1-467e7f7d874mr26313575e9.15.1758284254001;
        Fri, 19 Sep 2025 05:17:34 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbf20b9sm7655176f8f.57.2025.09.19.05.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 05:17:33 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH 0/2] pinctrl: qcom: glymur: Fix gpio pin functions and
 clean-up match table
Date: Fri, 19 Sep 2025 15:17:10 +0300
Message-Id: <20250919-pinctrl-qcom-glymur-fixes-v1-0-426ea410aa94@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMZJzWgC/x2L2wpAQBBAf0XzbGqX5PIr8qA1mGIxi0j+3eTxd
 M55IJAwBaiiB4RODrx4BRtH4MbWD4TcKUNiksyUtsSVvdtlws0tMw7TPR+CPV8UMKc2Na7Qsre
 g/yr0C93r5n0/eJzJsGsAAAA=
X-Change-ID: 20250919-pinctrl-qcom-glymur-fixes-7ea30c8202f1
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=971; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=R262FhlfMsFW0q5HHRD+q/V6p5+fuuWiE3osv+OGGWo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBozUnSGht49TvMo96sfKQQExA8xvC8FWGMyjUxO
 Qt3oupUJ/uJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaM1J0gAKCRAbX0TJAJUV
 VoH2D/4pKFeHCkR5O2ABF1HFvHMH6tHzLI+PYBbClqGsbl2Dobm2U+g95o94iUx4aLQwW0SbVk4
 ptmJz38hZsciS8Phtv71KNylihXlwoST51RrysjFsERDIFDtcEBd/CxhWEeKguYenWuCj9HRxta
 1h3Gsx5Qc4YD5mGzvKeuRZjsYNawtS19WO7ae7a/tHkuTisZ4yglcIcORuNP0myYRCkuH4P8bq+
 8T+rah+aXDs9WXbm+IX3RcM4LGrBcbVoNamT7lviQVwDKC3Iw30Fiinx30mU9Dyic/L5kJJLHn+
 d5/E7Fof+j43HthkUJrMAo6nSIpOlXMCeIxB3RIqwMIDZvnJFHSgnXddUUyhgxS1WE3qRnl/yfs
 TJRl50nQCsqvK3oOsiO6pSxEcgfnEycGxAl33VMLN1Mr1906yOle/TdjSrjDt/R5Frsi07uSUhW
 PSEDw76y3W50NhZeb9cZdn3ibww4p1StWLX1rH4kQn/WdyLy6iNHk9YPblzB+At74hh/GyICfr3
 QYYt/E0D6lVwsnkcQwZhQOY2N2xbC6JqYR+Rbz+HX/Fii22iuTjmOZQzqj+fq2VAt/QiCPtZiZl
 3QvHtvnmCrJLXq7Vb8oP/SgXBUsZ3CkO3tmcHln3km2NTjmqvBWky+XbiX1vqNdybdrbDbo4LtS
 0BFRMaGmevCAPKQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

This glymur pinctrl driver is not currently being used by any platforms
upstream, but once the entire platform support will be merged, there
will be some issues with the gpios as they will be wrongly requested by
the pin muxing config in DT, if the gpio pin function is not marked via
the generic macro as GPIO category function. Fix this issue now by
marking the gpio function properly.

While at it, drop the useless compatible specific match data from the
table.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Abel Vesa (2):
      pinctrl: qcom: glymur: Drop unnecessary platform data from match table
      pinctrl: qcom: glymur: Fix the gpio and egpio pin functions

 drivers/pinctrl/qcom/pinctrl-glymur.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 8f7f8b1b3f4c613dd886f53f768f82816b41eaa3
change-id: 20250919-pinctrl-qcom-glymur-fixes-7ea30c8202f1

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


