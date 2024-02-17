Return-Path: <linux-arm-msm+bounces-11551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7FC8591E6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Feb 2024 19:54:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C9D8B20E6D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Feb 2024 18:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20FFE7E56F;
	Sat, 17 Feb 2024 18:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sTwCheEp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612C07E114
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Feb 2024 18:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708196038; cv=none; b=eNuKKaqk9Sq1mtzHGxQeNwwzNftQrc9V04ByrXKze6igjMYFV43lFDR1MDUB4TnhEFyF9udfQXxf3eM3aEs9TnAd/6YhxTUvMAUQEMD7qVysngR0F2iwrPEs1lGbEWXuOeKoWJx8JUyVM9BUbCaLHMVlXR3OuE1r4KWA0IRjF+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708196038; c=relaxed/simple;
	bh=7FpDL5ycXyZNcpHLLovIdneYlyoyq5WC40Q8GBSv954=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gPXhWBihEuc0PBk7UphaLK5M14d5FaNDI1KBQgVj80VBM7/hEh5apVgpDF8PpF7YuLu5UXroti0hxxsjqB6J85Nn9ZtzAPfv5lJbgxE733UIHyFldLSubE8KpKyhJw75eLJK7OFzqcK1o5FkSEH6+55YYYhfC7CAZwCEWlmB8bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sTwCheEp; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-7d5bddb0f4cso1182676241.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Feb 2024 10:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708196035; x=1708800835; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7FpDL5ycXyZNcpHLLovIdneYlyoyq5WC40Q8GBSv954=;
        b=sTwCheEpbQRR7HWH0eNlv7J54SQ7krjGMWB3kuHNsh8rQMiSQuzRF5yIQonVu5y5jQ
         Rr9VAeuWIbWgi32UaCG3MQHHycVu07+3bNQ10y79WVqpyzDgd9g1q5iHUKNaVWkrkcQN
         vc04jsxeO1iFTLtXP1Lc7JrZXW+Tr7cL/fvSRmke5eYABOHoQWaBg6Nlh1Qx84YFbdo0
         lJnCyyyPdnpN5JyGVWH2XzD2FZzH2unNy9TkCdavlsESSteVNNH+PaS5ruQal+U7ZZPS
         7Rl6W7J14o7REhgABDgOC2EEfv84mp678KyrJ6TxIbvv9FEJCxvzonWapgcZIEk6s1S5
         LGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708196035; x=1708800835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7FpDL5ycXyZNcpHLLovIdneYlyoyq5WC40Q8GBSv954=;
        b=wUGK/U1hIgqnErvJrwM1eJrkctBARpxISpxHIXrqnP9uXkYb98GmdeCMYU4MWq4btL
         pAi4f7cTO0+Oip1yp1WHxspbN7e+Ao47DTwO0IfndtIbtwtNlQdVWS/zv1nojF0vE9uD
         4bZarkdtodNeuxWkzHjzzdhKbFtAZU4ywAjDpjoKh5Nlo46Rus7zVySEDP9hHacztZb9
         dRhcbWRGwO5ZGkCIQtTz2Bee1/onP9q1zR4RRT+T5BzCTSLQBWu1jvwqK062AwP0HPcK
         LZpCpuTw2YFxc5wdBrEXe/yWN63TrsSpMk3SQLqZXxPpeNi0OVzDHcPSO80i/IQ1Itnm
         bL6g==
X-Forwarded-Encrypted: i=1; AJvYcCVsY1j9btR0eteFJ9n9AVTRU/JVNxnyu3ucUM4UTHq/RwmgKKy7Sk5lmnZSq+ymTxLghVExtxKIWa6AVRF/OxlswrXmC6Ki4ls6B61AFw==
X-Gm-Message-State: AOJu0Yy0L4QwelGu1HJu+NalZu+zihvGkAUz1SiOj8RfYAL63o4RY1CE
	+ujdgwygF+vOH6VrNiXf3lzLzYGlmg0pw0FC1GC76nCOOsczncGfauVxPIhi6N+zQmXnd1tTP4J
	RuK7irZQe7hRyhuGcZRZxKevQ/HyujOxg5JN1rw==
X-Google-Smtp-Source: AGHT+IGMlsUZR0OKxV5uoFysUN5BBaGIZC5M0kLSSCwt2sXagBefCJ/FHz7lU856rOvaMtqzE4+peSuOeyewP+QKatQ=
X-Received: by 2002:a05:6102:548b:b0:470:47b2:78aa with SMTP id
 bk11-20020a056102548b00b0047047b278aamr713828vsb.35.1708196035432; Sat, 17
 Feb 2024 10:53:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240216203215.40870-1-brgl@bgdev.pl> <20240216203215.40870-9-brgl@bgdev.pl>
 <CAA8EJpry2yiGXrtPqZ6RXnoTqQZr_hxA_gCPsUbmyFtEBuD4VA@mail.gmail.com>
In-Reply-To: <CAA8EJpry2yiGXrtPqZ6RXnoTqQZr_hxA_gCPsUbmyFtEBuD4VA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 17 Feb 2024 19:53:44 +0100
Message-ID: <CAMRc=MeEWvhHjKJsNgigF=Oja+b1=ejvtAjkK=ptKWK0Ojjo_Q@mail.gmail.com>
Subject: Re: [PATCH v5 08/18] arm64: dts: qcom: sm8650-qrd: add the Wifi node
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kalle Valo <kvalo@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Saravana Kannan <saravanak@google.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Alex Elder <elder@linaro.org>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lukas Wunner <lukas@wunner.de>, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 17, 2024 at 12:10=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, 16 Feb 2024 at 22:33, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > From: Neil Armstrong <neil.armstrong@linaro.org>
> >
> > Describe the ath12k WLAN on-board the WCN7850 module present on the
> > board.
>
> WCN7850 is the same combo WiFi + BT chip. Is there any reason for
> describing its parts separately rather than using the same PMU
> approach?
>

Yes, I explained the rationale in the cover letter in detail in the
section describing the DTS changes for the series.

Bart

[snip]

