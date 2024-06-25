Return-Path: <linux-arm-msm+bounces-24094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B26F091640B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 11:53:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61059284FAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 09:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A812114A090;
	Tue, 25 Jun 2024 09:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="i07AcjVU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30849147C7F
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 09:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719309196; cv=none; b=NDZ4LZ6GoJ+3F/vlojYxG+bxe5jeeU97TkRST5HThc4RRZiaR0mB5TddpBvbegwH2NvgJMfz5t3q+RX1mDi1BeetHJe++QuIlKtz+1kegjCfvZXHCfnN5v6ifn/VEeXHAp+nsNROMWKgZ1u6M20ehp2EpID/2X83D9eRVp9sTJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719309196; c=relaxed/simple;
	bh=5fOsMfA//a10gbMrFTNNN7q0nF/8Yis07sAIUeCpLTw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MRHcc9txWZ4bnKEKrBGmTwWYsNu+41+2QDijkJ7c3wQrbZgx6gJO8YIeTzBRWcEcu0tBt0ZMOEFkpAXyMP+SAFIT+TNbzIKyXn46Uj3SdnvCewECmDKkrAO8IpPm3d8VWKRe6TY5q7hGjJ/JGAd9TsQfnRPRd1LFxTil69gS7Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=i07AcjVU; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52bbf73f334so4031659e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 02:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719309192; x=1719913992; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9RqUVVAOM1tDnUN3dY9Htp5pIdnqRxsviToP8WQQNb8=;
        b=i07AcjVUs1neguNqZa0t2Uk+lRdQUR12OZIMEny1LnLpwJNQSVAQKDtmpOG53FOZAb
         5vVOyxDAFEqR8icqhSjV6nQBJdZBN8XULJEDO2QkOL0YFhB9AEGMOKr20FHxrNkYGgYE
         390iWRbr5Z8iqutVqaMPutTZQTuZQr7fV6GVLpQzkA3MdHiax9X8PXF9QP1nw2i6nTLG
         q0qnilEDcE3v0O7DBgg4DM34KAIoe7WyK35iolAD/v7D1IpgKplxTM4IElxtfSJ1PP26
         cLYo3ZSAkYnOjYdHgSa17uX75+I6JEXRT9uzi5mMSMncFDMOqENf4S8NRXbZwaDsYHuT
         1hnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719309192; x=1719913992;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9RqUVVAOM1tDnUN3dY9Htp5pIdnqRxsviToP8WQQNb8=;
        b=RE1qU2iltXButH/OZYOA+SVu33PDwwFHy6ZcIex7UcBzJwI+r9iXsW8f1wVE7iroxd
         C3mEYQ3R+sA8Pi1NOBjla0UB7Ga23fbU9K+s3AeJ5RP7qB9eq2OV0z/IMCmfWwNEFFDv
         3qUWHhmRFjIRUE9hJzB44kXsJPhWt2LoloI+CqI5nCY68lazaVruMcmyeolaFbZ5dZA/
         +6Wg/o6n3dRDa5oUEt1isvUxAx/pW1E9gjtgQ2/tAoUczxgp47Z1OIyaqRfGm3gqpTby
         7GzM0tWRx7V5E7kVwVweH60ipJDZaegUvX6WXvw2mbRFQnFwaOHno4VDINEHw80cpwYw
         FO6A==
X-Forwarded-Encrypted: i=1; AJvYcCVeWpov9QxXrbHn7Yqyg4q0ao+eIotixe5WAxLGEYTDmX1hlLrybt39GmWKWH8yxfTnVmylMCgHIi7Dufvim59NzVlhlIF395GObUjMQg==
X-Gm-Message-State: AOJu0Yw/abFBh0yKXyjJAo4x9LNviIPZ2ugNhWUEvTeQsfIE+Gn6xJl9
	2eO1c1bncj/TGN8u+b9gCBMbtzYo6g0CFY1Yun/IsZbD1AjDYajtmz9dW+kBMmDjdWJDtRAmBTD
	dxbc=
