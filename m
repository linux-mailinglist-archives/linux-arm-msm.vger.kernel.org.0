Return-Path: <linux-arm-msm+bounces-44044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E584BA0314B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 21:21:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7C80162AB8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 20:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 983C11DFE30;
	Mon,  6 Jan 2025 20:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VEPPO9yO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBFD194A53
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 20:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736194893; cv=none; b=Qpa+tPbENFIUhjq8gCEXT/Jc33xqamnc5r4JizKwJhDlSNnL2w5Srl2eW20gGJLsTjeh8I3/JKN7vXTFqZxfleMQKyo0bWB4wOGD4UUS7Wh76vmghb95BThRC72GG58xMLOO9gy+Yf8XHw4PcjORdKJM3rt900Plz006gs0tZ1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736194893; c=relaxed/simple;
	bh=bMAr4DQGzlza/TutyhbPaI1HQ2tcZJbHpg/SajkA+Do=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RSory7ws7DnQNuvvwm9P4jtT7i0i4+dg3ERIQMxfSkXhyx35/xTcoxaVeZVvr2gmWLS+3tXuehfSFGer5EoasX4YFP4P7VuXbWetLHplthpiPLtPBPcu/VDfoydI+u+tEMT2q20ZXdmVzHnx2l1zQm2umUjZGCEanuXobMckxGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VEPPO9yO; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436202dd730so106102075e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2025 12:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1736194890; x=1736799690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N08679NMA6u8B70kqY81dtpRf5QTarA7SLWj7Tm0mBQ=;
        b=VEPPO9yOrtM7AwJMvO5TUaTzpzfEKod72PJMFGjyDP7+5P0lQWsYVi2JeOqanGduid
         2imuFl2sqEl4UhQP5U7hYZCBQ0SyqAMkkzDXMsy+bl8Z0AIPWnx3Wte7L+hEEkWMNeui
         kpjZjNpsaOjNAtENgJfM51DJThb7St8cs/V42J0k99XTnt8JCbkuF9F+BI6o0mT6pQHF
         KeAiA2eIH886FQyrcSVdywQGgTY6J94MW+wm4h/qww1j4Wu+EnyuFV0/4bliu8ZPFC1+
         8Z/DwMtSXAiiwjdYHq6ojamHyds5Zp40YTUFMy70KTkpIFD9k5Sn3qPQqG34XYHn5vRC
         QSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736194890; x=1736799690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N08679NMA6u8B70kqY81dtpRf5QTarA7SLWj7Tm0mBQ=;
        b=hSf/q8CAAOeg7UN4C66FYxueqrjfpHrszjBvkNJT7Whv5h0aUMPANYB7i+iDaRLRrI
         x0tn44Vmv8ZoTnLbwlrh2NEuL13ZdHvnq4yJLnwc61dgPfPGz8jTnvL3spHjUPYW2Yi4
         4bWNfBhjwNqrVzISEeIQ5DAsoldpAHN21MeJJF8YVawCz+N/wDGP0VTCuUcy17Igx3Ju
         7/wxO2ZVJGhY6W+0ZC5xIK4uEd3qGq7F5HEcrxya8PXI57TvQGMXY440E5KrresOCTR3
         bCEcXUrXftiQcjdt8/98n6wuHwQk4cgsF3SLpRlgG8vQDlfdPtV9tZAGTGTJ1Ep5+JKd
         9vLA==
X-Forwarded-Encrypted: i=1; AJvYcCXTZ+J7/jCbcBoBd4nzwu7OkhGmi8r9lLoFjr+955QvHWCBb9ICp0ZQt9vxIE6l32U3uSvhgMcxW8BviWyP@vger.kernel.org
X-Gm-Message-State: AOJu0YyuJIo8ANuGIaH4DUZVg8rTH+hvpW42BnmOeCkgGekWcznpBE3+
	EbbKpCTfpQJzcsocez+VQUq3svyXg96G+MYqeQMazi7MeDnxSkQqByFzvdpZFKM=
X-Gm-Gg: ASbGnctpZJizv49IWEtT+mtEOPhz6n8Y77aTuLF7ZS7nDHJ4/Unj62ykhCSWY0ceegS
	dL2sxkcN0DuAF9ZG+GYfhn5DHSMnN+2/Qn97D/TIhgZLk7PSg4kAE+7KmpR84YE4oL30orN8hR5
	0jjuts0pKEvI40DeBjZN5h/jYu3Ipfo3be7fjqQhc9rSJ8byWURK3R+ziHeOaiThL444aQLWGbd
	4m27qtpudV+bDZHcC2/ls4wQSNsWTMxYqlGbEl1qCZYiy+OPo0daA==
X-Google-Smtp-Source: AGHT+IGcUgKVgqgZbOiKeAaKRBuyaX/xWL0sgO52tcYB5Zp3oWkT56O/vF9ag2QUJgqxEUh+Octj7w==
X-Received: by 2002:a5d:64c8:0:b0:388:c75c:e839 with SMTP id ffacd0b85a97d-38a223f7167mr46626721f8f.42.1736194888096;
        Mon, 06 Jan 2025 12:21:28 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6d7c:e1c5:e9:58a5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b4471bsm611364335e9.44.2025.01.06.12.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 12:21:27 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH 0/5] Add EEPROMs found in the camera sensors on Fairphone 5
Date: Mon,  6 Jan 2025 21:21:26 +0100
Message-ID: <173619488358.255016.2244642661299426243.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
References: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 03 Jan 2025 12:11:56 +0100, Luca Weiss wrote:
> While out-of-tree already two of the three camera sensors are working on
> this smartphone, getting those upstream-ready will still take a while.
> 
> Until then already enable the EEPROMs found on those camera sensors
> which doesn't have a dependency to the sensor drivers and gets those out
> of the way.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: eeprom: at24: Add compatible for Giantec GT24P128F
      commit: 56d4ef115cc51b1fe7de1e695923126923c9f9bf
[2/5] dt-bindings: vendor-prefixes: Add Puya Semiconductor (Shanghai) Co., Ltd.
      commit: eace9d83c831c44b4f63beec18774fe4a46d12cc
[3/5] dt-bindings: eeprom: at24: Add compatible for Puya P24C256C
      commit: 36036a164fac96727ed724a388dae38d2f5f21c1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

