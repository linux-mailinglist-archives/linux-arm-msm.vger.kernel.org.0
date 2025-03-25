Return-Path: <linux-arm-msm+bounces-52445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDD3A6F467
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 12:41:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5EAB3AE6DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 11:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5744A2561CF;
	Tue, 25 Mar 2025 11:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a7B8Bp4Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA9A1EFF85
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 11:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742902867; cv=none; b=XlR8p/SJecKECcGwUp0XGvcXnNBFv6WaPuTJ6ZoMnvCWttdZmLmrO8SzflF9cAfqYemMom/fF0jopHMMRq9DODyKiPZw5Zn8S6br/JPuP0WHYEEQm5yA0CoWYLLV6Dk8U72XMQvYyo2jqCwYhO+jtiX5qVlahR+xO9cxJuB0ucM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742902867; c=relaxed/simple;
	bh=DWrs30dWU6BTEKeC5Kt8Uyh7muJJJmVcZ9+Wyy6BDJA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CiIgGxSXTpLj4H0ZzeCZVuCWnyjW9aXDwDIVUS2svLzHKo0jHFaWWCtXwd+9omhxFUuD+GGpksK8OmOBHoi7Pgpe3BeF6dRolt8DH1miXRN3wCowSzqtnsSRvwFurjVnndhxWGHCwYWR71RfsDdWLxrl0G6AsXdxZzz4nAHuuC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a7B8Bp4Y; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39ac56756f6so1568921f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 04:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742902863; x=1743507663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V9gGesvxkXaJrbpdejngTaAxuRUgs7M320w5yoDSB0s=;
        b=a7B8Bp4YPs2/M9crzh+htAIvrEnzWPCdDyNmMcqmukTWWEzDlzxpRj9Pf5/9fnpNfr
         oeknhx4Mz9hMkg0UJCv9MfCkeyocnQEH2fuKccl3n7+Vr5/fZtzxvzv1sEUVzXOVqDYN
         4suGogs/yO15rmO2/n520lD15My5KANzVdVtgnFI3U80RyAG0yLLrijmTC6ovknSFeiY
         7y5h9WCQHqST4grUu0Y8NybYJveI2FJ4rQr3hEA2q+m8FOjkRVcCqZxkHKkpFE8E0jNJ
         q+2nzzF1pMBH4k+6cjwUYoRiZYHeetovb95Q0vYDG2ulJX6MMUdLnY2QJVdaT82T22lp
         sYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742902863; x=1743507663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V9gGesvxkXaJrbpdejngTaAxuRUgs7M320w5yoDSB0s=;
        b=J65/iJ8SogTYemiFKyBeUkQXlgIRzidV8pvldxSUgm7lv7bmeK4U/6kE7j/NbvrGhr
         BGQnjGQTe4IHcaBkjFsVEPfSEDYU5BSW4v3mJpGSL52/Qs2T2jmjjY1/BPYB5Dz1Mjqk
         Lnp1ONOSwyVfo/nWU9JPp3i2EjUbRGDLZQBQph+EmZ6IfZMd1aSEbM2lLwAefVKy8YtF
         I3rnA0ne6mOCS/uADLH0AbB7WHLX84iZ0L7Vda7GDjMtso0Szkp1dIWPKd+igvMN/bR9
         VRXN5lmJTGqo/5Umgxqqs3sYEgYML2RsJ/uyfaSE7iQJthurz7RpwRZFu0sbg/Pd3r3+
         ur+g==
X-Forwarded-Encrypted: i=1; AJvYcCUDuuOSoS0DFib96YiNQDJutkntaZeR89oePrxmSRMHJSlJgM9Uh+2tCvHM4HxFkilLbgYBpmi9VqRSplUx@vger.kernel.org
X-Gm-Message-State: AOJu0YxOLjUmOxo5Mkj9/otDICjSRTfRGSNbBELhQrddlFWwNYdoZEw6
	aDydSnOCl6dIphzrB4WnYD0aV/1jicW4FhLW2xTGCsTsvSy1PoA22mmoMVCUZ+U=
