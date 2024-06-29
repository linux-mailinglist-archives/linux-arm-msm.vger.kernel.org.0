Return-Path: <linux-arm-msm+bounces-24719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BE891CCDD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 15:01:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 410DE1F220EC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 13:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96F724D8AF;
	Sat, 29 Jun 2024 13:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hBd3vjSe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E391B1E493
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jun 2024 13:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719666072; cv=none; b=oF1SeCFr/XN0t886a0ubHarJcuLOz6wnjSVL4hcOl97MvI0SYwogCWNbLIiVt+HmrntT7p4S4t3NmSpozpF1F9D9Rf+UVh8QfCAOkM4lAgBxGlZ2zpU98IChUAJPdvmyqjQ0Jx9GKy74OxqEyDoyrqCQHVjUfDROX1Nu51oEr5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719666072; c=relaxed/simple;
	bh=+pAxkY9w/DH5seD/QP+PHFtRjh1MwqdB78uSpdSMtss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UnIcSZ2lfgkAJrImUPonh9c5AUqwE9e0FXXWuRIBGVa5hA8wW4uIfPG8OFHEAFY+sk5qQJCqKSOgRoHg7x7ekztDVhTMc+bbXg36GAeVkLSrREFeyoInyk21wjbb83eCpihHrdNLBrWtArqVnTEIaD7x4ykl8Cfk+guCxfFBN88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hBd3vjSe; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-57ccd1111aeso1855072a12.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jun 2024 06:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719666069; x=1720270869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q15KtodgRcDJhbsUX44QuIqWrNjJ334aYzslN5VzRCE=;
        b=hBd3vjSe4Cm1qW1KhfNmNdEsdb5CE4oDy7MPIPeILod1I1uo+TCZB0gDhJQ8Qwv7c5
         5MQ+g0/KwaiHudMxyVFUs0TzHS9XNHz+TuBCVWvWG7yb9sBMPmpWQlqNaXpWpOC9jS3h
         1ecYCq7T3mnB/gjuKV8YZuZBJjEe4mw5NXhF2skHIIWtpj/vs/MP3me5EtQgcgeZQmHz
         lH1P6uOcXqurtYFx+UQhizIirMHBZdRFd0qGisAC40q4QdrMFEeGEfPYaL0OHiNfY0r5
         ut1ES/GQtYolgW1gglrKWWrw2FCHTTr70nEDEktfQKpde7/1FBN+14UsuIzwZbgO1eVn
         MZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719666069; x=1720270869;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q15KtodgRcDJhbsUX44QuIqWrNjJ334aYzslN5VzRCE=;
        b=kah479/43X7CMjQqa0qF0LySUzFu3BrKNLVNspUwNASNzSQ14Ru14q+xuOqXxToE52
         OoU6GbpFoqi0ubitRHZKcYKey+V6YmircG2WoDlQjl2mCJ+2O49775y2FCFnYheFVtwj
         e9nMasK1r3aBS+lTKy/F0KmDhH2z9PtGkLXZzkuJeGvMxOh8eFB5qN2zppqnwnpcpBoN
         rcbULE9FIU1+7PBBcKsv7QuKKAtILwOzob448Uy8udKcQ37tfWLGVhU58JSrOXXKpBa2
         jalxtkty8010CtLEBauamW8LtDOVebykupLMwTfXS7b0gFzzr5zvt3GgWFgRFbDUoRUw
         q22w==
X-Gm-Message-State: AOJu0Yz0H0WtPlR7Lp4nYrKfI9EweV6sJ6IKUqm9wknvYEbAn37oRQCu
	YX0WfPBnh4ArwEZ/DHFKedTwAO7aGhc/ePaaYhMc3JAQ/7/xVsU7p7GkAAWk+NU=
X-Google-Smtp-Source: AGHT+IHDVXarznEkoh5Wzl0xqsIUTBQQhm3uVKbdV0WxGQmZT/NrSzv05ebdKsn1hFFoynLLEURrqg==
X-Received: by 2002:a05:6402:5216:b0:57d:4ca4:61ba with SMTP id 4fb4d7f45d1cf-5879f4a570bmr769495a12.10.1719666069195;
        Sat, 29 Jun 2024 06:01:09 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5861324dcb3sm2209179a12.26.2024.06.29.06.01.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 06:01:08 -0700 (PDT)
Message-ID: <ebac5b55-00d6-40c8-86c0-3e7a3affd5b9@linaro.org>
Date: Sat, 29 Jun 2024 15:01:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: smsm: Add missing mailbox dependency to
 Kconfig
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20240628-smsm-kconfig-v1-1-117d5af4ba1f@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240628-smsm-kconfig-v1-1-117d5af4ba1f@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.06.2024 7:30 PM, Luca Weiss wrote:
> Since the smsm driver got the ability to interact with the mailbox using
> the mailbox subsystem and not just syscon, we need to add the dependency
> to kconfig as well to avoid compile errors.
> 
> Fixes: 75287992f58a ("soc: qcom: smsm: Support using mailbox interface")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202406180006.Z397C67h-lkp@intel.com/
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

