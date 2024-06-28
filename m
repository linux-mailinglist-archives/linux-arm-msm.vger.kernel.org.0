Return-Path: <linux-arm-msm+bounces-24566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8720391B87D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 09:33:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB45DB23600
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 07:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FE4113F43A;
	Fri, 28 Jun 2024 07:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AO1y54mf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094C513DDD9
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 07:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719559996; cv=none; b=iNdwyGkkwm5TSFv8mm2KYhd4gkzDMDMsdzWmsubD5pGLBvqUCL+7F8okjlVxWxKJWakjIBYKjHv9bF/otth2xO8lYvCePUjeOZxq/iTDGiN0b5MK+StxFXiUblrTRamvBvq6Hgk2X1Wqh5FpHzMGCrPwfa1rC7iIgNyhhzEgpQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719559996; c=relaxed/simple;
	bh=fhEQxG2qTbjZN91S0rg0hi1K9A0vwX6aPYn6QxWZCPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z5POJALhKxPUnxgEzYORqYkpl1LrYOXvBhQopYppsl8/f2rmVMaHfXqRcl/2E3viSKNmMX2ygIMty0NvhE/UAwHHmHSL/3+NIgZqJ5KNesXlCtGpyrkJhWBzSvm3xG+K6rz7RIMjRgrl+z8XrEju3XSGsmhUO/FxV2PdTe3l178=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AO1y54mf; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6b2c95b6c5aso1235506d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 00:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1719559994; x=1720164794; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fhEQxG2qTbjZN91S0rg0hi1K9A0vwX6aPYn6QxWZCPY=;
        b=AO1y54mf9HRww1t3oz0Ru/7x11VOoxqf0tXFYi1ZO7aIAvQC5BO75G5jmicqxetUHC
         27GQkTaYWYElOJyaPS3uXWUXajyYGVrSS6vuvyPwJUMe7f4yPnCgImLQKmUBUi+P14pX
         NeyqitqiYjHrT/7bhJRh330nL9BGu7P3zRxzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719559994; x=1720164794;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fhEQxG2qTbjZN91S0rg0hi1K9A0vwX6aPYn6QxWZCPY=;
        b=cwGRrzQVq62S/dB66WSWTIBDa0gP3D15onOOIkDwKEUKLgtjbtE6fsCBpvVk3SXJJ+
         urlkhdxmxL2rS9K2o4yTTSRghdEcmUL6fHomScRiYbKNwIpP7/GnHliFvx3FH3AxQcTV
         0QNp4WWTOPsKPSCIIPGR9iIA85n4K4CwpLbNOEwIXX6RnHtMnXU6rZG+UDrXnb/Q3TO6
         sHPhIG8bm034J/SWVFMk8vq5/kcZcwF76mCd/eEXvVl0PppygCBrr/p0HhC6SFFLkBD1
         0+B5zDt0vqyE8yrO+ScVJ4N0vn9dsoVM41I8lTjpqKeZgWcsa4DmWWEifQiS+kQtSKIu
         8htw==
X-Forwarded-Encrypted: i=1; AJvYcCXRgb8Pvgw3y655uS2qIdtlisrZJpH7CZUQgtBT5qIaXWipqZ8bRAauiHulKxu5RtqCpUVAl5PeEd9sfSoyl+X42bLnBQUMQNgG2yEsuw==
X-Gm-Message-State: AOJu0YxSZIE041Tnp2I1MGR7AHO49I4dihtdoAEecJWNk2w6NVP+Tyfk
	RqB7SYsHIdTtmHeoC/NfSrYDp6jzpB89s1ZEUc4s/jaaHcAqSLptP9KIjbOLCdmD0NREzxkgq5P
	/iiiLX+pZeQVsUTZqdFgK26fJAOtZR+BrKwyo
