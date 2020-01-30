Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC3CA14E4E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2020 22:38:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727566AbgA3ViR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jan 2020 16:38:17 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:40731 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727161AbgA3ViQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jan 2020 16:38:16 -0500
Received: by mail-pl1-f194.google.com with SMTP id y1so1838804plp.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jan 2020 13:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EwmsKAAR9EZeJAmAlDaaBhS2SFQYknZY+oQh1g/QCAE=;
        b=P4GDqsD+SXwiCy9JUOoM9+wWOVmgS78wb+4/C1tpIyPq02GJCeJnxqEEgOF3HbYOlI
         BYIwnDL/eJZrdTMcTFAD2q8tKn8VMgc3cJuZ7114rYY2Q4jvFczsJKWtGD8/t3cEmejm
         KdnUWk62kKdW/GP9ZbtOEViVs9kyEz+QAaIfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EwmsKAAR9EZeJAmAlDaaBhS2SFQYknZY+oQh1g/QCAE=;
        b=JZzS9apZ+Ei723j/nuiHjhKZ/NzizhDKkLboVv95qXsDdqMxxPsIU84b4qHoIwuTni
         A64Iwf05V2tzv87OCf8SEbaLAMT159a2RDHPRRpcOV/Y1r6Ye6GFBtw3Kcm4JHuCUMz2
         PmygLL+/G8LUtSbpjHMI7A1dvb7qWKT4Q2mVsg6q2nz9m5VwujyVBZFsJJJQv0vUjyZt
         ftxDpvRn9TRkduZV4FsW3Sc7cZhlQk2DRfZ4q9/yhckSmys2qD8FD5o5MBKXcQT4PyDt
         MA7pO8pmLWgrZSHKQeInZ7n0hiW8zQPqUVwHYVToDnDlouqtp73OykLPKH38HjLlRsqh
         d0Jw==
X-Gm-Message-State: APjAAAXPNI5dX4aIHWvwckc4A68I5WHcJ2QQ2JmwAoxoDRiGdyce6eG8
        xtJc9g5+ldk9sSGof3BvvctJSg==
X-Google-Smtp-Source: APXvYqxnGY0DZfQrEhOfeE54gwV7TiIH7kOdxAYEFz+gCUTbzfGMuGMB3HDD6dI8E1dq8Lsjv2ux8Q==
X-Received: by 2002:a17:90a:a409:: with SMTP id y9mr8265577pjp.119.1580420294561;
        Thu, 30 Jan 2020 13:38:14 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id w8sm7883326pfj.20.2020.01.30.13.38.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2020 13:38:13 -0800 (PST)
Date:   Thu, 30 Jan 2020 13:38:12 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Pradeep P V K <ppvk@codeaurora.org>
Cc:     adrian.hunter@intel.com, georgi.djakov@linaro.org,
        robh+dt@kernel.org, ulf.hansson@linaro.org,
        asutoshd@codeaurora.org, vbadigan@codeaurora.org,
        stummala@codeaurora.org, sayalil@codeaurora.org,
        rampraka@codeaurora.org, sboyd@kernel.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, linux-mmc-owner@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [RFC-v2 0/2] Add Support for SDHC bus bandwidth voting
Message-ID: <20200130213812.GK71044@google.com>
References: <1573220319-4287-1-git-send-email-ppvk@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1573220319-4287-1-git-send-email-ppvk@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Pradeep,

what is the status of this series, do you plan to send v3 soon or
is it abandonded?

Thanks

Matthias

On Fri, Nov 08, 2019 at 07:08:37PM +0530, Pradeep P V K wrote:
> Vote for the MSM bus bandwidth required by SDHC driver
> based on the clock speed and bus width of the card.
> Otherwise, the system clocks may run at minimum clock
> speed and thus affecting the performance.
> 
> Adapt to the new ICB framework for bus bandwidth voting.
> 
> This requires the source/destination port ids.
> Also this requires a tuple of values.
> 
> The tuple is for two different paths - from SDHC master
> to BIMC slave. The other is from CPU master to SDHC slave.
> This tuple consists of the average and peak bandwidth.
> 
> This change is based on Georgi Djakov [RFC]
> (https://lkml.org/lkml/2018/10/11/499)
> 
> ---
> changed since v1:
> * Addressed all the Review comments.
> * Minor code rebasing.
> 
> Pradeep P V K (2):
>   dt-bindings: mmc: sdhci-msm: Add Bus BW vote supported strings
>   mmc: sdhci-msm: Add support for bus bandwidth voting
> 
>  .../devicetree/bindings/mmc/sdhci-msm.txt          |  32 ++
>  drivers/mmc/host/sdhci-msm.c                       | 366 ++++++++++++++++++++-
>  2 files changed, 395 insertions(+), 3 deletions(-)
> 
> -- 
> 1.9.1
> 
