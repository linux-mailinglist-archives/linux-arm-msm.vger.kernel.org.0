Return-Path: <linux-arm-msm+bounces-73292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E4BB5492F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:17:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F23F168D00
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 10:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D04F32F361E;
	Fri, 12 Sep 2025 10:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PdhsiESP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32462F360C
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 10:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757672012; cv=none; b=X3x85zIL/5G7jmd5VK+2cCWZzto3INJ3YHxbl+V2PDytiUD6gooOhPtqJg15y0kz2prcIRijvC7mdyd+Jtci7OgJqzMGd5Pr/ZeDlJiLw9Gfd1i7DLhQNSkzGJMPsggFEOrJPTqXHUtoKjH9RghDktUfZWoxMh/gAe3nJm5yj9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757672012; c=relaxed/simple;
	bh=7YSSYEotnwWDz0WQadSEh4yzlSbSon2sW/pXPzqpekA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bqKl1c5LD8ArFSiopxzKe9Cg3PCj6vxGvpcS71Ezp1hHOFkNqoEHmE5wLNBO46EOUKIzPTyN7uJYmzZ+u3gR4ir3z9LZxmVsyipMM4yDc74Xuws7FCrpn0bOtOqoheqbkqbpZpbrib5tIn+To0e/GuGm89JUNgqImA7RYJMNx1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PdhsiESP; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45deccb2c1eso13054355e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 03:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757672009; x=1758276809; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/hN/qVIMctC3YPj1IaROqoLTbIv7ZPRR1zi7mYzUdMs=;
        b=PdhsiESPfNIzsm9sqRQ6wORkRNIVVfWc8fhDDEehrCh18LXAW3ByyiRRUd65dghE8e
         nyc52aJyKklpYDpOxRY5suX3sJPoboEJy2f2GhIjuN4BZDwFzfXCwJv91gm9OWCUBfm7
         UJMkG2cRYYsbagG9+aOF0uxQ0VA9KdMddsjeofrACGVE/Ekkuk8p5LZS5Vtq2QoYierW
         tuu8V0ojt3Qy6xpY0osVzORL+U/RayEV7NlKUvtKJpUQ428s1sAoBKvKzw9GpoPNA+EZ
         fZXQEuPXRmi5tJUZEQTOjRIwpBMfXn541hXm0h5qJKPBenEZ+eW3IIyjs8Z5VvCoakSx
         9dhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757672009; x=1758276809;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/hN/qVIMctC3YPj1IaROqoLTbIv7ZPRR1zi7mYzUdMs=;
        b=osVUnnN4avsF7UYE2eFC7aYtd6hY/MxHi/2Dc6HLik+imWOyybaQ9/CnWibSRuFFzd
         C9Q1zFNCQmvTj49otjN5Z4kAq4SaI5+RLvtnAwYqH6FRMC1NR3ep3S3doKELuvYDpkQJ
         DKwFUQhb6J/TvPEMDOt7dm3XdYryatswkUdlCCbdSeUx57w1xjcWdNGgPAbu3mHaBc7i
         XGrLC8/TKlYH7ilr3B2d34qSJL49Z3HXXcFmq4vlGiZiJfBEH6NKJrPMdA/zFyR0wIP8
         n6wp0NUi/twl/aew3MAOO4JbcmJTzTyUuEJqYqmDMvOoCv0p3nzI044m15Esb5zKU7lw
         4OVg==
X-Forwarded-Encrypted: i=1; AJvYcCUrTFJYQZMdjQ8mDtL4OFNLy8mZ47MisGP00B7Ct/rxMoIj3DZy4uGD8p45IHOfoq7qk0uU0HGLaulgkrJW@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj5LIVFphqP7+JBvyywyKOvmqfsrhpmc7MYv7JeT9a5ZWRew8j
	ztH+FnPiSBsb01qcsVoSfFYvmtEeZY+lboQsWCLTpkb1N6akAge/y8BYzPAiG9MC0PI=
