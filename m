Return-Path: <linux-arm-msm+bounces-26870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BA2939E61
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 11:59:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99C5E1C21FD6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 09:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE4A14D6F9;
	Tue, 23 Jul 2024 09:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SJrAiroV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2186414D6E0
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 09:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721728753; cv=none; b=AB/MUSpRJjr1h3biEWChId1uHgCa/mxu/e9qxCIfGk2bzR1pMHBVtjgCCtPtBbpwEx5FY44w/GL0NJ8C7GkjKcsHIe7buaYUhA4Uq3JDmBYZAiGwjLra7kfEL8Eux3FOKfbUiYtYCoZNLuvpy9Vywc24Wzb+w+PpP3gq7yc9gu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721728753; c=relaxed/simple;
	bh=bvJ/V8SlikchuVhLQzJWgH8A1IfAWpQ0f7s3rIf3xC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kBcZHzTb/5zQTvBWgVeIP/orIYaO1MtuA030sk0+ED7WTR4JzHzqjD8vkIXWDzhRwFl4UnOn2bvLksGRi7NaZ4NvBkiR9YGmRKq3HaaAlEwf0mEs0UWYeIk1mtKBplX84JDhxJqMhS99GK6bfSFjxE/pomYI6X28ynqnGd4RoaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SJrAiroV; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a7a47e2179dso74923166b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 02:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721728749; x=1722333549; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9Jr7wCwGPz2qRouGbdq1kHEhFEtUVEW7njuWPJvwyGk=;
        b=SJrAiroVXXTPGkz/UoP3zOo4UVfXVVS7k2fNxoV0WdiaiFYiqdqb4tvEKrVFFTOtU3
         w7fYqoCc6MwbOqAd9nPzlzQZmZZggSbtIQE9Wviv3WkobHFakZa4p9ZySldTHkSL5BHB
         6+ZAjF0GuTH143nbrB0qFa0hdZlJ0X9MMcN2710WbtZlIlSTJpD9WQ7dF+6CkKHvUdU/
         5aiQf/JGWtdx7M6algYPRD+f+IM8nW7oPp3YzH90zPJaICqDSMgYVvGTOsHitbpJ/j0L
         Jo55vtNrMyuh0FPt5ilhU7LKD6CQKNu2D6Jh/iHDQ6LWITjJSJy0AnN6mohiHjptlwUk
         lGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721728749; x=1722333549;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Jr7wCwGPz2qRouGbdq1kHEhFEtUVEW7njuWPJvwyGk=;
        b=Sqq1xkWnXaKp5qC1UmBw6YmUWU7L5Ob3jcD/U/xf5LpKkgplLEWW0El3li/9w6Ro94
         MTC/xDviVohsIYtJACYSJ/+H2rkSIyzkKm6exMOPFbQfPyOTHls9EgvRtYyjbd+32Cb/
         j4GI2wRHE1LeMQk3X6Vyyn5FrgUW65Q+3v4aYmy9RLmf6QN2XO41wdJVu55EtfGTNfmq
         wIUmYFHj8C0P0Zif+PXGvBEVSblHICcbgABKxJWzCBarKYTQvqq6/QZdivEmcSNG/ImY
         ThJdd0A5L9+uJegTqrqWhCDf9QPwKG6+nFOm4U/pa4rFoH55bo0Q3AjOEbA4P8wlecxx
         DHLQ==
X-Gm-Message-State: AOJu0YzOpDnUJprlffqnnt770rZbLX1NB/p7XGG22KbQETpxGo2pnHe1
	EXdpz9fBKtp2+yJae4g17kPgP85kyIcc4xSJHUCgFAIOP3tfyDQdgKVXu+8BWgzSf9u2QMXKPPt
	2
X-Google-Smtp-Source: AGHT+IHxYJpIFOZVspziWC5sI67ynZam+LwGyhOnzS2XjEnf+vX/gvykrzl4jI1gKQdmIGDOgg49AQ==
X-Received: by 2002:a17:907:940e:b0:a7a:a138:dbd2 with SMTP id a640c23a62f3a-a7aa138e3c2mr62216066b.50.1721728749246;
        Tue, 23 Jul 2024 02:59:09 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7a3c785e97sm520612366b.39.2024.07.23.02.59.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jul 2024 02:59:08 -0700 (PDT)
Message-ID: <8c442424-e439-420d-9bf0-ccafaa990dac@linaro.org>
Date: Tue, 23 Jul 2024 11:59:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: add rpmh-stats node
To: Rajendra Nayak <quic_rjendra@quicinc.com>, andersson@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240723081357.1521942-1-quic_rjendra@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240723081357.1521942-1-quic_rjendra@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2024 10:13 AM, Rajendra Nayak wrote:
> Add a node describing the RPMh shared memory that can be used to
> retrieve statistics for the SoC low-power modes.
> 
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> ---


Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

