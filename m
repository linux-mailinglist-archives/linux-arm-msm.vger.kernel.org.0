Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90A731E72A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 04:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390972AbgE2CjG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 22:39:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389013AbgE2CjF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 22:39:05 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E724C08C5C6
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 19:39:04 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id y11so413297plt.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 19:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jKD4pdPdvhdVPXt5x/W4N7K7vzajZ99WIGKM1I7ShZI=;
        b=fGo20KBi/ykZ/4KovLiaC9KbQXgHmeHLnRxBLKqRxO7EBXPJFSsSg7jc+MwfPjvMMd
         US9pHfr61zJ+CrB8zOduMbH3FDzGyQ4XxPSsH/9u8YXL4TRwWmYj8N5aCAyrbUZdYcLl
         ncWXCIwe0q6l5tkCOnHYT0IR03G0uguZmWM2gRwtEP4YvCTrWHR+HGZiBvMmwLBayMEO
         o4Np34/jiyn/cvjnnR3rYpHJSxalQ+tcBtRiRqA6cMNhgUPBTZ3otoO3DhnP/q6yvjTG
         YaVYHacBcdb3q3EOLVFO2bHSB02K5NzyiRCS5Pnwt2/EjffmqKA44aB1fOBHBP9XkIn/
         Jn9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jKD4pdPdvhdVPXt5x/W4N7K7vzajZ99WIGKM1I7ShZI=;
        b=Kius9Z1rw3Ku8ZjfQ4peiPExeGQwgtw+S/+4e579zvWr/ZLD1JwvQrzGtg/ACflnZI
         g9gUtfXg23fyvq3hJovN/A3rVQ4TUjrJhnVR8zjKRItGokfqoIhLL38Jiug4d9D5B0Ym
         HtyzdO6eYE+JyfjyxrbFshjS//5jVtNhaMmUZxkRa8jOdAodyHhmJMroEIHmCQj4rQnW
         Gh9LdyH0zCLJU/K87/REoq6KYGbs3J+bTR3zBfKlR688yRPmuHNBs9Ja1SE1OSMcFvYD
         itlmk/6JsDN+LaWe45rDap3s0aMVPYnn2ZRGOA5MDFAYOaOhaZWH+kc7W3hODTXxfOC6
         o2nA==
X-Gm-Message-State: AOAM5311YqK/cuDsYp0T8q27rx5CUE/H8Sqj04F3+KQ0AZ8n1WbzJIDx
        XRQKRSFdE5IY87n2K5U1wP4Mvg==
X-Google-Smtp-Source: ABdhPJwAu94UeYAC7YAFVVKPKfR9FFUO6aYjhhnBoKR7rAJItRdSepulVmmXSNb3SynqUdWTObe1xA==
X-Received: by 2002:a17:90a:f098:: with SMTP id cn24mr7077901pjb.201.1590719943372;
        Thu, 28 May 2020 19:39:03 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j18sm4447433pfd.91.2020.05.28.19.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 19:39:02 -0700 (PDT)
Date:   Thu, 28 May 2020 19:37:57 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: Re: [PATCH 3/4] soc: qcom: socinfo: add file with SoC info format
 version
Message-ID: <20200529023757.GS279327@builder.lan>
References: <20200525164817.2938638-1-dmitry.baryshkov@linaro.org>
 <20200525164817.2938638-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200525164817.2938638-3-dmitry.baryshkov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 25 May 09:48 PDT 2020, Dmitry Baryshkov wrote:

> To ease debugging socinfo driver for newer chips add debugfs file
> returning SoC info format version.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/soc/qcom/socinfo.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index 41f48c3447cc..5f98949c7562 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -338,6 +338,9 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
>  
>  	qcom_socinfo->info.fmt = __le32_to_cpu(info->fmt);
>  
> +	debugfs_create_x32("info_fmt", 0400, qcom_socinfo->dbg_root,
> +			   &qcom_socinfo->info.fmt);
> +
>  	switch (qcom_socinfo->info.fmt) {
>  	case SOCINFO_VERSION(0, 15):
>  		qcom_socinfo->info.nmodem_supported = __le32_to_cpu(info->nmodem_supported);
> -- 
> 2.26.2
> 
