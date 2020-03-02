Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E231C17652C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2020 21:41:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbgCBUlY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Mar 2020 15:41:24 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:59985 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725781AbgCBUlY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Mar 2020 15:41:24 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583181683; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=khx1KQYqxxQvmwAnOnZ7jUWNWknzXliTUbWl7Gfuk+s=;
 b=F0s2ErBE7YN4+8UCNXLTGw6GyZSq07t9CV5oJRimRQkNQn9vGJ6HkMxYZWjz5c5qKudGhO6p
 gXn516YjUq20GUAcJPkiQxbwST2TVDYVx9+qJcerfcQZKNj2mZzEXUSBmbiDE94LnvrCtJ6j
 uIYlQG/GQp+8FIi4h5R6uWLeHyc=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e5d6f65.7fb788764ed8-smtp-out-n03;
 Mon, 02 Mar 2020 20:41:09 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 020C8C4479F; Mon,  2 Mar 2020 20:41:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 24B45C43383;
        Mon,  2 Mar 2020 20:41:08 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 02 Mar 2020 12:41:08 -0800
From:   abhinavk@codeaurora.org
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     aravindh@codeaurora.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, varar@quicinc.com,
        seanpaul@chromium.org, daniel.vetter@ffwll.ch, treding@nvidia.com,
        chandanu@codeaurora.org
Subject: Re: Reverting https://patchwork.freedesktop.org/patch/336850/
In-Reply-To: <20200302080912.GA1690850@ulmo>
References: <8bec962794df6fd8f1384d457060234e@codeaurora.org>
 <20200302080912.GA1690850@ulmo>
Message-ID: <67a9625bc57d85f675af5074f9ded248@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Thierry

Thanks for the response.
We shall reimplement these locally in our drivers and push the next 
patchset.

Thanks

Abhinav
On 2020-03-02 00:09, Thierry Reding wrote:
> On Fri, Feb 28, 2020 at 05:35:51PM -0800, abhinavk@codeaurora.org 
> wrote:
>> Hi Thierry
>> 
>> For DP drivers using MSM chipsets, we are using drm_dp_link_configure,
>> drm_dp_link_power_up and drm_dp_link_power_down functions. Here is the 
>> patch
>> for reference:
>> 
>> https://patchwork.freedesktop.org/patch/343346/
>> 
>> We will be posting a newer version of the driver soon.
>> 
>> For that, we plan to revert 
>> https://patchwork.freedesktop.org/patch/336850/
>> as now there are more users of the functions and not just tegra.
>> 
>> Let us know if this is the right approach or shall we make the 
>> required
>> functions local to our drivers.
> 
> I think reimplementing these locally in you drivers is the preferred
> way. It's not so much a lack of users (there were 5 or so in total when
> I made the change to remove these helpers), but rather the general
> approach that was being criticized by other driver maintainers. I'm not
> aware of any of their opinions having changed on this subject, so I'd
> recommend going down the path of least resistance.
> 
> Thierry
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
