Return-Path: <linux-arm-msm+bounces-24118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A999B916CBF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 17:21:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 666D3281466
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 15:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88039171E41;
	Tue, 25 Jun 2024 15:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rH46EZSo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D3F17C23A
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 15:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719328486; cv=none; b=JwL/3ZHIOFDdyyj2eJQ1txB2d3h0BKc9nOgm2kBfqmSm2/iA+G7j9AyxS0A/TYImbImAZu2gnRgDBESUZA5AXtvAcqJmVI/0IXKeVKHynQNqD01rG8GSNnBRufVzd+tqIkkcp42OMfLWBaX2YSX+oxTF0oHtYHvAufJyL4iSNx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719328486; c=relaxed/simple;
	bh=fBGFNFGzOFp1BU1QtxpruUaeE9znadLX8hjGv2/aaOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hxm6kcN93z/Y1RCcLFFDntbQg9P/nnR1RY37ECmFHUkEm+j1ix0pHl2q7zyklMrKbbqV3GtP21LSoc7dC9OHKPHCuMWw1zSxjDB3zz6KsqWr4tOjPhmHewPsYNvQYL+of9x7HXWvTyA/GlDa3oFphfqE0iAeqJ/ylK8sc6mFf2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rH46EZSo; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-364a39824baso4088364f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 08:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719328483; x=1719933283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fefG5PtJ43ubkDYTtVgklUHFM0U3auLPTAsbXvD1ii8=;
        b=rH46EZSoLSo2qv6pctjtGFmvcNeSsrXDPUJB29sLLBMHvmezMK3TTk4E147A+zzHdw
         +DRqUUI4TyWQIp+FFJYN4+4FwhsbwCYLRP4zaZ/y4pHlPYsOFHi66mz2f6Hep+t2ionA
         Kvd/aUIw+7mgXXNzsv2t4MMhu+DXJuoK6fXY3ooO1wplLTO3Ge5ljp727HXfM0wA7N1g
         T4mTa0dHlIFaQJ2RejpG0eMACaPady5XWu6QEu0Lc3zgYcRKuYsRKBy0ST1aHTJK3o43
         2nR9z2WrGayxpbjiF0chMOtkxN2FAbT+oWP86ycIH62ixRPE+bbwp025Rb5ckHucJ+AH
         7SWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719328483; x=1719933283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fefG5PtJ43ubkDYTtVgklUHFM0U3auLPTAsbXvD1ii8=;
        b=AWDzh+DudR8zytSSsUkB6alew18eM7UvT5K6OQb0zKK+uMvDH5zWbOtXVF0GUhXtsl
         ILWL02mN2A40UDn1bOmNzOT2BHhzzWjm+RHgIz1oR59py5IEpoFkNWc6Zu9tzf6PTGt/
         GtEgDLltG3+5q5j45F4PJm7LNTjHESG6CYh33WVrTIQY/8PVukcR9df2rAIxBAVr3inS
         SxB50bEbWP6v2Ug+uTVoHDC7ns6KRKLDPQdJ2FArRDD1AM48F8scGK4E7dOwgvlktw9R
         ZneBVR9g6rDfhiWnhRk2l+DrR98Vvyj+jCiAGQzceKToJeiwlaw8JcKNH/GZMBs6ZA3p
         y4qQ==
X-Gm-Message-State: AOJu0Yw4BEyLoFVcgFkqBhVFr6Efmq31scmuSqzD3eYyaIKcjePb2sdA
	GuUk8WPMyG6FURN2usH5agAK/wM7rV1m2GwXpwWxYxWPU0gOYyu2PZQuao913pg=
X-Google-Smtp-Source: AGHT+IHwIK+TnP19YVLo3AYj0eY9nbhZy4hT45GMiX5FEUDK7tG44lSiQtP13Ar8obdwea+Vgn2fOQ==
X-Received: by 2002:a5d:59a3:0:b0:366:e7ad:3ec6 with SMTP id ffacd0b85a97d-366e7ad3ef3mr7187328f8f.15.1719328482913;
        Tue, 25 Jun 2024 08:14:42 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2b2c:4971:1887:588b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a2f694asm13215884f8f.77.2024.06.25.08.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 08:14:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 0/3] arm64: dts: qcom: sa8775p-ride: support both board variants
Date: Tue, 25 Jun 2024 17:14:27 +0200
Message-ID: <20240625151430.34024-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Split the current .dts into two: the existing one keeps the name and
supports revision 2 of the board while patch 2 adds a .dts for revision 3.

Changes since v1:
- add a new compatible for Rev3

Bartosz Golaszewski (3):
  dt-bindings: arm: qcom: add sa8775p-ride Rev 3
  arm64: dts: qcom: move common parts for sa8775p-ride variants into a
    .dtsi
  arm64: dts: qcom: sa8775p-ride-r3: add new board file

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts  |  47 +
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts     | 836 +-----------------
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi    | 814 +++++++++++++++++
 5 files changed, 885 insertions(+), 814 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi

-- 
2.43.0


