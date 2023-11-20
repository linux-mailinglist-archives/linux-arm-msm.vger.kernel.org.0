Return-Path: <linux-arm-msm+bounces-1245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 334F67F214B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 00:18:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CA7E1C216D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 23:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C82E3B286;
	Mon, 20 Nov 2023 23:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lacxF1Lq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2B98A2
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 15:18:00 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id 2adb3069b0e04-507973f3b65so6954267e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 15:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700522279; x=1701127079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ADt8pzOsXpdfsf1HgObr0YIdUIhge4egXUaCPmB+CDg=;
        b=lacxF1LqvkmCPwO3lglQAtKCn9yNCdUD/JOLG8Qsi89G6n0vvKI99Ra/MxAcY4tMgV
         EhIxacTXDIgZ953eFf7R2zkvmxyTiQIYZ3UWOIAXyY9RQLjq6lXs8qhYsqZxJuudO1GM
         s8dfj4l17iPq+md0ByXM5G7jSqeZxODcD28p4zZat/2LFpxvm3CxFQCI1vXZ+ALfMhtP
         aFO41pjKLuXVs6IZqRL4xoxzX9+TsEF2aWUl4jFP6w7JpPHCxMHVaazT5lRQsF43z23S
         sh5EYlxKCWOsgWNLXRK3t2b9+nksOZTdbMRxC0xz6clI9k/ohzbyxOtl03l0m9R5jwDs
         h4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700522279; x=1701127079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ADt8pzOsXpdfsf1HgObr0YIdUIhge4egXUaCPmB+CDg=;
        b=WQzJ8UI+LXujLI6zjmV5RzQwng7xDm8C+/qvo7dz1/qnIN/GKJC4TxsC1CoG7TFGWV
         U71QkATQzP7OkIgbtHgfryxiDeiX1ivrIVVtU6OiIhWoikeewVMC4fBgnauo4dmae0Xv
         goDW8FF7qyhbtshiRSbBBKe1DjSTD05IfKFDUL+AbtoTZasz+YMTSDCa2iue1UzmAE+V
         KrXujIi/AePjdDeNbp7BZnMhauGs80ZkkQsIRnEWursUgpeLJnCXAGjklI7b9tkHkJ9p
         X5zF0fkoJLL/mZUROPel8VeHxE/gJZovm2p1Cu6ZNG4Zxc7KUYw1CgJHQOFZ7x/Ywkx0
         oaOQ==
X-Gm-Message-State: AOJu0YwcQnrrJdH1qh1+xvwrck0zyWjiAN8pM6SrJVDwmESZzZYgFeaS
	R/c77cRxMfebBqN1AG1q6ria4w==
X-Google-Smtp-Source: AGHT+IF9nbnnlfFuWTc+kca9xlA0YRyUIqjfnoareDqrnufygavYMGGnBbf+MK5jzMXQplQJTEzWKQ==
X-Received: by 2002:a19:7109:0:b0:509:494d:c3d5 with SMTP id m9-20020a197109000000b00509494dc3d5mr5445896lfc.26.1700522279090;
        Mon, 20 Nov 2023 15:17:59 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id bi32-20020a0565120ea000b0050aab042c7csm677036lfb.190.2023.11.20.15.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 15:17:58 -0800 (PST)
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
Subject: [PATCH 0/2] usb: typec: tcpm: Handle Accessory Modes
Date: Tue, 21 Nov 2023 01:11:06 +0200
Message-ID: <20231120231757.2309482-1-dmitry.baryshkov@linaro.org>
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

Dmitry Baryshkov (2):
  dt-bindings: connector: usb: add accessory mode description
  usb: typec: tcpm: Parse Accessory Mode information

 .../devicetree/bindings/connector/usb-connector.yaml | 12 ++++++++++++
 drivers/usb/typec/tcpm/tcpm.c                        |  7 +++++++
 2 files changed, 19 insertions(+)

-- 
2.42.0


