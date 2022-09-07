Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B529C5B01DE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 12:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230326AbiIGKY4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Sep 2022 06:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230302AbiIGKYw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Sep 2022 06:24:52 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31A4E38B1
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Sep 2022 03:24:36 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id s15so15416667ljp.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Sep 2022 03:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=sjy4Jxxxofr/CNtkGo5BunwXXx20LZ0tjJE5uoNvdEQ=;
        b=OGIExj4MjF/TqRB81wkACNnrGKX0bsArf1wuHu+JuLcWpZFBEH/FUO3li6w7en8MOc
         BLUuPzWcKWHu0qkvn4tyyDD35IMJCiPA7kKPIJK/exdObqV1PKYINtL6jklXYs+e6dXj
         F7o1U4W5BNFBcwAv+6CnfLHtMwchNpTO7HnZ87n+zxPlDjZf3x7Ik2H8iWNpXE4+7hmg
         Z7aY3wk5FxM2z9e+KwbcGpO5nUaxq0kXVWtnC3vuSoEEzfC3GF5dDBe6LEvvKCxH/28x
         tQqe4FM+4AdMY5NY0TA5lHOQNZN+Ssm8LnTdaSKmCeGKektk437RS3cB6F/hiOs8LzRd
         igag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=sjy4Jxxxofr/CNtkGo5BunwXXx20LZ0tjJE5uoNvdEQ=;
        b=uu+5WwE9+TNL3blVG8YZ3sI4F0mggCr5WJNe2T7nnX2BbfZ50WesXvrJJ8RdKCZnWi
         eKMjx7fjvGVaTMXphrR1v0j5YrqEdxl481n/Np+WIB3VJGMDA63RSKfozuxeutC+mIqW
         RzhMaJQ+YubYU5xzzr1FnnnVz7Bb1VxECryWUBFi9gHmRR4FFZRgztNyatVAXwK9BvWh
         W2S2L2Ymgr2bzdE+/MeXmufwjZJ3GnZFebnQ5Ly9AI1MybD6dXaHFa/+aKbeO+/dDrop
         lIGx4DzCdYcGHtkoscVSMaGqXe7NNNN/9DobNztguwa46eKhvteY6QanNIG4Ovh1TuWP
         J1LA==
X-Gm-Message-State: ACgBeo2Xr/7oqM2I5xZW7Ucs8YE9zGcD+zgesBgSvS20F/NOJhj5/Z+y
        Cxf436wUVEj86+A1PBzsdusfiQ==
X-Google-Smtp-Source: AA6agR7LrS6Wpr0G0GMNseZ4mqfHBTC8LHNpanhfuhXUqUCYOVOmftOUiwx4o+SwlUSvSCvYDrDtOQ==
X-Received: by 2002:a05:651c:1542:b0:249:5d86:3164 with SMTP id y2-20020a05651c154200b002495d863164mr784613ljp.500.1662546274641;
        Wed, 07 Sep 2022 03:24:34 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q17-20020ac25111000000b004946c3cf53fsm2375739lfb.59.2022.09.07.03.24.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Sep 2022 03:24:33 -0700 (PDT)
Message-ID: <115bb541-57d1-23fa-d365-4e239f933d1b@linaro.org>
Date:   Wed, 7 Sep 2022 12:24:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v12] dt-bindings: misc: fastrpc convert bindings to yaml
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org, David Heidelberg <david@ixit.cz>
References: <20220907074301.3996021-1-abel.vesa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220907074301.3996021-1-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/09/2022 09:43, Abel Vesa wrote:
> Convert Qualcomm FastRPC bindings to yaml format, so that we could validate
> dt-entries correctly and any future additions can go into yaml format.
> 
> Use compute-cb@ subnodes instead of just cb@. Add qcom,glink-channels and
> qcom,smd-channels missing properties to make sure dtbs_check doesn't fail
> right off the bat. Correct the name of the parent node in the example from
> smd-edge to glink-edge.
> 
> Since now the qcom,fastrpc bindings document is yaml, update the
> reference to it in qcom,glink-edge and also use $ref.
> 
> Also update the MAINTAINERS file to point to the yaml version.
> 
> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
