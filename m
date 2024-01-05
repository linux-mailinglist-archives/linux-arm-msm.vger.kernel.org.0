Return-Path: <linux-arm-msm+bounces-6515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91813825549
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jan 2024 15:31:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1520286312
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jan 2024 14:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E4B63174F;
	Fri,  5 Jan 2024 14:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="wfIf5PxI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866452DF88
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jan 2024 14:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-55642663ac4so1873951a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jan 2024 06:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1704464960; x=1705069760; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u39RBCFFtI0yX9VLekdwvDVmxDIhVLYsBRs0wCaV+pU=;
        b=wfIf5PxIhbv59uVTDplNx/P2tqOV2TlZsjHTk5ze5uyAPFSYWkRd/x316xClzEEQcv
         YPuOL2DgYdi47DzbRfijahzgOgVaDsnCRfZvUP5lmolHs6KN7cwVCqfNld6qxhPNKzAh
         G0aRw7a7Gt7QUvA7hhFhIktbZitF/04pf0Ena1LQ9oq3l51P0JDqZvxF7J3M4NZWyTdN
         Nd8jfZSxnI8fqlOqFcfPul+kPR1+s2blQEFg3WJZqjCdiWP5+8p5XOxAmbc3jIft5UL7
         w7liKrnGsvYModZp7YfVnyOs+wqIK1DcgxLk/UU8LRytIm28GWbSkOhufzVTi+bN4wou
         jV3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704464960; x=1705069760;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u39RBCFFtI0yX9VLekdwvDVmxDIhVLYsBRs0wCaV+pU=;
        b=syJYNL+iP+McsT2vobtoxQy9/7nbI+6EmI8I/AFmwfBzI7hSrtxxYRx9n5iTE5x9GQ
         DGrCSTplthCZlcoa6eQP2MxZMoIV/8yIWiwNzSRrAztRiBxNe7YTI6zZbtfEcNs0hMJC
         4dispyAkrj49mwSmMta1LYI/HzXsLDf973IeK66tGUEnl99s/xh+pqqXBozPqtiVTea6
         jgwlDcyKziobfWkVEJaiwWSXTNj2aZQSKSa/m5Ks48UwpLgPHWF4cYe1jo4LLgOk50W1
         YKAFGzePic6is9HKiJ2t76cs+6wQB7e7fUWsQHiFIfhynI2F6tiUnvLftWgKs4lvSv0w
         nxdw==
X-Gm-Message-State: AOJu0Ywxz/5FiVVMKGlHGZntYXPXx1Y4A4YbxnPGb9OQwkVQ+8UGHssQ
	NIW6qpcxTOBfiV7cLAPnvw8tSQJWOT3S9g==
X-Google-Smtp-Source: AGHT+IFC8mQP7zYTa3qScnA9e4FhaBfqsr8V6I6BOY6f96K6u4BAyNvPTsxb81TwxVoCl0xiM/3dSw==
X-Received: by 2002:a17:906:d92a:b0:a28:b12e:324d with SMTP id rn10-20020a170906d92a00b00a28b12e324dmr1131944ejb.10.1704464960408;
        Fri, 05 Jan 2024 06:29:20 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id u7-20020a1709067d0700b00a26b057df46sm927006ejo.126.2024.01.05.06.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 06:29:19 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Add display support for Fairphone 4
Date: Fri, 05 Jan 2024 15:29:11 +0100
Message-Id: <20240105-fp4-panel-v1-0-1afbabc55276@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADcSmGUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDQwNT3bQCE92CxLzUHF1Tg8SkRAtTY7NEg0QloPqCotS0zAqwWdGxtbU
 ABQmog1sAAAA=
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4

Introduce the bindings and panel driver for the DJN LCD panel using
HX83112A driver IC.

Then we can add the panel to the device dts and also enable the GPU.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      dt-bindings: display: panel: Add Himax HX83112A
      drm/panel: Add driver for DJN HX83112A LCD panel
      arm64: dts: qcom: sm7225-fairphone-fp4: Enable display and GPU

 .../bindings/display/panel/himax,hx83112a.yaml     |  75 +++++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |  62 +++-
 drivers/gpu/drm/panel/Kconfig                      |   9 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-himax-hx83112a.c       | 372 +++++++++++++++++++++
 5 files changed, 510 insertions(+), 9 deletions(-)
---
base-commit: e9ad8e6186dbc420e26d2ffbb05cdce33fbf041d
change-id: 20240105-fp4-panel-50aba8536a0a

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


