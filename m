Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21AC51E72A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 04:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389570AbgE2Cih (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 22:38:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389013AbgE2Cig (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 22:38:36 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CAA9C08C5C6
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 19:38:36 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id e11so485970pfn.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 19:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=a7KHiy7sQz51ZGSrVBicm5M6tOSmTVX6Q3CJ4IoTQyQ=;
        b=i5Tcpfg70WPAB1woM9dwFpbuHdx/xuB4Xp9vYarZjwJ4me78HLbzRNrOu0yglmW5Ce
         VbObSXa3WCefUi5oVuBladqNkm3SQRdJKZhOI9P9lsuePh9kb86VSmDn5JT9c5VX4WoM
         Nx+ZEeGejLBV9whSnYtis1P0e+VjEHfG5tj7yngMkNPMSutXlpvzhga7lbBO15w1AkOd
         SOqztXd9WfQLfVFgVfnQyGuL1l0h4+eLGsomVVBSmEbhxt/cb2TKhln74KlohTy6PdK6
         wC36X5G1DJS2wvnb5urqP+g4QrFBouLvl0SoxsdAqpBWCgIjOxLeNlcCqNSBj5GA89bk
         KCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=a7KHiy7sQz51ZGSrVBicm5M6tOSmTVX6Q3CJ4IoTQyQ=;
        b=FS91GKALaBs3H05CI4ZqJ1yYbAbwFvPXAolQl5dbOtbcchKWz7QwWR03hTcmTHCu0j
         C2j+eQ8iabpdxJ4sByr1rxcd3mG1proy/gyZfucEDMCvYRa6cAZEBEzp120p1HAx6PsH
         +QTaKyfUd0QrCjNRHLt9QC0Zry0gWGR6lL0QqFqKduYWvy4fvYfDPHC8qlG0hOlSdd5N
         IXyfj3CnlrsUU1PuM8RH+MOu3l1X/Kq5X2qmR0l8wujFiuqRqk6UpEDH+k2a+F/tsmqr
         U0zq6kG8dWqIfVwlkFJWCn0AiT2jeboBZMTuMznlEC6iX67bMRulYQsNeztzInEvScLX
         l3CQ==
X-Gm-Message-State: AOAM533Ar0wFDyvcmYEBI4EPVr0UAVQOX42+YklAXyKWauV+FAGDnel2
        ioiSSkOR5YZNoKLEhaB9aiBaGF1hqXA=
X-Google-Smtp-Source: ABdhPJwIdBaSTR8huUjlM8qHQ6hW/MNSaC2JxMJ2Y8/ce4Mw+DYx2ro0TZXAqXj83U/DFJ4Ui1cmJg==
X-Received: by 2002:a63:5f41:: with SMTP id t62mr6234345pgb.252.1590719915692;
        Thu, 28 May 2020 19:38:35 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h4sm5924444pfo.3.2020.05.28.19.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 19:38:35 -0700 (PDT)
Date:   Thu, 28 May 2020 19:37:30 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: Re: [PATCH 2/4] soc: qcom: socinfo: fix printing of pmic_model
Message-ID: <20200529023730.GR279327@builder.lan>
References: <20200525164817.2938638-1-dmitry.baryshkov@linaro.org>
 <20200525164817.2938638-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200525164817.2938638-2-dmitry.baryshkov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 25 May 09:48 PDT 2020, Dmitry Baryshkov wrote:

> Print sensible string instead of just "(null)" for unknown PMIC models.
> Also as we are at it, do not let debugfs handler access past pmic_models
> array.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/soc/qcom/socinfo.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index 0e6adf1161c0..41f48c3447cc 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -269,7 +269,10 @@ static int qcom_show_pmic_model(struct seq_file *seq, void *p)
>  	if (model < 0)
>  		return -EINVAL;
>  
> -	seq_printf(seq, "%s\n", pmic_models[model]);
> +	if (model <= ARRAY_SIZE(pmic_models) && pmic_models[model])
> +		seq_printf(seq, "%s\n", pmic_models[model]);
> +	else
> +		seq_printf(seq, "unknown (%d)\n", model);
>  
>  	return 0;
>  }
> -- 
> 2.26.2
> 