X-Google-Smtp-Source: AGHT+IFtlg4GXqIUq6G8KVbY0YyTZlltS5N4rP5s+jMEbCRSz6H+GikKFPEyRJA+V2iuVaZcHJs5KdP+l4D4Ob4meq4=
X-Received: by 2002:a05:6214:27c5:b0:6b5:7f22:d7c7 with SMTP id
 6a1803df08f44-6b57f22da77mr92908946d6.65.1719559993953; Fri, 28 Jun 2024
 00:33:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
 <CAFLszTjexpNEjo1sGVs67L0CAgGZLNkyn9RGfHRD7iHak_mtmg@mail.gmail.com>
 <20240605100246481-0700.eberman@hu-eberman-lv.qualcomm.com>
 <CAFLszThbe_aUAq_5rCCiPV-bj60oq9UCc=vdDHwM3i6t44ohLw@mail.gmail.com> <20240621142054973-0700.eberman@hu-eberman-lv.qualcomm.com>
In-Reply-To: <20240621142054973-0700.eberman@hu-eberman-lv.qualcomm.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 28 Jun 2024 08:33:03 +0100
Message-ID: <CAFLszThO1doxsXSYTrTTPy9QCW4hrBb07k0VdSNWip=4MKtTnA@mail.gmail.com>
Subject: Re: [PATCH RFC v3 0/9] dt-bindings: hwinfo: Introduce board-id
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Amrit Anand <quic_amrianan@quicinc.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Caleb Connolly <caleb.connolly@linaro.org>, Andy Gross <agross@kernel.org>, 
	Doug Anderson <dianders@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, "Humphreys, Jonathan" <j-humphreys@ti.com>, 
	Sumit Garg <sumit.garg@linaro.org>, Michal Simek <michal.simek@amd.com>, 
	boot-architecture@lists.linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Elliot,

On Fri, 21 Jun 2024 at 23:40, Elliot Berman <quic_eberman@quicinc.com> wrote:
>
> Hi Simon,
>
> On Thu, Jun 06, 2024 at 10:00:54AM -0600, Simon Glass wrote:
> > On Wed, 5 Jun 2024 at 11:17, Elliot Berman <quic_eberman@quicinc.com> wrote:
> > > On Wed, Jun 05, 2024 at 07:17:35AM -0600, Simon Glass wrote:
> > > > Hi Elliot,
> > > >
> > > > I am just picking up the discussion here, which was started on another thread.
> > > >
> > > > I can't see why this new feature is needed. We should be able to use
> > > > compatible strings, as we do now. I added a 'usage' section to the FIT
> > > > spec [1] which might help. I also incorporated the board revision and
> > > > variant information and some notes on how to add to the available
> > > > suffixes.
> > > >
> > > > Does that handle your use case?
> > >
> > > -rev and -sku don't fit the versioning scheme for QTI devices, so this
> > > isn't a generic enough approach. Patch 5 in this series describes the
> > > versioning scheme for us.
> > >
> > > In the other thread, we had talked about using some regex based approach
> > > for matching the root node compatible. I haven't had chance to work on
> > > that proposal and will try to get to it in the next couple weeks.
> >
> > OK, I look forward to it. Please do check the FIT best match approach
> > and see how it might be extended to handle your requirements. So far I
> > have not seen a need for regexes, but it is certainly a possibility.
> >
>
> I spent some time collecting feedback from the team on using compatible
> strings + regex-style approach and we're not able to add a regex library
> into firmware, so this approach unfortunately won't work for us.
> Because we have more axes of board identification than chromebook, using
> FIT's compatible strings isn't a scalable solution for us. I don't think
> we have incompatible problems, we only have more than 2-3 axes of
> information.

I understand that. I assume that you have a lot of devices that use
the same SoC but different PMICs, displays, etc. Some of these can be
handled in the bootloader, e.g. by detecting hardware and applying an
overlay, or enabling/disabling a node in the DT. It can be useful to
have a hardware-readable ID to indicate things which cannot be probed,
e.g. with GPIOs or ADC + resistors.

Another option is to give names to your projects, so that machines
with the same SoC but major hardware differences end up with a
different name (see rk3399-xx.dts for examples).

I'm sure you are already doing some/all of these things. I still feel
(so far) that you don't need to invent something new here.

Re "FIT's compatible strings isn't a scalable solution for us", how is
what you are doing different from other vendors? Is it the sheer
number of variations, or something else?

Regards,
Simon

