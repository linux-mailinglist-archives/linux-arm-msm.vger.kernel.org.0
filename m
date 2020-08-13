Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E552243359
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Aug 2020 06:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbgHME3p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Aug 2020 00:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbgHME3o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Aug 2020 00:29:44 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16DC1C061383
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2020 21:29:43 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id 74so2147398pfx.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2020 21:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xIdIpbnx60CzDLvbTVQD5OyHFhB3i0JZtsYS6xXe3jc=;
        b=MejU3VUHQfeX/8vP4xljEDExyeMgyTbHPaDCkHdMQ3sPCnWKfITG1MPAnqQR12gc+r
         VPzYyjc24N79BG8NU2kpGB7/BBYiTcvI+ZmxfkIUC7I9iZW2g1Jsjeraj83mbk7P8LFu
         Tz3n9Z5OSUaheVep1IHXkIGK0KxGMwo0XThXEjv2jMJ/RUS6pZ999qKL7XswloRgrhAB
         9Nb5ZBJHT2wfgzR/ayhogd3alNISpLYKx2a8dYsxQM8uqOgHauYx3z+uA13O05Mj7U2m
         GkjAWeHjcX+VE6QK+T/23OFOzL4mXHU/zzEnKcBjTpoEZEALz0dcf7hco+DrRMnw1WyB
         Papg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xIdIpbnx60CzDLvbTVQD5OyHFhB3i0JZtsYS6xXe3jc=;
        b=Z8iZBfRxDgRX1Mj7H9Ci7jMlaEKMFpLmrdUBKPRmXp6kjjQrsBlAjOxAMNdk+gLVDm
         MiOb6aJn5eB8weELIhWhPGhIa095ylnN3h4V/Z2MOx+Tkuq/1NSiRA0YgAny1nSHqTzj
         l0JU9EBbNm2DH95gDBQn7jgsr9LAzDemE/4cgsrCi6gGA+j8+J2+cAJ9Pjv0g1Nl3Bhe
         lM6F3K9zjiQIVlA4OfandzY/F9NqjFMHXsAZpatStE1MwYJJug25pMxeb3G1Qpa1OBFh
         3gNS2ryo8gdMUyXZdZQAgOu2udc2WCd+29KzzQEv/EntfBiaTf9fxVJXzUexD/a9HY7M
         9lTg==
X-Gm-Message-State: AOAM531DqC7z1GaCg0pWtBwMoLNs+mFEyrO6YHFRMi1Ek110nHlqoege
        DaWwpLz4SGPN42WAkEKEy6Djpw==
X-Google-Smtp-Source: ABdhPJx6frQktQqrAUHEZ1iFW6nmiLYBgM7XrzuzOuqkpNDkGl/pJc+JVQoakHmORATi5XJ8nxy2AA==
X-Received: by 2002:a05:6a00:1509:: with SMTP id q9mr2625321pfu.24.1597292983508;
        Wed, 12 Aug 2020 21:29:43 -0700 (PDT)
Received: from localhost ([171.79.32.211])
        by smtp.gmail.com with ESMTPSA id u14sm4080239pfm.103.2020.08.12.21.29.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Aug 2020 21:29:42 -0700 (PDT)
Date:   Thu, 13 Aug 2020 09:59:40 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>, nm@ti.com,
        vireshk@kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] opp: Fix dev_pm_opp_set_rate() to not return early
Message-ID: <20200813042940.dg75g7oj3iiyuu4k@vireshk-mac-ubuntu>
References: <1597043179-17903-1-git-send-email-rnayak@codeaurora.org>
 <159718019170.1360974.4800051292737590657@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <159718019170.1360974.4800051292737590657@swboyd.mtv.corp.google.com>
User-Agent: NeoMutt/20170609 (1.8.3)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11-08-20, 14:09, Stephen Boyd wrote:
> This is a goto maze! Any chance we can clean this up?

I have sent a short series in reply to this series, please have a
look. It should look better now.

-- 
viresh
