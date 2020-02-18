Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1375162268
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 09:31:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbgBRIan convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 03:30:43 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:40992 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbgBRIan (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 03:30:43 -0500
Received: from marcel-macpro.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 2FD25CED24;
        Tue, 18 Feb 2020 09:40:05 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [PATCH v4] Bluetooth: hci_qca: Bug fixes while collecting
 controller memory dump
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200214161715.2166-1-bgodavar@codeaurora.org>
Date:   Tue, 18 Feb 2020 09:30:40 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        Hemantg <hemantg@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Rocky Liao <rjliao@codeaurora.org>,
        Yoni Shavit <yshavit@google.com>, abhishekpandit@chromium.org,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <D1EF879E-B55C-4904-A0E7-0065B999B6D4@holtmann.org>
References: <20200214161715.2166-1-bgodavar@codeaurora.org>
To:     Balakrishna Godavarthi <bgodavar@codeaurora.org>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Balakrishna,

> This patch will fix the below issues
> 1. Discarding memory dump events if memdump state is moved to
>    MEMDUMP_TIMEOUT.
> 2. Fixed race conditions between qca_hw_error() and qca_controller_memdump
>    while free memory dump buffers using mutex lock
> 3. Moved timeout timer to delayed work queue
> 4. Injecting HW error event in a case when dumps failed to receive and HW
>    error event is not yet received.
> 5. Clearing hw error and command timeout function callbacks before
>    sending pre shutdown command.
> 
> Collecting memory dump will follow any of the below sequence.
> 
> Sequence 1:
>   Receiving Memory dump events from the controller
>   Received entire dump in stipulated time
>   Received HW error event from the controller
>   Controller Reset from HOST
> 
> Sequence 2:
>   Receiving Memory dump events from the controller
>   Failed to Receive entire dump in stipulated time
>   A Timeout schedules and if no HW error event received a fake HW
>     error event will be injected.
>   Controller Reset from HOST.
> 
> Sequence 3:
>   Received HW error event
>   HOST trigger SSR by sending crash packet to controller.
>   Received entire dump in stipulated time
>   Controller Reset from HOST
> 
> Fixes: d841502c79e3 ("Bluetooth: hci_qca: Collect controller memory dump during SSR")
> Reported-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> ---
> drivers/bluetooth/hci_qca.c | 101 ++++++++++++++++++++++++------------
> 1 file changed, 67 insertions(+), 34 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

