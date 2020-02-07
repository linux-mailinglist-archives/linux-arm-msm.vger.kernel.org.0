Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E92C1557E3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2020 13:38:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727028AbgBGMit (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Feb 2020 07:38:49 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:21078 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726894AbgBGMir (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Feb 2020 07:38:47 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581079127; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=qzairh/+yw4wEAbV6wFRDDG7JyWfCMeJmBCkct0T2fc=;
 b=NuQrFZpGIKOuQmEoftcoyryS4+SijH9xufSEDft/iRkKx4hyAzEIxmtOvJo3R2qS/zWyLjoa
 ZRMCV7e/SZCA+7wj8IKYw862XlexJWfPNyy94+G7FrKcasVoMgI2kMrso6Psz7On7a2wwZBh
 zD82bJfj99flF00FTExlWeBzCN0=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3d5a50.7f5eb23fa5e0-smtp-out-n01;
 Fri, 07 Feb 2020 12:38:40 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 61BBAC433A2; Fri,  7 Feb 2020 12:38:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: harigovi)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E5976C43383;
        Fri,  7 Feb 2020 12:38:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 07 Feb 2020 18:08:39 +0530
From:   harigovi@codeaurora.org
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        DTML <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>, nganji@codeaurora.org,
        Sean Paul <seanpaul@chromium.org>, kalyan_t@codeaurora.org,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>
Subject: Re: [Freedreno] [v1] drm/msm/dsi/pll: call vco set rate explicitly
In-Reply-To: <CAOCk7Nr9n-xLtWq=LEM-QFhJcY+QOuzazsoi-yjErA9od2Jwmw@mail.gmail.com>
References: <1580980321-19256-1-git-send-email-harigovi@codeaurora.org>
 <CAOCk7Nr9n-xLtWq=LEM-QFhJcY+QOuzazsoi-yjErA9od2Jwmw@mail.gmail.com>
Message-ID: <2f5abc857910f70faa119fea5bda81d7@codeaurora.org>
X-Sender: harigovi@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-02-06 20:29, Jeffrey Hugo wrote:
> On Thu, Feb 6, 2020 at 2:13 AM Harigovindan P <harigovi@codeaurora.org> 
> wrote:
>> 
>> For a given byte clock, if VCO recalc value is exactly same as
>> vco set rate value, vco_set_rate does not get called assuming
>> VCO is already set to required value. But Due to GDSC toggle,
>> VCO values are erased in the HW. To make sure VCO is programmed
>> correctly, we forcefully call set_rate from vco_prepare.
> 
> Is this specific to certain SoCs? I don't think I've observed this.

As far as Qualcomm SOCs are concerned, since pll is analog and the value 
is directly read from hardware if we get recalc value same as set rate 
value, the vco_set_rate will not be invoked. We checked in our idp 
device which has the same SOC but it works there since the rates are 
different.
