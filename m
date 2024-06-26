Return-Path: <linux-arm-msm+bounces-24324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FB6918614
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 17:39:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06AA91C218D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 15:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B526B18C35A;
	Wed, 26 Jun 2024 15:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JfoPqh2e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE7418C358
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 15:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719416378; cv=none; b=RFPux0M+1vPFWvWJa7Hzml34eBqAuigM+wi3xcQ6/vEMqxLsn63H6vmfHkQmrVnrnmhUppxKqvNlqaToxR7A5VIyIY1VAuF/3AaTkm9DhrE9pUbu4RTTkSYz2HSVtStcsXZ01lJWSvNtiiSkQ87cjC4hhRqNvfZ3EyRVdyZ1u24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719416378; c=relaxed/simple;
	bh=PBmsA3dp7WOzVuKoikoPlIqgP7yl2wLUkbDd8Z333GU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=m59oK0BOPbMaD9MA6VtEwxbrzPPBUPFn1c9EKxf4e3ssDwYkg7LpV+qXthx3Eal/i+PbE7si/vQvWOz+mT8kpAGztcrnGsm0baGFQdYLEs7iDY7TEd+4m3y0SYfy/gv2GzCwmOj/nOdmv0UECKCPm+FV7ptLT6wiR7NcuUR2Q1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JfoPqh2e; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a725282b926so508007066b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 08:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719416374; x=1720021174; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0bkJu/bkE4YATT5DotU3XkvD4f0O0B8V67eM7kRZPuY=;
        b=JfoPqh2eQAYjUP4y7GDbPKgMFiul/C+ssUC+eCVuEtj1+iYn7aICkEQ9D5/96fS9Fy
         8exdo9A0SEvigm66cZYoh+XOlqx/ZBc0Stltxd5oE+kOzEEQpnE1+japUV2/463FRfHt
         WjEYkT3kn2VAwyobGKds2sZTE4euon+S1tqiL5jlqQd+L5jaAH0vkncnmWlTnGE+h45d
         E+JnqgpTg6TUzhkC56S7MlM2xeNWkHyGOVq2XODeuZiu01fBDZoJJSJqY8O3zxKD/t0U
         yXO72J9PBkF+KMNT0rOY1RsDkwYqzHJ2b10mhExLER2qi8rs7AEEtmd/1oAiuWYpP+hb
         qixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719416374; x=1720021174;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0bkJu/bkE4YATT5DotU3XkvD4f0O0B8V67eM7kRZPuY=;
        b=JwEvdkl8lEYrNnUePKnTZWaGA/GMnXGhtbaRQUsSCxGydXg2+08EiLc8Sr0g7/koZl
         OM4L5xDAK9bhhO6gFsyyQY5O3c0yz+wCHtpVKwAOgG1Vs+29gPeKErks+qeCdo/yqWA9
         /+Aq1Pb6zj82QROMOPq4fy6JuMbqijOJqnBglc67Jo2f9aA+OvD1q1UDO1n445aAULlV
         Z9RD5OJq/0UY/YXtiHDdyLV9n63wZkpVHkiQIZrTECnQ9JGmJpdmiSSrnoCloACHTbYz
         n/siE8EjPRuQbSSHb4yrf56dM+kL6DQ6yHXH7BAIgxULx7Qt85VYXuUDXydbLwTOcy6t
         UIlw==
X-Forwarded-Encrypted: i=1; AJvYcCV9Z0PHSnQLIhS/WMY6H3AHwv/EzOMbitpXxRK9g+ln6rKFFezSQy9pmgLEx8aij4P4rQt7Bi0FJvSm9zc4MR1F8OwRS78dov1EbOm+rw==
X-Gm-Message-State: AOJu0Yzu53+wkK0UX0sJyOpfC7oP/gwbN2CqFNVZdaT3fteRHp8/HAuE
	ZYvbC5Kiqo+eYuIndKTanSBUi/zNZ59O4ftHp7tgHgUDjnwqzT2aRVnX51kWAjY=
X-Google-Smtp-Source: AGHT+IG/rHUrDCvGY9wJr8ucozPZKf0rO73NUY5HSWLeuYxtBLnN/cI1iFrL9wx3/pOzGPv/gbUI7w==
X-Received: by 2002:a17:907:c242:b0:a72:8296:ca12 with SMTP id a640c23a62f3a-a728296d192mr290301866b.36.1719416373600;
        Wed, 26 Jun 2024 08:39:33 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a724ebbc1a5sm367452366b.213.2024.06.26.08.39.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 08:39:33 -0700 (PDT)
Message-ID: <e678339b-356f-4aa4-aa04-e6e54d8e554c@linaro.org>
Date: Wed, 26 Jun 2024 17:39:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 5/7] clk: qcom: Add NSS clock Controller driver for
 IPQ9574
To: Devi Priya <quic_devipriy@quicinc.com>, andersson@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, catalin.marinas@arm.com,
 will@kernel.org, p.zabel@pengutronix.de, richardcochran@gmail.com,
 geert+renesas@glider.be, dmitry.baryshkov@linaro.org,
 neil.armstrong@linaro.org, arnd@arndb.de, m.szyprowski@samsung.com,
 nfraprado@collabora.com, u-kumar1@ti.com, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org
References: <20240626143302.810632-1-quic_devipriy@quicinc.com>
 <20240626143302.810632-6-quic_devipriy@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240626143302.810632-6-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.06.2024 4:33 PM, Devi Priya wrote:
> Add Networking Sub System Clock Controller(NSSCC) driver for ipq9574 based
> devices.
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> Tested-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---

[...]

> +	struct regmap *regmap;
> +	struct qcom_cc_desc nsscc_ipq9574_desc = nss_cc_ipq9574_desc;
> +	struct clk *nsscc_clk;
> +	struct device_node *np = (&pdev->dev)->of_node;
> +	int ret;
> +
> +	nsscc_clk = of_clk_get(np, 11);
> +	if (IS_ERR(nsscc_clk))
> +		return PTR_ERR(nsscc_clk);
> +
> +	ret = clk_prepare_enable(nsscc_clk);
> +	if (ret)
> +		clk_disable_unprepare(nsscc_clk);

No changes to be seen..

Konrad

