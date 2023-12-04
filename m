Return-Path: <linux-arm-msm+bounces-3223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E82D8030E2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 11:45:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8C971F211D2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 10:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA5420303;
	Mon,  4 Dec 2023 10:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nFdbUWfv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D01D9D5
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 02:45:21 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-54ca339ae7aso1596141a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 02:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701686720; x=1702291520; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6YyztTu0COTbmlcMD4L0hygA8BtaTvI3nN75TEHzfHI=;
        b=nFdbUWfv31zyu3vMX72F0iYgWtFejs9xIpHQM49PojNhylZMJ1dfLJjmK+SSWI0RHH
         LcYFQtgQ0wO8aD4cJwwwzFAMQHz2o5mAHxeb1h8BahlK3v9CnVAOtVlQERVOeCbkEKMF
         xK5xbJlX8H6M6TKdQLUC0XrcnJVt168qajP2oCJSQ/6UAgU70jUo7GS59N/hhK8uiZTf
         j8a6n79y3/t05Q0s+UOoDtl8AanUPDQFBQzTXHlbx3OXQUhBk5Uobt/jDsnqQJxq10Lp
         mlFR7vQ9BAZl/ZRYKYFW3iYK4GMnyeyHRbypJmjg2bmqB8DY7j97I78s++eNZCy7qOzT
         mtBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701686720; x=1702291520;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6YyztTu0COTbmlcMD4L0hygA8BtaTvI3nN75TEHzfHI=;
        b=t3c9myXnOj6qoIkH3zO4+7A32KlpFyOc6KdawXV8hvAzt+CHee2gsLLIOKZFjU8BQz
         Gc6lDyGvSPsUGQIaYesOEtD6rraR3zY5OSPC0WwH3W/1x6ZSVaoBti3duPmKC+NTtUB5
         COefwHDSikVcYuvEnuP3BCmxNL/QIgHrK8Kixf8kqGsxGAJiX44sue2TGXjywp2eUm5E
         u+f1vtYErzNL6xHb48oWvrr0TOfOiUjoIvTsbMEMzMKbA8zGOWkkZkL8mp9Fl+5Yk5Ks
         2WLDBuqsQ2hg95pXA+aZUnOKv6zHOWeG41ccGQrFdM9YII31nLxuOhaORorHyWuTbmnP
         dUdw==
X-Gm-Message-State: AOJu0Yzrr0GIXJlncB8uSkLqpo332KoZSrlz7DRdrlL/iNzrJmHDVegQ
	DvkX6TpCb9efhMuP4m6QwJPsWIbUsalUjl+NJa8=
X-Google-Smtp-Source: AGHT+IFSjGkSVgh5Xs2KkgKSiERG0P1FSH0235jUWEfNRfdAVN5fzTc3kFuiSWxzA0Gbdyj2qJ4F1Q==
X-Received: by 2002:a50:ab0d:0:b0:54a:fe10:dede with SMTP id s13-20020a50ab0d000000b0054afe10dedemr2966994edc.36.1701686720300;
        Mon, 04 Dec 2023 02:45:20 -0800 (PST)
Received: from [192.168.209.83] (178235179097.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.97])
        by smtp.gmail.com with ESMTPSA id q9-20020a056402040900b0054c0264a7fasm4618484edv.64.2023.12.04.02.45.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 02:45:20 -0800 (PST)
Message-ID: <3678b052-d812-439f-89b3-6d816d8f35f8@linaro.org>
Date: Mon, 4 Dec 2023 11:45:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: qcom: Disable pm8941 & pm8226 smbb charger by
 default
Content-Language: en-US
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryant Mairs <bryant@mai.rs>
References: <20231203-smbb-pm8941-pm8226-v1-1-9ad75909604b@z3ntu.xyz>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231203-smbb-pm8941-pm8226-v1-1-9ad75909604b@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3.12.2023 15:19, Luca Weiss wrote:
> From: Bryant Mairs <bryant@mai.rs>
> 
> Some platforms don't use the built-in charging hardware (e.g. milletwifi).
> As this is an optional peripheral, default it to off.
> 
> Keep it enabled for all other boards that use smbb.
> 
> Signed-off-by: Bryant Mairs <bryant@mai.rs>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

