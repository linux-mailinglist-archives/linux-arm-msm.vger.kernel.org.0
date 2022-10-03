Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7655B5F3396
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 18:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbiJCQaY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 12:30:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbiJCQaQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 12:30:16 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94BA915FE1
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Oct 2022 09:30:14 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 130-20020a1c0288000000b003b494ffc00bso8837167wmc.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Oct 2022 09:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=VCtA5gFZ0/mQDLBkx2bO7vp98n9XBfShLZr792bmy68=;
        b=pQVwj+W3/ojdIUYDtplX6HC9FGZV5ot8htzg7BkEQuEC19j8obh8BY5G1YlS2+r4vt
         BdHt4FwUIO3gbRfnfplnWPhcQ81BRWw2UjcThYUXNEzEokWPs9SS7tjH+XZFS0AKCTAd
         qXglh6xHPzJrEz44e7m2q7fe2r8rDR2oUm1dm3PdY2osNtg1mxq4KtyyRsEjHx8zryIW
         0BNGBdfRyE3G18H/PHrQ33Nx2brxcd7SYCSpPoFd1Q6o4w5Hs1mKROGKArjWjtOrLtL2
         U6Onbcw2gzQRjjhl5Zgg74keaC5NezR4jW7enJHnMDIbI9nZVqityyvbA7o8cofAnXHi
         Rf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=VCtA5gFZ0/mQDLBkx2bO7vp98n9XBfShLZr792bmy68=;
        b=3zruE4e0ijFMAlspIAirzzEh9CNsS4w/YD30aq6ALHc7FIwvu4u/Y7HUoW9OL5Wdpg
         twNYz+tXDxjW3MPY28X89gSdQ6NG2yt8GowG4PQvXCjPYakTojgSkItQdoYe7/q1XiJn
         u9gLYWIi5CRY8rmdkN0pNDvTSD5qD2QV9eTWMpLZWbwra7zwCn/mC3MwZtDogB/YIJJ9
         QwHDxQyBkvKwSDCPVSW8mvE68OXnDUnm+VFO0rorGIPqVbNudQYrYOWk6CXeUTq4uiHL
         fUDB2EK7w6lHZDuRomVyof+/MTbRVvxW2it3lTCEt8f/kAPcxAPvIFhrUUwclgxMrecv
         gDDw==
X-Gm-Message-State: ACrzQf3h5iNWELWEK0t6+eb2+Py5b0BbMbhE/AraLLsVUWOMm0De+p3v
        lMQHrMpgShwKEkyzDDLAO1o7gN5t0KUWOn/W
X-Google-Smtp-Source: AMsMyM7XZJW1fL7JtQnPfeVIsNG402sl+Pzl0lDyEAcAvvSAdN/CfBX0HOjCNPlTqhJW0lPbtilrRg==
X-Received: by 2002:a05:600c:524b:b0:3b4:8c0c:f3b6 with SMTP id fc11-20020a05600c524b00b003b48c0cf3b6mr7750194wmb.50.1664814613806;
        Mon, 03 Oct 2022 09:30:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:9da7:1217:d35f:d7cf? ([2a01:e0a:982:cbb0:9da7:1217:d35f:d7cf])
        by smtp.gmail.com with ESMTPSA id h6-20020adfe986000000b0022cd6e852a2sm12540263wrm.45.2022.10.03.09.30.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 09:30:13 -0700 (PDT)
Message-ID: <e3249cfa-3331-ad91-79c9-c22ffc826f83@linaro.org>
Date:   Mon, 3 Oct 2022 18:30:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 06/23] ARM: dts: qcom: apq8064-flo: use labels to patch
 device tree
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
 <20220930185236.867655-7-dmitry.baryshkov@linaro.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220930185236.867655-7-dmitry.baryshkov@linaro.org>
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
>   .../boot/dts/qcom-apq8064-asus-nexus7-flo.dts | 521 +++++++++---------
>   1 file changed, 255 insertions(+), 266 deletions(-)
> 

<snip>

Quite hard to read, but not sure if it can't be done any better...


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
