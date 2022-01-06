Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE463485D07
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jan 2022 01:20:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343655AbiAFAUz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jan 2022 19:20:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343647AbiAFAUq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jan 2022 19:20:46 -0500
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CB61C061201
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jan 2022 16:20:45 -0800 (PST)
Received: by mail-io1-xd2d.google.com with SMTP id x6so1095940iol.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jan 2022 16:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=message-id:date:mime-version:user-agent:from:subject:to:cc
         :references:content-language:in-reply-to:content-transfer-encoding;
        bh=ZWZNAaMYuUOkfqGJtxgdMDo0PTZ6C2mdFW9/wSPlfYQ=;
        b=CfJtSGujrA2TNT3Xw23jHcs2FegGt+FambbYo6Kh4lXBVJoqtncGvPPsxXJ37I3jz8
         XuF5Z1KJSRApnNjlNOxqAY838U4eOk/giezI7HYdQ0URH5HbanXMDX39Psb5Jr1cRWeV
         rRI9f0xbQCmrckIHPrecfiikk28np48jqqQuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:references:content-language:in-reply-to
         :content-transfer-encoding;
        bh=ZWZNAaMYuUOkfqGJtxgdMDo0PTZ6C2mdFW9/wSPlfYQ=;
        b=TxJX7tVPTErKXYLnjg5d2sVMqUNqFddBYYCcYuqxUI1rAlrC1nhAmgNUOJEQNeYjQz
         +iC9Hur86JZJdJOAcoX7x03XImbLE6Yz3U9m0zUA/tzecY913yU0Hg1LYZTH7PJBXtjU
         +BevMdbLk9ZoiS6GyY7kXu/n4mm+rGGsQykX27KOWrzOKLKfMRfuJyae33Q7x/VYrSdm
         ONqabDNHckwHWxiI5GaD5ikotj8nXESDDfgPI+LOr+dRjVqqIHT6bOqFALKTIn3yJN4M
         WOgy0yG5yRvKlVBvK8tzlpm0k7U7XxxzygRbi76JOsgxzgz8oFbPhNDKuOM7amIbA14q
         6UJA==
X-Gm-Message-State: AOAM531Wwlu2a9bIDDo7Udfh52199AwJFWWXl29cQQ+YFvG0OL/9GoMp
        DubAciFYZQ8g0vfmtI56VIV9iw==
X-Google-Smtp-Source: ABdhPJwEAohfzRiEkVBc6VvCbYmtedQJjXtSdczgudU+olr903/NAPGyTJmeU4GOe2w/wWuUIV9jng==
X-Received: by 2002:a05:6602:214a:: with SMTP id y10mr25647617ioy.121.1641428444736;
        Wed, 05 Jan 2022 16:20:44 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id m14sm284397iow.54.2022.01.05.16.20.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jan 2022 16:20:44 -0800 (PST)
Message-ID: <dcc9e2c6-c4ce-9a0b-9448-622e9546790d@ieee.org>
Date:   Wed, 5 Jan 2022 18:20:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
From:   Alex Elder <elder@ieee.org>
Subject: Re: [PATCH 01/20] bus: mhi: Move host MHI code to "host" directory
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        mhi@lists.linux.dev
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        quic_jhugo@quicinc.com, vinod.koul@linaro.org,
        bjorn.andersson@linaro.org, dmitry.baryshkov@linaro.org,
        skananth@codeaurora.org, vpernami@codeaurora.org,
        vbadigan@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211202113553.238011-1-manivannan.sadhasivam@linaro.org>
 <20211202113553.238011-2-manivannan.sadhasivam@linaro.org>
Content-Language: en-US
In-Reply-To: <20211202113553.238011-2-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/2/21 5:35 AM, Manivannan Sadhasivam wrote:
> In preparation of the endpoint MHI support, let's move the host MHI code
> to its own "host" directory and adjust the toplevel MHI Kconfig & Makefile.
> 
> While at it, let's also move the "pci_generic" driver to "host" directory
> as it is a host MHI controller driver.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

This is a fairly trivial movement of code, so I have no real feedback.

					-Alex

> ---
>   drivers/bus/Makefile                      |  2 +-
>   drivers/bus/mhi/Kconfig                   | 27 ++------------------
>   drivers/bus/mhi/Makefile                  |  8 ++----
>   drivers/bus/mhi/host/Kconfig              | 31 +++++++++++++++++++++++
>   drivers/bus/mhi/{core => host}/Makefile   |  4 ++-
>   drivers/bus/mhi/{core => host}/boot.c     |  0
>   drivers/bus/mhi/{core => host}/debugfs.c  |  0
>   drivers/bus/mhi/{core => host}/init.c     |  0
>   drivers/bus/mhi/{core => host}/internal.h |  0
>   drivers/bus/mhi/{core => host}/main.c     |  0
>   drivers/bus/mhi/{ => host}/pci_generic.c  |  0
>   drivers/bus/mhi/{core => host}/pm.c       |  0
>   12 files changed, 39 insertions(+), 33 deletions(-)
>   create mode 100644 drivers/bus/mhi/host/Kconfig
>   rename drivers/bus/mhi/{core => host}/Makefile (54%)
>   rename drivers/bus/mhi/{core => host}/boot.c (100%)
>   rename drivers/bus/mhi/{core => host}/debugfs.c (100%)
>   rename drivers/bus/mhi/{core => host}/init.c (100%)
>   rename drivers/bus/mhi/{core => host}/internal.h (100%)
>   rename drivers/bus/mhi/{core => host}/main.c (100%)
>   rename drivers/bus/mhi/{ => host}/pci_generic.c (100%)
>   rename drivers/bus/mhi/{core => host}/pm.c (100%)
> 
. . .
