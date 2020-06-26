Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C472020B050
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2020 13:18:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728377AbgFZLS3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Jun 2020 07:18:29 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:11407 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728290AbgFZLS3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Jun 2020 07:18:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593170308; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=R/qVQcyqrZssNF93sIMJBoDQJNf/6pJPiarQ1ZJDrHo=;
 b=n/sOp3AgQXQPDnQzABtkeUnZYw8Jm63i1M164zgj7KbbB7QMeWKYP3Vr5GMBZuKwR0kP5yCK
 244jJXJSBimDTV7kkjOK9chzBZB/yfBgbcYm5tonxQDW+X3/gTAkFpnuelTVg3DlM73L7r9/
 AniOrOqs2yNBuMUHY76qTWA2BZ0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5ef5d97fc76a4e7a2a662b43 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Jun 2020 11:18:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B50DCC433CA; Fri, 26 Jun 2020 11:18:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bgodavar)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 455BFC433C8;
        Fri, 26 Jun 2020 11:18:22 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 26 Jun 2020 16:48:22 +0530
From:   bgodavar@codeaurora.org
To:     linux-firmware@kernel.org, jwboyer@kernel.org
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, gubbaven@codeaurora.org,
        abhishekpandit@chromium.org
Subject: Re: Update WCN3991 FW with new enhancements
In-Reply-To: <251806a04b162259103050eb11c48bf1@codeaurora.org>
References: <251806a04b162259103050eb11c48bf1@codeaurora.org>
Message-ID: <018fa36371d8f679f96abe0af9788da3@codeaurora.org>
X-Sender: bgodavar@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+ Josh Boyer

On 2020-06-22 14:35, bgodavar@codeaurora.org wrote:
> The following changes since commit 
> 887d2a103c2bdd267dbca5bed39b1b493d6cbe13:
> 
>   linux-firmware: Update firmware file for Intel Bluetooth AX200
> (2020-06-10 08:32:52 -0400)
> 
> are available in the git repository at:
> 
>   https://github.com/bgodavar/qca_wcn3991
> 
> for you to fetch changes up to 
> 24cc617d85a466ba58a94e3040690d0a43c83226:
> 
>   QCA: Update WCN3991 FW files (2020-06-22 14:20:47 +0530)
> 
> ----------------------------------------------------------------
> Balakrishna Godavarthi (1):
>       QCA: Update WCN3991 FW files
> 
>  qca/crbtfw32.tlv | Bin 95784 -> 125896 bytes
>  qca/crnv32.bin   | Bin 5388 -> 5299 bytes
>  2 files changed, 0 insertions(+), 0 deletions(-)
> 
> Regards
> Balakrishna
