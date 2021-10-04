Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC4A5421AD0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 01:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232319AbhJDXon (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 19:44:43 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:64241 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229703AbhJDXom (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 19:44:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633390973; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=e5ySmYfuxHLcakLP+A8PI9xCAfD8tx2oWHHHEjBkDqQ=;
 b=D865t247Wlsny8sVj68cvtG8XDSXtGNPv1gViR4hBTUXiC3A7wZrTIlelFj+ww5Y5bsgUa9Z
 tp8J/jOv7yNUzejj7lHgnyc+/WfcWcV/O7cAp6vYZe55WiWvPQAHFkpKGWNFhB6f8Vbq9AuK
 aDYdS5O+z7d0t5zCvV2Z+TsbTIw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 615b916647d64efb6d81d558 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 04 Oct 2021 23:42:30
 GMT
Sender: jesszhan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D6549C4360C; Mon,  4 Oct 2021 23:42:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jesszhan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3FF4EC4338F;
        Mon,  4 Oct 2021 23:42:29 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 04 Oct 2021 16:42:29 -0700
From:   jesszhan@codeaurora.org
To:     abhinavk@codeaurora.org, dan.carpenter@oracle.com,
        hali@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org
Subject: Re: Fwd: [bug report] drm/msm/dsi: Split PHY drivers to separate
 files
In-Reply-To: <7e093fca7ca4963fb17be139b3158c46@codeaurora.org>
References: <20211004103711.GB25015@kili>
 <7e093fca7ca4963fb17be139b3158c46@codeaurora.org>
Message-ID: <cc2f61b81253f4d8272295037723520b@codeaurora.org>
X-Sender: jesszhan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Dan,

On 2021-10-04 16:28, abhinavk@codeaurora.org wrote:
> -------- Original Message --------
> Subject: [bug report] drm/msm/dsi: Split PHY drivers to separate files
> Date: 2021-10-04 03:37
> From: Dan Carpenter <dan.carpenter@oracle.com>
> To: hali@codeaurora.org
> Cc: linux-arm-msm@vger.kernel.org
> 
> Hello Hai Li,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> The patch 5c8290284402: "drm/msm/dsi: Split PHY drivers to separate
> files" from Aug 13, 2015, leads to the following Smatch complaint:
> 
>     drivers/gpu/drm/msm/dsi/phy/dsi_phy.c:812 msm_dsi_phy_enable()
>     warn: variable dereferenced before check 'phy' (see line 809)
> 
> drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
>    805  int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
>    806                          struct msm_dsi_phy_clk_request 
> *clk_req,
>    807                          struct msm_dsi_phy_shared_timings
> *shared_timings)
>    808	{
>    809		struct device *dev = &phy->pdev->dev;
>                                       ^^^^^^^^^^^^^^
> "phy" is deferenced without checking
> 
>    810		int ret;
>    811
>    812		if (!phy || !phy->cfg->ops.enable)
>                      ^^^
> Too late.  The fact that no one has complained in six years suggests
> that the NULL check can be removed but it wasn't 100% to obvious from
> reading the code.
> 
>    813			return -EINVAL;
>    814
> 
> regards,
> dan carpenter

Thanks for the report, will look into it.

Best,
Jessica Zhang
