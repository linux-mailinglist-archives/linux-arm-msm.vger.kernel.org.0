Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 762B93BE04A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jul 2021 02:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbhGGAgg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 20:36:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229834AbhGGAgf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 20:36:35 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 753C6C061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jul 2021 17:33:55 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id d12so355139wre.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jul 2021 17:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=H0ivj7GfRsLfasbZPxiuQPzWhfXlN5upxFwfrb/o5wA=;
        b=cPNFR/uTUf0ZmG1E//I2Bgjrc6eA0TVeoEEc2vJ91w7PJ9J5OJMcycA1nVXqGeYb7o
         zLTxduTW9LN3KXZk+M8mDJzhHUGZPc5OXgDUOUzO+XCKgt4mpep/ItMxF2ZKnjHAQmqo
         +SLZesv3oqewv1n2QVZMzrY0hq8psaENNTUubD3rso+BeJMW8hwvBmY3gUpTT6SYWVe7
         o0GVT7XZ+nBuUjWbsfdX386RWXbOmb9gKMc9ytTL5jvnd3+Z3Xk05EkuKVTxyCkNVus/
         TQI6VBwiwKqJEOIKySmGfWrkKH3BHCCeDvMVMiK3LERZwHNFlUN2f7kXGTzD6sSw6OkA
         fZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=H0ivj7GfRsLfasbZPxiuQPzWhfXlN5upxFwfrb/o5wA=;
        b=jz0enA0XSrt7vuu5sl+aNm01PTdurb9C2kv5degmuCBcjY4GRJ25O+kq+h/P1/iUNh
         JbUo5gLg1dL4OwxLOukM1/s2PZ8n8C4kwbRNVONreKdHszFypKYOW7aelaxAe5xwN2Wf
         I60DZVJbl0idPmdqvmwDDTgWRgIc1tHuH9dtmvPUfryA743T4+82Xn60AYkopKe4LGsw
         Kd72D2punNwPyxc8139Y1vlwBjR5Vtgk6tdM/BLRi0ut/68P9iNH/U5DE/veVQgeI8Uh
         38jE6cw0SXsLWC1/CT7OM6rSSaYUTiy6THScm31YfrtoB4km7eOc8sqCmdZuFmXSHZBN
         ORqQ==
X-Gm-Message-State: AOAM530riyHiLvjkjrANqDnoztOx37on1qMWOJ4nel5kM15be4LOryvZ
        GLS80D9TVHSD9Xw1iz9BenjXBw==
X-Google-Smtp-Source: ABdhPJzzL9QXYAvHIs/H00tMy8lwzYzpbah7e4csorMCKStP9dp4xg69Fl2RfbBLWDrfyxqrWPBqJA==
X-Received: by 2002:a5d:548a:: with SMTP id h10mr24250272wrv.273.1625618034109;
        Tue, 06 Jul 2021 17:33:54 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id f18sm18963800wru.53.2021.07.06.17.33.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jul 2021 17:33:53 -0700 (PDT)
Subject: Re: [PATCH 2/2] phy: qcom-qmp: Register as a typec switch for
 orientation detection
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     vkoul@kernel.org, kishon@ti.com, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        robh+dt@kernel.org, jonathan@marek.ca,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Wesley Cheng <wcheng@codeaurora.org>
References: <20210706230702.299047-1-bryan.odonoghue@linaro.org>
 <20210706230702.299047-3-bryan.odonoghue@linaro.org> <YOTuh2hYp7IC+4rt@yoga>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <9f213505-c118-b6fd-676b-1bafd83d8380@linaro.org>
Date:   Wed, 7 Jul 2021 01:35:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YOTuh2hYp7IC+4rt@yoga>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/07/2021 01:00, Bjorn Andersson wrote:
> In order to perform link training on 4 lanes we need to reset the
> PHY_MODE_CTRL with only DP_MODE.

We're only the two lanes for USB on sm8250 and at the moment only USB 
works - not dp on 8250.

Perhaps you've discovered why the DP times out on 8250..

> In my efforts on sc8180x I skipped the disable/enable in switch_set() (I
> believe because I didn't have the init_count check...) and then in
> qcom_qmp_phy_configure_dp_mode() I issue a reset when we're heading to 4
> lanes. Perhaps we can do the disable/enable and achieve the same thing,
> but as written here you won't get 4 lanes...
> 
> I will do some more testing.

Do you have a commit I can cherry pick ? Might be worth testing out with 
tcpm + dp on the sm8250 if its working for you on sc8180x

