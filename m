Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46DCC5FCD01
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Oct 2022 23:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbiJLVVC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Oct 2022 17:21:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230100AbiJLVVA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Oct 2022 17:21:00 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3B70CE00
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Oct 2022 14:20:59 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id f9so30279ljk.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Oct 2022 14:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XFaY0bTV2pNdJEMhntNT8kQbE1jsf4XB01gxcWojyUA=;
        b=BcGce7H7B5+yg7pRFZ+/9Pveo80w+oxNQJBlcOUyCegyYAq3bat37anbhDUv/sOWFb
         0m7b95xDw9b8HfqZ4RRXlqIYi8BIPgm6Lcy7X39xugVID5+J9m75uQ/o6FbJ5pyfHw4w
         1qYhbTGLCJXjHXUEBNmdcHfDKkPfVwlelLwPQJu9zkJ4d4MpKvo11dynjItyWKwfw5F8
         ClXFa4tmJ+IEKMDezHPn9aofQXh8xyAbgVBPsWUoMROCo/L4YoHsykkIDed5BDlkhEin
         /YvjyEyddvj06EMlDo1ftaDK64KV+BS2x4xxvo/84z4FlmpK6kOhBW9+XMg9e2uARrxj
         J13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XFaY0bTV2pNdJEMhntNT8kQbE1jsf4XB01gxcWojyUA=;
        b=MxaCw+ElM5fgka2Tl80+J6FuWMObI5MnlQq0oPL7JBiMPuaaziHaRrVlWL3fvbtVM2
         J84CX4VwKhw0dPCQEU3v7hSU0w4wpWJa+SpymULPlOWQ8U3IatJDEtzQ+YE69yIQRcdL
         Cyq8iifqV4ctxUr8pDblYlPcZJZF86DZ8YKGOqTl/BYU058/LJJk79+/n+RKOAwpNZmP
         CWOSHcBgAsiyf50QAOWASws4t0mMNuniiOuWZxafUzD/95cVWEEXOKt3KmoF7Ah2b+LZ
         wYMAxBVUPonXGHsj/l1HZutx886KyNzB0e9+8ScMNUdS5POc0/RoKMIXymlND0AoBePz
         0yQw==
X-Gm-Message-State: ACrzQf39dtJ/Od2JgeOGl9nheH4PoLI3G573Eo0DklJOnRBXHYohdTnA
        nS9SyoPWwmp81ynQKpizDnA51qQkwmI+7g==
X-Google-Smtp-Source: AMsMyM7fJ4ngcKmn2XRftNx9QXJd+rZIJi/OCB4vYqsSmgbl+5SqWAxAfQAFOWF2+FjQOc2INOrbog==
X-Received: by 2002:a2e:bd84:0:b0:261:e43c:bac3 with SMTP id o4-20020a2ebd84000000b00261e43cbac3mr11989739ljq.198.1665609657350;
        Wed, 12 Oct 2022 14:20:57 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id r8-20020a2eb888000000b0026de0c8098csm126859ljp.26.2022.10.12.14.20.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 14:20:57 -0700 (PDT)
Message-ID: <cd6986b7-c053-7838-1120-86684d6dc2ee@linaro.org>
Date:   Thu, 13 Oct 2022 00:20:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 19/20] phy: qcom-qmp-ufs: drop start and pwrdn-ctrl
 abstraction
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20221012084846.24003-1-johan+linaro@kernel.org>
 <20221012085002.24099-1-johan+linaro@kernel.org>
 <20221012085002.24099-19-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221012085002.24099-19-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/10/2022 11:50, Johan Hovold wrote:
> Drop the start and pwrdn-ctrl abstractions which are no longer needed
> since the QMP driver split.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 35 +++++--------------------
>   1 file changed, 7 insertions(+), 28 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

