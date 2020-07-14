Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18A5D21EEBC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2020 13:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgGNLJw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jul 2020 07:09:52 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:41416 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727067AbgGNLJv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jul 2020 07:09:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594724990; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=063nsZA+TEvD+EIhBzADv1QQAX7cmYzUzYelnNmmLWM=;
 b=lvfy1hddC1WW/SdttkR7iHVNGstAJo2VzSIxRdKZAv/Lg+v0IgwdUsQ0Y/dMvtTQSsmr1w08
 1VD8NLRC9TugsFdMXv7x/rRGpSf7HliD3NNl1jWXQY7BfbuGRIKrnavNvDi8qltPkDM5b9PN
 +d2QqNH16x/qt684IJw7HtAGCHw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-east-1.postgun.com with SMTP id
 5f0d927e1e603dbb44cdf4fe (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 14 Jul 2020 11:09:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B4CDEC433C8; Tue, 14 Jul 2020 11:09:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kalyan_t)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B25B1C433CA;
        Tue, 14 Jul 2020 11:09:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 14 Jul 2020 16:39:47 +0530
From:   kalyan_t@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        dianders@chromium.org, mkrishn@codeaurora.org,
        travitej@codeaurora.org, nganji@codeaurora.org
Subject: Re: [v1] drm/msm/dpu: add support for clk and bw scaling for display
In-Reply-To: <20200714011219.GQ3191083@google.com>
References: <1592489321-29213-1-git-send-email-kalyan_t@codeaurora.org>
 <20200714011219.GQ3191083@google.com>
Message-ID: <38dc4bbfd754175e476252c4bc259d55@codeaurora.org>
X-Sender: kalyan_t@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-07-14 06:42, Matthias Kaehlcke wrote:
> On Thu, Jun 18, 2020 at 07:38:41PM +0530, Kalyan Thota wrote:
>> This change adds support to scale src clk and bandwidth as
>> per composition requirements.
>> 
>> Interconnect registration for bw has been moved to mdp
>> device node from mdss to facilitate the scaling.
>> 
>> Changes in v1:
>>  - Address armv7 compilation issues with the patch (Rob)
>> 
>> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> 
> It seems this is an evolution of this series:
> https://patchwork.kernel.org/project/linux-arm-msm/list/?series=265351
> 
> Are the DT bits of the series still valid? If so please include them in 
> the
> series, otherwise please add DT patches to allow folks to test and 
> review,
> and get them landed in Bjorn's tree after the driver changes have 
> landed.

Hi,

Yes the patch is dependent on the DT changes, should i add them with 
depends tag in the commit text ?
https://patchwork.kernel.org/patch/11470785/
https://patchwork.kernel.org/patch/11470789/

- Kalyan
