Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4058325A8E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Feb 2021 01:08:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232375AbhBZAH3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 19:07:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232144AbhBZAH1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 19:07:27 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72AFAC061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 16:06:47 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id s16so4148955plr.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 16:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jd/OnRJh1i86MX4kb4wWJ6SXAk8C/QNnURtbIB9fl/o=;
        b=SKierCz1m1yUyfQLozNCj+0yuGMrBg2RYe0xUI1TSSZ02aX4Uonu6kGqa2UOSDtcnu
         Y73YmTZj8SywkOtzzxX0xTZd+GqRtU6TIxbJfA4W/67RJrbTRITUZ3buOe+Ijf6NRd6j
         LH9UDpBsc+w4kEGr6fJw0Jf2rutUPS2sxMr/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jd/OnRJh1i86MX4kb4wWJ6SXAk8C/QNnURtbIB9fl/o=;
        b=G5al1FdT8NLPcoDEfW9PjHLggmSdHbKebAMfKjTwkSvfoRuigANRiTFYhPfV4LC2Su
         ybS7ehhyOA4mae6aStYHQftTSCjeDWgs0kM8GnrD2fPdCfhGVgG5hkzaT0fzYkeedjDc
         lgD6KhtkeBr7XqdsSOFvK/WFgathyW5tp2UYyX5DOGzo8kSAbN3tIIAWuveZ9Lto2qhF
         tfN1jWv2hN6DkU2bk0z2Fpl8OLvoUm8YpV0gSnooYL8PyNP4VxUrnCDpASXx+HScSpbZ
         lOzWa61AycQZ+it+tY+JkcyewRkeWHSxJTXLRbz19mUHx1TPtxbQHu5Ej1CpRalSj9zW
         XHjQ==
X-Gm-Message-State: AOAM533VUDsN6Xg7/2NqbI5X8mPPzEbWAeeUXAsnKADfavsGnot+GehP
        4Rz3iNXo8muSy57swI4r9Cs1nA==
X-Google-Smtp-Source: ABdhPJzwJmzMkYeM5EQiDfWM3PIMrCHqATtQO4VSS2Ue6nElK2JwLZLQnkRW34VAaoIsB+6G+r0DRQ==
X-Received: by 2002:a17:902:e750:b029:e3:a720:f4c with SMTP id p16-20020a170902e750b02900e3a7200f4cmr321029plf.31.1614298007063;
        Thu, 25 Feb 2021 16:06:47 -0800 (PST)
Received: from localhost ([2620:15c:202:1:1d8:8d0c:f75e:edd8])
        by smtp.gmail.com with UTF8SMTPSA id k8sm3206163pjj.31.2021.02.25.16.06.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Feb 2021 16:06:46 -0800 (PST)
Date:   Thu, 25 Feb 2021 16:06:45 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/13] arm64: dts: qcom: Disable camera clk on
 sc7180-trogdor devices by default
Message-ID: <YDg7lbbrdwqsssfc@google.com>
References: <20210225221310.1939599-1-dianders@chromium.org>
 <20210225141022.6.I22522b0c9db505ee43ed08e8d5d9e8fe632e7447@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210225141022.6.I22522b0c9db505ee43ed08e8d5d9e8fe632e7447@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 25, 2021 at 02:13:03PM -0800, Douglas Anderson wrote:
> From: Stephen Boyd <swboyd@chromium.org>
> 
> We only want to use this clk driver on CoachZ devices. Disable it for
> all other Trogdor boards.  NOTE: CoachZ devices aren't yet supported
> upstream so until it is this is just disabled for all trogdor.
> 
> Cc: Tomasz Figa <tfiga@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> [dianders:adjusted since no coachz upstream yet]
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
