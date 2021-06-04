Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D09B39BCA2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 18:11:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbhFDQMh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Jun 2021 12:12:37 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:49232 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230153AbhFDQMg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Jun 2021 12:12:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622823050; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=7OrD0eroTm8+Xh/p6MsHyA4aVI8DyLGbpiIhRk9+tQI=;
 b=mRjZlFs3xIHN3FbjHB2TCzS6RbD+XS2mbnbHg97mvVqC1tVT+zdCmoSV4Z4YklMpa50ZLcY/
 qL9Olx7FmFQoX8WMP/mrFNNnk5nU/UxgeaMfiwl+YWxVXT0nWD0XW5cVlmzbKqLy2//0Mim1
 +kQfF386eaW5HcjDgjYNV9XO5uM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60ba5076abfd22a3dc9e411b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 04 Jun 2021 16:10:30
 GMT
Sender: rajeevny=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9B79DC43147; Fri,  4 Jun 2021 16:10:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rajeevny)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AC24EC433F1;
        Fri,  4 Jun 2021 16:10:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 04 Jun 2021 21:40:28 +0530
From:   rajeevny@codeaurora.org
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Sam Ravnborg <sam@ravnborg.org>, linux-arm-msm@vger.kernel.org,
        Linus W <linus.walleij@linaro.org>,
        Lyude Paul <lyude@redhat.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Steev Klimaszewski <steev@kali.org>, robdclark@chromium.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>,
        dri-devel@lists.freedesktop.org,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 07/11] drm/panel: panel-simple: Stash DP AUX bus; allow
 using it for DDC
In-Reply-To: <20210524165920.v8.7.I18e60221f6d048d14d6c50a770b15f356fa75092@changeid>
References: <20210525000159.3384921-1-dianders@chromium.org>
 <20210524165920.v8.7.I18e60221f6d048d14d6c50a770b15f356fa75092@changeid>
Message-ID: <6e0cd667a8a776e524b42f1535827208@codeaurora.org>
X-Sender: rajeevny@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug,

>  	panel->no_hpd = of_property_read_bool(dev->of_node, "no-hpd");
>  	if (!panel->no_hpd) {
> @@ -708,6 +712,8 @@ static int panel_simple_probe(struct device *dev,
> const struct panel_desc *desc)
> 
>  		if (!panel->ddc)
>  			return -EPROBE_DEFER;
> +	} else if (aux) {
> +		panel->ddc = &aux->ddc;
>  	}

In panel_simple_probe(), the put_device(&panel->ddc->dev) call is 
causing issue when the aux->ddc is used to assign panel->ddc
It works well when "ddc-i2c-bus" is used to assign panel->ddc

static int panel_simple_probe(...)
{
...

free_ddc:
         if (panel->ddc)
                 put_device(&panel->ddc->dev);

         return err;
}

== Log start ==

[    2.393970] ------------[ cut here ]------------
[    2.398747] kobject: '(null)' ((____ptrval____)): is not initialized, 
yet kobject_put() is being called.
[    2.408554] WARNING: CPU: 7 PID: 7 at lib/kobject.c:752 
kobject_put+0x38/0xe0
...
...
[    2.528574] Call trace:
[    2.531092]  kobject_put+0x38/0xe0
[    2.534594]  put_device+0x20/0x2c
[    2.538002]  panel_simple_probe+0x4bc/0x550
[    2.542300]  panel_simple_dp_aux_ep_probe+0x44/0x5c
[    2.547305]  dp_aux_ep_probe+0x58/0x80

== Log end ==


Sincerely,
Rajeev
