Return-Path: <linux-arm-msm+bounces-17832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7AE8A989B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 13:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03B861F233E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 11:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E933D15E7F5;
	Thu, 18 Apr 2024 11:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oSs2A/pj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB86715E5DB
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 11:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713440005; cv=none; b=Tt3Ckk5r9K5MMiBQ1QHt3c/j5PgAkDwa7vOThvE7OfSev/jJdwrBntWGVt1xsd2AQXS4S1Bh6RAROdD2dtuXKvIAF9kqwrKOW6CzeIRiGhFgzF/Izt/53DZbacep4dfbrDDwlrcOSo3A5EaT+ed6MQzSjDtsRO1CTBb6UnWAsQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713440005; c=relaxed/simple;
	bh=/rHfCjIVYXQVsvXGB8IxXfG+StoG4NwDe0rmylo5Qjg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VP3Fvl07bDC4zaeqMsPvlI5VUwxNRqJa146sBF3jKudXIQBM2cw3SRaDt3TMMdRmxQElKnGR0rK7FhYnEWB0YuLD2K7Nrn9IdnqVucy8axCNAGAp7QAueLiK+gWkxg2m/wFpYTc8SIr1R8D6vyisLTicOwq3drUEh4jVS9PeYqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oSs2A/pj; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-56e136cbcecso1071012a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 04:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713440002; x=1714044802; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b9lgOdCdIOmICWwhRzdOoCn2EAweW38pbbCbx3C0dQk=;
        b=oSs2A/pjkYgDkyeDPExMdwe0B1bAdjO+o5gb5wZ/3JTWCDp/CJJNW+LKWtQaNXlzGg
         IzCBih18iifxmMAigngQJnAmSmS8J7wjR2/0IF3BvunGkvQTuMWJtZ6HOS+qq+Y+39y2
         4FHkj3wiM2UJWUP9J1wHSmtoJZw9c36WV+7HlQmaYANz6cPdQRCKbBmJC/8ELEGy1SMB
         EC3gF6e0J6ZtDnnLysjdU0UstqDbirjNpuqtsgBca4BazdjRYEdfGIEO6TIXiTJ4xACC
         cFrGWiH5uK/V213GNMj9xbp2Qq9Py8FM2xd3UQoYPGhxWKD0DqecAgO8HrZXv5rkbd+u
         diXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713440002; x=1714044802;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9lgOdCdIOmICWwhRzdOoCn2EAweW38pbbCbx3C0dQk=;
        b=tlptmJbBG6TKVh+vHRh0FwHCAbz5+a9AN8S6gZGWfKXEO/hMNEymyMg2Gvevd05S8v
         jQXYXqIfxbgJFkt2N3nHe+G82FDOz9aCCk0K0PQ3oRhfGhDhb+gsGXNvPggjFJDDcERZ
         TtrRtJY2jy+wMSuuiD7EhMVxONhSglINEhAai9f2ZQYhdnxOkxwDZ/WMqdmLY6wmy46J
         x+BjKnFcAhgvMOq7vgRv38IvoKHtMgzmX6yl02Imp2R/SWPrft9FAh2iPtGI6nR7IIgH
         rGYKtVS8N+mi6uZKEC8Cs1MskfZsKkjnd3XOw/IsqoBfM/QBGIU+fFA9WAYyDi9vvG5t
         d0Bw==
X-Gm-Message-State: AOJu0YwlN9apnhX7qX5MiDnJhTbT+wzivz5dkXElky4/r5Z91PU1IKHz
	eKf5ACOobUmXb0Dwe7gfHqHpBvstkm/u/6VohpsJpysmIoJEew3EJH3yhnD1Ad0=
X-Google-Smtp-Source: AGHT+IHKiVh6Nj87GB2UGWDfWcSeS1Qxmuucy3GshEAHNragzY3My+7Qk0/Is0MtMJzE3QOxcEZd4Q==
X-Received: by 2002:a50:cd04:0:b0:56d:f7ce:e879 with SMTP id z4-20020a50cd04000000b0056df7cee879mr1750351edi.37.1713440002011;
        Thu, 18 Apr 2024 04:33:22 -0700 (PDT)
Received: from [192.168.45.55] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id eh11-20020a0564020f8b00b00571be394478sm501245edb.69.2024.04.18.04.33.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 04:33:21 -0700 (PDT)
Message-ID: <e5c60b6f-3cab-4265-87fc-7eeab03795ec@linaro.org>
Date: Thu, 18 Apr 2024 13:33:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: dispcc-x1e80100: Drop the reconfiguring of
 PLL0 on probe
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240418-x1e80100-dispcc-drop-pll0-reconfigure-v1-1-453e4e70e940@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240418-x1e80100-dispcc-drop-pll0-reconfigure-v1-1-453e4e70e940@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.04.2024 12:51 PM, Abel Vesa wrote:
> Currently, PLL0 is configured by the bootloader is the parent of the
> mdp_clk_src. Reconfiguring it on probe leaves the PLL0 in "stand-by"
> state (unlocked), which will trigger RCG child clocks to not update
> their config,

Sounds like this is the problem that should be fixed instead.

 which then breaks eDP on all x1e80100 boards. So rely
> on the bootloader for now. Drop the config values as well. Also add
> a comment to explain why the PLL0 is not configured alongside PLL1.
> 
> Fixes: ee3f0739035f ("clk: qcom: Add dispcc clock driver for x1e80100")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

This works, because you have (at least) partially configured hardware, but
we shouldn't assume this to be the case.

Konrad

