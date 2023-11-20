Return-Path: <linux-arm-msm+bounces-1241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 104107F20A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 23:49:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6FAD9B21A6E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 22:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE2B73985E;
	Mon, 20 Nov 2023 22:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b3b9FYMu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07C17CD
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 14:49:23 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-507bd64814fso6890347e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 14:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700520561; x=1701125361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0SqPAnw0QpKcg0zC6uM3+YKsZ1Rv+zntSbyUGLhP8hE=;
        b=b3b9FYMulndAe7UFDMMRx1bRJ8lKGoutoLhUCrx8feNQL0BB+KrI9YNB8YOtjJZ4OP
         niLUXtIjy183SjsIV9OjMqRcCe2t23kIrygPlyFDH/FhIavLxO5wAwLehZB8QGGtib8V
         LT8TyKX0XNdUsrn8ogjLvhIM1n2Z98vU7SMgLPRjbppsQHJRD4tCpVj/no/jgQxfSFF+
         k6xcOxRVCWcY1rcbTvl+rTChngajAzMOHS35SOdZsV63eQX32mcPP59VHEKnGyedqn0s
         qkZ0d2P4MWNtGqlSajecx1waC5DI+hdJdXFs1jM3+ye8riSGF/E7j1/dPOefktzu9gAx
         Lasg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700520561; x=1701125361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0SqPAnw0QpKcg0zC6uM3+YKsZ1Rv+zntSbyUGLhP8hE=;
        b=EUODZtnE6xlmmfTBWVudBUX81Juac55N9w+cVry/K0BkvmZplAkXtqZJ1qssjR36q2
         tJz0BVeVFa5KXqbaDFcYuop3c3pZB7wyYWa3y0EyIB+7we2p5PQchGvUzqACiJfFfJzO
         TqtcF3dO1ERziWJttKs0rJLamNFwgdYWAmuYniIhSAkgREUL96bn/nnnr10RkEo5r0xD
         y/m3SbGm0BWOhgOCWLL/Gx99nLPa6x85psSuIXM6pEB8Fim9D269kZGQO2HraaxQ8APb
         /5YYazy3rqz7QGJUB5owqAbu1glCWkUyQN9gCZtCuPxjqW3ePJRudVqEG+ceFxdUYWpT
         cDzw==
X-Gm-Message-State: AOJu0Yybn8OGPk45yGJdzjJLq9ONW5BWV1qj6BoNY4N+BpKZnrEYRG/a
	fMuSzb3Odokg9MP0g7hwcEqvHZtdcL1aQyfhtPYRQ8Ps
X-Google-Smtp-Source: AGHT+IHTbjSayWigF0siBEmx2UcusxW01ObJc5vC7FIWm7CrcH6uqemKAgtjbHSoxxVi021tZT0VuQ==
X-Received: by 2002:a05:6512:3b2a:b0:50a:aa7d:2c18 with SMTP id f42-20020a0565123b2a00b0050aaa7d2c18mr6095443lfv.61.1700520561236;
        Mon, 20 Nov 2023 14:49:21 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id c26-20020ac25f7a000000b00503189d8b8csm1297756lfc.198.2023.11.20.14.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 14:49:20 -0800 (PST)
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
Subject: [PATCH v3 0/3] dt-bindings: connector: usb: provide bindings for altmodes
Date: Tue, 21 Nov 2023 00:00:17 +0200
Message-ID: <20231120224919.2293730-1-dmitry.baryshkov@linaro.org>
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

Changes since v2:
- Inlined altmode definitions instead of having them under $defs (Rob)
- Explicity list permitted AltMode names (currenty only displayport is
  allowed) (Rob)

Changes since v1:
- Added type:object and fixed 'description' string in the altmodes-list
  definition.

Dmitry Baryshkov (3):
  dt-bindings: connector: usb: add altmodes description
  usb: typec: change altmode SVID to u16 entry
  arm64: dts: qcom: qrb5165-rb5: use u16 for DP altmode svid

 .../bindings/connector/usb-connector.yaml     | 29 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts      |  2 +-
 drivers/platform/x86/intel/chtwc_int33fe.c    |  2 +-
 drivers/usb/typec/class.c                     |  5 ++--
 4 files changed, 34 insertions(+), 4 deletions(-)

-- 
2.42.0


