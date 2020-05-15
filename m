Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35CA61D4218
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2020 02:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728458AbgEOAcH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 20:32:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728219AbgEOAcG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 20:32:06 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 069BBC05BD43
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 17:32:05 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id f6so173005pgm.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 17:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ksohmisiygmMHSWmZNuyiGcxOl23DTxWznhnrAA0Tbc=;
        b=cPk6Aai/Cgvqt0Hw0nAvV2PJi+S+U0lQ3s+kR1zT8quJNLuBg2FCokbhC2GzfDSzJJ
         F5bmAzSUpSBwRoZ1Ym+YE2Zs64UYZ9YUoW+PRgtrsZynF/QJDpka4gEPcaI0pKdfmbQA
         B4Z8rYbMian4pw77PaNRSd1O+Vcxwo0afwBs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ksohmisiygmMHSWmZNuyiGcxOl23DTxWznhnrAA0Tbc=;
        b=MDqDUBxDLXzIyrEAo/FevF6qpYIVOnpdinnNn9938HPTe17hlSWw7VvYN/QV9tmYk3
         U7kC1piopmnAlohIB8rnFfOOXO3dFUW5CPq3GEvt85C9XLRl02uM1Xo4MowI1/2rKX1p
         /73tvRbI6EDX4nx6yhTR2UPmRI25EWpZ+Xw6CDQ4n6lzT5KiGqHx+ZF7ZeeVI9FDkia1
         2uW9GQutCSQb/QuM0qzTskdAn2axfmV97YlmqTlitV5J+0ZZuXZX6Pk2gWsx7PJ2LOKU
         5+C/FdmXolSgI8sf1iEMAzVweDloR22iOERBXLTvfBAx6XWs1L01foDBNrO4WXG5K1LL
         Sytg==
X-Gm-Message-State: AOAM533Za6OX57sviNZZEJW/XkMhKtwGpWSMA20yU5kl/aKLPq2sDs6a
        R0JSGDq9xqATnWQrmi7JjqTIDw==
X-Google-Smtp-Source: ABdhPJxP4fdAV/QiAEsyatfE+OPdd5pusF9BcQ3lUqxkmtep+uuG0U2tNiNsF7/PknZVYJq9lJXrlA==
X-Received: by 2002:a62:8888:: with SMTP id l130mr1187943pfd.140.1589502725382;
        Thu, 14 May 2020 17:32:05 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id z1sm163461pjn.43.2020.05.14.17.32.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2020 17:32:04 -0700 (PDT)
Date:   Thu, 14 May 2020 17:32:02 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
        georgi.djakov@linaro.org, Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH 3/6] OPP: Add and export helper to set bandwidth
Message-ID: <20200515003202.GU4525@google.com>
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
 <1589453659-27581-4-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1589453659-27581-4-git-send-email-smasetty@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 14, 2020 at 04:24:16PM +0530, Sharat Masetty wrote:
> From: Sibi Sankar <sibis@codeaurora.org>
> 
> Add and export 'dev_pm_opp_set_bw' to set the bandwidth
> levels associated with an OPP for a given frequency.

Wait, this looks very much like Sibi's patch from v4 of the "DDR/L3
Scaling support on SDM845 and SC7180 SoCs" series
(https://patchwork.kernel.org/patch/11527571/). Please don't repost
patches from other series (unless the series/patch was clearly
abandonded, which isn't the case here). Instead mention the patch
as a dependency.
