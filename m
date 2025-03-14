Return-Path: <linux-arm-msm+bounces-51412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CA5A61343
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 15:03:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66B0C7A79EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 14:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECD6C1FE463;
	Fri, 14 Mar 2025 14:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X75HbMkD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AD81ACED1
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 14:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741961025; cv=none; b=PPfeMnS8MB0H/8i65d++WZebxvGnt/HquE9uZ0U97xvbCgssnESoRTYnpsDQ51xB4Sqovz06wGCUiG9UQflJQviXyZC8eesaJjqFBkqsUNTwk44Dq/EcitPN8XYiLyoVnnQAEVuF8AM+V0lKlGDVFNybDQ6InBAr7zcw80+I/ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741961025; c=relaxed/simple;
	bh=pxJDHvkqM7uHR1MrrOabNXE1KJAbMRipuo/qn8mCmfE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=do+N3tO+AKBS7N1lrBuEeGL3zPCWmmqPyEQ6/2Y1eurwHYs7CFDpub26U+Da5Rv8DFhHka2P6hOE4wDGZgdofOksCrVZ3NiYVW/ONdQT64njrUD6LKF5NWMXbC6cdpuQrARKWisLGD0iEK6Z4jC83gZn2Aat1VQyzAnemc6gQgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X75HbMkD; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso19426165e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 07:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741961022; x=1742565822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DfJf8Ga9vB90szm23Um7D9SA1QG9ZKGN12DmFyfILjU=;
        b=X75HbMkDp6dvMPUjo/MdBhCRVyZ104qZTB4okzpjPGofD/MSHr5QM/w5khedXfjbP3
         +vsd7iyYv0sb4KF+ZKN+AsT/esNXWpbtWnNLV9vPr68cMMHxMl78mPP5sBP6prjQ7F/A
         GdmPeo1ZBpyvVvmAyL5GS6mAunereP54lViB3OWIeLe00L2dS6rtfctMs7ztPnWk9C1V
         y4t74t2bNY9XrGfsYpEWUYRdVgRLi+banYi+W2w8eCLyHzesprxCku3a4WonDSN9FNYz
         ROzqZhQVg/y9Zs5iT87aM27YpNMxOjV6wQsKgIxWTj7SRqywX9be7Mu0ZATtS6L0G5xp
         Xx1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741961022; x=1742565822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DfJf8Ga9vB90szm23Um7D9SA1QG9ZKGN12DmFyfILjU=;
        b=TSP30bg+D9t3vcXaO+JzgReiE5v6P1jZxt6r3GZpUpNAEkNmbahtDOGX089ZLc8+0Y
         oZV9mNvDORjg/9zHaxot3vDktUSWQgRx2d4ACxMHNQgIUBjaK1HXpBRcc0ZKvVWHCnTM
         t5FixZYGS5/GMlUMu4QJE5eiPAN4+A057d7PrDSRh88u+ahF04YhpolDIe9IvoCUT7q8
         Pkg5cZcbcI6SJAUaJhIss2Z3u/5rb1lOtUkvS0Q197ESic7+aiXeJaUKSO1sh9zZrkCs
         M92E8sW5wjeMeVKDl94QovVQ4OV93gqwoDOyikmEeWgCTspEQRfQdq28EzH23TCLpFnR
         calA==
X-Forwarded-Encrypted: i=1; AJvYcCVMkw0S6LDtpygle+HAofSUkSvSd56Debk5IOHvvJcubhlDrj9eqJ2Y4vc2MLbjqS3+YRGzmnSeMLQX+w+Z@vger.kernel.org
X-Gm-Message-State: AOJu0YzPNf3J40iOSxLBfUq7CSJnf2T/QXsIjDZm5gbKmTTvidas9UHt
	ckt0jDnKObQ0Vhk1ADzwse0UxQNSrtGPPJLbSY3yVWAEI8IwJkv6SoAIPVxpRDI=
