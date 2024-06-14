Return-Path: <linux-arm-msm+bounces-22670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DABF907FF9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 02:02:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14899283938
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 00:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A048D19D880;
	Fri, 14 Jun 2024 00:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nxKLVXag"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE62637
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2024 00:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718323351; cv=none; b=nUQISd4yP1qHHHHudzcz8pjF0ujq6iArFmAvMCXYa0KFXPdP1jibI5oVxaZIXprzgKGGz1yAXgoIzRuFMhvHr0+2rFWDj4myLCWKMPZbK6erADy1Hi6r+7CdPLoa4D2LefKUaRvza+b30hFJzxGJ4jYp+o7tWtREIbjA1ThsPe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718323351; c=relaxed/simple;
	bh=exeXDKeS5xI4dB9WYztmnec8kaBCqKApV9iGGnDjUeE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mvw6wIUfEVrZ5HDA3kam8Mim6wGVEbYBbd+s0kMnxzNt0dQ8bDuBShR3KbhxiYXFxp+14THNMDqU9L+5eZznNaftkxO3l5DpnA5/EYnvrX4BnI2uvBJT7xIKY07lxZQJ7uvXs72i7jIetIUaSZRWihF8N8Yi1HGE0MRE1aEhIT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nxKLVXag; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5295eb47b48so1976762e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 17:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718323348; x=1718928148; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QW5kIhlLtmN+LhKlOvCDBjLYeT1B6YXu1fF/8F3k3UE=;
        b=nxKLVXag/k11sy0jfU+5pKD8amBlmxsa3uBMZn3HPBAyZLBcoeC2Z85D2aTeGIz8sl
         /S85mUrme3jWdSyqhNULjMKSDQtD+LLTIJWd1LpvaADiQ807GJxGVuMuX6HGNTM9UeC3
         p2r8Exqbfb2ZxlLO//64njTN+sXMKM5VNISXeVZiMdwi4HHsY+dCLiiFDuHxmdQeA0ee
         rDsr3UvTvYMTNjhWwdLv6sW6G0l301xpggWpbZ+HT0aQJZaH5lpK4xg6ENIq5uk1nAYL
         LJiCbRujHjSTd+4GAm2zoD5bRLD0Qzp9tvynGAXwa7SCbFKyotUdoCd/zdX36DgknW+3
         7R/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718323348; x=1718928148;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QW5kIhlLtmN+LhKlOvCDBjLYeT1B6YXu1fF/8F3k3UE=;
        b=IdqSqvZaw+fa5TQxOzzFhreS2IRP4mFINdh20LVUS0fVAQS2xvr14v7oQSU9oEswAU
         5/pV1uBX+Ng33PZ+4th1g/Uj2GhfFFgAHCJTTmzuxUUdtErLTZHsq/DdpLTrjGboiSdl
         I6/5M1+kmGwNvFm0m/E84PiTqisSjNyaXkF2b2qJQgdATLxNB85P8IaHn4pUrxin1uZV
         WTPAl9sR0GjwcQvWGfCzLl7T05O1jnRwluHMLkjrqtPLxKoGIV7WIn1lMvPQ8PXEb+P0
         4v4TcRKT+lsHcjALQAIQI7tx+fXffj07xNiBb89bN1W3PEafRFUZLXORX0NJij/zuzCX
         rgPg==
X-Forwarded-Encrypted: i=1; AJvYcCXvnSj86ZbePjHnGVzYAWm7jq4y85AhrCWz036pVghXLUQ2FdtYNSaZ0LgcPem8C6way/8AztBz1Tya9bZ1i9lA1fcZg/lxbam7gZ1mGg==
X-Gm-Message-State: AOJu0YwlhSMQY6M3uy4EX2TWM/l8LfcPU6Y9xbdooEn/GY2KJXNVpYxF
	dYJaqnnDeWmwHC4gNslEXIaFSHOf3YiWmzIxkXQI/MEfpjMP6rL8gXZ4ls21ndnd93bNuvyABwt
	u8AQ=
X-Google-Smtp-Source: AGHT+IGQH4BW4y0WPnlc1Nl7pxTM2sMPBBUkuGMWSdcd4CZu8tjjNu987+DcRlYaZvTaev4pZRs+dQ==
X-Received: by 2002:ac2:5a4b:0:b0:52c:884f:5a31 with SMTP id 2adb3069b0e04-52ca6e6dc0fmr757866e87.30.1718323347843;
        Thu, 13 Jun 2024 17:02:27 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca288804dsm374797e87.262.2024.06.13.17.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 17:02:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 0/3] drm/panel-edp: remove several legacy compatibles
 used by the driver
