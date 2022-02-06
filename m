Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A43D24AAFFC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Feb 2022 15:39:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237972AbiBFOjN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 6 Feb 2022 09:39:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238787AbiBFOjL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 6 Feb 2022 09:39:11 -0500
X-Greylist: delayed 370 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 06 Feb 2022 06:39:11 PST
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B13FC06173B
        for <linux-arm-msm@vger.kernel.org>; Sun,  6 Feb 2022 06:39:10 -0800 (PST)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1EBDD3F324
        for <linux-arm-msm@vger.kernel.org>; Sun,  6 Feb 2022 14:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644158030;
        bh=w5jCFzVfh1DIQgm2OWP8AtmTxGG5HpkOkroBXrwOf9Y=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=hOEAJyLf37aMfEvgIALkYDXB7X+VOTKPwolUx2LoI2Is5BcbvxTBT+Rd2n6meYYIE
         WIw3IvhTAy5dv1yRSLXLXDxUM1DoePwW70T8b3mTOfVxKssDGdcW2z6OcWWlGzQZRL
         FUUjxmLrb+zkj5tv3ZBWseXmEn82a+gssUgvDKRgonmZfSVSvoD2hzlbRTHtmF9CvZ
         inDOwbGIrAUQ7h9gfDItVUc6sDxdIn/oYTnIv7l3f7jv/3Ql/WG93l+tpSqTvz4+Fy
         697wVaqbnlREXyRNhx4FdztCuJJsAroLkEBPxx17cbiX3jRmipwmjexU3JTMqCGY5E
         4WU2kkCGoB6SQ==
Received: by mail-wm1-f72.google.com with SMTP id h82-20020a1c2155000000b003552c13626cso6229149wmh.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Feb 2022 06:33:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=w5jCFzVfh1DIQgm2OWP8AtmTxGG5HpkOkroBXrwOf9Y=;
        b=Fn3ESpySs2QnA8IS76l5CphPyGdoSC0zBFmuSIBvqFmcOX/w48f/dWthbUw1mc6Dhx
         egpfvmEinyoDN9JiW3690DgV0brMLjnkRPypMy2gyPSwLKkk6F58RpOw1D01s+f1RJ9i
         RzjHoz8AU8VWhcWdOvFl0F/49I+O43S9AjjOgOJOVviJ5qvsHzmCtoAr31+BKi9tM4O8
         fYaUt3/xeC+DgMCu7XgQUgrIKTnGvru8q+pJDnz+xm7bEJIUKNGUdq2+0zRUsRhp2+zG
         o1Dbdcw0lH7oDF9c1CW1VTY3B/KmPEA5Kn2nVNUTYyVL1Jysl7bae/fZBlvk3pfHcDz9
         4Fww==
X-Gm-Message-State: AOAM53278QpS3Q/vwGdMQStRPfjyWUtMooD4dg6Mmuu8mvJxcWBMF1y8
        40bxvt0L9lJ2t1xKHUxzhjSF507b3yDbrcnwgRkIRza6tXQoU56bgW/xngfRDUcxe/A+2qIcvvi
        kJ/768LnRvuhch4E7wpuKyX8NwaJJfyJgIuNG71QZts4=
X-Received: by 2002:a05:6000:3c7:: with SMTP id b7mr6523657wrg.260.1644158029920;
        Sun, 06 Feb 2022 06:33:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqsVrLqsEVmIG0EJZY6joT43WAvfZIedwl1wfReqMz2vv6IM3sgPdvQ53f6KQ6AeSQEkAvXA==
X-Received: by 2002:a05:6000:3c7:: with SMTP id b7mr6523641wrg.260.1644158029744;
        Sun, 06 Feb 2022 06:33:49 -0800 (PST)
Received: from [192.168.0.85] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id e10sm8158842wrq.53.2022.02.06.06.33.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Feb 2022 06:33:49 -0800 (PST)
Message-ID: <24c963c0-8521-b14f-e8f4-aefb037151e4@canonical.com>
Date:   Sun, 6 Feb 2022 15:33:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCHv2 8/9] dt-bindings: arm: msm: Add LLCC compatible for
 SM8450
Content-Language: en-US
To:     Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Prasad <quic_psodagud@quicinc.com>, Rob Herring <robh@kernel.org>
References: <cover.1643355594.git.quic_saipraka@quicinc.com>
 <f5235371f07ac0ce367c6ea84ed49937fb751a07.1643355594.git.quic_saipraka@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <f5235371f07ac0ce367c6ea84ed49937fb751a07.1643355594.git.quic_saipraka@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/01/2022 08:47, Sai Prakash Ranjan wrote:
> Add LLCC compatible for SM8450 SoC.
> 
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
> ---
>  Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
