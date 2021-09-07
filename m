Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15086402F36
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Sep 2021 21:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346230AbhIGT5b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Sep 2021 15:57:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346164AbhIGT53 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Sep 2021 15:57:29 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84B3DC061575
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Sep 2021 12:56:22 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id f65so13084pfb.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Sep 2021 12:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cxihqoLbqnx4VeK1GPNb8VICY6vWRDKx/3eO1G8HhuQ=;
        b=OfBuMoX3fXj5aac6Ia5dRKuG6R3hoaaovU7ZMMs6K6c7hphDl9h/o4sAdqZkeqa3cV
         e2BQSZC423CLHHDmgIr8j72F+MJ0fYWWyeu1Y2V2ZGJq4JgY51ulvLRxTdR23ODUaILk
         xpqIX9WyG+3NixLI7eUZlW8iJkFRr93RTK1mg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cxihqoLbqnx4VeK1GPNb8VICY6vWRDKx/3eO1G8HhuQ=;
        b=ePvTMw4QtzG43OFv/mJzotX7C+pfzdtH+As2f5lrQ3QWguM3OOKHIhqBx8GbD+CmKW
         oLSnNcRBNaflheYyqt2amtckcb8giqwnz8NAuj02puLlm9t1pwnWw14/TyBxdumSc+Kt
         zc3x4cMeU5sOaaMuFsfxEMwERmWYkVjdHTXtflPOStS1iAvcvcfGNtz/4cvljmDl/tVH
         f3ti7XostXRs7Q7cEjLfSQXABqA4ZYd6YD6qZEjz91lU9CjG1DM3SCYXAPlOc0oTPOaa
         HLD6MEke6+x8+T1ywE7GFVaHhpw2lNXn9bBM7L4aIplAwvZiQF0wo53xmdpToEDxfBQU
         7Ndg==
X-Gm-Message-State: AOAM533tL7zt/TVdtP2pawGDVu5C+BdspCSoZsDGO4bi87St9NO8RDdG
        qSt5KOyLPYqpTYURn30P38KmMw==
X-Google-Smtp-Source: ABdhPJzZy0hCiX2y29DAINhCmDB1pMZdEBCwaoJGXoZ0fdUULgu5tbH3003U953JqOk6W4/iDe+yCA==
X-Received: by 2002:a65:5686:: with SMTP id v6mr52750pgs.174.1631044582077;
        Tue, 07 Sep 2021 12:56:22 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c6b2:7ae:474d:36f6])
        by smtp.gmail.com with UTF8SMTPSA id o10sm13570393pgp.68.2021.09.07.12.56.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 12:56:21 -0700 (PDT)
Date:   Tue, 7 Sep 2021 12:56:20 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "arm64: dts: qcom: sc7280: Fixup the cpufreq node"
Message-ID: <YTfD5BXkv+AZHISE@google.com>
References: <20210907121220.1.I08460f490473b70de0d768db45f030a4d5c17828@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210907121220.1.I08460f490473b70de0d768db45f030a4d5c17828@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 07, 2021 at 12:12:25PM -0700, Douglas Anderson wrote:
> This reverts commit 11e03d692101e484df9322f892a8b6e111a82bfd.
> 
> As per discussion [1] the patch shouldn't have landed. Let's revert.
> 
> [1] https://lore.kernel.org/r/fde7bac239f796b039b9be58b391fb77@codeaurora.org/
> 
> Fixes: 11e03d692101 ("arm64: dts: qcom: sc7280: Fixup the cpufreq node")
> Reported-by: Matthias Kaehlcke <mka@chromium.org>
> Cc: Sibi Sankar <sibis@codeaurora.org>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
