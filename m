Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 159CC15A149
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2020 07:31:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728109AbgBLGb6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 01:31:58 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37269 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727893AbgBLGb6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 01:31:58 -0500
Received: by mail-pl1-f195.google.com with SMTP id c23so567737plz.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2020 22:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=F5k8IJZMK/nJH3dj+UN04HFPptBmFYQ7C5BtIcmZek0=;
        b=UakYPEeNTs9w07NmJnHfIv49QPaAus+cJ3pOa2Iwbn3RDrKxNv1gtczYgPdMXdoy8+
         8rJrmqryb5R4tSr5uRKRdBrLLjVWj2oGtrEmYm8sqCmlWvP5t/f4N3K1cR1UNTJbi9p4
         hfoM09VYb9ouO9I3XsIDL3L+jQx6oDeqnC4fkzxfA3pjGHWTV/6KfHD5CUpvbkjcncIG
         xCNFIHwLfK5siX/ywTFhPH9Zh0EK1fT6opNKNCTn5BvcMo03SpHBFsIx0+S6WZf8Xflb
         o9F8f2ptFpzVMPESj/J2Qt3T58HbnD4cL5wt9NwUQR0x7nd2boWNz7mXIOr81LQYWXmk
         +G4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=F5k8IJZMK/nJH3dj+UN04HFPptBmFYQ7C5BtIcmZek0=;
        b=IrJesUyzu9ekn0i/TqQ6FNd5gt7JD6YETWH0jbihag+QLHQlqMEKtlqNNqm0FO80Pb
         Y+UuxrIRsVCVADRtnWEfgPm6HJ7lU/9xu/ChIF8PKb0iBEkSCej39UbQG58/rmi1A9pI
         kFx74dr86RsEp4FAc7GiPXmis6lJClAiCWFyRuHBt9X8XYGR1mdL9dbeZEKUSXAXG+MT
         qH9ga+9K8ky2Lz4A66xZk34eewG1KHbgp/MK+3qMRLlC0si2PMHurj1WlRqv0nrgjijL
         NMHtpjW/EV7QSo/dRGh+jlbW6uAOeFQYVZeWR4yHQqDyaPBTD6XBnvzb7IsGo+B/Qe2+
         5nXQ==
X-Gm-Message-State: APjAAAXI0RgvJ+K7U0oS8f+jhg0pqKUCbHhrqY04ADyrUL9aFQsl4tK/
        PwtG6tiaQW7jBB4ITCWPLvhxUD1dUos=
X-Google-Smtp-Source: APXvYqxqBFIjlK2CH6hHv/Pfjn8B3oh3xX5ZsrKSB1m0GcV7iChIZoGq8iMbPygRkv3wUCesoiddkA==
X-Received: by 2002:a17:902:262:: with SMTP id 89mr6945138plc.67.1581489117661;
        Tue, 11 Feb 2020 22:31:57 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y64sm6043527pgb.25.2020.02.11.22.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 22:31:56 -0800 (PST)
Date:   Tue, 11 Feb 2020 22:31:54 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arun Kumar Neelakantam <aneela@codeaurora.org>
Cc:     clew@codeaurora.org, Andy Gross <agross@kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] soc: qcom: aoss: Use wake_up_all() instead of
 wake_up_interruptible_all()
Message-ID: <20200212063154.GO3948@builder>
References: <1579681417-1155-1-git-send-email-aneela@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579681417-1155-1-git-send-email-aneela@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 22 Jan 00:23 PST 2020, Arun Kumar Neelakantam wrote:

> During the probe the task is waiting in TASK_UNINTERRUPTIBLE state which
> cannot be woken-up by wake_up_interruptible_all() function.
> 
> Use wake_up_all() to wake-up both TASK_UNINTERRUPTIBLE and
> TASK_INTERRUPTIBLE state tasks.
> 
> Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>

Applied

Regards,
Bjorn

> ---
>  drivers/soc/qcom/qcom_aoss.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
> index 006ac40..fe79661 100644
> --- a/drivers/soc/qcom/qcom_aoss.c
> +++ b/drivers/soc/qcom/qcom_aoss.c
> @@ -200,7 +200,7 @@ static irqreturn_t qmp_intr(int irq, void *data)
>  {
>  	struct qmp *qmp = data;
>  
> -	wake_up_interruptible_all(&qmp->event);
> +	wake_up_all(&qmp->event);
>  
>  	return IRQ_HANDLED;
>  }
> -- 
> 1.9.1
