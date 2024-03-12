Return-Path: <linux-arm-msm+bounces-13954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC74879C83
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 20:59:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 03BCCB211C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 19:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE7E14264C;
	Tue, 12 Mar 2024 19:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W6gUpd5q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DCA5914E
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 19:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710273594; cv=none; b=HeAgUhXOS+DZ17MDopCSY+W00Xjv8TOW08C+VqBXeBJtLdVZ/SmIaJK4IMBpXE2dVSoLUHa0LmY7F4KN1BQY+PoFsaU768F2aFhSUbKWWoQrsY4OW7st3TGWmJdqpX7dqkZG83yXUdLQzIANfzrIBIrE2v4yMM2YDzyNwW06QkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710273594; c=relaxed/simple;
	bh=vxyILqM2pTOQjWI17vsz1rK/+KP34kv9dRm9oT70tnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OnwSdv/Jqx0Lf5hDK6e5CCO6+Mmor4NQQ34jo0uAYSOcW3wse8t0EwKMaN0xT7FrWr1U3y+KwuWwXU0RKmE2gOba/1StPH+Lo0O+SjhRg55JtWHYrqZh4Gp/deZYe0RAQJsH4dsupxSrNaVuRtzC3rkpCpYipbRHONV9x2EEabg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W6gUpd5q; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dcbc6a6808fso5896129276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 12:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710273591; x=1710878391; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pi49WpRFUlZ79OB0qX5D/qCdjX5AaLtrt3eQtgbokw4=;
        b=W6gUpd5qqXnAQwLC1OddBvoPqZaf9YndiLIWOvSsBndGA1dWtDtQhmoW+OHWstfp+9
         ouvefFbI302XO1MdliHqWSb2jXpp/S82VpQWUD/41ghVOHKG91I1zcevgZx88rsWMoxl
         +AnyDXyaj5hJu+pm0LzbDE5JPm1EA21gp+mxgn70ECOx1YIeMlU+o3eUPh0hPX4TagIV
         l1VHsu14aLA12eT1MVsYPggmvEOcA8tV7zO1Xz7KjGsFWBrVJc5jXidhaxEi3J7wI06P
         JhMOIyWR/Nh1B5cfLOlQayHjyKfB2RsEJ7vFWyvKmuXAT0YsuNvO3et7b6oydj23gMt6
         vb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710273591; x=1710878391;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pi49WpRFUlZ79OB0qX5D/qCdjX5AaLtrt3eQtgbokw4=;
        b=PkbKiEJ+qeaNElYgy1DI3xSiu15jHxaCK3+ktly8299OErkPEEgQud78kp92IMvXlC
         zoDF0U4YPOD2RKmiy4Yt/gF6W4iQ2fatZiNIFhNxCNDeNLNdPFfP8NGYWaxmPDM0+YvV
         42xsGsIbhWbulFQcby85mksBT7bJ8OJ9T4NxwRYv0XFRn1Io3UrdHFZ36c43gsPhsAYh
         PvJuxv0vcYpenMLf7Jj4u2kQzAnV4B3L/aQJf37vZY0I8NV03RAuw77PqV8oLF1s2vMk
         43b5Vh9eNIq0NZNJRZK1/wrqEcZSIf46B8g3izUC7Nerlb4sgQ7yhLmSDk5BeDZnHOVm
         31Zg==
X-Forwarded-Encrypted: i=1; AJvYcCWN8hthJDbRSXp9FLtKlLBwpD34jcAGZcEf4Z/QxlvQxU2lz5l2BOVaPvtNvBBWIsyJj3toVB2J4MY0117zk2FT/wynpTvGYnfvvfmwTQ==
X-Gm-Message-State: AOJu0Yx2dkJXMgvRnlKy3/RO6e+VNRMg2qooRUDZpe/plNHmv6rv/Kd3
	gRBIlFP9BQJG59n/X+5OMOXtUuz23xagXzZGlzIv761L03FHDDcO7w8+DKjjOhdfxnb19pAjCzK
	VjemMqzzDPYu2UQMWqNzpzF067G2KEVwQHBWTxA==
X-Google-Smtp-Source: AGHT+IEBM2eUt+FpOxElMNCpfGkf+edtkynWu93yFwNKNJhesWhAXHF3tYfjLASjxZiHcG9P10bBu5NJcDFB0iKXjYA=
X-Received: by 2002:a25:2648:0:b0:dcd:a9ad:7d67 with SMTP id
 m69-20020a252648000000b00dcda9ad7d67mr475562ybm.8.1710273591311; Tue, 12 Mar
 2024 12:59:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223-topic-sm8650-upstream-hdk-v1-0-ccca645cd901@linaro.org>
 <20240223-topic-sm8650-upstream-hdk-v1-2-ccca645cd901@linaro.org>
 <8a1b08df-dc44-6f9f-c819-33491308699e@linaro.org> <65d60ed4-e52c-4f98-84e1-4d753e29adfc@linaro.org>
In-Reply-To: <65d60ed4-e52c-4f98-84e1-4d753e29adfc@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Mar 2024 21:59:39 +0200
Message-ID: <CAA8EJppT_hnzkzf0txesadt1MNky=d1swx9kD15RS3KQN2VHqw@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8650: add support for the
 SM8650-HDK board
To: neil.armstrong@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Mar 2024 at 20:45, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 03/03/2024 00:26, Vladimir Zapolskiy wrote:
> > Hi Neil,
> >
> > On 2/23/24 10:52, Neil Armstrong wrote:
> >> The SM8650-HDK is an embedded development platforms for the
> >> Snapdragon 8 Gen 3 SoC aka SM8650, with the following features:
> >> - Qualcomm SM8650 SoC
> >> - 16GiB On-board LPDDR5
> >> - On-board WiFi 7 + Bluetooth 5.3/BLE
> >> - On-board UFS4.0
> >> - M.2 Key B+M Gen3x2 PCIe Slot
> >> - HDMI Output
> >> - USB-C Connector with DP Almode & Audio Accessory mode
> >> - Micro-SDCard Slot
> >> - Audio Jack with Playback and Microphone
> >> - 2 On-board Analog microphones
> >> - 2 On-board Speakers
> >> - 96Boards Compatible Low-Speed and High-Speed connectors [1]
> >>    - For Camera, Sensors and external Display cards
> >>      - Compatible with the Linaro Debug board [2]
> >
> > what are these [1] and [2] references? Probably there might be some links.
>
> Indeed
>
> >
> >>      - SIM Slot for Modem
> >>      - Debug connectors
> >>      - 6x On-Board LEDs
> >>
> >> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> >> ---
> >>   arch/arm64/boot/dts/qcom/Makefile       |    1 +
> >>   arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 1259 +++++++++++++++++++++++++++++++
> >>   2 files changed, 1260 insertions(+)


> >
> >> +&pcie_1_phy_aux_clk {
> >> +    clock-frequency = <1000>;
> >> +};
> >> +
> >
> > May be put the clock above after &pcie1_phy like in the list of gcc
> > source clocks?
>
> Ack

IIUC, this is not the actual frequency of the clock.


-- 
With best wishes
Dmitry

