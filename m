Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1BE425C124
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 14:40:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728775AbgICMjB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 08:39:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728788AbgICMhI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 08:37:08 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68B61C061244
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2020 05:37:07 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id t7so2768768ljo.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2020 05:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kHbO1tTc5n73bbL98QAauHq5Il5LPmDzuV8lMRkC0cU=;
        b=lG6NluBZx+Gi+NN5w27t4VROy92oORzL/IHVGkOIwzhzR0L9BF1NKnFm+7q50/c8LF
         QpHHC9UXNpOD5+9BeTXM3qYu+QdeEOkRA6h5Oztvp4otQOQz1B4dBULysn76kV51WNkJ
         mV+W7dWOydL6MPcZmWnok9DVp96FO43h0OOk8MhM5v0nKe4zmWQRqSPXgogL9vc+caL/
         ww2+4zFjJGIg78c0cFgoY9ytEpFY5VobiFGxr+JmUFy3iz+AUklXQCUzZ4Agrk6efDUR
         qHfIrDsfi+9sBBj9VQrMIcVsvdsuRXjEohIKS2LN3cZ2gNKPYSiny8IkN7q2yXaCizRc
         VOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kHbO1tTc5n73bbL98QAauHq5Il5LPmDzuV8lMRkC0cU=;
        b=Dig88V3p38c/4rK6QayHsFHzcMYuzEbWtjXzlmEoRu3x1M2hYZuDnWc+d1nwXrhojb
         XAOEwGv0rg3I4vfciTPz302BRfHr9Ts9zAzr8HoxT5+mtWwqT00UQnf/OhG52Aeo6svO
         FCpEhzTzeSvXUumnU3LRAOGIvkj1SMoMG1UEFDehHgPuqweL7QQHx//a6v4Qrp1iR1Jh
         QGlxAu7SdCePxYybSiGF6sspKOCtrpSmOJXG6X9lSaWIQuj7boeV5y5yyk7z8xcod/8b
         DuAJoPp/id5GCj8MhpA0C+kQY29eFyJSS6PNIGnFfR8bDghhnucFvlDzH5xIz/p+o24C
         /N+Q==
X-Gm-Message-State: AOAM533Qk+MCOP26irp9KPJWmqpeBpxoNE3L4BqMasyuy/Xkh7P6mwv6
        DH5ZnZ9+5Nwpn52PmfF6N9FhaA==
X-Google-Smtp-Source: ABdhPJxB63FvDL9KGDRorRvmo2+IyaQ1xI27E50OTunOMlitWRMrF+o827XaK4zj7R/A6uszSU2R0w==
X-Received: by 2002:a2e:9886:: with SMTP id b6mr1145293ljj.258.1599136625541;
        Thu, 03 Sep 2020 05:37:05 -0700 (PDT)
Received: from [192.168.1.211] ([188.162.64.138])
        by smtp.gmail.com with ESMTPSA id i26sm581490ljj.102.2020.09.03.05.37.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2020 05:37:04 -0700 (PDT)
Subject: Re: [PATCH v1 6/9] phy: qcom-qmp: Add support for DP in USB3+DP combo
 phy
To:     Stephen Boyd <swboyd@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Rob Clark <robdclark@chromium.org>
References: <20200826024711.220080-1-swboyd@chromium.org>
 <20200826024711.220080-7-swboyd@chromium.org>
 <335a0660-40e1-0c1e-3f7d-87f7024de18a@linaro.org>
 <159900847014.334488.14041376759905055412@swboyd.mtv.corp.google.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <62bdac87-b886-58c1-f071-095ec9945f68@linaro.org>
Date:   Thu, 3 Sep 2020 15:37:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <159900847014.334488.14041376759905055412@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/09/2020 04:01, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2020-09-01 06:36:34)
>> With these functions I'm struggling between introducing
>> PHY_TYPE_DP_V3/V4 and introducing callbacks into qmp_phy_cfg. What would
>> you prefer?
>>
>> What about the following struct?
>>
>> struct qmp_phy_dp_opts {
>>          void (*dp_aux_init)(struct qmp_phy *qphy);
>>          void (*dp_configure_tx)(struct qmp_phy *qphy);
>>          void (*dp_configure_lanes)(struct qmp_phy *qphy);
>> };
>>
>> I'm not sure about dp_calibrate().
>>
> 
> Is there v4 code somewhere that I can see? Another level of indirection
> is always a solution, so it is probably fine. This driver is currently
> written with many conditionals instead of function tables so I'm not
> sure it fits in with the style of how things are done though. The
> alternative is to use an enum and call different functions?

Downstream DP driver sources can be found here:
https://source.codeaurora.org/quic/la/platform/vendor/opensource/display-drivers/tree/msm/dp/dp_catalog_v420.c?h=LA.UM.8.12.r1-13900-sm8250.0

https://source.codeaurora.org/quic/la/platform/vendor/opensource/display-drivers/tree/pll/dp_pll_7nm_util.c?h=LA.UM.8.12.r1-13900-sm8250.0

> 
> The calibrate call is there to "turn the crank" on the aux settings.  I
> need to cycle through the different values for that aux register so that
> aux can be tuned properly. The AUX channel really has another phy that
> needs tuning so we're sort of combining the aux and DP link phy together
> here by letting the calibrate call tune the AUX phy and the configure
> call tune the DP phy. I don't see any sort of concept of an AUX phy
> though so this seemed ok. Does v4 need to tune more registers?


It looks like four values are written to AUX_CFG1:
0x20, 0x13, 0x23, 0x1d



-- 
With best wishes
Dmitry
