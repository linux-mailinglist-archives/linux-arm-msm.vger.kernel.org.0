Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE82EA46C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2019 20:50:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbfJ3TuY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Oct 2019 15:50:24 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41951 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbfJ3TuY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Oct 2019 15:50:24 -0400
Received: by mail-pf1-f195.google.com with SMTP id p26so2324166pfq.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Oct 2019 12:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HQ9FlWq+UvdDEfKTzeyzDf/xB7q4VOki0EmDu2rneyI=;
        b=WpD0szc9Md9tY2/n0MEWZBMJUxjxDAsnN5nv6bFIaLE3Mfco+mnhKg/9Q3231acaPu
         JgrrSy8x2aEqZsWMcbT7a63vu8s7c+meiHWRXHNjjoCoeEJOMmjvXKC0U/rfoleoDLxv
         4ZSTicknUi/kduQca2gQQHhpq9n3Fz0KNstO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HQ9FlWq+UvdDEfKTzeyzDf/xB7q4VOki0EmDu2rneyI=;
        b=nHGgoZVtniCQcZVJUavoq650Ir9nDL4v8gAXbekzJIMPredT22OxBnKtcBBbsvd4q1
         /hmtg6O8HYu9fdfJzXGIUpEKa+nj5pK3cL/i3UkWYJkblK3N73lOYdHrJKtKker1Gy49
         rdfUX0fVyejDKqTVKLUbhZ7r/f4FF4eMWUkuO3r80nJoJ/KEik1qyaRHxJ4Fc/kAE+kP
         B6vKper3P1Z8pwWfCrBYrCKc/cesxFVco6e1DSHz/nOgyF+czjurVxeaz6/qB6T5+qPi
         X03IQ6QjuREmchpRbfH5eesjBkqdokvrZ/fXlFgr9/NwaLMF3fox//lEAtDiRyy5rH7j
         kW3g==
X-Gm-Message-State: APjAAAXKhlG7xA1f5N8WIi4gROrLbXyz4jaURUUyn40ajPRVR3gmQuBn
        IcurOjFYL1bUr55dyiiNJZ9otw==
X-Google-Smtp-Source: APXvYqz/QWsyM/lJiIGheJ/+yIlYmhs+n/d7akVsIpvcixXB40xL1Dd1YxIGf/82aICZka66QdEzTQ==
X-Received: by 2002:a17:90a:77c6:: with SMTP id e6mr1213558pjs.93.1572465023464;
        Wed, 30 Oct 2019 12:50:23 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id k32sm2965175pje.10.2019.10.30.12.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2019 12:50:22 -0700 (PDT)
Date:   Wed, 30 Oct 2019 12:50:21 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Maulik Shah <mkshah@codeaurora.org>
Subject: Re: [PATCH v3 11/11] arm64: dts: qcom: sc7180: Add pdc interrupt
 controller
Message-ID: <20191030195021.GC27773@google.com>
References: <20191023090219.15603-1-rnayak@codeaurora.org>
 <20191023090219.15603-12-rnayak@codeaurora.org>
 <5db86de0.1c69fb81.9e27d.0f47@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5db86de0.1c69fb81.9e27d.0f47@mx.google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 29, 2019 at 09:50:40AM -0700, Stephen Boyd wrote:
> Quoting Rajendra Nayak (2019-10-23 02:02:19)
> > From: Maulik Shah <mkshah@codeaurora.org>
> > 
> > Add pdc interrupt controller for sc7180
> > 
> > Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> > Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> > ---
> > v3:
> > Used the qcom,sdm845-pdc compatible for pdc node
> 
> Everything else isn't doing the weird old compatible thing. Why not just
> add the new compatible and update the driver? I guess I'll have to go
> read the history.

Marc Zyngier complained  on v2 about the churn from adding compatible
strings for identical components, and I kinda see his point.

I agree that using the 'sdm845' compatible string for sc7180 is odd too.
Maybe we should introduce SoC independent compatible strings for IP blocks
that are shared across multiple SoCs? If differentiation is needed SoC
specific strings can be added.


