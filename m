Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8C738B2A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 May 2021 17:10:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233236AbhETPMG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 May 2021 11:12:06 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:58146 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232020AbhETPMF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 May 2021 11:12:05 -0400
Received: from smtpclient.apple (p4fefc9d6.dip0.t-ipconnect.de [79.239.201.214])
        by mail.holtmann.org (Postfix) with ESMTPSA id 05B39CECEA;
        Thu, 20 May 2021 17:18:33 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: [PATCH v4 0/5] Enable Bluetooth functionality for WCN6750
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1621355686-29550-1-git-send-email-gubbaven@codeaurora.org>
Date:   Thu, 20 May 2021 17:10:39 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        devicetree@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:BLUETOOTH SUBSYSTEM" <linux-bluetooth@vger.kernel.org>,
        Hemantg <hemantg@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        Rocky Liao <rjliao@codeaurora.org>, hbandi@codeaurora.org,
        abhishekpandit@chromium.org
Content-Transfer-Encoding: 8BIT
Message-Id: <DF3C6156-F44A-4954-B1EF-CB3051BCC0B6@holtmann.org>
References: <1621355686-29550-1-git-send-email-gubbaven@codeaurora.org>
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Venkata,

> These patches enables Bluetooth functionalties for new Qualcomm
> Bluetooth SoC wcn6750.
> 
> Venkata Lakshmi Narayana Gubba (5):
>  Bluetooth: hci_qca: Add support for QTI Bluetooth chip wcn6750
>  Bluetooth: btqca: Add support for firmware image with mbn type for
>    WCN6750
>  Bluetooth: btqca: Moved extracting rom version info to common place
>  dt-bindings: net: bluetooth: Convert Qualcomm BT binding to DT schema
>  dt-bindings: net: bluetooth: Add device tree bindings for QTI chip
>    wcn6750
> 
> .../devicetree/bindings/net/qualcomm-bluetooth.txt |  69 --------
> .../bindings/net/qualcomm-bluetooth.yaml           | 183 +++++++++++++++++++++
> drivers/bluetooth/btqca.c                          |  90 +++++++---
> drivers/bluetooth/btqca.h                          |  14 +-
> drivers/bluetooth/hci_qca.c                        | 114 ++++++++++---
> 5 files changed, 354 insertions(+), 116 deletions(-)
> delete mode 100644 Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
> create mode 100644 Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml

all 5 patches have been applied to bluetooth-next tree.

Regards

Marcel