X-Gm-Gg: ASbGncsZr6hguCsdtkQg4/tuKgWVMWPGh/p1JkzbwTHNGJ9iarU02WpRxuagmAiKg7w
	W1FftTe2WO5SK0X7ebnCMetsxKdaSzCwg+onH4DrNp1htrEJCLOAK6p5iwOpUBjpiSgtVGFm6M5
	P+ErPL1Ldin/kuOWssdiITyWSPQsUTwIDGKoZlV2eoZMdrfjqYqazYoozzSEx87+LdeTTkvTVQu
	3emB+Lyzboxih79FNeEgmBLrN8bGKrrR9F3BZlNs69GKHmgtecuvLqOBcvE+dWcHd9/YWGIvN6I
	tgVdKkqw7SJdG6SW45HXivzjobZtE5AjxtTswXYeMoCAVFc9byPXZO8i3ZoXkomWO2Vm+g==
X-Google-Smtp-Source: AGHT+IEvlt2SB/BWSd7IHVRcLyRr9LxNATE4wtiptj0pMzXSD4oiYGVGqTIPQ4Cf2L8g8oNx3bNKiw==
X-Received: by 2002:a05:6000:18ab:b0:39a:c6c4:f877 with SMTP id ffacd0b85a97d-39ac6c4fad7mr3875334f8f.20.1742902863180;
        Tue, 25 Mar 2025 04:41:03 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a6326sm13213330f8f.29.2025.03.25.04.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 04:41:02 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: peda@axentia.se,
	broonie@kernel.org,
	andersson@kernel.org,
	krzk+dt@kernel.org
Cc: ivprusov@salutedevices.com,
	luca.ceresoli@bootlin.com,
	zhoubinbin@loongson.cn,
	paulha@opensource.cirrus.com,
	lgirdwood@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v5 0/6] ASoC: wcd938x: enable t14s audio headset
Date: Tue, 25 Mar 2025 11:40:52 +0000
Message-Id: <20250325114058.12083-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On Lenovo ThinkPad T14s, the headset is connected via a HiFi Switch to
support CTIA and OMTP headsets. This switch is used to minimise pop and
click during headset type switching.

This patchset adds required bindings and changes to codec and dts to   
enable the regulator required to power this switch along with wiring up
gpio that control the headset switching.

Without this patchset, there will be lots of noise on headset and mic
will not we functional.

Changes since v4:
	- do not rely on as-is idle mux state, exclusively get mux

Changes since v3:
	- rearranged mux deselct to do better error handling.
	- reused mux_state for gpios as well.
	- removed tested by on bindings

Changes since v2:
	- udpated bindings as suggested by Rob and Krzysztof
	- cleaned up swap_gnd_mic callback
	- updated mux gpio to use dev_err_probe.
	- added Tested-by and reviewed-by tags 

Changes since v1:
	- moved to using mux-controls.
	- fixed typo in regulator naming.


Srinivas Kandagatla (6):
  dt-bindings: mux: add optional regulator binding to gpio mux
  mux: gpio: add optional regulator support
  ASoC: codecs: wcd-mbhc: cleanup swap_gnd_mic api
  ASoC: dt-bindings: wcd93xx: add bindings for audio mux controlling hp
  ASoC: codecs: wcd938x: add mux control support for hp audio mux
  arm64: dts: qcom: x1e78100-t14s: Enable audio headset support

 .../devicetree/bindings/mux/gpio-mux.yaml     |  4 ++
 .../bindings/sound/qcom,wcd938x.yaml          |  6 +++
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 25 +++++++++
 drivers/mux/gpio.c                            |  5 ++
 sound/soc/codecs/Kconfig                      |  1 +
 sound/soc/codecs/wcd-mbhc-v2.c                |  2 +-
 sound/soc/codecs/wcd-mbhc-v2.h                |  2 +-
 sound/soc/codecs/wcd937x.c                    |  2 +-
 sound/soc/codecs/wcd938x.c                    | 52 ++++++++++++++-----
 sound/soc/codecs/wcd939x.c                    |  2 +-
 10 files changed, 84 insertions(+), 17 deletions(-)

-- 
2.39.5


