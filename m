Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B52C347CB3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 16:33:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236611AbhCXPch (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 11:32:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236747AbhCXPcO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 11:32:14 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F9D5C0613DF
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:32:14 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id 11so17583404pfn.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YcW87acVyCevsLYCFMKgehtQqDm5U3c2xzC9Z00X15I=;
        b=a2kyaJgLYGtbfIdh2qJGaNstsr6ycsHaTmr0CsuJvbR72Mm9wByfcK0CR+hbbtonVG
         JxJl7hklsIg0XgUHiqTfIlAmr46jlofEDKswmoMOpzrKPaZtE8gTksTDEZE8EcuXYjT3
         0ihKT8Cv565Hm7WIhOpI+QM2tuZOWrSzWyKaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YcW87acVyCevsLYCFMKgehtQqDm5U3c2xzC9Z00X15I=;
        b=dJE2l6vf21FJa0QM8kme4swkeZ6PrnNs1ABII/tpPKsfxMjIYx2l14l85+eLgU+A7k
         liM3Uc4Kyhb7FgPdbNAHq06YARxQ+hIEYj5lPnqJ1MQRl93F7op1OigBnwte/RC1kWsg
         axcWpUvKtFNWUSW476MePUe0hhW6oNu8+IYee8WaVXV1ZHqNSbLAsm7m3CRsr4OvM0Jx
         WqSSUCp5pFdvF/hgICfPjfmCSzKEqOT3N4euSzQ4fZBsE/PvnI2B5zo3/wCu8rzSGFcL
         XVlSM+Boj9Y0mPuOAyw81Lyrdp7JquUuuJKIJSWG993tfMnlRrAKeaP8cMy+PraXkIB9
         OhGQ==
X-Gm-Message-State: AOAM533x1mHWEJ+hLN5i+sRlshfqg/lzJMVOKZw6YBYbGNXOUXWxXj2V
        4fk+ZhvNLah+h0lvINkkmc+jcg==
X-Google-Smtp-Source: ABdhPJw7ogBm7aBfyhcGbnc6qkVwN1kYQ6sWSFyzU3B4OZ9xwcf9DO1ZwNsFL288NPcUFZqvWwWxxQ==
X-Received: by 2002:a63:4d0:: with SMTP id 199mr3615699pge.304.1616599933630;
        Wed, 24 Mar 2021 08:32:13 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:40a3:9725:46c3:85f6])
        by smtp.gmail.com with UTF8SMTPSA id g22sm2938593pju.30.2021.03.24.08.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 08:32:13 -0700 (PDT)
Date:   Wed, 24 Mar 2021 08:32:10 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Roja Rani Yarubandi <rojay@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        gregkh@linuxfoundation.org, robh+dt@kernel.org,
        linux-serial@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        akashast@codeaurora.org, msavaliy@qti.qualcomm.com,
        stable@vger.kernel.org
Subject: Re: [RESEND PATCH V3 1/2] soc: qcom-geni-se: Cleanup the code to
 remove proxy votes
Message-ID: <YFtbeqc1q2BKsf2e@google.com>
References: <20210324101836.25272-1-rojay@codeaurora.org>
 <20210324101836.25272-2-rojay@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210324101836.25272-2-rojay@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 24, 2021 at 03:48:35PM +0530, Roja Rani Yarubandi wrote:
> This reverts commit 048eb908a1f2 ("soc: qcom-geni-se: Add interconnect
> support to fix earlycon crash")
> 
> ICC core and platforms drivers supports sync_state feature, which
> ensures that the default ICC BW votes from the bootloader is not
> removed until all it's consumers are probes.
> 
> The proxy votes were needed in case other QUP child drivers
> I2C, SPI probes before UART, they can turn off the QUP-CORE clock
> which is shared resources for all QUP driver, this causes unclocked
> access to HW from earlycon.
> 
> Given above support from ICC there is no longer need to maintain
> proxy votes on QUP-CORE ICC node from QUP wrapper driver for early
> console usecase, the default votes won't be removed until real
> console is probed.
> 
> Cc: stable@vger.kernel.org
> Fixes: 266cd33b5913 ("interconnect: qcom: Ensure that the floor bandwidth value is enforced")
> Fixes: 7d3b0b0d8184 ("interconnect: qcom: Use icc_sync_state")

Neither of these commits introduced an issue that is fixed by this
patch, rather this patch relies on these commits to not (re-)introduce
an issue.

I don't think a 'Fixes' tag is needed for this patch. If anything it
fixes the same issue as commit 048eb908a1f2 ("soc: qcom-geni-se:
Add interconnect support to fix earlycon crash"), which doesn't
have such a tag.
