Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16720325ADE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Feb 2021 01:28:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233178AbhBZA0C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 19:26:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233161AbhBZAZn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 19:25:43 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B147EC061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 16:25:03 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id k22so4209169pll.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 16:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eOoaUNEIrZkYP4MaJJhMh9LsswTy7WfpZEcTge5k7XQ=;
        b=i3eIjv/vQSWGcTmp+1d5sHPrAmusUghr7lwOeU/EGT4b6HMMbou27nUzp2gruEQrFU
         xUQHIWpt8olmqzC6pzz71V9StFBfwMS8ZunuhPRpZslEx+vTLHAUIhUeRnqYjDjN+eri
         1rvoMDpkRFAznHx6snAv/INa4FQ9OJ958Ilpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eOoaUNEIrZkYP4MaJJhMh9LsswTy7WfpZEcTge5k7XQ=;
        b=KtfU65u6GISgByWq69BMwt8SF8TmGQ1VANWKxFMgkqQW7pPogJbO7ASG9H5+Ol8c46
         MbOtOTeO+D36mR/COs/oPK6T2G02F2pi7X5TTbPrGeKGniVFAqWsU5nELEXknIhJ9ysP
         5vwozsnzy3u6QKGcTuS1+1h0NZE2TBRbrcpPkAa7YFHzDniTUQHmPRaLh+enH1+2vUTU
         OY3h8XU0bdSum/mCwfcnImDG1tCHHseYhA4bM9TSHGAojxUFQhXNnmFnhTWOHJeSw20D
         iq4EJWFID8EBQQJVPtPnWqr8G24NcuIQmDa6XRcyF+yulAwOT4Zd8sn5bAXk/lFR/y+E
         AY6w==
X-Gm-Message-State: AOAM533dFJlVaG9J3/bS9D2zYOKzXvXW1UfWFdIUdOdtBuORDwiTPxjB
        jB/vPIdPa9jkzTTe5IbpnngYoA==
X-Google-Smtp-Source: ABdhPJw/5SWf+U71TYTnL8EL6Ko0ao/8ZFP3YZ/5INp+qJ611p3MY9kMcUXBGFNdugpws1g0Goh7gg==
X-Received: by 2002:a17:90a:67ca:: with SMTP id g10mr520218pjm.166.1614299103224;
        Thu, 25 Feb 2021 16:25:03 -0800 (PST)
Received: from localhost ([2620:15c:202:1:1d8:8d0c:f75e:edd8])
        by smtp.gmail.com with UTF8SMTPSA id ob6sm6547366pjb.30.2021.02.25.16.25.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Feb 2021 16:25:02 -0800 (PST)
Date:   Thu, 25 Feb 2021 16:25:00 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Abhishek Kumar <kuabhs@chromium.org>,
        Philip Chen <philipchen@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/13] arm64: dts: qcom: sc7180: add GO_LAZOR variant
 property for lazor
Message-ID: <YDg/3EaF5anZLgnn@google.com>
References: <20210225221310.1939599-1-dianders@chromium.org>
 <20210225141022.9.I4a38fe64dd79c54af80d7e4ef5940f8cf4f86e75@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210225141022.9.I4a38fe64dd79c54af80d7e4ef5940f8cf4f86e75@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 25, 2021 at 02:13:06PM -0800, Douglas Anderson wrote:
> From: Abhishek Kumar <kuabhs@chromium.org>
> 
> For trogdor, in the latest board-2.bin file, new BDF with variant
> name GO_LAZOR has been introduced, so we need this property set, for
> GO_LAZOR BDF to be picked.
> 
> Cc: Philip Chen <philipchen@chromium.org>
> Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>
> [dianders: adjusted subject line and sort order]
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

I don't claim to be familiar with this part, but the same is done
downstream and the corresponding downstream commit references a bug
that talks about a 'GO_LAZOR' BDF variant, so this must be awesome!

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
