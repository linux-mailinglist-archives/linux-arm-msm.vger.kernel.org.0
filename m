Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90B2C691DE6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Feb 2023 12:14:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231986AbjBJLOt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 06:14:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231422AbjBJLOq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 06:14:46 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C62072DF5
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 03:14:19 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id cq19so1726612edb.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 03:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=70vAhiupv9yMZP8MYL4Z5/w//H8J/qCxdLW4cuPyvw0=;
        b=qPskg7Fj7rU+NU7n4p7TIQTEJndpAkFpdo0SbmruEACpogsZ0rYXAxXgSyokU/Txpp
         spBnuPfhJU9t++QvpoiQuP5qLr9Y4a1JaMLv2UVL+NNZvlsiHTGYRnxwZ4ukHsEHhPf8
         I5SiEyiVGZk5OWOIqenzzpQJ6SiTvG53ROLbw+cXI+/1HOLnszLA+UebhQLe8OVL6WqR
         wHWuVQmyVaWriN+g8KzPJKwlDRdOeIyEkG9TrybUuePAbmVN5TDCO3Cf0PKH3hmBsj0l
         2TE/Xz1Yogt8uQCXBOwdbuTNmwMpnY5jiWQVd2yg+NU2GuXEPpoVhATVj+Qw/fA28lmz
         vbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=70vAhiupv9yMZP8MYL4Z5/w//H8J/qCxdLW4cuPyvw0=;
        b=JOS5bN8nWZfhdtCaO3DkVbZ/pK1ioNA0ZcqcCUMvNTm9pwO/CrULjjCXvalyYg93zQ
         xy/7CMTKVxfduvH1Is0bL+qOnFG7c7OzABpVUCQ+hx3x8/sawadqS3rxx0nPHjrJ3QsO
         X/IXpupTsOqzRgyxPD78gXDQw6aP4aIh7PBXHDZRaZBPQKnmKEOOtd4XjisizC+XYUvI
         FOG9l/IF0oRwIuVKDn/0oyOzqyw22IgY/YHicY+I82ExdilssHzzCtRaBcssxoPUwpj4
         v9GsH//r7eIXUa8o1a2279oIIxPW2AkWP8CYtVSTdJY9BwAd+BC3hrF/boYFgfCVzl+R
         iVWQ==
X-Gm-Message-State: AO0yUKVA5xxUH5a/qM4eB0PyV5b6Do0QBn/4Ns9b5tofsC9gC1WA57WF
        fQ9CBMWduJaSL7VqqJgrqQTlKQ==
X-Google-Smtp-Source: AK7set9pBvN0pwFN96tQH7oqaWGerfjL7VFYX2nOqefHZBD3lRjXDpbMnRlqEpzqFh8TzUdwGorprg==
X-Received: by 2002:a50:9b0d:0:b0:4ab:ec2:3cd1 with SMTP id o13-20020a509b0d000000b004ab0ec23cd1mr8354037edi.25.1676027639960;
        Fri, 10 Feb 2023 03:13:59 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id u12-20020a50950c000000b004aac44175e7sm2033244eda.12.2023.02.10.03.13.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 03:13:59 -0800 (PST)
Message-ID: <84b657db-a129-fec2-2b67-32e125e116e9@linaro.org>
Date:   Fri, 10 Feb 2023 12:13:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 4/6] arm64: dts: qcom: sm8350: finish reordering nodes
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
 <20230209133839.762631-5-dmitry.baryshkov@linaro.org>
 <a8bb4bf1-c4b6-ff02-d2e6-1407900bb006@linaro.org>
 <7f85af25-efc5-6907-70ac-b264f110918d@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <7f85af25-efc5-6907-70ac-b264f110918d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10.02.2023 12:12, Dmitry Baryshkov wrote:
> On 10/02/2023 13:09, Konrad Dybcio wrote:
>>
>>
>> On 9.02.2023 14:38, Dmitry Baryshkov wrote:
>>> Finish reordering DT nodes by their address. Move PDC, tsens, AOSS,
>>> SRAM, SPMI and TLMM nodes to the proper position.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>> [...]
>>
>>> +                phys = <&mdss_dsi1_phy>;
>>> +
>>> +                #address-cells = <1>;
>>> +                #size-cells = <0>;
>>> +
>>> +                status = "disabled";
>>> +
>>> +                dsi1_opp_table: opp-table {
>>> +                    compatible = "operating-points-v2";
>>> +
>>> +                    /* TODO: opp-187500000 should work with
>>> +                     * &rpmhpd_opp_low_svs, but one some of
>>> +                     * sm8350_hdk boards reboot using this
>>> +                     * opp.
>>> +                     */
>> It's not a part of this patch, but an idea came into my
>> head.. could you check with socid that your HDK has an
>> 8350v2.1?
> 
> I checked with the bootloader instead, if you don't mind:
> 
> Platform Init  [ 2701] BDS
> UEFI Ver   : 6.0.210914.BOOT.MXF.1.0-00848-LAHAINA-1
> Platform           : HDK
> Subtype            : 0
> Boot Device        : UFS
> Chip Name          : SMP_LAHAINA
> Chip Ver           : 2.1
Hm okay, perhaps it was something else..

Konrad
> 
