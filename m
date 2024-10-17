Return-Path: <linux-arm-msm+bounces-34817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A06189A2E33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 22:05:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0AB61C21A5E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 20:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B9362281E3;
	Thu, 17 Oct 2024 20:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="O4Ag2ZD7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C101791ED
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 20:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729195497; cv=none; b=ctodFsOqYvOABo4aSRi7vypC4/Sm1O4TwmqpfqKBSSYObNC5/akE4LrYgh5r7TRfn9jE6GGuTAXtCdxx5j9mq4D3il2sjmD2N1PuhQ3gsOkqFkOKADnHmCLDfU6ouMXt1bd8qODkwFVS21x4ihYT0V6U+sL/nUu1C91PEj5EkfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729195497; c=relaxed/simple;
	bh=Qm1GMCj9s7ZVm/rHBsoEHDxu99TWbXF0jSckjQod4qQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G7tgQjbDkHEq90YgX+NuEOI4PKXhdmoC3bmOY8Rl8R85JpZPhSWdACJ30mp36CCCtwBMcvy5vz9dAMNYw1YCXgUDabsS8ccnK/GaZ2YWQMUbuOgjmI6us7jM6OUgf0L/4i/ofhy+puwnEgUOqo0VsxWMnDvVVekrNtt3xbj6nZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=O4Ag2ZD7; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7ea7d509e61so725426a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 13:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729195490; x=1729800290; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eDj09dc2QEIl6UR3qLj9hDrktF4mFMWl9OGSbmf86hk=;
        b=O4Ag2ZD7D7Yf1F6Z8GOvbMde1aumRzULrbrAhWYK7rO4XoG6FXiJBpWpraXFBPYWLY
         iOtxc0q4KiLN51uN7jkqH3v9968wv8nxvJBJNFF8MVtsW9VazYXd3zZ2GSwUl4lO9+SM
         DdXTqCLHVAwvdr5w4/SYe45CUpzsLjeSNtgPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729195490; x=1729800290;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eDj09dc2QEIl6UR3qLj9hDrktF4mFMWl9OGSbmf86hk=;
        b=EkwSlBdVIbw0ItCaqKBj0rSf8DTFXlDaVDxN94xvKupahtkN3KvTkuq79Wd0+IL/7g
         i3+NFSl1yG9taCiIYXlJfV3IZw3IEkd7Bu0uXf+ZOUlghSahTIHiDcMiSuH6FDs0r0Qq
         YEBz+Wheajbqej1ZWI3yj5gc8psQsR3sJqTar3XQpYTq5jU60AmhDJzBwQ2UxF5pylfe
         1xFe85qpB96BAEAZx2oPezvT7u8Q6+EWIO/iRfOhElp3AJ1/YEwD1RBaM+o+05LSetus
         qzleDfvIHF4YtXo58pLtA4ySUM80j6QTAjzSuBCgkadlCbyoozB2EhLk5y64wElgcJsR
         qL7w==
X-Forwarded-Encrypted: i=1; AJvYcCXpVJW+oCgw5p10P21MospFU76o2iTjp47YDIpdQaHRVbNGIuueGE0We2svIPbwuEtkHyGWvh/GvVHfEUsf@vger.kernel.org
X-Gm-Message-State: AOJu0YwcPQ5idwUcNs1dESomIh2HOS4gpZQaoNIjRMcofOVBK/StO959
	n4myfrrHNPXig2ODZPwdUWF9J7OUtHrq4DSFjJ1EDxncGAyqcjnrbyK9mQI7Mw==
X-Google-Smtp-Source: AGHT+IF6lVclQ4oXNY5WbZFpvFSBm9cqx/5zVposFBtyP7/LO00BgnrvSt/oAOgZRyinmAwy13hnxA==
X-Received: by 2002:a17:90a:8d14:b0:2e2:c00c:cb79 with SMTP id 98e67ed59e1d1-2e5616db842mr175745a91.3.1729195490619;
        Thu, 17 Oct 2024 13:04:50 -0700 (PDT)
Received: from zipper.pdx.corp.google.com ([2a00:79e0:2e13:6:ab92:55d4:ae5d:528a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e56129dccesm110088a91.38.2024.10.17.13.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 13:04:50 -0700 (PDT)
From: Fritz Koenig <frkoenig@chromium.org>
Subject: [PATCH v4 0/2] media: venus: Add hierarchical h.264 controls
Date: Thu, 17 Oct 2024 13:04:29 -0700
Message-Id: <20241017-submit-v4-0-d852bc7f7fdc@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM5tEWcC/2XMQQ7CIBCF4as0sxYzFhDiynuYLmo7LbOgGGiJp
 uHuYrcu/5eXb4dEkSnBrdkhUubEYamhTg0Mrl9mEjzWhhZbhfaiRNqenleB2lrs0ShpDNTzK9L
 E7wN6dLUdpzXEz+Fm+Vv/iCwFismMqEmS1Ve8Dy4Gz5s/hzhDV0r5Apvr8FyfAAAA
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Nathan Hebert <nhebert@chromium.org>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Fritz Koenig <frkoenig@chromium.org>
X-Mailer: b4 0.15-dev-37811

v4:
- addressed feedback from Dikshita
- included reviewed by for patch 1
- Link to v3: https://lore.kernel.org/r/20240814-submit-v3-0-f7d05e3e8560@chromium.org

v3:
- dropped reordering patch
- updated cover letter

v2:
- cover letter
- testing methodology
- Signed-off-by

V4L2 has support for encoding with hierarchical frames using the
V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING* controls. This allows for
specifing frame references needed for temporal scalability. Encoding a
single stream with a single layer allows for the layer to be dropped and
the stream to be decoded without artifacts.

ChromeOS is planning to use this feature for the L1T2 web standard[1].
This allows video conferencing apps to encode once for a clients with
different performance/bandwidth capabilities. As the application is a
real time encoder only P frame support is added.

The ChromeOS test framework ("tast") was used to verify that no
regressions are present. This was done on SC7180 ("trogdor"). These
patches were also run on SC7280, but not with as an extensive test set.

Verification of the added controls was done with a bitstream analyser to
make sure that reference frame management is correct.

[1]: https://www.w3.org/TR/webrtc-svc/#L1T2*

Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
---
Fritz Koenig (2):
      media: venus: Helper function for dynamically updating bitrate
      media: venus: Enable h.264 hierarchical coding

 drivers/media/platform/qcom/venus/core.h       |   4 +
 drivers/media/platform/qcom/venus/venc.c       |  73 +++++++++-----
 drivers/media/platform/qcom/venus/venc_ctrls.c | 126 ++++++++++++++++++++++---
 3 files changed, 165 insertions(+), 38 deletions(-)
---
base-commit: d07b43284ab356daf7ec5ae1858a16c1c7b6adab
change-id: 20240814-submit-05880a074377

Best regards,
-- 
Fritz Koenig <frkoenig@chromium.org>


