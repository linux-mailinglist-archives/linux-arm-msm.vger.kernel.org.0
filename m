Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C347253B9D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Aug 2020 03:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726838AbgH0Bxo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Aug 2020 21:53:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726802AbgH0Bxo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Aug 2020 21:53:44 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A825C06135D
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2020 18:53:44 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id r8so3177389ota.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2020 18:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RdiGNBR/8z5xpwMCADnLtCh6bNy5eovU3k77J+KywCo=;
        b=zpdN6bcBFFVol272Lv8V+Eh6X/QETawk4wb+c9PC07QIRMgLm7Z+EueBpUKKtGOI4r
         KoYoQX9DHfB8FQDEnFq3OIaiR15facyT1Z4BrLWVaPKXf1miIoUO43N8I2yRx97uKj0a
         rmCkvhdbGmgy4LpDKgmsk/Vs+Dr2ue5v+8bAeSY/PJwEalR1AiresH+TkaZuJ5W32Fan
         jaVHzuLAgnBX8S0mJO3raCGWc2FgpM9HYp3S/H7boaozvhPRIr9cMfUR0YI/QGZcJcA/
         1tZj0RCiXWfd8uuZB5WiwJypTrauhBSsoSp2DSzYZCEMvysfTCC7P1QlF1N6ZjfkgCVN
         lM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RdiGNBR/8z5xpwMCADnLtCh6bNy5eovU3k77J+KywCo=;
        b=NRjSe+mhfCMlYlZ6Nokoyis6a7jp59ZAMNedv1HVmrEf8Vum2Bd/RxcLlYm5W48U1/
         7qhajuIEmCmPZbPRyDEM0ydR9mMir9Kt7NXKIjGedcn/O2yIhnjdcfWcemuMGHKHUAYf
         i7UaGqQIVjMaE0hhMCtB33YvD65D4U60ygBSjWhWaeU6+4NyGMyNwhNZFb3BCCR3Bgwl
         PHqRMvXrOIovGi5NIIDL97J4bp3krysL5VTiFV0uLfpEgX5OoBngy2yo6U6Mlkc/kQ4p
         2j6YQ8CYiovsc6N34yMW6UrTh42aeln0otf3/6dFN1ndBqZypS3cDL14Vlc/0nTF7IMb
         NahQ==
X-Gm-Message-State: AOAM532cB5doQNN9wxiJwPwQJNouX8thsYQYJN2J3BUvIqrOXp2enpWt
        VsZfL0RDW0uZ/RWPJthweQ5wiA==
X-Google-Smtp-Source: ABdhPJz6EIUh03cmq18qoY0qsjYMI8alrYY8vvs8oWqlzFXUYEbjoiwXmytxm7wnApukujzRZv0yBg==
X-Received: by 2002:a9d:77d4:: with SMTP id w20mr11204840otl.182.1598493223853;
        Wed, 26 Aug 2020 18:53:43 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
        by smtp.gmail.com with ESMTPSA id y18sm175096ool.16.2020.08.26.18.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 18:53:43 -0700 (PDT)
Date:   Wed, 26 Aug 2020 20:53:36 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     andy.gross@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, ulf.hansson@linaro.org,
        swboyd@chromium.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        John Stultz <john.stultz@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH v2 1/2] Revert "drivers: qcom: rpmh-rsc: Use rcuidle
 tracepoints for rpmh"
Message-ID: <20200827015336.GG3715@yoga>
References: <1598354482-15491-1-git-send-email-mkshah@codeaurora.org>
 <1598354482-15491-2-git-send-email-mkshah@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1598354482-15491-2-git-send-email-mkshah@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 25 Aug 06:21 CDT 2020, Maulik Shah wrote:

> Commit efde2659b0fe ("drivers: qcom: rpmh-rsc: Use rcuidle tracepoints
> for rpmh") was written to fix a bug seen in an unmerged series that
> implemented a struct generic_pm_domain::power_off() callback calling
> rpmh_flush(). See stack trace below.
> 
>      Call trace:
>       dump_backtrace+0x0/0x174
>       show_stack+0x20/0x2c
>       dump_stack+0xc8/0x124
>       lockdep_rcu_suspicious+0xe4/0x104
>       __tcs_buffer_write+0x230/0x2d0
>       rpmh_rsc_write_ctrl_data+0x210/0x270
>       rpmh_flush+0x84/0x24c
>       rpmh_domain_power_off+0x78/0x98
>       _genpd_power_off+0x40/0xc0
>       genpd_power_off+0x168/0x208
> 
> Later the final merged solution is to use CPU PM notification to invoke
> rpmh_flush() and power_off() callback of genpd is not implemented in the
> driver.
> 
> CPU PM notifiers are run with RCU enabled/watching (see cpu_pm_notify()
> and how it calls rcu_irq_enter_irqson() before calling the notifiers).
> 
> Remove this change since RCU will not be idle during CPU PM notifications
> hence not required to use _rcuidle tracepoint. Using _rcuidle tracepoint
> prevented rpmh driver to be loadable module as these are not exported
> symbols.
> 
> This reverts commit efde2659b0fe835732047357b2902cca14f054d9.
> 
> Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Cc: John Stultz <john.stultz@linaro.org>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/soc/qcom/rpmh-rsc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index ae66757..fabe390d 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -495,7 +495,7 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
>  		write_tcs_cmd(drv, RSC_DRV_CMD_MSGID, tcs_id, j, msgid);
>  		write_tcs_cmd(drv, RSC_DRV_CMD_ADDR, tcs_id, j, cmd->addr);
>  		write_tcs_cmd(drv, RSC_DRV_CMD_DATA, tcs_id, j, cmd->data);
> -		trace_rpmh_send_msg_rcuidle(drv, tcs_id, j, msgid, cmd);
> +		trace_rpmh_send_msg(drv, tcs_id, j, msgid, cmd);
>  	}
>  
>  	write_tcs_reg(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, tcs_id, cmd_complete);
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
