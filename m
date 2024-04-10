Return-Path: <linux-arm-msm+bounces-17099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B21D89FF2B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 19:53:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6F3428485B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 17:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B56E17F392;
	Wed, 10 Apr 2024 17:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b4CaqjC9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4149715B0E4
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 17:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712771617; cv=none; b=K/ZZ54wiGHfhNsB85DMs/HpPtr0bJ0DopIEgDHHmD8PRGjaLmVQmYp8eStkoQ9uFDBbiINm5MfarVOs/mPVSXU4PGmuOBmPsNA7yFf64UVk33HFOLQEnhRmK8herjPKiQMcgZFZd/pQGZExAZnD3TSbPXlAZydM1kccq0u6ghr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712771617; c=relaxed/simple;
	bh=D01O/kMLghZ4WNib3yt4DXPdssYvarXhrfDJMcCCeVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fLA671wMhA325//vI6cftelQt1BRupPZjlc67crI63VfxrRXGBlhtfmnegU8VmVNt2jS/CImlSM2Unr9J2hofGcnYxJy4qRf4dzVVWqbYFLzAQC+QmPwamwcHu8OxcXGYtskTrjgtlOJKg7nQF63+t+e9Cz/xswD9/NhWXaaHss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b4CaqjC9; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d895138ce6so43983591fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 10:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712771614; x=1713376414; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z112wHoDgZuxdMnK1c4wNW2q7ZQeAJ7TUS4neCdVGbE=;
        b=b4CaqjC9vXcy0+U9WwVzkxaPjYIeiM8lf4SQTumsVQpOH0S+TcAHCfbF0c3ORmzHB+
         N7kF6RbAKJX9mRhPIiwZvzyLorTHbkGKHk8pAFvaXKubC0fznqKIYzeaiBKyxPEqQRHt
         hZy7AMfUqpkwB5MqfdiQz2d4BzSjOfnjzqQLpJKjsU35wUWtq3LjnVDWkr55P4b3TJ6v
         eO8Q00uXrKWRnYMxJnNe5Tg7R0LTh2fXfkI4/uj4UmggUGG/E5qml2Hp8C5CPKKjYigP
         8wbR7++/CSPJCbjAVEoAeDLteun3pU0jLpW1VxfPkPp9VGPTFPDCOMAxtYnRZI7DsvZ9
         b7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712771614; x=1713376414;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z112wHoDgZuxdMnK1c4wNW2q7ZQeAJ7TUS4neCdVGbE=;
        b=QUsZ/SfmlzQbjVECkpoxkLy1tbXrwk8V1PTdhRk5+6ZW42P7rx1eDAAbJo9hGX0uXW
         1t1gy9NuaNuzTsOdinPn/bXrB2Q2wWG6ZzTwJUDA7NBFYRlSKDFgNeFBeQAsfOePR5Hy
         EMLnlTjXS4jWUKigM7D55VlaqV4vQs1O8esyigoIdZbFK9k7cfiwMotE+6NmDA4dVEjh
         uNoF1mbY4wc/J5TfXnlHihYr01CwX4sqARoJ0Qp2fTGiICdps4ZFUKioQaCTJXuJRZRu
         NNdJ/7ngiY0jjvoW3hVzOOorNyhIg/8Fur+OTRI2wGe0L+gx9FB9O/HVdYf0hc2Bxy0F
         WkVA==
X-Forwarded-Encrypted: i=1; AJvYcCW6qI8shyDlU9DpLvh7QauYvUX4IV6aU84pU0Feu4hQzVLzv/MqIJlM/bRCcONTAlLM/B8xQ2hnqpQBZDRV/vkGcvTfPi2k9VMcHkkmVQ==
X-Gm-Message-State: AOJu0YyJZVvrPDwdM7i3XnEYLyHNW3dV2GkVQBMNSrJ+QqKhuSWq2eYP
	Mwysc+KNv9lmsZtZMhKssjX21Z000OYtlDLVeQilzQjgLeb1SEsHsSLj/IiPL90=
X-Google-Smtp-Source: AGHT+IFIReJaGr66yPHOIX7Zt3g4iDTOzZ9VE/6SbTe0ViyToWAWIbtaAo3ZsNCvLGo+1ZsQL9q5Fw==
X-Received: by 2002:a2e:9317:0:b0:2d6:d536:41ca with SMTP id e23-20020a2e9317000000b002d6d53641camr2473831ljh.4.1712771614307;
        Wed, 10 Apr 2024 10:53:34 -0700 (PDT)
Received: from [172.30.205.26] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id l20-20020a2e99d4000000b002d69b9a6513sm1864693ljj.48.2024.04.10.10.53.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 10:53:34 -0700 (PDT)
Message-ID: <22f5eb76-8f81-46ea-b0a7-5f1d231e7833@linaro.org>
Date: Wed, 10 Apr 2024 19:53:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: fix module autoloading
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240410164045.233198-1-krzk@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240410164045.233198-1-krzk@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/10/24 18:40, Krzysztof Kozlowski wrote:
> Add MODULE_DEVICE_TABLE(), so the module could be properly autoloaded
> based on the alias from of_device_id table.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

These were omitted intentionally, as these are both debug drivers.

Perhaps we could mkdir drivers/soc/qcom/debug to make this clearer

Konrad

