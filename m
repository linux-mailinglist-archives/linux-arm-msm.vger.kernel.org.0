Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D10B5E5BC1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 09:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230011AbiIVHCM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 03:02:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbiIVHCL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 03:02:11 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A37686FE5
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 00:02:10 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id a3so13098207lfk.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 00:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=pdMpDMokcwVOJqnQpimhWe/RXCV/4GAZ3Xwilz2fB5Y=;
        b=lWG2vlw+HbUs+e4cvoL4X3kEe1EFLH5TjKPiwExcWmnMPfiIopTwlJqZNIMzg7o+Tw
         2z6cLr92oF7Z8T3wkLCnr8RVdE2aCCGe3lgWuGOiAHMBiSnqgEha2GEgiUjl2lsIRu61
         rW90vZkvZXvZi3txZ9GsJWn5tZ0Ijwlgi42DoojriprBGeAt1nB8gLyUehi+vNKZ8Cs6
         5271ZZmBVxC8mcg+iKzX3ukrzFrIPbIaqUoHFYykNamYQWTmyjJIkiqUBFVUtSLF70pf
         YUWANbIboMHHpG1kTavvGtY32fHWijbJdB6qGRze/eG8dGKZH1MqMXriKZid+ESjI3tG
         vZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=pdMpDMokcwVOJqnQpimhWe/RXCV/4GAZ3Xwilz2fB5Y=;
        b=LKyrc5D6LZmZG3TfyvuV64WHkry9HStC8Bu7XvUy9BiGg//bKsersUvxFMMnz9s1hg
         enwRP3YwJY20QlQA0w+iElI9DAdXDyBISIhfBtF4XmqL/JcOT5HVeornVsDO84+oXsah
         DZNIFJhh2XEzr9duzD1n2WdR6pVC+ipocBhdLJz5lcPe5gWGeAlJ5omz0O4PVeL7AnUS
         wZD5GUXXZTPYwNvLhyXtj9QpQDmyCpxyvg/LlrxhBFvu7mQqiwWM4a0v2/NJsKY0fGgq
         uMBKGN2rH9t1/4SpQafdzeG5KT97UvzLPnrd/MCyoo1RT481Bf/juNX4yB+hKap4yPM/
         8sKQ==
X-Gm-Message-State: ACrzQf2U4sP1abkw3kQ/R9ZKYugbuBnisx/oiUYUTGdzhc9iKgrmdERS
        mTtrzYBbkoMnmfTrVFrAPAMw7A==
X-Google-Smtp-Source: AMsMyM6CpVDXap4dA+dZGTLSih1+Z+piapgXEG1uJt14bvEIdGHamdIEjDjUC/yehg0wh2pWuZD+gg==
X-Received: by 2002:ac2:4ecd:0:b0:49b:ecd4:2d1a with SMTP id p13-20020ac24ecd000000b0049becd42d1amr644439lfr.528.1663830128400;
        Thu, 22 Sep 2022 00:02:08 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b10-20020a2eb90a000000b00261d619fb16sm757257ljb.82.2022.09.22.00.02.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 00:02:07 -0700 (PDT)
Message-ID: <2c7769ae-79af-dab5-ebe3-31ccca0bd9a4@linaro.org>
Date:   Thu, 22 Sep 2022 09:02:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v7 04/12] dt-bindings: display/msm: move common DPU
 properties to dpu-common.yaml
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
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
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
 <20220915133742.115218-5-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220915133742.115218-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/09/2022 15:37, Dmitry Baryshkov wrote:
> Move properties common to all DPU DT nodes to the dpu-common.yaml.
> 
> Note, this removes description of individual DPU port@ nodes. However
> such definitions add no additional value. The reg values do not
> correspond to hardware INTF indices. The driver discovers and binds
> these ports not paying any care for the order of these items. Thus just
> leave the reference to graph.yaml#/properties/ports and the description.

This is okay, but you loose required:ports@[01].

Best regards,
Krzysztof

