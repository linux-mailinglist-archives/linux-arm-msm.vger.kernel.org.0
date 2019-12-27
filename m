Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E4A712B228
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2019 07:53:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726169AbfL0GxE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Dec 2019 01:53:04 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:42028 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726156AbfL0GxD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Dec 2019 01:53:03 -0500
Received: by mail-pg1-f196.google.com with SMTP id s64so14000153pgb.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Dec 2019 22:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=D+tJQxVCKPg9Rb8jS+mkus5u9l3JL2diBZpHYaUBhgU=;
        b=UfubnGc5ZieYDJrua9hILu02gNJl8OLeeUO4liQPJWviXNh47yp5SIKsEQUjA+8dXg
         S+x/DXv4u4lUiW5VaaElly+9FVLVZcyQWcz4tuDqNCnMx+VGMn+x/G23TDvp2OL0TX2S
         gU6L4KTyGAofNFcj5oYj/stpsVeNIb7IFRtWAOBI9NzTsg5RCm8WiiYUFp3xGKnbecEG
         XXzeWRll+rPiAVvxwT7uALE3rESHHcCdCS/LtR9pvpMiVwsPx5iNAvUYWSIM7VDhIdCj
         LPXL9sxsq6FkMBlACzFWwuLVPPr0a8qi9gWscfzAY6nRS64xerjR1eq0i0yjtSb1GCqN
         bnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=D+tJQxVCKPg9Rb8jS+mkus5u9l3JL2diBZpHYaUBhgU=;
        b=XXRicwcxi0ZpbLE/7U50ZHyTK3+JYGHzfHjtmA/gD/Q135S0zClUVD+e23sdXfz8j/
         eBe/vkJNH1rY4TmyRoluFlBX0vp275kd3ImcRixq2CN9m9U6x9bwX7uQKNwYwQ74DWzs
         x7HuR4Fub4WhXH4VB/rPFj7WV92kBWidxuw1dnE8Rdo2OhQaUReWJDJQvskKDD+HbUks
         NIF3DahHrslvwl+mIPBzX3wptxpvB+ApmW9TuvPaOBwsPZXRtPtT2F23N9fP4VOEx3KU
         gDk+hT8pd4AUixkY55TjRHJj9Qh0+kXLZnP4BUsvDStHQDZeTNspw4xYggQmcIAcQCIf
         bSrw==
X-Gm-Message-State: APjAAAV52EHSAMsYWr1nKZLI5KFfaBpPrhfuzFqgQ7E6fxNZ7dSJ5xb7
        NK/9KlJ1G/PBPNacQJcRlA5AoIM0u1I=
X-Google-Smtp-Source: APXvYqw/f7yBMM9QmcJ7bi5ktc8XPVS2HIrEJ20Zpj/mkYQx4ERk06gyCsWLjUjBuMtrYpDSPZQeaA==
X-Received: by 2002:a63:455a:: with SMTP id u26mr53844216pgk.282.1577429582913;
        Thu, 26 Dec 2019 22:53:02 -0800 (PST)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c14sm12832361pjr.24.2019.12.26.22.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2019 22:53:02 -0800 (PST)
Date:   Thu, 26 Dec 2019 22:52:48 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Niklas Cassel <nks@flawful.org>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/5] power: avs: qcom-cpr: remove set but unused variable
Message-ID: <20191227065248.GM1908628@ripper>
References: <20191223141934.19837-1-nks@flawful.org>
 <20191223141934.19837-5-nks@flawful.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191223141934.19837-5-nks@flawful.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 23 Dec 06:19 PST 2019, Niklas Cassel wrote:

> drivers/power/avs/qcom-cpr.c:896:35:
> warning: variable ‘prev’ set but not used
> 
> Detected when running make with W=1.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Niklas Cassel <nks@flawful.org>
> ---
>  drivers/power/avs/qcom-cpr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/power/avs/qcom-cpr.c b/drivers/power/avs/qcom-cpr.c
> index 232836a1ef27..484dd498f8b9 100644
> --- a/drivers/power/avs/qcom-cpr.c
> +++ b/drivers/power/avs/qcom-cpr.c
> @@ -893,7 +893,7 @@ static int cpr_fuse_corner_init(struct cpr_drv *drv)
>  	int i;
>  	unsigned int step_volt;
>  	struct fuse_corner_data *fdata;
> -	struct fuse_corner *fuse, *end, *prev;
> +	struct fuse_corner *fuse, *end;
>  	int uV;
>  	const struct reg_sequence *accs;
>  	int ret;
> @@ -909,7 +909,7 @@ static int cpr_fuse_corner_init(struct cpr_drv *drv)
>  	end = &fuse[desc->num_fuse_corners - 1];
>  	fdata = desc->cpr_fuses.fuse_corner_data;
>  
> -	for (i = 0, prev = NULL; fuse <= end; fuse++, fuses++, i++, fdata++) {
> +	for (i = 0; fuse <= end; fuse++, fuses++, i++, fdata++) {
>  		/*
>  		 * Update SoC voltages: platforms might choose a different
>  		 * regulators than the one used to characterize the algorithms
> -- 
> 2.24.1
> 
