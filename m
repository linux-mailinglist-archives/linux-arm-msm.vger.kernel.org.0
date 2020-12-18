Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68CD42DEB0B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Dec 2020 22:25:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725998AbgLRVZG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Dec 2020 16:25:06 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:34931 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725778AbgLRVZF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Dec 2020 16:25:05 -0500
Received: from marcel-macbook.holtmann.net (p4fefcdf9.dip0.t-ipconnect.de [79.239.205.249])
        by mail.holtmann.org (Postfix) with ESMTPSA id 0DD72CED33;
        Fri, 18 Dec 2020 22:31:41 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH v4] Bluetooth: btqca: Add support to read FW build version
 for WCN3991 BTSoC
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1607428529-26629-1-git-send-email-gubbaven@codeaurora.org>
Date:   Fri, 18 Dec 2020 22:24:23 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bgodavar@codeaurora.org, rjliao@codeaurora.org,
        hbandi@codeaurora.org, abhishekpandit@chromium.org
Content-Transfer-Encoding: 8BIT
Message-Id: <BC5626C0-C0CC-40CD-8E14-56E3D9508BBB@holtmann.org>
References: <1607428529-26629-1-git-send-email-gubbaven@codeaurora.org>
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Venkata,

> Add support to read FW build version from debugfs node.
> This info can be read from
> /sys/kernel/debug/bluetooth/hci0/firmware_info
> 
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> ---
> drivers/bluetooth/btqca.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++
> drivers/bluetooth/btqca.h |  1 +
> 2 files changed, 55 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel

