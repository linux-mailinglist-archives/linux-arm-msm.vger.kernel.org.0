Return-Path: <linux-arm-msm+bounces-52667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8B5A7362B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 16:58:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E04B43A89BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 15:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C131A23B7;
	Thu, 27 Mar 2025 15:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bdCtqeDj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E7019E819
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 15:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743091096; cv=none; b=GthiVbo3M+MfLZNZD369rfB6ZsmEFbhBUp/E7qeNUjS7M8UvXW/0dkWAh7mczTbiSKk4tX5EY0bwRThyiYYsrPZdvdKSW21LzhyWJCUX/n6DFJYQxDwPHRIEWNuGL3Gy0LcBFkXS9Vr8U/Lpo+6JCfnQ5WNeabBHVrFrmt6GwU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743091096; c=relaxed/simple;
	bh=62dvcPos5ihceHF+L4p/AkidVrabWcrJTC+kLST021w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=osfacM8PpHdPmGy0CfNhDuShq/8QvE3wXuYb1aVFwjd7baXPJZG0QFxbLRG+ciGTiiOQJqX/j9RLPpBy9/ngAgvWhbr0pog8k07Sc15BhR6hjuDSRjguZ6FE9xpyp9IhA4odwNmToeiDtC09R83M8g6I2pWI0rGEw2VZWpDUEQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bdCtqeDj; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3913b539aabso653484f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 08:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743091093; x=1743695893; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6HKdTwdl8TGxIL8t8Lj0CMiRVJonmqGWdrgR8+tODvE=;
        b=bdCtqeDj2cv9y5psk3g1GMfu/YBw3rOO7/P9q0lFTo3pqEgH/5g0tFC4fDPkjGQR5b
         +P9OY+yFU9pRdi4SolgFPUnaXRSik5z22pJwuyg6VTn6pb64FkSi4rChq5sVVupXo9Pt
         Z1w/V+cQij4GIEzuKF9NBIIJv2lSfxJWTFyWeEfD8C5OSUF3r1A/59mEnoknYMnJMBXt
         SBOZG35K06fo/JjOLtGk90hMRgZbOSqZ+li9va2HS+7KZrn1V6uSZDpuurDCsPPk14w0
         KP8HOW0/Y1ElFbOnsbyv/ia10QjuZXgGD4wkvRwOXz/Ajda+CO2xjt2vBePYFn87WvGr
         sR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743091093; x=1743695893;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6HKdTwdl8TGxIL8t8Lj0CMiRVJonmqGWdrgR8+tODvE=;
        b=qfOjWl1TCL63H6vbEzXf8jlHWOVxI5a1umAC8BGDPNOXTybpp1Bfw3HV33Uqc99vxT
         EQoo9N0Ht5/XHWZl4044uqtnbsF5A4FlWkQkvW5m5LoG6sH3AKk4bbdeJyMSNJLf7Vc2
         B8Kn3nx0GoNzy0pMVo05cxJ2pwqrHUiFRISTgzkZPKhDADG2qTZwIniNF0VrZrnRW1sQ
         ld0YplYj4TvGdxTC4y+88GBXMUcao7lgD+afZRG9TZjfOrCBOqyB9bfNqMu3xCR3shw9
         75aaEkktIrhObyir1+F68PTa3abXypTbpouA2sNdl5xe3h1WVXL5PE8pCNVopUXbL5rN
         cexA==
X-Forwarded-Encrypted: i=1; AJvYcCXC7KhhYZnOQk9+eLr3ZvbeDjed6r/LyT0c/SiV/Oo7JcJq7qFuLT1vep5dStADCx/6qVkWPCD9UeROWfjr@vger.kernel.org
X-Gm-Message-State: AOJu0YwPtY2vBD9UpNsqjUT5ghqf2jXgcqugsTNefByuCYjeFYpv+/8X
	FwzoTT9mvAF6GxLyHr9yerlh/MLzMSftuU8nP3kb1EuvL1ohVOcQFrV25m40OSI=
X-Gm-Gg: ASbGncsybLfol6e+mizDNZJ1Foep3Ged5xFc2LvzqU6fmWQpZezAhoc88cOFyOCx6Rm
	LQQZU2Ma1Lzcp8P24ciyEsowcS+xyZp1SC7RonBNwZMQRUu87BywmnuQmvHB9mz6QXejXlK+l/Q
	1c3vNsUs3nBkAk4gn0BHhR+Hitjb+7CcLQBLuLQEVpiYJMLdVR4Vc4DE8cOpS4i6uzHjgp7cLmM
	pkr2WeSBqlvjtLnD9tcL3NYqj58F+NUlgqBVjq+S4Sc+5SeQtIHMHHyaySgl3+RN0mStsljFZUs
	hjwC34/hEjP//QlPi9nYHf0uEtIbMFJt1XvzX7v4AYjTp9UDJ3JD+Fp2oNHvF0xaWJiibqrYPSA
	MOzs0VM7jIw==
X-Google-Smtp-Source: AGHT+IFkFyIJlToRG/+HBeQSZWc6JEkWWRkbsOVXttweEBRHe7pfRt7UyfAjtF97SdSKZ7a2YDySMQ==
X-Received: by 2002:a5d:5847:0:b0:390:d6ab:6c49 with SMTP id ffacd0b85a97d-39ad176bc4emr5053689f8f.35.1743091093192;
        Thu, 27 Mar 2025 08:58:13 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d830f5708sm43269915e9.32.2025.03.27.08.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 08:58:12 -0700 (PDT)
Message-ID: <db2566c3-d9e4-4c16-9389-0406de288d7d@linaro.org>
Date: Thu, 27 Mar 2025 15:58:11 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/18] clk: qcom: common: Handle runtime power
 management in qcom_cc_really_probe
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
 <20250327-videocc-pll-multi-pd-voting-v3-5-895fafd62627@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250327-videocc-pll-multi-pd-voting-v3-5-895fafd62627@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/03/2025 09:52, Jagadeesh Kona wrote:
> -		return ret;
> +		goto put_rpm;
> +
> +	ret = qcom_cc_icc_register(dev, desc);
> +
> +put_rpm:
> +	if (desc->use_rpm)
> +		pm_runtime_put(dev);
>   
> -	return qcom_cc_icc_register(dev, desc);
> +	return ret;
>   }
>   EXPORT_SYMBOL_GPL(qcom_cc_really_probe);

Doesn't look right you're missing the put if register goes wrong

	ret = qcom_cc_icc_register(dev, desc);

	if (ret)
		goto put_rpm;

	return 0;

put_rpm:
	if (desc->us_rpm)
		pm_runtime_put();

	return ret;

