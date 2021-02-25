Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5138325A6B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Feb 2021 00:50:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232590AbhBYXtJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 18:49:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233276AbhBYXtE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 18:49:04 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04604C061788
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 15:48:23 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id e9so1870737pjs.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 15:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=D7zdVPbs/4DDlGF15EelhV322wHjAfTkFTi3SrxHNj8=;
        b=E5J6yBdMCdGX2/+GcOXl+O4n+hCE0gypYW2fJL0u5GYInU2yIQ/MMnHgVmoJ02tjhH
         fxooJxQ5w7J24UZjmMiFSsnBAFJdjI/WU/oWSDtOvyGzTi+cSj8GgzspaaMk4OOWpZhq
         buf8YKTPp+iVVKi8de7U83r5O8RnluLfFAd0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=D7zdVPbs/4DDlGF15EelhV322wHjAfTkFTi3SrxHNj8=;
        b=XYAnxqRfgX5gYDEuQoigJH6h0Frqhnfr56zWcHvKN581pDhnw9LT9RLyGLG38O7ENb
         B6+PdBBfJKrhzQUi+rsfat1xYpYXV9YodDMdo77wqNCCGr6I1kYe6ozAHwApLyUHopiz
         ntHXS+GDYnvMZpJpmLa0vV5ITPojbY/bCtH4oLGWF+GJEg9Y22s9455wO41YoqXnevNc
         XlznWgOESxrnLwD66oCBR0T8SCpAJVpnSB8Za00M/NnzJBRYeAWhmXuXhiL12duUGb1L
         pf0DRZqKw/wbJXBheT0uPO99vCUc02tMHO2ygM1jvMDF0RZuZw7/jVWoCfSpC7yomKmi
         W6ng==
X-Gm-Message-State: AOAM53136wM3zKYhrlsqfKPBorvFJZNNCVy0QLY0JBiE9eRkuL8zSl2n
        RLfW2mpN7MeoNr2KyplcTxLt6g==
X-Google-Smtp-Source: ABdhPJxFaMrBY4O6cTdBOdyoabxAgPdgxuThHFSs8g5CK5LRXHo71niFFE11cHoJZowYrm3E8Th3BA==
X-Received: by 2002:a17:90b:4013:: with SMTP id ie19mr373712pjb.45.1614296903527;
        Thu, 25 Feb 2021 15:48:23 -0800 (PST)
Received: from localhost ([2620:15c:202:1:1d8:8d0c:f75e:edd8])
        by smtp.gmail.com with UTF8SMTPSA id mp20sm7456617pjb.34.2021.02.25.15.48.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Feb 2021 15:48:23 -0800 (PST)
Date:   Thu, 25 Feb 2021 15:48:21 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/13] arm64: dts: qcom: Move sc7180 MI2S config to board
 files and make pulldown
Message-ID: <YDg3RUW12u5GTCNC@google.com>
References: <20210225221310.1939599-1-dianders@chromium.org>
 <20210225141022.2.Id27e7e6f90c29bf623fa4880e18a14ba1dffd2d2@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210225141022.2.Id27e7e6f90c29bf623fa4880e18a14ba1dffd2d2@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 25, 2021 at 02:12:59PM -0800, Douglas Anderson wrote:
> In general pinconf belongs in board files, not SoC files.  Move it to
> the only current user (trogdor).  Also adjust the drive strengths and
> pulls.
> 
> Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> Cc: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Cc: Tzung-Bi Shih <tzungbi@chromium.org>
> Cc: Judy Hsiao <judyhsiao@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> This should replace the patch ("Asoc: qcom: dts: Change MI2S GPIO
> configuration to pulldown") [1].
> 
> [1] https://lore.kernel.org/r/1605526408-15671-1-git-send-email-srivasam@codeaurora.org
> 
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 24 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7180.dtsi         | 18 ---------------
>  2 files changed, 24 insertions(+), 18 deletions(-)

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
