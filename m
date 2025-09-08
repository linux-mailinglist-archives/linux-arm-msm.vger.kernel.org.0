Return-Path: <linux-arm-msm+bounces-72547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3238B4899F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 12:09:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69D3E164A40
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 10:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3940C2F6162;
	Mon,  8 Sep 2025 10:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ofx8qPL1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D4F2E3B19
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 10:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757326187; cv=none; b=FZN4Gi4JqJz/VfeIzkWtHW9HquhmQ/pAoQUzJJ0W62NFamXXpDSvYB1wujaLYbTNUFg3GkUV+rfJdDTqQ3FZsKIjO+vNJeozVze/W1UvTmnullyfr2J1WppAw0DZ7RcTSEgufmmE/iOU20JTvtNJ60wOFCM5yGxQcetaPh9x1bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757326187; c=relaxed/simple;
	bh=fB0j1knneymsQb6zW3oZLg20Ti2gTC3sDQkEwCRnNb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHDFsxuFB1fisyXEAzXCD629gOeR5bSTLgoXVGoPF/0EACqZQw/sbZcaQNw4ABN0ZcHvKEK1uYwDRAhqdwICUWFt29z7vKwphgg0oxJUycjUXPvOiwKke1KDLA0dl5SOyEEwQkpCs5wlSXzJmy0OdDrg3ZuTvickzJewyLsagOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ofx8qPL1; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6228de281baso3653738a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 03:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757326184; x=1757930984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HmnKeVv8YY/fXGQA22sRQfhv2+yYeWQAe73fa2iIOM0=;
        b=ofx8qPL1OqEDNEXZbdmvX/BAEfCQYAafCrNhcCjU/DbxHtOmkTRRWImAn2Rpr/ccOx
         A56VpwSWiucH1+xMdV0Nj0fwexK5LQ84j9FFNVgoPV/yYru5Td7b+gV7h6xcWiQ4oajX
         8DjoFVkeNOBr8eH5lWhFeyopgI/Gv9TkR1hXicuYdHNgxwUh5pWZ79wcOCfnKqBjgh7I
         X5DvNJfEXJoZ+jTlIrIhxgbxPVId0dhmEbFfFaGw+UMVrdiNGHxZLoRTWLe/1NTp7wrn
         9pjv+HR06bgx8QFzYZIx/PuEjxo4ZZdto/++av7MiHUXykthmQZcE6VycnlGD2V84gj8
         7kiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757326184; x=1757930984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmnKeVv8YY/fXGQA22sRQfhv2+yYeWQAe73fa2iIOM0=;
        b=nohjbvI3IcR3FowugwZb/HhzkxdWJUsKkrIKA7XYby9jj5dYo+ubUV9wF7FFblMQKw
         OF/RgSg48f9UdrvNs5JjwGZZR7CkteND4fj8OONgYSiiZhqjHUfodtXE3fTdekqJp70j
         ekCVM49CfHGtDywL4IIO0UuZzSMZzGyn4uy09wm3TeXnOalSr3ITI9x3U2lRzRBMum/d
         U9O5Pg9cU+Bubrg8amYyFRakSNU1nUEJwKdSQDMwZKP/F2XWUdbdmUTBij1kyfG5xDo0
         uHNq4HyJ7nXIB94fIFszruRH71U8wp5jIj5jEOOYLg2kU6+75MXBtUN0vbilcgGlIuXf
         GZQA==
X-Forwarded-Encrypted: i=1; AJvYcCVRQDQ9E0LxiKGegD/4HHiS1Z2VI+1k/zpB22A3NzQ4zwYQ5/bAmhblNAM1SzFyhcdXQEpzzB3erdthUAMP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw92uggM/A8qGMbVoXBUawxSXb1rFcfXm/VNrRO/XRMhmqCAaOJ
	KuRTZv2iBAOfrmqUaqd5Z2pgEM57UuVovCFQcB++LPPYp6xvoWJ+srEQE31yB2a06WI=
X-Gm-Gg: ASbGnctYCicDolXl85xTvDI4JMn0nojYZHFXgKXmWFA+MHbO267HzfMLqvAT19mvzMM
	8tBbubMfFopdnunsNlnvgm096It/CvvBtmiR0V7bHZlKTHSu6HfKDMavFJbmfNX8sYrP8PB1AE8
	UQmkwWpkgA61rJLs5N8FtQrjtYl42U5xdU1yhGuJlPaPUZeSnypWFOK9iBjhMFKNEEEptzAjv11
	LEilD9xJhL0m/TmJyA6020TxXjCem9pQ2C8sGdmNRYwSA2Bg5qzWojyI11m3kzDp3I5pifUE3nR
	VvE1perIz6XXoapI81sO3NkeBZyU8MbcWUkCyx5kTJXK8iLpSdUHz0zngF11pq4tf0JCDNlsgGR
	eXHdu/EbxwzalEEOt34tJJyc4wEDictTY
