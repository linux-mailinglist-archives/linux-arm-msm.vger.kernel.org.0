Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60AC657BD44
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Jul 2022 19:55:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237278AbiGTRzP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jul 2022 13:55:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237685AbiGTRzN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jul 2022 13:55:13 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 548106379
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jul 2022 10:55:12 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id z22so17905383lfu.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jul 2022 10:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=SbRJ4Pjfsm8LrOT/Xil2d+bMfNBGw/19k+yDI8UKBW8=;
        b=ZWqCQRfGBGBMunlhZpNm78e1j4poAYODmP81Ui+BrWqtTK///sr+A2CZUjpK0jMGV5
         PVM8su0HHmqBpGFmFcNVYqwQRtSm5Mqemx5b7wbiLiephByfm+Fq/2QpCxFmE4vgXsLO
         qHdQLsVfeZjnqKxT9X8+vmQ4iVKlRichL5JUB45JvpLeREN3+WADwM4n2yNHMwHboJwB
         gUXy36s/Yd+suWnu6EgBKzjuiUydIBdYDhouvJ6GFo5OYSm1a1ticXhvAABSAn1FOKGm
         7plPFpamXLstJabNU02Sx86oFlPcRQ5digRrN/sNJBBkcMuTWuhOY0t3uJ0iqF1mKO0x
         1Xkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=SbRJ4Pjfsm8LrOT/Xil2d+bMfNBGw/19k+yDI8UKBW8=;
        b=vzw2PoPySllVNNd/ImVyxjqvMdPuva916CAx7KWSBRzBTSO0LwktmGXTdXz20BVhT6
         lRJ6INFKqUL5zS7VDs5dP1wuNVE59knv0+16i2MjplPesS7GTW5m/QYEFnvfBGGctDkQ
         U9Sk0C2UzJsCKqJCPHR4p1tAyqHgh7UsS5x6G95cPIIX/fG917Vd34Ks016pH35VcODo
         4WNGM36nI5SbVrQGlNYF0Zuj1dz32CllOFT2XjnapaLa4yA/Sh+q6cMosExChULHqlUw
         VCB3KnIjZ/L3rjEA2lm1z7X3AqwRrdaU1ns3VVR7MgClpb3CFHXQ8bYv9FchggdZq2fj
         4g4A==
X-Gm-Message-State: AJIora/6ESesrnklNxDkULOlR0Bmw+tRodXvb8WFJI8ERXhRhnE/TXrv
        3ZjoKP/h3f1M1PWfZOnK0oVlTQ==
X-Google-Smtp-Source: AGRyM1sBHotd8BveUpOcwz+eBVh5w31a9LXZrwZ/UtTwD42US9+BLaYtcY9jEyZ6OFeBV4Kc7+PHew==
X-Received: by 2002:ac2:4a86:0:b0:489:c5eb:3403 with SMTP id l6-20020ac24a86000000b00489c5eb3403mr19763715lfp.603.1658339710742;
        Wed, 20 Jul 2022 10:55:10 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id g5-20020a2ea4a5000000b0025a885a135csm3341410ljm.119.2022.07.20.10.55.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 10:55:10 -0700 (PDT)
Message-ID: <acecf7a8-7bf1-718f-d990-54a10e92ba1f@linaro.org>
Date:   Wed, 20 Jul 2022 19:55:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] arm64: dts: qcom: Add SKU6 for
 sc7180-trogdor-pazquel-lte-parade
Content-Language: en-US
To:     Doug Anderson <dianders@chromium.org>
Cc:     Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Henry Sun <henrysun@google.com>,
        Bob Moragues <moragues@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <20220720025058.1.I5bfba8857ea0d43c747ecdc3a950875abd56927f@changeid>
 <7a04c9af-0ccb-7711-249f-73908fe7ec36@linaro.org>
 <CAD=FV=V1MqQzNxq_L8sGtu2JwAAL_FWKXkw9bhCHcD0DycFMUw@mail.gmail.com>
 <bcbca05e-2b75-a405-b1ea-21b276931a90@linaro.org>
 <CAD=FV=UEt4fcVaFvS8nr7Z0GNYM1T=mz7iUhwg+bBkWtbO4c1g@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAD=FV=UEt4fcVaFvS8nr7Z0GNYM1T=mz7iUhwg+bBkWtbO4c1g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/07/2022 19:53, Doug Anderson wrote:
> 
> Yeah. I guess it makes more sense with the background knowledge that
> the different SKUs are:
> 
> LTE with physical SIM _and_ eSIM
> LTE with only a physical SIM
> WiFi only
> 
> ...so both sku4 and sku6 are LTE SKUs. One has the eSIM stuffed and
> one doesn't. There is a single shared device tree for the two.

Above in commit msg would solve all my questions, I guess. :)


Best regards,
Krzysztof
