Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09DB022150A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2020 21:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbgGOTXs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jul 2020 15:23:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726929AbgGOTXo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jul 2020 15:23:44 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD005C08C5CE
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2020 12:23:43 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id ch3so3551483pjb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2020 12:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OJ/YWMib2y0Oi9xcE3B9cmLij4uK6K7vyJCnBwYrt/0=;
        b=kiYOUCLw+1YMW5C/hDrCQnyOlnRtGrFPezJA04+b0b4IIM5w8VNidZnsPMPHfZ31KS
         LxhyDUqGX0RwzJAlBRqOfe2ODGCTv2LKEk/50WpTfn28Dp+ZBxdVxNZXkt6vym0qxK/Q
         rx82Fv0Ijv3kJKlDTbYSXiKFjVaIlmJguN6+3aaiaOjcY7ZTRMaa5SON4MfuTw8M/HSU
         v8ruKKdEd2o//mAyXMOkE3cXxzduzOyubtoH4T/VezrAKzRSY9zqMZ+YPOlllJ7ocF+k
         UdiLFpdNVsXZC/MUNV+4eR0KRB3FESXVCeMno3tw/kkcCifALuCf49tFeBBbwBN9AyNI
         Cing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OJ/YWMib2y0Oi9xcE3B9cmLij4uK6K7vyJCnBwYrt/0=;
        b=jqRsmS1El4PS1Z1K516C3cgEALTRxPZq91mICeUgpFySGz6ZPYJXKH8PNkzZl8NfNC
         v94o0dQCfCb1D+C9QvJW1b55fLhFsoKyhqh5RbTXJUr0dw3yckEJm0EZAkX5KgfCB4zI
         EBjKbn3xW/NclQ1OkOzD7h8LLale9NLtT6skscHwE7QBH2ipQNjAtx2fnhx+Fsbr3RDQ
         ek1JzpgwoTG/PGE/tHxx4mknI8gbW9UMxQogv98LCNOt7SThfgLMlnNDmv9zm7OY951k
         7KTMoQ62MUQ4VCOwpvVj4T+NGDH3fZx3jyQzH4lnOPccQQhsfhhFamVs/+l8SUyRJqXg
         jQIg==
X-Gm-Message-State: AOAM531bCFQDehetn+qa5AtAlZkB4zXktALgAfRq4t1oRYMvLkqAGPho
        p3Y3uscG22FAokeksuF/Qz4IcA==
X-Google-Smtp-Source: ABdhPJxxiugzYbbF1aUsgwFCaTWYsI5jJtHeJsIIOQXJcVFYwSl1wCBetM40QxEzTt5KKymF9BCfSw==
X-Received: by 2002:a17:90a:ed87:: with SMTP id k7mr1208692pjy.31.1594841023280;
        Wed, 15 Jul 2020 12:23:43 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id g6sm2829878pfr.129.2020.07.15.12.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 12:23:42 -0700 (PDT)
Date:   Wed, 15 Jul 2020 12:21:38 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     ohad@wizery.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom_sysmon: Solve function header
 bitrot issues
Message-ID: <20200715192138.GA2922385@builder.lan>
References: <20200715123551.4011154-1-lee.jones@linaro.org>
 <20200715123551.4011154-2-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200715123551.4011154-2-lee.jones@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 15 Jul 05:35 PDT 2020, Lee Jones wrote:

> Looks as though 'name' has now been moved into 'struct sysmod_event'
> which is passed in instead.  However, the parameter descriptions were
> not updated at the same time.  Let's do that now.
> 
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/remoteproc/qcom_sysmon.c:78: warning: Function parameter or member 'event' not described in 'sysmon_send_event'
>  drivers/remoteproc/qcom_sysmon.c:78: warning: Excess function parameter 'name' description in 'sysmon_send_event'
>  drivers/remoteproc/qcom_sysmon.c:350: warning: Function parameter or member 'event' not described in 'ssctl_send_event'
>  drivers/remoteproc/qcom_sysmon.c:350: warning: Excess function parameter 'name' description in 'ssctl_send_event'
> 
> Cc: Andy Gross <agross@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Thanks Lee, both patches applied.

Regards,
Bjorn

> ---
>  drivers/remoteproc/qcom_sysmon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
> index 8d8996d714f07..9eb2f6bccea63 100644
> --- a/drivers/remoteproc/qcom_sysmon.c
> +++ b/drivers/remoteproc/qcom_sysmon.c
> @@ -71,7 +71,7 @@ static LIST_HEAD(sysmon_list);
>  /**
>   * sysmon_send_event() - send notification of other remote's SSR event
>   * @sysmon:	sysmon context
> - * @name:	other remote's name
> + * @event:	sysmon event context
>   */
>  static void sysmon_send_event(struct qcom_sysmon *sysmon,
>  			      const struct sysmon_event *event)
> @@ -343,7 +343,7 @@ static void ssctl_request_shutdown(struct qcom_sysmon *sysmon)
>  /**
>   * ssctl_send_event() - send notification of other remote's SSR event
>   * @sysmon:	sysmon context
> - * @name:	other remote's name
> + * @event:	sysmon event context
>   */
>  static void ssctl_send_event(struct qcom_sysmon *sysmon,
>  			     const struct sysmon_event *event)
> -- 
> 2.25.1
> 
