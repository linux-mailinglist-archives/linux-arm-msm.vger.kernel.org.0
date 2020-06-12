Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48F961F78A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2020 15:19:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgFLNTf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Jun 2020 09:19:35 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:60228 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726109AbgFLNTf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Jun 2020 09:19:35 -0400
Received: from marcel-macbook.fritz.box (ip-109-41-64-170.web.vodafone.de [109.41.64.170])
        by mail.holtmann.org (Postfix) with ESMTPSA id 64E66CED03;
        Fri, 12 Jun 2020 15:29:22 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Request Tx clock vote off only
 when Tx is pending
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1591964117-8228-1-git-send-email-bgodavar@codeaurora.org>
Date:   Fri, 12 Jun 2020 15:19:30 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        abhishekpandit@chromium.org, rjliao@codeaurora.org,
        gubbaven@codeaurora.org
Content-Transfer-Encoding: 7bit
Message-Id: <29DD7F7E-A91D-439D-9FAA-23C8A16BD586@holtmann.org>
References: <1591964117-8228-1-git-send-email-bgodavar@codeaurora.org>
To:     Balakrishna Godavarthi <bgodavar@codeaurora.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Balakrishna,

> Tx pending flag is set to true when HOST IBS state is AWAKE or
> AWAKEING. If IBS state is ASLEEP, then Tx clock is already voted
> off. To optimize further directly calling serial_clock_vote()
> instead of qca_wq_serial_tx_clock_vote_off(), at this point of
> qca_suspend() already data is sent out. No need to wake up hci to
> send data.
> 
> Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
> ---
> drivers/bluetooth/hci_qca.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

