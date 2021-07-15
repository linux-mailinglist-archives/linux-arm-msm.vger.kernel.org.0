Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0A0D3C9C16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jul 2021 11:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237514AbhGOJtV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jul 2021 05:49:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231655AbhGOJtU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jul 2021 05:49:20 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27301C06175F;
        Thu, 15 Jul 2021 02:46:27 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id y4so4659946pfi.9;
        Thu, 15 Jul 2021 02:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=C8SjSGLJzEfACcm5NPtM5nAF3IsfxbIU6B1F/vbsJM0=;
        b=FXFF1QoMmKUvNDRnXHfuBt4gS4q3R+bEV/eqcKGNedR1ICJZhaJHM8XYH0YgvrGsBL
         jcZMsTGR3f/aWXGTluP1iWZYUU4mywOSg6fqkog6oFDoVha21OiwpRe7Vtyk42et4Bzz
         M4UixCHokvwcqjuBcjOgDDJhgsXFvPpLQq3PODkCCsupnKv597ywU9yix9CblEvhMo5E
         bGuz86vpndX2QeweBi/vqIe06wh4L+ZiK8wNzpJd8DNtlkEUvp8v+3P76b6RRDuLvAJO
         U+TjnU6x4NxzWnRjk0KTHg1JVDZScweLdQ2xM/QmXN7MVvIiRjewmTMy4xlDXvxuEDlq
         Q9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=C8SjSGLJzEfACcm5NPtM5nAF3IsfxbIU6B1F/vbsJM0=;
        b=pX4JAqA2mrt9COD4d1s7ca6opI5DM7oiRPaajLyzINw/18y8b1WyoS9rJbzTViy/1y
         /kQaxs7aMwNPLRp6X2c/9gZag6dc/dDVFWygPokfUGOwxYONMfS5jh//OM0DTZ6v8roW
         iEmqECi+87tYI8z/pCnOWY6oQMIhKDGE7LHqPCRkAWiUwU1I6tgAJ+sb+HFVy+GwNqyf
         V4SsGCfWxxowt2+vAwjkcS8g45NZd0pCfurgFLzHet1Xl5x9xIZSp3iMhbm5TtcI1rn3
         c5MBvxEYAq/4O9tTSELx6FNwiQj0cBDk68I06ZQ4O5EUVqOtaVutIn63GSjNQEa1ZwYo
         k/AA==
X-Gm-Message-State: AOAM532oz86bM9e4u3yWOWH8kP8RgRW52ZFcbKmHy4OJhRLUMG4Ue1Pc
        xTyC+O9ydkSDOcVgymnoahpUGBX1r7Y=
X-Google-Smtp-Source: ABdhPJzU52xnfuIqfrMVqz5cgdOh9+Yg129e4JywoOe3tvf4gE5CcSIA+45G7YuV3FC/DyBEPIARFw==
X-Received: by 2002:a05:6a00:1713:b029:332:7eca:41a1 with SMTP id h19-20020a056a001713b02903327eca41a1mr3811487pfc.26.1626342386421;
        Thu, 15 Jul 2021 02:46:26 -0700 (PDT)
Received: from [166.111.139.114] ([166.111.139.114])
        by smtp.gmail.com with ESMTPSA id e13sm6031779pfd.11.2021.07.15.02.46.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jul 2021 02:46:25 -0700 (PDT)
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [BUG] bus: mhi: possible ABBA deadlock in mhi_pm_m0_transition() and
 mhi_send_cmd()
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <0a213c92-32d5-efc8-079b-dd20d5ecfe20@gmail.com>
Date:   Thu, 15 Jul 2021 17:45:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

I find there is a possible ABBA deadlock in the MHI driver in Linux 5.10:

In mhi_pm_m0_transition():
262:     read_lock_bh(&mhi_cntrl->pm_lock);
281:     spin_lock_irq(&mhi_cmd->lock);

In mhi_send_cmd():
1181:   spin_lock_bh(&mhi_cmd->lock);
1207:   read_lock_bh(&mhi_cntrl->pm_lock);

When mhi_pm_m0_transition() and mhi_send_cmd() are concurrently 
executed, the deadlock can occur.

I check the code and find a possible case of such concurrent execution:

#CPU1:
mhi_poll (mhi_event->process_event(...))
   mhi_process_ctrl_ev_ring
     mhi_pm_m0_transition

#CPU2:
mhi_prepare_for_transfer
   mhi_prepare_channel
     mhi_send_cmd

Note that mhi_poll() and mhi_prepare_for_transfer() are both exported by 
EXPORT_SYMBOL.
Thus, I guess these two functions could be concurrently called by a MHI 
driver.

I am not quite sure whether this possible deadlock is real and how to 
fix it if it is real.
Any feedback would be appreciated, thanks :)


Best wishes,
Jia-Ju Bai

