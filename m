Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01F5541E806
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 09:11:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352218AbhJAHMy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 03:12:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352015AbhJAHMx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 03:12:53 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 564E9C061775
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Oct 2021 00:11:09 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id x27so35206143lfu.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Oct 2021 00:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jSBfiORxsLOlSZIgFcxNpWPIXwtKhIk3zA8q9EaIi6A=;
        b=k7+SJ7oCNVJ88Ao1G6oMHAx7M9aNEi1WJLPiNNOzax+g5kc5jVo5aRE4K4I4Ul6K0b
         zcWoWJoRha6WCTRC6+wotEjd0APxhns9Jc3acfNoqJc0sIC7kqd/IZUGNZkQZHp0CtBt
         A5/zpE2FCXUb+3SIm9LlMMYJUER9KBSp7rQPATSjMKSBDf1mOTll3QVC8HlHHyQN0gz/
         dNnMez9C2gVWuNiJLMWQfDYwh+24PNGdfK36o3V9TQp7p4pSHOIG6+vghyEHFnvzXlWT
         TOMiSFPEboULb/P84uzGDfq4a87jtaSgFd9/x4J8BjzGobh/KrwqJdhl87F578paXZdL
         z9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jSBfiORxsLOlSZIgFcxNpWPIXwtKhIk3zA8q9EaIi6A=;
        b=X1ke/6PaxNmLdpDxu6yUUBiqWwBzZ2XVoAW0+typtqhR2ibBVQTLCW+zk8KaEcTlnL
         n+6ZSHBAlcDsJ6rhKeh3rZZUzqQndoLkOmI8A5AtTCUDYbZickjkXUKg8oqs8Id0iynm
         9wTfMIbEkJM83rzTpkbK254BLVgAYRjDW+1w7kCUeIz5qJ0iPihPEjx8lC1apoJKFZX8
         gJYjzEl4dn01AQ5PtPZTSS20Jg6HwdFwgQsip0497536vrB/5A0Wb4qMVhE5+ZhWSeYV
         HEVNnYyg8hGrlhL55IdYl+cIPz/tBz3gzgyPhYElVCGvLlywZV97jvKQsehwoTrpXfwP
         4wxA==
X-Gm-Message-State: AOAM530b7H8Hm6iGN4RRDzKZZD519u7JKvKVjtZMezdExUSFJyXHftur
        7UKus2zi9NCJNXrbzDJzVGuO9g==
X-Google-Smtp-Source: ABdhPJzTidiBEf/c0+JwT9uJMFAPXKVGfsPbp1lvR/Jj4jS2/zQqlw0eyje8OoYyBODXO5Wxe1LwZQ==
X-Received: by 2002:a05:6512:3048:: with SMTP id b8mr3675698lfb.650.1633072267706;
        Fri, 01 Oct 2021 00:11:07 -0700 (PDT)
Received: from [192.168.10.17] (88-112-130-172.elisa-laajakaista.fi. [88.112.130.172])
        by smtp.gmail.com with ESMTPSA id q30sm634372lfb.108.2021.10.01.00.11.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Oct 2021 00:11:07 -0700 (PDT)
Subject: Re: [PATCH v2 0/4] dt-bindings: soc: smem: Make indirection optional
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Chris Lew <clew@codeaurora.org>,
        Deepak Kumar Singh <deesin@codeaurora.org>
References: <20210930182111.57353-1-bjorn.andersson@linaro.org>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Message-ID: <7d8dd47d-cf25-ceb9-be80-81b678c9b9a5@linaro.org>
Date:   Fri, 1 Oct 2021 10:11:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210930182111.57353-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 9/30/21 9:21 PM, Bjorn Andersson wrote:
> In the modern Qualcomm platform there's no reason for having smem as a
> separate node, so let's change this.
> 
> Bjorn Andersson (4):
>    dt-bindings: sram: Document qcom,rpm-msg-ram
>    dt-bindings: soc: smem: Make indirection optional
>    soc: qcom: smem: Support reserved-memory description
>    arm64: dts: qcom: sdm845: Drop standalone smem node
> 
>   .../bindings/soc/qcom/qcom,smem.yaml          | 34 +++++++++--
>   .../devicetree/bindings/sram/sram.yaml        |  5 +-
>   arch/arm64/boot/dts/qcom/sdm845.dtsi          | 10 +---
>   drivers/of/platform.c                         |  1 +
>   drivers/soc/qcom/smem.c                       | 57 +++++++++++++------
>   5 files changed, 77 insertions(+), 30 deletions(-)
> 

the patch series looks good.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir
