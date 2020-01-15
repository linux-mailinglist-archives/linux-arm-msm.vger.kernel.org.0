Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE4F113CF36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2020 22:37:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729045AbgAOVhL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jan 2020 16:37:11 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:46233 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbgAOVhK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jan 2020 16:37:10 -0500
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 23D2DCECF2;
        Wed, 15 Jan 2020 22:46:27 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: [PATCH v4 1/3] Bluetooth: hci_qca: Add QCA Rome power off support
 to the qca_power_shutdown()
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200115085552.11483-1-rjliao@codeaurora.org>
Date:   Wed, 15 Jan 2020 22:37:08 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        hemantg@codeaurora.org
Content-Transfer-Encoding: 7bit
Message-Id: <EA19E723-B920-4A68-8F82-64353A663746@holtmann.org>
References: <20191225060317.5258-1-rjliao@codeaurora.org>
 <20200115085552.11483-1-rjliao@codeaurora.org>
To:     Rocky Liao <rjliao@codeaurora.org>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rocky,

> Current qca_power_shutdown() only supports wcn399x, this patch adds Rome
> power off support to it. For Rome it just needs to pull down the bt_en
> GPIO to power off it. This patch also replaces all the power off operation
> in qca_close() with the unified qca_power_shutdown() call.
> 
> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
> ---
> 
> Changes in v2: None
> Changes in v3: None
> Changes in v4:
>  -rebased the patch with latest code base
>  -moved the change from qca_power_off() to qca_power_shutdown()
>  -replaced all the power off operation in qca_close() with
>   qca_power_shutdown()
>  -updated commit message
> 
> drivers/bluetooth/hci_qca.c | 28 ++++++++++++++++------------
> 1 file changed, 16 insertions(+), 12 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

