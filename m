Return-Path: <linux-arm-msm+bounces-10118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C3084D252
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 20:43:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 737711C211C9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 19:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D08768F6;
	Wed,  7 Feb 2024 19:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Cp7Lc0mm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAF91B7E5
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Feb 2024 19:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707334980; cv=none; b=TwOt78/S5E5qmupVt4MhPKi5smExxnrC+a9k/xuAYTzowS6g/CcuncWE4ckhU45n2tDLC0SVZyriIq5A6bxvr93kX6I8e/NgDAnfboTMV9Eo0QS0FQ0ypFqhppMWnYNbOns+56mB1qpcjcHY6KSIJOT/4MLBXKiorI+wNsAfkVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707334980; c=relaxed/simple;
	bh=1DUIvLoqJsDx6XwxfsJ7AxmcxjXbrMOK4uhrKT6nDLI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Y2e7zkGw7MwxpAsps2NE7R2Vd2qlZG0rjm0uctGVBK7aCZHGnCxxMpsZmU3CRbuXSIN0RqNntogBtSeTx0WnSGZ0od/aZlsyxQtqdlx6cCertZFIbrQs6BeQe+ZanMeE4LwBJPQft3OZ3OrJMB6+XWQn70tDPce/WrkDE0vhBco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Cp7Lc0mm; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d911c2103aso6903535ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Feb 2024 11:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707334977; x=1707939777; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9dSPmQdouRR293fH+Hq9dDaCJAbWPO1pkBqun3JWnzw=;
        b=Cp7Lc0mm7PI46Bp7QygJUkdlsdShPRgYqnCw1tWFNoplQgJ78vW/I5q726+qxzO5bR
         dJzR3nf7RL6e2MKniGEgV3+Me0hbvCjYNqI00+pw25f1gKctv5aiJ7mrzrk6Q5b4XB9Z
         cCLjGsOGCoK9bRofqjx8lhs3KgTVkcp30hITE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707334977; x=1707939777;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9dSPmQdouRR293fH+Hq9dDaCJAbWPO1pkBqun3JWnzw=;
        b=WfqqloyhhkWMUfDaJERW3e7DU/XI7VQMGjKhz5c7Gb/TEIk0YlH7q3MGS6OQjs/rEE
         Gck36BpeDPdbZYgT5eeB3TPgn19dw+ivgznjwmWQYaF1BoCrk/kVIb7qtNQzuiKvGg3J
         Uh/BNL3N3QpNZr/iBGP5NZVnRM7WjvRqiZqKz1jMEjcQRU8iQTMJRYeaV0IcnL8/1hHN
         38xKzHSigBp/1wTacGTG8Pn9SUAxNB8BRSSvtNRjJgLmvg+UZltSJQ/w9IL3upASCO+W
         hVDku0TzuGJaASJ/W+FGjUzibUNHkHkM95ioBgSrcDtJklfMj5Y5hismgluhxYwG1hLH
         5POQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9Q/f9XggwYHqHE7SPRzJqZKQa0J/vXmSZYbbNLGrPJVLCLYtyibNjJQ3QGaoSY5zirZ2v/20phH1LKYapfJrqVyJHeC0QOOF2XcQdzQ==
X-Gm-Message-State: AOJu0Yyhmxt+Nh5fXjNLDJSN6oxOKqWtpJ/heELSPJNubLzsl7Iz9fiM
	tv4TvFpJbP0SgVFVg9YD7YwFV6tTDFTjb/NC5iopc3vlEY5oiOIWIs+2MmQ67/vSHvo3+t7iNqQ
	XkmV65tuy94ROqcYqtf+v229DgOq4isTE3y/LgW6K0S34Vj6f9g==
X-Google-Smtp-Source: AGHT+IFlwmKheScXxwcWxqvbwwwXxcbYu7LCXRFPdDg0seznp9RKCmI7XWNl9TBBgBi1LQukU833vFbf3w0qLe/pc3k=
X-Received: by 2002:a17:903:94e:b0:1d8:fcac:eff0 with SMTP id
 ma14-20020a170903094e00b001d8fcaceff0mr7297559plb.9.1707334977355; Wed, 07
 Feb 2024 11:42:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Nathan Hebert <nhebert@chromium.org>
Date: Wed, 7 Feb 2024 11:42:46 -0800
Message-ID: <CANHAJhGVU=h1+4WLMW-LW=U5-+vXozxkp-HC=CcCbXUHCZqd_g@mail.gmail.com>
Subject: [PULL]: qcom: SC7180 venus firmware update
To: linux-firmware@kernel.org, linux-arm-msm@vger.kernel.org, 
	"Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>, Fritz Koenig <frkoenig@chromium.org>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit b4b04a5cbcbb0f67d0d63fa66aa68f32b9dc5fa7:

  Merge branch 'amd-staging' into 'main' (2024-02-03 04:45:27 +0000)

are available in the Git repository at:

  https://github.com/nathan-google/linux-firmware.git sc7180_vp9_decoder_fix

for you to fetch changes up to 52ac76144aa006c284e509cbb02772c9264bfd15:

  qcom: update venus firmware file for v5.4 (2024-02-07 11:15:07 -0800)

----------------------------------------------------------------
Nathan Hebert (1):
      qcom: update venus firmware file for v5.4

 WHENCE                   |   2 +-
 qcom/venus-5.4/venus.mbn | Bin 921236 -> 922240 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)

