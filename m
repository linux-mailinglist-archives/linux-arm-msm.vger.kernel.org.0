Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE3F82C04E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 12:51:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729023AbgKWLti convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 06:49:38 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:47864 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728976AbgKWLti (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 06:49:38 -0500
Received: from marcel-macbook.holtmann.net (unknown [37.83.193.87])
        by mail.holtmann.org (Postfix) with ESMTPSA id C56DBCECCF;
        Mon, 23 Nov 2020 12:56:46 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.20.0.2.21\))
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Handle spurious wakeup from SoC
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <CANFp7mW=UvL_ONxFaTXKkY4byZRLLf0Tu8cesXhJNN36bqNDQA@mail.gmail.com>
Date:   Mon, 23 Nov 2020 12:49:33 +0100
Cc:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        Hemantg <hemantg@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        Rocky Liao <rjliao@codeaurora.org>, hbandi@codeaurora.org
Content-Transfer-Encoding: 8BIT
Message-Id: <6D6829E2-15BA-4424-9F65-DF408B904D87@holtmann.org>
References: <1605463143-4635-1-git-send-email-gubbaven@codeaurora.org>
 <CANFp7mW=UvL_ONxFaTXKkY4byZRLLf0Tu8cesXhJNN36bqNDQA@mail.gmail.com>
To:     Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
X-Mailer: Apple Mail (2.3654.20.0.2.21)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Abhishek,

> I think this code would be simplified by using a delayed_work struct
> instead of a timer.

And I pointed this out before that all the timers should be moved to a delayed_work.

In addition such a complex support for hardware should move towards its own driver solely base on serdev. I am currently getting a bit fed up if I point these things out and the answer, please merge this now and we fix it later. Maybe I need to stop merging things and wait for a proper separate driver for this hardware.

Regards

Marcel

