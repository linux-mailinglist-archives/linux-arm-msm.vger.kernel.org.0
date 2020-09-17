Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 981D826E958
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Sep 2020 01:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbgIQXQn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Sep 2020 19:16:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726040AbgIQXQm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Sep 2020 19:16:42 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAF4DC06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2020 16:16:42 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id q21so3613215ota.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2020 16:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=YeOyKeCzbk9VWMgOTxwltUHxECBUKayGqCzk0HAQiXM=;
        b=W614FkUN/tdIYzf9qMMdeL1QrJDlDKeBxOZ78PcE/uZTbTqryTGwCaQ2lVqJv3tVa6
         1pWitjG94eKsyf9d9cjiOBasZyml+Uf4l1AB8P1yeTQWOGieEOHyPVWS+PuvJMXwYDpZ
         E0/Z/QH4vHeswWBOAz/5Vmqe3eq8nnsot4oh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=YeOyKeCzbk9VWMgOTxwltUHxECBUKayGqCzk0HAQiXM=;
        b=kK/WfMohKKXH0Vy15YVbBoK9eVujVp0b0JlL1L62THQBzMXjAi7yLTchxnbT9XusMk
         MdBm6M+Du6l8FhifHMP6fVpgC8pEW3K73dJNObcHrmwk5N/Z7dQwgDKI3Z3ZvXsV+U2I
         nE/228b9w8E78j7SDPf1Xhar3FyWRsyLJ+bVXtM4Uy0shssVpAiOQVATNvBtNRIp8qp3
         Nuvaey/YSnd7zwLITJeIqLcmT+T5flJUgTKgBChJUhYle/xEy58qO127fLNUz0FC40Ka
         Qdg1REiX60XsYXnWny4sP2LqaICPDbRH7m2Nk3COI+9U8V4L+swRrAQQLAek/4KIf8fb
         CFBw==
X-Gm-Message-State: AOAM533ajsFRv81gmwsjn1r+btg+B2SOpviP4Mta47X60GiM+dw+oDQZ
        c9d39zcKwMdIXg7Bde5De7yeCg==
X-Google-Smtp-Source: ABdhPJx+UGHmNQ/BidpCBn/LPEtpga+MaVySdfe/g+ZP/KcC7X7ODQWsK27boq70o9w5XD7pJisOTw==
X-Received: by 2002:a05:6830:1e30:: with SMTP id t16mr21703501otr.18.1600384602162;
        Thu, 17 Sep 2020 16:16:42 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id o13sm920200otj.2.2020.09.17.16.16.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 16:16:41 -0700 (PDT)
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        jhugo@codeaurora.org, sdias@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Subject: bus/mhi/core: Double lock in mhi_device_put() and dev_wake inc/dec
Message-ID: <5029d4b5-d614-eef3-5a7a-9c8e1c3e7ddb@linuxfoundation.org>
Date:   Thu, 17 Sep 2020 17:16:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

While looking at this file for an unrelated issue, I happen to notice
there is a double locking on mhi_cntrl->pm_lock in the mhi_device_put()
when it gets called from mhi_driver_remove()

The other two calls from mhi_driver_probe() don't hold the pm_lock.

In addition, lock holding while dev_wake updates is inconsistent.

dev_wake gets incremented and decremented without holding pm_lock in
mhi_device_get(), mhi_device_get_sync() and mhi_device_put().

Exception are when mhi_device_put() is called from mhi_driver_remove().

The following commit is where all this code is added.

bus: mhi: core: Add support for data transfer
https://github.com/torvalds/linux/commit/189ff97cca53e3fe2d8b38d64105040ce17fc62d

It appears to be real problem. I don't have a way to test this driver,
hence reaching out to let you know about my findings.

thanks,
-- Shuah
