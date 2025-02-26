Return-Path: <linux-arm-msm+bounces-49567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 335C9A46F34
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 00:14:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02C473AF2C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 23:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6BA22702A9;
	Wed, 26 Feb 2025 23:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7ZtnRnE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F952702A1;
	Wed, 26 Feb 2025 23:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740611694; cv=none; b=shWlPLSo3QFPoocHrYnCIkZYUp+Q6kFlVk7BBxnYGiJbjRw1+uMnvX2NcJMelXlxuHYpaosfPDw8A3+bl2cJ3R6xhtzoGikVNdvySHBUVDEfiC9RUE+QPpw2CE78RmJqnjP+HUPeYVCvbACX6mDefx6KQu7ARL0KebZf4BdwYUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740611694; c=relaxed/simple;
	bh=IFHAOpu+n//DKOMfiFBYd087s6JUXW9mnAyO3Sp+gT4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pkzrHHYK/dbF4ATbUWSQtNBh3FjwP0foa5kkJ4+UXZX7FLI08gZoEL5LCEzEyc5z/sk8X909f31TFconJtGqEAy4iYAZN5Ea4wKEAMAjCOc42NYIjJqI3xkW6bctQWvmGseqwtlI01SViY1XjG+V0q1ZdeB6Be/0Ql1lyMxk/0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7ZtnRnE; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38f2b7ce2f3so222722f8f.0;
        Wed, 26 Feb 2025 15:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740611691; x=1741216491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y+FxedeWyw8wFOj4l+6pOUQLg6gn3S2T5avhUj/nDAQ=;
        b=i7ZtnRnEG28ELv0YU0JZVHK6gNcBpK6Tsk6GZis/dGhg0anU0520DdhYNpXyBPDWFc
         o98ZF48upDEGdkgqRZiP8+bSFGaPq2jS74gccx0meBAZC7Wql6rh41MJpNBme8q2zMBl
         GnMvKZyOT++VSk7EjZMTw+E67v9vr+VR4GDXmz8il8HZ/D3ppwUh299uKYD6KHwo5s6t
         3KkwjkARGyVfjHhZgU3tIiOOAj+GMe/vcn0swlL7ToS81SPXm6C14a8XtWWovKqUjrFe
         7D891Uiw1apAX7jyO8Po8Rtkn8E7qIeWFUghLel9pu+bq/TjPY7/YaCj0N9YLzto98EV
         fmig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740611691; x=1741216491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y+FxedeWyw8wFOj4l+6pOUQLg6gn3S2T5avhUj/nDAQ=;
        b=MaSG016wXF02tEEzbuHz1i8U+WMQxuJrIq0ckuj5c7rYt4BfxRawQ64qx95/J+/pgl
         03f3eYioU17SewouRxJXNjvJfPywfhLdlphpHbWiC7fb+RW28X75HfE3Cvk2wtbu+Uy9
         8Tb5uqyjo0b6jsVe4I2KzAeHqkE4lDamR0Sbjta2b8r6w78EOtuOC0X5QmLUTZl97GdP
         qRcfi6khZTvh9zj/+muaf6IijCj7duQl78eDShYHGvogQoa5bSsvJnDAEjVMZPUsureI
         05uXqGp7Q9JMBCZ3UcqFa9sCUY3ukkWkqOkdX+aqAWtTKKEmB1/mPHYzpL9Ls5bqg208
         A9bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIIbynmQlYWxuPuE/d2UT86pHZQWBz3KYhOGNbJPeKhPnQesnrotuHHe7gAvb/vq+QBmlcErp1wA2S@vger.kernel.org, AJvYcCUsu+ai8S6efoZuwcWqIaqri3X8sdiWuh+447w18xKdWKaeIlT9d1grY4GysfhjS9NmEbGtkywftPgJNnIt@vger.kernel.org, AJvYcCX+QH4CIyQ9fSYF10cT5B4n9A08Vkjevd8IC8p2iTiAQUgjEb93UCAzcct186bU/P1pi6ZsJCh114DqdV/XdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAN44n50CGPMLBNn6X0OP5nFQOGzsu17z077IKoxjJKAs/HV9e
	nmHAJAaaQIrLsDXreGEQcjG9d+1f+qBeyfmGxgPZTFkKz0y2K8s=
X-Gm-Gg: ASbGncvNA8uB5oHEDEjtGaHEO0qral115eYY0jUCeRxml7EY6myNruVtQ3kAbOwHGl3
	zy4oXdJjGTxUP8osa0z2znvnjVf2i8HYwhsY+zgAmZR2bvqS0vLkE5y9u5PLXR9cj0NvXPHsvEp
	dCFp94DCFVghNId5JWsugJzzf32YUhdWzHfEgpE+nRYBsFO/TnhvTGWu7wOvmUEq9Iv8nN/7fsF
	GSIl42cHy0cByaH3jJt4Sjn9pa1M5ELGI2Spgx6qOwqxGpxEsZzy8mERWkpGjzSr4SwdHvvvbza
	5hXktNeFdZHU7WPcEB99PWfBAoCRO0UBeE/8BtEbvAlZqyfw9ziUvFrdfhuS1TLuxy0jSqTeig=
	=
X-Google-Smtp-Source: AGHT+IGSvAwYr8mut+L8fdr1Q7PF5uhKL4icm6gChBzwMrc/AtYARcYYHB2A8SZXUt41g0l7ZB2w3A==
X-Received: by 2002:a5d:452f:0:b0:38d:d274:4533 with SMTP id ffacd0b85a97d-38f7087d88cmr14235893f8f.55.1740611690859;
        Wed, 26 Feb 2025 15:14:50 -0800 (PST)
Received: from alex-XPS-13-9345.lan (adsl-178-39-53-103.adslplus.ch. [178.39.53.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796517sm238134f8f.5.2025.02.26.15.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 15:14:50 -0800 (PST)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	laurentiu.tudor1@dell.com,
	abel.vesa@linaro.org,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v1 0/4] X1E Dell XPS 9345 External DisplayPort, HBR3 fixes
Date: Thu, 27 Feb 2025 00:12:08 +0100
Message-ID: <20250226231436.16138-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As initial LTTPR support for msm driver [1] has landed, enable external
DisplayPort on Dell XPS 9345. It appears that supported frequencies
need to be listed to allow HBR3 speeds.

While at it, enable HBR3 speeds on other X1E laptops that have external
DisplayPort enabled already.

These patches were extensively tested over the past few months on
Ubuntu's X1E concept tree [2].

[1] https://lore.kernel.org/all/20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-0-c865d0e56d6e@linaro.org/
[2] https://git.launchpad.net/~ubuntu-concept/ubuntu/+source/linux/+git/oracular/refs/?h=qcom-x1e

Aleksandrs Vinarskis (4):
  arm64: dts: qcom: x1e80100-dell-xps13-9345: Enable external DP support
  arm64: dts: qcom: x1e001de-devkit: Enable HBR3 on external DPs
  arm64: dts: qcom: x1e80100-hp-x14: Enable HBR3 on external DPs
  arm64: dts: qcom: x1e80100-qcp: Enable HBR3 on external DPs

 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts   |  3 +++
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts | 18 ++++++++++++++++++
 .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts |  2 ++
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts      |  3 +++
 4 files changed, 26 insertions(+)

-- 
2.45.2


