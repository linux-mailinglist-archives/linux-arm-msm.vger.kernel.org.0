Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5CB41CDBA2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 15:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729662AbgEKNqC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 09:46:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729659AbgEKNqB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 09:46:01 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B5DCC05BD09
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 06:46:01 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id i15so11012187wrx.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 06:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Q2BxZKtzYVJdnhKDk6kHCLe3qRzlCf6s3v+h+pLemAg=;
        b=vt3tIM8SXmyGE76DoZTOdmElnTIl4bMIltVntIAc0he88Sp9qJRB/V82zw+WrS5ihG
         EJG7w8kdcUMgSuW4nZHMeP55c/FdVaRUqO93oTbSH/bkPfFrlHPMjgPH5/AEfRuoUu/U
         Ak1f5Qmm6SUMcApwnUw266CxwLZzc4MxBgHsCu1MEztG1efH6KjzjCsHLbufXO/JHkyg
         4qqYKPjp/oW9mizuM4Pn3HGbqhzheYTNDFkaLvftrCVNM/VYgWqz1bSWSuZetRx/q5K6
         et6c5WXisyQm9pdE/trnsAi0Rc4P282oAY4w74LRTcifJkmjSnGbQrMkFE8BBK/CLrHU
         kIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Q2BxZKtzYVJdnhKDk6kHCLe3qRzlCf6s3v+h+pLemAg=;
        b=MzWPSudt6R+DEBhjrotNFvCd3D74DBoWvpkm3Z/9QhLEQIDDZhyaJ48M3LZY4ZYJWX
         WbUmzSmJVETz+0eqB2sDFGQYkkoyXaFF8NIt+mMq5oSZiBgLwDyfVJNSEWQ20iwviCVh
         7xwINlAQ9qZ9GOeehtctqU3MnAtRG9VDwD7G9i/1H4jec0GRguFcXcFaw+ziIsjVGZ2V
         8hnO9EosThb/HsW9U7HlDFESA07RAmrm5x6eFHq1kek0AWv3lg3P6Q8jj2ph4BL+HPgW
         cFVTWPGqAjVk7u1PL5+vrP5jgUFb3mNjl4V7z+4y67x2ojlLLNzNsIHef+jYdhVweHBN
         zGkA==
X-Gm-Message-State: AGi0PuY+kVz3HEx0ostcsoKRbhD6lG5U46rT2n6BxGqinD4h7iEVhPfM
        nuF4J8O/beEEXN7V7P/qrT6coA==
X-Google-Smtp-Source: APiQypIZNeq7ry3Hj06e+ssDcQCx46NyjFOu4uu1tNoXA1NhJj0eKvkluOlZpeHyLFtt4scGQaFK5w==
X-Received: by 2002:adf:810a:: with SMTP id 10mr19863253wrm.101.1589204759978;
        Mon, 11 May 2020 06:45:59 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
        by smtp.gmail.com with ESMTPSA id q184sm27152043wma.25.2020.05.11.06.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 06:45:58 -0700 (PDT)
Date:   Mon, 11 May 2020 14:45:55 +0100
From:   Quentin Perret <qperret@google.com>
To:     Lukasz Luba <lukasz.luba@arm.com>
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-imx@nxp.com, Dietmar.Eggemann@arm.com, cw00.choi@samsung.com,
        b.zolnierkie@samsung.com, rjw@rjwysocki.net, sudeep.holla@arm.com,
        viresh.kumar@linaro.org, nm@ti.com, sboyd@kernel.org,
        rui.zhang@intel.com, amit.kucheria@verdurent.com,
        daniel.lezcano@linaro.org, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        kernel@pengutronix.de, khilman@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org,
        matthias.bgg@gmail.com, steven.price@arm.com,
        tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com,
        airlied@linux.ie, daniel@ffwll.ch, liviu.dudau@arm.com,
        lorenzo.pieralisi@arm.com, patrick.bellasi@matbug.net,
        orjan.eide@arm.com, rdunlap@infradead.org, mka@chromium.org
Subject: Re: [PATCH v7 06/15] PM / EM: change name of em_pd_energy to
 em_cpu_energy
Message-ID: <20200511134555.GC29112@google.com>
References: <20200511111912.3001-1-lukasz.luba@arm.com>
 <20200511111912.3001-7-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200511111912.3001-7-lukasz.luba@arm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Monday 11 May 2020 at 12:19:03 (+0100), Lukasz Luba wrote:
> Energy Model framework supports now other devices than CPUs. Refactor some
> of the functions in order to prevent wrong usage. The old function
> em_pd_energy has to generic name. It must not be used without proper
> cpumask pointer, which is possible only for CPU devices. Thus, rename it
> and add proper description to warn of potential wrong usage for other
> devices.
> 
> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>

Acked-by: Quentin Perret <qperret@google.com>
