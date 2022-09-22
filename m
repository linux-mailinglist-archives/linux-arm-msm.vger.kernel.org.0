Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E572D5E6167
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 13:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231295AbiIVLmT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 07:42:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbiIVLmJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 07:42:09 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08A009B875
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 04:42:02 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id a10so10713805ljq.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 04:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=+1WSPKWPrsc/qCB3+vUopjI5nZ0YDPu4pJY+FLQ9d2g=;
        b=MFSvPboCRq4R6FIggkWWQ3DXdLdL9n5qZDgoEkrudLezY2MDKnJP4wtJs7ttGBOZSc
         BcdF0QP+wa6Flm4LNfPX3OZBlIlLdLWhJx4s5tb0gNyTDo0/xMRuI4cf7EOMULCWT8aO
         lqtu4MCYdNwM3f6e3vI5RjMCTyVE/e5u7MXcIP9LlzTxFdL+1KwnDby1EQznZJ+kRDUl
         0SyGrD4Mw2fjA99PNwqxVkcfKqY0g/0ul9z6SO3MhKPlEnfC26Hy+6waB8P0a+ruU77y
         QxCiDdSN/WPOVNDjIwRB9dhBf7Y2V/cV8+FsolgnsRUuLuP/FOlcir5kLI5xK1c2M8lH
         jH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=+1WSPKWPrsc/qCB3+vUopjI5nZ0YDPu4pJY+FLQ9d2g=;
        b=V/V5mtXY91QcxtWWFzEooZnpaI2NO/+bi9Cp2j5OqPeqyEGHq04oCY4PUCzdywu+wK
         5UN7xZRDYZebb1IGvVc5dAkvNRUHwwM/j+GryhET8zhwFmfsmNmgR304rMACcGLWZYBC
         yGZwULRF7CH9RnRMdsmPTx8g+4SgTPc7fQbub2zLW6JYn0ZCqIRrT2mZwrYeI/ESpbur
         EM1vt9z8F/N6Gusw97QGzxdhZxEUeALOUK4Jfbe2Koua7P9z1kwD/fAANXpj4yoOFSRb
         qDAdGr5C2X65RgWcfDyqvuopoELtbs0EwP5cUfyofr7IOEbG/Gh9Cwcb45/PMWlih4Mb
         igeQ==
X-Gm-Message-State: ACrzQf2qgGZNRaHvP5iK6Rsp4QxlkkAJ8CyqmOThtLm8u2PD1ehEQCsr
        YfUyLViq06fVitNwXGUqf7CD+Q==
X-Google-Smtp-Source: AMsMyM6zHeMHrlIuqY4/28l8FLxG/78F98uMeprX3YAgBNuR2l6PU1cveCKQz16copA4pZIFLZZisw==
X-Received: by 2002:a2e:940f:0:b0:261:b9ca:6207 with SMTP id i15-20020a2e940f000000b00261b9ca6207mr955616ljh.192.1663846920252;
        Thu, 22 Sep 2022 04:42:00 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id d2-20020a056512368200b00494a603953dsm902628lfs.89.2022.09.22.04.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 04:41:59 -0700 (PDT)
Message-ID: <4841c705-0944-9e94-1ade-47ad2f462303@linaro.org>
Date:   Thu, 22 Sep 2022 13:41:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v7 04/12] dt-bindings: display/msm: move common DPU
 properties to dpu-common.yaml
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
 <20220915133742.115218-5-dmitry.baryshkov@linaro.org>
 <2c7769ae-79af-dab5-ebe3-31ccca0bd9a4@linaro.org>
 <CAA8EJppRdrfy5vPuLxH0+=DAELdadK4h6X0xmHA01rySoBFN7g@mail.gmail.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAA8EJppRdrfy5vPuLxH0+=DAELdadK4h6X0xmHA01rySoBFN7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/09/2022 09:50, Dmitry Baryshkov wrote:
> On Thu, 22 Sept 2022 at 10:02, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 15/09/2022 15:37, Dmitry Baryshkov wrote:
>>> Move properties common to all DPU DT nodes to the dpu-common.yaml.
>>>
>>> Note, this removes description of individual DPU port@ nodes. However
>>> such definitions add no additional value. The reg values do not
>>> correspond to hardware INTF indices. The driver discovers and binds
>>> these ports not paying any care for the order of these items. Thus just
>>> leave the reference to graph.yaml#/properties/ports and the description.
>>
>> This is okay, but you loose required:ports@[01].
> 
> This is fine for me. The ports do not have 1:1 correspondence to
> intfs. Usually platforms add ports as new sinks are added. For example
> a platform can start with a single DSI node and later get second DSI,
> DP, eDP, etc. as they are receiving support/required by end-user
> devices.

Then at least port@0 would be required. Node without ports does not look
correct.

Best regards,
Krzysztof