Date: Fri, 14 Jun 2024 03:02:19 +0300
Message-Id: <20240614-edp-panel-drop-v4-0-4e0a112eec46@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIuIa2YC/3XMSwrCMBSF4a2UjL2SZzWO3Ic4yLMNlKSkEpTSv
 Zt2VCkOz4Hvn9HkcnATujUzyq6EKaRYBz81yPQqdg6CrRtRTDkWlIGzI4wqugFsTiNgrBRlUjP
 TalTRmJ0P7y34eNbdh+mV8mfrF7K+f1OFAAHMhW2pIMRieR9CVDmdU+7Q2ip07+XBU8DgjTdcX
 Ly5WnvwbOcZOXhWPTfyqqmWwjH145dl+QKrLBKBLQEAAA==
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>, devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2848;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=exeXDKeS5xI4dB9WYztmnec8kaBCqKApV9iGGnDjUeE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBma4iR8cQ2xeXd5K2/fhbfYL/Xxzbh7W+evYq1e
 9/805a2cw2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmuIkQAKCRCLPIo+Aiko
 1WJECACy1Ogxdb/xLNEZk8RuzOmtxuBRF0sxevXZGZRGVis66bQoD2iWRfrVXrkWVh1lcLv5x4q
 uluGvNZ9O59OlSxWI8gvA6rUXbhT4v3ED+qH34ZrCdqWL1gWUWP95Slzh1ZxczjJao1jYHhLzjh
 c7VDu3zsm4u/R2R17xvdkzMUCDCt/u+/eGQiRoFJdFw5ZvvZdbQoIupCEYec2awpR3JrtqAq5pA
 eQnMH27+zXQXwzLyr+QdSZz9xXyz3q1OJJYLiorjcvghtKNITwo2yFbAiVQK+C7WD4GqCfsiDTX
 9gqk8AmBFWr0Ke/UPEK6MyA7mQNWoonPtOknG8IMFzIM+nlH
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

There are two ways to describe an eDP panel in device tree. The
recommended way is to add a device on the AUX bus, ideally using the
edp-panel compatible. The legacy way is to define a top-level platform
device for the panel.

Document that adding support for eDP panels in a legacy way is strongly
discouraged (if not forbidden at all).

While we are at it, also drop legacy compatible strings and bindings for
five panels. These compatible strings were never used by a DT file
present in Linux kernel and most likely were never used with the
upstream Linux kernel.

The following compatibles were never used by the devices supported by
the upstream kernel and are a subject to possible removal:

- lg,lp097qx1-spa1
- samsung,lsn122dl01-c01
- sharp,ld-d5116z01b

I'm considering dropping them later, unless there is a good reason not
to do so.

To: Douglas Anderson <dianders@chromium.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
To: Sam Ravnborg <sam@ravnborg.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Changes in v4:
- Rebased on top of drm-misc-next
- Added devicetree maintainers to cc list, missed them for v2/v3
- Link to v3: https://lore.kernel.org/r/20240531-edp-panel-drop-v3-0-4c98b2b95e3a@linaro.org

Changes in v3:
- Rephrased the warning comment, following some of Doug's suggestions.
- Link to v2: https://lore.kernel.org/r/20240529-edp-panel-drop-v2-0-fcfc457fc8dd@linaro.org

Changes in v2:
- Actually drop support for five panels acked by Doug Andersson
- Link to v1: https://lore.kernel.org/r/20240523-edp-panel-drop-v1-1-045d62511d09@linaro.org

---
Dmitry Baryshkov (3):
      drm/panel-edp: add fat warning against adding new panel compatibles
      dt-bindings: display: panel-edp-legacy: drop several eDP panels
      drm/panel-edp: drop several legacy panels

 .../bindings/display/panel/panel-edp-legacy.yaml   |  10 --
 drivers/gpu/drm/panel/panel-edp.c                  | 192 +++------------------
 2 files changed, 25 insertions(+), 177 deletions(-)
---
base-commit: 9324410846e13595d453b7f34508b1f6b15fb1a7
change-id: 20240523-edp-panel-drop-00aa239b3c6b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


