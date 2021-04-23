Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9BA336961F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Apr 2021 17:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231748AbhDWPYa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Apr 2021 11:24:30 -0400
Received: from smtprelay0224.hostedemail.com ([216.40.44.224]:42666 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231437AbhDWPY3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Apr 2021 11:24:29 -0400
X-Greylist: delayed 596 seconds by postgrey-1.27 at vger.kernel.org; Fri, 23 Apr 2021 11:24:29 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave05.hostedemail.com (Postfix) with ESMTP id CF9111828A809
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 15:13:57 +0000 (UTC)
Received: from omf01.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay05.hostedemail.com (Postfix) with ESMTP id 211961800E36A;
        Fri, 23 Apr 2021 15:13:56 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf01.hostedemail.com (Postfix) with ESMTPA id F1ABD17277;
        Fri, 23 Apr 2021 15:13:54 +0000 (UTC)
Message-ID: <73945e7037ab61eb34a2a1af05aa3eef75c8f836.camel@perches.com>
Subject: Re: [PATCH] nvmem: qfprom: minor nit fixes, no functional change
From:   Joe Perches <joe@perches.com>
To:     Rajendra Nayak <rnayak@codeaurora.org>,
        srinivas.kandagatla@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rbokka@codeaurora.org
Date:   Fri, 23 Apr 2021 08:13:53 -0700
In-Reply-To: <1619161503-8784-1-git-send-email-rnayak@codeaurora.org>
References: <1619161503-8784-1-git-send-email-rnayak@codeaurora.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: F1ABD17277
X-Spam-Status: No, score=0.10
X-Stat-Signature: 84zf3q7z797tubdqy36ipf5uudikkbka
X-Rspamd-Server: rspamout01
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+EoyNWIyNnZIdn9TEGXHUUdHz2XD8n9iw=
X-HE-Tag: 1619190834-636411
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 2021-04-23 at 12:35 +0530, Rajendra Nayak wrote:
> Fix a missed newline, and update a comment which is stale
> after the merge of '5a1bea2a: nvmem: qfprom: Add support for fuse
> blowing on sc7280'
> No other functional change in this patch.
[]
> diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
[]
> @@ -195,7 +196,7 @@ static int qfprom_enable_fuse_blowing(const struct qfprom_priv *priv,
>  	}
> 
>  	/*
> -	 * Hardware requires 1.8V min for fuse blowing; this may be
> +	 * Hardware requires a min voltage for fuse blowing; this may be
>  	 * a rail shared do don't specify a max--regulator constraints

   	                 so don't?

>  	 * will handle.
>  	 */

but the comment doesn't make much overall sense to me.


