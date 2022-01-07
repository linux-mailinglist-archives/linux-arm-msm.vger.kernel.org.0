Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79F51486E48
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 01:04:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343714AbiAGAEY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 19:04:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343705AbiAGAEY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 19:04:24 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC37DC061245
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 16:04:23 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id f66-20020a9d03c8000000b00590788fb853so4866641otf.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 16:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=J7C4yHitHR47NwWThmeAgvuR8JMdvoB6j8bjsW2LazI=;
        b=HY53Wt6hjFWIGUiPpgKBdRw0ZwLfNwrtTa42eqWDZjG84pTQUogeS7LpPIRBr4xTdN
         Y+ULiF6Bh+PjVjuxRvhX4T7vS+EA9971FKMZSkM4/8d76UIbFnn5nzlKmd8Bq4jIgNu5
         wAyTcDm/46rXItNOyVN7xdp2aS1KKuNopJwa19i1+7rF9d3CqQsmvdOA8StOICA7hSsn
         IpTfO8qge36Pfw18UZr72bpGazYbX4eFxtYoYPEV0cCT8Vxv0IywwbEDw8AbJbasyAI9
         kT/D0bFQdFdtTxpw3+xIGGrAczy77SqaL5n4L7mbMGy7b0mtTYipFzvfP+uXO9wWm5L0
         yOwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=J7C4yHitHR47NwWThmeAgvuR8JMdvoB6j8bjsW2LazI=;
        b=rVcr2FDjbkBt4Wp+4geGeJfII85KjQo/yEjfDqDv6T9kDy6VyefOaKGPIjFt7wCaHh
         2eNFH8oNKeYhI2wqox0AICcQxktVyiT0CH2HTLUsH4tYZbQRdswqseEwCoUFytSwujX1
         AGuJI1Um3RhA9hW4h+soUVf4YtQfZZC1tXKenugo+8lQGy2pwvwzH3AxNFcujiHq4bLL
         xuxE1x4dljXfdhTAfCCEtsTAxvkT4Uxl1M8knsdzfbMrw+1ff46UifSen98Vl4FDf/kQ
         LFq6m+HJaCpwBJuUoTdUb9eiWgJ9Gh/0SWKJywvZNLWFap/y2o+K8h2pNHX8yM70B2uY
         RhHA==
X-Gm-Message-State: AOAM531cAnrp6O4K0h0C5DUftm6b/iSFPkb57KlzPZfSFqslev0SJJaB
        //FmoixNGKXLdjnPqJiYF3jTsw==
X-Google-Smtp-Source: ABdhPJy2c2E/SjB/T65xvjIV5zoB+HHwkiqPtMiEA0/4xJ52Y/gWSDSsPp2FYuPdYGsWvyW0DUs/Lg==
X-Received: by 2002:a05:6830:2379:: with SMTP id r25mr43959467oth.343.1641513863111;
        Thu, 06 Jan 2022 16:04:23 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a17sm732379oiw.43.2022.01.06.16.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 16:04:22 -0800 (PST)
Date:   Thu, 6 Jan 2022 16:05:10 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc:     Thara Gopinath <thara.gopinath@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, vkoul@kernel.org
Subject: Re: [PATCH V6 0/7] Add driver support for Data Capture and Compare
 Engine(DCC) for SM8150,SC7280,SC7180,SDM845
Message-ID: <YdeDtlmPRQx3FU9i@ripper>
References: <cover.1628617260.git.schowdhu@codeaurora.org>
 <396edd95-4f38-6830-99da-11e73d62a0cf@linaro.org>
 <705c280b-bced-476d-8e21-1a5afbf3d2f3@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <705c280b-bced-476d-8e21-1a5afbf3d2f3@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 06 Jan 07:20 PST 2022, Souradeep Chowdhury wrote:

> 
> On 12/16/2021 9:18 PM, Thara Gopinath wrote:
> > 
> > 
> > On 8/10/21 1:54 PM, Souradeep Chowdhury wrote:
> > > DCC(Data Capture and Compare) is a DMA engine designed for debugging
> > > purposes.In case of a system
> > > crash or manual software triggers by the user the DCC hardware
> > > stores the value at the register
> > > addresses which can be used for debugging purposes.The DCC driver
> > > provides the user with sysfs
> > > interface to configure the register addresses.The options that the
> > > DCC hardware provides include
> > > reading from registers,writing to registers,first reading and then
> > > writing to registers and looping
> > > through the values of the same register.
> > > 
> > > In certain cases a register write needs to be executed for accessing
> > > the rest of the registers,
> > > also the user might want to record the changing values of a register
> > > with time for which he has the
> > > option to use the loop feature.
> > 
> > Hello Souradeep,
> > 
> > First of all, I think this is very a useful feature to have. I have some
> > generic design related queries/comments on driver and the interface
> > exposed to the user space. Also, I do not understand the h/w well here,
> > so feel free to correct me if I am wrong.
> > 
> > 1. Linked list looks like a very internal feature to the h/w. It really
> > is not an info that user should be aware of. I tried reading the code a
> > bit. IUC, every time a s/w trigger is issued the configs in all the
> > enabled linked lists are executed. The final ram dump that you get from
> > /dev/dcc_sram is a dump of contents from all the enabled list? Is this
> > understanding correct ? And we are talking of at-most 4 linked list?
> > If yes, I think it might be better to have a folder per linked list with
> > config, config_write etc. Also if possible it will be better to dump the
> > results to a file in the specific folder instead of reading from
> > /dev/dcc_sram.
> > If no, there is no real need for user to know the linked list, right?
> > Choosing of linked list can be done by kernel driver in this case with
> > no input needed from user.
> > 
> > 2. Now to the sysfs interface itself, I know lot of thought has gone
> > into sysfs vs debugfs considerations. But, have you considered using
> > netlink interface instead of sysfs. Netlink interface is used for
> > asynchronous communication between kernel and user space. In case of
> > DCC, the communication appears to be asynchronous, where in user asks
> > the kernel to capture some info and kernel can indicate back to user
> > when the info is captured. Also the entire mess surrounding echoing addr
> > / value / offset repeatedly into a sysfs entry can be avoided using
> > netlink interface.
> > 
> Hello Thara,
> 
> Thanks for your review comments. Following are some points from my end
> 
> 
> 1) Each linked list represent a particular block of memory in DCC_SRAM which
> is preserved for that particular list. That is why offset calculation is
> done on the driver based on the linked list chosen by the user.
> 
>     This choice needs to be made by the user since the number for the linked
> list chosen is specific to the registers used to debug a particular
> component.  Also we are giving the user flexibility to configure multiple
> 
>     linked lists at one go so that even if we don't have a separate folder
> for it , the dumps are collected as a separate list of registers. Also there
> are certain curr_list values which may be supported by the dcc
> 
>     hardware but may not be accessible to the user and so the choice cannot
> be made arbitrarily from the driver.
> 

But in the end, as you write out the SRAM content, is there really any
linked lists? Afaict it's just a sequence of operations/commands. The
linked list part seems to be your data structure of choice to keep track
of these operations in the driver before flushing them out.

Regards,
Bjorn

> 
> 2) From opensource, I can see that Netlink has been used in most of the
> cases where we need to notify stats to the user by taking the advantage of
> asynchronous communication. In this case, that requirement is not
> 
>     there since it is mostly one way communication from user to kernel. Also
> since this is used for debugging purposes perhaps sysfs adds more
> reliability than Netlink. In case of Netlink we have the additional
> 
>      overhead of dealing with socket calls. Let me know otherwise.
> 
> 
> Thanks,
> 
> Souradeep
> 
> 
> 
> 
> 
