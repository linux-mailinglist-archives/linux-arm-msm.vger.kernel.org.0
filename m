Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A5676DB130
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Apr 2023 19:09:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbjDGRJc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Apr 2023 13:09:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbjDGRJb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Apr 2023 13:09:31 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAE8DBDE8
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Apr 2023 10:09:26 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id x20so44059216ljq.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Apr 2023 10:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680887365;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4xyUWfXyMMPgjIproT3mrxpHgzbKdCij1om3mnhGRPI=;
        b=ECgnPES1OxSMsiPGqZK+rOIH/9tCTBpTsmIoYaUMSiGPIPyiUXV2J43MDDVkKC/vDC
         fWCtwtpaoNFG6PZxjwPr+Zrwt+XJTAkSgiI2H7VLf0bw1/EiWxLcbunNh+Mj0PIegpyg
         S+N9cr/XyiKFiltg8zR0nf2YVu6AWCd+j1PRPIxw/elPjXKuc/PvASqZNbmbyZwBkARD
         FmAaFxK7lMJVjUMI5uKAFSHgwEq6WUVBQU9z2cmhvq48h1Rx8cXYoxbgPkdL1lqdSscv
         4QlTGGXOUdokaCWeR4GmiUCbTTqzMHdGRdIABAGikJYOFK/qOjNIj0iX65txJPImy/Kz
         5Vfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680887365;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4xyUWfXyMMPgjIproT3mrxpHgzbKdCij1om3mnhGRPI=;
        b=JUqN7vSXHiIpJuwpKRyrLNlPtwQy8CNnqQjX6fUjQEQOJd5C4LgFrhejCE3hn1Zli4
         mLZD12SrQoebzYSuWxKd4Xfok01TcpbQJA+v1yeCGhPnm+dz9z+5HnAYk//Eh9iLYJ06
         vec8pKufYdjfsRBwr+UeHeGXnWlLaJ/qxwrKWYgbcHTzycZc184Oh+bVd2y7oWrLvgX0
         LaZMWwFp6ZCjYb4/1MQ0hz74KHzCrPmJAAykyYvF066Pe96KeSODwZtMCUZwKe0JHe7j
         iBvOZZVxpPBlCUEnp/nsvfbHdALtNc5vkJ8WIOuHdPl5qo1VlTq5SR+sg9/G6QwBSZRC
         2FAw==
X-Gm-Message-State: AAQBX9exI1j3JY04ayopb5qWnTSz1HTuGjyfDJRnuNaWL2mNmlqYnHL2
        g35DLxbCR1qMinPGmI2JogR7JQ==
X-Google-Smtp-Source: AKy350bRSSq9TGz8N4lhz2SOBIKBjbpdhMQzz5svg63vMhg0A430pVKtTBkVn7kc7FSyvUU5B3xbXg==
X-Received: by 2002:a2e:9195:0:b0:2a6:1681:81e0 with SMTP id f21-20020a2e9195000000b002a6168181e0mr720600ljg.2.1680887364792;
        Fri, 07 Apr 2023 10:09:24 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id t16-20020a2e9c50000000b0029d45b15338sm900258ljj.42.2023.04.07.10.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 10:09:24 -0700 (PDT)
Message-ID: <da2d90cf-1f36-7c59-7b29-ee98ab85f960@linaro.org>
Date:   Fri, 7 Apr 2023 20:09:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH] arm64: dts: qcom: add device tree for DB845c working
 in dual DSI mode
Content-Language: en-GB
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230118082048.2198715-1-dmitry.baryshkov@linaro.org>
 <20230118173242.cjh5izohjros6wxd@builder.lan>
 <DFBA966D-3AAF-4E6D-880C-897CB901AEE1@linaro.org>
 <20230407164833.2ws22rr4lu6g25dj@ripper>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230407164833.2ws22rr4lu6g25dj@ripper>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/04/2023 19:48, Bjorn Andersson wrote:
