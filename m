Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A9EF2D1197
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Dec 2020 14:15:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725770AbgLGNPP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Dec 2020 08:15:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725550AbgLGNPP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Dec 2020 08:15:15 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBEC1C0613D2
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Dec 2020 05:14:34 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id h16so2331751edt.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Dec 2020 05:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=TzvDxYVOOf0QC1iDUjuBZzinbLQCQ/SNpFulZ9pWd60=;
        b=RwHvwVn3+DglERbMHVzUaYR8F5YER1SCJZxw+xjP8MpeyY2vnQZ7H+RePD+Ue+53Jm
         Nh81fT9vFpA+6Jnu8I2BcTdZ8PO6gZrqTN66sHFtPMq+9L+ecHKkjZa4Ni4wIMvheNUi
         T2lfoeOZpLS7Yqp1u/Exwy6/W6xT6N9mbixrj3dZWs0U2LAmUVEYW++Q8a0Yvb1IcLUq
         6Phqh6lf1io3YQe7V+4SlejGzuIPcwW8F6CQYgxdSajgnqAhYwPWT2ai0AJhN5XMU5oC
         w5eGkUSolkzhi/HjPGUeIenv+S7x5g75rGjrQCngYLiKxrlNBMt/ntVbD1BqJOSedUUr
         WhFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=TzvDxYVOOf0QC1iDUjuBZzinbLQCQ/SNpFulZ9pWd60=;
        b=VqabJqTdGOjxIMrsxBI2t0PKk01MvrwVhJ4bgooB5TcMJEjY49qmzG86xHKbrP5YUk
         gT3GsBbxDFOzO9raQsHPwgn4TrZpwRVVZV85/cRHZBX8faP1uMkKr0NqBz3zEd3x7x/A
         AkZyWrLjVblgyiMODzm3eeZzLymmAKw8vaMhkc5xbz2J3dqUfbajd38keZ+yoMaxUqqw
         dXpg/2PTpGAwjXsy7gxcVc3/lasOB0emOzD7j7NxH3V7U0FDNFoEQ0LKxuCVs1Bkhku2
         czi3YNy3Ha2+DKH++5kfJBJOJOL9+6G/Zml+CfQ6p7WAkvD4roa9Ju/yTdl8BaIs45wx
         3nUw==
X-Gm-Message-State: AOAM53359JNxyzzoLo8I6dGlFMhKE5LDFzp8efQ9QFU92qE4gngu7nEe
        CB+HdICJ3hy7NyJUnn/YTvTvaTk2S/r3OBw5/pSwzRnWy2xsFFa2
X-Google-Smtp-Source: ABdhPJy7lWBgWt+UFn57MCYdwVxarbcvgeOGx7ANMXndfMSK90e3RVu0MBgSOb+d0ZE3FEXc9qWeTjYJOcp2fXSO5j8=
X-Received: by 2002:a50:f307:: with SMTP id p7mr19704068edm.368.1607346873618;
 Mon, 07 Dec 2020 05:14:33 -0800 (PST)
MIME-Version: 1.0
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Mon, 7 Dec 2020 14:20:56 +0100
Message-ID: <CAMZdPi-LHmeLXGDjsb3kEhXrrv2do5eJ=HrHOnS5r+DqtAwKcQ@mail.gmail.com>
Subject: The MHI interrupt handling issue
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi folks,

Before putting my hands into that, I wanted to expose a MHI interrupt
problem, comments are welcome.

Currently, the hard IRQ handler for event rings do nothing except
triggering a tasklet as bottom half that in turn will take care of
retrieving buffer(s). That leads to have an unexpected high amount of
interrupts when I perform throughput testing with mhi-net (though it
applies for any mhi client driver).

The point is that usually, an hard interrupt handler is responsible
for triggering the bottom half handler but also for
clearing/suspending interrupt on device side. However, AFAIK, there is
no such possibility in the MHI protocol. Since the interrupt is not
handled in the hard irq handler, it is triggered again once interrupt
are re-enabled, and even during the tasklet execution... at the end,
that makes a lot of unnecessary interrupts, that introduce latency and
participate to system load...

I added some printk to highlight that issue:
[11564.689202] mhi_irq_handler 55d32b8
[11564.689485] mhi_irq_handler 55d32b8
[11564.690011] mhi_irq_handler 55d32b8
[11564.690397] [55d32b8] mhi_process_data_event_ring start
[11564.690667] mhi_irq_handler 55d32b8
[11564.690937] mhi_irq_handler 55d32b8
[11564.691207] mhi_irq_handler 55d32b8
[11564.691475] mhi_irq_handler 55d32b8
[11564.692076] [55d32b8] mhi_process_data_event_ring done
[...]

I see two solutions to fix that problem:
- Manage events directly in the hard-irq handler (no more tasklet)
- Use threaded IRQ with IRQF_ONESHOT flag, to keep interrupt masked
until threaded handler has completed.

Regards,
Loic
