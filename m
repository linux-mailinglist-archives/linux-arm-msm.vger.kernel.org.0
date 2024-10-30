Return-Path: <linux-arm-msm+bounces-36413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7897A9B6109
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 12:05:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9DF91C21044
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 11:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E4D1E7C06;
	Wed, 30 Oct 2024 11:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rFNKpYhv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4E61E767B
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Oct 2024 11:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730286205; cv=none; b=FFJ4BY/RPKL9BsOHgV1bc/Z5SLuFI79XESovP6kb0ItjZ88WPXJqxOaYJC+0x7Iz8sHxoyvyGT/oRvHbAChqnGNJrLa2R/f/poWInKz9KLQcgr+20LD+rzya326R4GyhV0ljtyu7cXqk4xdDHfOO18nlRBdLzFBRBebrWtfzrVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730286205; c=relaxed/simple;
	bh=i/sTm2W58aqNc0bvwKrCduULaEOcP81xZKszHJgcu5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QMcDBUs63Wvs5AwMCeu7X5lyw5aLpD7s0R8PyxUK9uuvIjtL0VAJZfoQ53O0mIyDLwdhRezFjuLJle8PlpRbZ5PE3qKbB3VzhUXcyCGfcNWAHiZU5EhRub1P1R0aGAIEYPEH8DGiATYaL9rxmktwpiBo1LPSABUy+2raxcx/J/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rFNKpYhv; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539f0802bf1so760961e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Oct 2024 04:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730286201; x=1730891001; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dyDd73LhSa+Aowk0j+nzrmpWsgvv8frt2OywSF7Wle8=;
        b=rFNKpYhvKs8wsIjVxz4uk/o/WdX67f8OTLp38bpJaYEEUt7nPB5M57lNPTEThZUWc+
         EgVGUP2sCJ9ktPD+XKW/CmHueooons9gmMELbSdvhc9N9Z1h2k8H3r5nnDCzQsK3gJUe
         6zE2TgNRplJzSRW9OgSCk19CArglkmrQ0/v8e+b8yxrv3nWPQ6iw43CjiU4L9TEwnz9/
         jmmx0Rw4Fbo5tiFwVL/EWYG6Hr48qXye9XC3Dy9V7J/wX/5YSe+qQA/mBH1w6RN+gmZF
         WtoLP6yFZBKm+YWIQd4uTPUpF/0JlqPlPy3vUsUxrF9KNsZwQMOchUQ+h6IPIpJsKvJM
         W/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730286201; x=1730891001;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dyDd73LhSa+Aowk0j+nzrmpWsgvv8frt2OywSF7Wle8=;
        b=Xxo6eJ5LZfVwlBODnfynMlEO82e9u4LfFzGX7ryOIYgsxYkgBJ4AlIPBn33VqDGM7W
         vcvSEsQPxRWANRpP3XS6Ytd3Gg/Ko4+YBUrTvPzidvPLRe3oZZK5qVDFSyIzIYrXlkwV
         qFCujEQ4Dm78EStSRvstF1jxV11cp+4tN7Ha0uywCcIC3a1Mtx9mB6lpISRappay3JHG
         3ANm96oHynzPnTWJZJm1oEfFKwZWd9VI/wr0Alak7d1riKwjkL0oxGStkeUJUqyGvUQA
         VtC+zHNwPOtCKVj0p6QRuXpz6RX+CEGZWrldx80+NZf8YfS66pmHGJbSQjOk+cU9lpAJ
         bWuA==
X-Forwarded-Encrypted: i=1; AJvYcCXUKy/1WMkAjoXrAJmTSmnVyb7gzXEwlMJwMC5Bhidunc03W+9CBSS/v6jzKbgOuCMUW/gd6s7FHJ1a99U3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5SYReale771ga53AcDuikuWa9gDhfwLS+td9FIBrmeqQOBllp
	mLpb6h/q8Mtr6PuocS1bU/F9c8zAyUOy+Eqd8GUmWfV9hiQd3bjZIFwlgxUb5MU=
X-Google-Smtp-Source: AGHT+IFhZJoljikBYl7EYG3OcLL8xTDXcY1FxwXB5w8ypUTn/Fu7ouw0JZgiUeSHRe8KwIvx45FKJg==
X-Received: by 2002:a05:6512:350c:b0:53c:761c:2a07 with SMTP id 2adb3069b0e04-53c761c2d71mr163553e87.6.1730286200692;
        Wed, 30 Oct 2024 04:03:20 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53bc0d52d87sm218049e87.164.2024.10.30.04.03.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 04:03:19 -0700 (PDT)
Message-ID: <dfb7e2ad-5262-4e4a-a49a-584012ef0e57@linaro.org>
Date: Wed, 30 Oct 2024 13:03:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] dt-bindings: clock: qcom: Add CAMCC clocks for
 QCS8300
Content-Language: en-US
To: Imran Shaik <quic_imrashai@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das
 <quic_tdas@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241024-qcs8300-mm-patches-v2-0-76c905060d0a@quicinc.com>
 <20241024-qcs8300-mm-patches-v2-3-76c905060d0a@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241024-qcs8300-mm-patches-v2-3-76c905060d0a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Imran, Krzysztof,

On 10/24/24 16:31, Imran Shaik wrote:
> The QCS8300 camera clock controller is mostly identical to SA8775P, but
> QCS8300 has one additional clock and minor differences. Hence, reuse the
> SA8775P camera bindings and add additional clock required for QCS8300.
> 
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> ---
>   Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml | 1 +
>   include/dt-bindings/clock/qcom,sa8775p-camcc.h                  | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
> index 36a60d8f5ae3..18cbc23b9a07 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
> @@ -18,6 +18,7 @@ description: |
>   properties:
>     compatible:
>       enum:
> +      - qcom,qcs8300-camcc
>         - qcom,sa8775p-camcc
>   
>     clocks:
> diff --git a/include/dt-bindings/clock/qcom,sa8775p-camcc.h b/include/dt-bindings/clock/qcom,sa8775p-camcc.h
> index 38531acd699f..36ac587a981a 100644
> --- a/include/dt-bindings/clock/qcom,sa8775p-camcc.h
> +++ b/include/dt-bindings/clock/qcom,sa8775p-camcc.h
> @@ -93,6 +93,7 @@
>   #define CAM_CC_SM_OBS_CLK					83
>   #define CAM_CC_XO_CLK_SRC					84
>   #define CAM_CC_QDSS_DEBUG_XO_CLK				85
> +#define CAM_CC_TITAN_TOP_ACCU_SHIFT_CLK				86
>   
>   /* CAM_CC power domains */
>   #define CAM_CC_TITAN_TOP_GDSC					0
> 

I greately dislike this change, and the reasons are the same as already
given by Krzysztof.

If you find it possible, please follow an approach by adding a new
header file and include a platform ancestor headder file from it, like
it's done in commit a6a61b9701d1.

--
Best wishes,
Vladimir

