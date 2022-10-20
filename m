Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2208606B6D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Oct 2022 00:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbiJTWo4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Oct 2022 18:44:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230152AbiJTWol (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Oct 2022 18:44:41 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64CE6CE2A
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Oct 2022 15:44:23 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id x15so712443qvp.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Oct 2022 15:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QUNEnkUVOtrIsNl0Nn0NKbwDCPKMSvaAN/1K8+cyLSY=;
        b=r2d2QkHovGMl1Zem1CpccoVHttUcwvFlTg0rirAmDiVERKbjrrgzo4/UfSzYprr9Kk
         PW0hUb7ntj65mtKNnz65qkJ4i/VBYdwwA+ZaFCoyRPGvN6/yKGRmTDZNNlHjfIxX8LSK
         XAyapw2XJcjeH57uFDTkRx7rnLSZwiyArnTkKipxfdrCSwf90tRfi3OSo6pNv73LVJ4H
         3qZS4kGUdgX9VVVjQTN8umKghN8OiG38BFVYRvprmAslCnrkBMbIKNSsnFyQ1k92q7Ee
         iD2GaHrVmWb1BAY7Pag8Yg6ChA3vibFLwZ5KAW/XKSdAlMdmK2CVCDhTo/3r79pVXKgq
         ddVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QUNEnkUVOtrIsNl0Nn0NKbwDCPKMSvaAN/1K8+cyLSY=;
        b=WgaKOaaxO+MFhtFgBEI8j5m3VKFWNKa+IpnWAXSZulSXPc7cg4Mw5GnDKsAWnWHBmR
         ZlSmUObQcZ71Ud3Z7KWT/9ORsGRquM6ArPSD95rtiSMuxEIDNyYevitvrjPtRpF9KQkd
         pyTjCKauGqKWAZhoEYcwKNoCPkmlgllx8C1RUclyW5AA8/GsZihRx2mcX0dyrX80xJuv
         YOWGxWObcPCYMcl6u9meu0qWB/7sfrGXl2xw2ZprSiFeSnvMw2akRD4OhKa3On+Uk4gx
         +1GvTqn2/L+CjZyqB3FCe2az8XOgu2YLk04b26hwzPG9tVGmCeSatKhwseVLBOg6ee4g
         FN1w==
X-Gm-Message-State: ACrzQf297Fib10Zysr/OA/De087ylCLxs8oUN9rxWtwg1mv/3BAfax/y
        +MzMRlqaNL98/vKvyf/fUkSOaA==
X-Google-Smtp-Source: AMsMyM5nSoTED+lWd7YlYhQDXH09NsprD8SDwk/FXfeSS5sTtNCuOPFK21N2b1/JUvVl1ah0z3kQ1g==
X-Received: by 2002:a05:6214:212e:b0:4b8:56d2:d0f5 with SMTP id r14-20020a056214212e00b004b856d2d0f5mr4805771qvc.4.1666305861749;
        Thu, 20 Oct 2022 15:44:21 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id do35-20020a05620a2b2300b006b95b0a714esm1280506qkb.17.2022.10.20.15.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Oct 2022 15:44:20 -0700 (PDT)
Message-ID: <d2f71dd3-bd0a-b85e-32d6-5bb6411442bb@linaro.org>
Date:   Thu, 20 Oct 2022 18:44:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sc7180: align TLMM pin
 configuration with DT schema
To:     Doug Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221019001351.1630089-1-krzysztof.kozlowski@linaro.org>
 <20221019001351.1630089-4-krzysztof.kozlowski@linaro.org>
 <CAD=FV=VsFbei4h_cwhJhReUi8Pk_C-qHu_8iDqfzf_e=C8QnXg@mail.gmail.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAD=FV=VsFbei4h_cwhJhReUi8Pk_C-qHu_8iDqfzf_e=C8QnXg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/10/2022 11:48, Doug Anderson wrote:
>>  .../dts/qcom/sc7180-trogdor-wormdingler.dtsi  |  72 +-
>>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  | 629 +++++++-----------
>>  arch/arm64/boot/dts/qcom/sc7180.dtsi          | 597 +++++++++--------
>>  18 files changed, 776 insertions(+), 1137 deletions(-)
> 
> You probably should send a v4 since this now conflicts with commit
> c24c9d53e001 ("arm64: dts: qcom: correct white-space before {"), which
> has landed.
> 

Indeed.

> In any case, this looks nice to me.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 
> FWIW I put this on a sc7180-trogdor-coachz and the device booted up to
> the browser. I didn't do massive amounts of tests, but I'm OK with:
> 
> Tested-by: Douglas Anderson <dianders@chromium.org>

Thanks!

Best regards,
Krzysztof

