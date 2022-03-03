Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BD494CC243
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 17:06:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233209AbiCCQHh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 11:07:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230450AbiCCQHg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 11:07:36 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69175198D0A
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 08:06:51 -0800 (PST)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7B2453F610
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 16:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646323609;
        bh=xG1VegpeadOmn88+iE57xOfi/3/gVn1p4ncbNJPQ2/Y=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=ZSdbwV8aGq8MMwz6ZIzUxNJfzlxBt+QY6zIfkDPpyTi2BuqKJQVZU8pKhOyGlkZbp
         ixE7vxsBMM+GTZkLcwwaMFLOk4Ws1ZtzHpTV1Cvp3Z1khZogGMogdw9ZzWzllyGi0Z
         5zRCZGCZQt70AHbnCKSUdsXrer4mQIqjN5/mCNzXRRRZ7yfZO/DtBtbJ/qjPxN69p1
         ufecpW5+pfWpQNiWCfC7bEPt2i0rXwqOpjffwGE646x54fbBnDJ36eEK73QTzGziGD
         yy4JMbNsH9Tld+ywe2otDT9k1OuGxGOeDXXUis5Psm7MqnqamhAocR28rnwHEMiLxo
         Z9cl3Nr6BLE2A==
Received: by mail-ej1-f72.google.com with SMTP id sa7-20020a170906eda700b006d1b130d65bso2956183ejb.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 08:06:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xG1VegpeadOmn88+iE57xOfi/3/gVn1p4ncbNJPQ2/Y=;
        b=uFtdw24sJv3LqYxdzTxD8EFsJy+0E+Q3m/mkDE3hXXXOYQsBATbGe5hqA4igcYvj+H
         cDdUcXAehHgylRcYBFe6q3KvUKx/1RPyOY/3ui2D4K0SE2EqCl1094NhO5YWLsEohIu9
         SR6aL7LqEiI39sGTB3P4Ko/Q+mhSSMUUsXklS84R0R2hTdzKsbdNUhVsV41LBprlfn9A
         n2jpDZ7u6gbPUExNmNZU0NcQuIJRmf9AQbwWMeEIiACsgU0fHRD1S0492xoXWEwTkztI
         Vb2abbiFwr85OxSMaHTbODYOt7666r8TucpGdvOIEahoGEjWV29tbGY0FTgkAXXxyoP5
         0Icg==
X-Gm-Message-State: AOAM532eSiyTfzhrIaLFz/Ta0hQ7eYHJ7zlXAqNGI7QQYUi/iRdK14Cf
        wQ1KGvy48ypz2ybjYO2s6G/s8LzRYhm+rJ38oxkJtXzXS6EudQxpIgECu1+QtGhemadld43NQZ7
        PGhru6JzRWk6TCgl8MuYy3MN4ILhV/j9IbwkUmzcx0cQ=
X-Received: by 2002:a05:6402:2709:b0:413:1871:3bc7 with SMTP id y9-20020a056402270900b0041318713bc7mr35222856edd.71.1646323607936;
        Thu, 03 Mar 2022 08:06:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0ypSpE+JBXZxF1rAG3goiPCgi8sTmtd8ySS6JDdwWuc1APd+jzk60hvABThhhUKmBtUFdpg==
X-Received: by 2002:a05:6402:2709:b0:413:1871:3bc7 with SMTP id y9-20020a056402270900b0041318713bc7mr35222838edd.71.1646323607691;
        Thu, 03 Mar 2022 08:06:47 -0800 (PST)
Received: from [192.168.0.137] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id p3-20020a1709060e8300b006d0e8ada804sm825929ejf.127.2022.03.03.08.06.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Mar 2022 08:06:47 -0800 (PST)
Message-ID: <db306916-c748-c983-d535-a4ce67d36cbb@canonical.com>
Date:   Thu, 3 Mar 2022 17:06:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] dt-bindings: display/msm: add missing brace in
 dpu-qcm2290.yaml
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>
References: <20220301233037.2257996-1-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220301233037.2257996-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/03/2022 00:30, Dmitry Baryshkov wrote:
> Add missing brace in dpu-qcm2290.yaml. While we are at it, also fix
> indentation for another brace, so it matches the corresponding line.
> 
> Reported-by: Rob Herring <robh@kernel.org>
> Cc: Loic Poulain <loic.poulain@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
> index 8766b13f0c46..b1b4652077db 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
> @@ -209,6 +209,7 @@ examples:
>                                          remote-endpoint = <&dsi0_in>;
>                                  };
>                          };
> -                 };
> +                };

I see this was applied, but indentation is still wrong. It is not
aligned with opening block.

The indentation should be converted to DT schema convention, so 2 or 4
tabs. I propose 4.

Best regards,
Krzysztof
