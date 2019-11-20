Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D6301031AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2019 03:39:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727378AbfKTCjM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Nov 2019 21:39:12 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40527 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727140AbfKTCjM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Nov 2019 21:39:12 -0500
Received: by mail-pg1-f195.google.com with SMTP id e17so5190561pgd.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2019 18:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rmGQj7/ER384qMpN2QkIRdax3FhW52fXgXuITnbFJUM=;
        b=Ot6cwcHmPmdUnicAcrV8Q/blliaN/pObgVadHq4j2DW/ptCo8TOiHzfiwbBnzrehsZ
         KbglRwE3/u5XBpxTaBBKV4947lHmmyJnnDQCxnSsJC2H5WHC+QFseaRh90Ja047iQ+KW
         XDW6CA+Nx+LPjIEBUJjk+oq7Kwur15vHlUZXwQkH1aqIIp9GvrNSkPuE7ICPER0IUTBg
         Ubc/Z/WbmniFszz/Vyl/OvmfgyOdZyx+xmVaAhvKu3s3CPtuQN3XDt6m8Yuf3B28TQ9p
         2fF/RmRR07HjOUFQu5/lM/YNxLngyoKYnp/YXGVEBFLYywZlnTbKE/QQV0a6wxcyhwXH
         pcBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rmGQj7/ER384qMpN2QkIRdax3FhW52fXgXuITnbFJUM=;
        b=iQpLFqUcEZZuWrPCa5TTDku+YX/FGgP8WdEQ7E65ovVDq7GbwPZrDLtjS02JVZYsL7
         kU3PbW6Ltv0iYfSaHTlwWF/l+LCBjp8+WWtCOUsC5DpzW+D9fclomNvDDIcE+zNwGqyG
         9dJnAmLbNxJIRBJrvmy4DIAVmgDuQlyyn85q83F/lw1hmszkxs4Z/JgFdISGeOgVmmBv
         6osyxUn7oj8tgoya+40P9exhls7tgwoCSaw6wuj/VHeDiNETjblligI9A2/3gP5PpYOX
         VeQU0o0+WDeKgevPKufXhrV5X69tFeQ1hEK+H7U85Wy4EKNlq+ZEqa6Hm6CZTmYwjAt8
         yubQ==
X-Gm-Message-State: APjAAAXLH5IesB+HW0Hv93OCCfAbcyAQqCKcHZohTrdkQQKqWC6oNEpF
        O8VYhzNJfE4ZhKfFLjKnOdAmDQ==
X-Google-Smtp-Source: APXvYqxfYwc/XGbVrhZLuJG/tKj/6zmKdZQ2C34IbqxNk5A0bePNt2jVUiuUF/4l2wqesERiCPb7iw==
X-Received: by 2002:a62:7dce:: with SMTP id y197mr1034777pfc.164.1574217551668;
        Tue, 19 Nov 2019 18:39:11 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h3sm4724627pji.16.2019.11.19.18.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 18:39:11 -0800 (PST)
Date:   Tue, 19 Nov 2019 18:39:08 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     robh+dt@kernel.org, ulf.hansson@linaro.org, rnayak@codeaurora.org,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mark.rutland@arm.com, swboyd@chromium.org, dianders@chromium.org
Subject: Re: [PATCH 1/6] soc: qcom: rpmhpd: Set 'active_only' for active only
 power domains
Message-ID: <20191120023908.GP18024@yoga>
References: <20191118173944.27043-1-sibis@codeaurora.org>
 <0101016e7f9998d8-877e9166-8b6a-4530-ab66-3c88002e1db4-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101016e7f9998d8-877e9166-8b6a-4530-ab66-3c88002e1db4-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 18 Nov 09:40 PST 2019, Sibi Sankar wrote:

> From: Douglas Anderson <dianders@chromium.org>
> 
> The 'active_only' attribute was accidentally never set to true for any
> power domains meaning that all the code handling this attribute was
> dead.
> 
> NOTE that the RPM power domain code (as opposed to the RPMh one) gets
> this right.
> 
> Fixes: 279b7e8a62cc ("soc: qcom: rpmhpd: Add RPMh power domain driver")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Acked-by: Rajendra Nayak <rnayak@codeaurora.org>

You should have added your S-o-b here to certify its origin.
But I picked up this patch earlier today.

Thanks,
Bjorn

> ---
>  drivers/soc/qcom/rpmhpd.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
> index 5741ec3fa814c..51850cc68b701 100644
> --- a/drivers/soc/qcom/rpmhpd.c
> +++ b/drivers/soc/qcom/rpmhpd.c
> @@ -93,6 +93,7 @@ static struct rpmhpd sdm845_mx = {
>  
>  static struct rpmhpd sdm845_mx_ao = {
>  	.pd = { .name = "mx_ao", },
> +	.active_only = true,
>  	.peer = &sdm845_mx,
>  	.res_name = "mx.lvl",
>  };
> @@ -107,6 +108,7 @@ static struct rpmhpd sdm845_cx = {
>  
>  static struct rpmhpd sdm845_cx_ao = {
>  	.pd = { .name = "cx_ao", },
> +	.active_only = true,
>  	.peer = &sdm845_cx,
>  	.parent = &sdm845_mx_ao.pd,
>  	.res_name = "cx.lvl",
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
