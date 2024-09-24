Return-Path: <linux-arm-msm+bounces-32314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D11984863
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 17:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27C081F23892
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 15:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2B1917579;
	Tue, 24 Sep 2024 15:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C3nPpx7L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF49F15E96
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 15:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727190972; cv=none; b=a3oJ9GV57d8A0AkM6RxNgn8d6mjR6VczhZqLK6TL8n9I2CVY8ropqpNEiClPuBz5PhG7Uhd3u0tsmoBEH3T59A/ykB8d4sdJ5Zv3jWwawhuQPbv1BmAeaV25Afsiqwyi0y9dw6rKJEFWJ//ckWxGx9hkM3zV/ddBOTGbTHuiGWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727190972; c=relaxed/simple;
	bh=PwTDlLox2AQAmONIpbECM8jVk9QU0Vp6e7ZQgQ06bE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kXwnk/dPLANeCBGvPyLr8KIkeGQfhojHA2aSDN/c6vKaxI3RgET9U/kuW4v/8yToAwGKBNNjvPzWAKUmgUdP3GJzC7KGdZX9M+/qSuBh/vh3k3gp9kEsMCr4RvjsUz8di72Uk4pCp7VLNBJT/aoJZ+ly1O6l/KOwu2rx6D8ebOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C3nPpx7L; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f75c56f16aso72788961fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 08:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727190968; x=1727795768; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M2+kErz59ViWHYR3BIUhJh9tCnLP5LQVNzAaQ1sSNYU=;
        b=C3nPpx7LcETD3OwJ5UC7uqNcT61XcL6WP2dt+Ga+OaNRsKz/2kEpJV8M5EUEopFb8F
         rjtLXyiPPT8YkjnDgT35bLGfGZrYo97dcpHz1L0A8txhyerUQ1PN2a0RAEJJBSKUtA7v
         aMlkD+tw6V+JPinEBIwIQyxgENhKuZfQpfOPkQyepr/VOYKFiHMfx8aflVQTICYbouXp
         FUBMeQmcL7il1jnKTlgj77i6WHzuokxJXIZfMcs7pS5a6xhNH1IQFjyEgK2Cy0U3CoPZ
         eTKGgS8hx78mikL6vHPjADgFj5dCXO2HNr+e9YNThrzMFfF3MtHlamObA1qtFpw8qYeZ
         sGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727190968; x=1727795768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M2+kErz59ViWHYR3BIUhJh9tCnLP5LQVNzAaQ1sSNYU=;
        b=ZEWW258qf95xvkah1ozZuVDDsbtlbhvTArIIhNgua4irjZ5T62Ecv4LHDrA0wvGXXL
         KgDZRi12vV3AINys24M9vaSsgfoWMsaLv1xyrDsDFKnHYDAro42eanmkcjZFz7CSSrCJ
         GxUTV9FK7NLjjItjuabbzro1dNyhineNfygWUfNme2Wf/bd6TgS09jchIQLFDK32b9j4
         ZGIJ4YU6vOJDyMDHU9cvahk0r0cOHh0RpZ/d3vHiS5SUSPzjamZ5FnPhMR035uk0MBhT
         4Lqmr7T6D9AVlMYQ1we47eXoEWqoBGOxCGqY6s1xaTWF+vX/ypOC9H0xTtlh2uRc1C3x
         gx4w==
X-Forwarded-Encrypted: i=1; AJvYcCXnmI0PaDpwhVbebEcst/pluY/G07bsHWuTeq+5SauQbrRzYeMnCOX99+N5GCXfuC8My8DoC5lnsTgwWG2D@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd8quudmQ787zRUEMFSwT5UtZtBkCVvQ4HSSUdnDA2VIUvMzF7
	NjbkG2/L6QoXOWUAM+yRX4dr/ge9ejUii9Qoi3OOE39Y1fdvF00Av4vF5aWhkDM=
X-Google-Smtp-Source: AGHT+IGga//IkWzGe9va/Pn0IB7tDK/PAFPD+bS+JVMybUqi1i8ZQsWDZz9NCHDjyOTeeTzh5RfKGw==
X-Received: by 2002:a2e:a593:0:b0:2f7:5980:78ca with SMTP id 38308e7fff4ca-2f7cb360495mr81537551fa.32.1727190968045;
        Tue, 24 Sep 2024 08:16:08 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c5cf49d41esm841259a12.42.2024.09.24.08.16.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 08:16:07 -0700 (PDT)
Message-ID: <b259f304-77a2-4b0e-a8b3-c8d0fb8f9750@linaro.org>
Date: Tue, 24 Sep 2024 16:16:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 20/29] media: iris: subscribe parameters and properties
 to firmware for hfi_gen2
