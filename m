Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CEE830511F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 05:45:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239445AbhA0Eom (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 23:44:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405313AbhA0BpK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jan 2021 20:45:10 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D2E1C06174A
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jan 2021 17:34:03 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id u4so325505pjn.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jan 2021 17:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=65VNlJixq/1dzn5bOgjm//zPTu/98GsClCV3pSzlAtM=;
        b=jEHjHP/cnFWaZFlBfcWchXUJjmWOa4pmx9NB2YknMeuj0fkJBShNm51mcmIAbX9C0+
         yKLzDbiPNot9S35nJ+6iQqZPppKJyfM8qRMGoAMBZHNAVwZAkod2SG3wn4AH1oA8rQMn
         NlBEZ+TEvlrJFmz/hfqxPsnAmXSxeyEyBtnKwI0WTG6+kvNSZXbGOuWtkXnnmIg0gTOv
         HSBjnLclD3CCAIxeS44bdXqMOQbr+yNJQveGHQDBftx+1Sf+ZuRay1kkEaPetSLgPtQJ
         WZfYaUYNh7+t+eZXYaPOHYHJ3bP/fzEy+4OP5gE7MDTffZXILIp5hnmWZE9Xzeu00rme
         aeDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=65VNlJixq/1dzn5bOgjm//zPTu/98GsClCV3pSzlAtM=;
        b=mtL63Mpw6LWpjfzxK9XCQ3Op5NR39f5BVRInpd4xWGKV7hTncr1UzgB27nr9bstq+q
         P+PC/CWFhwiA3mjMRarBi4i4inaFAuV8Lm0XkmWc8pVNKq2sqocH6CogypFhTSy2lPvJ
         atShRrk3qX94fK1zZ8GqFwWV4HLh26KmbEDI28PgjCj32Ap3na0LaDIL2jRTE47qAO8n
         tcCnIo68xIj8yT/OaEPRqrHy2356qsNLUZDl8yl+Ab/o3lK1JpCDx6jpLeqv2zdg1RnP
         +ChRtF0WkiupKZBW4Cjs7PB0saUiyerduUZWyC3m/9IYiQJMV+aojKeYR6V+GZ7PbP8o
         X+EQ==
X-Gm-Message-State: AOAM530y1RIpZd0lYJ8GngVoRhb6ouawYU2mdDd99S7e6GEfYjusN3ct
        /NF9V3FF2L73JkhOhEybb9r/Bg==
X-Google-Smtp-Source: ABdhPJxAraDEvPrvAVg5AaLW/isBJ6GgrOh5JxiDLE7qej4rou7RGFfQr/5f1vX0btYhzEv1Y90xqw==
X-Received: by 2002:a17:903:181:b029:df:c7e5:8e39 with SMTP id z1-20020a1709030181b02900dfc7e58e39mr9007839plg.25.1611711243144;
        Tue, 26 Jan 2021 17:34:03 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id a7sm162069pju.28.2021.01.26.17.34.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Jan 2021 17:34:02 -0800 (PST)
Date:   Wed, 27 Jan 2021 09:33:56 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        dan.j.williams@intel.com, vkoul@kernel.org,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dma: qcom: bam_dma: Manage clocks when
 controlled_remotely is set
Message-ID: <20210127013355.GF17701@dragon>
References: <20210126211859.790892-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126211859.790892-1-thara.gopinath@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 26, 2021 at 04:18:59PM -0500, Thara Gopinath wrote:
> When bam dma is "controlled remotely", thus far clocks were not controlled
> from the Linux. In this scenario, Linux was disabling runtime pm in bam dma
> driver and not doing any clock management in suspend/resume hooks.
> 
> With introduction of crypto engine bam dma, the clock is a rpmh resource
> that can be controlled from both Linux and TZ/remote side.  Now bam dma
> clock is getting enabled during probe even though the bam dma can be
> "controlled remotely". But due to clocks not being handled properly,
> bam_suspend generates a unbalanced clk_unprepare warning during system
> suspend.
> 
> To fix the above issue and to enable proper clock-management, this patch
> enables runtim-pm and handles bam dma clocks in suspend/resume hooks if
> the clock node is present irrespective of controlled_remotely property.
> 
> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>

Reviewed-by: Shawn Guo <shawn.guo@linaro.org>
