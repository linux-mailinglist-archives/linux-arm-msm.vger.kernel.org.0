Return-Path: <linux-arm-msm+bounces-77466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C439BE06ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 21:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B81441A2341B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 19:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E00C930C63B;
	Wed, 15 Oct 2025 19:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rm3AAiFP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF0C2FFF9A
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 19:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760556628; cv=none; b=SsNiJTOWx4h1ji7obQKDG5FpJS7X3T3hLUbvF5oYm0GTvOxvCKoVFWUmms5zlhe52mfg9HVuAQ7dQKhzAwAWjasnxAFJikPhU1Uw2Zr+LQ84wR6SR2hecoPoXVhRZR6z4avxybunnJ5hfk5UXu+hdVCG+hgPoIQR8AJOcHirF7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760556628; c=relaxed/simple;
	bh=nPbCX4b0wyKA4xqnzFN93V39LMSXnGf6slFjcnpoHkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IPWnaNqh7hmalAmGiTOE9m6IUFR1nFXh4ougF9trbl1rIYTaf3y3JP6pnp3TSNgGWfp6kzPsC/dZaUX+gojCpbbTqXNMo5PhObDfKgsL6pg6czyM04+pBSOFn7zKf30qYnA27BPMRkXjgd88iZ+Do1vUiRpQHxyFBNBkJrnCRHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rm3AAiFP; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-58120c35d47so1289425e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 12:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760556625; x=1761161425; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xn6HzcB6Q1wB3Fmq1gYyY4hfzEIJC4qbMSCV9Ej5PPg=;
        b=rm3AAiFPzKNzHGrPkiYs5NwYhdnsqXjdCQBWWNuBFoqeIsqbpexoTcLGK/luwvXmun
         wpx116Sz82PUm2GQh7VvldSRl6Ucoy6S6IFHR3OTXlIT5x/9n1RJDL2bVLuqAQa3HQjs
         dS9npXuPQ7skG+fOpmauPij9yg878q7sGUl5LJReLUJkQ/5q0K/BGVicwKqV8fmmadmJ
         0B/zLJRZ5oZFvTjYF3U5BT6Yqg7EQi1KJqMlakIRUmnHLhHGgMpjZfy3s6TYgJfPff0Y
         Qm2OCew+O+fK1ie7UR5poaypnjFT/RczzkT4862VbFs3icw2uroj8kBZbdZn0eEYeY/X
         2pzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760556625; x=1761161425;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xn6HzcB6Q1wB3Fmq1gYyY4hfzEIJC4qbMSCV9Ej5PPg=;
        b=r4dmlc1DxwOIdrMVizc11f2K+jCsx7H+sjZK9v+NsxhsNz86RFPC2oQCrYv2hnGtPZ
         rtqmBCME0+7DFJBRtUGGo925EKuN3p4XUbg+c8+eVVtLwanoCLtPkfQO6+pjLiAz1Uu6
         qkOOcly46y91aUW9ZqUWmb95PYM8aqTSa5cRVkPESbeQcefUkT8jOTZXLTHRrj9mEQye
         FRKZTZQbko/7us3FSJ8lKpm2SXO0NA6CU6roU+/gtsN5X3594Hsc+UFnKylo4BIauCDn
         02Y6kjw/od4CiivCOHx2plFqn5oEwcx6uD2n2i1x/MbUHgDvDTBu53qa7RfjG7VVjtso
         auRA==
X-Forwarded-Encrypted: i=1; AJvYcCVBBhop1yASvhumiWwmMB5js1O36v5/iEhSeqnFqLzLMjU0N5s0brskBUuYRTDBbA9jReZLHmrgCIcDBFgu@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8bfrdZAfWlaFPyy6fk4xpW411oxDJmm4/Aye2/zrktJZZHBj+
	Xq0wF9jHDdEqurWhm8XdL88LBErT2rfnAoJ2atVSHDSGBV3DYQ4JcfWW/TH4FRYH22I=
X-Gm-Gg: ASbGnctCHIsp47oopxIeJWu9xTQP683tm5HZ3RcbWpxqoloyEe24IfSC2aBaNdPUvlm
	6O1Z8P1oq0k6AtOOuL2lUdWxvxY34pRhMTVEEpQFQsRL6iHcDA6MejtFqfooQTtSzjuKFm37XZW
	+qbM81tx8/F70OSERngto+dbItcv/dCgGeMUbM5YUgzDhmtvoVUYAF0JP7xd7KoI7COuJyKItXI
	hYfhC9dXUKEu93+0EGDP/07qnFLKo3Y9PwIl0scfLn59tkbQOduKTYllwIjo9gJUbw+2veWDO/I
	DDTlJxNnIWN7rZmgRNKKHtm/Wj8eaiR2qfK78G3LJg6GFpg55NRObj2a2Dwgfcf8mKubhjQlcKN
	ShkjfSYyOineJw3R0NsIRxxDin8DQPuhQtACfT07v4NySNORIjl5hqnBy9M2PPgaQ1cYG352uTM
	AIYZ7dcO7sW5/nLWZASjN1XethIorUSbakTqEsX0C051e5bSgNhlXRKewtzxlZfxK1vKMSEA==
X-Google-Smtp-Source: AGHT+IFtiwV326wSWMTN9z/8oSxLb3NlWVYgOdgv2W41aNnsDtgsz1zRyzjEAW4kE//A9Xvesx8DNg==
X-Received: by 2002:a05:6512:118f:b0:585:805b:e3b0 with SMTP id 2adb3069b0e04-591c904cfbemr681247e87.9.1760556624721;
        Wed, 15 Oct 2025 12:30:24 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5909413ec6csm5546283e87.48.2025.10.15.12.30.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 12:30:24 -0700 (PDT)
Message-ID: <e2c43a8c-a9cc-46a1-9ddd-5d6dfc7e917b@linaro.org>
Date: Wed, 15 Oct 2025 22:30:21 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: i2c: qcom-cci: Document Kaanapali
 compatible
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
 <20251014-add-support-for-camss-on-kaanapali-v2-1-f5745ba2dff9@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251014-add-support-for-camss-on-kaanapali-v2-1-f5745ba2dff9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/25 05:56, Hangxiang Ma wrote:
> Add Kaanapali compatible consistent with CAMSS CCI interfaces. The list
> of clocks for Kaanapali requires its own compat string 'cam_top_ahb',
> aggregated into 'qcom,qcm2290-cci' node.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 9bc99d736343..0140c423f6f4 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -25,6 +25,7 @@ properties:
>   
>         - items:
>             - enum:
> +              - qcom,kaanapali-cci
>                 - qcom,qcm2290-cci
>                 - qcom,sa8775p-cci
>                 - qcom,sc7280-cci
> @@ -128,6 +129,7 @@ allOf:
>           compatible:
>             contains:
>               enum:
> +              - qcom,kaanapali-cci
>                 - qcom,qcm2290-cci
>       then:
>         properties:
> @@ -136,7 +138,9 @@ allOf:
>             maxItems: 2
>           clock-names:
>             items:
> -            - const: ahb
> +            - enum:
> +                - ahb
> +                - cam_top_ahb

Why is not to give the clock "ahb" name like on QCM2290?

On QCM2290 the macro in front of the vlaue is GCC_CAMSS_TOP_AHB_CLK,
and name "ahb" is good for both, I believe.

>               - const: cci
>   
>     - if:
> 

-- 
Best wishes,
Vladimir

