Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 953DB190123
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2020 23:36:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbgCWWg2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Mar 2020 18:36:28 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:46520 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbgCWWg2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Mar 2020 18:36:28 -0400
Received: by mail-pf1-f193.google.com with SMTP id q3so3710105pff.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2020 15:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ACuUasvqtN3uO6yrwsX1eOuus0lzP1y4to8YPIyRRRk=;
        b=LEc0lIvcUiVP04UL4F+kP9+DFW+U6/rZcNdd2Wsub+v9ElcnKjfl00yxZOM9jbckr0
         AbOYdFQc/HY3vn1pznkiQpcdUjpBgPOS93HJ7+MdOkkwHiv/ZqWb7NO44QQFFllHrX/Q
         tg9Iz22QRPfnMkJegjTdoDSrlfqGfWC2T6owvXt1ALP/szEQXRoLUVz1+r3sUOUQg3d7
         RCM4GtfKvbLBvNUSlavjfpSqwAGzZS12impU7JTqQAdA+NKlPmCs9d3wtgFgjQbxys+k
         hcSUOGRvUY/Qj3+FL51CVfVjSS0Hk+SR0hGrtq4RqqD7CQa40QAiZKX6aoG1hP2iC76t
         ZByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ACuUasvqtN3uO6yrwsX1eOuus0lzP1y4to8YPIyRRRk=;
        b=DkpuhMJFk1ioD9D98Bpp2EbMPeqrFCC/hl7/lUIyPM8Q5LALvHRGR9Doe5NMbmbHS4
         DDy3ndCsJBpQeN7C3uTsf42MfCAPt+7agAauW3FMiEjrrFpoiufbXPavXKX/VxEnTIxe
         cU2nO1bvOjClcuHKdOO5tAEMQMoKtCLkg8syWHYy4dp4hpVAupnbOU1CHqskyyOlR4yM
         BTFssxIrMYH3lj6UGC7iSOB0mlVyn93p0rB+CcFBuHgQwfYIMupmOQ/INZaXRoxFo45Y
         mdHwTUA3ZUCj/fnvoNnlQlxZuFk6d6xwj+Zi4GAwdZgQkf0wQ2ioaM/7Z78oUn+LHmHj
         PYBw==
X-Gm-Message-State: ANhLgQ2yDtPMkD3fUOT1cFC+XJ3wXgnXo9joJw0U298y9qUVs4Svc4+c
        bGQiuYbznI+/H8Yaks8CF4YrPc3PfDs=
X-Google-Smtp-Source: ADFU+vvmsgG9yaJYioNcJnCg7Tybo7TDvg579J73yNP3NsjkCQSMc9oSTdA7qpXjc2Imrb4DJO+4AA==
X-Received: by 2002:a63:ff20:: with SMTP id k32mr23724220pgi.371.1585002987050;
        Mon, 23 Mar 2020 15:36:27 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id r17sm2328604pgl.80.2020.03.23.15.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 15:36:26 -0700 (PDT)
Date:   Mon, 23 Mar 2020 16:36:24 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] remoteproc: qcom: q6v5: Add common panic handler
Message-ID: <20200323223624.GD30464@xps15>
References: <20200310063817.3344712-1-bjorn.andersson@linaro.org>
 <20200310063817.3344712-4-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310063817.3344712-4-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 09, 2020 at 11:38:16PM -0700, Bjorn Andersson wrote:
> Add a common panic handler that invokes a stop request and sleep enough
> to let the remoteproc flush it's caches etc in order to aid post mortem
> debugging. For now a hard coded 200ms is returned to the remoteproc
> core, this value is taken from the downstream kernel.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Change since v3:
>  - Change return type to unsigned long
> 
>  drivers/remoteproc/qcom_q6v5.c | 20 ++++++++++++++++++++
>  drivers/remoteproc/qcom_q6v5.h |  1 +
>  2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
> index cb0f4a0be032..111a442c993c 100644
> --- a/drivers/remoteproc/qcom_q6v5.c
> +++ b/drivers/remoteproc/qcom_q6v5.c
> @@ -15,6 +15,8 @@
>  #include <linux/remoteproc.h>
>  #include "qcom_q6v5.h"
>  
> +#define Q6V5_PANIC_DELAY_MS	200
> +
>  /**
>   * qcom_q6v5_prepare() - reinitialize the qcom_q6v5 context before start
>   * @q6v5:	reference to qcom_q6v5 context to be reinitialized
> @@ -162,6 +164,24 @@ int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5)
>  }
>  EXPORT_SYMBOL_GPL(qcom_q6v5_request_stop);
>  
> +/**
> + * qcom_q6v5_panic() - panic handler to invoke a stop on the remote
> + * @q6v5:	reference to qcom_q6v5 context
> + *
> + * Set the stop bit and sleep in order to allow the remote processor to flush
> + * its caches etc for post mortem debugging.
> + *
> + * Return: 200ms
> + */
> +unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5)
> +{
> +	qcom_smem_state_update_bits(q6v5->state,
> +				    BIT(q6v5->stop_bit), BIT(q6v5->stop_bit));
> +
> +	return Q6V5_PANIC_DELAY_MS;
> +}
> +EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
> +
>  /**
>   * qcom_q6v5_init() - initializer of the q6v5 common struct
>   * @q6v5:	handle to be initialized
> diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
> index 7ac92c1e0f49..c4ed887c1499 100644
> --- a/drivers/remoteproc/qcom_q6v5.h
> +++ b/drivers/remoteproc/qcom_q6v5.h
> @@ -42,5 +42,6 @@ int qcom_q6v5_prepare(struct qcom_q6v5 *q6v5);
>  int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5);
>  int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5);
>  int qcom_q6v5_wait_for_start(struct qcom_q6v5 *q6v5, int timeout);
> +unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5);

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  
>  #endif
> -- 
> 2.24.0
> 
