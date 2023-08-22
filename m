Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD33783F3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Aug 2023 13:36:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234532AbjHVLgH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Aug 2023 07:36:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232250AbjHVLgG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Aug 2023 07:36:06 -0400
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03429E7B
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Aug 2023 04:35:46 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4ffa94a7a47so5341865e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Aug 2023 04:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692704013; x=1693308813;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JCBvk371BaC/CqcWFFFnQudenCUg5vZ6gW5WDAr8SpY=;
        b=Pif/SQoFvNrFuD9YVYJPu4qwZsX+ZEzoBm6kudRVUw78X3TyXWxu4Zivgd1mNbylJM
         H3oFUtm78Kr8HtSPxCCEuX1V0NO3CDdvBt9BtgAu+3RuZ1d94GGmjOt8GmHdZi5mnzWe
         0XIfRIWsMISksrD7tT73TIxf1SsRhpiB5B74XMmygQ8GR/UvMhH83cIIWRwZKP/Dl1zR
         0JGRG4ElF90aRpOiI7VhyTHZ7dpFeSrLw9Ds6vaxT3xoMQgDtVqEiXo27A7SLUNFWGSc
         gTtetmwdoC9LBhqaB12PlR/As1+WHEZWaZiokqRgE+SQMaIYm58eA45CeHsaLyZAkpu0
         BEKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692704013; x=1693308813;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JCBvk371BaC/CqcWFFFnQudenCUg5vZ6gW5WDAr8SpY=;
        b=jBFjrE+Tm/TYvrrWqjhM2wc6yYVx/G6/FcHJRoZkRi63fNLqPWv2jaQMpkHFZSWJYF
         QvTeW32n1eh7VmUQuf2umw+eyMO5bA98/wO5hTxCWtOw/FVqezTMD8Cp56YInFyZpy4Y
         C6rNhHCAfDdfno3hG7INkyuQMxqcCIcuSsV9pPQhuAihGfjC0nOl/SwvsVYYGisYUq6F
         xc9+Ozw+h7wpKmV7NdUXrxEvmOI9+NT5VIS5tRcKqCQnyP6gAMOx9OltTkwZfvBQVOQM
         Xx/7c5dJnee8nkNFT6SHj383O8uhd8dPuyWXnRXHUdehshkYZ/f4At6xvp4PnagB9dZb
         y9AA==
X-Gm-Message-State: AOJu0YyD3RxNj37NK8O8pYBMcAjyWlMan3UibEXj8jjZxRLTRrlv7NJ+
        2wYebYgPFgmaKrBSPpmf6NUmaQ==
X-Google-Smtp-Source: AGHT+IHWkX8XSEGFwdN8ZkJ9MnJoo409O/jNsb4AfA9thIhwfIruwQp3gob+M0sfv/CUuajOeBc7JA==
X-Received: by 2002:ac2:55a7:0:b0:500:8fcd:c3b5 with SMTP id y7-20020ac255a7000000b005008fcdc3b5mr714192lfg.12.1692704013395;
        Tue, 22 Aug 2023 04:33:33 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id t11-20020ac24c0b000000b004ffa28ef3a4sm1202792lfq.100.2023.08.22.04.33.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 04:33:32 -0700 (PDT)
Message-ID: <510d00e2-65f5-40c5-bd6a-5b5e34fa9e8c@linaro.org>
Date:   Tue, 22 Aug 2023 14:33:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/4] arm64: defconfig: Enable M31 USB phy driver
Content-Language: en-GB
To:     Varadarajan Narayanan <quic_varada@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, vkoul@kernel.org,
        kishon@kernel.org, arnd@arndb.de, geert+renesas@glider.be,
        nfraprado@collabora.com, rafal@milecki.pl, peng.fan@nxp.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
References: <cover.1692699472.git.quic_varada@quicinc.com>
 <84162d7d21d6bf45c4cf670000dae3f03b05ad93.1692699472.git.quic_varada@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <84162d7d21d6bf45c4cf670000dae3f03b05ad93.1692699472.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/08/2023 13:29, Varadarajan Narayanan wrote:
> Enable M31 USB phy driver present in IPQ5332.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v2:
> 	Add full stop to commit log.
> ---
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