X-Gm-Gg: ASbGncsq558u9VAwwQ+iewDiT+u9Q70ujQYXs/Fqc+3oqwuxcxE0D5e14wZdTmI7y+1
	ZGb64qBUctimp9jxjtcLoha/XyYyyHIoXs5Xnuk9m9s0prvQ+kW+fTjxFPfcfFvOXL0MHP5oMDO
	1v6Pg+hir5x/2DdKJ3lLEeEvGIBb4LUFE2Nm/4b60OawN4IhU6NpI3E+vPBN4lNiIN0EfLQid/k
	1q0vIA1WLVt57lBGhg4LiHBbG+d3D4VhBNG6lDDxm6kaiN2BpE+VDO/oNX12sQT6OTel+0WgKhi
	EnEQKaHhK0eyxCS8sfYY7dG1fEG+1UVuck3NSTRo0/tLy2Nk92Qwg0sD66KD2u8I/ljpU2DAzHN
	JmYFtYLjGghKiFinhhrvDcPnU+7EDSSFDwEE4lpHE4rAaJ85HJI7BUI2alldK7pgC4dB3jljDb4
	/ICnvTSbq15G4HvMELc6Q=
X-Google-Smtp-Source: AGHT+IEFCg9ERw6mHKnZORBmThBFfHqVD5ZdJKuGx1uKOuK+P5u+fYpQu9TUH7YFEflDpqTLjoHNNA==
X-Received: by 2002:a05:600c:6c94:b0:45b:9afe:ad48 with SMTP id 5b1f17b1804b1-45f211d57e3mr24116895e9.16.1757672009153;
        Fri, 12 Sep 2025 03:13:29 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017c1455sm59377255e9.24.2025.09.12.03.13.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 03:13:28 -0700 (PDT)
Message-ID: <8135e54a-7652-445d-9c15-226cd930aa86@linaro.org>
Date: Fri, 12 Sep 2025 11:13:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] clk: qcom: camcc-sm7150: Specify Titan GDSC power
 domain as a parent to IPEx and BPS
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
 <ilbxHd5Mgx6B7mM9zuoCveOseTxibuVat5l3Y5QtqYOyaZNWLHlAgTM6oWPFK77aF7TEoHa6vGb40GqIJx--ng==@protonmail.internalid>
 <20250911011218.861322-5-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250911011218.861322-5-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/2025 02:12, Vladimir Zapolskiy wrote:
> Make Titan GDSC power domain as a parent of all other GDSC power domains
> provided by the SM7150 camera clock controller, and it should include
> IPE0/1 and BPS ones, even if there are no users of them currently.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/clk/qcom/camcc-sm7150.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/qcom/camcc-sm7150.c b/drivers/clk/qcom/camcc-sm7150.c
> index 4a3baf5d8e85..0e072ae39ec0 100644
> --- a/drivers/clk/qcom/camcc-sm7150.c
> +++ b/drivers/clk/qcom/camcc-sm7150.c
> @@ -1846,6 +1846,7 @@ static struct gdsc camcc_bps_gdsc = {
>   		.name = "camcc_bps_gdsc",
>   	},
>   	.flags = HW_CTRL | POLL_CFG_GDSCR,
> +	.parent = &camcc_titan_top_gdsc.pd,
>   	.pwrsts = PWRSTS_OFF_ON,
>   };
> 
> @@ -1875,6 +1876,7 @@ static struct gdsc camcc_ipe_0_gdsc = {
>   		.name = "camcc_ipe_0_gdsc",
>   	},
>   	.flags = HW_CTRL | POLL_CFG_GDSCR,
> +	.parent = &camcc_titan_top_gdsc.pd,
>   	.pwrsts = PWRSTS_OFF_ON,
>   };
> 
> @@ -1884,6 +1886,7 @@ static struct gdsc camcc_ipe_1_gdsc = {
>   		.name = "camcc_ipe_1_gdsc",
>   	},
>   	.flags = HW_CTRL | POLL_CFG_GDSCR,
> +	.parent = &camcc_titan_top_gdsc.pd,
>   	.pwrsts = PWRSTS_OFF_ON,
>   };
> 
> --
> 2.49.0
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

