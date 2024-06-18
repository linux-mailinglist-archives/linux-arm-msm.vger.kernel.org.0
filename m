Return-Path: <linux-arm-msm+bounces-23038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AF190D2B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 15:52:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF3371C22B86
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 13:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024B81411F0;
	Tue, 18 Jun 2024 13:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PzGSzlo0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE82313E41F
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 13:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718717285; cv=none; b=JWP74Qh8QL4vMj/iu20QgECG+OnpbjHvC2uxauWLh5oburn2hhQ1ioHaf2x4SXW+VonVoOm7Jxbztfyek5/BB68+ASHcv965EZr9m1aa+VUX9sBZ96Mo4PeQMM1QlFFj96SxtO3LJdjf5t9Smik5a0uRq+KVJqoflCBc2YZi0oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718717285; c=relaxed/simple;
	bh=P2iR+XJO20kjFPFruIuBNlrh7wkDA2ddjm99o7r11VA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s/aNV47ixWHTbWKfl2dU7Zd6kAEItjrJ2excJgoquerEqmHMelQtX5YEEbtaGmGC1Y8An6m4QESVnewll+lAV6XitpbU+9wduNhuR4o0uNdCx4lyurtPgQ8yDKjm9lRJFtpzONmdjZh7rMkycdOe7ROjApnvHg/L+XUGC5MB3j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PzGSzlo0; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2eadaac1d28so57252021fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 06:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718717282; x=1719322082; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cgj0IrDomaUjzBC0KLU+PFvHZCf8aMEd+R22qNfiYxc=;
        b=PzGSzlo0Z7lcLsYIFQIg1tI22pHyBodDYcKzL62oZy4QhRUf6VKi7jAkbOGs12SHVc
         zqZALJROERTqlP99kIRMpOZE2uRAFj3/y9Kqbz1eOQYyBHZLoWtRgyPt6GhAoVUXp6Sy
         7gDwIgsO0jPuM4ryC+9GbzUHL5kPYUyszMRp9I+9GBrSkyRPuUJj3oC5j0XoyNGnWKwM
         TKQYvFetVHzpS5r0UGqVbluXf+YjRa8ZEQOI7d8h1jrbbS3318r4fhPUqByaZwslkV6T
         JhHlKglb0XEh7dB+9zhdmw8GtvBsj5ReBCnZUToGVsQPrku4FrIdNO85E92cp/Wj+vtY
         u1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718717282; x=1719322082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cgj0IrDomaUjzBC0KLU+PFvHZCf8aMEd+R22qNfiYxc=;
        b=X8Iy4ETmDVrdwy0v97XPnRfalz815zRl/+I0KF7qnjGd41KEy+1zW/QgCMqei7yc/7
         Pf4vLgG87BNN78ZCUA+U6zCmsjBwxja1KeacA6uI0c09qIOU/IyXwhKOGNNiElNiXVku
         VKi6QArQaIkQCgRqorZkc7WO44NmgQDfSatLaFqUJiHNXqOiWH1FvGaVwrvXuxmrhiRL
         GRkKpHaYo9RKcmGp0pvHzc7v/BzTNjQZ0141RTdGnu+ca/704Vcq6BBVjizdAwRt30pN
         OScA0y5RpEr9YSPadosh4pg7H4MK0Si8o0lV2q4f/KuRjym1TmDZEX1UacwcEnlr/4v2
         eCYA==
X-Gm-Message-State: AOJu0Yz0XOotevQ8C4jnp4AKU/J6LhUlIXONfS5zfy8w4syB4EF6tcZt
	qn8hUH2Nxym77nlCyD2/pxRg5aBHhxzeoP4r5L8rpTm/k8GQQV7tB45W5eQ04aU=
X-Google-Smtp-Source: AGHT+IGK2g/5pEGb2O7+YJ6KcJ8OGiwXCrOkIFFOMVK9jdv1m3RTPGFryY0YEY6iI7i+KanST2Vzzw==
X-Received: by 2002:a2e:a306:0:b0:2ec:343d:9677 with SMTP id 38308e7fff4ca-2ec343d975amr15666551fa.39.1718717281835;
        Tue, 18 Jun 2024 06:28:01 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283? ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05bf44e8sm17040531fa.14.2024.06.18.06.28.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 06:28:01 -0700 (PDT)
Message-ID: <9104638a-fe7b-4503-91de-7bff3c518eb2@linaro.org>
Date: Tue, 18 Jun 2024 15:27:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] clk: qcom: gpucc-sa8775p: Park RCG's clk source at
 XO during disable
To: Taniya Das <quic_tdas@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Shazad Hussain <quic_shazhuss@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_jkona@quicinc.com,
 quic_imrashai@quicinc.com
References: <20240612-sa8775p-v2-gcc-gpucc-fixes-v2-0-adcc756a23df@quicinc.com>
 <20240612-sa8775p-v2-gcc-gpucc-fixes-v2-5-adcc756a23df@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240612-sa8775p-v2-gcc-gpucc-fixes-v2-5-adcc756a23df@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/12/24 13:08, Taniya Das wrote:
> The RCG's clk src has to be parked at XO while disabling as per the
> HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.
> Also gpu_cc_cb_clk is recommended to be kept always ON, hence use
> clk_branch2_aon_ops to keep the clock always ON.
> 
> Fixes: 0afa16afc36d ("clk: qcom: add the GPUCC driver for sa8775p")
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

