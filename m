Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97EF1505C47
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Apr 2022 18:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237698AbiDRQKl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Apr 2022 12:10:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239801AbiDRQKk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Apr 2022 12:10:40 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1335E252A8
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 09:08:01 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id l7so27693243ejn.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 09:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=oqr9RmHje//A41kB9mudDF/N2i4dpqWGpoMvclyRrys=;
        b=D5mV/MiOY9iguNT01zT/1CcP4sM7iRKWyCf2F2T6IBarNp+wYt+DQAM96Vu/h2iChq
         b5SIAa3wllGjosZiZZyuURv2J4h+4gas9xUfIYd5MKDVQIwERkD2FDUqpxvphYpxw8KI
         LAebOIq/dlQlsYbhamvW4iWbj7B6wK9ryJPxZpcenzzTgSP0cXTSK3+6MMP6pS7WVui1
         kNucxpmYEQxpYgaTlP8Wv1pCmKKLi5PMM2f6IXTkgSE/ZcV/KTmk0Bkois+wKSjDhFgg
         hqI2rsuNc+kGs/WSK3AfyIlq4B7gWloaR0xhW02uKUbtIOmfgpASJQtnQTDhT+r05Wug
         ygbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oqr9RmHje//A41kB9mudDF/N2i4dpqWGpoMvclyRrys=;
        b=EIQ5Rz9zB1Z1bLMuvDnUfsaBegUVH3IsUV94awbABUv0hjbGuQt3YLUrYP99Z+mNCF
         VGCLraRg/GijHZ+DOBtXW5S4sXzkVwBxPsYPX53lbtvFLFdvKO6sVI1GTCeRmK6KfJIK
         NunsrGIjLNYcJpGPTdpLelqj00d/pPUVryf4/B2ajBvRFdpbrrDsh857hNCkk54/GoGm
         C2UBpfb3zEBE38apraH7dxloc2VqLxvUAP6siIg7vgi0qlw/RkvNZ6QfszH9cGXRsW/E
         ycP+tVvfEgYakC257CIou2YmoP9bKZJrkxhEOBdfsU/7WmQQ1G3iOPpmhrNI5+pz7vLN
         qB3Q==
X-Gm-Message-State: AOAM533fA6rkNuTqKhMJRWl7mI3qMsTgK1ZoNWdS7E+91z+jC+HFaG2u
        EggPQoZj1bcvj2lxbJ8h5ojJkA==
X-Google-Smtp-Source: ABdhPJyiAuU3xS4tpdFyuPzk78iTBtq/P/NHk2glXXCVSH23y2emo5i2nLoN6zJZsh/SVRzf43dXow==
X-Received: by 2002:a17:907:3d8b:b0:6ef:ac6c:54de with SMTP id he11-20020a1709073d8b00b006efac6c54demr5086333ejc.292.1650298079665;
        Mon, 18 Apr 2022 09:07:59 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gh9-20020a170906e08900b006e8662287edsm4642266ejb.54.2022.04.18.09.07.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Apr 2022 09:07:59 -0700 (PDT)
Message-ID: <e990fefd-89cb-e5b7-1e9a-fc2c83c5e7fd@linaro.org>
Date:   Mon, 18 Apr 2022 18:07:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH RESEND v2 8/9] arm64: dts: qcom: msm8996: Add MSM8996 Pro
 support
Content-Language: en-US
To:     Yassine Oudjana <yassine.oudjana@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Yassine Oudjana <y.oudjana@protonmail.com>
References: <20220416025637.83484-1-y.oudjana@protonmail.com>
 <20220416025637.83484-9-y.oudjana@protonmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220416025637.83484-9-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/04/2022 04:56, Yassine Oudjana wrote:
> Add a new DTSI for MSM8996 Pro (MSM8996SG) with msm-id and CPU/GPU OPPs.
> CBF OPPs and CPR parameters will be added to it as well once support for
> CBF scaling and CPR is introduced.
> 

Thank you for your patch. There is something to discuss/improve.

> +
> +#include "msm8996.dtsi"
> +
> +/*
> + * MSM8996 Pro (also known as MSM8996SG) is a revision of MSM8996 with
> + * different CPU, CBF and GPU frequencies as well as CPR parameters.
> + */
> +/delete-node/ &cluster0_opp;
> +/delete-node/ &cluster1_opp;
> +
> +/ {
> +	qcom,msm-id = <305 0x10000>;
> +
> +	cluster0_opp: opp_table0 {

No underscores in node names. If this comes from original file, should
be fixed in separate commit.


Best regards,
Krzysztof
