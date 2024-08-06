Return-Path: <linux-arm-msm+bounces-28043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EF3949C38
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 01:15:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 515F71C21DEA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 23:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72162171658;
	Tue,  6 Aug 2024 23:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U3+yQ0sk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931CB175D36
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Aug 2024 23:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722986110; cv=none; b=Gg1w2O+9C6ykmgC2RQsYCZmVKJUXq+3U0cyLO3b1kZHJ1foE4xe7kT3EQfijO+X0QPTzRJ5HZARJro2rvWAWr8J4I9eo9a4ZwoTfkQ9mlXrF4JXwMdMePLmD4Df9chGY7Qf34rvQrYKBpTFDX60aLLbIRM79NLtIe/2cOUe8O+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722986110; c=relaxed/simple;
	bh=c4ElZR5cSHHVZs5b/QivuGERpZLhZ+fGwrKF1y0Cdh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kcLtbgcRUrAp9cnJOfu8IUU6dOGEGf4hnQezs7G/M8P1cDbmW4SXFQ8fO0G033v3e9+4uehOQ6tdeoI+kXNxZojoWfxChnQA1PzVt0q7G5lqdxGHLJHrCimM/dTA26mOGUGxz283nw7AbOirl8JaJIt/tfxb8e7k75Ah5GAEJGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U3+yQ0sk; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42816ca782dso8762075e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Aug 2024 16:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722986107; x=1723590907; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ptZEeRi9iXLknZOgkEzs0wHNgINZe8m5SEa6Tl0nwe8=;
        b=U3+yQ0skgiF+Ld5fLmwoKzwxv0FS8zRNfNwuvu746uY4XVy44mPsiQYCtHFB0B/tBf
         Md+zljfhI7JnkNZ6mnIWQiCeTObMPr+7Iez7Wc4oBoozmrc38uAzRsNe+2yfyAJ1WfAK
         bttSrXwgKpeF2UUDDZ47b3m3bBApU7ps68NxPzyTgwpZRdx6PZGy43EckyVBCqG8pCjZ
         BaP4qYaF5EQ/gPDkw6ZQOfy5DY0/UA8/xLIqXtkqKowzYq6EiZmcM9DfFY/2U3UJgGe6
         ZwiztvFFzIK2ltfe4utFMCuUhjsWUCFrLKksJftOHTpK0o0Yplcvu1UzAr00CJrj0h96
         ZkXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722986107; x=1723590907;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ptZEeRi9iXLknZOgkEzs0wHNgINZe8m5SEa6Tl0nwe8=;
        b=Az6mr5we295RQ84dj6RBETpPy4kMuWw8Zq6kcMq/6scBJBSSb8poEX3yTSHVnxCsXq
         0RTQ465VMPVAZZgnMoKEDs9Xm+6ULJCXz7NJYSB1waYAOkuZHFPrKHVhRTtwU/usxacb
         xi6rLqyDKINOGNSS2+LcNdADmx0MdLTaFwBHQSNdBs7GQUzMLpPKRYoqqL14pExIl+um
         dDYXrCBIDWYGVCLl1T1WKxcya36VT1B3Nji1FfF41p/MiQZZGXCVfwnxSHVJAmua7ga1
         BTnSI+oNLY+ws9pFAlP5NpTNF4WlgjGisunXh3OJErU5TitYlmpSQ1MlEQ2VHUHdP/HG
         dMzg==
X-Forwarded-Encrypted: i=1; AJvYcCXimR7tmppM/0bIbGOZ/FNtbOzWzlPmc1Q7CoFM/pwaqrfo7xSxDVNHnc7sIevMmYQj4zmUtZq6WkP5/F+cKuLldsCN48x8zqJgt4BVgw==
X-Gm-Message-State: AOJu0YyWJ3qCnecJ1tXxWF3ttSrQk/JL6Ef/4XHpT+5JvQE1bZEvSWN0
	GkkgAmJMbwmIbSkzmWNdxe07NM7gz538IZs0GnUYQQVeEvjGNXFA6CivaLF4mkc=
X-Google-Smtp-Source: AGHT+IFpQWyVkqNpbX3oWQ1qVWAoDRpCEHFfRnLPrm7K1OyyrZxbSjbCJFiwT2d3oFuSdNyHV6MyhA==
X-Received: by 2002:a05:600c:3d14:b0:428:6f4:57ff with SMTP id 5b1f17b1804b1-428e6b93fc0mr91125085e9.35.1722986106806;
        Tue, 06 Aug 2024 16:15:06 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429057a4f8dsm2151635e9.20.2024.08.06.16.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 16:15:06 -0700 (PDT)
Message-ID: <bb8398a7-3661-437e-8173-09117aedab16@linaro.org>
Date: Wed, 7 Aug 2024 00:15:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: fix error path on configuration of
 power domains
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Todor Tomov <todor.too@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240806221204.1560258-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240806221204.1560258-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2024 23:12, Vladimir Zapolskiy wrote:
> There is a chance to meet runtime issues during configuration of CAMSS
> power domains, because on the error path dev_pm_domain_detach() is
> unexpectedly called with NULL or error pointer.
> 
> Fixes: 23aa4f0cd327 ("media: qcom: camss: Move VFE power-domain specifics into vfe.c")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Have you tested this with and without named power domains in your dts ? 
The logic here is complex to support both the legacy non-named case and 
the updated named required case.

Could you also provide a backtrace of a failing camss_configure_pd() for 
the commit log.

---
bod

