Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F0F9687D34
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 13:21:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232135AbjBBMVe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 07:21:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbjBBMVd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 07:21:33 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C2118D621
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 04:21:24 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so3591226wmb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 04:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v/4U8p8He8nf0F/Q+zKUZ6JAva9Y3IADx+ImOxMwVjs=;
        b=DZVRTdZJ2TGTimuGoUq+e4aS2CgltVg9zGenQm3Q6L3Qknfq09JAq2Lk3bI3Ep+Xra
         Y2YuJxGUB2Kj/j3uYg9GzAL0M4YVqii/ci1/1/VWgJA/yCTWEm10VkgqDYP8ZzckDPwx
         dWYaVTrOnasI9nlHPfhiNudTvvBX6OLMXo1gcGVofXKgBGSPx5s904/ha6KiVkVW/eDn
         0uZvqYUOxnXOXfj1ObF/PkqJiBf7w5apOEU/BviWew69ZimqYRHHwopcPUojTLBsJp9K
         KBjoxfKoXTlrIGVRnyfocC5+Xj1BerZ6skEYjfON7I7uM7h3/WlsCnasF+OQojWp3oEv
         EULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v/4U8p8He8nf0F/Q+zKUZ6JAva9Y3IADx+ImOxMwVjs=;
        b=doQ9HXjEtmq6/iLYwLajAfQhYLf69gOK4aoqVO5cFkV25ix/z6i8DoUroq7b18gtU4
         Z96JjOQ4NRkRl08l2ADrbthIldtxjD62LKEOs2QCwvNHD7JPeTwWZmbxfEp1PW40Hkcp
         lXauU1thqhK9E0JyqvTEhds2nmSxrbE4INrJvDxJhbqF48ZV9a05G35TbOhQaA7UQUru
         8dFVfUGeVroWjldo+/AuwMgpRjU+9PXnFPgJI40KCHHim2YBI2gFgpyV+fiz+ehvyD+I
         Fv9S0oLNhwQHe7hbxLjf2vuA3mPmCuCFjX2Td105PpqsmcM08GWUUhST8gUgqZMeQAyE
         rVig==
X-Gm-Message-State: AO0yUKV8XeNnuzJeSl7taXCmxHj+lxnoFP9Gi/2UCFWZQulOdyuk5nlU
        IZCbx6y5G3Qw8rVIVbF9KUa77g==
X-Google-Smtp-Source: AK7set8gVqTsm/vSxOdXJguhERmSsywifTBAe6FbEDkp0QG4XpfNm6PCN3fFrU/+InV20PS1v4kD7w==
X-Received: by 2002:a05:600c:19c6:b0:3db:2647:a012 with SMTP id u6-20020a05600c19c600b003db2647a012mr6298917wmq.40.1675340482770;
        Thu, 02 Feb 2023 04:21:22 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i22-20020a1c5416000000b003dc3f3d77e3sm4824975wmb.7.2023.02.02.04.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 04:21:22 -0800 (PST)
Message-ID: <78155653-62ff-e367-e243-eb546ec285d1@linaro.org>
Date:   Thu, 2 Feb 2023 13:21:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 20/23] memory: tegra30-emc: fix interconnect registration
 race
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>
References: <20230201101559.15529-1-johan+linaro@kernel.org>
 <20230201101559.15529-21-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230201101559.15529-21-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/02/2023 11:15, Johan Hovold wrote:
> The current interconnect provider registration interface is inherently
> racy as nodes are not added until the after adding the provider. This
> can specifically cause racing DT lookups to fail.
> 
> Switch to using the new API where the provider is not registered until
> after it has been fully initialised.
> 
> Fixes: d5ef16ba5fbe ("memory: tegra20: Support interconnect framework")
> Cc: stable@vger.kernel.org      # 5.11
> Cc: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

