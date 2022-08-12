Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9E3C591199
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Aug 2022 15:34:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238967AbiHLNew (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Aug 2022 09:34:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238957AbiHLNev (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Aug 2022 09:34:51 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4DF09DFBA
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Aug 2022 06:34:48 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id o2so1391023lfb.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Aug 2022 06:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=BZWPu5Gd//RL+Fh9taZwYOP97Z5i1BsHH/FWdANRQTQ=;
        b=zQz2gZCK/5ZJh9ivkAAuyGjG4hCSJBu7jU5wR5UXWpCIdruZMgyn6VuTm1QqWh8x6h
         HasBqW0BJks2PPnztLww2524JDH1d7jjoeGsvxikXYxJYJFjk8BIfrhBpfjGxpZK/M9c
         i/XHY2xZVnfl3MUBoRVQ93hjGX176jC+gF8hAmvbNaq8yR1l4ibEIM4tQ0LuMQYZ3Av6
         C2mARZuJz1sjPhoFQTQMRAfzR9vvJdrVu8rXsT7aBemuKm+iY2DRz94VkQFi0ogfgfQX
         2TuTBSeSVjWH98xo6xxXmr1B5FGooSs1InWSlqWPzlK/wUQNfApOMUurC8nSP8DIpW7X
         UTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=BZWPu5Gd//RL+Fh9taZwYOP97Z5i1BsHH/FWdANRQTQ=;
        b=sSekrG1hZXGW7xAHcDvlyHimI3Hv9YC2OmxYw/Wct1Ey+XgeEJznkVXs/yFsr7ugz8
         qIYll4SN0OV4GDSL2dADTY/8CNU6/Fr3oAFegIFSzvILbZdtqnmrrDzPLLMhU/ZwnK9z
         HRCAOBi54IwFI9uZ0i+rFeDXRgiEe8v5tG8cpmFioSt7oxuJ92OaDARtgXmEMZPhtfNY
         tG/uMFpARrxuY3yXTISRMDhwG+aprAw3bUzV4CgPCJx9GFLeYgyYDP7eEHTEmZPuRQzn
         bkx1lOCWmoJJxLJtiWKPf+jjfr7PHCwBlsueQB+btE+nkgkmVh0nMpckpuMlzDZiCdax
         wNHA==
X-Gm-Message-State: ACgBeo3skw2CoEHj+k/mfroYm8Bn6HM61sGO5v44qY645ic0CZjiw60G
        My75jZK61CxaDjMN55lXF+nRmg==
X-Google-Smtp-Source: AA6agR58fBX3co0zBUriZQcv0W0Vcn+Jz7pblBOBdMET79vrEFBlHlAawrlSdkJOdpXfFE+cQE60vw==
X-Received: by 2002:a19:f505:0:b0:48b:2bfb:9a99 with SMTP id j5-20020a19f505000000b0048b2bfb9a99mr1201171lfb.101.1660311287068;
        Fri, 12 Aug 2022 06:34:47 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id s2-20020a056512202200b0048ae8e4cebdsm218224lfs.139.2022.08.12.06.34.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 06:34:46 -0700 (PDT)
Message-ID: <5ac47ae7-ab49-5413-e489-b8b5f053697a@linaro.org>
Date:   Fri, 12 Aug 2022 16:34:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: sm6350: Add interconnect support
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220525144404.200390-1-luca.weiss@fairphone.com>
 <20220525144404.200390-6-luca.weiss@fairphone.com>
 <CM41EUB650GB.YO1J30NYO5NU@otso>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CM41EUB650GB.YO1J30NYO5NU@otso>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/08/2022 15:09, Luca Weiss wrote:
> Hi Bjorn,
> 
> On Wed May 25, 2022 at 4:44 PM CEST, Luca Weiss wrote:
>> Add all the different NoC providers that are found in SM6350 and
>> populate different nodes that use the interconnect properties.
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> 
> The other patches (1-4) from this series have been merged into torvalds'
> repo already, so just this one is missing from 5.20/6.0.
> 
> Could you please pick it up for the next merge window if everything's
> alright with it?

It's still a merge window...

Best regards,
Krzysztof
