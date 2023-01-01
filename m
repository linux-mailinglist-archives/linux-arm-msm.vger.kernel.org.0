Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 110DF65AB08
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Jan 2023 19:54:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbjAASy2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 Jan 2023 13:54:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjAASy1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 Jan 2023 13:54:27 -0500
Received: from amity.mint.lgbt (vmi888983.contaboserver.net [149.102.157.145])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6329C2BC8
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 Jan 2023 10:54:26 -0800 (PST)
Received: from amity.mint.lgbt (mx.mint.lgbt [127.0.0.1])
        by amity.mint.lgbt (Postfix) with ESMTP id 4NlSpS689dz1S5BQ
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 Jan 2023 13:54:24 -0500 (EST)
Authentication-Results: amity.mint.lgbt (amavisd-new);
        dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
        header.d=mint.lgbt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mint.lgbt; h=
        content-transfer-encoding:content-type:in-reply-to:subject:from
        :references:to:content-language:user-agent:mime-version:date
        :message-id; s=dkim; t=1672599263; x=1673463264; bh=aHoMEFVYcc5h
        zi9Wovp2SCXPkQhWsvSGGsCRhogEuRM=; b=m7FZcQiV30eIZEuZOVc+yrgmjU97
        WCZnkX8p0IJj4XIXqKJupdJqUOK1crZf3aerp3j80Z4a7N/ATs9CogBmmNGLOVId
        ZyqCfAPWZKF7iiX06wtBELEpNS5e5X/ds2Ovsl1DIVyTieekfNvpVa0qJe5X4Ss2
        rukKqgJ00CxUfCHuSK/aezU0zTjA4xh1+ClHC2CDfK3BaHgMbGVcHQmduZwFw9hC
        iEelZf+GY05sLZm9A6v8U19qkc5/or3ehBky1bLV+3fYvOmY9XOOy5cApgAidwqQ
        pGkXp2eIl9r9nLOpnoCOTDQKtWyjrU84xSIl6UedtI5C5SiTDoRTQcDDWA==
X-Virus-Scanned: amavisd-new at amity.mint.lgbt
Received: from amity.mint.lgbt ([127.0.0.1])
        by amity.mint.lgbt (amity.mint.lgbt [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id Pm2tes-TaE2L for <linux-arm-msm@vger.kernel.org>;
        Sun,  1 Jan 2023 13:54:23 -0500 (EST)
Received: from [192.168.4.25] (unknown [190.196.92.66])
        by amity.mint.lgbt (Postfix) with ESMTPSA id 4NlSpM0GkHz1S52G;
        Sun,  1 Jan 2023 13:54:18 -0500 (EST)
Message-ID: <42958395-7e91-b7ed-c623-286f4c38c829@mint.lgbt>
Date:   Sun, 1 Jan 2023 15:54:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To:     Martin Botka <martin.botka@somainline.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        marijn.suijten@somainline.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221231222420.75233-1-they@mint.lgbt>
 <20221231222420.75233-6-they@mint.lgbt> <942SNR.IMR405HRPE6J@somainline.org>
From:   Lux Aliaga <they@mint.lgbt>
Subject: Re: [PATCH v5 5/6] dt-bindings: arm: qcom: Document
 xiaomi,laurel-sprout board
In-Reply-To: <942SNR.IMR405HRPE6J@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 31/12/2022 19:50, Martin Botka wrote:
>
>
> On Sat, Dec 31 2022 at 07:24:19 PM -03:00:00, Lux Aliaga=20
> <they@mint.lgbt> wrote:
>> Document the Xiaomi Mi A3 (xiaomi-laurel-sprout) smartphone which is
>> based on the Snapdragon 665 SoC.
>>
>> Signed-off-by: Lux Aliaga <they@mint.lgbt>
>> ---
>> =C2=A0Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>> =C2=A01 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml=20
>> b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index 27063a045bd0..4923dafb5d7a 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -793,6 +793,7 @@ properties:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - sony,pdx201
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 - xiaomi,laurel-sprout
> From what i can see laurel_sprout is the correct and official codename=20
> for the device.
>
> Not sure here at all but should we maybe use that as it is the=20
> official codename ?
>
> -Martin
I defined it as shown due to the following comment.=20
https://lore.kernel.org/linux-devicetree/c4bf26a4-16bb-6ed8-ae70-1947998e=
32cc@linaro.org/

--=20
Lux Aliaga
https://nixgoat.me/

