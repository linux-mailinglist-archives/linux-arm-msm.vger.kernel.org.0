Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06857566A78
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 13:59:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232305AbiGEL7c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 07:59:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232203AbiGEL7a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 07:59:30 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B00A02678
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 04:59:29 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id z21so20073494lfb.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 04:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6siEFuHTvz2wiZjNJS/sIJYuAAMQPwq2R44ZfoCD8LA=;
        b=mmuxC3elnOWnJdm5y+8IWI+4z7RlV9dmMTlrS0adveVMqJh+LSw26uvhbaVdv3c0CR
         NuJPlLuAdBIbFCS8Te4/RIxJlEHrQ+Mfl4I+o+zr9pfU5pybB+ywLTau2DRz7+Yelc9A
         t1ruCo+VQ8Z311ZLnL1XtCmnyFDo5l0GHoMqa/GtSS4ME67YqQ4KHuqUIwhJStxL6Hc8
         hOqbk1OsLDWWeFyOsua8Z5S37UULokgit4LFactvNLRewEMNpDFL1w02H1/bugsbRKAK
         9HUhrnzcXHcqNC24WU73b86l1LSlG8DSw4Ht/K6yOaCliDS7nSC1M4ySSZA/PxTI7x3o
         HAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6siEFuHTvz2wiZjNJS/sIJYuAAMQPwq2R44ZfoCD8LA=;
        b=PdmQH0kyTyW4z0Sy9fG82TSeZkp6HblW6FBxqWpkESaet31dYv07tW60WN4V6SQgMD
         ABZp4IQ1iI5kYg4LGPN+b4O17Q5X46gOHuCzS/elwOZRG2Y5u87BUv+klItJFrWPzc8e
         N04mTkdNOvN240uFujOUqKBwlTUpn2ZyibsscqieDqSFo4mvEsdI7mQCERkdAsoVrHrO
         R/M7TUlxa9CRuj5gpw2ntAQGFjx2Okpupjw2RT1n6n8E0zbN0jmTsZygKC7tknRHuBre
         tjfzsg+/4J8L1it2/4l+L+68SkuOKAo7lq/37usStJjeMLEJBhNt6hHUCzbijlDCDMQN
         2rLA==
X-Gm-Message-State: AJIora+1kh2dtPTvhrtw8mBa0SrLoGV/qVpHsu7wwrq4JZXt13KnL3V9
        FZnHVULDNb6eH4+zjd7MPuz+aQ==
X-Google-Smtp-Source: AGRyM1tZ8htjZWP+QnN9dvmr8bSoCF+K5t1fwgkt71yBEOScwK7N7obCz+hU0Pi1vOMOFazWj0isCg==
X-Received: by 2002:a05:6512:b23:b0:481:3e76:4942 with SMTP id w35-20020a0565120b2300b004813e764942mr21872103lfu.384.1657022368111;
        Tue, 05 Jul 2022 04:59:28 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id o4-20020a05651205c400b0047f8990e8c2sm5683389lfo.140.2022.07.05.04.59.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 04:59:27 -0700 (PDT)
Message-ID: <8d739c84-ba61-a030-ea8a-63a3f45c642c@linaro.org>
Date:   Tue, 5 Jul 2022 13:59:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 16/43] dt-bindings: phy: qcom,qmp-pcie: drop unused
 vddp-ref-clk supply
Content-Language: en-US
To:     Johan Hovold <johan@kernel.org>
Cc:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220705094239.17174-1-johan+linaro@kernel.org>
 <20220705094239.17174-17-johan+linaro@kernel.org>
 <d3a49c05-0fd0-920e-bd0a-f821e8e27b8b@linaro.org>
 <YsQkmUVla9+CDYly@hovoldconsulting.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YsQkmUVla9+CDYly@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/07/2022 13:46, Johan Hovold wrote:
>> It's okay to copy existing bindings which are applicable and then in
>> separate patch deprecate things or remove pieces which are not correct.
>> But all this in assumption that the first copy already selected only
>> applicable parts.
> 
> But how would you be able to tell what parts I left out from the
> original copy 

They are obvious and immediately visible. I see old bindings and new
bindings - no troubles to compare. I review new bindings - everything in
place.

I don't want to review old code, inapplicable code. The patch I am
reviewing (the one doing the split) must bring correct bindings, except
these few differences like deprecated stuff.

> unless I first do the split and then explicitly remove
> things that were presumably *never* applicable and just happened to be
> added because all bindings where combined in one large mess of a schema?

Best regards,
Krzysztof
