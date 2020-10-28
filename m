Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA8229D9FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 00:08:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732751AbgJ1XIq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Oct 2020 19:08:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732861AbgJ1XIp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Oct 2020 19:08:45 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67CC2C0613CF
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2020 16:08:45 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id f21so378832plr.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2020 16:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1pIhF3Lx72mYJfiMtwf9QoYKy68h8haDkbJMtDNYKEw=;
        b=A5zt5zl/3a+3Lf6ycRXqaL23CVTsmGCVta8hYuuRyWm85jhP7yy4UtsmSZy7osgGO8
         0Htg7p+tSzx943zm1oqpQtVMxsYpCQLWsZR+s3FSJhV1niNcbt8n/UlIJzuYS9jEwutH
         4HJR14Hc9K5YbNBcIm9/PEMAdrMM5Jbw2mq6S0/rIQRPDGoZ//V8RgwDNTuPMxhc7haO
         bfd92SIOiVSQ1+uNr+jLeTMg8hkUo3f36tTcyiGag/PIA1uoT0CXOZcUHjy4HSuRZhEG
         gpNL89nH/JtWad1FLF6I17dXaAvqYJfXtIU22lU5Rld5yfJri5H0Xe134gj9JwAzpov2
         PZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1pIhF3Lx72mYJfiMtwf9QoYKy68h8haDkbJMtDNYKEw=;
        b=pHGh0oi2kDbSbeLbx7qPYC8c2cpNgwhW9uDVcEsMavWbu2NS1/oK1DlXWz4V5mwKwI
         XePlAGtYHz4hQGdSbRgIU3RWA7dwM7AljsJXk5PvEAYjasisv+0OXbh9RxixJtFgUGIR
         JN99aQe5s4FWVT7xEtGo2v0gTHz+2hw/1L6JaX9y6nSaN7TPbobx/F4AUKIhW9+gaTMC
         ZA4a6Bw0E6V41icCJdl6xgqGLRV5PbTqlxzIix9GYpDXQVy57Pz8lTjqB+QttpnydUOc
         7dQegCezMyboBrRGKat6Ru0qR0k3pvdmVj6sn1E/2vJdcHc1S5BTrXCpAYtrEQVKS3Uf
         1n7w==
X-Gm-Message-State: AOAM530OikvGGkTw8hcmy41ebFjaU2A9sMuZ1fF5u/SscTz7Z2tYL1mX
        EWmb118fu5OLd7YM82gwFhRzvi4++tE6RQ==
X-Google-Smtp-Source: ABdhPJw/lN1Rdn4IAlyuzBmnXHAuWRhy9Jalsrt5qmfXLWggNb6REZMG2RfZFvV2Oa+QU+95iAenSQ==
X-Received: by 2002:a17:902:8a8b:b029:d5:f871:92bd with SMTP id p11-20020a1709028a8bb02900d5f87192bdmr6827921plo.10.1603880985833;
        Wed, 28 Oct 2020 03:29:45 -0700 (PDT)
Received: from localhost ([122.181.54.133])
        by smtp.gmail.com with ESMTPSA id p5sm4520672pjz.47.2020.10.28.03.29.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Oct 2020 03:29:44 -0700 (PDT)
Date:   Wed, 28 Oct 2020 15:59:42 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Frank Lee <frank@allwinnertech.com>
Cc:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, vireshk@kernel.org, nm@ti.com, sboyd@kernel.org,
        rjw@rjwysocki.net, jcrouse@codeaurora.org, eric@anholt.net,
        tiny.windzz@gmail.com, kholk11@gmail.com,
        emil.velikov@collabora.com, gustavoars@kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/3] opp: Add devres wrapper for dev_pm_opp_set_prop_name
Message-ID: <20201028102942.zc5hgqpo2bfrn6in@vireshk-i7>
References: <20201012135517.19468-1-frank@allwinnertech.com>
 <20201012135517.19468-3-frank@allwinnertech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201012135517.19468-3-frank@allwinnertech.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12-10-20, 21:55, Frank Lee wrote:
> From: Yangtao Li <tiny.windzz@gmail.com>
> 
> Add devres wrapper for dev_pm_opp_set_prop_name() to simplify driver
> code.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> Signed-off-by: Yangtao Li <frank@allwinnertech.com>
> ---
>  drivers/opp/core.c     | 39 +++++++++++++++++++++++++++++++++++++++
>  include/linux/pm_opp.h |  6 ++++++
>  2 files changed, 45 insertions(+)

On a second thought I am looking at dropping this one as you haven't
added any users yet and I am afraid it will stay unused.

-- 
viresh