X-Gm-Gg: ASbGncvVLELK3gcHMQ3hnLQ9fDMhgSuTjcODjVjpLViiwvf+oeLilMJeL8XFl0PvSOa
	qOsSCSKObwPye6AdM60qiPEDsQu/hgBLcBgtJyOjG2Q1E35o3n3Kl8SCdmF4bUP7TllWbibX+wB
	Kqky4kJZ5U/8EDwIfNz/OYvAKiI2wDeQjaYvXXf9//zne2rN9jkvwuRUyWUTjJFe51+cYAC55Pa
	9VdoRR0mRc0SA2wo4sngtIO0zOv/s+AxcKgGIz/q1h4JhspVRH1wn3esKGcm+Ay/jOchAbRnv4a
	64XbKMDKqahHc/ilH+En5ZlHR5bXOPMd4yPzTezKuII=
X-Google-Smtp-Source: AGHT+IEonzHqZfnBCRYQlfonbOnPQxvgulbGIw/W6HLD6It30BpUPgq+V9lDW+DY/K6ZIL0S87HICA==
X-Received: by 2002:a05:600c:4706:b0:43c:fdbe:43be with SMTP id 5b1f17b1804b1-43d1ecd035fmr30872895e9.27.1741961022202;
        Fri, 14 Mar 2025 07:03:42 -0700 (PDT)
Received: from hackbox.lan ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200fae32sm18156455e9.31.2025.03.14.07.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 07:03:40 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v3 0/3] arm64: dts: qcom: x1e78100-t14s: Rework devicetree for LCD and OLED SKUs
Date: Fri, 14 Mar 2025 16:03:22 +0200
Message-Id: <20250314140325.4143779-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Thinkpad T14s Gen6 comes in different SKUs when it comes to
panels. The only difference that is important is whether it is an OLED
or an LCD. The way that backlight is handled in devicetree between OLED
and LCD forces the need of two separate DTBs.

So create a common T14s dtsi that describes everything except the
backlight handling, by renaming the existent dts to dtsi. Then make the
legacy dts the LCD version, while adding a prepended oled dts. Both
include the generic T14s dtsi.

For the OLED version, I do not have HW to test it on, so OLED specific
bits will come at a later stage. Still, add the OLED dts in order to set
the stage for it.

Had to format it using "git format-patch" since b4 doesn't currently
support -B when formatting the patch, and the renaming of the dts into
dtsi (plus the panel properties being dropped) would've not been visible
enough for reviewers.

Changes in v3:
 - rebased on next-20250314
 - picked up Krzysztof's R-b tags
 - picked up Sebastian's T-b tag
 - Link to v2:
   https://lore.kernel.org/r/20250310141504.3008517-1-abel.vesa@linaro.org/

Changes in v2:
 - rebased on next-20250307
 - Dropped the RFC, as it seems to be agreed upon already
 - Added dt-bindings patch to document the new oled and lcd compatibles
 - Added panel variant compatible strings to each dts and included the
   the panel type into model string as well
 - Changed backlight PWM period to 4266537 to match exact period the
   PMIC can do.
 - Link to v1 (RFC):
   https://lore.kernel.org/r/20250306090503.724390-1-abel.vesa@linaro.org/

Abel Vesa (3):
  dt-bindings: arm: qcom: Document Lenovo ThinkPad T14s Gen 6 LCD and
    OLED
  arm64: dts: qcom: x1e78100-t14s: Add LCD variant with backlight
    support
  arm64: dts: qcom: x1e78100-t14s: Add OLED variant

 .../devicetree/bindings/arm/qcom.yaml         |    4 +-
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../x1e78100-lenovo-thinkpad-t14s-oled.dts    |   12 +
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dts    | 1506 +----------------
 ...dts => x1e78100-lenovo-thinkpad-t14s.dtsi} |    6 +-
 5 files changed, 77 insertions(+), 1452 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts
 rewrite arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts (98%)
 copy arch/arm64/boot/dts/qcom/{x1e78100-lenovo-thinkpad-t14s.dts => x1e78100-lenovo-thinkpad-t14s.dtsi} (99%)

-- 
2.34.1


