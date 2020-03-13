Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E9F1184D5B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2020 18:15:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726553AbgCMRP3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 13:15:29 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51108 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbgCMRP3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 13:15:29 -0400
Received: by mail-wm1-f65.google.com with SMTP id a5so10827609wmb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2020 10:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EiAZ8r1RK4eYPjDEt/gPiQ4hc4RczwbEBzIiaGohL7A=;
        b=Y6MMbku01pHaOoSgGbj4gF3V6x7FB1fkNAjJ6ru6WyqJeOLaM9BYbK0Ix5GiRzvNyK
         JIioY1ozgF3HVo4Auv/aymm6AZFpDclDUVmdfoDPF+KPKip5Yk4kG7Hly9cTf+rNIbjt
         7MLho2yP/uxhsxbFwElwAMRIDoxKMELy3GerALcpDAGTG2KnGEZ+GqcbM0IjWFUDhr7q
         rowpPLYZoUSujhlAEl+M2aZSrzgSsZCi5RH5aISnBCWJvXcUUYCU1KjnPZLcSm+y37Rq
         sstjUD42VHXtFuUYk1V6LrY/wCYZhaFm3tgsnEUbTCcAXDxIK+sON7MnL+fUwV5dhLoH
         PtxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EiAZ8r1RK4eYPjDEt/gPiQ4hc4RczwbEBzIiaGohL7A=;
        b=ojafQk5gfnNfbV9qDZrV05UsFqJ6dl/QfIyj6SudxYbG609JC+13tWZVFGgQ79iwpF
         zGnuHjrfXXXyOXylDAYzGCNAIj/AFSfCk1udolUmsQSzl0vCQkq0q1qZS4OJwY5sct9Y
         JfEIsxCT1+lAQ9M6bo5ODrsbz0brZFg4eXiyzwB5fVa/sasW4WXQw3NkIR1SzdtYqs9w
         kuzo8TfESbIuPM05g88QOXPC9TCrd2hmnarguk0vBbxZyVC4uLljGMWcpjUBHhbZozvQ
         0NIkEcxZwow3atHMYkrETfjNttKM+pLGfxuOtpGIo6rXqgeUJYRNT/7go/KsDlsaRPaD
         UYUQ==
X-Gm-Message-State: ANhLgQ3KZIKCcmwVNLwjQ/sFEiw8q/GeEF/8ezyU9CEq13/6zTbjt3d9
        NQBLZpYlwbVQQSXaInKLpeFenA==
X-Google-Smtp-Source: ADFU+vuhetFMtP2EoDOpiocI9rZpw5aJIjO8D6ESXO0czFCY0ade8WAwSU18BkQ9bFFVg+JYF0INNg==
X-Received: by 2002:a7b:c414:: with SMTP id k20mr11747450wmi.119.1584119725823;
        Fri, 13 Mar 2020 10:15:25 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
        by smtp.gmail.com with ESMTPSA id s22sm16474638wmc.16.2020.03.13.10.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 10:15:25 -0700 (PDT)
Date:   Fri, 13 Mar 2020 17:15:21 +0000
From:   Quentin Perret <qperret@google.com>
To:     Lukasz Luba <lukasz.luba@arm.com>
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-imx@nxp.com, Morten.Rasmussen@arm.com,
        Dietmar.Eggemann@arm.com, javi.merino@arm.com,
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
        airlied@linux.ie, daniel@ffwll.ch, liviu.dudau@arm.com,
        lorenzo.pieralisi@arm.com, patrick.bellasi@matbug.net,
        orjan.eide@arm.com, rdunlap@infradead.org
Subject: Re: [PATCH v4 1/4] PM / EM: add devices to Energy Model
Message-ID: <20200313171521.GA236432@google.com>
References: <20200309134117.2331-1-lukasz.luba@arm.com>
 <20200309134117.2331-2-lukasz.luba@arm.com>
 <20200313100407.GA144499@google.com>
 <bd1233f4-6e8b-23d1-e5aa-7c904fbd1bb3@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd1233f4-6e8b-23d1-e5aa-7c904fbd1bb3@arm.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Friday 13 Mar 2020 at 16:49:24 (+0000), Lukasz Luba wrote:
<snip>
> Well if someone would add EM to its platform and call this in
> hotplug, which is used as cooling method, will see a lot of warnings.

Right, but I guess I was arguing that calling this for CPUs, even on
hotplug, is kinda wrong.

> I would rather avoid stressing people with this kind of warnings.
> This is under control and nothing really happens even when they
> do hotplug very often, like LTP stress tests.
> 
> I agree to add a print there but warning for me is when something
> is not OK and should be investigated.
> I would prefer dev_dbg_once() to print thet the EM is not going to be
> removed. This will also not pollute dmesg in many logs.

Fair enough, a WARN is maybe a bit over the top. A debug message
should work.


<snip>
> So these small changes will be present in v5. I have to wait a few
> days because there is one change to devfreq_cooling.c queuing and I will
> send v5 with updated patch 3/4 rebased on top.

Sounds good, thanks.
Quentin
