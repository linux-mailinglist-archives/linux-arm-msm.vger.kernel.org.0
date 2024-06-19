Return-Path: <linux-arm-msm+bounces-23279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C47690F6D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 21:17:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5AC66B224B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 19:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3511D158D69;
	Wed, 19 Jun 2024 19:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DzL1LY7q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A9E8475
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 19:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718824668; cv=none; b=Kk0EBenJjTeBe9ww6Paq2Uj7e1DVhwojydePierAkWEOcFs88ZmozaF9Xmbug1lcdR7q8nzRxx3H3f404EEuNt563Lov963AMnITVmD2+pC5qJH1nlPRHP6wM4oU/EjpGjb+FCEndEKSZ/liOqcgcy08eiAw4fJiAKcgkqXpkIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718824668; c=relaxed/simple;
	bh=1f6nJxwFba9DqcGw62muYo8R6CFQWJeLoHkZBBpzB8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aIYuxkSh4nHYP1QOXvQgSt6n6s2jRh0AFgNFvEdB17jZa6qetB/VYcOBVocjQ8j03EOaZeTbrIvk6qaz9R19VLGLYzbrvwXI7fTz6L7ECeOxd3uT24hDcKdH3c5cXfO7wimeYBRtXrArZfRhjKOIozpdcVOLf2SERrQPJCPYd+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DzL1LY7q; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-57d106e69a2so281392a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 12:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718824665; x=1719429465; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S6lEiYCUbYz4T/jCjzT/Chkny3UAUAGhEY6ZMmlWnJc=;
        b=DzL1LY7qjPs8m6/PcadyIjV6RD78Nm/DkzHMeCV7kxbZCr04Zyc0VzOl5HS2r8umCQ
         y1qyRV8sc4IbyNnsGAvmIBYSqTHJeQjJEvT0vMis8J4h5F8q76si9/zWso6+KmmD79Vl
         mmneABNZahSw/eFEKazksGFzB8kZX6yBrlmhg6NwsTsBBbCihLrJBtaSL1TC7BicTExg
         y2bN8K1lZp8Y9YOGQxfrABGB/yKcMIfnSLl3T1GOQxG+SbWHowZBmVBE2+PUojs6MSHq
         EJWa17nXJ6gxSxuI5F09GEypM7Zy1oHTWRpiostTklgrpvnCrSiXaOvpCVYMktgUIUVC
         8T2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718824665; x=1719429465;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S6lEiYCUbYz4T/jCjzT/Chkny3UAUAGhEY6ZMmlWnJc=;
        b=HdWg3R5TPK7teyyQyevI6XD4kLcL6CjeWqbwPqH1DYAU2FunyOqk1AaRKfqjYypnTZ
         iesTrmlh0yHwq3mDJ4L3UsWoeN4lJ/KPEWc/Tyky8KA0DoamDWxcFdZhuVSfmpxpBuFG
         RXo6JNfROnHvGXE1M6HC2DMlx8+NDLGnIb5OtZRS6ZjaE7pVJBJ6limmJKbpxR1kYTC4
         dnd5B7qwJUWfwl/lBfJ2QZMtHUcmrnUJ9OJOfx6NjYNVtmFbAXEz1Vxd1alTPpt9TPzY
         qcg2TzrtiYlNzcd2r4QQNnrV2jTJWZbyfQaWG0CxdAgr2YDevLRvMaEHmrzBch1rH/xq
         GK4w==
X-Gm-Message-State: AOJu0Ywl5GodKJ7e6gDlb1cRzext/Y+QS9/2k/Co9l9Jd6ZEdTQkpWsR
	LGgnYWGwUNWSeu6lVwZHsEmLNrKBzhFaJbkqDBMjPllw7AzB790FEz0lR58Eg1s=
X-Google-Smtp-Source: AGHT+IGj6k332wSqup8rGDwTMoa0gt8RHUTehGLRGJ1I1Zn1p3Ya0Wruu5YmLmNeQVUfoZf3JBxyuQ==
X-Received: by 2002:a50:9f6c:0:b0:57c:57af:6e88 with SMTP id 4fb4d7f45d1cf-57d06a1a6aemr2498410a12.9.1718824664686;
        Wed, 19 Jun 2024 12:17:44 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4dba:9578:7545:6874? ([2a00:f41:9028:9df3:4dba:9578:7545:6874])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb743adf1sm8651050a12.93.2024.06.19.12.17.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jun 2024 12:17:44 -0700 (PDT)
Message-ID: <7f6434e1-8a7e-4e03-8932-c8ae7a04aa91@linaro.org>
Date: Wed, 19 Jun 2024 21:17:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Use mboxes in smsm node for all dtsi where possible
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240619-smsm-mbox-dts-v1-0-268ab7eef779@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240619-smsm-mbox-dts-v1-0-268ab7eef779@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/19/24 18:42, Luca Weiss wrote:
> With the binding and driver patches queued for 6.11[0][1], it's time to
> update the dtsi files to use the new binding.
> 
> [0] https://lore.kernel.org/linux-arm-msm/171840533352.102487.9576671528001022676.b4-ty@kernel.org/
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/log/?h=drivers-for-6.11
> 
> @Bjorn: I think this makes sense to only apply these patches for 6.12 so
> that also in the arm64 tree the driver will exist already, so git bisect
> is not impeded by that.
> 
> Patches are just compile-tested.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

