Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E3D1205C1B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2020 21:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733305AbgFWTsg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 15:48:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733220AbgFWTsg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 15:48:36 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA50EC061573
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2020 12:48:35 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id p82so9127811oif.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2020 12:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hKVXq5SBjl7ip0W66Q8y9F0bojVrEQnVpR2gkixkNHo=;
        b=wa4zoPG0Eqlhp7SFJqin+mvrnlDq8iUZMQRjCQCb3gPMoG9SbUGQC0Aui5w5T6kDd1
         U0F3SkSpz7bQNFK8RK/WNeKTT2TwjbhUsF0rROfFK1TSOnWk70hc4BlaqPqB02/9Aeai
         Lzke4gq1VJEwryCiCHg+oyYBTD2CZXkzU7WawbYuxSqobTk7bMZPE0KivmHgfdBGowtA
         TD4VbGrVnHxEmWv2Bw5tepAHfFAf1kEGsWGyZdEM7Lt7W+c6d1rzH3J1Wlq8oRT8LPdG
         nn0HUCHR9tqLni/R9WebSKWwDZJrqUdasZVUjyes4m68sTvh7HkQ8BIHDwyqyMruCEYM
         Io2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hKVXq5SBjl7ip0W66Q8y9F0bojVrEQnVpR2gkixkNHo=;
        b=S1ZzbIAYRdppadnIqM6kByzM7ZsLe3s0V1ap+8mA5tZqrRmrdmTfKpeo9p/E6BYi7i
         Hdk0a77CW2K5U1Iyr6V+KyeZnyHkcgO/8NMDiTLSejgJqCHgwKIYXDguuUD4ihSnIDez
         XfBxbyMVVu7kzFqbp+CnRxMPgafViQiotrYXww2pREUqTpaKF5OkiDyZBo9ZIsNz5nAF
         sOjkVJbhuXiQGAdPAsl1+UiIJtdd1OrUjQ4HsF6LlTknsAwcScmocjv7XXHtJyF3yMcy
         leGrPjS+/GYBTUtWsC8fJUcCUleCJs8RlbKPyiWZZJHXUZUZJRYmGHHN77Wv5Bc5F0h0
         5pHA==
X-Gm-Message-State: AOAM530bitfgCI3oPBOAO7ejnTqW+bdqOTusJsa4ow4/evIr52jvXWMR
        q588d4Pp04Eu20EyIHu/MtEO+Q==
X-Google-Smtp-Source: ABdhPJx/EeRQVc+4fXC/+Wnv2T3NSwhB5Dd29u35e0bxQuj2FxzOu3Z1ta2mgflDv9CH2EunjarfqA==
X-Received: by 2002:a05:6808:45:: with SMTP id v5mr16671208oic.140.1592941715091;
        Tue, 23 Jun 2020 12:48:35 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id o4sm4147963oie.19.2020.06.23.12.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 12:48:34 -0700 (PDT)
Date:   Tue, 23 Jun 2020 12:45:51 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        Patch Tracking <patches@linaro.org>,
        linaro-kernel@lists.linaro.org
Subject: Re: [PATCH 1/4] soc: qcom: socinfo: add support for newer socinfo
 data
Message-ID: <20200623194551.GD128451@builder.lan>
References: <20200525164817.2938638-1-dmitry.baryshkov@linaro.org>
 <20200529023543.GQ279327@builder.lan>
 <CAA8EJpq9PCidca5EU=P2QA1BWyo9iaCs2XWi9+t5vTVSRzD35Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpq9PCidca5EU=P2QA1BWyo9iaCs2XWi9+t5vTVSRzD35Q@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 22 Jun 01:38 PDT 2020, Dmitry Baryshkov wrote:

> On Fri, 29 May 2020 at 05:36, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Mon 25 May 09:48 PDT 2020, Dmitry Baryshkov wrote:
> >
> > > Add support for newer Qualcomm SoC info structures (up to version 0.15).
> > >
> >
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Gratuitous ping for these four patches.
> 

Thanks for the ping, series now applied.
