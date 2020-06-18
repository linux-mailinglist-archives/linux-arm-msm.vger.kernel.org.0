Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D47D51FF5D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2020 16:55:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731165AbgFROyz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 10:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730971AbgFROyy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 10:54:54 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D4CBC06174E
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 07:54:54 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id l12so6722115ejn.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 07:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HZYiZmWf6ruq72Uesy0UkTynhdCMb7aPfkJ7IXCFCdM=;
        b=Jf26HU5wpOUJ2LgyCiL8Kvo/hfcGs1oXL7yWO/GV9O2ZMv2+coQ9M7P099MydNUx+5
         WCah9K/X1uK/ZpZ3dO8vhfA2XT2pnRBOyOFB8aE9IrTyd1R2vpUevLTlnffrTDOsCAep
         fKAtEDsPu3ery2VkgkpdwK5Aj5uWdShz9dcGlGtiBI05uQiiRzumcdgOy0xFOLGlUKwG
         qm/oyPbIQBNw2Gif0utsnHoNoFDYZGa258tsCklpvUw7a8lDqPZKN/n6/QfIa2U6JEpm
         G6PAbDTZN/4jy4OQiwlqVrskkqz31lw1GkCucJZA+aauWc7DoOqKBFuL4nVbtvsRWs3u
         0Nww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HZYiZmWf6ruq72Uesy0UkTynhdCMb7aPfkJ7IXCFCdM=;
        b=mbsOYYyfKZNrGLWC1mlP9+qRWzTtzlEcvdgqASBb2VTp++QuBzyurRqk396sovTOYc
         dLKfpwAfO8wJH0GLPbfHPjqF1HXEllOU5Q2GuT5vlkOY08S6fYFuJF1QmMTsceS+5Zdc
         CAeukrQmQqfiFvoHOldolDRIzgCaFRMsMHvDJFfC/ARQ/g1gNqHcHfS+985cUOF+4GWq
         LjUaZFYM5dv0z4Up2unIfWMTMl+gWGgquYpJ4l3r9SOGqxnBDbBSxzDye+p0NSN1X2BC
         zT8FP83rW1Iq0e5ivYMpGCjsIHB2HgmNEAfDlflIWAkxF+KJNUWzDaatIvkygdtAkyif
         ahHQ==
X-Gm-Message-State: AOAM533zfDJXAEj2/hVyHWI7g9d209Exp0BJiAu1HsKyemhwo4KLJXQt
        8sy7ueo9bdzg0ebRVclM6P3JmKoXXpmCUg==
X-Google-Smtp-Source: ABdhPJy/EIb3YZlC6znqs6Wl7xziMLGfTrsNGqzk6lXGsHU4ulDHFzp1AeBFvSlKwH3Rh5VWBxb6hw==
X-Received: by 2002:a17:906:f291:: with SMTP id gu17mr4394554ejb.411.1592492092970;
        Thu, 18 Jun 2020 07:54:52 -0700 (PDT)
Received: from [192.168.1.3] (212-5-158-140.ip.btc-net.bg. [212.5.158.140])
        by smtp.googlemail.com with ESMTPSA id b26sm2452595eju.6.2020.06.18.07.54.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 07:54:52 -0700 (PDT)
Subject: Re: [PATCH v6 5/6] media: venus: core: Add support for opp
 tables/perf voting
To:     Rajendra Nayak <rnayak@codeaurora.org>, bjorn.andersson@linaro.org,
        agross@kernel.org, robdclark@gmail.com, robdclark@chromium.org,
        stanimir.varbanov@linaro.org
Cc:     viresh.kumar@linaro.org, sboyd@kernel.org, mka@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <1592222564-13556-1-git-send-email-rnayak@codeaurora.org>
 <1592222564-13556-6-git-send-email-rnayak@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <e0f856ec-e391-9b1d-baa3-7dda20cb853a@linaro.org>
Date:   Thu, 18 Jun 2020 17:54:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1592222564-13556-6-git-send-email-rnayak@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rajendra,

