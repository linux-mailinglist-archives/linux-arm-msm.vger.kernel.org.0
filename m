Return-Path: <linux-arm-msm+bounces-1579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A64A87F50FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 21:00:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12A14B20B4A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 20:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18D6758AA1;
	Wed, 22 Nov 2023 20:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XGRwIQ+f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71BE11B3
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 12:00:30 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c871d566cfso1893391fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 12:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700683229; x=1701288029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QxfRjeO+6//AOclod090Pxu/HWOvIlUw5wFHoylvtIk=;
        b=XGRwIQ+fASZfv7LFvEsnHiwQ9WpBsbhqcfZ2SEb7Aj9/LMDMAKVBq/COEYttBBfdLV
         e0HU79mcWMkkZG+jQw5Tj3Gex4hkJ+QeLk4cyj588/YQC/LEDJi/zy36viqHtzbIMI9p
         nbvl944/IHKmFzqvtE0um4eGoOG+NIy2Zr8qyfSQXqKZYjIKm77XQxEsQlLYbWxsG6jF
         f6iIVVT3XYOmvOJh40m7EiRhlhMOrWce7pZcJJKwXgXhb+sIHvJ6m90DlhrHtpNAaXHg
         BMJU1M7NHT9nrsj/hdl0UsdzdFIZyx7cULOs73YVFAUXawojjrjYodYB2qiYWKwFw+lN
         Gj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700683229; x=1701288029;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QxfRjeO+6//AOclod090Pxu/HWOvIlUw5wFHoylvtIk=;
        b=ex6SDFLm32AW1JJWWN2kyMsSonlD/zLjGy174awlHm6yoOapjMI+DJUGO8jpRCVXUa
         X7ZjJnydQmJ2JZGTjSnEVd9FUbopL5ONzNY3PTMUsFS8wo9lSvtOdQLDmadHBgP3DkWC
         meO3+qPfbRPUKuTidigKngxT6Vu93djd48kcLxReMr7kmjtoI7i+U4L1kKw3RHPKuXYH
         VHmy8A6KtTAMxA2CSwhIt+vjSKNBc//Owp1x1w+CTRz0F5ZKK4wAJvuwUwuV+eXXCbOH
         WD2AZ/R/iukV+0UttYOhWfV0OMLsy2RxOR2u1Efb4mFJWi7/ci7j7w/m4QX6uLKmem/n
         Vhaw==
X-Gm-Message-State: AOJu0YxcaXs13s0kw5Wt0akZIjcHF+2DpVfn+8OFq+bb6RFkjlbV9BEA
	dkXzsZQo9XqU/8qDCA6RWjisRQ==
X-Google-Smtp-Source: AGHT+IHls7EBe3OVOnCOlDbggJ1Qx2xgrsuzrL7blYXiBFq2rwRUccQYEutyTOVUmFTHhfaIkcAJyA==
X-Received: by 2002:a19:674a:0:b0:50a:a720:141b with SMTP id e10-20020a19674a000000b0050aa720141bmr948095lfj.31.1700683228703;
        Wed, 22 Nov 2023 12:00:28 -0800 (PST)
Received: from [172.30.204.74] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id u19-20020a05651220d300b0050300e013f3sm1935876lfr.254.2023.11.22.12.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 12:00:28 -0800 (PST)
Message-ID: <d867be91-38ae-406e-89eb-accdfe85be71@linaro.org>
Date: Wed, 22 Nov 2023 21:00:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/4] clk: qcom: videocc-sm8150: Update the videocc
 resets
Content-Language: en-US
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Andy Gross <agross@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20231118123944.2202630-1-quic_skakitap@quicinc.com>
 <20231118123944.2202630-3-quic_skakitap@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231118123944.2202630-3-quic_skakitap@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/18/23 13:39, Satya Priya Kakitapalli wrote:
> Add all the available resets for the video clock controller
> on sm8150.
> 
> Fixes: 5658e8cf1a8a ("clk: qcom: add video clock controller driver for SM8150")
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
> Changes since v1:
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

