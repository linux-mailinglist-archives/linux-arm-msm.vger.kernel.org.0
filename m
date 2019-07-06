Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C132B60FD6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2019 12:22:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725934AbfGFKWt convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>); Sat, 6 Jul 2019 06:22:49 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:56979 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbfGFKWt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Jul 2019 06:22:49 -0400
Received: from [192.168.0.113] (CMPC-089-239-107-172.CNet.Gawex.PL [89.239.107.172])
        by mail.holtmann.org (Postfix) with ESMTPSA id 52590CEFAE;
        Sat,  6 Jul 2019 12:31:19 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: Doubt/issue in hci_dev_do_close
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <e0f4f7acffb3abd2c0d1790a7cd79905@codeaurora.org>
Date:   Sat, 6 Jul 2019 12:22:46 +0200
Cc:     linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bgodavar@codeaurora.org, anubhavg@codeaurora.org
Content-Transfer-Encoding: 8BIT
Message-Id: <DCD19998-CDAF-4665-BEBC-8A8CAA16E554@holtmann.org>
References: <1553689723-21017-2-git-send-email-c-hbandi@codeaurora.org>
 <201903290535.u5TF12SC%lkp@intel.com> <20190328212320.GF112750@google.com>
 <a75d686f28a2c73562e9bbf5b601d37c@codeaurora.org>
 <e0f4f7acffb3abd2c0d1790a7cd79905@codeaurora.org>
To:     Harish Bandi <c-hbandi@codeaurora.org>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Harish,

> In hci_dev_do_close first it is sending vendor specific shutdown routine and then after some operations it is sending
> the hci_reset command.
> However in vendor specific shutdown routine if vendor already powered off the vendor chip. In those cases it will not
> send the HCI_RESET command. That may lead to bug or some cleanup operations not done properly in Chip.
> Is there any specific reason why it is sending vendor specific shutdown routine first and then sending HCI_RESET command.

are you setting HCI_QUIRK_RESET_ON_CLOSE and trying to use hdev->shutdown at the same time. That is not how this is suppose to be used. The HCI_QUIRK_RESET_ON_CLOSE is just for old Bluetooth 1.0b USB devices.

Regards

Marcel

