Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73A081A5FFB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2020 21:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727865AbgDLTT1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 12 Apr 2020 15:19:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:52036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727235AbgDLTT1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 12 Apr 2020 15:19:27 -0400
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info [104.130.122.26])
        by lindbergh.monkeyblade.net (Postfix) with UTF8SMTPS id 2863BC0A3BF1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2020 12:19:26 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586719168; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=YliS61QCQYD8IvrSZrsXQtbU5Db5p1TuVwVrC572Azs=;
 b=OQgwj7/moAnO6B5Bf2ezut03cHiaeXEVgiU5RwDivYU2YDNpqSDjekbGwHICP573jrvNJnqb
 W2vofflKvfNIe1lVre9GvhwROYcMabdjNT0xmL/DZwAuU7NJWAYWYrQotclzJKZdX0y1rQ/k
 /HuXnnd5Bt3w72vMyxN8OWrkPrE=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9369af.7efdfea73ed8-smtp-out-n03;
 Sun, 12 Apr 2020 19:19:11 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AEDF8C433F2; Sun, 12 Apr 2020 19:19:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 252B6C433F2;
        Sun, 12 Apr 2020 19:19:11 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sun, 12 Apr 2020 12:19:11 -0700
From:   abhinavk@codeaurora.org
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Fix typo
In-Reply-To: <20200412143509.11353-1-christophe.jaillet@wanadoo.fr>
References: <20200412143509.11353-1-christophe.jaillet@wanadoo.fr>
Message-ID: <22cbe4e4310b7d475c02da6bf44c44f9@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-04-12 07:35, Christophe JAILLET wrote:
> Duplicated 'we'
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> index 998bef1190a3..b5fed67c4651 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> @@ -959,7 +959,7 @@ static int mdp5_crtc_cursor_set(struct drm_crtc 
> *crtc,
>  	if (!ctl)
>  		return -EINVAL;
> 
> -	/* don't support LM cursors when we we have source split enabled */
> +	/* don't support LM cursors when we have source split enabled */
>  	if (mdp5_cstate->pipeline.r_mixer)
>  		return -EINVAL;
> 
> @@ -1030,7 +1030,7 @@ static int mdp5_crtc_cursor_move(struct drm_crtc
> *crtc, int x, int y)
>  		return -EINVAL;
>  	}
> 
> -	/* don't support LM cursors when we we have source split enabled */
> +	/* don't support LM cursors when we have source split enabled */
>  	if (mdp5_cstate->pipeline.r_mixer)
>  		return -EINVAL;
