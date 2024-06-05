Return-Path: <linux-arm-msm+bounces-21802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 185D18FD640
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 21:09:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5BDE281DB4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 19:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21E5B13BACE;
	Wed,  5 Jun 2024 19:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DbDqxF+Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0C57345D
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jun 2024 19:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717614547; cv=none; b=N++j1ftOBcuSUw5sPTnJlv2446UGu2Y80J6sP01cwuXXhQIFhFH/CzpbFqY+JLk3gLCwDi7Ks+7DjnhPZi84KP3TVI/RkGX3lqh3uJCV6OlQFsOJij+6iQIEydRO6GYzE3AdPwxugnK5naueXkv3LLKQSond1dmtdkCcE67G/U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717614547; c=relaxed/simple;
	bh=rtEXiqEkU2g5cR9/zxPQ9H3JZU/+UbxUNQ8ab3/RMN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JerntpXqpXIii8CMZhEtpZtxPTeL94rs5x8RLM8v0PYyCqYEHli0SXuzHUGX4yJneZFgPP4RJvY9rwF9WjMOQ80lHrVA/Pqey9RSd3p17xgm7xWivAqDRs7Yg6TsDIjepMW6VsJMXtvac1nUDk7YkDcAd4c0NdyUZrk3MZSSgQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DbDqxF+Z; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-57a9a3bc083so78009a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2024 12:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717614544; x=1718219344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nKX3pGBJqfVsO0y789iaj1aw0Wx8KdFB5hRuHTMNIHE=;
        b=DbDqxF+ZMHTXxP2HIimFtA6u/hoYoJY0M7ZnzvTv656QJCD0KngECs/518YWdiPdIc
         oi9lT2R6M99YG2aXSUKiLHvo+9NPPG2Mq4Hj57w/uT8pAmKBg9uSnKHam3NEK070IbzF
         fCJ4LtG9WxLHoCFJ3P16/iLaGR69n9W7jAnx5/y9OdUM7G8uObMCEkBqTybmWDdeCL16
         KBYw1sVGXaWrzKdWD+HefosndFTGk/PAIl0eYg9J6moFnh6zJl8szKaZ62SzWXlUhIsv
         VoZ6Fj3Mgo+EUkjm0L1SyBUkIzLNzvfEDYwM7gf1tRJutXSn4gKcQyS8oofjfJZ1Z0HI
         GCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717614544; x=1718219344;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nKX3pGBJqfVsO0y789iaj1aw0Wx8KdFB5hRuHTMNIHE=;
        b=EHIaT03hgbYaaFGDpm84/ILrzZQFayE4YaVIU2icN5NKJUrLExbAWfE9c6AAR44nun
         n9F3Lg6wMces2qoKPEz8YOjKv+e2UusDZQLVm1i9JnAVmZeRj9XzGs5c7hhARtNL3BfG
         UgFsWtVJgap8QMwmwatpWHqGepei7FgQKT4fx5v7FWaQItRUCzWUhbCGxYlLonEvCK8o
         bi74Tog6Uc6aoK+LArxgVHWiA8rDAkorWLpwglVHqIoum4ezX3F9sHhVz9aFQP1RiLqW
         m8/jixKnqHVaTHDoXE3F+yOyDE1K+qz03Fk1qrufIUeChHxMKX41g3lKXRqTCFvJlJQQ
         7E4g==
X-Gm-Message-State: AOJu0YwPg70IScvTwKvBy6wOHjtsjXzsxdPNv2xzigcaDUs7/mm+mb7N
	SaR1qJR2VtwtLS/SovxqvyNx/rqurEKnd21qUnJ6w3Yf7FjGgqAA0mWReSkprwU=
X-Google-Smtp-Source: AGHT+IFqt6EXp5lXl7r+ccXxQUibfRkOGCuBcLrOYPa3pXCL2/GcCAU1+81Z1cYLtCAPe9IyJXPdrg==
X-Received: by 2002:a50:9509:0:b0:57a:3046:1cd8 with SMTP id 4fb4d7f45d1cf-57a8b697867mr2919833a12.7.1717614543950;
        Wed, 05 Jun 2024 12:09:03 -0700 (PDT)
Received: from [192.168.128.139] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a7dc01079sm3951728a12.11.2024.06.05.12.09.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 12:09:03 -0700 (PDT)
Message-ID: <9c399d54-aee9-47d9-8076-a6bf17c345a4@linaro.org>
Date: Wed, 5 Jun 2024 21:09:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: qrb4210-rb2: make L9A always-on
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20240605-rb2-l9a-aon-v2-1-0d493d0d107c@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240605-rb2-l9a-aon-v2-1-0d493d0d107c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5.06.2024 11:00 AM, Dmitry Baryshkov wrote:
> The L9A regulator is used to further control voltage regulators on the
> board. It can be used to disable VBAT_mains, 1.8V, 3.3V, 5V rails). Make
> sure that is stays always on to prevent undervolting of these volage
> rails.
> 
> Fixes: 8d58a8c0d930 ("arm64: dts: qcom: Add base qrb4210-rb2 board dts")
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

RPM should already know not to touch it, but this certainly won't hurt

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

