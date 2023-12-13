Return-Path: <linux-arm-msm+bounces-4581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E53811DA8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 19:58:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B39531C20B70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 18:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B7091D559;
	Wed, 13 Dec 2023 18:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MqlHrheV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ACADB2
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 10:58:10 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50bf32c0140so8296780e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 10:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702493889; x=1703098689; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4ZUzcUAYKJKCVreBhAC/gAbdLaRwduwq5l8nhnkZ9Qs=;
        b=MqlHrheVo9reLIuB53KYt/C67JY7p5R4tsLLEyLS1iESkdNLof7/zHDTMhIWR21pQd
         Q7UH1e53vDmGErH61ukGKlioXgHWHwjMey8TGprz+CfSa2zBvr+4FJgXazuYLHz/j1jo
         wODcGqIefGT2t1uCsIxanE0GZM/YHIEFA+hYN9X+27/r18IkI4XBYJ1dIe5E+MKlytmZ
         1RkzVGnjrprwaQ2FFDT3+rKDklbFP3+b5l1cxw6c3ZTQjqeBeGsBFbwFGC8IBq8VQiOJ
         8gysB0vh5GFxE7Fr6A0ZKTd+fwAHMXETgeFvCF+0UOLX480xj/oVP4ulVsDpNdXS8f/h
         D+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702493889; x=1703098689;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4ZUzcUAYKJKCVreBhAC/gAbdLaRwduwq5l8nhnkZ9Qs=;
        b=sRDcyVDaHRLKmyB1i91mFdFczf9tgIuJXRfzvfwiD4W3g1dQHuV7yMS4Fw+ln6wmb7
         zkMolV4fng6SuqnInE/3fRnw4Sjr35md8evpVg11W6jMkLWXQw6LxR0NRQEUu1VCidGS
         E35TL0h9WC+r/lX4ZTvV3aEexC+Zq+y+pdhwancC29l13KK85sVpc/Xz3skcWYb7mD7L
         lmviuIJMZhFmCucJyiJJbSPgY5+MgIqMfx4KIXfjIpOu7x675KxgJ0zCIqmM+tNMsABc
         Pv6w2MenvntSnw6cuUbCVIIZcMkR/FoZJWUlyXDhwEu2Y8BAcpqkxzhPvJ3tC5tXkMTv
         Tjdw==
X-Gm-Message-State: AOJu0Yzunp4yybNzkU/ZvS/7ypqSsXijoj+EcSwUqrBFaK1PcNQhIRi7
	hObMWfEXLHpJkmAXy3RJIqguWw==
X-Google-Smtp-Source: AGHT+IFyyAwZxWhcdxaTGwmrqPBk0gEDkvIOCe1nLi88UcVTZe5H3wQnyG/s2PV/+lx0LJVv+t4q8w==
X-Received: by 2002:a05:6512:3608:b0:50d:12b4:e01e with SMTP id f8-20020a056512360800b0050d12b4e01emr3575281lfs.104.1702493888765;
        Wed, 13 Dec 2023 10:58:08 -0800 (PST)
Received: from [172.30.204.126] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id u4-20020a05651206c400b005009c4ba3f0sm1680336lff.72.2023.12.13.10.58.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 10:58:08 -0800 (PST)
Message-ID: <ac04f771-2cfd-461d-ba37-7348a62b92ba@linaro.org>
Date: Wed, 13 Dec 2023 19:58:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm64: dts: qcom: sdm845: fix USB DP/DM HS PHY
 interrupts
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20231213173403.29544-1-johan+linaro@kernel.org>
 <20231213173403.29544-3-johan+linaro@kernel.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231213173403.29544-3-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/13/23 18:34, Johan Hovold wrote:
> The USB DP/DM HS PHY interrupts need to be provided by the PDC interrupt
> controller in order to be able to wake the system up from low-power
> states and to be able to detect disconnect events, which requires
> triggering on falling edges.
> 
> A recent commit updated the trigger type but failed to change the
> interrupt provider as required. This leads to the current Linux driver
> failing to probe instead of printing an error during suspend and USB
> wakeup not working as intended.
> 
> Fixes: 84ad9ac8d9ca ("arm64: dts: qcom: sdm845: fix USB wakeup interrupt types")
> Fixes: ca4db2b538a1 ("arm64: dts: qcom: sdm845: Add USB-related nodes")
> Cc: stable@vger.kernel.org      # 4.20
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
Matches ds

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

