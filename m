Return-Path: <linux-arm-msm+bounces-31612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8761B976C76
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 16:45:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 469D4280CBA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 14:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 376601BBBC3;
	Thu, 12 Sep 2024 14:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M64PuJY2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B2F1B373A
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 14:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726152303; cv=none; b=AqYaRP/JNx/u/fZmReOo46YQwruNbltwuYRlk1LRpCvbcZmmOhU82HULo5Q8drqhjM0eIers5KA/jxkHfcBqkEwbA85cbPQGML0aZ8NU3fBWZ8qsNPor+xOGYwoE++vrVzB5772NGNv6NUlwx36tDXRAElHcd2VgEnNHWkMxUVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726152303; c=relaxed/simple;
	bh=A/8ZCG9y3TEjGNR152EIdHi0nvsFyn37cQI3yggThnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nrDSxy3XXoOZDiwe+/B5bD5OxHzVkP5fmxnutDDemjcjnqY6LGIXjmkfRJ0toFwtysTvfFhdlYmpIG/4Aqa8k8jk68w2VufK+AOWcrDI/k8L+6O0ISeEM5QOmtJDqH7Si2rDGGtfk04SMuUmEJQMz9ANHtgLR1Lqj4W+NMRpb4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M64PuJY2; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5df9433ac0cso548673eaf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 07:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726152300; x=1726757100; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Us8nS3NBHkRNjHO7PeWm6594BLpqNuKjFcNB+sFes+A=;
        b=M64PuJY2q7KYAL40MoJ6dBc9GVuYcuKgtCUZckScnQOdyW1I+CCQzRKWvQOcEfSpi4
         HkyDAeNWiYfZtqb5vEPTndtv0sT+5vvJC1a1HSq7vSP+EDTzN85dSocYGrS+TB1HouvP
         sPJmitc6aSX3NCPIRi6IWAckO/x1qtAknGJcG845RCzEFHq5p/iAPun27yf3oE5FNEGw
         QcKFnrIwWNkSTKWBuc/a6cqOx0rzLZLfNIEkq9+K/KZ2zLQ9cFig4hSDLfsmMEQywgQv
         JILM/rfKbZU0rQgsof/Z1pzuIewpJ+A/4fU8wXw6nNlIegmElIfrQKk4QwvJi/36y5H9
         3qnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726152300; x=1726757100;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Us8nS3NBHkRNjHO7PeWm6594BLpqNuKjFcNB+sFes+A=;
        b=Kxx6ajUcRw/h+14YevWgOrUZYCn4IF0qyfW0ErQPagFIciOHFFpawkXskj6SYbfQRT
         X5jcCM9PFshTX6WJXLQqMpWcsW8BzJjAS24IVUv7hmeSMdEywqVN0yjyVST0m6WKYs+V
         oJSr9WOlROSUuoZRdevXagIRtc0qcUtYTnuasItxWi2kXomma38bh/7QO5wYXLlL2pK9
         McvRu3Z1fM2HqdcxJFiKmW5gFy2YtBwUMVsI8Iq/3frNzgYIaS5uzrt3U20WCQPCYxPP
         Dtw/GAJm8stnYgj3FB4X+0WkcxlVG97yagUo65ftKfUdJKGIa2HS6KrTXnbWOMQ+v2d/
         91hw==
X-Forwarded-Encrypted: i=1; AJvYcCVT6+Y/1yHT+Y2yK2C7VbG8D5yDvz1W+xPsjKXIcQBJc37LYUQ3wBhekX1ZZ6YBj3/Y5H4CHDTDekEKbOvv@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk855JR0N213VuVbnKzTaUpkdwLpT6w9wRi1nNS4yEsu7fktwY
	xJiUhZiUJAq8OL8cLoA842sOF/V9wuzFTzzmIiurTJKrqvqwrKEYnm+yvNd/pMWNBR45cnRhoB0
	=
X-Google-Smtp-Source: AGHT+IELriO1F3RjFu7Nlmk0OH8Yy7rcsbs7jfdrPadTuniwAi50BrFet+dLaCQCkStjWf6ncGBXOA==
X-Received: by 2002:a05:6871:3319:b0:277:ff5a:db0f with SMTP id 586e51a60fabf-27c3f2cfe64mr2186877fac.27.1726152300341;
        Thu, 12 Sep 2024 07:45:00 -0700 (PDT)
