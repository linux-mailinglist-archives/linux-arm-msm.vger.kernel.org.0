Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BCEA3DA1E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 13:15:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236486AbhG2LPV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 07:15:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236264AbhG2LPU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 07:15:20 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C128FC061765
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jul 2021 04:15:16 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id i10so6586078pla.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jul 2021 04:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=P6JR4MD1nZbCGyDxWwepp0jK3WYk6Zdj/y8iVAiPBSg=;
        b=VRBt+bKi0cAN8LEpK12OBHB9u6otmlMK+7o1OLzTBvni5crrZTjXwpNVW5dexaYG1w
         FgRxil3VgmNL9n+uZowDsbDezsOfH+vE9Tg7wQWr+a0IIujQuIi4Xyqq+ItaCs/zwlI4
         yUN869w1dy0UJc0U5D4IwLj1+jbXGnpenZZqvuTC2fFC07UgBdB4VBwJvA//TB6W80I+
         rrW20kwjKSeXXklIS0yUuTWjNjpyKolULkl6TmXLnB+F8hb33PswdW5QAzSfV5spKsk7
         tJqVivwIBrvSo2QQVBYnULt4HHdYr6EcUWwZgh6jfnBJrEHh9ui0rW+tMt+e322XH0Vd
         fuHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=P6JR4MD1nZbCGyDxWwepp0jK3WYk6Zdj/y8iVAiPBSg=;
        b=XxA5vPTAbnVQpXpddcUN1KOmNrYvdEwQdi12Ohc1RxRcrd+cmJkyuC6cvbZWALwIhN
         mQOLptEKKtbgHr5Tf/143WU5S6gLTMnXcb60IXbKC0yuhkEdRY4AdCKRUVfQ6YT0QyMm
         HhRghMPdNhEw5/RW3aijcHqS8IE17tkbcMW+5BI5l7I2uaEw8YHkZx14TRFYVqQm1XG+
         S+61yD1Z9MY7HloNp584uRGk1aiMK+KLG+pRpdIuskz18YPheWHj810uCml7F9fXtu46
         miYTJXh5TzfFmMwV9APY1dz3Rf3CW2NPK7kHEssTnV3MgqFA4OzWqaxAxczvfk5RnMkh
         bIrg==
X-Gm-Message-State: AOAM533SfTIcBpxW2PKiYzaegejcHuib4qesRtShDfBczH0GH5yCjCY9
        MhyGWryHFUgd47VIUBC9eDPKQg==
X-Google-Smtp-Source: ABdhPJzmMzQgwR7cNNoSaOWusGUG+LNYHF0AXsO6MC5So3X+yMZ49KPS3MosOkJ4nGK7PFFOvq3uSQ==
X-Received: by 2002:a17:902:a9c6:b029:129:8fdb:698f with SMTP id b6-20020a170902a9c6b02901298fdb698fmr4296847plr.15.1627557316246;
        Thu, 29 Jul 2021 04:15:16 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id 20sm663000pgg.36.2021.07.29.04.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 04:15:15 -0700 (PDT)
Date:   Thu, 29 Jul 2021 16:45:13 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, rui.zhang@intel.com,
        daniel.lezcano@linaro.org, rjw@rjwysocki.net, robh+dt@kernel.org,
        steev@kali.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [Patch v4 3/6] cpufreq: qcom-cpufreq-hw: Add dcvs interrupt
 support
Message-ID: <20210729111513.djd5hrbz6jb453xp@vireshk-i7>
References: <20210727152512.1098329-1-thara.gopinath@linaro.org>
 <20210727152512.1098329-4-thara.gopinath@linaro.org>
 <20210728035014.25mgvrpnraxfslq7@vireshk-i7>
 <9a257605-d282-cd06-cc44-5ad5a5f8484d@linaro.org>
 <20210729061713.kzhka7nymo53zw2o@vireshk-i7>
 <4d80594c-9088-5d36-44cd-19a98145095c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d80594c-9088-5d36-44cd-19a98145095c@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29-07-21, 07:13, Thara Gopinath wrote:
> So the interrupt handler is a threaded handler. I moved it in v4 since one
> of the "_opp" api has an underlying mutex and was causing issues. So using a
> mutex should be pretty safe in this case.

Ahh I see.

> IIUC, the main change you are suggesting below is to include enable_irq() /
> mod_delayed_work() under the spin_lock as well. Is that right ? In which
> case isn't a mutex better than spinlock?

Yeah, sure.

-- 
viresh
