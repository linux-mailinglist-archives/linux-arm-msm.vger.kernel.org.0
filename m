Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAD641301A4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jan 2020 10:48:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbgADJsA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Jan 2020 04:48:00 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:36398 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726191AbgADJsA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Jan 2020 04:48:00 -0500
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 3FE45CED12;
        Sat,  4 Jan 2020 10:57:14 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: [RFC PATCH v1] Bluetooth: hci_qca: Collect controller memory dump
 during SSR
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200102144911.8358-1-bgodavar@codeaurora.org>
Date:   Sat, 4 Jan 2020 10:47:58 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        lkml <linux-kernel@vger.kernel.org>,
        BlueZ devel list <linux-bluetooth@vger.kernel.org>,
        Hemantg <hemantg@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Claire Chang <tientzu@chromium.org>, seanpaul@chromium.org,
        Rocky Liao <rjliao@codeaurora.org>,
        Yoni Shavit <yshavit@google.com>,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Content-Transfer-Encoding: 7bit
Message-Id: <1D304799-509F-4387-B7E5-4D415461C98F@holtmann.org>
References: <20200102144911.8358-1-bgodavar@codeaurora.org>
To:     Balakrishna Godavarthi <bgodavar@codeaurora.org>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Balakrishna,

> We will collect the ramdump of BT controller when hardware error event
> received before rebooting the HCI layer. Before restarting a subsystem
> or a process running on a subsystem, it is often required to request
> either a subsystem or a process to perform proper cache dump and
> software failure reason into a memory buffer which application
> processor can retrieve afterwards. SW developers can often provide
> initial investigation by looking into that debugging information.
> 
> Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> ---
> drivers/bluetooth/hci_qca.c | 296 +++++++++++++++++++++++++++++++++++-
> 1 file changed, 291 insertions(+), 5 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

