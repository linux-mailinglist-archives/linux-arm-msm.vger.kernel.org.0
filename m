Return-Path: <linux-arm-msm+bounces-6597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD73826B92
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 11:29:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A2C01F22144
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 10:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E44CE13AE2;
	Mon,  8 Jan 2024 10:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="scJNIGOu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4073513AD8
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jan 2024 10:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-557c46872d3so318389a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jan 2024 02:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704709772; x=1705314572; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J0INKQiw2jrwahwrMOC10qIoex00EN2Y17N016vNomw=;
        b=scJNIGOuUufXBGVqX57JZXkgZoD8aSN7t1bkJKf5U5CWj9jUq/JCTq5YRIgriRI0ij
         RrCxDEW02sUQtQt9gHML+J/ZaPQVqoc8pJ3gNojamPbHbPfw6M1y1uWv9VOSwMzZvAnJ
         +DKtGhzcVOmHRhNKwExMb1zMDcusJr+WEFI4e/CFoIhAHCkwuSgRbAMVNiq2ApR4ZrNI
         XRl1o8/JHcQb8IVOTQBx20UT8I5W4yw7YtrwcXsnHhm0iNvAKNiEoXVypOb4i3zzOk5B
         fcyzyq+q5ht/Yr4nwNUaXKGO9f2y/a72buYBbwLE2Y1fPeLEjdtrh9PfZjN6T82MUoFQ
         wlsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704709772; x=1705314572;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0INKQiw2jrwahwrMOC10qIoex00EN2Y17N016vNomw=;
        b=k4qB6hxT8oLB6QZgorGN9KDA/oilkKLvJQ7efsyg4bNAZj212u/+jBErhSj62WyA35
         XStCf9RYOVKUCR/SsDXKdlJ271AN9TSy6R4huYhzjCd1t3XyafhKe5Ol0NykSljppA2h
         OGtjOzF6vdyXltH+s7BUCECnAME9v1Fcx6P4hR/3oW0Yfgz1b5Z2LK0mQKCZYmiOd0Zq
         ehkzLFnCtBAKgANVc0o5GclvC+FyW/PmRqD2ekGZQ8j9a4Y50hUzHCqB288kFsiZPYwd
         9nAdYO9J0qGjW6NbT2y478tJ8/PK+ibwP5kA/Aw5/pYUNOyq0EpQKlbANtMe1753aenj
         70lg==
X-Gm-Message-State: AOJu0YyBDIU/pBcyqrdGyjTIM09iJ6F3hZmGHyGGVqKiWxT0T1OmPJYe
	g8L97V/f+8h1dj2dZ6wIv0g8RGcBjveE0Q==
X-Google-Smtp-Source: AGHT+IGZ5RCgxVpuPDDy9Yc9IgdivJoTADBX0bICoB3ZlcPnD70Nyp9tnjnsp7CWxfv8Dn3p9svcuA==
X-Received: by 2002:a50:8707:0:b0:557:1b48:b931 with SMTP id i7-20020a508707000000b005571b48b931mr1961869edb.32.1704709772514;
        Mon, 08 Jan 2024 02:29:32 -0800 (PST)
Received: from linaro.org ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id b5-20020a50ccc5000000b0055504002a5fsm4273174edj.72.2024.01.08.02.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 02:29:32 -0800 (PST)
Date: Mon, 8 Jan 2024 12:29:30 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] phy: qualcomm: eusb2-repeater: Rework init to
 drop redundant zero-out loop
Message-ID: <ZZvOih+gTTnxPkUr@linaro.org>
References: <20240105-phy-qcom-eusb2-repeater-fixes-v2-0-775d98e7df05@linaro.org>
 <20240105-phy-qcom-eusb2-repeater-fixes-v2-2-775d98e7df05@linaro.org>
 <158df3b2-a7fa-449d-9cc8-1e4cdf6ef49b@linaro.org>
 <CAA8EJpq88bhFFY2RcSEqaecoTw4a_ps6Osx5rJs3s0Mi7toXyQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpq88bhFFY2RcSEqaecoTw4a_ps6Osx5rJs3s0Mi7toXyQ@mail.gmail.com>

On 24-01-05 14:22:50, Dmitry Baryshkov wrote:
> On Fri, 5 Jan 2024 at 13:44, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> >
> > On 5.01.2024 11:16, Abel Vesa wrote:
> > > The device match config init table already has zero values, so rework
> > > the container struct to hold a copy of the init table that can be
> > > override be the DT specified values. By doing this, only the number of
> > > vregs remain in the device match config that will be later needed, so
> > > instead of holding the cfg after probe, store the number of vregs in the
> > > container struct.
> > >
> > > Fixes: 99a517a582fc ("phy: qualcomm: phy-qcom-eusb2-repeater: Zero out untouched tuning regs")
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> >
> > This looks good as-is, though I think my proposal of storing the
> > peripheral base reg instead is still better, as it'd require less
> > memory (no kmemdup as the regs wouldn't be modified).
> 
> I'd second this. We usually handle such cases via the base + offset
> rather than patching the data. If regfields can not handle this, then
> the regfield should be fixed.
> 

Sure. Will do that instead.

> -- 
> With best wishes
> Dmitry