To: quic_dikshita@quicinc.com, Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vedang Nagar <quic_vnagar@quicinc.com>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <20240827-iris_v3-v3-20-c5fdbbe65e70@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240827-iris_v3-v3-20-c5fdbbe65e70@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/08/2024 11:05, Dikshita Agarwal via B4 Relay wrote:
> From: Vedang Nagar <quic_vnagar@quicinc.com>
> 
> For hfi_gen2, subscribe for different bitstream parameters to
> firmware to get notified for change in any of the subscribed
> parameters.
> 
> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |   6 +
>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 179 +++++++++++++++++++++
>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   9 ++
>   .../platform/qcom/iris/iris_platform_common.h      |   4 +
>   .../platform/qcom/iris/iris_platform_sm8550.c      |  13 ++
>   5 files changed, 211 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
> index 8170c1fef569..5fbbab844025 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
> @@ -18,12 +18,18 @@ struct iris_core;
>    *
>    * @inst: pointer to iris_instance structure
>    * @packet: HFI packet
> + * @ipsc_properties_set: boolean to set ipsc properties to fw
> + * @opsc_properties_set: boolean to set opsc properties to fw
>    * @src_subcr_params: subscription params to fw on input port
> + * @dst_subcr_params: subscription params to fw on output port
>    */
>   struct iris_inst_hfi_gen2 {
>   	struct iris_inst		inst;
>   	struct iris_hfi_header		*packet;
> +	bool				ipsc_properties_set;
> +	bool				opsc_properties_set;
>   	struct hfi_subscription_params	src_subcr_params;
> +	struct hfi_subscription_params	dst_subcr_params;
>   };
>   
>   void iris_hfi_gen2_command_ops_init(struct iris_core *core);
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index e50f00021f6d..791b535a3584 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -472,6 +472,9 @@ static int iris_hfi_gen2_session_open(struct iris_inst *inst)
>   	if (inst->state != IRIS_INST_DEINIT)
>   		return -EALREADY;
>   
> +	inst_hfi_gen2->ipsc_properties_set = false;
> +	inst_hfi_gen2->opsc_properties_set = false;
> +
>   	inst_hfi_gen2->packet = kzalloc(4096, GFP_KERNEL);
>   	if (!inst_hfi_gen2->packet)
>   		return -ENOMEM;
> @@ -536,9 +539,185 @@ static int iris_hfi_gen2_session_close(struct iris_inst *inst)
>   	return ret;
>   }
>   
> +static int iris_hfi_gen2_session_subscribe_mode(struct iris_inst *inst,
> +						u32 cmd, u32 plane, u32 payload_type,
> +						void *payload, u32 payload_size)
> +{
> +	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
> +
> +	iris_hfi_gen2_packet_session_command(inst,
> +					     cmd,
> +					     (HFI_HOST_FLAGS_RESPONSE_REQUIRED |
> +					     HFI_HOST_FLAGS_INTR_REQUIRED),
> +					     iris_hfi_gen2_get_port(plane),
> +					     inst->session_id,
> +					     payload_type,
> +					     payload,
> +					     payload_size);
> +
> +	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
> +					inst_hfi_gen2->packet->size);
> +}
> +
> +static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plane)
> +{
> +	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
> +	struct hfi_subscription_params subsc_params;
> +	u32 prop_type, payload_size, payload_type;
> +	struct iris_core *core = inst->core;
> +	const u32 *change_param = NULL;
> +	u32 change_param_size = 0;
> +	u32 payload[32] = {0};
> +	u32 hfi_port = 0;
> +	int ret;
> +	u32 i;
> +
> +	if ((V4L2_TYPE_IS_OUTPUT(plane) && inst_hfi_gen2->ipsc_properties_set) ||
> +	    (V4L2_TYPE_IS_CAPTURE(plane) && inst_hfi_gen2->opsc_properties_set)) {
> +		dev_err(core->dev, "invalid plane\n");
> +		return 0;
> +	}
> +
> +	change_param = core->iris_platform_data->input_config_params;
> +	change_param_size = core->iris_platform_data->input_config_params_size;
> +
> +	if (!change_param || !change_param_size)
> +		return -EINVAL;

That's an odd one, checking for zero but _not_ bounds checking 
chanage_param_size < (sizeof(payload)/sizeof(u32)) - 1

I'm not sure where inpug_config_param_size gets populated but I'd rather 
check that type of parameter - for exactly that reason - than the 
defensive coding done on your inputs elsewhere.

TL;DR why do you trust change_param_size < your array size but not 
change_param_size >= 1 ?

---
bod

