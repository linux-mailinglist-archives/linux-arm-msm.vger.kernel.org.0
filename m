Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 934D0262070
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 22:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730866AbgIHUKp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 16:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729824AbgIHPPo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 11:15:44 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3F12C0A3BE3
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2020 07:54:55 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id 185so16670178oie.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2020 07:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=w5WD7mYu1UZ17o5IwyM77lKheQXm/FoO3alEWArs8d8=;
        b=gEjB2PVRSfcdabC2to0ytgzJqyIE1We/Z9N99i/QXWyfZI29q9ILSekgH2UoRUTGo1
         mTSM6e38qq85pZ/1eQaDy5C9Ri71lBuFgqahCU3dDMEpfMcdod4JVa9HEaInoH/SEQwl
         Vh+EggBAgwVJ02di4FQXo38idBxXJArYd4VMOiIOZLi0ViL4a5UwDGnd0P5ZZiwoK6Ce
         IVuzaRE6dO5Er+fpuifC/1vBBr848mgts7QN0VCcqSs/Uf8+mrE8pvTPpMphF6Y6rwxu
         Ld+/jSsFye84Q/SxKreWOUnNkIEfxQWleKPBpMSNTFUHQVum/1MC+NmkLK4MmJsI7COx
         fgWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w5WD7mYu1UZ17o5IwyM77lKheQXm/FoO3alEWArs8d8=;
        b=QyDR/lWaq65UzERGQGQYi8nQdNr4AwNetouEKExJxPXb5KjFKx5zaosZkJkl68nr48
         pzMgoRBanciO4DryPmInUPfol/MCxe16XZjr7ALkxysEnsINOI5GnwcVL1revHkGTL+X
         chjVJbZp7HAkvmhZxnYkJa209MlS84bs0lidhnjsJMdz5CNAcBheiYM7l0BGFvnkBoPd
         boULVJb0xv9lMysu9pVlzE7LD3IIw37Pn7PcEjp753CpmnbqT7+rRuoIbq8mYMv4jnNb
         32iACZzgkKmf8TEnDUO5A2M52RKywcDKpOoIn5Px0dBGcQqD1HNJNynTpQ92s4TutsGK
         WQiA==
X-Gm-Message-State: AOAM533XeOaO4Tr7I72tMx3h78e/9vPyzbq2GHLglmoaqqeISqiiuWVG
        nS0PSQVkJcUttVoR+G746vfGpQ==
X-Google-Smtp-Source: ABdhPJwfgX5hiHCKByDlCicvW5Vmn/1mu2VuOJ8ql9YPirRsdRzLX51mj7XJnCv+3+D49GSpE6m/uA==
X-Received: by 2002:aca:df84:: with SMTP id w126mr1740500oig.103.1599576894821;
        Tue, 08 Sep 2020 07:54:54 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
        by smtp.gmail.com with ESMTPSA id l5sm3498342otj.40.2020.09.08.07.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 07:54:54 -0700 (PDT)
Date:   Tue, 8 Sep 2020 09:54:50 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        "moderated list:SOUNDWIRE SUBSYSTEM" <alsa-devel@alsa-project.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] soundwire: qcom: fix SLIBMUS/SLIMBUS typo
Message-ID: <20200908145450.GM3715@yoga>
References: <20200908140818.28373-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200908140818.28373-1-jonathan@marek.ca>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 08 Sep 09:08 CDT 2020, Jonathan Marek wrote:

> Fix slimbus case being broken thanks to a typo.
> 
> Fixes: 5bd773242f75 ("soundwire: qcom: avoid dependency on CONFIG_SLIMBUS")
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
> This should be squashed into the problematic patch if possible,
> but I'm not sure if that's possible since its already in linux-next?
> 
>  drivers/soundwire/qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 100af93a5eab..c406a079d237 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -780,7 +780,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  	if (!ctrl)
>  		return -ENOMEM;
>  
> -#if IS_ENABLED(CONFIG_SLIBMUS)
> +#if IS_ENABLED(CONFIG_SLIMBUS)
>  	if (dev->parent->bus == &slimbus_bus) {
>  #else
>  	if (false) {
> -- 
> 2.26.1
> 
