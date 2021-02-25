Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CB5C325A73
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Feb 2021 00:55:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbhBYXzL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 18:55:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbhBYXzJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 18:55:09 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF06EC06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 15:54:29 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id c19so4543671pjq.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 15:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UQRIGCJK5x7ySU3vx8Tp0a7FyRJZhibSQ4iPFDuTP+U=;
        b=nkSfKKn0KnJgtZOKoWyDau4D0wlh84SMf+eKx1ewJT9hFNJPqETdVZBlyFe3qwtsyZ
         Gx0BRgxrSr8VKhHbuBqLLmIN6/6L9870rLfCVpw/VwqW8I12ptSkMihBFtNbH/H4EDYJ
         YvDIvpfm1XO+NiEsYODy/Ncw1yOHGeiQaavLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UQRIGCJK5x7ySU3vx8Tp0a7FyRJZhibSQ4iPFDuTP+U=;
        b=ZThPcOz1teIDLFxKiyoDRs1KzACvLWbSm5xBaeNJM1CfjIvTrD/iNofjKAFCXnwtU5
         TG6y45TZ2+E3bzBe1zFJpxHGCEKJypU9/z60oocl7fReqhSsC59XelKspeja8gB8V0V0
         nHqQptlLWlMAfclSCsrhIQbe5hMra4FSU26kaRCLNLiSuAdE9JGJEdFg0cG57SUpDIp2
         gT2vqvV58VC4QtjuH5nZxR7Z0VihFM6+aQwJ/ll73OlRkx7SyadutTvDPiHUR3cvPFgW
         d6e37iYOo9s4/kFMfkFjc3XWJaPx9uVJuj5JlLryHUC2LjH5nRlRT4o9oSkH6/SmT1K8
         h1OQ==
X-Gm-Message-State: AOAM533NlyWBg/QnBTlJHfqZ6iF1CnkxirvOx9n2Et4MtVSMJuxyN2K/
        EH9hZKa8M1c0JEfTy2XGgJpApA==
X-Google-Smtp-Source: ABdhPJyIbNkDyhS1zfCtYup+R53d86/NmhS/YrsWhF9FEPjKa9goIXV/1rKlXw3yL+6b8KU216GM3A==
X-Received: by 2002:a17:90a:f987:: with SMTP id cq7mr405575pjb.47.1614297269263;
        Thu, 25 Feb 2021 15:54:29 -0800 (PST)
Received: from localhost ([2620:15c:202:1:1d8:8d0c:f75e:edd8])
        by smtp.gmail.com with UTF8SMTPSA id nl9sm6848124pjb.52.2021.02.25.15.54.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Feb 2021 15:54:28 -0800 (PST)
Date:   Thu, 25 Feb 2021 15:54:27 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/13] arm64: dts: qcom: Prep sc7180-trogdor trackpad IRQ
 for new boards
Message-ID: <YDg4s6QuIIVe1oGR@google.com>
References: <20210225221310.1939599-1-dianders@chromium.org>
 <20210225141022.3.Iddf6dc8102aa4fbc3847936226fc7bf2e2cd315c@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210225141022.3.Iddf6dc8102aa4fbc3847936226fc7bf2e2cd315c@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 25, 2021 at 02:13:00PM -0800, Douglas Anderson wrote:
> The trackpad interrupt got renamed and also moved to a new GPIO on
> newer boards.  Let's do the move in the "trogdor.dtsi" file and then
> undo it in the two old boards.
> 
> NOTE: since none of the new boards have device trees yet, this change
> looks silly on its own but it will make sense after more boards are
> supported.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
