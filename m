Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5BA5626775
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Nov 2022 07:20:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234757AbiKLGUi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Nov 2022 01:20:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234751AbiKLGUh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Nov 2022 01:20:37 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 004546DCCD
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 22:20:35 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id l12so11278090lfp.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 22:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=StJ5ZbDgRapS5ZgNpDfregL7n6HNhInzM+P2c0de+0w=;
        b=Q5+upwR+LxjW0kDF4ztWz20ethrxgRSP1+NBBG7sMSCfGPtiAyuZSsfcMshi/CmIWN
         B7HiwaFcIAi0CsagUTDqEqbHzS9Liu3AFw6iuBc1vKct9RWJeX724Qn28qQKPXudPvxD
         /jzz/LaaP8fkt9ws5i9ScqybrKfJT3/TQxYLmJ2jq6p2WzMixDYRDT84kN7ab6S5YtR7
         tV0lYQ6+AJkVblph1kxanCif/nyAS22yPrIREgkMJ3rjqaGxsuT/jARVRaosP/2QmW9a
         pWtL7CVowsolPckWYuEFbhtPI+q5sEHCSlGHdkExXiv7gAdeYol19dLuGesQ5NFs1xE5
         knRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=StJ5ZbDgRapS5ZgNpDfregL7n6HNhInzM+P2c0de+0w=;
        b=Pkf7zzfJYtdzTJEwupyyMPe2IgjRwc9NWpdQy6/dn5ZHdEamiawbZg0A1CG3eTtl5W
         gNaN0QbSpLDpw0vYlVtH9sMUndrYPope4Gg2vkRXpsjE5guSi+zk3YIO/hqSMzN2d9vr
         gs/00lN4GvtULgAsK5KKadSYLPLeAFsLaZLiNkxOsSfEWt/NQSNJnGtmTV+1omZhnUjQ
         qqxaIUjBFVulPNqqkAMZxzT3nprV1WzDgMB+e9XRPdFfqqnbVuGoLQX8gS9zxc+K7iAF
         GDXk8hAhwCZbg2XnUs434FoAtVDfxFgviTYRdEVAVLwXMhCI8hFwlaqgtQoHXTWQNo7S
         3xdA==
X-Gm-Message-State: ANoB5pmllZ4z4qxHcKOU3DXHRsUJQg/f4qsjXKntpkGMYhU/Xz+/EClz
        9DpboqfzDjiQDnWY2tFmwmDmpw==
X-Google-Smtp-Source: AA0mqf4p+16IjJogDZBIgZF8+dp07HJN12I+4GOQotjw8LDQLHdgSWJ/SN1B17M8P9aymGkYX/+sbQ==
X-Received: by 2002:a05:6512:138f:b0:4ab:534b:1b2c with SMTP id p15-20020a056512138f00b004ab534b1b2cmr1579741lfa.426.1668234034358;
        Fri, 11 Nov 2022 22:20:34 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s21-20020a056512203500b004a8b9c68735sm708507lfs.102.2022.11.11.22.20.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 22:20:34 -0800 (PST)
Message-ID: <865ee69f-9fe9-9042-f36a-01388cae27a4@linaro.org>
Date:   Sat, 12 Nov 2022 09:20:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 07/22] phy: qcom-qmp-combo: drop unnecessary debug message
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20221111085643.9478-1-johan+linaro@kernel.org>
 <20221111085643.9478-8-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221111085643.9478-8-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 11/11/2022 11:56, Johan Hovold wrote:
> Drop the unnecessary (verbose) debug message from the init PHY op.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

