Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07D54616D8B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 20:13:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbiKBTNJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 15:13:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbiKBTNF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 15:13:05 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6DD762CD
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 12:13:00 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id w10so13139884qvr.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 12:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1p7sc7+4NFU8EbWYkeZcuJ2Vy/AvX+BsVYOTXoz9mTc=;
        b=Etrwe0p+BCn44CB5PX1FA9H0f3+mZpSwYd30IXTyBwGWoZ5u+cLFJgqAFWQ8r6zKfB
         pl6K6tUDQY7NJSUzOJooL9ogMXiHbSWsPTW6p+2cbjG64+80L4aOOTeOthv30xk4wnjO
         jEyfXqsbRdwxm6uvZmCsh9ZF8hd4Ju9CIqmqIXKJDMwv1qgEmiKVImf+dsm/ZkGBPOZF
         BJRECDZrnIibRnJNDnwPdEt4NlTyL9CMUxoBp5gmZ/Dz77JOJNVPwrLl3bBiLD0iXhvt
         P1oXZeFYFAU/186CSp7LIbTErQk9tIA2vHtme5VKZmudS5UIVR4M7TwCvJV1APrU2jvG
         xEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1p7sc7+4NFU8EbWYkeZcuJ2Vy/AvX+BsVYOTXoz9mTc=;
        b=nJ1SrVhOcUmapEnJtPLuvJ4earZtjCWX66QC53BnWSSnRky96E2ZFfc7gn3rUdkK6o
         98jvBV1fGsaMuIBg8+Yr8tNKzMcNGgJKHznw+5NPaiRPmx0q6KPB4T949QJtl5p0glh0
         A2MRT/uyd0a4Hdn6qdPpqWjjQfmvr/z4eehux+CV4+H/ejRxv5DHxfgcueRNvvFcgRtS
         kqVwWxGmwva/zBuH6m4XK+/SPy4rVZrFgn9sVBFW1s78Cis4JKlQ1PvQpCpBdktWiR5a
         vRuWuWOAtdZwpGuONsXO9qNoXoxFnDLxzAOHTK0a399gCVY5paBvNd+eYRhkdkCPV1oT
         9V2Q==
X-Gm-Message-State: ACrzQf1DWyXfmt7waA8vNADM7XfsljC4fDZ8lsNsREduR/knDoDQCD2L
        +RcaJ4gRbeUTStv657N9TGFSGattXbt1fw==
X-Google-Smtp-Source: AMsMyM405Owi4jqJd/Z+9bhYXE6XtSq7OoK6X9APQ0R+GGFP4B2e2H9F8eMyffFCou+oyIBJCbw20w==
X-Received: by 2002:a05:6214:f2a:b0:4bb:5880:2bd1 with SMTP id iw10-20020a0562140f2a00b004bb58802bd1mr22351093qvb.104.1667416376536;
        Wed, 02 Nov 2022 12:12:56 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:28d9:4790:bc16:cc93? ([2601:586:5000:570:28d9:4790:bc16:cc93])
        by smtp.gmail.com with ESMTPSA id bp6-20020a05620a458600b006cf9084f7d0sm8982426qkb.4.2022.11.02.12.12.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 12:12:55 -0700 (PDT)
Message-ID: <0618a7cc-89b5-71d1-a116-0a11f4506a8e@linaro.org>
Date:   Wed, 2 Nov 2022 15:12:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 2/3] regulator: dt-bindings: qcom,usb-vbus-regulator:
 change node name
Content-Language: en-US
To:     neil.armstrong@linaro.org, Luca Weiss <luca@z3ntu.xyz>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        afd@ti.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20221031173933.936147-1-luca@z3ntu.xyz>
 <20221031173933.936147-2-luca@z3ntu.xyz>
 <ea0fd9da-4fdc-9d9b-f3ea-e74fae6d3723@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ea0fd9da-4fdc-9d9b-f3ea-e74fae6d3723@linaro.org>
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

On 02/11/2022 06:38, Neil Armstrong wrote:
> Hi,
> 
> On 31/10/2022 18:39, Luca Weiss wrote:
>> usb-vbus-regulator is a better generic node name than dcdc to change the
>> example to match.
> 
> Subject is wrong, should be something like:
> dt-bindings: regulator: qcom,usb-vbus-regulator: update example node name
> 

No, subject is correct.

Best regards,
Krzysztof

