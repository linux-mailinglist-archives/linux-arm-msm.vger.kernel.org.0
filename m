Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B6A021F7E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2020 19:10:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728298AbgGNRKj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jul 2020 13:10:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728170AbgGNRKi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jul 2020 13:10:38 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B70B2C08C5C1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2020 10:10:38 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id t6so4126793plo.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2020 10:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9Pi0r+taXC55e2CabsrtsPMzJOxhTQ5VmZxPESoJ2R0=;
        b=YcUpdW8ssFvg31o7FKf1VxZt+87ICTP6BSy10MKwemlGlPTgoZywHlO0FpXTOwd/RU
         w/bmCXL2iKjRaYWDvnTjtwzPvUKBib7XWkuxrC/k8O0L3uhEvg0mByeAVTHLIuI+oYJi
         UYI69blXL++kD2Z9kDNOsL0ynAVx1mU7fpvMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9Pi0r+taXC55e2CabsrtsPMzJOxhTQ5VmZxPESoJ2R0=;
        b=XrI8IlqRboacrmvonMDcDZXkhf/BidrXwl0c/hLX5yKS/JW94J5HYoz5eGNsdBu39j
         U8ihRGmtKciW2BPW7N+eC3Yu7M7952FhZDxd+ueKJw7QZfC9D0NKRgw9eAqMfR29cWpg
         RfAezA128QrQQfwAczYVdxTtbVu0ojx0fuU19VlDzBshLRdea0sAwKainnwqoAgeDkLY
         LDkv2mMPldm3qmnWGtryI6wrFIH2XdGAMnfMVaJohOvY/TxNPUyMdprKkgIC4cHtdKSI
         yzH8ale7KsYwGD9a/hx/x/hHsaTy1kNds+YGaX+jGGrG4Idn3W5NJjcnfmV1+HRdbP9E
         gIrw==
X-Gm-Message-State: AOAM533z/D1cwfMxp6F+vQSYXOVJyEGyi612CXQrOYmOa75rFWjdYZlT
        GmVaASAov1t/00MNj2UNfaGuuA==
X-Google-Smtp-Source: ABdhPJwDHng07+7Jqf3f0zfUAjKLkymgxwE7dDtjLH3NoOVCed41ZFg0oAaAvDN6Z5TOUJLbYrwhEg==
X-Received: by 2002:a17:90b:8d0:: with SMTP id ds16mr5960924pjb.2.1594746638227;
        Tue, 14 Jul 2020 10:10:38 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id a3sm16338620pgd.73.2020.07.14.10.10.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2020 10:10:37 -0700 (PDT)
Date:   Tue, 14 Jul 2020 10:10:36 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Akhil P Oommen <akhilpo@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, dri-devel@freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jcrouse@codeaurora.org, devicetree@vger.kernel.org,
        jonathan@marek.ca, robdclark@gmail.com, rnayak@codeaurora.org
Subject: Re: [PATCH] drm: msm: a6xx: fix gpu failure after system resume
Message-ID: <20200714171036.GS3191083@google.com>
References: <1594733130-398-1-git-send-email-akhilpo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1594733130-398-1-git-send-email-akhilpo@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 14, 2020 at 06:55:30PM +0530, Akhil P Oommen wrote:
> On targets where GMU is available, GMU takes over the ownership of GX GDSC
> during its initialization. So, take a refcount on the GX PD on behalf of
> GMU before we initialize it. This makes sure that nobody can collapse the
> GX GDSC once GMU owns the GX GDSC. This patch fixes some weird failures
> during GPU wake up during system resume.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>

I went through a few dozen suspend/resume cycles on SC7180 and didn't run
into the kernel panic that typically occurs after a few iterations without
this patch.

Reported-by: Matthias Kaehlcke <mka@chromium.org>
Tested-by: Matthias Kaehlcke <mka@chromium.org>

On which tree is this patch based on? I had to apply it manually because
'git am' is unhappy when I try to apply it:

  error: sha1 information is lacking or useless (drivers/gpu/drm/msm/adreno/a6xx_gmu.c).
  error: could not build fake ancestor

Both upstream and drm-msm are in my remotes and synced, so I suspect it's
some private tree. Please make sure to base patches on the corresponding
maintainer tree or upstream, whichs makes life easier for maintainers,
testers and reviewers.
