Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0FEC1E7C2C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 13:45:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbgE2LpZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 May 2020 07:45:25 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:49312 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725562AbgE2LpY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 May 2020 07:45:24 -0400
Received: from marcel-macbook.fritz.box (p4fefc5a7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id D21D7CECD4;
        Fri, 29 May 2020 13:55:08 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Fix qca6390 enable failure after
 warm reboot
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1590719360-28257-1-git-send-email-zijuhu@codeaurora.org>
Date:   Fri, 29 May 2020 13:45:21 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        rjliao@codeaurora.org
Content-Transfer-Encoding: 7bit
Message-Id: <6C68EF2F-7DEC-4CA4-A0E8-8C775B3CF62B@holtmann.org>
References: <1590719360-28257-1-git-send-email-zijuhu@codeaurora.org>
To:     Zijun Hu <zijuhu@codeaurora.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Zijun,

> On May 29, 2020, at 04:29, Zijun Hu <zijuhu@codeaurora.org> wrote:
> 
> Warm reboot can not reset controller qca6390 due to
> lack of controllable power supply, so causes firmware
> download failure during enable.
> 
> Fixed by sending VSC EDL_SOC_RESET to reset qca6390
> within added device shutdown implementation.
> 
> Signed-off-by: Zijun Hu <zijuhu@codeaurora.org>
> Tested-by: Zijun Hu <zijuhu@codeaurora.org>
> ---
> drivers/bluetooth/hci_qca.c | 33 +++++++++++++++++++++++++++++++++
> 1 file changed, 33 insertions(+)

patch does not apply to bluetooth-next tree, please rebase.

Regards

Marcel

