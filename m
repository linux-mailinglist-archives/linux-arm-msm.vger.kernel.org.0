Return-Path: <linux-arm-msm+bounces-28564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A081B952553
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 00:14:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A41D1F23139
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 22:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 413E4149C46;
	Wed, 14 Aug 2024 22:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lzy5PnsV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CF61494B9
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 22:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723673659; cv=none; b=CNanGZ0EaYqgYyezUFCfgCrnlStPzu+KAQTzleNWt2bqD65Eq8KbWK2lZ+6+iBz6GTKmpOFuuOL0NAsxys4i8p19VRQeI7A76xDYIyjdLCWehx43xMb7A100n04SD4BSVl/EirRaG019e2PKbL0z+lhAVLIQOSPBJZTbjstvY9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723673659; c=relaxed/simple;
	bh=SNRkXhDmCbbOK8av0t3Uel7gPdjevNHKKfFt/NX9R7w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mUGgqdm//lXkh3HVhN2E0SvsaVsqhU1Q/hIbTthNBW0fP+z6VuapG7qufWr/y+GzWihgDH9LNmnPz+JQOm8cDzL6H5JFh1VgTkVTA2Y7zYxVjK8VwDDZnN6CoW2XQuBldkmpABdWJk9tT30hE2lD0Qvw86xKJkz6BGjcTd8J4MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lzy5PnsV; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-200aa78d35aso3236475ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 15:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723673654; x=1724278454; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9dZakyOosNQEb8ThSHDuM5A07F0pWfsm3wFIDax/xIA=;
        b=lzy5PnsV22gqWFae0DcyKokPGhdFwt12GnOAr1Rrxb4Y9gDAdyAe5smfHTNCQ+md4q
         upEZuvfBiOD2HzbS7rbAXCzwjKwP5wqAZ/4O9NEAZwZRijQZHjxK7DN9ABfLCnodD8jE
         8CdjFbPY+5178V5o8Z8/f/BokCjRL/K2dNbgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723673654; x=1724278454;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9dZakyOosNQEb8ThSHDuM5A07F0pWfsm3wFIDax/xIA=;
        b=j7uVoMj2eKPriF7yt44h5K2R7hAPdvELT5bZKSO0DuukMXbc9d4Ix/Ctha5Yhjn0jq
         /U/7PsP1VoxENmPtayAFsVix7diZaGeXlkdMOeYm84OS8fj3yosu3p+f9QU3vwteJGUd
         k2jXSXzbQur5QYZf/u1NkxlnAN/5rFg9VlfoQhRmLJBN5Xw6OU2ZHiBGL/taf6/z3H77
         m+spxA69v7yWIck6Qk6eCwk+J21xdj00+SXU/Ut0Gx0WA/ZNaHJYzZWH7JArwH9F+v9O
         RL8tPF/5i5mSNQVgXXUKbTMl/ZbGTXdEAB0aMddcJmtgWJqaDmUcdYNowTmp0k/8C/CH
         YEww==
X-Forwarded-Encrypted: i=1; AJvYcCWwLWbN8QdofFL7FKNlt8DGbA2JM1OCVN2nFig9hGO8XCTBH5swDpPWnxTroFfMqsfZ3VJjQTXZQOZdqlTljgRuD1D8/X42F6OyPPZZYw==
X-Gm-Message-State: AOJu0YzdBQCTV27IStzeW2uvNNFfycYMtSP2Bd21qh4DS+XIgii/vNS1
	dPVI/2HI4WW7455QNrhmRI1k8087BlPxlq8cixAa7eIAf/tyRL/TOeXXSTi7Pg==
X-Google-Smtp-Source: AGHT+IHVQcqP4dstKT0IkJfBwrz7BgpmEzWgQOguFtF6ilWFMEfyEMuHWGaFU1rJVz0Q2BKXR6oqnQ==
X-Received: by 2002:a17:902:db07:b0:1fb:8c35:602f with SMTP id d9443c01a7336-201d639c9c4mr57253855ad.6.1723673654526;
        Wed, 14 Aug 2024 15:14:14 -0700 (PDT)
Received: from zipper.pdx.corp.google.com ([2a00:79e0:2e13:6:aab8:3da7:4601:820d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f0375725sm1046595ad.132.2024.08.14.15.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 15:14:12 -0700 (PDT)
From: Fritz Koenig <frkoenig@chromium.org>
Subject: [PATCH v3 0/2] media: venus: Add hierarchical h.264 controls
Date: Wed, 14 Aug 2024 15:14:03 -0700
Message-Id: <20240814-submit-v3-0-f7d05e3e8560@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACssvWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDIxMDC0MT3eLSpNzMEl0DUwsLg0QDcxNjc3MloOKCotS0zAqwQdGxtbUA3pp
 I/FgAAAA=
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Nathan Hebert <nhebert@chromium.org>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Fritz Koenig <frkoenig@chromium.org>
X-Mailer: b4 0.13.0

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
 drivers/media/platform/qcom/venus/venc.c       |  85 +++++++++++------
 drivers/media/platform/qcom/venus/venc_ctrls.c | 126 ++++++++++++++++++++++---
 3 files changed, 171 insertions(+), 44 deletions(-)
---
base-commit: d07b43284ab356daf7ec5ae1858a16c1c7b6adab
change-id: 20240814-submit-05880a074377

Best regards,
-- 
Fritz Koenig <frkoenig@chromium.org>


