Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A6565F33A0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 18:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbiJCQdZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 12:33:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbiJCQdY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 12:33:24 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 616953679A
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Oct 2022 09:33:22 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id j16so5620905wrh.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Oct 2022 09:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=n7gQQj9XhjkXVTjBSJ/G77RuMKgunnlfCjxjYXqNA/8=;
        b=lTexKq9prOWgH6/4f7WzENeMYdIUCtAP6R8ysrGyASt4LGILvOuwfG9idYjHlfl4y0
         3o4B35BcLMHLVqct9QYFRjqcYZBHJc7hJt3xZmIEDvg7KL+yfQuWm2QExxlNGRcEVAYg
         7+MSB1PxPQJnpsizvfV/0/Rhpc1ORquL/sfgBIGapHlCxGa8tu2FilAW4yflzxD25sDR
         gqY4062xxwQaVZ78DGysJ4HCc/SakBwmLDFQ2Gl296VJGCmj2IWTzqo1529VSKdlIhnW
         B7rl/pyYRHKQ/vE9fndKYeDioRkWhE1pOdCFh+DJ4LREJ8dwxJy1RwO7/ieyOQX9LI1N
         06OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=n7gQQj9XhjkXVTjBSJ/G77RuMKgunnlfCjxjYXqNA/8=;
        b=ljcmmBXaiuD7cE9Sn0RXYpfVZeKncuCGVbIg8c3lFT5v4mnbA0igQj53HLZJL7REhp
         jqd/XO6aEUBQv8CNIhb+M1zpKI41aJy0p7DQ0/leVvwniDa6UDZaHo1ztKu46mpAXkqd
         6TArdH+BLBBnEtcEsrIF5f6PdN/pZmrBMtBkgUCZwga5idxV1Ttew67mdCXwZliTZAkV
         yasNTE88bZXn5zrHOxD/ZqP6/hTesXcHLCGV9oCvulkEgSozhjnoVZEjm+Tkw22ph04G
         YzvXHXOApOI/vDQ66Jw4PhDI6pvzeu7YxONryQj2BWEGvqL/uUdNW2812gYpEYuC84YS
         zRLA==
X-Gm-Message-State: ACrzQf15a8NcOP9TCKok5RxGZbPzsKER7ixxFeRAHS64FnfilFe4hcin
        tbvJT3tnVnEjH0GaLBGbR/R9Aw==
X-Google-Smtp-Source: AMsMyM6G6ZAXH7cqhP7bLFuqSeJ128A4RXXUA2W5Vem3HdRkYYUUXkI2dVUjfddhQj2lGPdCD9+P9Q==
X-Received: by 2002:adf:eb4c:0:b0:22b:24d5:3786 with SMTP id u12-20020adfeb4c000000b0022b24d53786mr13274691wrn.550.1664814800815;
        Mon, 03 Oct 2022 09:33:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:9da7:1217:d35f:d7cf? ([2a01:e0a:982:cbb0:9da7:1217:d35f:d7cf])
        by smtp.gmail.com with ESMTPSA id m21-20020a05600c4f5500b003a5f54e3bbbsm18887451wmq.38.2022.10.03.09.33.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 09:33:20 -0700 (PDT)
Message-ID: <e76dc0bf-3279-4f5f-ede2-75937910f23c@linaro.org>
Date:   Mon, 3 Oct 2022 18:33:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 08/23] ARM: dts: qcom: apq8064-cm-qs600: use labels to
 patch device tree
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
 <20220930185236.867655-9-dmitry.baryshkov@linaro.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220930185236.867655-9-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/09/2022 20:52, Dmitry Baryshkov wrote:
> Use labels to add device-specific properties to DT nodes rather than
> duplicating SoC DT structure in the device DT.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts | 372 ++++++++++----------
>   1 file changed, 183 insertions(+), 189 deletions(-)
> 

<snip>

Quite hard to read, but not sure if it can't be done any better...


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
