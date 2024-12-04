Return-Path: <linux-arm-msm+bounces-40192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD51D9E3728
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 11:05:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C794162210
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 10:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA961917D0;
	Wed,  4 Dec 2024 10:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iLVYq/8Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC979187561
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 10:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733306744; cv=none; b=sK2I0bHSM1J0iX8nf3pg01gAH7owGB6VGSDvJeefW/2GhCJfjsR0iRwinGR5OuTIXfreO5d/ClDWugA0+10TUON4AJqkxEGD2/n+yEknE3+/Ug5OJQe/QUMunVU/60keFFSibQJobu5rB+fW0DLJrVjAiTum3D4bu5mssUI3Q10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733306744; c=relaxed/simple;
	bh=/+6MwXTzAqYJn/k9qZM7MZeJOEoE87BdHxli241QN/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MDzRSSE6Zhbi6GwaFiqY95HTYCyAEhVgIqiPRUD616bSVb1MgohC6zeb61RqM1SBWscdK077tZp0utRxQDyk1pQc7F18JbYQaUdgPkOpaKr4HOWRlWxtUXsyUSOtzpOPanAorH3pVP/SgZPD0N0rcMk0SiMwoZFAnzresTqEoPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iLVYq/8Q; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4349d25eb5bso5905435e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 02:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733306740; x=1733911540; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BkF2NdUk2ik13AZKWgpRB5v4eEvGfD4b2/NoRdVK5QY=;
        b=iLVYq/8QIJ7gqW4ZSDKTTJNdeetGyqbyM6P3fb3EhCScb8zE7HL4u6IsC7o3D6cmdR
         4mNg08r/Dsp4bB6vOacgKvLQD1OgBc7upLkjGq0MTCK8UQN9FwhpijLl5zhZlExjKzvY
         WN0L6798Ato7KTgXZRmiVHc7gBOHGQSVhpbNF+0N7TX2aG2bsr4ONx6uK6odItDwfUsW
         yIa1iK6TLOucNE2KdM/J+Dk34kBLOGAN//u2BHbCFi9DH+9nZlo2r482XK91TPjO6yI+
         C96Sd+kxQScntFOTHf3ksb/IqWXwClvpPX6qe/E/TkyZnIw2uMEXwnqTRJnHSY36HmRv
         cGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733306740; x=1733911540;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BkF2NdUk2ik13AZKWgpRB5v4eEvGfD4b2/NoRdVK5QY=;
        b=hHxc+XtijVQXRW4JJQ1w3203ik2T1DO1e0g+ccomHD1y7SImODzmhXyv9mNw8EY4ly
         CFB5RxOfueE0hkubspEcQb49XcGISpKnqM4M36IWkkh8rjAH1/dik/k2nMXntseMdvMf
         wOQJD2aYXbfFgIKpFqGtGgJUAPhjiJ3yMBC4XXaAwHnedHk1wnIRZ8h+1DQjKjSpcH6U
         hgtGmz7vcxiVR9rsi7Hj/NhWxRSqd49JjmS4tZ+302S0b6mlPJxzCt/Me6fWcT44bebW
         FZgBpibXqb/8zctvZgHuHP1ULOiV90j13yieg3VCZPGZCWugWsz9qUUmwtSgXsBwQM0f
         /r9g==
X-Gm-Message-State: AOJu0YwPOdxYeRxokUjcjQQvvO5WueTsM/JRJVzhwIlrVJRIQUtx3d8Q
	MaiZ6yjHT8U6vhlt2TNC4O++zxKqJb6CLYoyVQgeSfYGTAN1Y6r7gjp5Z5nzM9o=
X-Gm-Gg: ASbGncuqiKA1T95Pwe1FiWxyRsyynFzI/ea6I0GMC66HWPhz0YhQZ4zwsWhWyPzf5/I
	tLRv30424MdIAmNaZtUQJdxm8ekMp+snOgnfp+VyPCNLRUxvB1HVWBZKs1JQ43zQlsZqbRhguLI
	Wo1c3XZNBBq8PPp8BI6DyeKNMsZvBxZ/HW9D3RhEJdvzrQrudctOPiL28HP3ZrNK0LLa8aL2t6Q
	BmCWhtq3EkR9BLzr3Qje/cf8fUNrOnveuoxHq6dEkgkW8g1XJSBuLKU+og5zsCOByoe5Q==
X-Google-Smtp-Source: AGHT+IFiJAkL2UXt0kxhV6Z0jjtJuyTadf7YGThYMMP+wJ8guMeZgkoA19tCM2+UjR83W37WBT5b8g==
X-Received: by 2002:a05:6000:2cf:b0:385:ee59:44f3 with SMTP id ffacd0b85a97d-385fddd3477mr1613636f8f.3.1733306740153;
        Wed, 04 Dec 2024 02:05:40 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385f13e4457sm8702228f8f.35.2024.12.04.02.05.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 02:05:39 -0800 (PST)
Message-ID: <ef6f9bd0-c24b-4964-9228-bdab1221fff5@linaro.org>
Date: Wed, 4 Dec 2024 11:05:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] clk: qcom: dispcc-sm8750: Add SM8750 Display clock
 controller
