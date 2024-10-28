Return-Path: <linux-arm-msm+bounces-36159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D91DA9B2F42
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 12:50:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 090201C21544
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 11:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A4FE1D5CD3;
	Mon, 28 Oct 2024 11:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4d4eNni"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB991D0E38;
	Mon, 28 Oct 2024 11:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730116234; cv=none; b=jAfoFYP0hu2+4eBryA1gbXP5TYoF4ii9B1gW94HO67NA/ox8qcRcxa03hPHR82TfZoUIs1XsphsRS67fGbz4FynyNiCnQafVlcxRybif320FvaY7Iztbl7jTHIQFwG+Tlv6KFqnBoCrscw+zbotxfYDMptvK+O7NtnEkTv2Gs70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730116234; c=relaxed/simple;
	bh=OdFFZVF3fVIx2zPLQcseGCRgMv4yCI8LmUPankX4Yyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZfmQGknLeenbIzgerzr0uHikEyrw1aK1J0LPFNHq4sPI9d6QipIkKTo9/7ctlH1RliYKErCjHd8AXrV3NhGb4O7sLgLyNakddx8F87ZQtuVhsrC4Pi0btgVjcXbhKp/i0Z+xNdHuj0euGfuFdD5xr6IZxrP6uq5Ftjo/cHEov0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4d4eNni; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5cbb6166c06so3539331a12.0;
        Mon, 28 Oct 2024 04:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730116230; x=1730721030; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yn9bo4Aw0B66THnOwkNItVbZxEgKd3cfEA9mTbFHgr4=;
        b=W4d4eNnilfb0eeaauYf54hX8hOMw+cUi/gs1OziQhIB5Qltyxfeb2uI873ZmMx5nlR
         IobVylRc1mc5JHn82/Jbh7v9aZ8NXgorLJJzPsQwowKqvn9nxUwsabB/UnPuZjgpkEFy
         42K9eTlxcNCk9v4taO4Cn3A2orP5ybMCLnSpv3bZvfN5tr5glfm/w0fmJ2IJGB2FlN+S
         /yMpAuHOOHqwm3aKSN74wG8KCyO2d4u0g8+aeftSEvFYlk8AafNICCd7kIgkT1kxztkH
         uuYNW2Kr+9IWVaijXpW5qRh3oUzrDncNlsZqy9uzfEmfQiS8KH+yYMKtiOslv8rB6i6Y
         WXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730116230; x=1730721030;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yn9bo4Aw0B66THnOwkNItVbZxEgKd3cfEA9mTbFHgr4=;
        b=Wb65MPP+XG8A0ESmluqT90oEgpySU8em4X+uQ4QYTa8RLuKKy7ANT7GSmcxUEARbRD
         Igrta1i+ROl+5F/arMKWHVKaoV5FpFpU7raI0030p+d8kUdDT86e+wdo3OWnZ+kpzyUS
         /Aomm4p2Gdr1ReMkdb9A4lsAhkvDZdAp4ptptQfa5vzZbe6cR9de0b9olq7qb5JxKQ9G
         wf1L2ofqHvNdZiz9BNQ+UPthne1zOzR5gg9EZ6N0tUlbr2qASxcbV9ZwS5aA3m8O1jfP
         yjEK2+ImPRCSorZI++Qk68CYdJ1xpc14ECpv2EFByl23OCrwbnM4RhCCCZu562hocxzF
         hdmw==
X-Forwarded-Encrypted: i=1; AJvYcCWF/jD+PQRBLjzKIyYYttvk5oKsKXxNvc9bhbKMVGHOhPKTYPLm48SPIQfetxdgS7hCzlzFqGr4Y2yi@vger.kernel.org, AJvYcCWIxurqcIqE/ctjrt7kT9ySqS7qDnYyCdL5QwLkbOz0WkId6hhb5m+bNuKmcczn5dPQ4SfUNI+QBG7Lk2y1@vger.kernel.org, AJvYcCWR3nle7Q43AnOYu1cWlMeSulG9sXe2SGPAqkpmhRq+DIlabs/UQ9GBlAffbbzU9HVduymKv1Dk6q8HIVr2@vger.kernel.org
X-Gm-Message-State: AOJu0YzurnpTE9KEnnP4LTpyAe+THlFSHUkj83CGOj4ftVeJNut+LwZ8
	kLUTPfKQ5MPjdXXH2y45p4snmbduLyIML1/2WVynMMsf3OO/irq0