Received: from thinkpad ([120.60.79.18])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe4e8asm4673021b3a.79.2024.09.12.07.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 07:45:00 -0700 (PDT)
Date: Thu, 12 Sep 2024 20:14:39 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <quic_qianyu@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, vkoul@kernel.org,
	kishon@kernel.org, robh@kernel.org, andersson@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com,
	sboyd@kernel.org, abel.vesa@linaro.org, quic_msarkar@quicinc.com,
	quic_devipriy@quicinc.com, kw@linux.com, lpieralisi@kernel.org,
	neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 8/8] PCI: qcom: Add support to PCIe slot power supplies
Message-ID: <20240912144439.fnne4x7qvggveve2@thinkpad>
References: <20240827063631.3932971-1-quic_qianyu@quicinc.com>
 <20240827063631.3932971-9-quic_qianyu@quicinc.com>
 <CAA8EJpq5KergZ8czg4F=EYMLANoOeBsiSVoO-zAgfG0ezQrKCQ@mail.gmail.com>
 <20240827165826.moe6cnemeheos6jn@thinkpad>
 <26f2845f-2e29-4887-9f33-0b5b2a06adb6@quicinc.com>
 <20240911153228.7ajcqicxnu2afhbp@thinkpad>
 <9222ef18-2eef-4ba3-95aa-fae540c06925@quicinc.com>
 <d5468dd2-0f81-4d89-a3bd-a546b2395ca6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d5468dd2-0f81-4d89-a3bd-a546b2395ca6@kernel.org>

On Thu, Sep 12, 2024 at 04:15:56PM +0200, Konrad Dybcio wrote:
> On 12.09.2024 3:39 PM, Qiang Yu wrote:
> > 
> > On 9/11/2024 11:32 PM, Manivannan Sadhasivam wrote:
> >> On Wed, Sep 11, 2024 at 04:17:41PM +0800, Qiang Yu wrote:
> >>> On 8/28/2024 12:58 AM, Manivannan Sadhasivam wrote:
> >>>> On Tue, Aug 27, 2024 at 02:44:09PM +0300, Dmitry Baryshkov wrote:
> >>>>> On Tue, 27 Aug 2024 at 09:36, Qiang Yu <quic_qianyu@quicinc.com> wrote:
> >>>>>> On platform x1e80100 QCP, PCIe3 is a standard x8 form factor. Hence, add
> >>>>>> support to use 3.3v, 3.3v aux and 12v regulators.
> >>>>> First of all, I don't see corresponding bindings change.
> >>>>>
> >>>>> Second, these supplies power up the slot, not the host controller
> >>>>> itself. As such these supplies do not belong to the host controller
> >>>>> entry. Please consider using the pwrseq framework instead.
> >>>>>
> >>>> Indeed. For legacy reasons, slot power supplies were populated in the host
> >>>> bridge node itself until recently Rob started objecting it [1]. And it makes
> >>>> real sense to put these supplies in the root port node and handle them in the
> >>>> relevant driver.
> >>>>
> >>>> I'm still evaluating whether the handling should be done in the portdrv or
> >>>> pwrctl driver, but haven't reached the conclusion. Pwrctl seems to be the ideal
> >>>> choice, but I see a few issues related to handling the OF node for the root
> >>>> port.
> >>>>
> >>>> Hope I'll come to a conclusion in the next few days and will update this thread.
> >>>>
> >>>> - Mani
> >>>>
> >>>> [1] https://lore.kernel.org/lkml/20240604235806.GA1903493-robh@kernel.org/
> >>> Hi Mani, do you have any updates?
> >>>
> >> I'm working with Bartosz to add a new pwrctl driver for rootports. And we are
> >> debugging an issue currently. Unfortunately, the progress is very slow as I'm on
> >> vacation still.
> >>
> >> Will post the patches once it got resolved.
> >>
> >> - Mani
> > OK, thanks for your update.
> 
> Qiang, you can still resubmit the rest of the patches without having
> to wait on that to be resolved
> 

In that case, the slot supplies should be described in the PCIe bridge.

- Mani

> Konrad

-- 
மணிவண்ணன் சதாசிவம்

