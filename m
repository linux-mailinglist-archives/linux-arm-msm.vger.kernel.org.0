Return-Path: <linux-arm-msm+bounces-35815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB129AFBC2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 10:00:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA2DD1F22F62
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 08:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D308A1C0DD3;
	Fri, 25 Oct 2024 08:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rJIRevGV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D301F155308
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 08:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729843222; cv=none; b=gLx+JbeVLldVwl7AHCYMZ1LEvEcSpmFF+Myab10FKLYlC253UexLwCZG6sT26qMzhVcsGHLNHTVqdzmAcZSq1RphZh+0vikqeJ/tNcsRPb+NbZSLCGKi6yYswb6HxlhaxtWzmNc46up7jYS+pbqbdrMH5alouIj0AR1iBOvBDd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729843222; c=relaxed/simple;
	bh=B/pPKlr0lRVJhgrG29eGgTDXqOAPeaIJatsGuvQ/Ch8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jaebZznhKxJ3aQJTwIrGFVH/QLtVjdfQbNHlRCTd95n0kaSfzxUsVJQJ7NGyIztFBveE12r0A+QGIvTgTkM6S3JUj/r+7Ysr/K3U9VWh0IQppSUcYm4aYqtGFm3camPeF8rETq4dCQbwIPVUvfMmM15Gsr4Si53W1mQ2OcxmvdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rJIRevGV; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43167ff0f91so17840895e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 01:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729843219; x=1730448019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvFcTWY0qWSGbaMXRds52cphNo7N/U6FFOoRM52IPjQ=;
        b=rJIRevGVVgSQyIQp0G3bQ9bvKqG91fcrfcLTVe/9mLkO2H8JJK6jQT40NXOBax4SpX
         Y8WyxmWVtHlF2yYn3XuJ+cIyi5Vxog+b7YhWjR5IDeTfZqZ1o0To7+HXpZVWDK7g9T33
         d/s0B/Sf+P1QTbKcYaYjtY8cDKje8f/n9tJOU0vDMHsZWLYVa1jSmgbSTyd8IgQWIeYT
         3hqcEdFlSTK/9FTAoCaLmR4TgU0gfXDkAJ3rs7e086uAloVNQQbIT6SmTM9AmpI40UFr
         QXIx5GUXqS4S4PmOB9tqZ4sHZ/uOd62vONCr5oUotllTxB3M0FMW65e3PwIwuPgD/X2v
         htbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729843219; x=1730448019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yvFcTWY0qWSGbaMXRds52cphNo7N/U6FFOoRM52IPjQ=;
        b=GPA9f3UYgLD3otA/AUkWsEEpXoPivv/axYm5AgVS9YDDNxaJgTlb7pijeinTIcCdMu
         jFZP50vG6LOKr55k1/zFZLAFiBp5kRxwYb9QUF9wAx92jCbk9kTm7Yr57OSs4CRbEhmA
         CiWMwKdzC11FeoQ8wUYDU6KY9g/sQxEh2lEDCl9UqD0jPaFKTR0B1GF1iwrWehWZzWmc
         mKt2bRRcen79s6395bGwFyCYNCjItb1QZhklamJs+kXm3fSILmOtEcLc/RvH1IjTh7ac
         JLhV5analD8q1uZdYkR9KebrfmGwBhTpgwWbEN02SNBFN5uMRVuxzKNRjKCBHkQodjTs
         k16Q==
X-Forwarded-Encrypted: i=1; AJvYcCWkti1jY6nQRmEhidYd89geIg1Wq7odq7lZzIOvk1/xfWQKtiQdkulNq4R6u+hPyAsjBHTp0MGoMYAie1UK@vger.kernel.org
X-Gm-Message-State: AOJu0Yy86bIphnqryDviXH9X2GWBVuEuSETsm86MLdB7hR/l1csYIdpi
	riEaAv7DL0csib1AwPw0czyCd9N6Z2H97bO3rOXKhhUMfPRBxT1KysBKvkrHEgs=
X-Google-Smtp-Source: AGHT+IFLSkse8IfhVHvgfEgOy5tBpZmoSqAyk/ZSA/CmtZwjlrTEnVPdKx/3WSd47HCYFbcdc5HV3w==
X-Received: by 2002:a05:600c:1e22:b0:431:53db:3d29 with SMTP id 5b1f17b1804b1-4318415f712mr64765315e9.18.1729843219138;
        Fri, 25 Oct 2024 01:00:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a207:5d17:c81:613b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b570880sm40499215e9.35.2024.10.25.01.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 01:00:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Steev Klimaszewski <steev@kali.org>
Subject: Re: (subset) [PATCH v6 0/6] arm64: dts: qcom: enable Bluetooth and WLAN on sc8280xp and sm8450 boards
Date: Fri, 25 Oct 2024 10:00:16 +0200
Message-ID: <172984321024.15202.13178717583088352972.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241018-sc8280xp-pwrseq-v6-0-8da8310d9564@linaro.org>
References: <20241018-sc8280xp-pwrseq-v6-0-8da8310d9564@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 18 Oct 2024 14:49:10 +0200, Bartosz Golaszewski wrote:
> This series previously only concerned sc8280xp but while enabling
> WLAN/BT on sm8450 I noticed some more changes will be required so I
> folded the latter into this series and updated the sc8280xp CRD and X13
> patches.
> 
> ==
> 
> [...]

Applied, thanks!

[2/6] power: sequencing: qcom-wcn: improve support for wcn6855
      commit: bd4c8bafcf50b6bd415c8bf04e98ebfba78071f9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

