Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86FE2529DFD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 May 2022 11:28:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233214AbiEQJ20 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 May 2022 05:28:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244794AbiEQJ1o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 May 2022 05:27:44 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89E703615E
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 May 2022 02:27:42 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id er5so8051794edb.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 May 2022 02:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=+Bea/1kwLPLMANr+6NgNy10zL15qCdn8qnw++x3HnA0=;
        b=xxLnCXUtEW5fxRgMioDY8NGbWM9/b6UlHcv6nb802IcZMqXMZnlsH7sTGmYs4jsctE
         xW49eFdgQrsXgFx7PlGWtCuNZcRGs3ZL9uWiBSYncRqIJKerZUZqANnLcM3I8W+8Yaqj
         NZeycqJAJWo3Tzu16FCKekXrJhffsOyltk5OYNTJxO2jERiswpdGmtqUSgmRhnv36DLU
         UWYVfm/b9+ipT06qw2JU8WFEeATDOMbPZ7sLmcwDuzO6mWi82XEkeeJmY9XRbIhqmuyE
         hYDGcwrp84Xf8Yh2IjL3XAUYzRJRXcneS3OEpIlTulw3YNRoyv/LE6gWoZJP5UPAq9b8
         Arxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+Bea/1kwLPLMANr+6NgNy10zL15qCdn8qnw++x3HnA0=;
        b=bOJvA7mY9gBBnCXsSNFOkGC/o/OCZ7uKan/Xg/OsNNTj2MlLY2yq+Gr8VlEJF0t94N
         rVDuMe2r+WmEj3oaHfLYIBr1jnBHY3f073kguJt4lJDmAAGQpgfAZ4MlOq3TI3aEuJNq
         Pjq6Vn17G0U1a25CbDudFVJuSn+XJw5V0EV0vLi8F6FDXSS3Hy2u+cxrbWTWtafrss+I
         A64e7hEhLAwNEftXWF4m3YFRsM0DXVWkLYYF+AAT6EutFUJNc7Q+Cj2FMxSCQTN3G95R
         VN0y5/gxNM/hWHqDSosTHAO11dMgHxsN5dSkWoeghYcEcKGGkAtAk1X38pVALzkI6BTS
         xU3A==
X-Gm-Message-State: AOAM530YsgsCVK9kunJG7lfo1yWJ6t/ICmRo3Y7tuwgoHYcestdn53tK
        zLA7kJe9D/FnZzhgkXs82ve39w==
X-Google-Smtp-Source: ABdhPJxkK6D609wnZyhOBBPss88JqHb2/WL6V+Dfu3UdhY5WiudqXoWhoDjLezs3xugslmugvV3ttw==
X-Received: by 2002:aa7:d8c2:0:b0:42a:b9fa:bad8 with SMTP id k2-20020aa7d8c2000000b0042ab9fabad8mr7136657eds.304.1652779661183;
        Tue, 17 May 2022 02:27:41 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id mm8-20020a170906cc4800b006f3ef214df0sm807181ejb.86.2022.05.17.02.27.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 May 2022 02:27:40 -0700 (PDT)
Message-ID: <3bdb65cd-cdad-6e10-c921-5ec3a9b4c9dd@linaro.org>
Date:   Tue, 17 May 2022 11:27:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 00/13] dt-bindings/arm64: dts: qcom: minor cleanups with
 DT schema
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>, arm-soc <soc@kernel.org>
References: <20220504131923.214367-1-krzysztof.kozlowski@linaro.org>
 <CAMuHMdVc3kShpp8wieX1SSA8-37m8PbxpqKRs5+gxz8Dm6QwsA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMuHMdVc3kShpp8wieX1SSA8-37m8PbxpqKRs5+gxz8Dm6QwsA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/05/2022 11:19, Geert Uytterhoeven wrote:
> On Wed, May 4, 2022 at 5:13 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>> The patches are independent, so they can be picked up as is (or everything
>> through Qualcomm SoC tree).
>>
>> Best regards,
>> Krzysztof
>>
>> Krzysztof Kozlowski (13):
>>   dt-bindings: soc: qcom: aoss: document qcom,sm8450-aoss-qmp
>>   dt-bindings: soc: qcom: qcom,smd-rpm: add power-controller
>>   dt-bindings: usb: qcom,dwc3: add IPQ8074, MSM8994, QCS404 and SM6125
>>   dt-bindings: usb: qcom,dwc3: fix clock matching
>>   arm64: dts: qcom: add missing AOSS QMP compatible fallback
>>   arm64: dts: qcom: correct DWC3 node names and unit addresses
>>   arm64: dts: qcom: ipq8074: add dedicated qcom,ipq8074-dwc3 compatible
>>   arm64: dts: qcom: msm8994: add dedicated qcom,msm8994-dwc3 compatible
>>   arm64: dts: qcom: sm6125: add dedicated qcom,sm6125-dwc3 compatible
>>   arm64: dts: qcom: qcs404: add dedicated qcom,qcs404-dwc3 compatible
>>   arm64: dts: qcom: msm8996: add clock-names to DWC3 USB node
>>   arm64: dts: qcom: align DWC3 USB clocks with DT schema
>>   arm64: dts: qcom: align DWC3 USB interrupts with DT schema
> 
> Looks like all but the first two were applied to usb-next by Greg,
> causing conflicts with the soc/for-next tree.

Also this one was not applied:
arm64: dts: qcom: add missing AOSS QMP compatible fallback

However I did not get any conflict message...

The DTS patches should not go via Greg's tree. They are sent together so
there will be no warnings from Rob's bot. This is a common practice for
dt-binding fixes.

Bjorn,
Any preference from you? Shall I send missing three patches to you?

What about conflicts with Greg's tree?


Best regards,
Krzysztof
