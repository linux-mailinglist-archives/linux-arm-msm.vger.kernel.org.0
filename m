Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 292F43BE5EB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jul 2021 11:49:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbhGGJw1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jul 2021 05:52:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbhGGJw0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jul 2021 05:52:26 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 867CCC06175F
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jul 2021 02:49:45 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id i94so2332255wri.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jul 2021 02:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3Ah6SmWw+cQM7QbVQt6NGdQ/u/LpehuRYbtDs4WMSw0=;
        b=LyG8/0qnwWK0lAOd2GPsmjLXainxg1IZlWzi4DlXFIiFroIFQWIwSdlXv2X1UwPf38
         tUXkiSpERkKXZmp1Wk0qUCdUsM6jv50QThbG+vlCCcvQ9yEUcl8jTmsn8SLXVH4HxylW
         yxzkqyT53ga0m2Q0YVCggptzqjTMNnMBWP5IzK6qzS4ruF4Fu/pK1tlloB3xjt3r84Rw
         KSQEJ6KnHqn+OSRXv5xvapBhedvQaPHlqYm4+Lm6uTL+68P+39G07idOjPsQmvFueNSX
         SQhJ7eOjWpSrF5UPYzYk0BeA07apnpGhh85FyJqosUIoe21Gz86hg3ZvFSneYekdhgV8
         DG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3Ah6SmWw+cQM7QbVQt6NGdQ/u/LpehuRYbtDs4WMSw0=;
        b=MGAZSShYAjFZCW2F5onTuiyOPqFG47nFpaHpuj5abcJqjc/0IvVwR0JZEhlcjAaFgu
         MNh3xExnlSCTwcCCRRTG0WBTY3lNTMSEmv+Z95unCYgXJE1/PwyHScNnD4LNGTAIBcRM
         HUG9VeaxolTnJs+ktZsdCRJMaYStcqHKnQAuj9gUS/J40EuoTaUtPckzAcfFz0RyknOg
         4x1fZUaFc2/OAoYeV0EIKA21f/KZhjrPMb9Tt5hViAdnAdEhl2aj9n8BIs4HbHx1miLJ
         byCvo2ploSYTooLlVH9AfWqAEAkBjcH85e0BizlgOPaSN36LXhHNY78DE93edExIl0Zl
         4ndg==
X-Gm-Message-State: AOAM530OD4MqXS7+Kq+3eMYyatN7WDNRLkONwN/6EgBXH2qgs/ebcQ2a
        onw1TgpNcq/6fre5/ujym0rDfz7v73wHDQ==
X-Google-Smtp-Source: ABdhPJxbDDfLEpSC4UQO3E5SsZzaJcxLjtxAmbpIeiiT/5+TtYzE1F0z6Pdv7aD8zXXO0jRfopeb+w==
X-Received: by 2002:adf:e78c:: with SMTP id n12mr8268140wrm.382.1625651383892;
        Wed, 07 Jul 2021 02:49:43 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n12sm22085825wmq.5.2021.07.07.02.49.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jul 2021 02:49:43 -0700 (PDT)
Subject: Re: [PATCH 2/3] usb: dwc3: Add role switch relay support
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     balbi@kernel.org, agross@kernel.org, gregkh@linuxfoundation.org,
        jackp@codeaurora.org, wcheng@codeaurora.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20210704013314.200951-1-bryan.odonoghue@linaro.org>
 <20210704013314.200951-3-bryan.odonoghue@linaro.org> <YOU4Tqol/CPzHNwM@yoga>
 <51a11204-cd59-e18f-7dc3-f78632e77bde@linaro.org>
Message-ID: <118845cc-d0ca-e2a5-6950-800c66989a5b@linaro.org>
Date:   Wed, 7 Jul 2021 10:51:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <51a11204-cd59-e18f-7dc3-f78632e77bde@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/07/2021 10:49, Bryan O'Donoghue wrote:
> On 07/07/2021 06:14, Bjorn Andersson wrote:
>> So you're going to rely on DT to create a role-switch link between the
>> dwc3 core driver and the qcom wrapper?
>>
>> As I said the other day, this is just a hack to get around the fact that
>> of_platform_populate() may return before the dwc3 core has probed.

> either way instead of avoiding the fact that dwc3-core can defer we 
> should make it that dwc3-qcom::probe() exits* only when the dwc3-core is 

*completes