> On Wed, Jan 18, 2023 at 08:47:53PM +0200, Dmitry Baryshkov wrote:
>> 18 января 2023 г. 19:32:42 GMT+02:00, Bjorn Andersson <andersson@kernel.org> пишет:
>>> On Wed, Jan 18, 2023 at 10:20:48AM +0200, Dmitry Baryshkov wrote:
>>>> While we are testing the DB845c working in dual DSI mode (which is
>>>> required for the 4k support), create a separate device tree using this
>>>> configuration.
>>>>
>>>
>>> I don't think it's right to change the DTB on your device depending on
>>> your TV's ability to do 4k or not...
>>>
>>> I ran into this problem when playing around with 4k-support on the RB3
>>> as well a while back. I was not able to figure out a way to run the
>>> lt9611 off two inputs for the lower resolutions and ended never posted
>>> anything because I couldn't come up with any good solution.
>>
>>
>> This is implemented with the latest lt9611 patchset, referenced in the patch annotation.
>>
>> I posted this as an RFC with the separate dts to let people test dual DSI, DPU wide planes, etc. and to compare that with plain old single link DSI/lt9611.
>>
>>>
>>>
>>> Would it be possible somehow to describe the two ports in DT, but have
>>> the display driver use one or both depending on the number of inputs
>>> needed by the lt9611?
>>
>> This would be very problemsome. Even switching the number of lanes
>> goes against the standard and is not supported by Linux kernel.
>> Supporting switching the host off and on would be a real troublle.
>>
> 
> Does this imply that switching resolution in runtime is not possible for
> any of these DSI->HDMI/DP/eDP bridges?
> 
> The immediate worry is that we need 4k and non-4k variants of every
> mezzanine (unless we start doing overlays). But beyond that I still
> don't like the fact that you need to change firmware depending on which
> monitor/TV you're going to connect the board to. (And with the current
> boot.img-based design, this is overly cumbersome)
No. With the latest lt9611 driver and with the current msm/msm-next it 
should not be necessary to have a separate dtsi. I submitted this patch 
as an RFC to let people compare 2xDSI vs single-link cases. Currently 
I'm happy with the way it works, so I can probably send this as a patch 
to main sdm845-db845c.dtb.

As a background info:
- lt9611 driver can utilize either one or two DSI links
- drm/msm can output 4k over two DSI links in bonded mode.
- drm/msm will still utilize two DSI links for smaller resolutions 
(switching between single and bonded DSI modes doesn't seem practical).
- If just one DSI link is supplied, 1080p is the maximum resolution that 
can be supported.


> Regards,
> Bjorn
> 
>> Hopefully, this is is not necessary.
>>
>>>
>>> Regards,
>>> Bjorn
>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>
>>>> Dependencies to be able to verify the 4k@30 mode:
>>>> [1] https://lore.kernel.org/linux-arm-msm/20221229191856.3508092-1-dmitry.baryshkov@linaro.org/
>>>> [2] https://lore.kernel.org/dri-devel/20230118081658.2198520-1-dmitry.baryshkov@linaro.org/
>>>>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/Makefile             |  1 +
>>>>   .../boot/dts/qcom/sdm845-db845c-dual-dsi.dts  | 48 +++++++++++++++++++
>>>>   2 files changed, 49 insertions(+)
>>>>   create mode 100644 arch/arm64/boot/dts/qcom/sdm845-db845c-dual-dsi.dts
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>>>> index 3e79496292e7..dc55c3b989a4 100644
>>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>>> @@ -139,6 +139,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r1.dtb
>>>>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r2.dtb
>>>>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r3.dtb
>>>>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
>>>> +dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c-dual-dsi.dtb
>>>>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c-navigation-mezzanine.dtb
>>>>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyln.dtb
>>>>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyp.dtb
>>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c-dual-dsi.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c-dual-dsi.dts
>>>> new file mode 100644
>>>> index 000000000000..4a366dedc841
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-dual-dsi.dts
>>>> @@ -0,0 +1,48 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * Copyright (c) 2023, Linaro Ltd.
>>>> + */
>>>> +
>>>> +#include "sdm845-db845c.dts"
>>>> +
>>>> +&dsi0 {
>>>> +	qcom,dual-dsi-mode;
>>>> +	qcom,master-dsi;
>>>> +};
>>>> +
>>>> +&dsi1 {
>>>> +	vdda-supply = <&vreg_l26a_1p2>;
>>>> +
>>>> +	qcom,dual-dsi-mode;
>>>> +
>>>> +	/* DSI1 is slave, so use DSI0 clocks */
>>>> +	assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
>>>> +
>>>> +	status = "okay";
>>>> +
>>>> +	ports {
>>>> +		port@1 {
>>>> +			endpoint {
>>>> +				remote-endpoint = <&lt9611_b>;
>>>> +				data-lanes = <0 1 2 3>;
>>>> +			};
>>>> +		};
>>>> +	};
>>>> +};
>>>> +
>>>> +&dsi1_phy {
>>>> +	vdds-supply = <&vreg_l1a_0p875>;
>>>> +	status = "okay";
>>>> +};
>>>> +
>>>> +&lt9611_codec {
>>>> +	ports {
>>>> +		port@1 {
>>>> +			reg = <1>;
>>>> +
>>>> +			lt9611_b: endpoint {
>>>> +				remote-endpoint = <&dsi1_out>;
>>>> +			};
>>>> +		};
>>>> +	};
>>>> +};
>>>> -- 
>>>> 2.39.0
>>>>
>>

-- 
With best wishes
Dmitry

