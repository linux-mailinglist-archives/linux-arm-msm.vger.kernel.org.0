Return-Path: <linux-arm-msm+bounces-778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A08E67EDE0D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 10:55:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24C74B209C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 09:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32EF22941F;
	Thu, 16 Nov 2023 09:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PKNH0bJ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B21811AD
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Nov 2023 01:55:18 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4083f613272so5201765e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Nov 2023 01:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700128517; x=1700733317; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E1oRsx0JkrJpAxhu0TG6CzqhEt1GaBKEgIlWIAk646w=;
        b=PKNH0bJ8OhT8Yed/uUcTzytBOLIyPy5UjBY4fG7B4PEtm17I2Jcn3i+sfZ3LLkrFuA
         dwxia2gw8oVJ+kmyM2Bda/W0dp4X2k/br980zJ+qlBojbb4h07yHqpSFz6NodIG2vh4/
         8+yy8qeBKCkY1xcN2idv06kG+nkQbaKuWTW8PDHshvywF/hTXkZ+4RJxzpHLK1izRW0e
         yU7vVxR1N08tGazriUdMOChtcyhsihUuByeUij5KE2W3PnJT5JHmMdOTTN28jlUnqRI1
         I0+xsLP/lEQEcA4GfnO2DwMBcMw+zoN3+UC06cWpkGwfn970Qk7055bfMi/WLdxIcMmW
         GGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700128517; x=1700733317;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E1oRsx0JkrJpAxhu0TG6CzqhEt1GaBKEgIlWIAk646w=;
        b=xLNkFsdc6LIqnPI/m0Y+upsg0F9JwQFBtMSBFVI2uIDy0CXUxGrOn+nOMlpqjOZFuR
         UtAE6sFuQAiSlAli8fjLe6Qs197X/fpocu2mbAG1geHlQDhVhMwispcZLU3P47fbZ6j6
         +oZ+tLs3h3dEU7kRTb+Da4HbMuUEMi8g2ps/bQT1KDGbPiH8XCc38TvnHy3ZAH4fi6dR
         FOypXS+6x4+zKGQFgLnF3YyFnR4sXdR9mcJLD+x6Xu96sbAXgRmaFNyqtQDKc4/906Sd
         2axBb7viqdNHO5e8tJbzaB5/MXE90aJe1DO73YohtGA+ONBSbe6NOeDvsgpxkRhd8cwo
         sisQ==
X-Gm-Message-State: AOJu0YzioSUZ4UFhaUfqP5mbk++BY7Ytr/SYWcRI74ggNhgV4tINolqD
	hRo3bEfXwAIRt9PlEE7Jr+b8tA==
X-Google-Smtp-Source: AGHT+IFC0ufUujVImIIcEUUJStMAApGOKU2C7zQcbgEAamM2TCYN0xyoQv6pa0YlLg2206Tv9B8xyA==
X-Received: by 2002:a05:600c:4ec6:b0:409:3f53:c9c7 with SMTP id g6-20020a05600c4ec600b004093f53c9c7mr11485099wmq.35.1700128517136;
        Thu, 16 Nov 2023 01:55:17 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id y14-20020a05600c2b0e00b0040644e699a0sm2793102wme.45.2023.11.16.01.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 01:55:16 -0800 (PST)
Message-ID: <3db4549e-9707-48f1-a199-d0155f3ebc16@linaro.org>
Date: Thu, 16 Nov 2023 09:55:15 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: videocc-sm8150: Update the videocc resets
Content-Language: en-US
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20231110065029.2117212-1-quic_skakitap@quicinc.com>
 <20231110065029.2117212-3-quic_skakitap@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20231110065029.2117212-3-quic_skakitap@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2023 06:50, Satya Priya Kakitapalli wrote:
> Add all the available resets for the video clock controller
> on sm8150.
> 
> Fixes: 5658e8cf1a8a ("clk: qcom: add video clock controller driver for SM8150")
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>   drivers/clk/qcom/videocc-sm8150.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/qcom/videocc-sm8150.c b/drivers/clk/qcom/videocc-sm8150.c
> index 1afdbe4a249d..6a5f89f53da8 100644
> --- a/drivers/clk/qcom/videocc-sm8150.c
> +++ b/drivers/clk/qcom/videocc-sm8150.c
> @@ -214,6 +214,10 @@ static const struct regmap_config video_cc_sm8150_regmap_config = {
>   
>   static const struct qcom_reset_map video_cc_sm8150_resets[] = {
>   	[VIDEO_CC_MVSC_CORE_CLK_BCR] = { 0x850, 2 },
> +	[VIDEO_CC_INTERFACE_BCR] = { 0x8f0 },
> +	[VIDEO_CC_MVS0_BCR] = { 0x870 },
> +	[VIDEO_CC_MVS1_BCR] = { 0x8b0 },
> +	[VIDEO_CC_MVSC_BCR] = { 0x810 },
>   };
>   
>   static const struct qcom_cc_desc video_cc_sm8150_desc = {

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

