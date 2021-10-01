Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F4B441F53B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 20:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354468AbhJATAC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 15:00:02 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:60757 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229464AbhJATAB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 15:00:01 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633114697; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=6RGUn/Do/9b9P1kKWBNE3zK8dc0DYDJBT/WmkBcUBX4=;
 b=kdZnADklSXksEUYEm9fLmsp57JQBRJKXJgqFFnR+KmukUlUqTujVPVwlZeuG/jULtDlnbFLu
 ctg4HdgMan/eYDiBatWzoKiVPezli2jBGYv/zWosNzBBTYlMPvvay7ZcKLo/MFQt3ex9xUUm
 EIsSwXkPqEtQywbXGis+S7kri6k=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 61575a4863b1f18658942e13 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 01 Oct 2021 18:58:16
 GMT
Sender: jesszhan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D619CC4360C; Fri,  1 Oct 2021 18:58:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jesszhan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 69CB5C4338F;
        Fri,  1 Oct 2021 18:58:15 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 01 Oct 2021 11:58:15 -0700
From:   jesszhan@codeaurora.org
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     seanpaul@chromium.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [bug report] drm/msm: dsi: Handle dual-channel for 6G as well
In-Reply-To: <20211001123115.GE2283@kili>
References: <20211001123115.GE2283@kili>
Message-ID: <baf1fcba58b05c90a0c7e2200a22ead1@codeaurora.org>
X-Sender: jesszhan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Dan,

Thanks for the report, will take care of it.

On 2021-10-01 05:31, Dan Carpenter wrote:
> Hello Sean Paul,
> 
> The patch a6bcddbc2ee1: "drm/msm: dsi: Handle dual-channel for 6G as
> well" from Jul 25, 2018, leads to the following
> Smatch static checker warning:
> 
> 	drivers/gpu/drm/msm/dsi/dsi_host.c:729 dsi_calc_clk_rate_6g()
> 	warn: wrong type for 'msm_host->esc_clk_rate' (should be 'ulong')
> 
> drivers/gpu/drm/msm/dsi/dsi_host.c
>     721 int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool
> is_bonded_dsi)
>     722 {
>     723         if (!msm_host->mode) {
>     724                 pr_err("%s: mode not set\n", __func__);
>     725                 return -EINVAL;
>     726         }
>     727
>     728         dsi_calc_pclk(msm_host, is_bonded_dsi);
> --> 729         msm_host->esc_clk_rate = 
> clk_get_rate(msm_host->esc_clk);
>                 ^^^^^^^^^^^^^^^^^^^^^^
> I don't know why Smatch is suddenly warning about ancient msm code, but
> clock rates should be unsigned long.  (I don't remember why).
> 
>     730         return 0;
>     731 }
> 
> regards,
> dan carpenter

Thanks,
Jessica Zhang
