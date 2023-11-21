Return-Path: <linux-arm-msm+bounces-1406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E50567F3772
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 21:31:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA97BB21722
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 20:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFA2C5466D;
	Tue, 21 Nov 2023 20:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ps59Aw4+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6823C1BF4
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Nov 2023 12:29:29 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id 2adb3069b0e04-507be298d2aso7867885e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Nov 2023 12:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700598567; x=1701203367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d/YPc2+7OX5cSuooAWCFK/zXbyQQcMjUtmvaEdzyH0I=;
        b=Ps59Aw4+pnOcsZnMWAupwEZBkEGtOXOiqJs7dXAa0Xypq1i2WYq5D5dTNEV2ruU6Zb
         TjdhhYjxAih+QC5k1G74Z+aBFVXE+0ZG1HpigJN4sTGg3ME9cbX/bV8ex7QTP6d4OfSI
         OfIrvgvr39fH0A9tNv5wzLXgPlRh1OymF2XC7DVajXY2+0fPQnT6+z0b+J1hp9Pe5RWV
         qG+kFdoP2rL/oMXCL0LGGOSKMgPfwT1KTJqp/B3VMB6AnsnEuNXkjXUy/R+ZmtPEf/0I
         8lwee+yJjKHYmdWn3TbSI2qSYWU9arIN5AY9DeXbeyr+AN/QlGLfI0pL0cs0uGilEH+s
         EJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700598567; x=1701203367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d/YPc2+7OX5cSuooAWCFK/zXbyQQcMjUtmvaEdzyH0I=;
        b=bsHcnBp6xswYg+jTSU59LDL5gfjo5I42CWGD6L4MQDoCmK/wUZ2rLeGtiv4GQzRj1J
         mlSlHi7VplBTZ3OqynqhWAeB91SdCiGKzCIslZf/Y0oglFyYI+yRz4kwMlvqEEKnZ6X6
         CPoEKOVsxgvVEtw5Ih+QLsjxyHrwwnDJKnnyfmP2h+sAhm9V7Rvqh14eKcIh1BRo2FoF
         z5ihFn01MTFrwsM22YyyhVFjRnOJoKoA29nbIEkDFZym1WZjfKTpYCGIEXLjdUHWJw+7
         AQDS6sF1FwgSFkPS5kYN+wkg04Szdpv7A9qoR8FfVzd/MzenXlqb4wLDZZ0gpBu5QS8W
         xqHw==
X-Gm-Message-State: AOJu0Yyq0DrWUgdZv9k4ny9mVAAppH+2R+IQweAOrlEotu+MflYfPIjQ
	7FproM7ZQDVgtCbGBT9Xpt3oKg==
X-Google-Smtp-Source: AGHT+IH+lx0/QyDiMn/bUpTX/WV0RizOFIs7Tn8KJMsGYobLA7HMgbfKSNb2zVaPAad4qhxkMJIPVQ==
X-Received: by 2002:ac2:5e73:0:b0:507:a383:fe18 with SMTP id a19-20020ac25e73000000b00507a383fe18mr190070lfr.40.1700598566624;
        Tue, 21 Nov 2023 12:29:26 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id h4-20020a056512350400b0050ab6112af2sm286287lfs.65.2023.11.21.12.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 12:29:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mark Gross <markgross@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 0/2] usb: typec: tcpm: Handle Accessory Modes
Date: Tue, 21 Nov 2023 22:26:58 +0200
Message-ID: <20231121202925.2481471-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In addition to Alternative Modes (see [1]), some of the TCPM-backed
boards (e.g. Qualcomm SM8150-HDK) can support USB-C Accessory Modes
(e.g. the Analog Audio). Add bindings and driver support for parsing
this kind of information.

Note, while it might make sense to put accessory-mode-audio and -debug
handling to typec_get_fw_cap(), I decided against it. Several existing
drivers use this function, while providing AccMode caps based on some
internal logic.

[1] https://lore.kernel.org/linux-usb/20231120224919.2293730-1-dmitry.baryshkov@linaro.org/

Changes since v1:

- Initialised the `mode' variable to 0 (Sergei Shtylyov)

Dmitry Baryshkov (2):
  dt-bindings: connector: usb: add accessory mode description
  usb: typec: tcpm: Parse Accessory Mode information

 .../devicetree/bindings/connector/usb-connector.yaml | 12 ++++++++++++
 drivers/usb/typec/tcpm/tcpm.c                        |  9 +++++++++
 2 files changed, 21 insertions(+)

-- 
2.42.0


