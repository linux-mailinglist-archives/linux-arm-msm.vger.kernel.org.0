Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6A35153124
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2020 13:52:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbgBEMwI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>); Wed, 5 Feb 2020 07:52:08 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:34956 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbgBEMwI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Feb 2020 07:52:08 -0500
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 0C821CECC7;
        Wed,  5 Feb 2020 14:01:28 +0100 (CET)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Bug fixes while collecting
 controller memory dump
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <d89347d22c12ffca5ccf4e18e0c716ab@codeaurora.org>
Date:   Wed, 5 Feb 2020 13:52:05 +0100
Cc:     Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        robh@kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        tientzu@chromium.org, seanpaul@chromium.org, rjliao@codeaurora.org,
        Yoni Shavit <yshavit@google.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <20C0BA0B-1069-4DCF-A8FA-3B6359621D30@holtmann.org>
References: <1580832929-2067-1-git-send-email-gubbaven@codeaurora.org>
 <CANFp7mXgvfQGw0bc0dwNXg9KME1XD1zYGtPdEFWbM20NJpKtzQ@mail.gmail.com>
 <d89347d22c12ffca5ccf4e18e0c716ab@codeaurora.org>
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Venkata,

>> Hi Venkata,
>> Per our earlier review on chromium gerrit:
>> https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/1992966
>> I'm not too keen on the change from mutex to spinlock because it's
>> made the code more complex.
> [Venkata] :
> 
> We have moved from mutex to spinlock as timer callback function is getting executed under interrupt context and not under process context.

can’t you use a delayed workqueue for this?

Regards

Marcel

