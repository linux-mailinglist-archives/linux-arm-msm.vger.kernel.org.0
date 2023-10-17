Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64FA57CC8DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Oct 2023 18:30:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234950AbjJQQac (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Oct 2023 12:30:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234986AbjJQQab (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Oct 2023 12:30:31 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93BADFE
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Oct 2023 09:30:28 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-507962561adso6747458e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Oct 2023 09:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697560227; x=1698165027; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G0ZUMZHn3wvFYsU5SqLQBD+dmcl+H9Kyr5RC+TFVYd0=;
        b=eY4f1UniU9X6quGsUIjVsa3Fmk4O4ZkihI/JleaqUjvBmkbEnEdZF6cTx/Pjq/4r65
         PPL3arBQKeFHvwLNHXh84k7OctswFFW7bjzyg35GbxtS8LefErfoDL+34gqhv79CmRJx
         iq8T33G26srcDkCTqyOTZHb+jJhQXVx1GtEenM0uLodVFlRZfaulwooc+qzckXcgUE8B
         MUre7PHNPwKdAwXlSEqqMPz6ZlYP5D78t3eBwxwJapvd+cTS56qw+5RKSVO/XgqKSKNk
         47Nn9jXZo50erwT9k+iRYYGfxEeP5yWbxEb5Cpt6o7mpzOG+KLZccqmG6cuQcj8IG4HQ
         lz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697560227; x=1698165027;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G0ZUMZHn3wvFYsU5SqLQBD+dmcl+H9Kyr5RC+TFVYd0=;
        b=KePg820+L8lsmXS5gSkJheCBun8rleB1wL/vphbTFlBLO4hzFApbBbKOmVJn64m2um
         g2UDN7tGKbDwNP5v703bNNRKuNokfOoGBlvXbv228fKe8mYEFCQaXPrMvk9cli+b4oUl
         RbtlLgrPI7dTLJnE+6iMQoY8m7x81Ck1VlUCSJBvlB4nQpBPVX/ue1fxSI8x5FYA3Z5N
         YFAIJ6NsgCJEVOkaO/AKKl6KXUcQuBKDeZe3Yotn0r5DsV9T3BmBeCHxTAkM4CdhLMhi
         gVxU/b4zQRvcg3o9Ppwy9toP59Q3j1PO2GH/zFj7/vWzGeYUCdOtiFS2defmw5awhrD/
         u39g==
X-Gm-Message-State: AOJu0YxfAGk4bZYPPqlGEdjd7tIyj8lmgK4np9jGEFgmK0Flx/f/H118
        HarPzuAR+tA4XEZDclrcS2QJbw==
X-Google-Smtp-Source: AGHT+IGG1ozaE0+IWIfhVotIqz0IAdLawX4MRfy3widezuDNZt4n9ouXns3q/MtSkRCIzjokPx3oKw==
X-Received: by 2002:a05:6512:4004:b0:500:bd6f:a320 with SMTP id br4-20020a056512400400b00500bd6fa320mr2729902lfb.42.1697560226942;
        Tue, 17 Oct 2023 09:30:26 -0700 (PDT)
Received: from [172.30.204.57] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id d15-20020a05600c34cf00b004063d8b43e7sm10257184wmq.48.2023.10.17.09.30.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 09:30:26 -0700 (PDT)
Message-ID: <c453e43c-2473-4da9-bc42-188cd4092682@linaro.org>
Date:   Tue, 17 Oct 2023 18:30:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: msm8953: Set initial address for
 memory
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>, Luca Weiss <luca@z3ntu.xyz>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20231015-msm8953-misc-fixes-v1-0-b800deca9e46@z3ntu.xyz>
 <20231015-msm8953-misc-fixes-v1-1-b800deca9e46@z3ntu.xyz>
 <ZSzoO9QhwVmL8jLk@gerhold.net>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ZSzoO9QhwVmL8jLk@gerhold.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/16/23 09:37, Stephan Gerhold wrote:
> On Sun, Oct 15, 2023 at 10:26:01PM +0200, Luca Weiss wrote:
>> The dtbs_check really doesn't like having memory without reg set.
>> Address this by setting it to 0x10000000 which seems to be the value
>> filled in by the bootloader.
>>
> 
> Looks like MSM8953 has the same RAM setup as MSM8916, where the base
> address depends on the amount of RAM you have:
> 
>    <= 2.00 GiB RAM: 0x80000000
>     = 3.00 GiB RAM: 0x40000000
>     = 3.75 GiB RAM: 0x10000000
What a royal mess

Konrad
