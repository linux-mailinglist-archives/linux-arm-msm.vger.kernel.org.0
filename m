Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 313ADDBF16
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 09:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393735AbfJRH5F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 03:57:05 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:45521 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728064AbfJRH5F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 03:57:05 -0400
Received: from surfer-172-29-2-69-hotspot.internet-for-guests.com (p578ac27a.dip0.t-ipconnect.de [87.138.194.122])
        by mail.holtmann.org (Postfix) with ESMTPSA id 221ABCECF3;
        Fri, 18 Oct 2019 10:06:02 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.19\))
Subject: Re: [PATCH] Bluetooth: hci_qca: Add delay for wcn3990 stability
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20191017212955.6266-1-jeffrey.l.hugo@gmail.com>
Date:   Fri, 18 Oct 2019 09:57:02 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>, c-hbandi@codeaurora.org,
        bgodavar@codeaurora.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <42FF80BF-9975-4553-BAFF-B782349BBB07@holtmann.org>
References: <20191017212955.6266-1-jeffrey.l.hugo@gmail.com>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
X-Mailer: Apple Mail (2.3594.4.19)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jeffrey,

> On the msm8998 mtp, the response to the baudrate change command is never
> received.  On the Lenovo Miix 630, the response to the baudrate change
> command is corrupted - "Frame reassembly failed (-84)".
> 
> Adding a 50ms delay before re-enabling flow to receive the baudrate change
> command response from the wcn3990 addesses both issues, and allows
> bluetooth to become functional.
> 
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---
> drivers/bluetooth/hci_qca.c | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

