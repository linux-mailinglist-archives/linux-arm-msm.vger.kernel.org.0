Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A295925F4CA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Sep 2020 10:17:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbgIGIRZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Sep 2020 04:17:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726978AbgIGIRZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Sep 2020 04:17:25 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8228C061574
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2020 01:17:24 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id q9so13481277wmj.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2020 01:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=e3Ta+K0mK8PpGvlCwRAXKhWKCtC3zo1Ck8yWJNQiAbc=;
        b=N60YE/qv46tYYNcmpPR8FroUI42HP4mXIwHEKFuWaGPimLjJ9X3TifejU9aqxqqk8B
         aE2FD/IljOK8O1Py57X18zSa7Q5k211I0qCnq7Urb7sSDcd8kX4aPn6DY1luVHtH4eHD
         FAw4gW7HXAtpTkTtBGw/V3hgmAypm+uug7M1ttHV6PbBictZ/TGCrnAjHm6QCAKIrnNc
         YMMVxDv5HKOtnlgM/RUdgkfSEnwOdBR1bOozmHY9Zhu3cpQ+uxZh5/Owv+Im8bBCJs0P
         CRhUs+rjqD+24Cxv7SEUdOnAcSz9GbvwH0Sz85YrrMl/O21+QjRNM2D9LTm+AfdpDxz/
         nHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=e3Ta+K0mK8PpGvlCwRAXKhWKCtC3zo1Ck8yWJNQiAbc=;
        b=VfjnSxL/NsUvk1xaJb302TZQPR7HxMn8Rz/CUfpySJnM2IGRWyLYrqTtI5IqJjAKXl
         cvgwK9bbBfnqtlc4v2XqVtyKdvPHo9LfHsPEO29BZqiD8/B1sxaQ1beeyYlB75OuuKhx
         97QOWSf8+CqYUzndd62Iq6V3cGil+O3EqnpTsEUW2qkpjtgsrAfoPUTHpvyFNHDTLwuA
         bXKxv4MDuPh0aS/ehEJm9Sh1O+n9ajPHHVCGY1A3zB7Xft/nbofy4FdFl7UIFxJ9Dazx
         7Rs1GNs5R3LFFV4OQGQMJ9wGr4uSer/WRnvejY0naD9Gxp/lPdx8xPuUJ5tq/04mgy2w
         WfVw==
X-Gm-Message-State: AOAM532simSSU2TeuESH7kPmj1Ct1R6VtNLcVy6mXGAllUXjPt+/o361
        YzyzWcjJ2pXvMS0bWAFjQGzu9w==
X-Google-Smtp-Source: ABdhPJzqlqQ/xXSxZ0lbww5TZ6AZTnF7NA2XnTh1An/jnwbvuMzqoK0s9KMICLsQ2iJA4xPkNvSEbg==
X-Received: by 2002:a1c:3bd7:: with SMTP id i206mr19701901wma.162.1599466643283;
        Mon, 07 Sep 2020 01:17:23 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id u17sm25259954wmm.4.2020.09.07.01.17.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Sep 2020 01:17:22 -0700 (PDT)
Subject: Re: [PATCH v2 0/4] soundwire: qcom: add support for mmio soundwire
 master
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc:     "moderated list:SOUNDWIRE SUBSYSTEM" <alsa-devel@alsa-project.org>,
        Andy Gross <agross@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Vinod Koul <vkoul@kernel.org>
References: <20200905173905.16541-1-jonathan@marek.ca>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <ec241abf-c1e1-8b2d-a0bb-93a60241330c@linaro.org>
Date:   Mon, 7 Sep 2020 09:17:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200905173905.16541-1-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 05/09/2020 18:39, Jonathan Marek wrote:
> This adds initial support for soundwire device on sm8250.
> 
> Tested with the "wsa" sdw device, which is simpler than the others.
> 
> v2 addresses some feedback, but I kept this series as simple as possible.
> In particular, I didn't implement CMD_NACKED from FIFO_STATUS, because
> the downstream driver doesn't define this bit, so I can't implement it.
> Soundwire works without it and It shouldn't be difficult to implement later.
> 
> Jonathan Marek (4):
>    soundwire: qcom: fix abh/ahb typo
>    soundwire: qcom: avoid dependency on CONFIG_SLIMBUS
>    soundwire: qcom: add support for mmio soundwire master devices
>    soundwire: qcom: add v1.5.1 compatible
> 
Hi Jonathan,
I have tested these patches on RB5 with WSA8810 and they work fine.

I can try to add support to command ignored in future, but for now these 
look good to me!


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


Thanks,
srini

>   .../bindings/soundwire/qcom,sdw.txt           |  1 +
>   drivers/soundwire/Kconfig                     |  2 +-
>   drivers/soundwire/qcom.c                      | 38 +++++++++++++++++--
>   3 files changed, 36 insertions(+), 5 deletions(-)
> 
