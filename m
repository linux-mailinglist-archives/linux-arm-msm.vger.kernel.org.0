Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01B3C8A404
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2019 19:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725822AbfHLRIZ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Aug 2019 13:08:25 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:44820 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbfHLRIZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Aug 2019 13:08:25 -0400
Received: from marcel-macbook.fritz.box (p4FEFC580.dip0.t-ipconnect.de [79.239.197.128])
        by mail.holtmann.org (Postfix) with ESMTPSA id 2683CCECF4;
        Mon, 12 Aug 2019 19:17:05 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH v2] Bluetooth: btqca: Reset download type to default
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20190808085608.18010-1-bgodavar@codeaurora.org>
Date:   Mon, 12 Aug 2019 19:08:23 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>, mka@chromium.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, rjliao@codeaurora.org,
        c_hbandi@codeaurora.org, tientzu@chromium.org
Content-Transfer-Encoding: 8BIT
Message-Id: <C7E2873F-7B65-4EF0-94F0-D7386D058EED@holtmann.org>
References: <20190808085608.18010-1-bgodavar@codeaurora.org>
To:     Balakrishna Godavarthi <bgodavar@codeaurora.org>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Balakrishna,

> This patch will reset the download flag to default value
> before retrieving the download mode type.
> 
> Fixes: 32646db8cc28 ("Bluetooth: btqca: inject command complete event during fw download")
> Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
> ---
> v2: 
>  * add fix tag.
> 
> ---
> drivers/bluetooth/btqca.c | 1 +
> 1 file changed, 1 insertion(+)

patch has been applied to bluetooth-stable tree.

Regards

Marcel

