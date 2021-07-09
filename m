Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C0B73C2953
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 20:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbhGIS63 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 14:58:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230310AbhGIS61 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 14:58:27 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10B82C0613DD
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 11:55:43 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id 75-20020a9d08510000b02904acfe6bcccaso10431168oty.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 11:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wvOUxYXv/q9IPjYI6PUafdI2JDHkkMSReR7otJssMhk=;
        b=qVvIHrPLfZlY+azqhcWHeRAq/bRcCChlSSIZV1sV4yZZst7ltDlCfygBLthjhMGceA
         JYEw/cFUpGmw14q2X1MOfOf79Z9QC90WCOpY0ZldeLNRuFNx71zlx41BJaxmdoFS/YKy
         t6RFaINl2bXvI54+TuwT7NffFmO3WDnmF8aYtxH6DPX/6NKnXRGgEn7rWMYFF1wAAm1j
         h26CoU3PRN5tUoIHikb4rKFlHKtfk7DsackKrkLJb2R3peAltMGK9VFqN0XdWWpbo1yj
         Lhl7CrtW07ctITHQYxhmYerDU219Mw7l6FMw9Hy8nTTGX4NQ1f4sfoIzWZkG2EZhr0Az
         zs8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wvOUxYXv/q9IPjYI6PUafdI2JDHkkMSReR7otJssMhk=;
        b=pCKX2jk1rN3JtfZFBBKS569LzOm0V8tuaoshJS2/X/o/2RTECTvpYwrUUyu1PQTit0
         nV+qzoeWlnS1+NysekuDExisE9rFo3QprNtZrX5S8psDUCYuXqR1LohHMhDHMKNvhIeW
         ykXQIn3BszgQU2yI5aDhmwoZFsHlkFkxtbmejUNyFwVu02XHlf3JXeQGCg20ACCP88EL
         Bki7uFzmBcLTtLzZiVs4yXmdQHCDULMwcChaTm/c9TJFZCTccxK25308IiF9ehh1FKiw
         WQIkrq7ckwHKpJ/YY3ewzMQa8YFyd8JSSHyNpnbuvTNcZYdwTu9F9rWLPUZvw7c3CCoH
         oF+Q==
X-Gm-Message-State: AOAM530UNtACLeSTYcYDzbTnxJ8iby3KFlovXNLYpki/shL76/7Wbgmx
        FkiMiqvXAHLDN6UAXOmsDTIjrg==
X-Google-Smtp-Source: ABdhPJyYX3YlhXH+MNoZ5TF0ER8X0/VNWmfrCva7n9DPSda+Iy920S3ZcKMLat40GH6UTN59anIXVQ==
X-Received: by 2002:a05:6830:138c:: with SMTP id d12mr17834010otq.153.1625856942466;
        Fri, 09 Jul 2021 11:55:42 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t144sm1313805oie.57.2021.07.09.11.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 11:55:42 -0700 (PDT)
Date:   Fri, 9 Jul 2021 13:55:39 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/7] clk: qcom: dispcc-sm8250: stop using mmcx
 regulator
Message-ID: <YOibq1FWAMg7WmtP@yoga>
References: <20210709173202.667820-1-dmitry.baryshkov@linaro.org>
 <20210709173202.667820-7-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210709173202.667820-7-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 09 Jul 12:32 CDT 2021, Dmitry Baryshkov wrote:

> Now as the common qcom clock controller code has been taught about power
> domains, stop mentioning mmcx supply as a way to power up the clock
> controller's gdsc.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/clk/qcom/dispcc-sm8250.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
> index de09cd5c209f..dfbfe64b12f6 100644
> --- a/drivers/clk/qcom/dispcc-sm8250.c
> +++ b/drivers/clk/qcom/dispcc-sm8250.c
> @@ -955,7 +955,6 @@ static struct gdsc mdss_gdsc = {
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
>  	.flags = HW_CTRL,
> -	.supply = "mmcx",
>  };
>  
>  static struct clk_regmap *disp_cc_sm8250_clocks[] = {
> -- 
> 2.30.2
> 
