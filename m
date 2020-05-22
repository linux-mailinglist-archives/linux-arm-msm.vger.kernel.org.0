Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EBD11DEDA2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2020 18:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730536AbgEVQte (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 May 2020 12:49:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730306AbgEVQtd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 May 2020 12:49:33 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21A96C05BD43
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2020 09:49:33 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id k13so10838832wrx.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2020 09:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CHmt5En+DFO/DuBHKWsIxBf0v+xGme/FyBgyiiEFXXs=;
        b=Ir6xPMv9mrnspy3tVQXUJZtsY3vGrInCmlHrvQktRVS8HdjNwmhztgnzWKN3kEEQNK
         45gbMbWW89VWRfHJS71ORURcXjtguVKtmsZg3vjQZaulCx++nEKPBPO3UJ7tHi/x32n3
         xePjXyNVu80hEp1ibwJ8/J/+t7/NEP1h6lMd5MDasnAeJx5Bz3KXdK8gZZCnW8iUMav/
         ENqNO4J2RYDWboR535xH9HSh2nHAk10pRpPlVo6JK1mJ6IJ9KStSIwl6hJ+qi+Ao7f16
         3DfSqE7ZI8qoR1aYsed6kqOOredsgU6sjf8yaIa3VAYC5Tsv31TnzinHTVYDa5bBhSG4
         WMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CHmt5En+DFO/DuBHKWsIxBf0v+xGme/FyBgyiiEFXXs=;
        b=obprafRW8iEMrRm70VYB9GOmJXIyd2HuhvCZ0DOeqr3TRde4I1WNVKQA8SbS9DXsYO
         iDEdocteOaf4LRwbpXoW2EdIlY2IagdwacmL8LwJj96HDiITvkrvHDmx79DQ500fGz4v
         iBt+xye++vbObFc9SHc1Woi07rmYfGjvXw5PMF5KN8Tw5Apv3WI4xWLBWs1I10JgNLZ/
         3eKYT9RnJzNEIXdU97hpZAd0pkXwnwCkvqCWvyVDO/a3JTYG/iTM2PdIQUCRWrd/rBXs
         Khk1lZqHOVfDIOUc2GhiSbf25hn4CGX1bGrpHz9m2eA/tpiHO4gkWJiEbFjOGf6JLasZ
         iiRw==
X-Gm-Message-State: AOAM533EWohoLnr90jqiPUVdrj0V5vWh5XSw+4Pmj/cqo5JLETZmwZdn
        K/hMZG443Yv+lYNrqcRXWm7gsg==
X-Google-Smtp-Source: ABdhPJyq1cxtEc5HKwBxuhAsQAlPiFMzVMQB8y7RX31DLlCEjUdWW54j7m4nsSoZhC+Ye3nryhPyXQ==
X-Received: by 2002:adf:9f48:: with SMTP id f8mr4094993wrg.228.1590166171626;
        Fri, 22 May 2020 09:49:31 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:a82f:eaec:3c49:875a? ([2a01:e34:ed2f:f020:a82f:eaec:3c49:875a])
        by smtp.googlemail.com with ESMTPSA id p1sm1549793wrx.44.2020.05.22.09.49.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2020 09:49:31 -0700 (PDT)
Subject: Re: [PATCH 00/14] thermal core include cleanups
To:     Amit Kucheria <amit.kucheria@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Javi Merino <javi.merino@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-pm@vger.kernel.org
References: <cover.1589199124.git.amit.kucheria@linaro.org>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <2c065bae-06a5-e63c-4e01-be62dabe8890@linaro.org>
Date:   Fri, 22 May 2020 18:49:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <cover.1589199124.git.amit.kucheria@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/05/2020 14:24, Amit Kucheria wrote:
> I noticed some remnants from when thermal core could be modular. While
> cleaning that up, I fixed up the includes to be sorted alphabetically and
> included export.h in files that were using EXPORT_SYMBOL* or THIS_MODULE
> while at the same time removing inclusion of module.h from core files.
> 
> Finally, the names of the source files for the governors and core have some
> inconsistencies and the last couple of patches rename them.
> 
> Build and boot tested on some ARM boards.

Series applied, thanks !

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
