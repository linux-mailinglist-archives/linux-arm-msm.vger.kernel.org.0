Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C2DC485D05
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jan 2022 01:20:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343637AbiAFAUk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jan 2022 19:20:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343634AbiAFAUi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jan 2022 19:20:38 -0500
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B544BC061245
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jan 2022 16:20:38 -0800 (PST)
Received: by mail-il1-x12f.google.com with SMTP id o1so660747ilo.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jan 2022 16:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=message-id:date:mime-version:user-agent:from:subject:to:cc
         :references:content-language:in-reply-to:content-transfer-encoding;
        bh=AZG/3izPrqbNdFVOI98J9HW2dqLN/BP9IAcfziZSEP4=;
        b=MnBajTvxp8eU0L3hLnzVoRJnTutXtbEhgSQakAY9tYmC+slAPEtSVLCCPYWFxqwZqb
         op6nn31CKEasshNFZrUhZ7Rd4QOXgKvF7KASw5uWSkrevHtr4vkAUjMIbYrC6blorT4O
         Ckt4XlrVq7iMRevz0spBbfcJIUjBmGSN7ADFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:references:content-language:in-reply-to
         :content-transfer-encoding;
        bh=AZG/3izPrqbNdFVOI98J9HW2dqLN/BP9IAcfziZSEP4=;
        b=hQSVBeS19c7+knZ1iOmT25WzSa4/xwJ0V/m82tBjUFhegXJ5sKFaLoLsbwhfW44yVO
         RGymu8rXveVMF72IpsXO2ELptylO2sIev83mnWlY4q73LsHZXHw8aL2ZDq2He7iN+yLk
         jOV0HSd579r6VrrQv1hXY4uIkfapOzQnhK/rwS0Be/UW6x3mT/eC3w3YnM3Ibk2D4n4l
         BKBm6cI7qT6daizgG7AOE1IG4qZ34cvFwzzf6dROdnoQ9aivdN0w63VibpuPG16a3A2D
         WADKuAOu9Mcj/ggNeT8HtlqFYKD9jEAeGX+0aVGBm4nyaJ1Y+QOqLPa2jH9nXBQs9fBH
         kdaQ==
X-Gm-Message-State: AOAM531mFJ/27PGm1dvYukos1CFVQku4jrszCzLCCdwJRi0Tkl9cmWyg
        OYj7i6lrVKMdlBNzPxdtBHHBQw==
X-Google-Smtp-Source: ABdhPJwsXtsahcJ2kK+14f3ObRdZPJlc4Eq0U7KimTVyqIFO6uF5qvLcdnWyUlQijN9mhIN3YsyWtg==
X-Received: by 2002:a92:4a11:: with SMTP id m17mr265555ilf.176.1641428438130;
        Wed, 05 Jan 2022 16:20:38 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id u24sm293697ior.20.2022.01.05.16.20.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jan 2022 16:20:37 -0800 (PST)
Message-ID: <d14b4f82-7ac5-e914-25c5-98816d26b044@ieee.org>
Date:   Wed, 5 Jan 2022 18:20:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
From:   Alex Elder <elder@ieee.org>
Subject: Re: [PATCH 00/20] Add initial support for MHI endpoint stack
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        mhi@lists.linux.dev
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        quic_jhugo@quicinc.com, vinod.koul@linaro.org,
        bjorn.andersson@linaro.org, dmitry.baryshkov@linaro.org,
        skananth@codeaurora.org, vpernami@codeaurora.org,
        vbadigan@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211202113553.238011-1-manivannan.sadhasivam@linaro.org>
Content-Language: en-US
In-Reply-To: <20211202113553.238011-1-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/2/21 5:35 AM, Manivannan Sadhasivam wrote:
> Hello,
> 
> This series adds initial support for the Qualcomm specific Modem Host Interface
> (MHI) bus in endpoint devices like SDX55 modems. The MHI bus in endpoint devices
> communicates with the MHI bus in host machines like x86 over any physical bus
> like PCIe for data connectivity. The MHI host support is already in mainline [1]
> and been used by PCIe based modems and WLAN devices running vendor code
> (downstream).

Today I'm offering some initial review comments on this series.

I told you offline I had quite a few comments.  When I looked at the
code a week or two ago I looked at the end result...  So my notes
didn't line up well with the way you built it up incrementally.
(Still, the way you did it is generally good for review.)

I got through patch 9 and kind of petered out.  I can look at the
rest tomorrow and/or can give you a chance to update before I
review more.  I'll let you decide...

					-Alex

> Overview
> ========
> 
> This series aims at adding the MHI support in the endpoint devices with the goal
> of getting data connectivity using the mainline kernel running on the modems.
> Modems here refer to the combination of an APPS processor (Cortex A grade) and
> a baseband processor (DSP). The MHI bus is located in the APPS processor and it
> transfers data packets from the baseband processor to the host machine.
> 
> The MHI Endpoint (MHI EP) stack proposed here is inspired by the downstream
> code written by Qualcomm. But the complete stack is mostly re-written to adapt
> to the "bus" framework and made it modular so that it can work with the upstream
> subsystems like "PCI Endpoint". The code structure of the MHI endpoint stack
> follows the MHI host stack to maintain uniformity.
> 
> With this initial MHI EP stack (along with few other drivers), we can establish
> the network interface between host and endpoint over the MHI software channels
> (IP_SW0) and can do things like IP forwarding, SSH, etc...

. . .
