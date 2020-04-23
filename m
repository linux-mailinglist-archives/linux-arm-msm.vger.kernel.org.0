Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6370D1B605A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2020 18:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729585AbgDWQHa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Apr 2020 12:07:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729478AbgDWQHa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Apr 2020 12:07:30 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12E07C09B043
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 09:07:30 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id x18so7500372wrq.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 09:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JilRdq2BDhA1AKoin3Th54s1noQnrS50Fz/y17AV1jA=;
        b=mu5AJ++cQsxccfAWV5JOLI/SgRQB86tng7pTsdRiA0kz/jrOGnc32OzFYt/7FPwzzB
         +RKxvAWyG3Fhb/LTxr6iLFG7Fqd7cKZchlM4nPOFnCKoCRxMGn7M5oQDMCMFbxxLhDGe
         5X2igq6lLyFRp4YnVVxEseuIDVoFkyq+mdHi+Zisfd8Pp3LapzbK+KzPaARkQ4AAAyz7
         bNs+1FaBot8KfjfQNqxRFuFjrp9Rx7gmbOUG0SjUisIrkJPmKAomEWKkRNJRPC7bZciu
         H7JBYPscd6A7+6TIJnHQSIdrfBlMdUZgWFGabEUO3JDAeXaryLKlgvKAiL43TvO8v1SR
         jQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JilRdq2BDhA1AKoin3Th54s1noQnrS50Fz/y17AV1jA=;
        b=h9YIiaruiYXJUaE6nqIxop40FkUkwJNqC6h8H3V+PjBj8YMeBgZPcR4S7LQbeX/7j2
         ItzEB422qqEE0JxKMajU6+2ViC+qC42DLYUYqJPQLK+a7MpIo2tFuSeaukSRTsNkWEJg
         Rkb1lX2cU82e6PEvTauGO2A6ttNjgEhSblaRSZqe34wg7pbaQ4HLcGFqvhoDDJ4fxYAP
         kFUtBNtiz10IMEPtUqZB7xAJOfs9epJMJpmHjniDdd+Ww7p6myKEFKIbdwhhlR4xcUnU
         XSEePpdMe2K2Fb3d7Xk2Td7ekbmpdv6/cyZu0iLnfRFoLkh9DTbL71Ia5xt6xLnVdikH
         kImg==
X-Gm-Message-State: AGi0PuaGzwqFp0bVoQgEhaH0g8ugRoCn+wnzo29dd4FlbL/SEM1HhEPY
        jx2ZRO6v7BoSs2hc6HdN9zTd6Q==
X-Google-Smtp-Source: APiQypLW+PKkIM2+wwd4rW8a0Cu+5yfXB9aOs7exzbNq/9IiN/eo7uFJ35wUPd5bS6ATZyaoXdBIzg==
X-Received: by 2002:a5d:49c7:: with SMTP id t7mr5482028wrs.22.1587658048446;
        Thu, 23 Apr 2020 09:07:28 -0700 (PDT)
Received: from linaro.org ([37.167.216.250])
        by smtp.gmail.com with ESMTPSA id g74sm4308279wme.44.2020.04.23.09.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 09:07:27 -0700 (PDT)
Date:   Thu, 23 Apr 2020 18:07:23 +0200
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     Lukasz Luba <lukasz.luba@arm.com>
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-imx@nxp.com, Dietmar.Eggemann@arm.com, cw00.choi@samsung.com,
        b.zolnierkie@samsung.com, rjw@rjwysocki.net, sudeep.holla@arm.com,
        viresh.kumar@linaro.org, nm@ti.com, sboyd@kernel.org,
        rui.zhang@intel.com, amit.kucheria@verdurent.com, mingo@redhat.com,
        peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, rostedt@goodmis.org,
        qperret@google.com, bsegall@google.com, mgorman@suse.de,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        kernel@pengutronix.de, khilman@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org,
        matthias.bgg@gmail.com, steven.price@arm.com,
        tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com,
        airlied@linux.ie, daniel@ffwll.ch, liviu.dudau@arm.com,
        lorenzo.pieralisi@arm.com, patrick.bellasi@matbug.net,
        orjan.eide@arm.com, rdunlap@infradead.org, mka@chromium.org
Subject: Re: [PATCH v6 07/10] Documentation: power: update Energy Model
 description
Message-ID: <20200423160723.GE65632@linaro.org>
References: <20200410084210.24932-1-lukasz.luba@arm.com>
 <20200410084210.24932-8-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200410084210.24932-8-lukasz.luba@arm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 10, 2020 at 09:42:07AM +0100, Lukasz Luba wrote:
> The Energy Model framework supports also other devices than CPUs. Update
> related information and add description for the new usage.
> 
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> ---

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
