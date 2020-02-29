Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 206F6174439
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Feb 2020 02:35:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbgB2Bfy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Feb 2020 20:35:54 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:14241 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726046AbgB2Bfy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Feb 2020 20:35:54 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582940153; h=Message-ID: Subject: Cc: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=ySl75E8LPEXT19bMlNXG70itx4h/1U4kd9G3+SOPYT0=; b=YuKnsYmSHBih4IV6c7qILLJe85n2jCrIQ0MZugANOe4Z/v+0zBSiSf6SMYeC/4T8wPC0kNxw
 koGHbo0qtU7xWx5B4Xhq9ZjZ+IxATKZJae/F5pvkPvZJdykMZv0cj3O/Sh1VEJXkWHOlRejg
 oqRlGYMDIoTbK2jr8UGWLzQfbtQ=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e59bff8.7fec3c32b3b0-smtp-out-n01;
 Sat, 29 Feb 2020 01:35:52 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D6EADC447A0; Sat, 29 Feb 2020 01:35:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2B242C43383;
        Sat, 29 Feb 2020 01:35:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 28 Feb 2020 17:35:51 -0800
From:   abhinavk@codeaurora.org
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc:     robdclark@gmail.com, seanpaul@chromium.org, nganji@codeaurora.org,
        aravindh@codeaurora.org, chandanu@codeaurora.org,
        varar@quicinc.com, treding@nvidia.com, daniel.vetter@ffwll.ch
Subject: Reverting https://patchwork.freedesktop.org/patch/336850/
Message-ID: <8bec962794df6fd8f1384d457060234e@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Thierry

For DP drivers using MSM chipsets, we are using drm_dp_link_configure, 
drm_dp_link_power_up and drm_dp_link_power_down functions. Here is the 
patch for reference:

https://patchwork.freedesktop.org/patch/343346/

We will be posting a newer version of the driver soon.

For that, we plan to revert 
https://patchwork.freedesktop.org/patch/336850/ as now there are more 
users of the functions and not just tegra.

Let us know if this is the right approach or shall we make the required 
functions local to our drivers.

Thanks

Abhinav
