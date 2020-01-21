Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69AE214399E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2020 10:38:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728826AbgAUJiC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jan 2020 04:38:02 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36079 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbgAUJiC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jan 2020 04:38:02 -0500
Received: by mail-wr1-f68.google.com with SMTP id z3so2373092wru.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2020 01:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+M730A48Aqh4pFSc6/yOGVnR2p3jp3qMHztEPqPnpzo=;
        b=I4Il4xqb/mQRJaa0qSSl+Y25gZ18e057wP1tdP0lh2yLeaVpX0hadSOR4cl/LQpB3Q
         tyaDpcGYEDRokttwYZKiVcZfJVF8EHoSYV8AeT5Pk8Cx7E9Px1VKdhTcXR1aAUSJd42D
         xFOr6MeGSxv5TF/P/YEky3SS2IZFj68f7cxUiU1OZ4UxuYB744pGOuVT1Fv5ZBgPKRCQ
         7lN+SeGd90TfRO9gjPQRhJKb/pkMVZLlA3k0gUeRo6+ZVDTta1IW1eGaQBVEL1GveVLC
         n0vz510kYT0OpN/IyanOQzCHQTHpjRTMgbVeaY/5N811ccD6PckCAVfLKOa3fN1tAM5n
         aJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+M730A48Aqh4pFSc6/yOGVnR2p3jp3qMHztEPqPnpzo=;
        b=ROgKz8bpoCwnR1H/rJE04BDVh/4y/IkOSeOUKU4N1wO09AZjJdu1L3lXHsaOZeLgJr
         SbhYCf9TZIH52hZyGDxjqjL5VWzJ/d8uCFNwBC/3+4JZ9RTsTByJvdBhhi0UkIEVQ6xb
         SVeBR3s+v1ipa4L2ySKI6gsMeTYaOZqyadge6bGXaRKWiWedfoIQIfyZGxx1dtLQaQDz
         gbQ/6wpG5v5JWvjSkZNkpdsUOEmk65AQQx6KA0h32nI78I6w4CTgSiRHrgthlp3Pq8jl
         hpEr1NonHoyiMpJXtfAkHYojE0rIEkNlcny/otg15Dj1nue/oe8EQEXG8Bhqz9ruBN1Q
         XHVA==
X-Gm-Message-State: APjAAAXbTQzTS5lOwdnJGKT2+j8Zr7Fsb+XACeVBuXhcCNRFHn61UrfR
        fdiZM3bPLGN2RccWZvh32wNSag==
X-Google-Smtp-Source: APXvYqzNPRBGH9fYa6XMUb9Kcbd+L9DaQWdS1c4YXNu4dlR3oazpTgiDZXxcGp6bVMzhgy2FLbeDYg==
X-Received: by 2002:adf:dfc2:: with SMTP id q2mr4336811wrn.251.1579599479951;
        Tue, 21 Jan 2020 01:37:59 -0800 (PST)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
        by smtp.gmail.com with ESMTPSA id u22sm54210033wru.30.2020.01.21.01.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 01:37:59 -0800 (PST)
Date:   Tue, 21 Jan 2020 09:37:55 +0000
From:   Quentin Perret <qperret@google.com>
To:     Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc:     Lukasz Luba <lukasz.luba@arm.com>, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-imx@nxp.com, Morten.Rasmussen@arm.com, Chris.Redpath@arm.com,
        ionela.voinescu@arm.com, javi.merino@arm.com,
        cw00.choi@samsung.com, b.zolnierkie@samsung.com, rjw@rjwysocki.net,
        sudeep.holla@arm.com, viresh.kumar@linaro.org, nm@ti.com,
        sboyd@kernel.org, rui.zhang@intel.com, amit.kucheria@verdurent.com,
        daniel.lezcano@linaro.org, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        kernel@pengutronix.de, khilman@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org,
        matthias.bgg@gmail.com, steven.price@arm.com,
        tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com,
        airlied@linux.ie, daniel@ffwll.ch, kernel-team@android.com
Subject: Re: [PATCH 1/4] PM / EM: and devices to Energy Model
Message-ID: <20200121093755.GA157387@google.com>
References: <20200116152032.11301-1-lukasz.luba@arm.com>
 <20200116152032.11301-2-lukasz.luba@arm.com>
 <20200117105437.GA211774@google.com>
 <40587d98-0e8d-cbac-dbf5-d26501d47a8c@arm.com>
 <20200120150918.GA164543@google.com>
 <8332c4ac-2a7d-1e2d-76e9-7c979a666257@arm.com>
 <b02da0ed-9e0b-36db-9813-daa334cbf2ba@arm.com>
 <c9910c74-ab47-0c78-a1c7-4f3978e1dd09@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9910c74-ab47-0c78-a1c7-4f3978e1dd09@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tuesday 21 Jan 2020 at 10:10:16 (+0100), Dietmar Eggemann wrote:
> True. But then we hard-code that a CPU device performance domain can
> only be a frequency domain (which is true today).
> 
> The task scheduler (build_perf_domains()) and thermal are already using
> cpufreq_cpu_get() to access the cpufreq policy. Now the EM framework
> would too for CPU devices. I assume that could work with a couple of
> adaptations in Documentation/power/energy-model.rst.

Agreed, and if one day we have a real use case where the pd mask and the
cpufreq policy mask need to be different, we'll do the necessary
changes. But until then I don't see a reason to object to Lukasz'
proposal. So +1 from me.

Thanks,
Quentin
