Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDBF474F315
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 17:11:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231537AbjGKPLR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 11:11:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231579AbjGKPLM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 11:11:12 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4805810EF
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 08:11:10 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fba1288bbdso8580087e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 08:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689088268; x=1691680268;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PAxsMN4SFjq3m6zL5WwDeg6MGUvFZCHkp0p5DhC8jiU=;
        b=pk8yZoZ4fiKzO+Y1DNF7w6tIFmoqUHj8ImS15hj+NXeOnhaVKqQP5EgtldYF9/ow61
         Wrx/QvB3XHDsu/AZLeWmTlLnDW9UzXhdNXvRLqH0oeJ//FM72QQKe4Rk5V/3RgA6hshB
         0nOuREWD02QbuHEYBuN73coL6HsPJ/5LwNNw+EPm7o5NckGq5Il+IC4fPfrjpy8mSuej
         /R1fXe7ol5aJXn8MPVeCET/zQ2fpziUnN0tSt5fvXIs2Biypc9FB0VpRkt9QqdEf47/F
         3QSkYznGE45VU1VLbk0cEGmxo9xy7WsstisdvfBtscnpzw60gtOEqbhSJpSJFzczs8tK
         fTRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689088268; x=1691680268;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PAxsMN4SFjq3m6zL5WwDeg6MGUvFZCHkp0p5DhC8jiU=;
        b=V+UmMrpEnyvEBdhWCLZW7IDqsiAPwztFriML8F2JVp2fhXhp7zoHeRwZWrKRmgd7jt
         XLyLIikEKOl0nuWjUZ2lhr0WyCgNLwgwI5Mriow29n0ydQouxnxYL4QJKm0sFL8Zv8zD
         Up+OPe5bTVIFfP+2mo9Jl6hcAOPANpZjlcCZN2BDONdqKZaaEZm4TbXLU/wre0Zt3L8X
         Sgwfg0FxolHeYorw18rJAO4f3KqFRN7jo9e2T6QotUrQxbbi9jRP2G9HkzaC2J3m6xwH
         2ogYDErI0RjClrh7chDPCTSX9J5lNaw6aTKrgDn+yaee2t4kZhJjjuFiY5O13iTKODzT
         tJYA==
X-Gm-Message-State: ABy/qLan0zaywJzu2lAhyXD/hR7aAq5aAQiN0so3nvY8POnuNkkjUDC0
        9bJ2nLyTHDytB3r9wWvPtp5b3Q==
X-Google-Smtp-Source: APBJJlF5q6dJCBUSCWvxVV/e6sC6FQtfNmRX//BtPXMe2TwxHGHFdxn9o2CMlUlZ6UDSdlPDtbczug==
X-Received: by 2002:a05:6512:33ce:b0:4f9:596d:c803 with SMTP id d14-20020a05651233ce00b004f9596dc803mr17340726lfg.53.1689088268494;
        Tue, 11 Jul 2023 08:11:08 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id b26-20020ac247fa000000b004fbb207ee0asm352885lfp.206.2023.07.11.08.11.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 08:11:07 -0700 (PDT)
Message-ID: <6746ceb6-dac4-ee8e-411f-8de0ff8f12e0@linaro.org>
Date:   Tue, 11 Jul 2023 18:11:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 1/3] dt-bindings: power: rpmhpd: Add Generic RPMh PD
 indexes
Content-Language: en-GB
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1689054169-10800-1-git-send-email-quic_rohiagar@quicinc.com>
 <1689054169-10800-2-git-send-email-quic_rohiagar@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1689054169-10800-2-git-send-email-quic_rohiagar@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/07/2023 08:42, Rohit Agarwal wrote:
> Add Generic RPMh Power Domain indexes that can be used
> for all the Qualcomm SoC henceforth.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   include/dt-bindings/power/qcom-rpmhpd.h | 30 ++++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
>   create mode 100644 include/dt-bindings/power/qcom-rpmhpd.h
> 
> diff --git a/include/dt-bindings/power/qcom-rpmhpd.h b/include/dt-bindings/power/qcom-rpmhpd.h
> new file mode 100644
> index 0000000..4da2e04
> --- /dev/null
> +++ b/include/dt-bindings/power/qcom-rpmhpd.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _DT_BINDINGS_POWER_QCOM_RPMHPD_H
> +#define _DT_BINDINGS_POWER_QCOM_RPMHPD_H
> +
> +/* Generic RPMH Power Domain Indexes */
> +#define CX               0
> +#define MX               1
> +#define CX_AO            2
> +#define MX_AO            3
> +#define GFX              4
> +#define MSS              5
> +#define EBI              6
> +#define LCX              7
> +#define LMX              8
> +#define MMCX             9
> +#define MMCX_AO          10
> +#define MXC              11
> +#define MXC_AO           12
> +#define NSP              13
> +#define NSP0             14
> +#define NSP1             15
> +#define QPHY             16
> +#define DDR              17
> +#define XO               18

I went through the existing defines. If we adopt the order of defines 
for sm8550, we can migrate that platform and all of sm8[234]50 without 
breaking ABI. This would be a minor gain, but still something.

> +
> +#endif

-- 
With best wishes
Dmitry

