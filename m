Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84B30629D44
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Nov 2022 16:23:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232302AbiKOPXh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Nov 2022 10:23:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbiKOPXf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Nov 2022 10:23:35 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0000C74B
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 07:23:33 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id b9so17967843ljr.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 07:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xLKS/17GpYY4MgR4/+gEylG604Jj9+YJ2C6BLpGM54Y=;
        b=LYkbwLcE94T02m+S8klc61BdLgSw8W4InLpW5Q6gh9TUg136iEgHNKLzg8Tm4FHm8U
         aOg4Do2GSIOXi7sGolkSuBk9k+R25thUGno+VbjD0A2gQu4+xJj0h3rkjhsZRsKgxGD6
         j3G5C+tWgoHNxi1ZDXc6ob607kOUAs0bn6hUqt22dnZDbqUO4EKRDA+Zk0ULrO/wa7nw
         r4VSX+vj1eh7rb3ImE/XWYRFCZxo91NwirRshRlmgG2Fzgwavpq1g2CwDONt9DDnRPwd
         dC2sCKroneKdVoqhoxHO2HghWXHbKK9HHDppXpBZUnVJ0/L80e1UHn5QpQFAf/Aj29uF
         R5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xLKS/17GpYY4MgR4/+gEylG604Jj9+YJ2C6BLpGM54Y=;
        b=KnCoOYnxsGUpKja7L0tIkCkRic2XOWbb3k48jLBM8Ss3gqQT0zh1HnRWgCpPClx/9N
         KFC7jQ/Glv28xfIgiMBM+nQ5BBPEI3PYmF2AR4FSU6/g0X6fFB7as1bwbDWnAkYuyDwP
         vbMjbaM/y/p72M44K7hqsyKYr0Cd23Xj+v2CzTzMS1n6n0CL8vx1Cexr9bzRex6m0qwq
         kIL3SblP9F/XZpiX80UpXJEPxYm37zt184FdKlUpRsgJFIShD/eB5DeiWS72ZRoEG+PR
         LAiayLQd1GcqniNC0ZzI9XDMsMG1IdnCqNMDVuZzhF8adm7V+yQeqAb0LZrfoMgdz1cD
         +WOw==
X-Gm-Message-State: ANoB5pkvUN8Rk+hehPeGrkx9nBatdBXinOYFpXwhE/tlFdJY3a2Rm+o1
        b+bJXW3HP18xv2H2BAQ7umqvVw==
X-Google-Smtp-Source: AA0mqf5usyXx6gAprC2KqXwUCKgLy2D00K8A1R/p5KXWhg4DJKBRIIA+Yqk/jAqdlUOURDEc2BvSfw==
X-Received: by 2002:a2e:b4a9:0:b0:26d:cf5f:6a22 with SMTP id q9-20020a2eb4a9000000b0026dcf5f6a22mr5875512ljm.508.1668525812254;
        Tue, 15 Nov 2022 07:23:32 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id w26-20020ac2443a000000b004acbfa4a18bsm2245731lfl.173.2022.11.15.07.23.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 07:23:31 -0800 (PST)
Message-ID: <bbc08d1e-62fc-b0e2-15e1-76802ed3c4fc@linaro.org>
Date:   Tue, 15 Nov 2022 16:23:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 00/12] Enable Display for SM8350
Content-Language: en-US
To:     Robert Foss <robert.foss@linaro.org>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, quic_kalyant@quicinc.com,
        swboyd@chromium.org, angelogioacchino.delregno@somainline.org,
        loic.poulain@linaro.org, quic_khsieh@quicinc.com,
        quic_vpolimer@quicinc.com, vkoul@kernel.org, dianders@chromium.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
        vinod.koul@linaro.org, quic_jesszhan@quicinc.com,
        andersson@kernel.org
References: <20221115133105.980877-1-robert.foss@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221115133105.980877-1-robert.foss@linaro.org>
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

On 15/11/2022 14:30, Robert Foss wrote:
> Dependencies:
> https://lore.kernel.org/all/20221102231309.583587-1-dmitry.baryshkov@linaro.org/
> https://lore.kernel.org/all/20221024164225.3236654-1-dmitry.baryshkov@linaro.org/
> https://lore.kernel.org/all/20221104130324.1024242-5-dmitry.baryshkov@linaro.org/
> 
> Branch:
> https://git.linaro.org/people/robert.foss/linux.git/log/?h=sm8350_dsi_v2
> 
> This series implements display support for SM8350 and
> enables HDMI output for the SM8350-HDK platform.
> 

I received two of these patchsets... Which one is valid? Folks also
review in both...

Best regards,
Krzysztof

