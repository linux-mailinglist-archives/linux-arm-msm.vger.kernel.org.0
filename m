Return-Path: <linux-arm-msm+bounces-35470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7974E9AB548
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 19:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08B7F1F219D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 17:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BC5A1BE245;
	Tue, 22 Oct 2024 17:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CRAE6afW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2691BDAA5
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 17:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729618848; cv=none; b=mguPuGBU35VsslhDwuUBRK1f5k5aey+iz6X8Wl3kd6XVEMGtgz7XsLleoDG13IdbgxosMsy01QCDRRfdiCZxDu1nqPrmB0JW4tdaZdldqeXyBKx4nz6Slz6RPZvBlb66KlKbvBEWehFPCE+we4mefir7RsvIYfmJJM2fKVjsSs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729618848; c=relaxed/simple;
	bh=C0yUyZ6XkQJmWA3d7HhAPX4tnErtrKNS5NnyzznqJX8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l3hWEqc4EHMuIFUfoulpKYsDF3eMrpvGWLSLSRw0EMozvdSnm1z7TZ45PxHJ1LC7Edq4TXmlrG0W01lBkVesHS/4rNEFMb7AwT8ngl0onvgIrQT+MLLrZq9yvM61V0tQv54NIcFBTHWLtS8s1KW+DcaoelhxVSO3PFUvyXxOKcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CRAE6afW; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7ea68af2f62so4558680a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 10:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729618846; x=1730223646; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Oupby0dRgGN5Xj7RL7U1Svi3uhRY52g3w01e/cCB/qY=;
        b=CRAE6afWjlMf8YlQShYEkV+SoylcX5ZAifgdY1FNwbmkOIVIvbg5ovrhTf2uO+WuXX
         WRHU9/H56ApardiKy8+rUy8fJiSoMZSc2pPQ7MYhrai4sxAJ2RNV4bgnTPgLE9c4S/uO
         Ocanq+upQ927LS6Gk07INCRjxA4RgcyC3Hso4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729618846; x=1730223646;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oupby0dRgGN5Xj7RL7U1Svi3uhRY52g3w01e/cCB/qY=;
        b=kli35FKx9Tx/n9WGTcB/uUcChUrMe1cE/PgSG2RSeqiPT+P8ZEmwqGY6mTiIoednOc
         pKBJs70j277p3Ghhty9IIOEA2eFIl+kCws4GASM95t6O/9Tzy12VGFET6A2wbaPcI92b
         gBfOBaDK6d4caW+K7nY9PY5dyaspa+T9A47rap4hnWlFyyUcYbJV0YTsL+8sRcMA289x
         xwLNt+N/X1ZEYZKeXNAyARgJkCXETZ01wCQF5SAdmurXdwr3tV0aRrfGfW9fAOssqOb3
         Kg7fGvkZHflq43ZwYY1WzOc7T9vKOrIV5FHZYq0iQzgbAMbzxkTQ4sZW9GgBXCP5jmlq
         Zb7g==
X-Forwarded-Encrypted: i=1; AJvYcCXy246lE3tTIwefDfybO0U4ifmxT48s8x+THkShKyiVPNAk9CNTKg+3kSF+E7WrYSgQKy7VwdOTXpZlQlX3@vger.kernel.org
X-Gm-Message-State: AOJu0YwHq4H6aalgNshb0f++98rDKhVaEwzqdvclkXVf0Q3GxG8uiu+n
	G0mdq/OZxgdLCLly6Zp2NQt3ZdX5KHLETBtWrVsYSUZKwKxddjswfYaFhUBgTw==
X-Google-Smtp-Source: AGHT+IEWT04yh/p+RAO8GEp7u2SQSDOAW6FFU8HzqLUb7plIoEg+2ByMr21qcUeEkUAFRuS94KYlgw==
X-Received: by 2002:a05:6a20:e608:b0:1d7:7ea:2f2d with SMTP id adf61e73a8af0-1d977586525mr449373637.6.1729618846204;
        Tue, 22 Oct 2024 10:40:46 -0700 (PDT)
Received: from zipper.pdx.corp.google.com ([2a00:79e0:2e13:6:158a:d1d:c077:7770])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec1312d6bsm4992423b3a.29.2024.10.22.10.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 10:40:45 -0700 (PDT)
From: Fritz Koenig <frkoenig@chromium.org>
Subject: [PATCH v5 0/2] media: venus: Add hierarchical h.264 controls
Date: Tue, 22 Oct 2024 10:40:41 -0700
Message-Id: <20241022-submit-v5-0-552f0fec8cba@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJnjF2cC/2WMvQ6CMBRGX8Xc2ZoLbW3j5HsYB+gP3AFqWmg0h
 He3MDDoeL585yyQXCSX4HZaILpMicJYQJ5PYPpm7BwjWxhqrAXqSrA0twNNDKXW2KASXCko51d
 0nt576PEs3FOaQvzs3cy39S+ROUPmlUXpuNPyinfTxzDQPFxC7GCrZHGYFVbqMEUxrZZ1a5RX3
 pofc13XLw2WEgjZAAAA
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Nathan Hebert <nhebert@chromium.org>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Fritz Koenig <frkoenig@chromium.org>
X-Mailer: b4 0.15-dev-37811

v5:
- fixed formatting
- included reviwed by for patch 2
- Link to v4: https://lore.kernel.org/r/20241017-submit-v4-0-d852bc7f7fdc@chromium.org

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
 drivers/media/platform/qcom/venus/venc.c       |  71 +++++++++-----
 drivers/media/platform/qcom/venus/venc_ctrls.c | 126 ++++++++++++++++++++++---
 3 files changed, 164 insertions(+), 37 deletions(-)
---
base-commit: d07b43284ab356daf7ec5ae1858a16c1c7b6adab
change-id: 20240814-submit-05880a074377

Best regards,
-- 
Fritz Koenig <frkoenig@chromium.org>


