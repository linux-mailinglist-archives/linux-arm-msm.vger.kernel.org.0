Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB1BE7465FA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 01:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230359AbjGCXCE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jul 2023 19:02:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230331AbjGCXCD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jul 2023 19:02:03 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABED8E6D
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jul 2023 16:02:01 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f766777605so7683689e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jul 2023 16:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688425320; x=1691017320;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JYnjAjsNdc+08o7EfBrn0+tklBHBzj+VlOunjsVeIes=;
        b=sibiPYk/YJKgJiBGHF8C2gv7Orv9I7XefFQOV/sb/PxrndhfP9Zbp9YizegWG9y4Fr
         5XWLYeOXVwjavRSiX1PseOeffxEd4vP7KbSEdqTO0TYz10xHnpdPONC1dJBjEuvdcnvD
         aGse+zNiRl4W4qL0c4RZZ0MULPO2B4Aa9ktN421OFr/vS161jggrL+X2OaS8NGSR9APW
         s8iqA1JV5S9R1yow+ZyVKtb6xCze7TVxK+MZNYQ09jtl37vxSTZyY3PNMavIoNQkgFxU
         NebITzm5Mo/8NyIRLS5L+sM5DEYP61sHk93U/WZEW8/GUF3uB6U6/8FbwICfI0QUeSXY
         IQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688425320; x=1691017320;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JYnjAjsNdc+08o7EfBrn0+tklBHBzj+VlOunjsVeIes=;
        b=LEyxIJGDLWaE+C80bDgwQkv2rTUArivyCAZ8Iws4W0MHYqKsL7oO3bepejTbQKiYnN
         vpl8HKsUaBGzBrtlwfkHz7Cx+p9+u0L/4zyzWkDuLmw+s050jC1CuulIbaOYA4RFnVoI
         iH1hEED/dTRK2DfWZkrS2ftxkNXYsqS+zpz6xzAwGZYjtIAEii4pd3pUwJMxZq9qkG83
         j7fay+l3dpN39Qm371FwbVzsMDhra7cxamIypW3NLuTGKil3WZZcm+frUSxVuH1vQvxX
         kArH8ej2M3T7zDrR+trY+a67P+a9+zC/vGi++tqjrP5wDCKltcoJtftefG5rfOhTJylF
         suig==
X-Gm-Message-State: ABy/qLZ5nCIXIoycDCyyIc4lwpEJTqyg2M9Aqs2aVVMqieb8Mahjllk9
        V1vK4sI9LFiBcUWP0uFJzCGRvw==
X-Google-Smtp-Source: APBJJlFugmQY5xvSs/ktG8Zm+2+0PfQ9R6eeHqJiC2Wo1/jOi9JmJ35CadEz5D48JhJml5DGCDH4cw==
X-Received: by 2002:a05:6512:3f02:b0:4f9:b6f8:844f with SMTP id y2-20020a0565123f0200b004f9b6f8844fmr8008342lfa.39.1688425319700;
        Mon, 03 Jul 2023 16:01:59 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id y26-20020ac255ba000000b004fba6f38f87sm2134802lfg.24.2023.07.03.16.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 16:01:59 -0700 (PDT)
Message-ID: <654b0bbb-9dc3-b71d-b16f-cf6b1a327bbb@linaro.org>
Date:   Tue, 4 Jul 2023 01:01:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 0/4] Qualcomm REFGEN regulator
To:     Mark Brown <broonie@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Rob Herring <robh@kernel.org>
References: <20230628-topic-refgen-v3-0-9fbf0e605d23@linaro.org>
 <b93cb054-fd42-46e5-aef3-dc41b36a85f9@sirena.org.uk>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <b93cb054-fd42-46e5-aef3-dc41b36a85f9@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4.07.2023 00:59, Mark Brown wrote:
> On Mon, Jul 03, 2023 at 08:15:53PM +0200, Konrad Dybcio wrote:
> 
>> Recent Qualcomm SoCs have a REFGEN (reference voltage generator) regulator
>> responsible for providing a reference voltage to some on-SoC IPs (like DSI
>> or PHYs). It can be turned off when unused to save power.
>>
>> This series introduces the driver for it and lets the DSI driver
>> consume it.
> 
> What's the expected plan for merging this - should I be applying the DRM
> patch?
Uh sorry for not clarifying.. please just take the first two.

Konrad
