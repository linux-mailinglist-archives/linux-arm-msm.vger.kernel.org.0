Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E2005A13EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Aug 2022 16:39:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242366AbiHYOik (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Aug 2022 10:38:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242469AbiHYOiE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Aug 2022 10:38:04 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B3B8B72AD
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 07:37:47 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id bt10so15541318lfb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 07:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=g63m48g6pKVW9XDR0Qw7L/yMCNONa5W212iG6eOgwVY=;
        b=QqSaNSUp1lcAMQKMVTopIDHEFWnJYAKE4t4Aa214Dxy+p0MWct8ITG7C5Sl2JJ2JR5
         0GDOBulQxXM0y8hmuN23uKUQKHV8YfyC5AAeswLm3mMNfK2sW9XtjHNowDf29xq/HOKq
         Jdo3l5BbVi8Ii6E3dUr3dfblUTxG8Iz0z5g2kVXaPyAeft33yeHngMmkczZK+Bp4jfbW
         ewE6OImRXYuEd/2oeiTgG1Q29hTQvaZOjfMqoMu9lqrTuaDRzofAYUHMcZb+4gcRQB6J
         yNgmIJcQQa/26Cqn5n3l8TZp20/QQnmw6mymfDHDQSd/E81qjWr0JWEQL7Al69Vi/Mw7
         a/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=g63m48g6pKVW9XDR0Qw7L/yMCNONa5W212iG6eOgwVY=;
        b=8APl4fwOmM5xkFxTA5Cy7tIRnIAPpSAmWofvfYvwtRilikj3O5zDZidRHBdCJ+HqMb
         Qgk2+qqZKfkWvXy3MKaCI54/SmMs5lG0NwILdbc9wVlvIWzZJ7RGi+WFpHT2Azvus2ax
         RUudGkENF1VVL0II/jN8bI1L8WqOT+JKmVHuhic0pHDSgGPfYqoEO3OTKkMoVBbxtBp1
         LKznu71xKGctpkTfYJhtkHQ/PmwrgZVTKldU80sFCxKDBZ/ZhO2SAO+VdXDSWpVv/wIr
         qAn/gmdcU45aQXPlwpLySV9UIW/jGLYxwwGdWVZZMpNqpVoMviU01689OvCfzQYSqpXk
         T2Zw==
X-Gm-Message-State: ACgBeo08ftoO/yClJsrIHt3fgWfpeuPqYBxMuf+8RyQ3dgseE7GKzWUX
        oMEv6Wbhru8Z+T+dlmvq2xMgXQ==
X-Google-Smtp-Source: AA6agR7ggezKzDkha1/jrr1gqinbb89IwcfWGyZ+Sycky0YQcHwsYNOUzF9VtkgDcYFWm2wHWG0ozw==
X-Received: by 2002:ac2:4c4e:0:b0:492:e3a0:1f01 with SMTP id o14-20020ac24c4e000000b00492e3a01f01mr1186682lfk.465.1661438265047;
        Thu, 25 Aug 2022 07:37:45 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id f12-20020ac24e4c000000b00492c59a2d06sm525205lfr.164.2022.08.25.07.37.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 07:37:44 -0700 (PDT)
Message-ID: <375daf2f-9b8b-597f-41ae-b5be27e22e80@linaro.org>
Date:   Thu, 25 Aug 2022 17:37:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 03/10] dt-bindings: display/msm: move qcom,sc7180-mdss
 schema to mdss.yaml
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220825095103.624891-1-dmitry.baryshkov@linaro.org>
 <20220825095103.624891-4-dmitry.baryshkov@linaro.org>
 <8e0ab9f0-cc27-f472-ce5c-b9f4a9d94005@linaro.org>
 <b01585c9-1810-2f25-d4dd-bea31b685e79@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b01585c9-1810-2f25-d4dd-bea31b685e79@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/08/2022 15:40, Dmitry Baryshkov wrote:
>>>     clock-names:
>>>       items:
>>> +      - const: bus
>>>         - const: iface
>>> -      - const: ahb
>>> +      - const: rot
>>> +      - const: lut
>>>         - const: core
>>> +      - const: vsync
>>
>> All these changes point that device schemas are simply different and
>> trying to unify them is not correct approach.
> 
> I'm not going the argue the mdss-common + platform specifics, but please 
> note that these changes are coming from me removing one extra level of 
> depth in dpu-smth.yaml. Currently these files have both mdss and dpu 
> devices, I'm stripping the mdss out of them.

True, it's second time I got myself looking at wrong part of diff hunk.
Still your allOf:if:then grows with different cases. I guess the biggest
differences came with sdm845 and later only children and clocks differ.

Best regards,
Krzysztof
