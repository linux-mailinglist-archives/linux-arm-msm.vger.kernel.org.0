Return-Path: <linux-arm-msm+bounces-79989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C232C27D07
	for <lists+linux-arm-msm@lfdr.de>; Sat, 01 Nov 2025 12:50:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45D4A189B755
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Nov 2025 11:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D122F39C3;
	Sat,  1 Nov 2025 11:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jwLj3MaS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8892868AD
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Nov 2025 11:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761997817; cv=none; b=YE5Nw14V+uWNoPtKND6LEoXs1cOunIHHGl0KOEO09MPKEl42D53avdJ64UoyH3MEImIqMNqmkDDdxRJXu1/YHbIosHRLxFXt2hGFFLuXvddTHmSFoHb7XUJIoi6S8O8dyF2gVT4SgrZjMIz0xI7Se6qnnTHDzNcWPRaE09wW74Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761997817; c=relaxed/simple;
	bh=HaqqRDPrZWoyjq8JRavr3wToxJeyCzQAvF+S4eMFlcE=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P+VJ3AFChAJ4ZRGUcjGHdD5VcS5Y2OvmFl48wfxYrSyyu6AW8IMm5d6pnNIOnGU1b/s4RP5fwUgNQyhMnq6QHD42IwQ6zfesDEHvFpj40M1mmzabLy4Z81ZW29PfkonBG/0dXU/myTxbndemnuJ352DwERAezUPsyIkbLTzuHfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jwLj3MaS; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-429b72691b4so2814370f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Nov 2025 04:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761997814; x=1762602614; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sZ1LVmNuWNRShkFgZkqHZfQpdnjfb66+76NdCRKKg0Y=;
        b=jwLj3MaSe/N73KvxVxRodKnwYBgcC4UwTUhEZTtatCwzGKIbt9GzBn/wuUsKoU2dpG
         NhUfFyMUIRTEdX9SKWE5qeGIzfmQzmeqrb5mjlkc3uBoAidT1+nCsJ/mIOwSbKGYYMZU
         OHb5TU6lUrp7ljRx5lJBu9c+oaxYbFIzdyI1OAGFKOe6crzCL89HKMBlnSnly6zO02Wa
         Qa7fDI4s6JXqmfwLhTcq5RPLHPwNW2iq9YyBpAYF7v9sT/YjSymxrS16rT2X6HdQ25zh
         FmQ5OR3cSlMGPGLJkdYooNAu8a5xFRPTxModYyL6++tGA3EAjrWZa4lQTww5dABOQ8yX
         B8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761997814; x=1762602614;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZ1LVmNuWNRShkFgZkqHZfQpdnjfb66+76NdCRKKg0Y=;
        b=l85c3hKnojD6tFgKlXl7bfXjpauDSpkJBa1FWO/jcs82hEl7y96kj+FEE2Gdi9mGTL
         wqRjY2m2LHfKY5ikKwjMHrC9MyxVW8XgmMgsTIiShmUWIB9RCAbyhFbYnSUTVD8ybB5c
         kvgCYCQ+1D6N1diCa9zQjQ2fm4I8LNTMctGd9G5YNmwOJWfdHq/ZDI2zWoiCTJApRVPu
         bV2/cHXDCrFkWOyBUR42SZqpg8cwfNZXF2ZRdDJkCQmipbd8Jjp50vXY0HL9Io+cPL2U
         VqgqUh5cCBKJ4cH8rnZHxrk95Dc3hjNLLpzSpIhU2z5lkIkkl8OdRquw/J4rrB5ZyGQB
         v2mA==
X-Forwarded-Encrypted: i=1; AJvYcCWJIBApKrTiAsXRaF4IQjFUxMNUpL8ARvgEkXwwDipLQXW/IMxPsjszo/CiV5CY72pn0GuPept6RMEbAKQh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+ZK2agYtVUx69Na2oW9+Cscvq3fqhqEu7lco7aocYQ5/aHp0q
	iW7AiFn6VNkQByOGnjkxpWRpWL+3Zq3gFTMMX5wfCqic7Hltd+jdkacs
X-Gm-Gg: ASbGncukRtr0yFYnmuw3/lUywVf2BR7Eqf3dcfUnM0OXM00jbhRzZB5TE5XNzKklkgu
	Er+2vaxnw1seWt6Nr3iW/KZOtTZO3AK3oDtwzfCKuokw6a5K0ATBPi5wLO7HPDToayWgZdDkyQ7
	kfc5WWCxAXwN5O/SLnog5VomUxe//qd/u7cTp7nJ0sNbRAa3emSp7gevAQw239UxYODN2cHUsms
	smiqUKHLL/KDFEVY/69AZU60sbpOyfO/ZC8Eg5G9jdYNroX4cOkNDMAqu0CI5408QAgvaT8/+85
	s51V4ZajHBE1aHLWMY0hyUGXJZ3TSc1CqMBaaX90rqFF2UOlaMmWu6EAhSvCcW/wO1fsSmt/rm6
	PslNhfo5PinmejeE1QkZ/42b8hmJ/MwUw1RVWQ+qTiTTn82Ke4O/dMeUXrpFu77bLpwq/jFD9p/
	9jgua3cTVbI1A=
