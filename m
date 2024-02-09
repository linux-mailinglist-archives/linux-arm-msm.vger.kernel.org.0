Return-Path: <linux-arm-msm+bounces-10293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB9684EE44
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 01:17:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4949D1F28363
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 00:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751E6360;
	Fri,  9 Feb 2024 00:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/tr9z9r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EAD364;
	Fri,  9 Feb 2024 00:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707437855; cv=none; b=HfXDLS/uqj7zOD4JZ0xatNa40hKwuzOAHo/I9sL53Rw3u3fIGKjecPikn2iFhJ9dtBXTwu/z71GUc+4vNESviB9F7k1zHfnaJnlDIrOFKLyi7Qtv9kk9KLB3RHKm2Ti+86Aiy88a0gYbQQPr9ClCbkGUv5LkelFtAk4VqNL3yZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707437855; c=relaxed/simple;
	bh=M0GnPDl6X+abY3bhjpUjba/5Za3N4vRX2UaLVz37UmY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cUgSalZKHexqJRnANsjKFeVBNzjHV6YA47KmwFI15FzHjbx6QzXNQdrheOvaaaqNTGEH9JvtBb6ljMbjLo2Y69w7fQKLMqlucweMulIEXjs3JfdYg0rwCkCXQ8sLK0+ODIXMewmUG4dpFuu8VSqN1MhS/dX4tHygMy96U5qXs1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/tr9z9r; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-68ca3ab3358so2301936d6.2;
        Thu, 08 Feb 2024 16:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707437853; x=1708042653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2+MsuxuH9sRLhHUmM6mao4rxTSjWbefmEBS5HyjKTp4=;
        b=g/tr9z9rbwX/j/Tt7jCPVgmsS6YnqgZS4cd6MIugW02bD+baEug/NBofg5ymbuSsci
         FoNE0FYGoFsq3D74jfFjHFSwYIffLQApPHOdLSe6fpr2DlslJcLM4GT5PveEcRJvCH/g
         A6uBYMeJCdi7xbKTMV//7Z1GxHgJgWudQ6zvYGyL9ztf54T7YehFGzR623teDOURgNFB
         gQFPvySbryZyOF2mZJRUMvvg0rCCkO176AYwta9dj9pnGivZ5sgigiv1zORwhK4hWD7+
         IDGVKhj8LTXk9Ap0WPfGMPxhZIqEgHw6dklkskayqkLjTmEkjhVUTmx0Xb4mk9EMXZ03
         /pMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707437853; x=1708042653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+MsuxuH9sRLhHUmM6mao4rxTSjWbefmEBS5HyjKTp4=;
        b=wwaRyi5CItcQE3nsx8mr7RRBQP/GhZG/ef6TnyOTfB702mIgRf6c/OQ6LjA/Ds38SS
         DoX4O5GScfePBvlYq5VfY8xEADcXilL6fLT8mPmE0AU4jt4xR9PD0v9Izn7acZp8mnnT
         sy+mg7Eyx2gl80gAak97LdpvtGhXDrU3nULxl/Fcr+zUn4FogkXYqpx8Rw/p+c/ZSxz6
         MigHkHW2FRIdmByJkunNgduPHkIFGFZFqTIA7ip+P4a5T6o6mSMh0+ePrAiWRgBgdWFc
         ZZ5DWPHnpHgX9Dm4HpyxlH5DoMdF9eE4f8FK32RufbnFtppzpcNlrtheArIttU59NiA3
         K7Sw==
X-Forwarded-Encrypted: i=1; AJvYcCV7nRb2sBUx+tUO/5EKNi83Vo0oWc9+zRKp1TrO+CE41CuXRWNUNXdPxV88AA+JWFdQ/+zCrXYsV6FBnMEzL2Rte795HqidJBdyryxUMJWJpsT9uc17MMxsg8U06mY9UtWEjMZaEo3knEw=
X-Gm-Message-State: AOJu0YzTGsE/R9/98K1ls9jvr6i2kqe15tlpKcdtaUVqkBAhbdMBhLQ3
	pTSHcn293x+/aVQcRwkRbnCa+mr66WzcFE3ih++whkQsqyr1lSVBatDhKpsPIoY=
X-Google-Smtp-Source: AGHT+IGYjRw4HaXNToLSM5TrKo19pvEgzTUhm6rYD5tVnSEZOiLTLkmaO21eP4rpOdrIWvFllWA5lg==
X-Received: by 2002:a0c:dd14:0:b0:68c:c843:8ac5 with SMTP id u20-20020a0cdd14000000b0068cc8438ac5mr10516qvk.42.1707437852717;
        Thu, 08 Feb 2024 16:17:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXjP79Q18y/qU+R7IvuKde5fUJMjwHE/1dDiQNhllyAKW0p+6i7TvPPkrjkzgYMBBbFsFdz8hzVeTN96Bzs8oieW5OaGfGm5l/snpfjO0jgGV4xWa0t2TplBs5Vy0FWxHShlNVCF7plVVd4qrCMitowUJ0TjDUsleOoCtRvhZW96OXHMjz3ExtQEW3lMbXeSZMMflcybMon3CO4p8FVx5mGjuP486L6n4Qck35lh1YP+m1HJM/Jfq09n0iPXjvxJt5DMJS/ixIUnzEzut9YzOe9VosZnpUFJphh+34qjABZ/BMmXaKDM9apmlIZOgk61N5mgUaS++PaD6RsbtVGWtILxg8nszwh6RpKz2ZqItXJaG/S3QwjYK5xDDfHH6wKDpgA2v+eICRirqiYpT4qz65Obw+lI0Jd7CF5ADno2wTGNlzkt4KXrSiuqMcuwhmx7L7ZrFuZhXoeYz8hB5dwnJpEMOfRMYm9t+uiwpCut4iYhBWuCOIF6wHeDxHmsTr4Z+21JkdOYhJlSqw0a939LJRdJowaWNy5TILO79eyR92Cq4ke4Sh4m4Yx63/6vwNRTrGoQHkAODSX8oDd
Received: from localhost ([2607:fea8:52a3:d200::42b6])
        by smtp.gmail.com with ESMTPSA id pc8-20020a056214488800b0068c6d56d4f7sm282560qvb.92.2024.02.08.16.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 16:17:32 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 0/3] drm/panel: Pixel 3a Panel
Date: Thu,  8 Feb 2024 19:16:41 -0500
Message-ID: <20240209001639.387374-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the AMS559NK06 panel with the S6E3FA7 display
controller and enables the display subsystem on the Pixel 3a.

Richard Acayan (3):
  dt-bindings: display: panel-simple-dsi: add s6e3fa7 ams559nk06 compat
  drm/panel: add samsung s6e3fa7 panel driver
  arm64: dts: qcom: sdm670-google-sargo: add panel

 .../display/panel/panel-simple-dsi.yaml       |   2 +
 .../boot/dts/qcom/sdm670-google-sargo.dts     |  64 ++++
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c | 285 ++++++++++++++++++
 5 files changed, 361 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c

-- 
2.43.0


