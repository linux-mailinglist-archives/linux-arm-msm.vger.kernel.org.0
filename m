Return-Path: <linux-arm-msm+bounces-10946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24299853CFC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 22:23:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D059928D455
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 21:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2BC562144;
	Tue, 13 Feb 2024 21:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MDMpb4pm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD166166D
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 21:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707858591; cv=none; b=j+PObwoxcunPgU6R/B2HtdFlUXLxiIGqKVdzPPAvdo+mwKpsNJzYTNxB6nE2azYan9eGFDhaE9a1Vy9eAnPJiLKQiWNWiY7SRfc2ZiyOiOBa/DwV5klGBJZoxg0UrCQCaRi2e5wPw7E/17BOXtVVdGcY1REq3AW2oj5pAu1laic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707858591; c=relaxed/simple;
	bh=yE563jYemyl/vAZ+FK/z0jc0wfNO0ntt3wJwgwq9H40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NyDWfSy0drWGzm1YGpy29wYgnQgDLwgb63i1m3rRkA4BmMfCaymV7sV+/m6OTfBhEZS/ZYiXk6r5B6Hbc7nChxoWOrQLucJ6f3j+u1d4ixIsr2YGLclofvIsxdxhqt/4faSxiBHKa8OOGb8VMyCLR4NWwhm5RI5oitj3x5rjR9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MDMpb4pm; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5620f15c3e5so946964a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 13:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707858587; x=1708463387; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odSVkG5Ep60HRCR2A/0o61mTWPkFfp+uEG3bmWlcvqQ=;
        b=MDMpb4pmYr5kNXB94iWQO9W3RymH8jC8OzQZIHa04lsZZtKnk56Tg+LnvQ7GcvyuLb
         Gtuep7G0JleVYgKgM2Dyi+izFPQ9etLhWLMdy/Vh2UiCLeruHwa/ysy4vmPS55eCNFsW
         nEE6328pdD0OtCGJn6aSXDinxyeW1aNFjfTck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707858587; x=1708463387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=odSVkG5Ep60HRCR2A/0o61mTWPkFfp+uEG3bmWlcvqQ=;
        b=twb1p4lRDaVHqDHjyCmSilFHxr9UPWf8RDYwRbh4BseDnWBNA5K9C0sIfAagBEfE5x
         +pIoMacBqxfdirebjYcjzeDYq2WdhDoK+Bobe0jG4HuJnkNFbNI1qjvJLdaf4W1za6WO
         dXn7CN0MR03yPEDRxwXrfi71czsSOHzA04yp4KQZOamtII6jON3AOSPZf+39mcvqtKYc
         X67Q//w5fJIKp8/oVbacTyWZ76ozRNLoN3BQUjneQCp4L2rm7LIwBPXt46RSh7/ststm
         KGbEQp8zgT6PdQSp2DCchsumtJCbNEf+rPrS8RYoj5KFZx3nERs3K5ecBXt++Hw4ZGVZ
         vS+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1NRdZ4fFLITpI1LP/+6hSgVA/KseQlw7WYJeDTPLYmyI/oIPr/UoSi5WsOLGdeh9F+ZiYCJIQkte/BbcVhZSSeY9ZaXWwziw4NdpupA==
X-Gm-Message-State: AOJu0Yyk8fLEvopfLC2WLUyIPV2smdTT+52W7w88EeKm761QwwR4oZf+
	f366hhSut2mkNPQ2uX9qam5KJipDleyZW84eIiegbMR6khN2OKPSN/OAETNCg1ZIhZzTz6Nv7Me
	mtw==
X-Google-Smtp-Source: AGHT+IGyYwSWWwWewA4LUarE8dqDN2nb4CPjNy90JLsXcdnacct14T5DzNfK7CZZXkY/o6f4pvjIig==
X-Received: by 2002:a17:906:f6c3:b0:a3d:1314:7eaa with SMTP id jo3-20020a170906f6c300b00a3d13147eaamr332201ejb.56.1707858587168;
        Tue, 13 Feb 2024 13:09:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVos5s0InZQIUKuk5QeU5+eOgwdV7E1eoGIgdjhBP3NaWv243CmpuMMpv/2wybdh2XNoQJVV7+/tlI7intUSUrnrIBXSuHXuaat0VIlDA==
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id vh2-20020a170907d38200b00a3d08f3283fsm894402ejc.104.2024.02.13.13.09.46
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 13:09:46 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-410cf70a057so88515e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 13:09:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWjrVnYx5a5x9cEHgFPP//MXP+tycjFLqscyVz4lePSe8LZwNgCkGwQCQEAQ+jT0R/YeeTpK9bOapzCLgEy1AUegMnrL1Q5sDU7ZYEoxg==
X-Received: by 2002:a05:600c:1d93:b0:411:cdf8:f3d1 with SMTP id
 p19-20020a05600c1d9300b00411cdf8f3d1mr85206wms.0.1707858585791; Tue, 13 Feb
 2024 13:09:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240213145124.342514-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240213145124.342514-1-krzysztof.kozlowski@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Feb 2024 13:09:30 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V+MNxSpNLCjrHb553QrK4NjZHNJZymQ9+Q7qB2qjOfEw@mail.gmail.com>
Message-ID: <CAD=FV=V+MNxSpNLCjrHb553QrK4NjZHNJZymQ9+Q7qB2qjOfEw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: replace underscores in node names
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 13, 2024 at 6:51=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Underscores should not be used in node names (dtc with W=3D2 warns about
> them), so replace them with hyphens.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8939.dtsi              |  2 +-
>  .../boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi  |  2 +-
>  .../dts/qcom/msm8994-sony-xperia-kitakami.dtsi     |  2 +-
>  arch/arm64/boot/dts/qcom/msm8994.dtsi              |  4 ++--
>  arch/arm64/boot/dts/qcom/msm8996.dtsi              |  4 ++--
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |  2 +-
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |  2 +-
>  arch/arm64/boot/dts/qcom/sc7180.dtsi               |  2 +-
>  arch/arm64/boot/dts/qcom/sc7280.dtsi               |  2 +-
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |  2 +-
>  arch/arm64/boot/dts/qcom/sdm845.dtsi               |  4 ++--
>  arch/arm64/boot/dts/qcom/sm6115.dtsi               | 14 +++++++-------
>  arch/arm64/boot/dts/qcom/sm8150.dtsi               | 10 +++++-----
>  arch/arm64/boot/dts/qcom/sm8250.dtsi               |  6 +++---
>  arch/arm64/boot/dts/qcom/sm8350.dtsi               |  4 ++--
>  15 files changed, 31 insertions(+), 31 deletions(-)

FWIW, everything here looks reasonable to me. Thanks for the cleanup!

Reviewed-by: Douglas Anderson <dianders@chromium.org>

