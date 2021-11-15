Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35F02450C2B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Nov 2021 18:32:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237138AbhKORfQ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Nov 2021 12:35:16 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:44385 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238129AbhKORdY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Nov 2021 12:33:24 -0500
Received: from smtpclient.apple (p4fefc15c.dip0.t-ipconnect.de [79.239.193.92])
        by mail.holtmann.org (Postfix) with ESMTPSA id DED95CED38;
        Mon, 15 Nov 2021 18:30:27 +0100 (CET)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [PATCH v3] Bluetooth: btusb: re-definition for board_id in struct
 qca_version
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <96d03a2b0bd50da90a20990c42a814d9@codeaurora.org>
Date:   Mon, 15 Nov 2021 18:30:27 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        c-hbandi@codeaurora.org, Hemantg <hemantg@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rocky Liao <rjliao@codeaurora.org>, zijuhu@codeaurora.org
Content-Transfer-Encoding: 8BIT
Message-Id: <1593EED1-5745-49D1-B17A-F4C553F28644@holtmann.org>
References: <305e41a55a4c117da86f786c374a57dc@codeaurora.org>
 <8E687716-E810-4A46-B010-A08BB261D2FF@holtmann.org>
 <96d03a2b0bd50da90a20990c42a814d9@codeaurora.org>
To:     tjiang@codeaurora.org
X-Mailer: Apple Mail (2.3693.20.0.1.32)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Tim,

>  the following is the explanation from qc btsoc team:
> 
> The board ID should be split into two bytes.
> The 1st byte is chip ID, and the 2nd byte is platform ID.
> For example, board ID 0x010A, 0x01 is platform ID. 0x0A is chip ID.
> Currently we have several platforms, and platform IDs are continuously added.
> We would not distinguish different chips if we get these mixed up.
> Platform ID:
> •             0x00 is for Mobile
> •             0x01 is for X86( ID # from 257)
> •             0x02 is for Automotive(ID# from 513 )
> •             0x03 is for Consumer electronic( ID# from 769)
> …

then use u8 chip_id and u8 platform_id in the data structure and add description like above when you combine chip_id and platform_id into board_id.

Regards

Marcel

