Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74583219C24
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 11:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726660AbgGIJ1R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 05:27:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726634AbgGIJ1Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 05:27:16 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 681A4C08C5CE
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 02:27:16 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id 22so1087764wmg.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 02:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IUWPqNTyupX2OfJokS7Cyg6szXXlNV4uQSRKuBbr+Nk=;
        b=th/+uK9dwrxSw1xSQDtZLXE93rsinY7TIBR5hcrowU8HCYEo+RR5AQxCCEJOI1NwAE
         RF8Wl4q6A998sRt0mKbrYLRppA7usgYnsIa8tAeN458OgIpojMVBP+ImgJmm0TOGrvRC
         lJOeDXjUNFXYSkfzZcjbGrmhlw6B8K7d7nTceNSz7N4Kbg4Fz1yoLPVCSlNEruYN8nuw
         sqPNJQY12V5+Lox4FiLNTOPiBseRbsjXgF2o2mzA3y94RVcZBBzW101AtTjEnfhfMsgN
         uIQmwhcXhDFfbX/wW01yt3fp6D8weEUoIgs3cTino+4KBshiJiS8YGgJUD5s12S2Gu1z
         YVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IUWPqNTyupX2OfJokS7Cyg6szXXlNV4uQSRKuBbr+Nk=;
        b=q0I1aehxniOlUfsHhYhX4cJ1v7d35wLbHrI6iwJUs9k9+o1bBw3ZpPXsQi5jtHAGnS
         42APlH1vgISvYycIJvxQOgK8KVrIVEyTJe2nS7o57IXKdddbPHJ+GyGJW+VcZ8M4X2be
         EbF3IdXwm2ViF1UC8cw1mAtDqmQAHAs0QVoe1Co4rR9BOCer6ybYViceoyzFIce1aIGd
         Bz20piVNKxcY+1vSKZRqwG4aVSlWoqwtaySGwvxT1XN6pokRu3UQ77WJH2jqjNMcmOQG
         kFxazzpb8FP6R225bchEpl26YNDwuHk1I6SeQU5WCqOQ3C+nG9D/ocDRbMUmTGn/q8p6
         ePRA==
X-Gm-Message-State: AOAM531oovn0gouZizKO1B44TR74JtYv8oH4HyDGuAs2iMAkJUVdEdFN
        z5tcd84k1i0A8nz4+G+h9+FZgg==
X-Google-Smtp-Source: ABdhPJz4oppYHDMOr7cWktwBN00kT6be7JvWf8qKYCDNjlSQ2uUZu9nCNLwF+xq1vN5a0vn60fBs0w==
X-Received: by 2002:a7b:c4d6:: with SMTP id g22mr13844105wmk.170.1594286835202;
        Thu, 09 Jul 2020 02:27:15 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id 65sm4082233wmd.20.2020.07.09.02.27.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jul 2020 02:27:14 -0700 (PDT)
Subject: Re: [PATCH v3 7/8] ASoC: qcom: lpass-sc7180: Add platform driver for
 lpass audio
To:     Rohit kumar <rohitkr@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ajit Pandey <ajitp@codeaurora.org>,
        Rohit kumar <rohkumar@qti.qualcomm.com>
References: <1594184896-10629-1-git-send-email-rohitkr@codeaurora.org>
 <1594184896-10629-8-git-send-email-rohitkr@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <2d39e123-4b97-787a-7d6c-7d9fdfaa8f56@linaro.org>
Date:   Thu, 9 Jul 2020 10:27:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1594184896-10629-8-git-send-email-rohitkr@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 08/07/2020 06:08, Rohit kumar wrote:
> From: Ajit Pandey <ajitp@codeaurora.org>
> 
> Add platform driver for configuring sc7180 lpass core I2S and
> DMA configuration to support playback & capture to external codecs
> connected over primary & secondary MI2S interfaces.
> 
> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
> Signed-off-by: Rohit kumar <rohkumar@qti.qualcomm.com>
> ---
LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>



>   sound/soc/qcom/Kconfig        |   5 +
>   sound/soc/qcom/Makefile       |   2 +
>   sound/soc/qcom/lpass-sc7180.c | 216 ++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 223 insertions(+)
>   create mode 100644 sound/soc/qcom/lpass-sc7180.c
> 
> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
> index 0ea4cde..87bec7f 100644