On 6/15/20 3:02 PM, Rajendra Nayak wrote:
> Add support to add OPP tables and perf voting on the OPP powerdomain.
> This is needed so venus votes on the corresponding performance state
> for the OPP powerdomain along with setting the core clock rate.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> Cc: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> Cc: linux-media@vger.kernel.org
> ---
> No functional change in v6, rebased over 5.8-rc1
> Bindings update to add optional PD https://lore.kernel.org/patchwork/patch/1241077/
> 
>  drivers/media/platform/qcom/venus/core.c       | 43 +++++++++++++++++---
>  drivers/media/platform/qcom/venus/core.h       |  5 +++
>  drivers/media/platform/qcom/venus/pm_helpers.c | 54 ++++++++++++++++++++++++--
>  3 files changed, 92 insertions(+), 10 deletions(-)
> 

<cut>

>  
> @@ -740,13 +740,16 @@ static int venc_power_v4(struct device *dev, int on)
>  
>  static int vcodec_domains_get(struct device *dev)
>  {
> +	int ret;
> +	struct opp_table *opp_table;
> +	struct device **opp_virt_dev;
>  	struct venus_core *core = dev_get_drvdata(dev);
>  	const struct venus_resources *res = core->res;
>  	struct device *pd;
>  	unsigned int i;
>  
>  	if (!res->vcodec_pmdomains_num)
> -		return -ENODEV;
> +		goto skip_pmdomains;
>  
>  	for (i = 0; i < res->vcodec_pmdomains_num; i++) {
>  		pd = dev_pm_domain_attach_by_name(dev,
> @@ -763,7 +766,41 @@ static int vcodec_domains_get(struct device *dev)
>  	if (!core->pd_dl_venus)
>  		return -ENODEV;
>  
> +skip_pmdomains:
> +	if (!core->has_opp_table)
> +		return 0;
> +
> +	/* Attach the power domain for setting performance state */
> +	opp_table = dev_pm_opp_attach_genpd(dev, res->opp_pmdomain, &opp_virt_dev);
> +	if (IS_ERR(opp_table)) {
> +		ret = PTR_ERR(opp_table);
> +		goto opp_attach_err;
> +	}
> +
> +	core->opp_pmdomain = *opp_virt_dev;
> +	core->opp_dl_venus = device_link_add(dev, core->opp_pmdomain,
> +					     DL_FLAG_RPM_ACTIVE |
> +					     DL_FLAG_PM_RUNTIME |
> +					     DL_FLAG_STATELESS);
> +	if (!core->opp_dl_venus) {
> +		ret = -ENODEV;
> +		goto opp_dl_add_err;
> +	}
> +
>  	return 0;
> +
> +opp_dl_add_err:
> +	dev_pm_domain_detach(core->opp_pmdomain, true);
> +opp_attach_err:
> +	if (core->pd_dl_venus) {
> +		device_link_del(core->pd_dl_venus);
> +		for (i = 0; i < res->vcodec_pmdomains_num; i++) {
> +			if (IS_ERR_OR_NULL(core->pmdomains[i]))
> +				continue;
> +			dev_pm_domain_detach(core->pmdomains[i], true);
> +		}
> +	}
> +	return ret;
>  }
>  
>  static void vcodec_domains_put(struct device *dev)
> @@ -773,7 +810,7 @@ static void vcodec_domains_put(struct device *dev)
>  	unsigned int i;
>  
>  	if (!res->vcodec_pmdomains_num)
> -		return;
> +		goto skip_pmdomains;
>  
>  	if (core->pd_dl_venus)
>  		device_link_del(core->pd_dl_venus);
> @@ -783,6 +820,15 @@ static void vcodec_domains_put(struct device *dev)
>  			continue;
>  		dev_pm_domain_detach(core->pmdomains[i], true);
>  	}
> +
> +skip_pmdomains:
> +	if (!res->opp_pmdomain)
> +		return;
> +
> +	if (core->opp_dl_venus)
> +		device_link_del(core->opp_dl_venus);
> +
> +	dev_pm_domain_detach(core->opp_pmdomain, true);

Without corresponding changes in venus DT node we call pm_domain_detach
with core->opp_pmdomain = NULL which triggers NULL pointer dereference.

I guess you should check:

	if (core->has_opp_table)
		dev_pm_domain_detach(core->opp_pmdomain, true);

or

	if (core->opp_pmdomain)
		dev_pm_domain_detach(core->opp_pmdomain, true);


... not sure which one is more appropriate or both are.


-- 
regards,
Stan
