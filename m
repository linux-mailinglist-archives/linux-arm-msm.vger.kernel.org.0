Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3216167E37
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2020 14:16:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728330AbgBUNQG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Feb 2020 08:16:06 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:46750 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728198AbgBUNQG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Feb 2020 08:16:06 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582290966; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=oTA36HHmGmniDobecPjLQVGncMTLqDHJo119ZiOygsk=;
 b=sYB+paMe3UP//knzjprhHzOs32FjJQGGqPNAkXk8sa5xVZr1GWv5igy3fQsjloepWGqistPX
 d6+Y3qDAa7jyrkv1PtFE97N4Dxhg+yHMV4ROCloP1BkZeFxrPyrCpTVgp4rhsvQW5v6fhyuV
 vp9aVEx8YmVixMXbI9LHunUUmsw=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4fd808.7eff649a8b20-smtp-out-n02;
 Fri, 21 Feb 2020 13:15:52 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B6752C4479D; Fri, 21 Feb 2020 13:15:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bgodavar)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4C02FC43383;
        Fri, 21 Feb 2020 13:15:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 21 Feb 2020 18:45:51 +0530
From:   bgodavar@codeaurora.org
To:     linux-firmware@kernel.org, jwboyer@kernel.org
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, gubbaven@codeaurora.org
Subject: Re: Firmware files for QCA BT chip WCN3991.
In-Reply-To: <3d3a530f11e6bc9a87573389d72ddd3c@codeaurora.org>
References: <3d3a530f11e6bc9a87573389d72ddd3c@codeaurora.org>
Message-ID: <b69f21863b936c2407d2e22dcd258013@codeaurora.org>
X-Sender: bgodavar@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+ Josh boyer to pick the firmware

On 2020-02-20 16:05, bgodavar@codeaurora.org wrote:
> Hi,
> 
> The following changes since commit 
> 54b017d06a44bfd9b4c2757cace6cc349afd5bf2:
> 
>   qca: Add firmware files for BT chip wcn3991. (2020-02-20 16:01:04 
> +0530)
> 
> are available in the Git repository at:
> 
>   https://github.com/bgodavar/qca_bt_wcn3991.git
> 
> for you to fetch changes up to 
> 54b017d06a44bfd9b4c2757cace6cc349afd5bf2:
> 
>   qca: Add firmware files for BT chip wcn3991. (2020-02-20 16:01:04 
> +0530)
> 
> 
> Regards
> Balakrishna
