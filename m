Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8699C6267CD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Nov 2022 08:49:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234700AbiKLHtz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Nov 2022 02:49:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234533AbiKLHtw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Nov 2022 02:49:52 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EED23215
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 23:49:51 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id j4so11534986lfk.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 23:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=30J2drolwEdJFioQwxJ7KbRHiB97elMWssOgX7PXxuE=;
        b=g5xU8CTsdqine+E+rnn9RW+8LBJUVXiUuYqMi/33ptmd3iwNCpi4I5Z8VsysHqkOrF
         ZjjYqPp1lDP85m0tDpUf3Ul+SV0n+whR+X/UOwnAkBnixNM6qaquTN89EAGL2osPa3m3
         jcMV37ipwmRaWmHoU0J4zItvolLCZghvTnKI0mXc1AF7aX3QMDtSYzJd2AsGmGUAFgsq
         NsilbQF0zM0XFtknKaRDSs0LLAnwc/gh3JXErKPDyDNX37rvzY3oPF2MpWCNSe1fzhhA
         Sbi3epsyozsQEh+1g+BgPR8pRDjs2ZcLW4BG7/6Nym0wNPnmGcA5w0xnZzRYzSHV9IUb
         pUhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=30J2drolwEdJFioQwxJ7KbRHiB97elMWssOgX7PXxuE=;
        b=6/AvTfI+IE7OtgMxym4deurFRFOCw+Izk4brZgWWmERdmL1UrtBqmY/HyJRd15mIWH
         hpUwrbFigHgGBqwZ/p82K70ocblht92ibGL5hvIscnh+wuiQ6sgLtGCU4g4c7cq+crja
         zEaMRXIyZF4OYDOmFQqo9q4dduEe+3zdAzQtAD5X2hwFJZVY8lhi+iZD4CBPKIDj8nQ1
         IFhR2JQOzLRGzzmubvOHkZ3hxsQ2jy/EhLQO9JFgTi5QSU3l3KneN8Y3uuflsQiThbAW
         LtLHbipe9q3vDMTAY8o4ioFmNKEw3bojqzlBo8ng3JwpaLNXt60vmtKOynzNHJdtZgZx
         oa3Q==
X-Gm-Message-State: ANoB5pkZlw2CzW5a9i3R4v2DMUJey3zp0b6EAdaF86/1i33IpOmqG8GT
        XeAuCEeBMbsaG4L5K/F27RZPfg==
X-Google-Smtp-Source: AA0mqf7ggFgwcdb+uqAvGg/978ceqJ+bPrQysT8iY12z4ezGuFl/5OQT+LEYseZJNE9JQ+ssdjXndA==
X-Received: by 2002:a05:6512:3e20:b0:4a2:5522:d37c with SMTP id i32-20020a0565123e2000b004a25522d37cmr1677537lfv.662.1668239390374;
        Fri, 11 Nov 2022 23:49:50 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t10-20020a195f0a000000b0049c86ca95bfsm746128lfb.52.2022.11.11.23.49.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 23:49:50 -0800 (PST)
Message-ID: <af96cd1f-b370-c20e-980a-662acb950ef7@linaro.org>
Date:   Sat, 12 Nov 2022 10:49:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 22/22] phy: qcom-qmp-combo: clean up DP callback names
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20221111085643.9478-1-johan+linaro@kernel.org>
 <20221111085643.9478-23-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221111085643.9478-23-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/11/2022 11:56, Johan Hovold wrote:
> Clean up and unify the DP callbacks by dropping the redundant "qcom" and
> "phy" prefix and infix and by using a common naming scheme ("qmp" +
> version + callback name).
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 82 +++++++++++------------
>   1 file changed, 41 insertions(+), 41 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

