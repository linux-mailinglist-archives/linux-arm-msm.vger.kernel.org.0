Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C1D536B37A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Apr 2021 14:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233043AbhDZMtg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Apr 2021 08:49:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231876AbhDZMtg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Apr 2021 08:49:36 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C098C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Apr 2021 05:48:54 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id a22-20020a05600c2256b029014294520f18so675221wmm.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Apr 2021 05:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DgaYC5R2rUyDRNmCnqxAOo91HvCd3i2OwcZiQxe112s=;
        b=xalZ1Zg0LEgSoahAddl++E3/jFKE+4Gzjf0wvGPemO8iuTzLan0YSJLGIJ3o94TSXj
         BRKC/EXV1zNOOZZGU6pcManzKZOrqMIDCjGxR2CqdcLR1X7cQKbvxZSZsCe4hEQCDqzE
         Ggx8nRAhSSbgfCh9x594eR1g4n7nbze182FlCpKpA0PEEM8E4AAbmjgc3wAmGdR8ygv3
         7yUH/s5k9+GKQRzRPL2ju7mMRimGB3f6E9YHNQ0w4G0YhXbu28IlGQoqkGMYLJ0QRb/Q
         y3a5a07pkLKdTUfF+J+H8vsYncfQQk7Is9f79SEcFuDluGdZLtDRRq+ufp0KM2spVWtv
         ol1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DgaYC5R2rUyDRNmCnqxAOo91HvCd3i2OwcZiQxe112s=;
        b=ZopBf0IabCf7ZW0r5eneJcpCs+bC/y39CDAOg5fu/Si47+8gdhm4JdiSlPBURH/BUV
         19oKvjvfkymxdqzKeyzKIzgBkx3MM/hryxMPs5yoRZ6OalYb/ydtD/tPx6o0b/7KRnK6
         l9yssvKOAgzHJTQZ1fsjBzvyv5nGjCbzisC2FRcloHE0qFkLWS2UiT8o1uwAiog3sPOG
         8xJOySBbSbsKuon9LFGLDfSgRCQfV67gpVGyUEt44C8xYknvf3bOFD3U/prD2Xb+HZkw
         Tp/3qJuVpbpaKwsEMet12zLjx+45v/lvTqQbVAWUKg8PJkpGTNO+EZFb4pQz2oe+XXdV
         jJ4A==
X-Gm-Message-State: AOAM532WUNoCMc5zF+aoXpa3pjrEFYmJByrnYuA7RVd8kTpdXAjocHTH
        ucRa7QN8uojcGSoJRZhnn0kQoA==
X-Google-Smtp-Source: ABdhPJzxItgVmxb6RYw1C4UWtl1tHF+ZsHeHFP3F1wViJl75vxhRuqrZWDhrVLCPy0TrNoMJAbEZEg==
X-Received: by 2002:a1c:b342:: with SMTP id c63mr19704294wmf.162.1619441333365;
        Mon, 26 Apr 2021 05:48:53 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id h9sm17610909wmb.35.2021.04.26.05.48.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Apr 2021 05:48:52 -0700 (PDT)
Subject: Re: [PATCH] regulator: Fix current limit for QCOM PMIC VBUS
To:     Mark Brown <broonie@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        wcheng@codeaurora.org, linux-arm-msm@vger.kernel.org,
        dmitry.baryshkov@linaro.org
References: <20210423160658.1542090-1-bryan.odonoghue@linaro.org>
 <20210423163203.GF5507@sirena.org.uk>
 <a2152494-4e8f-27ef-07e7-e575ce3ee653@linaro.org>
 <20210426115548.GA4590@sirena.org.uk>
 <c7f797da-f5b9-5c95-4664-efadf4e7b86b@linaro.org>
 <20210426121218.GC4590@sirena.org.uk>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <8687acdb-75e9-5fc5-dd3e-9a19615676b5@linaro.org>
Date:   Mon, 26 Apr 2021 13:50:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210426121218.GC4590@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/04/2021 13:12, Mark Brown wrote:
> To repeat my original feedback: this needs to be something that is
> configured per system, please make it configured per system.

Sure thing,

It doesn't look like a big problem to add a set_current_limit for this 
regulator.

---
bod
