Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5B5EA31A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2019 09:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727546AbfH3HzP convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Aug 2019 03:55:15 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:40632 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726975AbfH3HzP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Aug 2019 03:55:15 -0400
Received: from [172.20.10.2] (tmo-106-216.customers.d1-online.com [80.187.106.216])
        by mail.holtmann.org (Postfix) with ESMTPSA id 57771CECD9;
        Fri, 30 Aug 2019 10:03:59 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH v2] Bluetooth: hci_qca: wait for Pre shutdown complete
 event before sending the Power off pulse
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1567141304-24600-1-git-send-email-c-hbandi@codeaurora.org>
Date:   Fri, 30 Aug 2019 09:55:12 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bgodavar@codeaurora.org, anubhavg@codeaurora.org
Content-Transfer-Encoding: 8BIT
Message-Id: <13B39C38-FBB6-4630-B238-D032FAB753CA@holtmann.org>
References: <1567141304-24600-1-git-send-email-c-hbandi@codeaurora.org>
To:     Harish Bandi <c-hbandi@codeaurora.org>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Harish,

> When SoC receives pre shut down command, it share the same
> with other COEX shared clients. So SoC needs a short time
> after sending VS pre shutdown command before turning off
> the regulators and sending the power off pulse. Along with
> short delay, needs to wait for command complete event for
> Pre shutdown VS command
> 
> Signed-off-by: Harish Bandi <c-hbandi@codeaurora.org>
> Reviewed-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
> ---
> Changes in V2:
> - Modified commit text.
> ---
> drivers/bluetooth/btqca.c   | 22 ++++++++++++++++++++++
> drivers/bluetooth/hci_qca.c |  5 +++++
> 2 files changed, 27 insertions(+)

the patch does not apply cleanly to bluetooth-next tree. Can you send an updated version please.

Regards

Marcel

