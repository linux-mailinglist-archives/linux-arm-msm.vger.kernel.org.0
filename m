Return-Path: <linux-arm-msm+bounces-53429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A08B5A7E597
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 18:05:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D51571678E3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 15:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD1EB2066E8;
	Mon,  7 Apr 2025 15:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IzM0GHCg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89FF2066CB
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Apr 2025 15:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041142; cv=none; b=Ad0axEiDgOjc/cs5sAPaVd/+VC92GCvkf0rnoaacnoV+mSXFqXnNsmYLU701GoidHR1ZUuoh6xX+4EwQ2Ztk0vaX1qga84zs6a0g+qp3tCM/gPIM6YWzWSHU116UEp8thLEdRK7ZryMB0OPM4I/izfbpPZhdPFhVZnbrN5ebsic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041142; c=relaxed/simple;
	bh=5Y1kkD63GffpokSvoVSgAXKIhsTTpE6ldnuA2Z/5/+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qs/W/oJYNpooDkTiNapPKeO/lht/z3Ft+xDHzGf1eh9KLnqAp9fotUHdmJ1WJOixuWcX2hzkIdxsVPxAtVpzLujObxYGyemS0Yp7D3WqMJ0fRPc7Vh+5VeAWOVk1jqTc+1FlxdRAnksteyBLkj+TzotxgdtHSMafWAQ6EmF+bYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IzM0GHCg; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43edb40f357so21710615e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Apr 2025 08:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744041136; x=1744645936; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JKXVpHnQ9UfB3mcq/Ytnee0VY/Oh+/K5y49jt5/yJQg=;
        b=IzM0GHCgX+u095Jd6i7+yevvOfA93QfXrYiF2RWJIuW7ZHX6t3HTYZx/WxYLHbOJgg
         +P1g+QRWkD5CGvuT04VaK5ZjwjUj0FwicAuKcqz9XfN80dzhSGnSGzwNpaSZHQuaDzau
         6tXbD0KibM4XmL9WTM3NbJtWhJe0hE0S0KC5NLZOrQDUqY25s/sye61ZsMmO/TlJ/KmJ
         V1oGkwpyOu2bc94hPAi1zziHTap/bR+MLgQpHT1ubMczNDnkEen271jf2p6OStz9rgHA
         GN7ZyWFgUCLdNoOfvt1P86IMeT2x7RpgkZmAhOvP2wd2Sk23D0/A7IWlGU48o0flETcA
         RtSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744041136; x=1744645936;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JKXVpHnQ9UfB3mcq/Ytnee0VY/Oh+/K5y49jt5/yJQg=;
        b=nAqlj586Du4t3+YVcAj60K+03ba6h0uS4uVDmxKHdkYstxSBtD77iufY8tSGLJ/sbo
         LbDb+gT75g/+xvQk7c7sLpaHbud2631aT2qe8Wdkn/uBLOqA5WUyYjWnUr0F7+BI8Qal
         SX1MQj7L0089jNpFPqEfVdIoVAClcMYcGKWrXgXJIUA78mIcKCCoLSthNdkqIXr7SykU
         vk3qMzXcagm5ywg9SnolP+yqwKCYEsFIttLDOBrOZhyZtqLMwxQx5m8DZMLSd1iJMbym
         XvkqoQv3uGpxUQ0Msqt47NuIWOLQVzceHJMifocb+zE0KROWxnsaiq7CqJInkgdJOm4e
         0gLA==
X-Forwarded-Encrypted: i=1; AJvYcCVuJnPD/QNzOBGf8Pew8HM2Z0NLprp/tWi4j0hL7qWSI0RuEtCN3O6Ko5patidp9ME7NHvM+A2Gbg5KEDXm@vger.kernel.org
X-Gm-Message-State: AOJu0YwsvSKje6EMWqOg2BNq/yQ8CZMSIsQLPPenmk19tXvA1YW7tWCW
	rHd/4iNS3Bb1VhHC9CKBa2oEgPkBIbQUbCaZ/pDTAmGXcGou2ic5+Ct94y9HLEk=
