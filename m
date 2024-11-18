Return-Path: <linux-arm-msm+bounces-38237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 413B59D121D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 14:39:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBCFD1F2282E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 13:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA01319E83C;
	Mon, 18 Nov 2024 13:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VTY9t9jT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE44F1E505
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2024 13:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731937156; cv=none; b=nftTqmMczCVivo9utR++MY0I+zNEYYsztGdbTzV3ImXZdh5ZFHzm22TU7W32eMmYLi/4+okR4t7UOQ9TP0MTfoL21r8omFgUZowJMST+kWxU57GkF/nRO4wN9VkJHvPvaW/+5DZxeZMJPnYfc1jtYz8GTPZUbk5AbdsDB+3U7po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731937156; c=relaxed/simple;
	bh=O+/I9qHbRpEyeLkPgEks20gDqSxELQADYxBEFYBKk6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mD252l1VntEJoA5BjwfnKpZUM8Xxq5wKFb//OU6zMsBkJnDGcpgTc7wUc3h4UUTzDp5wE84PN7uqi1ixlvWWlHx1Xkg8jLv2E9OKAd7IAsRD5IocAnsPnThU2rfMxmehBTRns+Gs4hQW11uNirsDbmJ7JLBL031GPqzYKyJIP7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VTY9t9jT; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ff3232ee75so42752831fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2024 05:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731937153; x=1732541953; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vo8qgK/zmm16hQsGKSDsWMd+1rjPC2LBS5AhoiRhMVU=;
        b=VTY9t9jTDEFM921i7t6ODafEfowW7lL58a1XIXt5JBpb8Ws9zbf54s5SCD8b+z7CEn
         izWCoDOqHW4cbmHmWGmVjR3GjMSkDexWCCODI4owBf6gfylr51LB7XlCc+3ktiqypK74
         Nw6XMkOqlEvipXZGJYCkWiOOIq09gzd6JzUKt5ds+Fcwtfh9+bhoRS0rxCTitzy+7UdP
         1GbCf9GjdE9CzCnzgUsuPrR6BoclTodU+l8d05SDL6KnnqyFMtKgdiu1HNGA3+PHJA2V
         /w2c3iKQWbizaB4Nv97mgB88XmEC4TeoT7Uq1a+1bx61OoOXLwLPXLz+0IdFHQwcRvjB
         Ktng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731937153; x=1732541953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vo8qgK/zmm16hQsGKSDsWMd+1rjPC2LBS5AhoiRhMVU=;
        b=t2IydZoneX2tI6Syc1djnArMQONWsNgbiSF9jGxI0lTZyPT35x3ULnhst1ODePOi/i
         CxBkInfSNKfGt3R7nDjcNCysJ9/1HJWFWpTI0gDu/Hw/IL4EWxqBigD/YDavOYGKbEDL
         DfzAsZtEuYWZjrBqEdLp9mPt53mVgJCAOuNToLuJ5/Qn+AKeYsxScBbjUBTKxaHa9kmf
         X5iXdUGY0MbaPxxvUm+4aYjSKSnusrx2c6XR6738o8I47yB8/zLWYXtordHVTbAtQfiw
         KRP7w9XShQr7hHsTZatlk4d9DqCiVeqW/ct0Dvkh/JiqR2IX9/DpxF1AJ2WgaWs5BN0l
         e6Nw==
X-Forwarded-Encrypted: i=1; AJvYcCW/3rKZNDUaSKQOLwcZ/3RscgqvIjPqKRB6AKT4tgSa8SI7E8NBNIiSSC72jx9qPMPtp4/wDHXFKWeLgcIn@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3WcSSxZPXv57/nrJ4puSZ5S7zKO+w5uTsy3tuhJ7pJwIzjV6F
	JVgaP6AdtlmkFlWzdEUi+X1nJb4d+pwcHI0jOyooj9ym2fq1jV3026cqhujM0E4=
X-Google-Smtp-Source: AGHT+IE9fOapCm7K6Pg/umhgP6p9aceiGkaGBaQq40IEeWEJt8CsTs1Go6vdmUC+YTfkqwr39h1xgA==
X-Received: by 2002:a05:651c:158f:b0:2ff:5988:ddcf with SMTP id 38308e7fff4ca-2ff6080823bmr48735431fa.0.1731937151490;
        Mon, 18 Nov 2024 05:39:11 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff69b3bd8fsm8953911fa.124.2024.11.18.05.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 05:39:10 -0800 (PST)
Date: Mon, 18 Nov 2024 15:39:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: gdsc: Add pm_runtime hooks
Message-ID: <5lg7rsndxrcogrwywlciek4fdfejnpmvuibpwhh33whg2ebtlt@jli5g3qliota>
References: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
 <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-2-b7a2bd82ba37@linaro.org>
 <atg6yw64f4aojcbjyarljb57cejqk56g2qnddrloa3smmupm6d@fk3oyiycnuco>
 <45c0950a-0cde-4bb9-9e3d-7f25b8a3da31@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45c0950a-0cde-4bb9-9e3d-7f25b8a3da31@linaro.org>

On Mon, Nov 18, 2024 at 01:19:49PM +0000, Bryan O'Donoghue wrote:
> On 18/11/2024 13:10, Dmitry Baryshkov wrote:
> > > Introduce pm_runtime_get() and pm_runtime_put_sync() on the
> > > gdsc_toggle_logic().
> > > 
> > > This allows for the switching of the GDSC on/off to propagate to the parent
> > > clock controller and consequently for any list of power-domains powering
> > > that controller to be switched on/off.
> > What is the end result of this patch? Does it bring up a single PM
> > domain or all of them? Or should it be a part of the driver's PM
> > callbacks? If the CC has multiple parent PM domains, shouldn't we also
> > use some of them as GDSC's parents?
> 
> It brings up every PM domain in the list
> 
> clock_cc {
>     power-domains = <somedomain0>, <another-domain>;
> };
> 
> No different to what the core code does for a single domain - except we can
> actually turn the PDs off with the pm_runtime_put().

I see. I missed the device link part of the dev_pm_domain_attach_list().

Just to check, have you checked that this provides no splats in
lockdep-enabled kernels? 
-- 
With best wishes
Dmitry

