Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF164734D3B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 10:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbjFSILp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 04:11:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbjFSILm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 04:11:42 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B271D3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 01:11:36 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b4769a2ee5so12224801fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 01:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687162294; x=1689754294;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3xPMuTFBcatDP55aIsS+GOjC4Ch+/juHWjYHrjZQ3OU=;
        b=UBAcSkZqksfO74KjKXxbL92/5mMEE8U/4IfAY3NXb1t7p8rmK0By/7AlHp2YORPLhr
         gZEkwqRETaeFV+rSBclaCIYG3wcfq2YrjHPWyTbuMy0842I+7kJxais6FeBuUUgf2jby
         /02cNoHRp4vRyI+jyGUKqL6F2UNuVx4wv+dt2vlwBELfDCUcTEDW1FvPvt5t7MrefhyU
         FwZwhoTnnr9crXYGidVWTqJ8vWH0dk7wg3n6qgdQN/15suIfYnqbeMm0/gs244spmRNs
         zzxekuYM0h1aTL9FEfuYjeD0zwTqOuUD0omaQpOC7o6pd4s1p+06C3AUCvhpD11pIIww
         NCvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687162294; x=1689754294;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3xPMuTFBcatDP55aIsS+GOjC4Ch+/juHWjYHrjZQ3OU=;
        b=Ph+ElYt6/gf1j20W+zT+O/2krFVCdlFM6m/tRr00yr+FjnOoWCDQbIJZVJPgiPhys4
         qaMkYyvYnppvPKF4pegxPTjS6RF7HJX42s6SOlNw/H519YDibCA9oE7zxLo13BWuVsjr
         0Ix9qh9ROT10/5NKrpkSHXa2woZenR78sTayImT4aaa8Ubht2bbGsbdl0kgdF2kotYA5
         EH6sZ9XrRnddtxPV3qR/105rP9BgWcfoGX5F4XnvLFZrPFpB4gdj6OniYyA5psUjYHgS
         1pAQSsusTr3LOpweBaCETSDkOzGMH41K6/GEvXcJRkaQ0m/zA8MMqA+0Ql0By7cGUMVN
         NPyw==
X-Gm-Message-State: AC+VfDyyi7CXQf+9NXB3ZVjaGqympssN+unxsKOdhBanJK7y70ahGaCE
        a/JMLlLvD2sj8Ja4l1lTCKfTB0L5KaStvRo0drFvfg==
X-Google-Smtp-Source: ACHHUZ4zbUKHJVikKwdJVb7+7tHm+yWteP5mTajqu+bVBDjT6xrCTS5ev9YfXf0znFEOYjwq0QKuLA==
X-Received: by 2002:a2e:8507:0:b0:2b3:3791:da84 with SMTP id j7-20020a2e8507000000b002b33791da84mr5999937lji.18.1687162294397;
        Mon, 19 Jun 2023 01:11:34 -0700 (PDT)
Received: from [192.168.7.189] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id i2-20020a05600c290200b003f42d8dd7d1sm9937807wmd.7.2023.06.19.01.11.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 01:11:33 -0700 (PDT)
Message-ID: <2596b1f6-7620-b4fc-e685-7cc90bdb7ed3@linaro.org>
Date:   Mon, 19 Jun 2023 10:11:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] phy: qcom: qmp-combo: fix Display Port PHY configuration
 for SM8550
Content-Language: en-US
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20230601-topic-sm8550-upstream-dp-phy-init-fix-v1-1-4e9da9f97991@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230601-topic-sm8550-upstream-dp-phy-init-fix-v1-1-4e9da9f97991@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Vinod,

On 01/06/2023 11:39, Neil Armstrong wrote:
> The SM8550 PHY also uses a different offset for the CMN_STATUS reg,
> use the right one for the v6 Display Port configuration.
> 
> Fixes: 49742e9edab3 ("phy: qcom-qmp-combo: Add support for SM8550")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

<snip>

Gentle ping!

This fix is needed to have functional DisplayPort on SM8550,

Thanks,
Neil

