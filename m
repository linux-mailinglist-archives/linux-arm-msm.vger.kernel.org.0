Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A52AD48B7D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jan 2022 21:05:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242237AbiAKUF5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jan 2022 15:05:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242190AbiAKUF5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jan 2022 15:05:57 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA64AC061748
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jan 2022 12:05:56 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id y16-20020a17090a6c9000b001b13ffaa625so7374221pjj.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jan 2022 12:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9hZaYVxetTOKFm3W8BmKSbpebS86cpVcjY/qinSjNKU=;
        b=LSH9sboz/KXLu5AMLIEQKgu1QnoomBvnkVpsJVhg4editFU9j3pX5/ebzeZhq5yWjz
         cej+rTdyt+yuUIahecbur36HMHOvyuQw+bcJQ/vaedro6WxuPltc7UYOhrirsFaVlz2j
         RNq1rJyL0MDOCH8ovpK6WJJOzOctavHiP9VRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9hZaYVxetTOKFm3W8BmKSbpebS86cpVcjY/qinSjNKU=;
        b=L5yQoAGUTtRcx/F/WqPfhQtBx7A1dltZAdcPy9LNRJb0Dgss+fL/gaWEmsHhP6lP3m
         emPHRzCHCCsavS23a30to+ffrervRrwuN7Z6Gl3kQdkfaEWTAMppT1Y3YJGqLi/haLBI
         WOE5iwF9yDHEIBTwIeAlp29pTnM/c99XnXmujxTP3lw5SJ8rLtu5M52eq8yPX6rAaV3X
         ppa2gf0IQjcUmRRdB2BsFwcYkGF9mEOundQJ/hr5452yZ6iIu3PcoAS8zYP+cdphr5+R
         OdFefT9oLoksQa8WtmbFaNbVM1IE8yt1DjyiY8QdqKXbW4HbZ5JtC1JVetUTZw2hupsF
         JA6A==
X-Gm-Message-State: AOAM5316Y8fiD6qnOoGOpjbIQxhj91P6gDZVfYNebYQ2A9uMKHADQyGn
        W2hYiy3W2wnoO/myZbX9a4upZg==
X-Google-Smtp-Source: ABdhPJxF3n9N29fXHARPSJTydOCw8/mBFf5dYlqq1iuCZj8RC1wxAANW8KVmU40KCKhEELx8tJp9/g==
X-Received: by 2002:a63:a011:: with SMTP id r17mr2407440pge.300.1641931556311;
        Tue, 11 Jan 2022 12:05:56 -0800 (PST)
Received: from localhost ([2620:15c:202:201:f0a7:d33a:2234:5687])
        by smtp.gmail.com with UTF8SMTPSA id i13sm177211pgl.81.2022.01.11.12.05.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jan 2022 12:05:55 -0800 (PST)
Date:   Tue, 11 Jan 2022 12:05:52 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Alex Elder <elder@linaro.org>
Cc:     davem@davemloft.net, kuba@kernel.org, jponduru@codeaurora.org,
        avuyyuru@codeaurora.org, bjorn.andersson@linaro.org,
        agross@kernel.org, cpratapa@codeaurora.org,
        subashab@codeaurora.org, evgreen@chromium.org, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 1/2] net: ipa: fix atomic update in
 ipa_endpoint_replenish()
Message-ID: <Yd3jICMLqZn94YsR@google.com>
References: <20220111192150.379274-1-elder@linaro.org>
 <20220111192150.379274-2-elder@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220111192150.379274-2-elder@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 11, 2022 at 01:21:49PM -0600, Alex Elder wrote:
> In ipa_endpoint_replenish(), if an error occurs when attempting to
> replenish a receive buffer, we just quit and try again later.  In
> that case we increment the backlog count to reflect that the attempt
> was unsuccessful.  Then, if the add_one flag was true we increment
> the backlog again.
> 
> This second increment is not included in the backlog local variable
> though, and its value determines whether delayed work should be
> scheduled.  This is a bug.
> 
> Fix this by determining whether 1 or 2 should be added to the
> backlog before adding it in a atomic_add_return() call.
> 
> Fixes: 84f9bd12d46db ("soc: qcom: ipa: IPA endpoints")
> Signed-off-by: Alex Elder <elder@linaro.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
