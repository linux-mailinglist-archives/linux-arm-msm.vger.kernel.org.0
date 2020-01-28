Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64CCC14C1C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2020 21:44:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgA1Uo0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jan 2020 15:44:26 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:39794 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726257AbgA1Uo0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jan 2020 15:44:26 -0500
Received: by mail-pl1-f193.google.com with SMTP id g6so5569804plp.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2020 12:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KbJeh8/LI2mlLTbZ1tH2VO6yi1sNDNk35sjg9NyyWm8=;
        b=FNCVgdtuEjKA0XO9LyT7fFDkTLztdtZBXLK+Wji/XBIULcUc0VHBKSq9rnp57o4/uv
         Wrvz6O3JeBx7ohJxH5vzXQHWvMR/zOkDj31S7lKg05DguscHm3hzpUBEspKsfME/HFvJ
         hbOhPs4Mz+OsShEmI3DgPvYZwga6/tAccTuq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KbJeh8/LI2mlLTbZ1tH2VO6yi1sNDNk35sjg9NyyWm8=;
        b=EuHQDZLOOQcX23gyrrt9Clj56o/KCHEiMmpFNYlAyJULarBn6pzEs/6WjXWi36omGk
         Zv0zoxfoj5DEL6gwDw3A+a+4d4UdsZbfsOTfdlSnWOAgnZs6gkgCLeSJMGjxa3gwUKKA
         DhZhzYaSqTsFL+MgnMaDcvoKylOHXqJKKSx9F2Bl2EGm1057rerW7gQX5neTlry3DgPc
         gr+OHt8GtN6I/NYluG/DyphPmWl8hY73sHVw22iXe78iy+rqn/qHal+cJWOFdxPAUmvD
         9win8xjUGCvJIyt55mqM1TWcB766DbWY8U2woScu6prWQJE52Kk3sx2mG2IgRc1a7nw2
         cPSw==
X-Gm-Message-State: APjAAAV2Zhg4AVV/udAOu0q/qxvxb07QwV3JKK/KI0PVdBeWt/gZHODe
        kUc3zvGRFgRuM5i7WpgmSuyYyA==
X-Google-Smtp-Source: APXvYqxRJmQfwf2gXkhjLY8zub6q2yqFGirhOsUJnZOp1NUzUg5k4YhfFHNWtUB/gZ/+9rYRTomoww==
X-Received: by 2002:a17:90a:bd01:: with SMTP id y1mr6823668pjr.129.1580244265708;
        Tue, 28 Jan 2020 12:44:25 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id c14sm20864917pfn.8.2020.01.28.12.44.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2020 12:44:25 -0800 (PST)
Date:   Tue, 28 Jan 2020 12:44:23 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     viresh.kumar@linaro.org, sboyd@kernel.org,
        georgi.djakov@linaro.org, saravanak@google.com, nm@ti.com,
        bjorn.andersson@linaro.org, agross@kernel.org,
        david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        rjw@rjwysocki.net, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, dianders@chromium.org,
        vincent.guittot@linaro.org, amit.kucheria@linaro.org,
        ulf.hansson@linaro.org
Subject: Re: [RFC v3 02/10] cpufreq: blacklist SDM845 in cpufreq-dt-platdev
Message-ID: <20200128204423.GF46072@google.com>
References: <20200127200350.24465-1-sibis@codeaurora.org>
 <20200127200350.24465-3-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200127200350.24465-3-sibis@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 28, 2020 at 01:33:42AM +0530, Sibi Sankar wrote:
> Add SDM845 to cpufreq-dt-platdev blacklist.

nit: you could mention that cpufreq is handled by the
'qcom-cpufreq-hw' driver.

> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index f2ae9cd455c17..5492cf3c9dc18 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -130,6 +130,7 @@ static const struct of_device_id blacklist[] __initconst = {
>  	{ .compatible = "qcom,apq8096", },
>  	{ .compatible = "qcom,msm8996", },
>  	{ .compatible = "qcom,qcs404", },
> +	{ .compatible = "qcom,sdm845", },
>  
>  	{ .compatible = "st,stih407", },
>  	{ .compatible = "st,stih410", },

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
