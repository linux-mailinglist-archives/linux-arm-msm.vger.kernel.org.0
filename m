Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 642C4559DDD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jun 2022 17:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbiFXP4b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jun 2022 11:56:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbiFXP4a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jun 2022 11:56:30 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B39651300
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 08:56:29 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id ay16so5583588ejb.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 08:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=AaFxO9SuZohGHBEsd2J56jr4tSjiHPXK/R2ry2JENjE=;
        b=vt6cyA7dGTtFmHXywId9KEZiBRu6Tc7UXnMPSE3k9tp0QmTLM0Zm7Q1/W+yW5z5iHI
         UhAZAFEzNPHhMYZDTrldas64A5d8Pq535Pig4Kevogv4dS5TK7DXCo4xSJeil2HX0O2N
         P64wZoeDttkYWQWrIC0SFruLZeU376vYdvkwxyDvOuDZephiy8oXrxN7z2QH7vtZRVXG
         pEPXdxR1y06sW8nfc1hE9/I74Ot+JkrJad0cgwOC+UAaiH6dkdZkT5lWwb37CVYn9Lre
         Xygqkv1I+vg6bGZe3THe9nDTipv9cc3fPfGn74Njmj2zL/QT0rcSA8qnme8cSt1t9TWl
         UwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=AaFxO9SuZohGHBEsd2J56jr4tSjiHPXK/R2ry2JENjE=;
        b=edL5elwBCbqTiWOVZ0VI1XdQ/U1VsmugE923gHG/6BJKfv+eFmgXsv8q4AWUDek1WW
         TOuNTXiZqNdEwnIqJLXWVFFYMghx84ZoEV7hKMB/t/ls0cmXW+SkuYFnHnPcW9nMfEVa
         CIz3l7sxAtn6NS6n0QoXwrhN0e+e7a2n3DkpRRhZW75pHmk7SWwQzVbeCRA4NbFsyjbt
         FIi+rCdyBtCpewT5MeLkFeOqnAQvAYDwLq+y0Z5JKgyPDThpjbNljOxyq3hOCh/yiXMs
         VPObG3HUC001jk5uKTBBfqVmrevLGNJfVivYpNZc1bhN9H8Yd1Lyu1ChkobW4KyOwRxQ
         lKvg==
X-Gm-Message-State: AJIora+gfQOYjzw2vePQEXg8VeQ2vpIOk83vrDOvFKJURjufwZ7+Zy8J
        Oy3EbdoZhqjk1ghBMs0VVXfAOg==
X-Google-Smtp-Source: AGRyM1v5SgKoPUxGG1PM7JZa1kZuMlcddv1KTTToFLgBec5fNAIFK4ZKiqhHNoQFo6VQLdoUZtzMGg==
X-Received: by 2002:a17:906:530b:b0:722:e9ad:e90 with SMTP id h11-20020a170906530b00b00722e9ad0e90mr14288881ejo.676.1656086187984;
        Fri, 24 Jun 2022 08:56:27 -0700 (PDT)
Received: from [192.168.0.237] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id kj20-20020a170907765400b00722dac96232sm1319451ejc.126.2022.06.24.08.56.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 08:56:27 -0700 (PDT)
Message-ID: <cfed6d9f-3200-424a-0fa6-5c1de1f7fd1a@linaro.org>
Date:   Fri, 24 Jun 2022 17:56:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 01/15] dt-bindings: clocks: qcom,gcc-apq8064: define
 clocks/-names properties
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
 <20220623120418.250589-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220623120418.250589-2-dmitry.baryshkov@linaro.org>
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

On 23/06/2022 14:04, Dmitry Baryshkov wrote:
> Define clock/clock-names properties of the GCC device node to be
> used on MSM8960/APQ8064 platforms.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