X-Gm-Gg: ASbGncvyyd3XvB9keiIBG2NIKb/Ia2PjvKtn4SqWG13IV5KGu+oyAVmkkFK/k4LxZ2Q
	rk5uLUMC9XLsJ92hr/uxcrOcOs7diSltLm3y4ihgOO/opLWNRSrl5FF+f6vrfgD0zBi2od3cCZN
	8auftDFjh4Sm1H/C0oYAeBFyMeBXQpacmxDU5VJlJcCUMzLw9xeAMBAgu+1fh+EY9xdWS0Xqb23
	rBi2a/W9AJ/NTTlCv1O0o9N1P1FKTyhIaYJ/kZDlAqWU3oCEiL7l5zvnVRZT9Y5Ih0D5/z3K2cY
	0Nc+87iya9N425G8mhT9BoBbjskes8TKFRzppS4FF4iWszy/L0bxuSb1PmUezCcWEA+JUJdXaaf
	5c9EiS8CCTg==
X-Google-Smtp-Source: AGHT+IFbrdnI0bm3X3wXVKLHpcb20gRsAzFE7lNyp40eyc5wEc6nf7w8wnTgwtpWKtCfdc480jt9mA==
X-Received: by 2002:a05:600c:4fd6:b0:43b:c5a3:2e1a with SMTP id 5b1f17b1804b1-43ee0616f6fmr94548555e9.2.1744041136210;
        Mon, 07 Apr 2025 08:52:16 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2e6sm133750525e9.18.2025.04.07.08.52.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 08:52:15 -0700 (PDT)
Message-ID: <ecb193d1-2bf1-4d99-b9c6-9b5cde1e936e@linaro.org>
Date: Mon, 7 Apr 2025 16:52:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] media: platform: qcom/iris: add sm8650 support
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250407-topic-sm8x50-iris-v10-v3-0-63569f6d04aa@linaro.org>
 <6zCwYEsWlyaz8z8Elw573sfjWDZBB46nc0IA4Eu_-pKdy3O1WzYh2sr0jdSPRr0uBHqfgMaK3WC5d9sN6-O6cA==@protonmail.internalid>
 <20250407-topic-sm8x50-iris-v10-v3-5-63569f6d04aa@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250407-topic-sm8x50-iris-v10-v3-5-63569f6d04aa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/04/2025 16:24, Neil Armstrong wrote:
> Add support for the SM8650 platform by re-using the SM8550
> definitions and using the vpu33 ops.
> 
> The SM8650/vpu33 requires more reset lines, but the H.284

h264.

> decoder capabilities are identical.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   .../platform/qcom/iris/iris_platform_common.h      |  1 +
>   .../platform/qcom/iris/iris_platform_sm8550.c      | 64 ++++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
>   3 files changed, 69 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index fdd40fd80178c4c66b37e392d07a0a62f492f108..6bc3a7975b04d612f6c89206eae95dac678695fc 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -35,6 +35,7 @@ enum pipe_type {
> 
>   extern struct iris_platform_data sm8250_data;
>   extern struct iris_platform_data sm8550_data;
> +extern struct iris_platform_data sm8650_data;
> 
>   enum platform_clk_type {
>   	IRIS_AXI_CLK,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> index 35d278996c430f2856d0fe59586930061a271c3e..d0f8fa960d53367023e41bc5807ba3f8beae2efc 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> @@ -144,6 +144,10 @@ static const struct icc_info sm8550_icc_table[] = {
> 
>   static const char * const sm8550_clk_reset_table[] = { "bus" };
> 
> +static const char * const sm8650_clk_reset_table[] = { "bus", "core" };
> +
> +static const char * const sm8650_controller_reset_table[] = { "xo" };


At the risk of asking a stupid question, where are these resets in your 
dts ?

You're missing core here ?

20250407-topic-sm8x50-upstream-iris-8550-dt-v1-1-1f7ab3083f49@linaro.org

---
bod

