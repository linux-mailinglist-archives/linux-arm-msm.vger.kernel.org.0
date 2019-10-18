Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FE66DC3CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 13:18:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442553AbfJRLRw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 07:17:52 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:53558 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2442552AbfJRLRw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 07:17:52 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id D0B5D60386; Fri, 18 Oct 2019 11:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571397471;
        bh=C3KnIcnMxKuUHY8fIZW4FWQ4hx+JH+HnQ1imRM1Qdmg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=gzHaatmG76Jk1bUz5diabrH2Kn5xC9p6IUAjnB4J0zeMZmkuGsFazOQEIOG5NmKfj
         JXDWDdLW0GwgLKXDPQ1k1ljQ7Znv3x8FwiuBRwl1O31/dZlbchJBgmEhlujoZ2OfIN
         itIqLSGBJJVxB3Diqc2sZl7S45yo5FXFy4GGKW9o=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id E8E0860850;
        Fri, 18 Oct 2019 11:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571397468;
        bh=C3KnIcnMxKuUHY8fIZW4FWQ4hx+JH+HnQ1imRM1Qdmg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nJOJkSrKpi3HxPg7VxcfINI4msyP76KymRwvvZoJNb35608AHvt2Q3o+eLJt/Dt9X
         dHOfXZY9VRqn0VE87Z05NcKIfD1vJaFUZ3LZQWCwlZ6mCCbSvLYidnMoAqP2M9IvLu
         /mrfs37kQuGhnCa4+Incfeqzy1WfX9L+yzSq3MLs=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 18 Oct 2019 16:47:47 +0530
From:   Harish Bandi <c-hbandi@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        linux-bluetooth-owner@vger.kernel.org
Subject: Re: [PATCH 0/4] Bluetooth: hci_qca: Regulator usage cleanup
In-Reply-To: <20191018052405.3693555-1-bjorn.andersson@linaro.org>
References: <20191018052405.3693555-1-bjorn.andersson@linaro.org>
Message-ID: <2737f06b2d6aa25c31f6cb0937fb1fcb@codeaurora.org>
X-Sender: c-hbandi@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-10-18 10:54, Bjorn Andersson wrote:
> Clean up the regulator usage in hci_qca and in particular don't
> regulator_set_voltage() for fixed voltages. It cleans up the driver, 
> but more
> important it makes bluetooth work on my Lenovo Yoga C630, where the 
> regulator
> for vddch0 is defined with a voltage range that doesn't overlap the 
> values in
> the driver.
> 
> Bjorn Andersson (4):
>   Bluetooth: hci_qca: Update regulator_set_load() usage
>   Bluetooth: hci_qca: Don't vote for specific voltage
>   Bluetooth: hci_qca: Use regulator bulk enable/disable
>   Bluetooth: hci_qca: Split qca_power_setup()
> 
>  drivers/bluetooth/hci_qca.c | 135 +++++++++++++++---------------------
>  1 file changed, 55 insertions(+), 80 deletions(-)
