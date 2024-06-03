Return-Path: <linux-arm-msm+bounces-21531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D97688FA615
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 00:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90A8B1F2260E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 22:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75F5213CA87;
	Mon,  3 Jun 2024 22:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ueaRVIcX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D644CF9E9
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jun 2024 22:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717455445; cv=none; b=TH06CwtTmLqOedq41NM5nmWnm7GDLjGij8a7lp6d5fzmVQ5lJrH2IY+/je1LcoAQ1BOz05a9eHaQ9stiAjsAK0XWdP0G7aUcBGFrHexyf7xQUFw6ECmz/1JNSX2GZljdgZirovjqqusIzd/4wKBZKnxqQcqDiPJh6LZVmsxMT0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717455445; c=relaxed/simple;
	bh=nX8Q858K/UmNdE+z62x6jtKRo1bZV/rL+IfvqhMwRuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pRai2ebJOtN1otbsDreKDhNPoWju/NRVBMR4jsizF8OoDj6ubj8rGsuoq+880RzuNtPXTY1J/FBMNNw6dZ8e0D62dtG7mZuKoLQQjMo8iPSVxmxqgeyqMu7qWeMMFgeWPNrFsjaZfyCHGBV3l13tyayPoRJrfcD1wyiF6K9g5CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ueaRVIcX; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so28225275e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jun 2024 15:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717455442; x=1718060242; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kaRccFa+6mxaTnJf9D0VBEY8DTyZXYaK2LVRdTyB+bQ=;
        b=ueaRVIcXKglswx4gl2cq1Aijd8R2m2gi7Uuy2IpT9zskCCNYxWDYqPVQlfthcF9xOL
         8BVD6gd+8SumfHuCQuIDNG8zDg+hIwfPixfTH9eYlaldzlLpGsm/IPWL4fYjdot3SJaM
         nJ/UwDDxi7XYZixar/p7p7xv1RoPBlIWL7V/d4jpjVXVy0gueNhbrOy0q54GicrSWxoB
         k8R6Ef6aoVIuR55rGFib9TNUf21o4g/93F32Cr0Slaj0IpndBTuHarYPMca1gngMneLT
         /6qcSvIeSDHbVUGKKPcK/6PGlHb1qsAZYD3//UmgWUAnEK/lfnqjvxS7A2/dAJK3LRuY
         gxJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717455442; x=1718060242;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kaRccFa+6mxaTnJf9D0VBEY8DTyZXYaK2LVRdTyB+bQ=;
        b=mYDpqPMhSFgKgKuBRcUMwrc9CI96ZxCpm5WQCBxycfCaLUHkA0PxVzMQd2Jshx5bKd
         TsBNvrJtkKchumsXr8pkaZSQ7oiRKVxdU43pOtrDtAdAwbsOhS1MNRATZSlSQlTobToR
         SoaDzKAdR0OZ/Hbmc7mQA1H5NcwmdgZh1xnonph9TCjmJuiDpbkzz3aGP5n/5Qm+CIpN
         JwO8HMowmZsuCkz0IVU5EJV0ZNqPIE1ro3BRVh9NTVt18DnRPVrmtALw5mvpMyHw3a6h
         IFHqIuJQ323ZRo8OLOxE/su4Fq8VuDIwQzboWc09jGfz+mgaiFjB4qj8cqAhsasvw2gl
         B46w==
X-Gm-Message-State: AOJu0YxYkCytnPLPfb8m87sh1UzcgvbwnKlXm1UfcA0tgQSvDx4n3ySA
	50albGYqkrd2I/TjxcHpUWgdgvzjWcQsjkvLmrQHOILbNSlUnNHEQme3TLqRlC8=
X-Google-Smtp-Source: AGHT+IGiXS4WQoXBvbqy+BdwxG9f6EOIMgJ0rplbncVnlwUWF4HFgLrwxI87sB/oru9jfGD7Z8jwcA==
X-Received: by 2002:a05:600c:198f:b0:41b:4caa:554c with SMTP id 5b1f17b1804b1-421451157admr8603335e9.2.1717455442308;
        Mon, 03 Jun 2024 15:57:22 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd064aa6csm9942393f8f.93.2024.06.03.15.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 15:57:21 -0700 (PDT)
Message-ID: <9083b1c8-655c-4812-9641-17c93addc964@linaro.org>
Date: Mon, 3 Jun 2024 23:57:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qrb4210-rb2: make L9A always-on
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240603-rb2-l9a-aon-v1-1-81c35a0de43d@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240603-rb2-l9a-aon-v1-1-81c35a0de43d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/06/2024 13:49, Dmitry Baryshkov wrote:
> The L9A regulator is used to further control voltage regulators on the
> board. Make sure that is stays always on to prevent undervolting some of
> the volage rails.
> 
> Fixes: 8d58a8c0d930 ("arm64: dts: qcom: Add base qrb4210-rb2 board dts")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> index 2c39bb1b97db..e0c14d23b909 100644
> --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> @@ -403,6 +403,8 @@ vreg_l9a_1p8: l9 {
>   			regulator-min-microvolt = <1800000>;
>   			regulator-max-microvolt = <1800000>;
>   			regulator-allow-set-load;
> +			regulator-always-on;
> +			regulator-boot-on;
>   		};
>   
>   		vreg_l10a_1p8: l10 {
> 
> ---
> base-commit: 0e1980c40b6edfa68b6acf926bab22448a6e40c9
> change-id: 20240603-rb2-l9a-aon-d1292bad5aaa
> 
> Best regards,

It'd be nice to have some more detail on which rails and the further 
side effects, in a V2 if you're of a mind to do so.

Either way.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