To: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241128-sm8750-dispcc-v1-0-120705a4015c@linaro.org>
 <20241128-sm8750-dispcc-v1-3-120705a4015c@linaro.org>
 <5f05f2305f37bd40bf92299c04480fbf.sboyd@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <5f05f2305f37bd40bf92299c04480fbf.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/12/2024 23:09, Stephen Boyd wrote:
> Quoting Krzysztof Kozlowski (2024-11-28 07:08:01)
>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>> index 2ec9be21ff678e3343cccafa85801aa68805f440..d9ab42c625ddd61f9bf1857522d44d4547e42bf5 100644
>> --- a/drivers/clk/qcom/Kconfig
>> +++ b/drivers/clk/qcom/Kconfig
>> @@ -1022,6 +1022,16 @@ config SM_DISPCC_8550
>>           Say Y if you want to support display devices and functionality such as
>>           splash screen.
>>  
>> +config SM_DISPCC_8750
>> +       tristate "SM8750 Display Clock Controller"
>> +       depends on ARM64 || COMPILE_TEST
> 
> Please select QCOM_GDSC

Ack

> 
>> +       depends on SM_GCC_8750
> 
> select? Or imply? It's a functional dependency, not a build time one.

ARM64 is as well functional dependency, ARCH_QCOM present in all other
drivers as well. It is all the same. The point is to limit the config
options available to users/distros when they do not need them. In this
particular case: if user does not select main clock controller (GCC)
then allowing to choose Display clock controller is pointless.

> 
>> +       help
>> diff --git a/drivers/clk/qcom/dispcc-sm8750.c b/drivers/clk/qcom/dispcc-sm8750.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..ff64ff93c4dbdd2aae22b55dd0e404544cc9373e
>> --- /dev/null
>> +++ b/drivers/clk/qcom/dispcc-sm8750.c
>> @@ -0,0 +1,1960 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2023-2024, Linaro Ltd.
>> + */
>> +
>> +#include <linux/clk.h>
> 
> Is this include used?

Not used, copy pasta from older driver. I'll clean it up.

> 
>> +#include <linux/clk-provider.h>
>> +#include <linux/err.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +#include <linux/pm_runtime.h>
>> +
>> +#include <dt-bindings/clock/qcom,sm8750-dispcc.h>
>> +
>> +#include "common.h"
>> +#include "clk-alpha-pll.h"
>> +#include "clk-branch.h"
>> +#include "clk-pll.h"
>> +#include "clk-rcg.h"
>> +#include "clk-regmap.h"
>> +#include "clk-regmap-divider.h"
>> +#include "clk-regmap-mux.h"
>> +#include "reset.h"
>> +#include "gdsc.h"
> [...]
>> +};
>> +
>> +static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
>> +       .cmd_rcgr = 0x8150,
>> +       .mnd_width = 0,
>> +       .hid_width = 5,
>> +       .parent_map = disp_cc_parent_map_9,
>> +       .freq_tbl = ftbl_disp_cc_mdss_mdp_clk_src,
>> +       .clkr.hw.init = &(const struct clk_init_data) {
>> +               .name = "disp_cc_mdss_mdp_clk_src",
>> +               .parent_data = disp_cc_parent_data_9,
>> +               .num_parents = ARRAY_SIZE(disp_cc_parent_data_9),
>> +               .flags = CLK_SET_RATE_PARENT,
>> +               .ops = &clk_rcg2_shared_ops, /* TODO: switch to cesta managed clocks */
> 
> What is cesta?

Cesta is a new hardware block which receives votes from consumers and
then manages groups of clocks. We do not have drivers for it, so I am
not sure how this here will work out.

I will grow the explanation in comment.

> 
>> +       },
>> +};
>> +
>> +static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
>> +       .cmd_rcgr = 0x8108,
>> +       .mnd_width = 8,
>> +       .hid_width = 5,
>> +       .parent_map = disp_cc_parent_map_1,
>> +       .freq_tbl = ftbl_disp_cc_esync0_clk_src,
>> +       .clkr.hw.init = &(const struct clk_init_data) {
>> +               .name = "disp_cc_mdss_pclk0_clk_src",
>> +               .parent_data = disp_cc_parent_data_1,
>> +               .num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
>> +               .flags = CLK_SET_RATE_PARENT,
>> +               .ops = &clk_pixel_ops,
>> +       },
> [...]
>> +               .enable_reg = 0x80b4,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(const struct clk_init_data) {
>> +                       .name = "disp_cc_osc_clk",
>> +                       .parent_hws = (const struct clk_hw*[]) {
>> +                               &disp_cc_osc_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct gdsc mdss_gdsc = {
>> +       .gdscr = 0x9000,
>> +       .en_rest_wait_val = 0x2,
>> +       .en_few_wait_val = 0x2,
>> +       .clk_dis_wait_val = 0xf,
>> +       .pd = {
>> +               .name = "mdss_gdsc",
>> +       },
>> +       .pwrsts = PWRSTS_OFF_ON,
>> +       .flags = POLL_CFG_GDSCR | HW_CTRL | RETAIN_FF_ENABLE,
>> +       // TODO: no supply?
> 
> What is this?

Development note. I will clean it up.



Best regards,
Krzysztof

