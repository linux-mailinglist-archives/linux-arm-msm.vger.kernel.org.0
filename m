Return-Path: <linux-arm-msm+bounces-7509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8317830D9D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 21:02:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96D4A288309
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 20:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B07724B33;
	Wed, 17 Jan 2024 20:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UxZSzNfP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2F524A12
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 20:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705521718; cv=none; b=rYvaGjm36qBmVIvtP4UfFacaGjQr3DbhDwD7ArSzRFc6ZuYU1J9Bp0yj0dru0EbpADM/ylJSin+PqtF49Q0D/9FumSPwthBBlgcRNas9b85ZMTYKEzMCIZuw1Lc1GS5wSYUUzPyAYaL9cbJplcNyavQJaLsX/GCamGY/tsfy+Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705521718; c=relaxed/simple;
	bh=vTo2KZuIPEY9HMcSjVayb7+G1JYqPCb3WEDckwgFGKs=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=aLggmrcg4+uiiXfCQ5C0EGHAd0EbAwZ4YcKZyllsEJhcKfTzW0cS4qNHKCxidt/w/sqitAH0Yzk+ALh8BldPqhFbhWIJ4AjxmeY6/6Hfw1JM6naMhW7shA+OIgt9f4SBg0OqTAVF41WjJJ3GYQdIgqH4JpMWETbtTTH4RIzHzWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UxZSzNfP; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-7cc4647543aso3543990241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 12:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705521714; x=1706126514; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vTo2KZuIPEY9HMcSjVayb7+G1JYqPCb3WEDckwgFGKs=;
        b=UxZSzNfP+EBIWSY918mgqkNo1zjSq7pYToHvTEaNidqEGE6NUHPoxIFlbbQCxH02TT
         Z4sHm44MDw/xpYwYWh7rKA3mDJsnvC0gMvj4/8wBCcZBhQ0XrN5U5EZIWOKfCwqSet1o
         QYCz5T+8ZlgORCpOZAO7a4xxQ7uwjF+UpsaqpJGIymlF1vcQmsa9zYG4pmqBetHTz46e
         Tej7zJZ3o/zy9XUn7zluF4IdMZq1pe3sXCB02w7jjt5kZVX984bTTII6KhwvSILdxv1K
         uR1Ku5OtW8Nb1Ty7W5ojf5sYhr4jv6pnyqp9v8XqsQm0dv3hLjTJJJltZIGItjrlfhsd
         oI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705521715; x=1706126515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vTo2KZuIPEY9HMcSjVayb7+G1JYqPCb3WEDckwgFGKs=;
        b=hZ7omfUoGume5LjsJEEYTmvIBrbGuZpAhAQCfszqWrgQn/qT5lD0Bs5DhciBFDPw9I
         inLkOE6/aJ5HqnAwwy1dRcmfOnH7JCwKhZoY7jhoo+V8sKycC+mGtzDiKpljiC4CfaLB
         U96bPNWDtLRjJuCyvZhIGI540iVc+ayYlegJNH/WYU6S844Hym1ZAg9esENzJNXNW9BE
         5QzIEFwgh1eWknzqEyDSOfV8ny7qmmhgbtLpjsMs2U9sQ0alecaGGw1Tagef+q0U/tuT
         gzqSAwaJC8hdMxAuAiebxn8u10tYDEsQFGeuNpGHkuRopd0ggppGbMD6Y7cjby0xyyy8
         tQ6Q==
X-Gm-Message-State: AOJu0YyGVuxUN6cT4F1Mf1RMQeuOiQO0CkjBMWh0OdXDLQTeujMAZP0M
	ubkBH1DTZ0OMmd6IjgVRgJtuIAZ9sENjSMR+lHzzzcuhfloogw==
X-Google-Smtp-Source: AGHT+IEtHWFV6K9Sjs8IxH5+/DRSiGMc44HlzIi9bntn43ynF7/2rESLT5bmQ74VLsAw71rE1s5TYn5pF1FCsNlt6Eo=
X-Received: by 2002:a67:fe4f:0:b0:469:6354:c82c with SMTP id
 m15-20020a67fe4f000000b004696354c82cmr3051575vsr.35.1705521714725; Wed, 17
 Jan 2024 12:01:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240117160748.37682-1-brgl@bgdev.pl> <20240117160748.37682-9-brgl@bgdev.pl>
 <87v87r4yvs.fsf@kernel.org>
In-Reply-To: <87v87r4yvs.fsf@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 17 Jan 2024 21:01:43 +0100
Message-ID: <CAMRc=MchrHfC7LTxp0dCtX5AB1TwxTp7Z+tybAtEy1+wLBTJsA@mail.gmail.com>
Subject: Re: [PATCH 8/9] dt-bindings: wireless: ath11k: describe WCN7850
To: Kalle Valo <kvalo@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Chris Morgan <macromorgan@hotmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Peng Fan <peng.fan@nxp.com>, 
	Robert Richter <rrichter@amd.com>, Dan Williams <dan.j.williams@intel.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Terry Bowman <terry.bowman@amd.com>, 
	Lukas Wunner <lukas@wunner.de>, Huacai Chen <chenhuacai@kernel.org>, Alex Elder <elder@linaro.org>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Abel Vesa <abel.vesa@linaro.org>, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2024 at 7:07=E2=80=AFPM Kalle Valo <kvalo@kernel.org> wrote=
:
>
> Bartosz Golaszewski <brgl@bgdev.pl> writes:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Describe the ath11k variant present on the WCN7850 module.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> ath12k supports WCN7850 (a Wi-Fi 7 chipset), not ath11k.
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpa=
tches

Eek! Indeed. So most of the ifs in the bindings are not really needed
after all... which is good actually.

Bart

