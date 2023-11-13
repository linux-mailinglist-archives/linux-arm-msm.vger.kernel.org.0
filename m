Return-Path: <linux-arm-msm+bounces-594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0417EA5CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 23:15:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7D82280ED5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 22:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DAAF2D63E;
	Mon, 13 Nov 2023 22:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FofDm00y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308382D616
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 22:15:33 +0000 (UTC)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4274BD71
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 14:15:31 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-507be298d2aso6619099e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 14:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699913729; x=1700518529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CavqYbpJDhm0OKuh4STOsXUdXIvRsCGtB4InVaES23I=;
        b=FofDm00yUf4ACJaFKDl1isGSOwGscsQjQksuo3C2m7L/cNffYutXe0yKjSbAPlUso6
         NRSK5C4L4RLoZ9tAIauzhYmdfoNIp67bHquMTQj2HoymtXyq4aR74nGWSh2O52LEbWyK
         rMLQuESuU4KhTZ28c/ViiMF3xrGuxk2Zh3UD+9cGlwZRk4wHWil9i4TBi77SUXm8neZM
         QVDlHKz6l8tYBLr5b1LJuckYABKSq7hYojEEs0pE4vKNdukBhKyEGrwvQX74AkaVuy+b
         FOsYFxn1oXQ6vglRCFibiTjZU7h/d2ANe+5jhYr7g0kLea/us6SlAUMtPNx9JPuhUxod
         /s0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699913729; x=1700518529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CavqYbpJDhm0OKuh4STOsXUdXIvRsCGtB4InVaES23I=;
        b=NDLLNb/MOxlLU11PEtmD0Izd8HJruznfzS5Iw4co1fTA8h2ci8wBCTgpX7DSL7jWfW
         CSZlBIgDIl/KlrvCROXsIdGs4LSVoAQfW5aXWs4vCMNrZye+Q//ovJWn9u2kBWejFmwJ
         Bp0mbwlxINzN9uDIDV9iEwK4kTzUbb/b7nFK/2mkCLrBTSceh2xUbbFIlr6ehsp+A4TZ
         9WSYSKrciSJKt801S8xZbVzbJuSzYZIKKDW9Ug61hNPyPluGNGxLiHBpPxI3LPG1e56P
         HF/3p2WZJAGSLaqHaEZWdrVvDAeXDlXoYF7RiO/4DatvDn4uMTNDmeA/o26QcQ97hUGj
         6KOw==
X-Gm-Message-State: AOJu0YzQjpWrSZMMrGFdT2qadJpDZgsdZ2OWUOKFqKQEqZGyBgh7BtRQ
	LkoaniTkxA2YacX3Y49bjlmsfg==
X-Google-Smtp-Source: AGHT+IGReEDcnEERO89WQ2VhevAyWOeYn9OJtVWGTf7awX8F6nWP1bv1VZ+A0hyce6bKbkbjmUVZ5g==
X-Received: by 2002:a05:6512:1087:b0:507:b7db:1deb with SMTP id j7-20020a056512108700b00507b7db1debmr6898125lfg.38.1699913729380;
        Mon, 13 Nov 2023 14:15:29 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id w8-20020a0565120b0800b00507f18af7e0sm1097578lfu.4.2023.11.13.14.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 14:15:28 -0800 (PST)
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
Subject: [PATCH v2 0/3] dt-bindings: connector: usb: provide bindings for altmodes
Date: Tue, 14 Nov 2023 00:13:26 +0200
Message-ID: <20231113221528.749481-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In some cases we need a way to specify USB-C AltModes that can be
supportd on the particular USB-C connector. For example, x86 INT33FE
driver does this by populating fwnode properties internally. For the
Qualcomm Robotics RB5 platform (and several similar devices which use
Qualcomm PMIC TCPM) we have to put this information to the DT.

Provide the DT bindings for this kind of information and while we are at
it, change svid property to be 16-bit unsigned integer instead of a
simple u32.

NOTE: usage of u16 is not compatible with the recenty extended
qcom/qrb5165-rb5.dts DT file. I'm looking for the guidance from DT and
USB maintainers whether to retain u32 usage or it's better to switch to
u16.

Changes since v1:
- Added type:object and fixed 'description' string in the altmodes-list
  definition.

Dmitry Baryshkov (3):
  dt-bindings: connector: usb: add altmodes description
  usb: typec: change altmode SVID to u16 entry
  arm64: dts: qcom: qrb5165-rb5: use u16 for DP altmode svid

 .../bindings/connector/usb-connector.yaml     | 36 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts      |  2 +-
 drivers/platform/x86/intel/chtwc_int33fe.c    |  2 +-
 drivers/usb/typec/class.c                     |  5 +--
 4 files changed, 41 insertions(+), 4 deletions(-)

-- 
2.42.0


