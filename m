Return-Path: <linux-arm-msm+bounces-14120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0F287BB37
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 11:26:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E82B91F2520B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 10:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEF616EB45;
	Thu, 14 Mar 2024 10:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gbYZCwiB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1376CDD7
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 10:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710411986; cv=none; b=kdRbsGGfYSN6lK8aH1Si0e9IJ96izvgqvd99HZ2557lazf4QMMfggnaQ0euS/gguItsIwosK0PcpNvMyQqM0dgkdsJXjb9nxiSicMXo4uKL50yQXRfy/sm2h6z8McIk2/ShXN5tyrBoYLVwrR0dBhRKQeDUROfa3J1H6hz+6fvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710411986; c=relaxed/simple;
	bh=bClml7W2Syxqpxl+P0XTyjEWXWGG/s5JmZLnZYmwEdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oqctqqzoUb2bBCmj16UO9rp6limOCCWAwkiDIrBVpcxfJS5fA3NHuw2I8cHK090P6AKnBPyl/t6D9pMjZX6EPrR6c18pZ1K3G19oVu71JdmPRsSkQVkHB5Ru51KOHRS1662HDnpuu2KRmDexynZkUACe7QhKkMD8mTTI1n9uYLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gbYZCwiB; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-47288b46f2fso113151137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 03:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710411983; x=1711016783; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bClml7W2Syxqpxl+P0XTyjEWXWGG/s5JmZLnZYmwEdM=;
        b=gbYZCwiBXN0zyT4Uj+JhC5pfcZAZoCkXzwxw4o0qR7YREdG5kiBKdaPp6lSP98rEbw
         EB/5j5tn+iftiwUTRFMlsbte+cllaUBsE3668HWJYfe7lqi5kQOzuKiEyMpleHWL3Ha9
         aFJDcblp6eyGGf6n82PxXSIQK1GUxFI7opnn4cjqct23KiTwTgsMFzWpJoFeo31RQKJ6
         DtGvrlPYWq/CtXf0IiBcVvflBEGsS/sGNmGNpxD1s9hQrsJqoOqCUov8dMauKkeIaszT
         Ot8kI7r5CtPJjJsxU6uCsKFJdiTHNfIhhocGTeoCRGUG0PeBWjplUCS4GK3zFOuXc1sL
         9W7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710411983; x=1711016783;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bClml7W2Syxqpxl+P0XTyjEWXWGG/s5JmZLnZYmwEdM=;
        b=n/5P25tVvlSwKCEDmZoZ6S9PBDelG9l2ZGpXZFCRl5J4hBlWu24K2O2u+Tt81uuNp8
         cGO/FSInkjB8Ws/5n9LkcKRdYbi9lA73lGQLBJZs/Dc1kSWHKi5xLsWGMSDAcfHxugOv
         exH/G7mZ/pYJoqtawq+0OiRgtj1BVKp4YdMHjvwKZZUfUnSFnpWzxaNJCt9SSQwKh+Iq
         8caEaVxC74NbSJar+ja0C4Ur/FuFWkPp4MRco2ZRHI+Ax0cGb2+Vws0Tnm0soNyqSAnb
         XiMEEKI/EHtzkBceLNx0i6rg1oZw0ACbG24R2Jj+IgmGD/DhliMaCeOJycEFJKdcdcMT
         j2Vw==
X-Gm-Message-State: AOJu0YxmKZMvxnItHAC82m4eXX3vEbx1OUCpiSRZFxwBha+fVeEmXP3U
	nf0w+6vjOdTtTltmhDcZ7kEu7uaoQca1b9H5zv4Bhkbsgqiaex4istALuPQUQ7lViV8Dq1bCIlc
	Y6+XPYi+OJsa9ddUGNNV04qJIXIgNHjJrZd1ZgQ==
X-Google-Smtp-Source: AGHT+IHQotcVxfbfFxcjGI7/T/ebobFcozaCDRBw/St3GkLtFEQShNOY4t4ZZOogNwvVxa7Pm+LCr1GCxRVS9jyr/Tg=
X-Received: by 2002:a67:b345:0:b0:476:7bf:8912 with SMTP id
 b5-20020a67b345000000b0047607bf8912mr1239701vsm.11.1710411983143; Thu, 14 Mar
 2024 03:26:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240313123017.362570-1-sumit.garg@linaro.org>
 <20240313123017.362570-4-sumit.garg@linaro.org> <4a0a8db7-a2bc-4c99-94b2-c13facbd1bef@linaro.org>
 <CAFA6WYPh5BS_Fpi6ksAC7bwoFEyqjj1Y3EahyQxCG9Pp=KDw=Q@mail.gmail.com>
 <9dc0415c-4138-4867-861a-38b45b636182@linaro.org> <CAFA6WYPFfL18acdZt6O-_=LWnH7J2MooDuf9cA3JCaQZdoLhVA@mail.gmail.com>
 <CAFA6WYNo73S5ROHCMK0ZQSiU0DDbuDadptmaPL+GPCocE0h-mA@mail.gmail.com> <f03c7979-79f3-4894-98b0-1e5a2dc18ba6@linaro.org>
In-Reply-To: <f03c7979-79f3-4894-98b0-1e5a2dc18ba6@linaro.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 14 Mar 2024 15:56:11 +0530
Message-ID: <CAFA6WYNRwF7GqhBk2B7i-deT3aLxNQckhnOasjip2TYm4HZgAw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: apq8016: Add Schneider HMIBSC
 board DTS
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, stephan@gerhold.net, 
	caleb.connolly@linaro.org, neil.armstrong@linaro.org, 
	laetitia.mariottini@se.com, pascal.eberhard@se.com, abdou.saker@se.com, 
	jimmy.lalande@se.com, benjamin.missey@non.se.com, daniel.thompson@linaro.org, 
	linux-kernel@vger.kernel.org, Jagdish Gediya <jagdish.gediya@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Mar 2024 at 15:36, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 14/03/2024 10:36, Sumit Garg wrote:
> >>
> >> But it then broke dtbs_check.
> >
> > See following breakage afterwards:
> >
> > $ make qcom/apq8016-schneider-hmibsc.dtb dtbs_check
> > <snip>
> > /home/sumit/build/upstream/linux/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dtb:
> > leds: led@5: Unevaluated properties are not allowed ('reg' was
> > unexpected)
> > from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
> > /home/sumit/build/upstream/linux/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dtb:
> > leds: led@6: Unevaluated properties are not allowed ('reg' was
> > unexpected)
> > from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
> > /home/sumit/build/upstream/linux/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dtb:
> > leds: '#address-cells', '#size-cells' do not match any of the regexes:
> > '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
>
> That's obvious, I don't get what is the question. Adding not correct
> properties is not a solution and dtbs_check correctly tells you that.
>
> If you only opened absolutely any existing upstream source, you would
> see how the gpio leds are represented in DTS.
>

It looks like my reference example:
arch/arm64/boot/dts/qcom/apq8016-sbc.dts wasn't correct then. I will
drop unit addresses then.

-Sumit

> Best regards,
> Krzysztof
>

