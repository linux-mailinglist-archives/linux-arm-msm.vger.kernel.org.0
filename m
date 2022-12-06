Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13C12644E89
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Dec 2022 23:27:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbiLFW1W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 17:27:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbiLFW1V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 17:27:21 -0500
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2682330577;
        Tue,  6 Dec 2022 14:27:21 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id g20so3576193iob.2;
        Tue, 06 Dec 2022 14:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5k0kbswEjedZJoi8bKEhjtoQup280Buy1WzzavyXZO4=;
        b=fzbJofeKdbRleEVJWRjEMzLm2MzIC+yTJ/4+1Tu8Mizsj9XncsYpokV0EyTLYL2syH
         qcZIr1X/ZGoZKbJfoL/VPi0TbaVthDOhQsUDtVW/vNf3xKp74cSwrY2R0hP/SyWw+rPj
         XQA1t8xN7dExJrutLlhmb3uCm7nVl4nQqZT/oyc5aEF8s0H9LMRsi9wkIjNP/5DfLtxz
         vv4QERghHd3KnmiywAR+iobBqIUVo5Vf08bIrzUdDobnS0bxPsPY16QoDYucU9e6Yd2y
         6adn/seEpXuUeZPnyWJWUaSP5ZONeRLwmWckjpXaBXP0YI1ewfZtEI+jLcQYUyE0jYZZ
         b+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5k0kbswEjedZJoi8bKEhjtoQup280Buy1WzzavyXZO4=;
        b=t0GWz+EN/coJ73hy+Y+X45lvB4e0yS+OgIqXTS3F9y7TBh9NECiZoVPMtO9EgyPCgn
         DQZPQV+f5lTh3v/R/pn9TeD54YqINUCyZN/ynS8behn4WmT7ciyk+e8Yqqkhd9NnNrgx
         +kwzD3EFLMaOPXA+qf5lkui45zo2211JqJeVUU85R0QBLYx/7ZaqGy57iMJn91iu2Z79
         u8+zfW1xCfDiwnptOOt8RoGtEThPSIkUAleqtzdma7ZgfDkw60xxk5PnYK60S/k7PW6T
         MvRrs4j9c9qevJ5ErnkYf6JVfm45h96B7h/vvCVdHPQQdQQsyX0bzhutOrp5h4zXW27T
         TK7A==
X-Gm-Message-State: ANoB5pmcZX5dIZnTWF9/ErYrxa3DtvndPtgAWWdUBoz4OFHmfU+4jy8Q
        GifF6uZeZtFIPvsOjM8Um2dl2oVfb7A=
X-Google-Smtp-Source: AA0mqf52aqNu67ZqakIchavon6BX/478ZrKc/uMGl04r4kjIHURfvqVtPERiS0svx4X2pRqyXfxoRw==
X-Received: by 2002:a02:6a26:0:b0:389:d02c:7e4c with SMTP id l38-20020a026a26000000b00389d02c7e4cmr22837127jac.218.1670365640480;
        Tue, 06 Dec 2022 14:27:20 -0800 (PST)
Received: from localhost ([2607:fea8:a2df:3d00::32c2])
        by smtp.gmail.com with ESMTPSA id d39-20020a026067000000b00389e42ac620sm7110763jaf.129.2022.12.06.14.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 14:27:19 -0800 (PST)
Date:   Tue, 6 Dec 2022 17:27:17 -0500
From:   Richard Acayan <mailingradian@gmail.com>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sdm670: add qfprom node
Message-ID: <Y4/BxaesXpr7nnbF@radian>
References: <20221205230116.2204-1-mailingradian@gmail.com>
 <20221205230116.2204-2-mailingradian@gmail.com>
 <20221205232103.bz4ar3dbmocfl3yv@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221205232103.bz4ar3dbmocfl3yv@builder.lan>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 05, 2022 at 05:21:03PM -0600, Bjorn Andersson wrote:
> On Mon, Dec 05, 2022 at 06:01:15PM -0500, Richard Acayan wrote:
>> Some hardware quirks and capabilities can be determined by reading the
>> fuse-programmable read-only memory. Add the QFPROM node so consumers
>> know if they need to do anything extra to support the hardware.
>> 
>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sdm670.dtsi | 7 +++++++
>>  1 file changed, 7 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
>> index f93705bc549f..933ad2fabf3a 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
>> @@ -731,6 +731,13 @@ gcc: clock-controller@100000 {
>>  			#power-domain-cells = <1>;
>>  		};
>>  
>> +		qfprom: qfprom@780000 {
>> +			compatible = "qcom,sdm670-qfprom", "qcom,qfprom";
>> +			reg = <0 0x780000 0 0x1000>;
>
> I suspect the qfprom block is inherited from SDM845, if so 0x780000
> contains raw, uncorrected data, while 0x784000 contains ECC-corrected
> versions of these. Please validate and use the same.

I just compared the qusb2p_hstx_trim values at 0x7801eb and 0x7841eb and
this seems to be true. Will change in the next version.

>
> Also, please pad the address to 8 digits, to make it easier to check the
> sort order.

Ack.

>
> Thanks,
> Bjorn
>
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +		};
>> +
>>  		sdhc_1: mmc@7c4000 {
>>  			compatible = "qcom,sdm670-sdhci", "qcom,sdhci-msm-v5";
>>  			reg = <0 0x007c4000 0 0x1000>,
>> -- 
>> 2.38.1
>> 
