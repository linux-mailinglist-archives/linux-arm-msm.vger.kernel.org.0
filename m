Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3B23160C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 09:17:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233375AbhBJIR4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 03:17:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231494AbhBJIRz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 03:17:55 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28F83C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 00:17:15 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id u11so762918plg.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 00:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ajw83oEbRgZb4umc5b4dBWqnuRAj7SDYLU8OwlZ8mNY=;
        b=MNMkRDF724Vb+uR4MLIv+VRCsbMg9EmxiJgQiwFXTXoJpw963lxfI2AjmmETNJW7hQ
         5UBCGplUNaGPClxBQkSBHL6Dfl3XUcupZtgui1qMRHZ6KM8eLLpMVcrqf/9uq78n9d42
         rB+j21qR/8MThqk1EZY5ajF6pQDszNNYaZklmzapEC1FPder90QnspIidslBN0lZgyS/
         4M6yihmF5Drk1rfHhqU+jeKh4aE3ERpsctUAL4q0OTd+nrYlmtgOep4HaBNVqXjo0riw
         JR3BDgQSMKjBQl3xae50FnHGzKMCqbJaYzJLFSDQThgWYY4SVzPhSGe11QkKCs0xaGrX
         Rgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ajw83oEbRgZb4umc5b4dBWqnuRAj7SDYLU8OwlZ8mNY=;
        b=PW6AOpZBsHsPs8a9rIXtuVTrG6GhmgkDMNtw9hhYNOHWowBPErALiEAARS7QGUvO8t
         zNYsBMe3MySqVAUC9h8kU1z7lDr26+n8IWnHZ0OsPdhIFdviTiDzs4Xyh4sihK5wKzpJ
         dPvDmONXhr7b6/4e7KTNzKG6qol4HxoRrejL3l7NVQkkMVa4JpVGBtDlWndJPVHheJQE
         nlhvSbtLWZoJwPbhwFEQw8vhzJkZO3DYaiv7+Ve/LcGnvOA3VZGMl0cvmRh5CzWT60He
         CtpdNPGD2fa57cBSmeJQ3qmWvLRP3/uveUEaHA+C7+4oWxIETKys6ez7fZMt/Jr6nGxL
         OZqw==
X-Gm-Message-State: AOAM531Kgb8/E+1rDGPNg3Bp60bgG7af6vmrAmE6J3lkMHKLDe10YGR+
        WlZMvSQdxCszJ5QVzw2KqT+4
X-Google-Smtp-Source: ABdhPJxFqamnVaThR4RIohWaRl2JYJEg3Rb8i+ySEh+AaV2Xf3sMUqjmKloACbfvrn99503Vxy/XGA==
X-Received: by 2002:a17:902:f28d:b029:e2:9654:ed31 with SMTP id k13-20020a170902f28db02900e29654ed31mr1924758plc.2.1612945034638;
        Wed, 10 Feb 2021 00:17:14 -0800 (PST)
Received: from work ([103.66.79.29])
        by smtp.gmail.com with ESMTPSA id e185sm1379977pfe.117.2021.02.10.00.17.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Feb 2021 00:17:14 -0800 (PST)
Date:   Wed, 10 Feb 2021 13:47:10 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] mhi: Fix double dma free
Message-ID: <20210210081710.GA19226@work>
References: <1612885989-12288-1-git-send-email-loic.poulain@linaro.org>
 <f2612a01-2c10-9735-d4ba-46ea87c70379@codeaurora.org>
 <CAMZdPi_16SfDoYC0vqqhRfEOqn3SHc6EUmfpVz0RRLaGek7_PQ@mail.gmail.com>
 <7a641d95c2e8c74c7dfc537c74a7ae1a@codeaurora.org>
 <CAMZdPi-3PBGLE7KYoSkKWOT7YrbrpA70NRJo2Lrc-MQr=oKUyg@mail.gmail.com>
 <9916d2b982f8ad407c7d5297da7d946d@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9916d2b982f8ad407c7d5297da7d946d@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 09, 2021 at 08:37:21PM -0800, Bhaumik Bhatt wrote:
> Hi Loic, Mani, Hemant,
> 

[...]

> If priority is to get this fix in ASAP, your suggestion is OK. I just see
> some
> typo fixes and a title update to "bus: mhi: core: Fix double dma free()
> call"
> or something as review comments for your patch.
> 
> Another option is that I can send my patch [1] separately and remove it from
> my
> "channel updates" patch series, if that helps.
> 
> I'd like to see what Mani and Hemant on what they prefer. Please advise.
> 

Both patches looks good to me although your patch needs to be resubmitted. But
since the fix needs to go in quickly, I'm going to apply Loic's patch.

Thanks,
Mani

> Thanks,
> Bhaumik
> 
> [1] https://lkml.org/lkml/2021/2/4/1161
> 
> ---
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
