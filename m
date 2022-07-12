Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13343572129
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 18:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233390AbiGLQlf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 12:41:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233425AbiGLQlc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 12:41:32 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FC4AB9DB9
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 09:41:26 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id j29so9277303qtv.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 09:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RBWDmzjx1JOGADPPQjOJgYt6gunLEY6JLxZJ2CAS7Xo=;
        b=rWSAhfb2Rq8+KFJRrrYD+v9UrvmA9onvNQ3CFaDwvVxxehBUykvbWfB6W0cwIZlfOA
         KUHCqqEmsdhgDvVlo4+YunsSPZYu+k4LU25RtvZs1Nwq3pw+7L6+s+9Ud9DQLFlBRGGn
         vI0nE73sLb+mNZXy8HS2FFN1S3VM1FiBTBTkX6tLLtwR9ZVIaZHBa/8VjPAAELw/kamo
         uLYfNz67nWvzeOL209XYB54IzMdG0va5nMwVDjg5TPf/W3y/5mzQEAdJePcfJ8fQ6HBn
         pYDCDEebIQS8oXuaNx1IEQQvZotgYYeRlo+mqC2WXZe0iEsXEbNYLoThGzSEr+b+ryv9
         LuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RBWDmzjx1JOGADPPQjOJgYt6gunLEY6JLxZJ2CAS7Xo=;
        b=1Hmu9OJ8xFl9um1E/A5Ud5roeHWlFe8aB2BTBUmldJSMnutqebpSbuYlihfiqvqqtV
         +vhqWHO5LfekAdwC0hCz40iht6y2EURztcL0gMxJcn1agObZWLV2ATn10mR9yKEoyqEV
         7XGiX+Dg2g3nCJYw/Effr9WK+pv1k0baUVvfUg3anKQ44j3PhXGjyBQaHYgfsmwg0Lgn
         ZLPho3Y2DP+sXRRevmgdHCLTGQyOdU379M7efTjmzX9qX+dfeT9ltwroiFx40wC4tFY+
         zitWZ9WyjhFrqqTBA3xbmzYMe2FxHSLS2h45X41ooTOhQvbkXPSBidVIvbVPTb+1z9e3
         LoZw==
X-Gm-Message-State: AJIora+YYGwZY5LOs5U2F0Awn/tLh/uecjr7srKvlb6yEmTcRO2hP3b/
        kTlcHsFRNcVjIth6bPXs3qJJ/tHkXEIko1EBB0j3Fg==
X-Google-Smtp-Source: AGRyM1sTjXMgjnBnGpg0Djl7d8B6IX1wnK3LgQSdXG3l5LJT7Tpxto9S4RaGzgAiOrLV1jg6PoF5VXeFSK9GrMNojnU=
X-Received: by 2002:ac8:5dca:0:b0:31e:85b8:8a18 with SMTP id
 e10-20020ac85dca000000b0031e85b88a18mr18760980qtx.370.1657644085427; Tue, 12
 Jul 2022 09:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220712140009.20765-1-quic_ppareek@quicinc.com>
 <20220712144044.GD21746@workstation> <Ys2gSWpColgPW17+@hovoldconsulting.com>
In-Reply-To: <Ys2gSWpColgPW17+@hovoldconsulting.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 12 Jul 2022 19:41:14 +0300
Message-ID: <CAA8EJprN-Y2cFR=9TSCw6Db8GAJC8eh08FgFBmxumEKt0iGPBw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc8280xp: fix apps_smmu irq
To:     Johan Hovold <johan@kernel.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Parikshit Pareek <quic_ppareek@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Prasanna Kumar <quic_kprasan@quicinc.com>,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 12 Jul 2022 at 19:24, Johan Hovold <johan@kernel.org> wrote:
>
> On Tue, Jul 12, 2022 at 08:10:44PM +0530, Manivannan Sadhasivam wrote:
> > On Tue, Jul 12, 2022 at 07:30:09PM +0530, Parikshit Pareek wrote:
> > > Wrong values have been introduced for interrupts property. Fix those
> > > ones, and correct the mapping of context banks to irq number.
> > >
> >
> > And you ignored my comment about sorting the IRQs...
>
> Isn't the order significant here? Either way, that would be a separate
> change that shouldn't be merged with the fix.

I'd tend to agree here. Let's get the fix in first and sort the IRQs
in a separate commit. The order of them is strange indeed.

-- 
With best wishes
Dmitry