X-Google-Smtp-Source: AGHT+IH5GoQ6WQD2nuBahYvwFoMnPmUj5a7QafheoWcq+QmwwoxkYM1U3MoAmFE3WQ3wGZBnPrR48Q==
X-Received: by 2002:a17:907:7284:b0:a9a:6ab:c93b with SMTP id a640c23a62f3a-a9de62ec47fmr731696666b.62.1730116230223;
        Mon, 28 Oct 2024 04:50:30 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f298d8fsm368261766b.112.2024.10.28.04.50.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 04:50:29 -0700 (PDT)
Message-ID: <7c044f73-534b-452b-a4d1-6d459b9e32b8@gmail.com>
Date: Mon, 28 Oct 2024 12:50:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] clk: qcom: apss-ipq-pll: drop 'alpha_en_mask' from
 IPQ5018 PLL config
Content-Language: hu
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241021-alpha-mode-cleanup-v1-0-55df8ed73645@gmail.com>
 <20241021-alpha-mode-cleanup-v1-1-55df8ed73645@gmail.com>
 <yplfg55afv4vucpcxbkqsxmn44mzwr3tepbuvgtswhupx7fzfi@mwofp7v3uarm>
 <45461b57-cb5a-43a5-8b9c-09ae059805a9@gmail.com>
 <64vqb56a5gvpy5mut47n34nlqmbtfctvyljgylwuapgp53un5y@mj7k4awd3fay>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <64vqb56a5gvpy5mut47n34nlqmbtfctvyljgylwuapgp53un5y@mj7k4awd3fay>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2024. 10. 26. 20:55 keltezéssel, Dmitry Baryshkov írta:
> On Fri, Oct 25, 2024 at 10:05:04PM +0200, Gabor Juhos wrote:
>> 2024. 10. 25. 8:24 keltezéssel, Dmitry Baryshkov írta:
>>> On Mon, Oct 21, 2024 at 10:21:57PM +0200, Gabor Juhos wrote:
>>>> Since neither 'alpha' nor 'alpha_hi' is defined in the configuration,
>>>> those will be initialized with zero values  implicitly. By using zero
>>>> alpha values, the output rate of the PLL will be the same whether
>>>> alpha mode is enabled or not.
>>>>
>>>> Remove the superfluous initialization of the 'alpha_en_mask' member
>>>> to make it clear that enabling alpha mode is not required to get the
>>>> desired output rate.
>>>>
>>>> No functional changes, the initial rate of the PLL is the same both
>>>> before and after the patch.
>>>
>>> After going through DISPCC changes, I think the whole series is
>>> incorrect: these PLL can change the rate (e.g. to facilitate CPU
>>> frequency changes). Normally PLL ops do not check the alpha_en bit when
>>> changing the rate, so the driver might try to set the PLL to the rate
>>> which requires alpha value, while the alpha_en bit isn't set.
>>
>> Both clk_alpha_pll_stromer_set_rate() which is used for IPQ5018 (patch 1), and
>> clk_alpha_pll_stromer_plus_set_rate() used for IPQ5332 (patch 2) sets the
>> ALPHA_EN bit unconditionally.
>>
>> For the PLLs affected by the remaining patches, clk_alpha_pll_set_rate() is used
>> which also unconditionally sets the ALPHA_EN bit via __clk_alpha_pll_set_rate().
>>
>> I have created the patches after analysing the side effects of [1]. Due to the
>> bug described in that change, the clk_alpha_pll_configure() function in the
>> current kernel never sets the ALPHA_EN bit in the USER_CTL register. This means
>> that setting 'alpha_en_mask' in the configurations has no effect actually.
>>
>> So, if we assume that the affected PLLs are working correctly now, it is not
>> because the 'alpha_en_mask' is specifed in the configuration but due to the fact
>> that the set_rate op sets the ALPHA_EN bit.
>>
>> At least, I came to this after the analysis.
> 
> Ack. Please mention in the commit message that it's safe to drop the
> alpha_en bit, because it will get reset by the set_rate function.

Ok.


