Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE9D564FA5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 10:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232644AbiGDIY1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 04:24:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232038AbiGDIY1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 04:24:27 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1801F6575
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jul 2022 01:24:26 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id a4so14587037lfm.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jul 2022 01:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=69fF1tF9mBEb2kanIJekUSvdRE5qmoDw++pBNZPcjvw=;
        b=kSSgY7GyEt8c2pgoOuNIX05Z/sdK52VPhZi4PqFzz8aMYatpczM79cSp86jFx8LUu1
         KOxVFAKEJqwix5FOGGH1HagwhmHI2vFN6SDvAKJQ6ya68l61HpJ9TkYh93pebJKNFjXk
         ybKYolbBY5K0ON1SvQrcbZaNWVCqIUlZqc2xIllPu7bvvZuqKh1cEOAGIpn1m9NuEp2y
         xpUHMshsfqHUHCpHmtRWFayAUj52omBf82FU76gpcgAen/VjFRI3dY6FoIFWF/XS5fzB
         KEetPKAaBGBW2YK6ZHvj20vMJnGNHfKOPnwA42MMnbgTmp4SnCacpJkVHPaekKA+968a
         SzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=69fF1tF9mBEb2kanIJekUSvdRE5qmoDw++pBNZPcjvw=;
        b=sieoD9LKt4iQRZ1Hzy+WZZrt0j6jJDd5dKlryU3RZpQ2qv1sIuerLtj4YgUDysjevP
         INcWu361TpHr93TIlLzAQ65JHXqnJVNzZrgr5NBBK5r/lWEGy/CTbrnjXc9BdEDVP+KB
         KY0g7yqmOWpVdKqB+B8I0ANptqrftH0BQJBMH2dmr+L0WjuatokaU1qRmy+DYpWMuF3v
         xVKLznBIbE/UescAOaZtgE3byprr2hLqU/Z5xL6LiSjun+LWNupMx8QM2JmJawVF4qAh
         kmpykAVvS2cdJWpuy9S/TMLxk69m/FjpUlgzPZ4T+NEAOmHrt10gR7r190ap6Myav0ud
         FHYg==
X-Gm-Message-State: AJIora940hkaRBdYf0BpK5xkuVXbT6SvTrXb0A/CDuSu/ZKy2nT9I7+G
        e4rvtdEPqRsboD/TZ0SlA/slhg==
X-Google-Smtp-Source: AGRyM1vCDIy+Fyfoum6KPWEzTtPA6UfgghRiB74aUg206+TuOghl5QWZz5735wpzW3KbRnc4xp5jXQ==
X-Received: by 2002:a05:6512:104e:b0:47f:af07:6d74 with SMTP id c14-20020a056512104e00b0047faf076d74mr17686334lfb.308.1656923064460;
        Mon, 04 Jul 2022 01:24:24 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id b8-20020a056512218800b0047f7c897b61sm5024423lft.129.2022.07.04.01.24.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 01:24:23 -0700 (PDT)
Message-ID: <1fb5f0c6-ff72-b9ba-175a-b5197ed658a7@linaro.org>
Date:   Mon, 4 Jul 2022 10:24:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/3] dt-bindings: pci: QCOM Adding sc7280 aggre0,
 aggre1 clocks
Content-Language: en-US
To:     Krishna chaitanya chundru <quic_krichai@quicinc.com>,
        helgaas@kernel.org
Cc:     linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        quic_vbadigan@quicinc.com, quic_hemantk@quicinc.com,
        quic_nitegupt@quicinc.com, quic_skananth@quicinc.com,
        quic_ramkri@quicinc.com, manivannan.sadhasivam@linaro.org,
        swboyd@chromium.org, dmitry.baryshkov@linaro.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <1656062391-14567-1-git-send-email-quic_krichai@quicinc.com>
 <1656691899-21315-1-git-send-email-quic_krichai@quicinc.com>
 <1656691899-21315-3-git-send-email-quic_krichai@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1656691899-21315-3-git-send-email-quic_krichai@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/07/2022 18:11, Krishna chaitanya chundru wrote:
> Adding aggre0 and aggre1 clock entries to PCIe node. 
> 
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> ---
>  Documentation/devicetree/bindings/pci/qcom,pcie.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> index 0b69b12..8f29bdd 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> @@ -423,8 +423,8 @@ allOf:
>      then:
>        properties:
>          clocks:
> -          minItems: 11
> -          maxItems: 11
> +          minItems: 13
> +          maxItems: 13
>          clock-names:
>            items:
>              - const: pipe # PIPE clock
> @@ -437,6 +437,8 @@ allOf:
>              - const: bus_slave # Slave AXI clock
>              - const: slave_q2a # Slave Q2A clock
>              - const: tbu # PCIe TBU clock
> +            - const: aggre0 # Aggre NoC PCIe CENTER SF AXI clock
> +            - const: aggre1 # Aggre NoC PCIe1 AXI clock

You ignored my comments from v1 - please don't. This is not accepted.

Also, please do not send new versions of patchset as reply to some other
threads. It's extremely confusing to find it under something else.

Best regards,
Krzysztof
