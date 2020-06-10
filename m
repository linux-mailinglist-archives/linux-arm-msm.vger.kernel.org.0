Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B37B01F571D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2020 16:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727776AbgFJOzA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Jun 2020 10:55:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:44328 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726908AbgFJOzA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Jun 2020 10:55:00 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1B3B72072F;
        Wed, 10 Jun 2020 14:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591800899;
        bh=gjvlNmhpOseNaDKedcB9GHU7iTHrdoxsgDi+ecT5hyM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eaeuDZE9aPFGn7KUakOuZK2k1QhfcTOZLuINf4/XMi0YBL2klsbQOOY/l8bGW+4cz
         xp8VmKc3npL/FqyHiYEsi9FrCqkVBqhg2nuXSwGlsN/uPAw9BC+i5XucyjYDMT6Z/p
         TngvQfYG7+VgaLUpoauO2RAJo+iYFHoVAzhSxWPA=
Date:   Wed, 10 Jun 2020 16:54:53 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        hemantg@codeaurora.org, Johan Hedberg <johan.hedberg@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rocky Liao <rjliao@codeaurora.org>,
        Rob Herring <robh@kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        Claire Chang <tientzu@chromium.org>, yshavit@google.com,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Bluetooth: hci_qca: Fix double free during SSR timeout
Message-ID: <20200610145453.GC2102023@kroah.com>
References: <d3444be6-28e6-bef5-08cf-6038620f65c6@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3444be6-28e6-bef5-08cf-6038620f65c6@web.de>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 04, 2020 at 08:24:34PM +0200, Markus Elfring wrote:
> > Due to race conditions between qca_hw_error and qca_controller_memdump
> > during SSR timeout,the same pointer is freed twice.
> 
> This is an unfortunate software situation.
> 
> 
> > Which results to double free error.
> 
> How do you think about to omit this sentence from the change description?
> 
> 
> > Now a lock is acquired while SSR state moved to timeout.
> 
> I suggest to convert this information into an imperative wording.
> 
> Would you like to add the tag “Fixes” to the commit message?
> 
> Regards,
> Markus

Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot
