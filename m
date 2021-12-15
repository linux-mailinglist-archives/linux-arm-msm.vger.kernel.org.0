Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 401F1474EFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 01:17:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238408AbhLOARQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 19:17:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238411AbhLOARP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 19:17:15 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60597C06173F
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 16:17:15 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id r34-20020a17090a43a500b001b0f0837ce8so2607314pjg.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 16:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=dW2V2lKb0O4eqscMJmeXF+GvXN7+o3k689rVoSdOPg8=;
        b=Zj2MM+GSzzU/2r+uwp0+W4nmiLEysJEzk8cXr4lAZFYckuVKU9A9zA6YZzBqlDSjER
         oKtYz4UfMpFHIFsHMN0yaNzl0ng7Uq5Vv1JFo+cpnxTkTFIl1KjSZsbuHG3NWPqKlgST
         qrMEH/LosZIM63ar7ZbfpnhwmDm8+Za47aerUzeFwqXithmpT0s9VHcPLxgoCSoz28tx
         p7EmSrKSIbTOE1dwQmb42vw9ER2HUoX/AbSnN1WhtWr5Ef7JSjwT9IYiW29eXXwJeowV
         XbQaCiAbJaTwQpOnYNZg/suC4nYSllWI8QpgMX0y8/AfXwphFhTJ6HWOQ37dK1ZpN42n
         u91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=dW2V2lKb0O4eqscMJmeXF+GvXN7+o3k689rVoSdOPg8=;
        b=nYVU4XpTc5UqLNmFubYu7UwjCP90ikMDARYbcR5gUYElysSGQEyzUL1omMo5CIJfZZ
         8ZRufZyWOWgcJRImRR95GiaxlXSTQV6pzHnOB+2EZzMEOntVgXrsGYKW8MoP6DA2WEYh
         09BteKUwYCdf6VSsKj2yIc8SoVviGhcXDAZsyueUn37SK1SEQ1YhegAkJdwQ/12ODfgS
         Xc4Pyu+npPqFiPJBzWoznshNRDCygfP9uTFC/wKbFlX7zeuJlVdNrQnR00frBd4P4RqP
         loJnKMDMAdFScpHIeZVdK/8dAUQz9pNA4uEGPg41r5Q2wGrjYBe5dPx5bqfPrQ7XHpF3
         aGqQ==
X-Gm-Message-State: AOAM532qc229Ts1RxgvfLKbOEz+5JoWm8fW8KvVfbRplsaZmCOKs02sO
        Y+lljhNSBscyo5uuRPFFogpPRQ==
X-Google-Smtp-Source: ABdhPJyePvv6752UQuCXv3XXUBwnA/tQuEJXdplQBcJ6Jw7INPVfYeGRWZ6wFMEiL0jR057C0YWNYw==
X-Received: by 2002:a17:90a:e389:: with SMTP id b9mr8807470pjz.235.1639527434892;
        Tue, 14 Dec 2021 16:17:14 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id t8sm177174pgk.66.2021.12.14.16.17.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Dec 2021 16:17:14 -0800 (PST)
Date:   Wed, 15 Dec 2021 08:17:08 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Georgi Djakov <djakov@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 RESEND 0/5] Add QCM2290 interconnect support
Message-ID: <20211215001707.GA15936@dragon>
References: <20211214093011.19775-1-shawn.guo@linaro.org>
 <0549abbb-9e75-70e9-399b-1b3f84dc5c20@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0549abbb-9e75-70e9-399b-1b3f84dc5c20@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 14, 2021 at 01:24:37PM +0200, Georgi Djakov wrote:
> Hi Shawn,
> 
> On 14.12.21 11:30, Shawn Guo wrote:
> > Changes for v3 resend:
> > - Rebase on linux-next
> 
> Did you try compiling it? There is one more driver where we need to
> add the QoS type, otherwise I see this error:
> 
> drivers/interconnect/qcom/msm8996.c:1884:3: error: ‘const struct
> qcom_icc_desc’ has no member named ‘is_bimc_node’
>  1884 |  .is_bimc_node = true,

Oops! I did compile, but just noticed that INTERCONNECT_QCOM_MSM8996 was
not enabled in my defconfig.  I will fix it with v4.  Sorry about that,
and thanks for spotting the error, Georgi!

Shawn
