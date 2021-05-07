Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15373376180
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 May 2021 09:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235910AbhEGHyo convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>); Fri, 7 May 2021 03:54:44 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:48433 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234951AbhEGHym (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 May 2021 03:54:42 -0400
Received: from smtpclient.apple (p4fefc624.dip0.t-ipconnect.de [79.239.198.36])
        by mail.holtmann.org (Postfix) with ESMTPSA id 8CB8BCECD9;
        Fri,  7 May 2021 10:01:26 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: [PATCH v3 3/5] Bluetooth: btqca: Moved extracting rom version
 info to common place
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1620322392-27148-4-git-send-email-gubbaven@codeaurora.org>
Date:   Fri, 7 May 2021 09:53:35 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        devicetree@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>,
        open list <linux-kernel@vger.kernel.org>,
        Bluetooth Kernel Mailing List 
        <linux-bluetooth@vger.kernel.org>,
        Hemantg <hemantg@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        Rocky Liao <rjliao@codeaurora.org>, hbandi@codeaurora.org,
        abhishekpandit@chromium.org
Content-Transfer-Encoding: 8BIT
Message-Id: <A9592AB3-EE71-4A1A-8CE4-AC209A98BDE5@holtmann.org>
References: <1620322392-27148-1-git-send-email-gubbaven@codeaurora.org>
 <1620322392-27148-4-git-send-email-gubbaven@codeaurora.org>
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Venkata,

> Moved extracting rom version info to common place as this code is
> common in all if else ladder in qca_uart_setup.
> 
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> ---
> drivers/bluetooth/btqca.c | 15 ++++++---------
> 1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> index 320c555..658fd8e4 100644
> --- a/drivers/bluetooth/btqca.c
> +++ b/drivers/bluetooth/btqca.c
> @@ -533,24 +533,21 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
> 
> 	config.user_baud_rate = baudrate;
> 
> +	/* Firmware files to download are based on ROM version.
> +	 * ROM version is derived from last two bytes of soc_ver.
> +	 */
> +	rom_ver = ((soc_ver & 0x00000f00) >> 0x04) |
> +		    (soc_ver & 0x0000000f);
> +

please try to align this properly.

Regards

Marcel

