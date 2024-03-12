Return-Path: <linux-arm-msm+bounces-13888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF46878C1B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 02:05:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35BDC1C217BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 01:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAFD57E6;
	Tue, 12 Mar 2024 01:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fvOtp4xx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A37653
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 01:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710205510; cv=none; b=SCrtlvYdZcPSMgRdfz84BKAP/0i4B9RyQzQtYfMQN4kmJYIv6iFFF4yDObrH7B4ElvVc3DtuVjFh55mAqu/WQg8Nox/9qhTbRzD1D70w+Y5PHus7SoRAnEcGWgYQPfzlmRlOTGhM9n9QPr8KUDMsFD20cfr5hZ9wtNffOtoxHME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710205510; c=relaxed/simple;
	bh=kiqq5+7qC6lpslO5kWCW11x3kemUPM6htnwZ29MLvMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HBjer6kxFwG67PNmY24KZiH+KBXemrIk0RQkfT+oKvbGZb29P0jGzQCzY+E4ycWT2yolyI2KY3eLxVSqG60TmbekJmX42t9s92MEf4JARc9IkYFkKTxsAyuoMf5agOZV2xT+Fr1ZkNfQrEJO5tP7GWeRvaBHtILXTsqaN2WhHh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fvOtp4xx; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-513b16bb739so1129170e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 18:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710205507; x=1710810307; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AWlUlgD54M+Av91gLdkhwyiioJ08F7sqNreLTDCTGKg=;
        b=fvOtp4xx/6hZ9oR5/ceHPtTYHRKatuauXWtLgj3YTkqDyb77NPaP7CQTw7h6LFhKxK
         ItXKi4rzLICL0VqWhYv3p2UMnvFZS0G6U6HJuOhJuvu8Uje+JENhIfsxQfU3AsAvSrA6
         1oCRgVokImXWRqxIGIZXV8LlBU0z7bHlUrJi5jLl8hJqFq3Mu5SB0s6AYdCO0nDqPyGU
         yIb4pPALLhnz4YQHEGlVSpiU48Doo+kxXRt/vnD0p4PGDv8OsG3mbmLRlj+FHkrVPfiW
         4Z4GwOeWL03oBBp55HsxSxCfkdou5B8nbTzD0HnE4jjpXaDabmZb/5Ek7BG7sqdmJzKB
         Ud/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710205507; x=1710810307;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AWlUlgD54M+Av91gLdkhwyiioJ08F7sqNreLTDCTGKg=;
        b=nCYlA3o8tT6ofKuLmc0DkPXiZr1uWE6YCSJH3SNA+e/urN7m3nl53nphfWG/K49Vqq
         MqO04oTn3Jh1tG39nWOdchdZKWdryQXi0RS+5amomLO4kjJ3yO81DpV5sYQpiwv+TlFA
         eD8Ua4sUIqqWf+2MlfvlAUTPlBI0XhSxS7Bi6FGC58v3iQTHgE90sTbP8dZsBvxDCsCD
         nD4Di8tIS4WE0NBFgklmzJXv66rADq4wIOuR6FfTs4Zc5SfZliY4GYoiGa7aF+W5JtJ2
         D/MexsiJUW34rzOyJEkJDXS+99G/N7UYljo6Rnpr3P/JHItSg2P3RuSukylrPlGSPCUg
         w4Gw==
X-Gm-Message-State: AOJu0Yy47CC9r9pP2miQmtTsMHWw2V3pWZtx7AIW22LHfMB1O0nvZLIf
	2JgGGQZddOuPIAmrmCXVAKrVeW1LE8Vv/N2RbSPclVLtJbeGbWDeCagRzvEk93XqU/we6k6n57w
	RiJo=
X-Google-Smtp-Source: AGHT+IEjePFbUnyVdjlPN5OqGXrY110eXs/oog493hVp9iq9plQNBgZbCsCUqoOBrnsfBdW9+r8XcQ==
X-Received: by 2002:a05:6512:4896:b0:513:57fe:97b8 with SMTP id eq22-20020a056512489600b0051357fe97b8mr4992132lfb.26.1710205506953;
        Mon, 11 Mar 2024 18:05:06 -0700 (PDT)
Received: from [172.30.205.61] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id er26-20020a05651248da00b00513a1fe7767sm1040883lfb.209.2024.03.11.18.05.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 18:05:06 -0700 (PDT)
Message-ID: <61232fd6-2b76-4ab0-af64-2d49ae405610@linaro.org>
Date: Tue, 12 Mar 2024 02:05:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] soc: qcom: llcc: Add regmap for Broadcast_AND
 region
Content-Language: en-US
To: Unnathi Chalicheemala <quic_uchalich@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <cover.1708551850.git.quic_uchalich@quicinc.com>
 <c3456b3d182f5139339400e49b228fa4840ae0e2.1708551850.git.quic_uchalich@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <c3456b3d182f5139339400e49b228fa4840ae0e2.1708551850.git.quic_uchalich@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/23/24 00:07, Unnathi Chalicheemala wrote:
> Define new regmap structure for Broadcast_AND region and initialize
> this regmap when HW block version is greater than 4.1, otherwise
> initialize as a NULL pointer for backwards compatibility.
> 
> Switch from broadcast_OR to broadcast_AND region (when defined in DT)
> for checking status bit 1 as Broadcast_OR region checks only for bit 0.
> 
> Signed-off-by: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
> ---
>   drivers/soc/qcom/llcc-qcom.c       | 15 ++++++++++++++-
>   include/linux/soc/qcom/llcc-qcom.h |  4 +++-
>   2 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> index 4ca88eaebf06..cfdc7d9d7773 100644
> --- a/drivers/soc/qcom/llcc-qcom.c
> +++ b/drivers/soc/qcom/llcc-qcom.c
> @@ -826,6 +826,7 @@ static int llcc_update_act_ctrl(u32 sid,
>   	u32 status_reg;
>   	u32 slice_status;
>   	int ret;
> +	struct regmap *regmap;
Reverse-Christmas-tree, please

>   
>   	if (IS_ERR(drv_data))
>   		return PTR_ERR(drv_data);
> @@ -849,7 +850,9 @@ static int llcc_update_act_ctrl(u32 sid,
>   		return ret;
>   
>   	if (drv_data->version >= LLCC_VERSION_4_1_0_0) {
> -		ret = regmap_read_poll_timeout(drv_data->bcast_regmap, status_reg,
> +		regmap = (!drv_data->bcast_and_regmap) ? drv_data->bcast_regmap
> +			: drv_data->bcast_and_regmap;

<raised eyebrow emoji>

regmap = drv_data->bcast_and_regmap ?: drv_data->bcast_regmap

Konrad

