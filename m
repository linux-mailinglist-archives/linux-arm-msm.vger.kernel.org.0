Return-Path: <linux-arm-msm+bounces-24543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC9F91B46D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 03:07:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82D69B22AFD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 01:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DA7746B8;
	Fri, 28 Jun 2024 01:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a9nHT9mg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB7112B72
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 01:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719536840; cv=none; b=AYkP0xd/fSipdvmvAg/pv3gZgL5mrKI0z6vuNacqvuKsrmSuyyZVulwaDaTRXV3+8xQsSiP3LFe6xJqyWwKWKUMquvDew108V6XWYXSi04d2Y5iYRbLeS2Bwdo7+OrSgoA54L/3txNVbzBdPPsJDkGQwZkcaKBdoqlXrkjefWxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719536840; c=relaxed/simple;
	bh=oAIm3tFaJTjlkq3iPYQLO+vtIzmnKuyPQUXtqzc6Sk8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gVWnNbOdtsCUzNE0Tvv7diHI9pzvVrziw8+YdCs4rYUCEVz/UTZKCa7+NhgfVOArqnGZnDBp8ottgVJu+QlxUHGDERmvydlZrBcsy+wapj+pv++EIuYFY40Luugx7wUDuXyOkx+Nr/mcVhzfyxTHu5Te8R+flOEPaNG2klE2Ikc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a9nHT9mg; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-424acf3226fso595735e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 18:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719536837; x=1720141637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yFzRsf2vVQv0yHSYGNvzC0nZ1m6MD+db413EmZMCcX8=;
        b=a9nHT9mgmFazrfYHXy14C+e0XQfhA6/SOUh72zWkqRaFkzgX0FDFPpn3j6yfj6Emi3
         hWqXKbmmjqqi4vpc9E7ebfZ2VItCWd4YsFry14gJLWpIOsmM0LU5cH3HO56IKWOR5SnS
         4ibNgUFVoPryRKZP0jQPvsuWNpDp0oWMPJw/NGwXs5CwXC00Qm+7Y9h+IH0LKYtm85u6
         w7l4ZWgHOV+XB7knEqXMAaM3qqNzq2Pc2HUTngx70HzupbRAhHXYCjPcs/gxG8QJtdOw
         FYmvJmhKv0duiSPbHXXmyHpl1yfzDZgAGA+yLpFgIwM4Gxqh9fKjRWg1PYftD/gHFi1I
         bl0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719536837; x=1720141637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yFzRsf2vVQv0yHSYGNvzC0nZ1m6MD+db413EmZMCcX8=;
        b=ghiRWsS85VtqrMslzjmMBqJfp6EvdhdBdB5aHCtgzpNVHoeLkP/XcqPnRCAMDO9ij9
         0YR2J+sjUrF1UGYuv/ZBUlflVQixoLwYrm6X+tHaSke2afe14TqRE+ng3HkkpSeWPNkU
         G9wb8XyBfeVn7wfE28qxeXlWo9SOjs6VECUUHafq5FjMnMUF3lZPYLKixc/CGxYSy7eB
         sT9wkv2i4la1PJJQUvq2o4f7rRl7H+kVojhaMmYp+Mlj4VbPBO5/jaPWw75JsruM3oXv
         L7Qk9+QHfV5Wf3fugN32j9b0uey999BTVksQU5aT2DCqQFetgQL1Io2Ntzca3agyqSsp
         Fd3g==
X-Forwarded-Encrypted: i=1; AJvYcCXk7Yo55DCjYfrkQIRHTTzQmBU1F7eUsczrcIBgna0UKoKJM9Q/P5ne/aSqQGeXFx3SASid0AmmzY8IxxcMsGQTrOxtKsbL7I2Orc63cQ==
X-Gm-Message-State: AOJu0YzU7kAOyXAOMPYKs6KBKozxqf9sEb2Fb3OIG80jLusnGPRRx2Xo
	SNs8C9E6UaaC3zq5hJcPvQript52LIyCfDk08rHZjvnXZhqZ0ajBYxL26mE0qOA=
X-Google-Smtp-Source: AGHT+IFQe1Lw9FGACcaDyps6RFYSkDsIklGWtLIOJwNRju+t5I4TqawhUBd4nyhFMIFeZxAwV8S8/g==
X-Received: by 2002:a05:600c:3399:b0:424:a5e3:8022 with SMTP id 5b1f17b1804b1-424a5e38107mr59654025e9.34.1719536837074;
        Thu, 27 Jun 2024 18:07:17 -0700 (PDT)
Received: from fuerta.Home ([2a02:c7c:7213:c700:2cd1:b0e8:abb:540])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af3c27dsm13075805e9.7.2024.06.27.18.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 18:07:16 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	elder@linaro.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	linux-kernel@vger.kernel.org,
	alexey.klimov@linaro.org
Subject: [PATCH 0/7] qrb4210-rb2: add HDMI audio playback support
Date: Fri, 28 Jun 2024 02:07:08 +0100
Message-ID: <20240628010715.438471-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

First time I am doing anything like this. This series adds
mising pieces here and there to allow addition of sensible
sound card in qrb4210-rb2.dts and enable HDMI audio playback there.

It is planned in future to add support for other outputs and capture --
analog audio support.

The series depends on Srini's sm4250 lpi pinctrl driver:
c2e5a25e8d88 (pinctrl: qcom: Introduce SM4250 LPI pinctrl driver, 2024-06-22)
2ffa7a354662 (dt-bindings: pinctrl: qcom: Add SM4250 pinctrl, 2024-06-22)
As far as I understood it was already accepted and will go through pinctrl tree.

Alexey Klimov (7):
  ASoC: dt-bindings: qcom,sm8250: add qrb4210-rb2-sndcard
  ASoC: qcom: sm8250: add qrb4210-rb2-sndcard compatible string
  ASoC: qcom: sm8250: add handling of secondary MI2S clock
  arm64: dts: qcom: sm6115: add apr, its services and simple sound node
  arm64: dts: qcom: sm6115: add LPASS LPI pin controller
  arm64: dts: qcom: sm6115: add description of lpi_i2s2 pins
  arm64: dts: qcom: qrb4210-rb2: add HDMI audio playback support

 .../bindings/sound/qcom,sm8250.yaml           |   1 +
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts      |  73 ++++++++++++
 arch/arm64/boot/dts/qcom/sm6115.dtsi          | 112 ++++++++++++++++++
 sound/soc/qcom/sm8250.c                       |  19 +++
 4 files changed, 205 insertions(+)

-- 
2.45.2


