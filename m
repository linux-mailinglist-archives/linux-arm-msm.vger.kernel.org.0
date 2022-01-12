Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7384B48C495
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jan 2022 14:17:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353419AbiALNQ1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jan 2022 08:16:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353434AbiALNQQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jan 2022 08:16:16 -0500
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDDA9C06175B
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jan 2022 05:16:15 -0800 (PST)
Received: by mail-il1-x12e.google.com with SMTP id z17so272150ilm.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jan 2022 05:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zkoZ5MryXhebSZqM6IHkMPC6B3Uzbqu2YHVeALw+ZY8=;
        b=bSv4N9wBD7O1xG7UR7RLPQc1rmgwwjnh33e1bTAHHIzJLoWgc1furTXL6U72ZCiVXF
         dA8XLW69kOrY+DS2ljpSW2CoU2kolTI30jKjFEb+pgX8Rjl8I2DNO2bfvVo+0akJNAWO
         WNXcakUC29BMQdkcSfFz8lyRnFo5/Np650dEC+1xWTMIAyI8SldzRReSYVxRho2rGIH9
         bEGB/CDJq0iGVSDBZ+zU0mUXBWWKP3n74JRQ7qKAB8K8t/qo3mT2HYdydVtuiDNq2xq2
         jBNLVPntykoU3VAj99MDhA4Pd0hKSvJvujvpMwzsZMP5UfYI3a5xmTtgf22Mc9TJDSWm
         OtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zkoZ5MryXhebSZqM6IHkMPC6B3Uzbqu2YHVeALw+ZY8=;
        b=W9pw75GXktL7MYeQd5lS8csRK7Iloih6AW/cOlrCcwRp+bbdo7MyuvG+WMR2BcMVGn
         aAZutr8611iF0X4T4JOA7GtDESxB6d3dA8fbL7T40ynoV0dSkdjjf3II/BsTVTzyLxnQ
         +eg8d888h+HhKkQNYm2qXV75lVancyljSYb3Wl0XF0GmVYy70VG1g4Lj2cFzlZlDlCCQ
         5yx9W1A3ciY4FTtexZrG0ZfFxhniF4ZgydROPnEi6WsOWyu42cn+eXgbUv9FiaTpb1V6
         kFBdXJ+WHJ3ZSMGEWQuYKJVrz8Gyfqx3ZRp0ZBRpcVD1QGnTpi2PTrc8enhg77Z9dELp
         GmlA==
X-Gm-Message-State: AOAM532Azj25574o+Y3CBHZzEFf1LMVnGW8F74etXVD6kwPxBcpEQe73
        PgjbCE9PEO4BfD9vbXvW+kOZyw==
X-Google-Smtp-Source: ABdhPJzoWjW0vEAx2LmHQfkuags0Yw5wQHhmf1tbbd9Y8n1vH54WKWDKVUkF7VNR5ZslNwl0n0iB6g==
X-Received: by 2002:a05:6e02:b2b:: with SMTP id e11mr5003588ilu.48.1641993375027;
        Wed, 12 Jan 2022 05:16:15 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id o21sm8169043iov.48.2022.01.12.05.16.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jan 2022 05:16:13 -0800 (PST)
Message-ID: <9cb552e5-7bae-c591-a0b7-14f25a41eaf9@linaro.org>
Date:   Wed, 12 Jan 2022 07:16:12 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH net 2/2] net: ipa: prevent concurrent replenish
Content-Language: en-US
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, jponduru@codeaurora.org,
        avuyyuru@codeaurora.org, bjorn.andersson@linaro.org,
        agross@kernel.org, cpratapa@codeaurora.org,
        subashab@codeaurora.org, evgreen@chromium.org, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220111192150.379274-1-elder@linaro.org>
 <20220111192150.379274-3-elder@linaro.org>
 <20220111200426.37fd9f67@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20220111200426.37fd9f67@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 1/11/22 10:04 PM, Jakub Kicinski wrote:
> On Tue, 11 Jan 2022 13:21:50 -0600 Alex Elder wrote:
>> Use a new atomic variable to ensure only replenish instance for an
>> endpoint executes at a time.
> 
> Why atomic_t? test_and_set_bit() + clear_bit() should do nicely here?

I think it foreshadows the replenish logic improvements
I'm experimenting with.  The bit operations are probably
best to represent Booleans, so I'll send version 2 that
adds and uses a bitmask instead.

Thanks.

					-Alex
