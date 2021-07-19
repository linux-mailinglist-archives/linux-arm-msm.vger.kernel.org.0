Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D7E33CCC1D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jul 2021 04:09:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233720AbhGSCL7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 18 Jul 2021 22:11:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233713AbhGSCL7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 18 Jul 2021 22:11:59 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65AC8C061762;
        Sun, 18 Jul 2021 19:08:59 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id e14so6035411plh.8;
        Sun, 18 Jul 2021 19:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=9lv01krC1Ir3cayjbUkot1Snxc1f9rBCVOiKjknUIP0=;
        b=ftGSn3Te9lfAd2fA/jvbEyqJ39OHlaJi5nieMP/BpV0GGNYRxIpA6JICntdXkwmJWo
         7OUYi1HCrXBChZPh3iVZ/ys1rk95lPHFimvNhR/Vej7V94HrbK5yVOii03TUjX8p7yQ2
         LL8eKCUjqdA/IRSPApzDOFSEDwvCgeF3HCvk06thDk9BL9k1wei9CRzBh/hfBW+GnWWu
         LTcSpPhi+SV0zjc9nbs6Qm81V0b9F1JQSyTc+5xUkiaU1fIzfgol4s/HZEm9I2Q9ojEb
         5XVJRO8y5gkvn61RiwKTMOlJF3hfQlYkGP6aP1mzhvA+OznqJO4DHkfXp71z8SBtWIK2
         HcMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=9lv01krC1Ir3cayjbUkot1Snxc1f9rBCVOiKjknUIP0=;
        b=cntNGiWYahu/GtiiCzK9DXGvQORsczJ42hmUTAYGmtqlgKHMTUI1J+URGYjPA9xMv+
         yC9eQ0iV7at1lFZArwIQ933O2nJ4V95QNp6750YNVWuLDYMmnJuTz+//StWJjvUJqrKh
         EjEl5T6U/+aBSDhAuPbPw2cHTDPltpyVY5tAGVpiglEd4zUujOEmBqLZrnRO2sWSfe6f
         HPf9tBqpg/va4KWPKwc0jOoG+HnK0fkbC86lqbp5kmg4TLpAMHDeOVna+oyXMZVxN0GW
         y374wJBjqIxs3fgjqYMzTXg/pz30eqBBOz6j3bCqBzkhIMu2NiNmoxYq9LYUDmssKdD/
         fHIQ==
X-Gm-Message-State: AOAM531oYA05S6E8m/IhSynpPwbp7SRXSxJZByhDGhf4vut7UuQYVCxQ
        IPsvzsQnzyNY15jsOqOo5rzsqKzRV14=
X-Google-Smtp-Source: ABdhPJw2OyruLoogmOXxsQVFb6JY44szeId2pZ2WKY3l9ZYwEDqS/yupU8eumm6uoe/puIpm753xcA==
X-Received: by 2002:a17:90a:bd04:: with SMTP id y4mr28337661pjr.127.1626660538648;
        Sun, 18 Jul 2021 19:08:58 -0700 (PDT)
Received: from [10.144.0.86] ([45.135.186.26])
        by smtp.gmail.com with ESMTPSA id v10sm18084837pjd.29.2021.07.18.19.08.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jul 2021 19:08:58 -0700 (PDT)
Subject: Re: [BUG] bus: mhi: possible ABBA deadlock in mhi_pm_m0_transition()
 and mhi_send_cmd()
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <0a213c92-32d5-efc8-079b-dd20d5ecfe20@gmail.com>
 <2fbeeb8dc647dc88e69ec6624c2078d1@codeaurora.org>
 <20210716064512.GE3323@workstation>
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
Message-ID: <34ea09b0-8622-90f5-ee70-68c27081de39@gmail.com>
Date:   Mon, 19 Jul 2021 10:08:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20210716064512.GE3323@workstation>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2021/7/16 14:45, Manivannan Sadhasivam wrote:
> On Thu, Jul 15, 2021 at 09:57:22AM -0700, Bhaumik Bhatt wrote:
>> On 2021-07-15 02:45 AM, Jia-Ju Bai wrote:
>>> Hello,
>>>
>>> I find there is a possible ABBA deadlock in the MHI driver in Linux
>>> 5.10:
>>>
>>> In mhi_pm_m0_transition():
>>> 262:     read_lock_bh(&mhi_cntrl->pm_lock);
>>> 281:     spin_lock_irq(&mhi_cmd->lock);
>>>
>>> In mhi_send_cmd():
>>> 1181:   spin_lock_bh(&mhi_cmd->lock);
>>> 1207:   read_lock_bh(&mhi_cntrl->pm_lock);
>>>
>>> When mhi_pm_m0_transition() and mhi_send_cmd() are concurrently
>>> executed, the deadlock can occur.
>>>
>>> I check the code and find a possible case of such concurrent execution:
>>>
>>> #CPU1:
>>> mhi_poll (mhi_event->process_event(...))
>>>    mhi_process_ctrl_ev_ring
>>>      mhi_pm_m0_transition
>>>
>>> #CPU2:
>>> mhi_prepare_for_transfer
>>>    mhi_prepare_channel
>>>      mhi_send_cmd
>>>
>>> Note that mhi_poll() and mhi_prepare_for_transfer() are both exported
>>> by EXPORT_SYMBOL.
>>> Thus, I guess these two functions could be concurrently called by a MHI
>>> driver.
>>>
>>> I am not quite sure whether this possible deadlock is real and how to
>>> fix it if it is real.
>>> Any feedback would be appreciated, thanks :)
>>>
>>>
>>> Best wishes,
>>> Jia-Ju Bai
>> Few pointers from your example:
>>
>> 1. mhi_poll() is currently not used by any client upstream yet.
> Then this shouldn't be added in first place... :/
>
>> 2. Polling is not to be used for single event ring (shared control + data)
>> cases
>> since it is meant to be for client drivers with dedicated data packets only.
>> 3. mhi_send_cmd() will always be called after an mhi_pm_m0_transition() has
>> completed by design since we wait for the device to be held in M0 prior to
>> it.
>>
> But client can be unloaded during M0 event!
>
> Anyway, I don't think the deadlock scenario is valid because of the usage
> of "read_lock_bh()". So if "mhi_send_cmd()" has acquired
> "spin_lock_bh(&mhi_cmd->lock)", it can always acquire
> "read_lock_bh(&mhi_cntrl->pm_lock)" as multiple readers can acquire the
> read lock.
>
> Deadlock would only occur if one of the functions take write lock.
>
> Thanks for auditing.

Thanks for the feedback and explanation :)


Best wishes,
Jia-Ju Bai