X-Google-Smtp-Source: AGHT+IHpM8BunwwPdvPiWNmjKmtzMLfC9/Piq1T7ZczlkFsx69QObhWgnzrhF+eLaMHFOp00zaHOrA==
X-Received: by 2002:a05:6512:2399:b0:52c:e36f:369b with SMTP id 2adb3069b0e04-52ce36f3750mr4669582e87.17.1719309192280;
        Tue, 25 Jun 2024 02:53:12 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1b57:b4a1:3d50:32a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4248179d8e0sm174183925e9.3.2024.06.25.02.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 02:53:11 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jonathan Cameron <jic23@kernel.org>,  Lars-Peter Clausen
 <lars@metafoo.de>,  Kevin Hilman <khilman@baylibre.com>,
  linux-kernel@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-iio@vger.kernel.org,  Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 0/2] iio: frequency: add iio support for Amlogic clock
 measure
In-Reply-To: <52fab9b5-2b44-49c0-8b90-cb2a74eb6633@linaro.org> (Neil
	Armstrong's message of "Tue, 25 Jun 2024 11:38:44 +0200")
References: <20240624173105.909554-1-jbrunet@baylibre.com>
	<52fab9b5-2b44-49c0-8b90-cb2a74eb6633@linaro.org>
Date: Tue, 25 Jun 2024 11:53:11 +0200
Message-ID: <1jzfr9gxh4.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue 25 Jun 2024 at 11:38, Neil Armstrong <neil.armstrong@linaro.org> wrote:

> Hi,
>
> [+cc people from linux-msm]
>
> On 24/06/2024 19:31, Jerome Brunet wrote:
>> Add support for the HW found in most Amlogic SoC dedicated to measure
>> system clocks.
>> This drivers aims to replace the one found in
>> drivers/soc/amlogic/meson-clk-measure.c with following improvements:
>> * Access to the measurements through the IIO API:
>>    Easier re-use of the results in userspace and other drivers
>> * Controllable scale with raw measurements
>> * Higher precision with processed measurements
>> Jerome Brunet (2):
>>    dt-bindings: iio: frequency: add clock measure support
>>    iio: frequency: add amlogic clock measure support
>>   .../iio/frequency/amlogic,clk-msr-io.yaml     |  50 ++
>>   drivers/iio/frequency/Kconfig                 |  15 +
>>   drivers/iio/frequency/Makefile                |   1 +
>>   drivers/iio/frequency/amlogic-clk-msr-io.c    | 802 ++++++++++++++++++
>>   4 files changed, 868 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/iio/frequency/amlogic,clk-msr-io.yaml
>>   create mode 100644 drivers/iio/frequency/amlogic-clk-msr-io.c
>> 
>
> While I really appreciate the effort, and the code looks cool, the clkmsr is really
> a debug tool, and I'm not sure IIO is the right place for such debug tool ?

The reason why I went through the trouble of doing an IIO port is
because I need that for other purposes than debug. I need to to be able
to check a frequency from another driver. I don't see a reason to invent
another API when IIO provide a perfectly good one.

The HW does measurements. IIO seems like the best place for it.

For the record, I need this for a eARC support.
eARC has a PLL that locks on incoming stream. eARC registers show wether
the PLL is locked or not, but not at which rate. That information is
needed in ASoC. Fortunately the eARC PLL is one of measured clock, which
is a life saver in that case.

Everything that was available through the old driver still is, with more
precision and more control.

>
> There's almost the same interface on qcom SoCs (https://github.com/linux-msm/debugcc) but
> they chose to keep it in userspace until we find an appropriate way to expose
> this from the kernel the right way.
>
> If it enabled us to monitor a frequency input for a product use-case, IIO would be
> the appropriate interface, but AFAIK it's only internal clocks and thus I'm worried
> it's not the best way to expose those clocks.
>
> Neil

-- 
Jerome