X-Google-Smtp-Source: AGHT+IF5Vi/R2DP1IElourozRko5CrLa0/NoKSzqRc9YHLEWiuOxxp/36gk0/Flt/0Dln2p1OLfZhQ==
X-Received: by 2002:a05:6000:400d:b0:3f7:b7ac:f3d2 with SMTP id ffacd0b85a97d-429bd6be4e8mr5734048f8f.43.1761997813915;
        Sat, 01 Nov 2025 04:50:13 -0700 (PDT)
Received: from Ansuel-XPS. ([109.52.237.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c13e1c9esm8842790f8f.22.2025.11.01.04.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 04:50:13 -0700 (PDT)
Message-ID: <6905f3f5.5d0a0220.27a792.7a13@mx.google.com>
X-Google-Original-Message-ID: <aQXz8Wz10HnVaiMm@Ansuel-XPS.>
Date: Sat, 1 Nov 2025 12:50:09 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Ilia Lin <ilia.lin@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Raag Jadav <raag.jadav@intel.com>,
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] cpufreq: qcom-nvmem: add compatible fallback for
 ipq806x for no SMEM
References: <20251031130835.7953-1-ansuelsmth@gmail.com>
 <20251031130835.7953-4-ansuelsmth@gmail.com>
 <aQS5FpuOWk1bWnQd@smile.fi.intel.com>
 <6904c563.050a0220.a13ee.0212@mx.google.com>
 <aQTI7o1HQYbQ_Pl2@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQTI7o1HQYbQ_Pl2@smile.fi.intel.com>

On Fri, Oct 31, 2025 at 04:34:22PM +0200, Andy Shevchenko wrote:
> On Fri, Oct 31, 2025 at 03:19:12PM +0100, Christian Marangi wrote:
> > On Fri, Oct 31, 2025 at 03:26:46PM +0200, Andy Shevchenko wrote:
> > > On Fri, Oct 31, 2025 at 02:08:34PM +0100, Christian Marangi wrote:
> 
> ...
> 
> > > > +		if (of_machine_is_compatible("qcom,ipq8062"))
> > > > +			msm_id = QCOM_ID_IPQ8062;
> > > > +		else if (of_machine_is_compatible("qcom,ipq8065") ||
> > > > +			 of_machine_is_compatible("qcom,ipq8069"))
> > > > +			msm_id = QCOM_ID_IPQ8065;
> > > > +		else if (of_machine_is_compatible("qcom,ipq8064") ||
> > > > +			 of_machine_is_compatible("qcom,ipq8066") ||
> > > > +			 of_machine_is_compatible("qcom,ipq8068"))
> > > > +			msm_id = QCOM_ID_IPQ8064;
> > > 
> > > A nit-pick (in case you need a new version of the series): I would expect
> > > the conditionals be sorted by assigned value.
> > > 
> > > 		if (of_machine_is_compatible("qcom,ipq8062"))
> > > 			msm_id = QCOM_ID_IPQ8062;
> > > 		else if (of_machine_is_compatible("qcom,ipq8064") ||
> > > 			 of_machine_is_compatible("qcom,ipq8066") ||
> > > 			 of_machine_is_compatible("qcom,ipq8068"))
> > > 			msm_id = QCOM_ID_IPQ8064;
> > > 		else if (of_machine_is_compatible("qcom,ipq8065") ||
> > > 			 of_machine_is_compatible("qcom,ipq8069"))
> > > 			msm_id = QCOM_ID_IPQ8065;
> > >
> > 
> > Hi as said in the commit, parsing 65/69 before 64 is needed as we might
> > have compatible like
> > 
> > "qcom,ipq8065","qcom,ipq8064" so we might incorrectly parse msm_id
> > ipq8064.
> 
> Oh, this is unfortunate. Wouldn't it be possible to use some API that returns
> an index (or an error if not found) of the compatible? I believe we have a such
> for the regular 'compatible' properties.
> 

Well also using something like checking for the virst compatible might
be problematic as real device have something like "netgear,r7800",
"qcom,ipq8065","qcom,ipq8064".

I will check if I can implement some alternative logic to have
consistent order.

-- 
	Ansuel

