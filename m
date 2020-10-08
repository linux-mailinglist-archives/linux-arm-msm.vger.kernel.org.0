Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A46B286E2B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Oct 2020 07:37:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728363AbgJHFhv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Oct 2020 01:37:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbgJHFhu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Oct 2020 01:37:50 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1372C061755
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2020 22:37:50 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id z1so5100837wrt.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2020 22:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uzc1+OIpuC778zhrwXmoWv4oWCtwA3uOVXW778gGkv8=;
        b=ml3paT+KU4nk5x+67HGcDobgbHZCUhknrUGbn8Ei/i83N7QKesst6RKodzyNnzpYUL
         OE4Q8oDcGhTBpDDwJYbX0t4LPj4H+iFvRnJIV0X/ibHVqLtB8kDxf+nr/K23f+W4Sglj
         w4zB3+WLo07WUdGOkGxFYsPfMUg/Nk2R9H1hj4/VOzQpBzmFP7xc2j+PuP10WRM5qfey
         CxNoAqIKXTgliKTdGm45ez/GXOnmML8v/Nixp8f3B+5bV+UMGSOI8wNAFYffKYXQUQgS
         h+rYoRjIYHqov7TrHMaRK2kPktgYDnEA+fZX+SapdxilqPml2+ToGEkhR/1tY7OdeTqD
         +XSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uzc1+OIpuC778zhrwXmoWv4oWCtwA3uOVXW778gGkv8=;
        b=axmMM+jqoCRFx4GOj3KTrEUCJtxpFQmWkElaTHYO/eP6P1f8jIygXSPEDsIk+yb31z
         s1zTWDKHSa+Rng+Ilk/Xc0C/z2KmwblYJby3fnBNGYOhm08zZsLw2fgQIcskBVan9e89
         ix5ayUsweKPCmgklPZZCewFTrBrlfHhSdqxpGT5NPpIszjpQLT/+3fL/ABqzRJRldl0T
         UTXK9B01Y1eCCZ9RifDPXhSZn6XF1bvH3umNTWhE8DRy8fc1cFT5vZ5afQ5vQMASgfnb
         IETtdDOSRav8Q0JQJX09enYoYXJg6Cz8uuNHp7VfSpNTfearUzJCMMmMOonTTVtp1fb7
         TvZQ==
X-Gm-Message-State: AOAM532dYnRUl+OEwmOzIBPv0I86Kv+v7cgCWnKujrrcQ1ZoSddoaBHc
        vWZZNp/OcIXQVcu1AZxltidV3JFpiHxlug==
X-Google-Smtp-Source: ABdhPJy0nwSSdzGNFRWaXQ/aqDIfsPChRlGqie/SnNdwPMFez5OYqoih1QeT3sEFc7n3rd7ZrLLWfA==
X-Received: by 2002:adf:8030:: with SMTP id 45mr7377274wrk.177.1602135469363;
        Wed, 07 Oct 2020 22:37:49 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id b200sm5594266wme.44.2020.10.07.22.37.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Oct 2020 22:37:48 -0700 (PDT)
Subject: Re: [PATCH v11 5/7] ASoC: qcom: Add support for lpass hdmi driver
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>
References: <1602134223-2562-1-git-send-email-srivasam@codeaurora.org>
 <1602134223-2562-6-git-send-email-srivasam@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <fa33de91-16b8-8938-9577-e8e763039f83@linaro.org>
Date:   Thu, 8 Oct 2020 06:37:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1602134223-2562-6-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 08/10/2020 06:17, Srinivasa Rao Mandadapu wrote:
> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> 
> Upadate lpass cpu and platform driver to support audio over dp.
> Also add lpass-hdmi.c and lpass-hdmi.h.
> 
> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> Signed-off-by: Srinivasa Rao <srivasam@codeaurora.org>
> ---
>   sound/soc/qcom/Kconfig           |   5 +
>   sound/soc/qcom/Makefile          |   2 +
>   sound/soc/qcom/lpass-apq8016.c   |   4 +-
>   sound/soc/qcom/lpass-cpu.c       | 247 ++++++++++++++++++++++++-
>   sound/soc/qcom/lpass-hdmi.c      | 258 ++++++++++++++++++++++++++
>   sound/soc/qcom/lpass-hdmi.h      | 102 +++++++++++
>   sound/soc/qcom/lpass-ipq806x.c   |   4 +-
>   sound/soc/qcom/lpass-lpaif-reg.h |  49 +++--
>   sound/soc/qcom/lpass-platform.c  | 383 ++++++++++++++++++++++++++++++++-------
>   sound/soc/qcom/lpass.h           | 118 +++++++++++-
>   10 files changed, 1075 insertions(+), 97 deletions(-)
>   create mode 100644 sound/soc/qcom/lpass-hdmi.c
>   create mode 100644 sound/soc/qcom/lpass-hdmi.h
> 

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
