Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80A5012B22C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2019 07:56:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbfL0G46 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Dec 2019 01:56:58 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35131 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726156AbfL0G46 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Dec 2019 01:56:58 -0500
Received: by mail-pf1-f195.google.com with SMTP id i23so8908010pfo.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Dec 2019 22:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=QJHhq9PnWmsC3qWUqBCMwKHMICd+cwEFxCtyiFSIzhI=;
        b=Gy9c/7mNWBcoSXG5JdMpERe6Mi4Mk+j0A9qoBUgPrAxt1ObYc0s03lONaOs3iBZsu0
         IS/M59dnNuwfb2hLDg+DLciLU3NfgvUN8GYTsc+Y8f2/SfLnFpHpJhs3hZ05nDoic5V6
         PEIL4MG4Vs+5baZjOg2hQCFbKyV1jJaRXR8BqLaqgLibEgMI0HnvoKtIbDiH4wjuPKSK
         inZXg2SAOpNdiQYY4baJ699X8ggCO+F3alcQeHhNkM3k/Jmmy1hnbUra+725qVhBBHqa
         MXoBcSjR03/9wfKv6KsQM1XkMYcjP7MlSbYRoPPftxUyadT78etLKnSYoucuNNvZ0DBh
         Q/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=QJHhq9PnWmsC3qWUqBCMwKHMICd+cwEFxCtyiFSIzhI=;
        b=OfwejaMHa4wvMR95/E0tgrJj6VwVwu88ks5eKEjegpvrAuwbNeD0a750ykKQNHvYHJ
         mSbmc0T2ZeR9BFGNpbBuQbIRpPHcAPvediUXMNOJvb2bk+vcHngqLNmsfFMVjDKcpu+i
         ChdvIXNDAcZze6hfWq9VefdadvQ4Daf7lTI9tR/i7ADtgyieefSfC6hLPgoVcfm45YJu
         uYwekdjYrwYvbEGU5Q4DmKKmsDKgAZy8PtKrdHsiIDcYHAzQCViq/lQtHvaziZiF5OMw
         PKUjrkxSLvgwfJMJ837YdtnfoZ9WmenpbajV9YgPwcLophjPZXUz3XN+5TApmdoIXDEX
         s6Vg==
X-Gm-Message-State: APjAAAVbkHn4YKEp0Iy+1qDvP1obWRzgebSS8HFfbnFxadDp2keQxvRL
        9wmy/UFIvprQ1qdnFK6wqKXyZQ==
X-Google-Smtp-Source: APXvYqxRAJ2vRRMp4XiDMooEXngMMAys9nnNPFEVMme7jTBcfs3W3fzAIF2up5EZCAJl3zz+GH/p7Q==
X-Received: by 2002:aa7:8d14:: with SMTP id j20mr37973171pfe.207.1577429817761;
        Thu, 26 Dec 2019 22:56:57 -0800 (PST)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c199sm39927727pfb.126.2019.12.26.22.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2019 22:56:57 -0800 (PST)
Date:   Thu, 26 Dec 2019 22:56:43 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Niklas Cassel <nks@flawful.org>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 5/5] power: avs: qcom-cpr: make cpr_get_opp_hz_for_req()
 static
Message-ID: <20191227065643.GN1908628@ripper>
References: <20191223141934.19837-1-nks@flawful.org>
 <20191223141934.19837-6-nks@flawful.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191223141934.19837-6-nks@flawful.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 23 Dec 06:19 PST 2019, Niklas Cassel wrote:

> drivers/power/avs/qcom-cpr.c:1081:15:
> warning: no previous prototype for �cpr_get_opp_hz_for_req�
> 
> Detected when running make with W=1.
> 

And now also Reported-by: kbuild test robot <lkp@intel.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Niklas Cassel <nks@flawful.org>
> ---
>  drivers/power/avs/qcom-cpr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/power/avs/qcom-cpr.c b/drivers/power/avs/qcom-cpr.c
> index 484dd498f8b9..9247f53550b3 100644
> --- a/drivers/power/avs/qcom-cpr.c
> +++ b/drivers/power/avs/qcom-cpr.c
> @@ -1078,8 +1078,8 @@ static unsigned int cpr_get_fuse_corner(struct dev_pm_opp *opp)
>  	return fuse_corner;
>  }
>  
> -unsigned long cpr_get_opp_hz_for_req(struct dev_pm_opp *ref,
> -				     struct device *cpu_dev)
> +static unsigned long cpr_get_opp_hz_for_req(struct dev_pm_opp *ref,
> +					    struct device *cpu_dev)
>  {
>  	u64 rate = 0;
>  	struct device_node *ref_np;
> -- 
> 2.24.1
> 
