Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0911C3E8E42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 12:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236937AbhHKKPT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 06:15:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236999AbhHKKPP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 06:15:15 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85A12C06179B
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 03:14:52 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id j1so2571606pjv.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 03:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Rg+nfqNpN4KVS6P5Kg2kgnadiI4aRZsAUMlE7w6kB2k=;
        b=ac4casP3kUB13OsUJQcv38FKO7pVIq50bZ6uPGU1NEdpQ0ASqnp8urXzheGfF4JgZJ
         F0GBVqBxpnRY7eoErIyp2IabG5QIpaejNKNbwc0aQqxzw6oZgMJeXCdM+On3gP7GcwAm
         Ze6ZM7NUk6+K3utV/jdB+12kqYzQTqBoRF8pt/wvWMKT0t0AejJqeovqCSNaOQMJbO1L
         dD5NFrhUjhU22SWOPidIBz2QfpP5F/XNnFPgeAwhtmB5nt6HWk+7H9MN4LVZKKuaHvyE
         KiuTQa4lU4FT+xPngVH2NJUbPObjZ/HoPrBwxQiQRHH+/uoJ61KSOscQQ3Qen6LcUrLD
         YtkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Rg+nfqNpN4KVS6P5Kg2kgnadiI4aRZsAUMlE7w6kB2k=;
        b=KwQn1EVrG2fnc78fAM9Z6zabKfcRPOr3093aruKnbGHoA/xUTwOHe99RzilG8dSUBN
         RyORiP38UWT/X6mKpHaoPRnN2Qnw6FT0Es+ci51LS3tO6jwqFUYKj4SHU7XajRpEkQP3
         uUMDNMld5N9xNZqLH9DKWtAF+99V6vhRfS9E3XGPu3Z39D3npFixvpKfXKJZQb42Zy1g
         K64V/MdCLP9htmFItXU+5sdIXIZ6Y0GVxlCTWAJNtsDf4mRdFHY9bJrbCuDYN7giJ0ax
         T83abvZ9lKzHpwnh3habqyu1VreqBiM/FoIGm/6Qu00tSPuvcN9psZdjUtmK5gbtiQJz
         Iq9g==
X-Gm-Message-State: AOAM533OKVdc+NwUhsF+37C+t8/wHmeMHzpSa0hOT6hpKwAj/ZmrzOvA
        +l+p2pCJwHZtnJ09FTjV6GjEdg==
X-Google-Smtp-Source: ABdhPJzXjMW9vKhvdq5O6Gt8ct98tc27N2TMRTz0kLhqKVJ5iHf/FGC7+T3yYcwqi1noPFO5FkhCyA==
X-Received: by 2002:aa7:9f5b:0:b029:3be:2a1f:ca58 with SMTP id h27-20020aa79f5b0000b02903be2a1fca58mr27592438pfr.46.1628676892055;
        Wed, 11 Aug 2021 03:14:52 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id j25sm27085750pfe.198.2021.08.11.03.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 03:14:51 -0700 (PDT)
Date:   Wed, 11 Aug 2021 15:44:49 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Quentin Perret <qperret@google.com>
Cc:     Rafael Wysocki <rjw@rjwysocki.net>,
        Vincent Donnefort <vincent.donnefort@arm.com>,
        lukasz.luba@arm.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Fabio Estevam <festevam@gmail.com>,
        Kevin Hilman <khilman@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>, linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 0/8] cpufreq: Auto-register with energy model
Message-ID: <20210811101449.c2533ediwboeplqj@vireshk-i7>
References: <cover.1628579170.git.viresh.kumar@linaro.org>
 <YRJym+Vn4bbwQzzs@google.com>
 <20210811051859.ihjzhvrnuct2knvy@vireshk-i7>
 <20210811053406.jqwextgtnxhgsjd2@vireshk-i7>
 <YROc95YKA1Y/TfYI@google.com>
 <20210811095311.e6wnma2ubkqdtuic@vireshk-i7>
 <YROin5WudmmEPard@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YROin5WudmmEPard@google.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11-08-21, 11:12, Quentin Perret wrote:
> I think using the ready() callback can work just fine as long as we
> document clearly it is important to register the EM from there and not
> anywhere else. The dedicated em_register() callback makes that a bit
> clearer and should avoid a bit of boilerplate in the driver, but it's
> not a big deal really, so I'm happy either way ;)

Yeah, I think just the same. It is better to have register_em as a
separate call. I was just wondering if it is the right choice :)

Anyway, I think ready() will get removed pretty soon, so register_em()
will work well. I will redo this series and send it.

-- 
viresh
