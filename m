Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86357325AA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Feb 2021 01:20:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229966AbhBZATo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 19:19:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231274AbhBZATn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 19:19:43 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A669C06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 16:19:02 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id g4so5047256pgj.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 16:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EpLLhisLnKlrh/KO9qG6Kmzca1e22HdLGOqsO0hQAnQ=;
        b=fBWETq+7jgrQIAa83TLSvqi0KPX3lG6JPAJHk0fwJ4eH3Gu+mZPFs6265I5bcFUgxF
         8p5gAelIvilquUp5H302B78kywoBrfgvFq6tU6ZpFOuupGbmxAqYwryUHL/WNiqW9OPv
         dT5D5fTh+zlOdJloeJcKzeSGON15a4m3M9YcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EpLLhisLnKlrh/KO9qG6Kmzca1e22HdLGOqsO0hQAnQ=;
        b=LlE+uGN8dUpQrsC8vSq5eqI/fGxH7Oel55KGneWwMzm5fGx+cf2LLtw+EKkEa6kC5K
         O5u48gg7W5zMayL/GG9TiTG9Gg9p00vovRYYf7Rbe8PXFmpVl9HmrntzK01k/oA8LTVa
         Jyc7KyX3RaAGh3rvLk27rC3XW8giqpuEO0CaW4IGQv0opgvgIv7kdK/M5kRRAMcMlk8I
         auuQlOozJ21Mc0Z+YUq7pnTg5OBtpWw+XEOn36I22ulG7WCq5tB+ZCuMuld5s5bxHM1u
         X46D8+RygTWnx511GOZyFoHWwaEQ4NWS3qZkfACEh3Z82HvHaJKGUx0rwMAZ79NZJlUH
         wMvA==
X-Gm-Message-State: AOAM533dLY26hKL6FatC8TaWeNhC/wh5i+kbZARPv3DiDlQhQWejoF4i
        y8fIKmkednAhtzCNCg90CZ0Dqg==
X-Google-Smtp-Source: ABdhPJzd0qB647RFl4SgkXhkXemEci3xzGR+wupLWWkZdHLdouVqp6NgBRHSdXVEgyYNrl7nOKiaXA==
X-Received: by 2002:a63:4c4e:: with SMTP id m14mr444952pgl.35.1614298742500;
        Thu, 25 Feb 2021 16:19:02 -0800 (PST)
Received: from localhost ([2620:15c:202:1:1d8:8d0c:f75e:edd8])
        by smtp.gmail.com with UTF8SMTPSA id d16sm6700471pgb.12.2021.02.25.16.19.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Feb 2021 16:19:02 -0800 (PST)
Date:   Thu, 25 Feb 2021 16:19:00 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/13] arm64: dts: qcom: sc7180: Remove clock for
 bluetooth on Trogdor
Message-ID: <YDg+dCuGd+v2z+3S@google.com>
References: <20210225221310.1939599-1-dianders@chromium.org>
 <20210225141022.8.I80c268f163e6d49a70af1238be442b5de400c579@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210225141022.8.I80c268f163e6d49a70af1238be442b5de400c579@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 25, 2021 at 02:13:05PM -0800, Douglas Anderson wrote:
> From: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> 
> Removed voting for RPMH_RF_CLK2 which is not required as it is
> getting managed by BT SoC through SW_CTRL line.
> 
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
