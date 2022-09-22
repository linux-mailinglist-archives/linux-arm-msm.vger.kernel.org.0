Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E18995E6595
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 16:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbiIVOa6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 10:30:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbiIVOa6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 10:30:58 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4003F393D
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 07:30:56 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id f9so15007996lfr.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 07:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=TVpqDq9Gq83T2g/Zt6RPRB8MTfZo9+TmbmZmSKnXjnk=;
        b=rQe3815xG47JqBHhtnlBmBU7Z5fm//Dp/mh0rLGX49w6L3fJnETIhy/TKTdItiuwLY
         qu09XhEb7PSuJWQF7GWDal7WRQYxmKtp0uGnBsVNy2lwGGyFKhgLKkfjRVeXmmuxnWM3
         BGKaIc4mcu0KVkA3Y8dH0FmhOrr1K0KFFu8TPssLJZssqRFw1FOOUCvTKD4YHT/qgq5r
         WNukJ+RhKgdKLE4/W3w66Uy70EY3+9Ai7NqcitpRyBVsCDtHObU1CLWgHjakWJKUYSXz
         BwKlgxSieKeUEi882udGp4FSVPGH1URxdAtvsJgu87cdzpM4aV2lopPRDVC78ucJQAaw
         SW/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=TVpqDq9Gq83T2g/Zt6RPRB8MTfZo9+TmbmZmSKnXjnk=;
        b=jbKg89wtXD/+aMPyVVaSoFvWFRBlKY9u0jML6E+dxFfKwn9BvMSS1S8YugcDA4z1AZ
         Y5obMuvGq91lZUdwm6rjaZ0xLLPPHTRxxMvWXeyzOaLtfu4l6Y7EVlUZfeV5Uh67P5qT
         EapplQgjABulLRmFSQh8+TRYmPyu+AiLBti75QflMkL0eQTnM/wRBGcmq3nI2/1ezwey
         Suy1tu5m8nBTrLM43/G2Qyk6MO8epfJmuagjIxIZa+in1dnKxkKp826QGc0u4HK29oMw
         FqHQWwDkrbhdgAq30kLlksNgZcMN6aUdUwyoYcJQ4RWPiUJS0qZvYzVoqJx8ubeqKoW3
         V+2g==
X-Gm-Message-State: ACrzQf0NYTMr8pGVKaNW2l4mocEvnzyMiYx+e/mFfJaU9u9iaBZCJo50
        d0ottp4H7htH4fu5dj5xPglOlg==
X-Google-Smtp-Source: AMsMyM5qe3tWeL8CN4ENBSw/uYXYt7eGxRA+TwCDEsoxVu9fawyJg4zf1dAIqcs7/Df6gTQlClByjA==
X-Received: by 2002:ac2:5cb9:0:b0:498:eb6f:740d with SMTP id e25-20020ac25cb9000000b00498eb6f740dmr1308941lfq.106.1663857055151;
        Thu, 22 Sep 2022 07:30:55 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o19-20020ac25e33000000b004945c1c5cccsm955021lfg.268.2022.09.22.07.30.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 07:30:54 -0700 (PDT)
Message-ID: <bbf9df4e-113a-9b57-65f2-380ff02b63d1@linaro.org>
Date:   Thu, 22 Sep 2022 17:30:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 01/17] phy: qcom-qmp-pcie: drop unused type from config
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20220920073826.20811-1-johan+linaro@kernel.org>
 <20220920073826.20811-2-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220920073826.20811-2-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/09/2022 10:38, Johan Hovold wrote:
> The configuration PHY type is no longer used since the QMP driver split
> so drop it from the configurations.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 14 --------------
>   1 file changed, 14 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

