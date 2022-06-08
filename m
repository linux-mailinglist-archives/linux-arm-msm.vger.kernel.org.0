Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85C60543917
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 18:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245524AbiFHQbx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 12:31:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245674AbiFHQbm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 12:31:42 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 758232732FE
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jun 2022 09:30:59 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id r1so8816749ybd.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 09:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Lncv2LVsA56QWTTY7ejCus0yb5RlxQsdBDJmYqFl50A=;
        b=d6kPR1wrbGMetGMiPuVDa8PgYxfO6Oy3Kx+hDhVxhJOHasK/neqeFn5v9tm80VcExw
         YsWXm737TOrXh2ez7hCy+2uDwt7WBoX+As/axDkAGsgv7g4Kyj33BGPhSgj2U4DBKmRr
         6dwMqIRhlcKa8z4jfXecFbrLnSomZL9jMvzmP/+Y2cNQoIWTiYaPDRbNB363T46edhur
         8iRDx0N22I8WYnZTFfDQtRG4HrRmELJhWwZRFTPRcAjfy98cGHqvAUs3ynSGpJWVA2YX
         jJg8zM6m0zA4eDdfRY8eAntXgj44nO+FnnO/j7buuD+5i/TvI3NcS947FpLbxtRGr3vD
         +fvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lncv2LVsA56QWTTY7ejCus0yb5RlxQsdBDJmYqFl50A=;
        b=msM2RVTgyrHPzIBjG0Mk5pmuhc3u5OJ8hIBbdFstv9BZ71npJteV9mb44LpJS/klc2
         q/SdmLtAnV144NJ08iVZ1volZrTzu36uUQUe4J/89gECKKIl8BHaK7sj9odmo0CTya2I
         IiaTYkdZyOoxluTcQc5xmgLnNZ1466xo0HMRNOlBfUVlS/Kdw8CUQEP5niAxOG+ala7T
         LJqYGPgu1MxlMFhujjrW3g1SXJqR+qJHu/eg4dmJVe7SFpy8f1aobYRTZF2pueFGjrbh
         fVePMYXPMoC1I3hwfMBtdVvt5VRTe7zxTMAn9/ec/itTa0qjK6jzYP5xOgrkXD0jQYV0
         T3jg==
X-Gm-Message-State: AOAM533F0Xn6XEydYROTlgM9AFqj+TNQDiIFbq8+bhZTfe8qn02GJnoK
        XKLV9Qeo9tMx9nGeeuQ3a2pqftg+Bj8+4uAgRBHQZg==
X-Google-Smtp-Source: ABdhPJwGIrZ38ILyApGaOemHeQHIedRTY6AQ2KwNS9fEHrjBBtNnfh44eQx6dgap2EmVvI+3YvXh0vSM+RKAlK5Z1zo=
X-Received: by 2002:a25:76c1:0:b0:65d:211c:a0da with SMTP id
 r184-20020a2576c1000000b0065d211ca0damr35709544ybc.475.1654705857687; Wed, 08
 Jun 2022 09:30:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220401001810.81507-1-jo@jsfamily.in> <BY5PR02MB700935F5817128CB7C3991CDD9E09@BY5PR02MB7009.namprd02.prod.outlook.com>
 <BY5PR02MB70099A0E4C060E52284DCE46D9A59@BY5PR02MB7009.namprd02.prod.outlook.com>
In-Reply-To: <BY5PR02MB70099A0E4C060E52284DCE46D9A59@BY5PR02MB7009.namprd02.prod.outlook.com>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Wed, 8 Jun 2022 22:00:46 +0530
Message-ID: <CAO_48GH5V2-Z0cqGJoF68hzZjqhY6_aGxReSk+ByC_zrLWusYQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/panel: nt36672a: add backlight support
To:     Joel Selvaraj <jo@jsfamily.in>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Amit Pundir <amit.pundir@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Joel,

On Wed, 8 Jun 2022 at 00:01, Joel Selvaraj <jo@jsfamily.in> wrote:
>
> Hi,
>
> I can see that the dts changes from this patch series has been applied
> to 5.19-rc1 release. However, this patch that has the related change to
> the panel driver, is not applied in the 5.19-rc1 release. Any particular
> reason why it's not picked up? or just that, it got missed out? Kindly
> let me know if changes are required from my end.

This is entirely my fault - It somehow missed my radar, and I didn't
queue it up. I will push it via drm-misc tree tonight. Apologies
again!
>
> With Regards,
> Joel Selvaraj

Best,
Sumit.
