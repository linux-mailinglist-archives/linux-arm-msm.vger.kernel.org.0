Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC992AE542
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Nov 2020 02:04:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732023AbgKKBEj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Nov 2020 20:04:39 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:56142 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730894AbgKKBEj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Nov 2020 20:04:39 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605056679; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=G4FZ8gmhmVNCMNey8HG1PJzz0ZnJLvtQudj18MvCfxc=;
 b=p2cgz/rJYUAKICXBuVukUtVJklLPiQzwSP2GiKdSDqkCxKufvFkRtT3pR34W/oR1Cy1Jl5T8
 Tmze51gYn6DEuPcF8h0qQFKB1Vxv7Cn3HfQxAFkuib5lgI51d8Of/F6CYlz/6hXrItutOdzj
 ++hG0UemUm/CC/2z4Kidd14YUMg=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5fab38a4b8c6a84a5c46c860 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 11 Nov 2020 01:04:35
 GMT
Sender: rishabhb=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 478E6C433C9; Wed, 11 Nov 2020 01:04:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D975AC433C8;
        Wed, 11 Nov 2020 01:04:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 10 Nov 2020 17:04:34 -0800
From:   rishabhb@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] remoteproc: sysmon: Improve error messages
In-Reply-To: <20201105045051.1365780-5-bjorn.andersson@linaro.org>
References: <20201105045051.1365780-1-bjorn.andersson@linaro.org>
 <20201105045051.1365780-5-bjorn.andersson@linaro.org>
Message-ID: <cb2a980190c5fa542c11a3640441886c@codeaurora.org>
X-Sender: rishabhb@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-04 20:50, Bjorn Andersson wrote:
> Improve the style of a few of the error messages printed by the sysmon
> implementation and fix the copy-pasted shutdown error in the send-event
> function.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - New patch
> 
>  drivers/remoteproc/qcom_sysmon.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_sysmon.c 
> b/drivers/remoteproc/qcom_sysmon.c
> index 1c42f00010d3..47683932512a 100644
> --- a/drivers/remoteproc/qcom_sysmon.c
> +++ b/drivers/remoteproc/qcom_sysmon.c
> @@ -352,9 +352,9 @@ static bool ssctl_request_shutdown(struct
> qcom_sysmon *sysmon)
> 
>  	ret = qmi_txn_wait(&txn, 5 * HZ);
>  	if (ret < 0) {
> -		dev_err(sysmon->dev, "failed receiving QMI response\n");
> +		dev_err(sysmon->dev, "timeout waiting for shutdown response\n");
>  	} else if (resp.resp.result) {
> -		dev_err(sysmon->dev, "shutdown request failed\n");
> +		dev_err(sysmon->dev, "shutdown request rejected\n");
>  	} else {
>  		dev_dbg(sysmon->dev, "shutdown request completed\n");
>  		acked = true;
> @@ -397,18 +397,18 @@ static void ssctl_send_event(struct qcom_sysmon 
> *sysmon,
>  			       SSCTL_SUBSYS_EVENT_REQ, 40,
>  			       ssctl_subsys_event_req_ei, &req);
>  	if (ret < 0) {
> -		dev_err(sysmon->dev, "failed to send shutdown request\n");
> +		dev_err(sysmon->dev, "failed to send subsystem event\n");
>  		qmi_txn_cancel(&txn);
>  		return;
>  	}
> 
>  	ret = qmi_txn_wait(&txn, 5 * HZ);
>  	if (ret < 0)
> -		dev_err(sysmon->dev, "failed receiving QMI response\n");
> +		dev_err(sysmon->dev, "timeout waiting for subsystem event 
> response\n");
>  	else if (resp.resp.result)
> -		dev_err(sysmon->dev, "ssr event send failed\n");
> +		dev_err(sysmon->dev, "subsystem event rejected\n");
>  	else
> -		dev_dbg(sysmon->dev, "ssr event send completed\n");
> +		dev_dbg(sysmon->dev, "subsystem event accepted\n");
>  }
> 
>  /**
Reviewed-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