X-Google-Smtp-Source: AGHT+IHT9tblAzVu5lhgCq0ztZJTqFIki97fYAjqSfcc3xjXv/tUZI241Ra1XOnBVaFhW1VRKrKEng==
X-Received: by 2002:a05:6402:3550:b0:62a:c9b9:cddd with SMTP id 4fb4d7f45d1cf-62ac9b9d0e2mr609155a12.38.1757326183688;
        Mon, 08 Sep 2025 03:09:43 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:30:1f60:42e1:1e1b:d240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-625ef80347asm4229469a12.1.2025.09.08.03.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:09:43 -0700 (PDT)
Date: Mon, 8 Sep 2025 12:09:38 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 4/5] i2c: qcom-cci: Add OPP table support and enforce
 FAST_PLUS requirements
Message-ID: <aL6rYq5gmX8CdeE-@linaro.org>
References: <20250904-topic-cci_updates-v1-0-d38559692703@oss.qualcomm.com>
 <20250904-topic-cci_updates-v1-4-d38559692703@oss.qualcomm.com>
 <aL6Vp-3er71AJPJd@linaro.org>
 <f508bf92-a513-467a-a946-17c41e1d72d1@oss.qualcomm.com>
 <aL6X-RiCyPVbHlYN@linaro.org>
 <5178a6b1-1b5a-40d9-af40-68ee13975509@oss.qualcomm.com>
 <aL6nZdJCKmnWcswB@linaro.org>
 <1899862b-530b-4a75-93fa-c70c90d98016@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1899862b-530b-4a75-93fa-c70c90d98016@oss.qualcomm.com>

On Mon, Sep 08, 2025 at 12:00:13PM +0200, Konrad Dybcio wrote:
> On 9/8/25 11:57 AM, Stephan Gerhold wrote:
> > On Mon, Sep 08, 2025 at 11:49:52AM +0200, Konrad Dybcio wrote:
> >> On 9/8/25 10:46 AM, Stephan Gerhold wrote:
> >>> On Mon, Sep 08, 2025 at 10:43:50AM +0200, Konrad Dybcio wrote:
> >>>> On 9/8/25 10:36 AM, Stephan Gerhold wrote:
> >>>>> On Thu, Sep 04, 2025 at 04:31:23PM +0200, Konrad Dybcio wrote:
> >>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>>
> >>>>>> The CCI clock has voltage requirements, which need to be described
> >>>>>> through an OPP table.
> >>>>>>
> >>>>>> The 1 MHz FAST_PLUS mode requires the CCI core clock runs at 37,5 MHz
> >>>>>> (which is a value common across all SoCs), since it's not possible to
> >>>>>> reach the required timings with the default 19.2 MHz rate.
> >>>>>>
> >>>>>> Address both issues by introducing an OPP table and using it to vote
> >>>>>> for the faster rate.
> >>>>>>
> >>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>
> >>>>> Using an OPP table for a single static rate that remains the same over
> >>>>> the whole lifetime of the driver feels like overkill to me. Couldn't you
> >>>>> just put the "required-opps" directly into the device node so that it is
> >>>>> automatically applied when the device goes in/out of runtime suspend?
> >>>>>
> >>>>> And since you need to make DT additions anyway, couldn't you just use
> >>>>> "assigned-clock-rates" to avoid the need for a driver patch entirely? We
> >>>>> use that for e.g. USB clocks as well.
> >>>>
> >>>> This is futureproofing, in case someone invents FastMode++ with a higher
> >>>> dvfs requirement or for when the driver adds presets for a 19.2 MHz CCI
> >>>> clock which would (marginally) decrease power consumption
> >>>>
> >>>
> >>> If 19.2 MHz CCI clock is feasible and has lower voltage requirements,
> >>> then I would expect a separate entry for 19.2 MHz in the OPP table of
> >>> PATCH 5/5? The DT is unrelated to what functionality you implement in
> >>> the driver, and that would make the OPP table look less useless. :-)
> >>
> >> The frequency plan for 8280 does not recommend any rate != 37.5 MHz
> >>
> >> For x1e80100 however, the lovsvs_d1 corner is recommended to be 30
> >> (yes, thirty) MHz, sourced from CAM_PLL8 for $reasons
> >>
> > 
> > The 37.5 MHz rate still exists on X1E I presume, or are you saying we
> > need more changes to support those odd 30 MHz?
> 
> Yes, any corner over lowsvs_d1 is 37.5, sourced from cam_pll0
> 
> > Personally, I'm not fully convinced there is ever going to be a use case
> > of someone using a "non-standard" frequency. Even if "FastMode++" is
> > invented most devices will probably want to use it.
> 
> Not really, there's no reason to make your i2c bus go fastfastfast if
> the devices on the other end can't cope with it
> 
> > And the voltage
> > requirements we're currently talking about here like "low svs" during
> > camera use cases are kind of negligible compared to others too.
> 
> Again, this is an I2C controller that seems to be associated with
> cameras.. No image data has to actually be processed for the
> communications to take place and you can attach any odd device
> 

My point is: In the unlikely case that support for faster I2C speeds is
added in newer SoCs, I think you'd just get a new "standard" base clock
frequency, add a new cci_data struct with adjusted timings and everyone
will use that (even for the lower I2C speeds). I doubt anyone will
bother adjusting and validating this for just one "corner"/voltage level
less. There are much more effective targets for power optimization than
the few bytes of I2C communication. :-)

Thanks,
Stephan

