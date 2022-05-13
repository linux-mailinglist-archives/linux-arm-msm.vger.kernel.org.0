Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9421F525F2F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 12:08:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379134AbiEMJhT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 05:37:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379162AbiEMJhQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 05:37:16 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 692FA28C9C3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 02:37:14 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id h16so9952933wrb.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 02:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=LPeFc4kVcTNm4urAkRDIpRauCxNaO73GMMKzZ0JovMs=;
        b=im5D1li6iayjNq5cJbXexWNAdwbevtRT0YNi61YD5Dlb7O+v4d+zj1Uq9SpmE0WpsF
         zDtgfhR5K4BTl47cxta7rzqmnvmp6bDDI49DV/fmr/PQlV00wYyGEwyt78RGRfLFIKEf
         tpPiDTrQnqoo6WEuezuxWi6XWtBCDypmq/23Cbso3DdfxfXbijZ8KpRaAVt0n+NXPxvx
         PAACqWfJA0Djcoze1ircxojt62AINFqj6kyxIWhI5u+ndn33F/1mL2eKAP8GatwVdl9P
         /GvTgbRwH85LINuDvCYS+4V15Vu2Bfh+l0FrrIFukTKyi+Mab9I5tXcmVkTCdQEAOI0/
         66Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LPeFc4kVcTNm4urAkRDIpRauCxNaO73GMMKzZ0JovMs=;
        b=MLpDGisLz1CW27ZGWwYsd2Aly0zSsY5sZWMz4uKUFJyr/LYV/DzMpAdqN9/xTO7CUw
         w3eO3L3aEMZUh/jYRdo0Td1kk8oIaKZlYSJgAawk7QppZtZbIY7SD1uoZS4u7EjHTu9z
         m739itpQ741ScqkIi55OJeP83z8Nu/0r9W4Kn7KNE0P57JquW//h8ehOef8En1C1edsE
         y3IXRwb9+Ig66KooxpQAPpIGz9+8LXOVhz83PHeZs20ED4qCmTpyDOmKGrSWI8BA2MfL
         aanvBWUZiXmDHWcUE+nVEQxNxXLes3/uwDVIIQI6NiDP9FusWwMdntm5AFVBFmStsGFX
         532w==
X-Gm-Message-State: AOAM533mhLyWzRFNbn8VzEoeegltq32TAQR688akZ4CmcHASupeMochD
        3VsGiq8+W+th9Q4j7Hm4MInx3Q==
X-Google-Smtp-Source: ABdhPJwW3cU+uyE+Io9UlgPZ79ftGJYHlU0vLFfIIytqKHzkojl5dsNGL+ZhUq/QdL1OwweAvqQPzw==
X-Received: by 2002:a5d:6088:0:b0:20a:e81e:c76a with SMTP id w8-20020a5d6088000000b0020ae81ec76amr3138108wrt.182.1652434632703;
        Fri, 13 May 2022 02:37:12 -0700 (PDT)
Received: from [192.168.0.171] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id g2-20020adfa482000000b0020c5253d8dfsm1728148wrb.43.2022.05.13.02.37.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 May 2022 02:37:12 -0700 (PDT)
Message-ID: <5cce491d-c673-d2a6-3aae-79b2e5902a01@linaro.org>
Date:   Fri, 13 May 2022 11:37:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/7] dt-bindings: pinctrl: qcom-pmic-gpio: Add pm6125
 compatible
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220511220613.1015472-1-marijn.suijten@somainline.org>
 <20220511220613.1015472-3-marijn.suijten@somainline.org>
 <d2507298-00a6-a1cc-0302-f96597fb4127@linaro.org>
 <20220513091734.hivkkbpc6inyb4la@SoMainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220513091734.hivkkbpc6inyb4la@SoMainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/05/2022 11:17, Marijn Suijten wrote:
> On 2022-05-13 10:19:56, Krzysztof Kozlowski wrote:
>> On 12/05/2022 00:06, Marijn Suijten wrote:
>>> The pm6125 comes with 9 GPIOs, without holes.
>>>
>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>>
>> It's the first version, how did the tag appear here?
> 
> We are friends and review each-others patches offline before spamming
> the mailing list with them, to save readers and maintainers here from
> pointing out glaring mistakes.  I hope this is standard practice in
> companies too, or do you recommend aganst us doing this?

I personally recommend against it because I prefer public discussions.
Especially that such practice in some companies mean that tag is added
automatically, without actual review. There are some folks, from other
subsystems and architectures, which never publicly replied to anything
(so we don't know if they actually exist, what's their credibility,
knowledge, experience etc) but they appear on hundreds of reviews.

Other people don't mind this practice.

Anyway, it's not a stopper from anything, I was wondering.

> 
>>> ---
>>>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 2 ++
>>>  1 file changed, 2 insertions(+)
>>
>>
>> This will need fixups or rebasing on my sets of PMIC gpio schema cleanup:
> 
> Ack.
> 
>> https://lore.kernel.org/all/20220507194913.261121-1-krzysztof.kozlowski@linaro.org/
>> https://lore.kernel.org/all/20220508135932.132378-2-krzysztof.kozlowski@linaro.org/
>>
>> Bjorn,
>> let us know preferred order (who should rebase on who).
> 
> I prefer yours to be applied first, so that I can retest this
> patchseries with stricter / more correct dt-bindings introduced by it.
> My series can also be resent with the notice that it has already been
> rebased on top of your series, after collecting more reviews.  Where
> necessary, I can review your series too if that helps getting it in
> sooner.

Sounds good. It's in Bjorn's hands now. :)


Best regards,
Krzysztof
