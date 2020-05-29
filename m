Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 381701E71F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 03:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438300AbgE2BMi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 21:12:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438291AbgE2BMf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 21:12:35 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92335C08C5C9
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 18:12:34 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id f21so475147pgg.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 18:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kI4zkU+qRTGbgWBmmIaqkd0hMY6ChqTdeDWJXNLS2lY=;
        b=ZvvmXCR+Jg6K8NJ5TP9zOcwdNhzYRynNjJaxE9BOTaQ4WMT0cuAK53MhuVB57WbOQK
         DIMMu5xbsbYDtoZBkAXIqsFLAV0S8qVPpSQjVshNcMDxg5EM1F40Sgi9sY/gDyXyTX+f
         z+gUA6CT2Pu2DiOB6T/chOupLze71KYm9GAMZBXookN3b+bO9a/W+8/PqcryQRI2RcTv
         gz6Gok+AZtkjRlb20hYQKsgwv1A9E+/wQT/UK0Pn123vnoVOzsGpVQbPv1DOqrQKtSNe
         Lj/qUb93fp5Lm9yu5G9EFWwrJDmjbfr9iB5WA2FM50ui6VDRlxeD2zCNvARtNlSHhZJx
         F37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kI4zkU+qRTGbgWBmmIaqkd0hMY6ChqTdeDWJXNLS2lY=;
        b=n1znlPW+B7CG25dmCzPGxGQQ8R8coPAzx766YYvzEvGmVmKJ4KM4a553TKmb24sEOu
         1xc0g/CjkJR3QRfh+csVhSqVfeJhIZuPHz8CpYIPbKlmrvLvFxhHPGpq4gX/gVutxwdp
         gr2Ay50VE207Hi9+bl0ED+Z343emyRpl3LAmIelIXZVj9DflpIgYOlrHTH9HLQFFQeUf
         PalT9xTCAEsEZ0yXxEff8TuolVnY5AM4OQbvhLP4M28VXQxatU0STtkjhk4wPLBOuqkF
         b47WpVYtwWEg0ZBrR4rYTUPxzIeONfxWgxzvwC5MBADGSaxXpZBSTRQazGio7EpQfE7k
         hDdA==
X-Gm-Message-State: AOAM530k4nuOTb/WlpI1C2UW0U7bsDqZsAWN4RX2kFIIYT8ugBAff4vY
        FJ4BwvvEphKiEy4+LTVuVwENtg==
X-Google-Smtp-Source: ABdhPJwfjsWrwj+SXPUBxHF2kWpN9zDhmEMPQN5652Q6TkJ5xvT3OmNnv6s97SHc8D/O4uvjVFeMVw==
X-Received: by 2002:a65:64c1:: with SMTP id t1mr5957407pgv.247.1590714753667;
        Thu, 28 May 2020 18:12:33 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 74sm2353876pfa.87.2020.05.28.18.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 18:12:32 -0700 (PDT)
Date:   Thu, 28 May 2020 18:11:27 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH 08/10] clk: qcom: Add graphics clock controller driver
 for SM8250
Message-ID: <20200529011127.GJ279327@builder.lan>
References: <20200524210615.17035-1-jonathan@marek.ca>
 <20200524210615.17035-9-jonathan@marek.ca>
 <c4d43cf01b6d014fdc2258abb94eb2c5@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4d43cf01b6d014fdc2258abb94eb2c5@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 25 May 02:47 PDT 2020, Sai Prakash Ranjan wrote:

> Hi Jonathan,
> 
> On 2020-05-25 02:36, Jonathan Marek wrote:
> > Add support for the graphics clock controller found on SM8250
> > based devices. This would allow graphics drivers to probe and
> > control their clocks.
> > 
> > This is copied from the downstream kernel, adapted for upstream.
> > For example, GDSCs have been added.
> > 
> > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> 
> Since this is taken from downstream, maintain the original author's
> signed-off and add yourself as the co-developer if you have done
> any modifications. Same applies to all other patches.
> 

I disagree with this.

As expressed in the commit message, this patch is based on the
downstream driver, not the individual patch.  As such, the _patch_ is
prepared by Jonathan and by his Signed-off-by certifies the origin of
the contribution per section 11.a or 11.b of submitting-patches.rst.



Regarding co-developed-by; this should not be used when "forwarding" an
existing patch. Per section 11.c the contributor should add their
Signed-off-by to certify the origin of the patch. Any modifications
should be documented in immediately proceeding the s-o-b, as described
later in section 11.

Thanks,
Bjorn
