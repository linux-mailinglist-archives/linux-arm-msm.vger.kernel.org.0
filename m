Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F40101B49F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 18:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726164AbgDVQM5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 12:12:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726503AbgDVQM4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 12:12:56 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9135C03C1A9
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 09:12:53 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id s10so1922286edy.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 09:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cOIdG6ANuqdCAw6HTlOJwmfM932Ci5JIRvtMJVQhAu8=;
        b=FhN9qRLx4i+wanbPH+AvD3FKCX9cxO/ct2YRESvQMA6H5QD5TErIsLxRMXKsFa/S3q
         gjMIGn8pgFo1ce1STLeEs+9TXt8ahd4XLiBCFg5Mqakj/rzDCKQak01DJQaZFI4seZN8
         QNufbdgbepqcy3XXqqxX1i/zpLUsLUrB8QuRaNgL+FIvb2baG7eVQHsF8jb7iVxSluXq
         NgFZhVRerrkpx6td8evt+KLxPW5B64+qiFc0Dj7rMNCaaQ7O1NFyloSpHDh0qTYdJ5W5
         09SsqqlsMlh20i8azgFUAz7FHfCcvSdhhk1onh1k4T3ssONuzgobKAysSv9uFtR9Osde
         sGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cOIdG6ANuqdCAw6HTlOJwmfM932Ci5JIRvtMJVQhAu8=;
        b=DeQyClHG0541umRMp+xfOS6q2G0BILYL0ldkTyTqbaeia+6sNzMNyER8Jdf32g33q3
         asaQbYd8Z7Uk0r0lq+ce/KXGTSf1x0Htyqqn58s0q1gXuMyOzAVArRnV454dtSKV/5bm
         X/Q5Omp26XFVtqr2Dym6mEz9MrVGOBlle/vNKfYtQmRxCclaCifKAp29WTk2wCyQe5/l
         +LrFMpO2sqlp5MkwtLZH1mgBpfFu8IlRV77HZxVCWuIBJcQVM3ABSU39Ztyhz3zfeC5P
         RmhzP1wnTTASAJ+TU3mo5UsoUCB4+TdGNEGrY3+LA0HRDNOXHK1oQuqL5CccoNoLC4Gr
         4Vfw==
X-Gm-Message-State: AGi0PuYr4eC0FxFunCC80DS0JZIRC+ttIZDatfL+DUTBl6pGnCI4eqvH
        gM4zta3vnRjLhYoAUpWdm9QOx3YF8lGKFNpzmsVK5w==
X-Google-Smtp-Source: APiQypK2YAAvF6wFI6CAGsRdSkkUVwNPo3dT6tXcGq+bweW10zNHW57KThBCkvfa7QcU0JI8E4FzHXQrFyXsVl4hshc=
X-Received: by 2002:a05:6402:22ed:: with SMTP id dn13mr23348389edb.212.1587571972357;
 Wed, 22 Apr 2020 09:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <1585224008-15730-1-git-send-email-loic.poulain@linaro.org>
 <1585224008-15730-4-git-send-email-loic.poulain@linaro.org> <158754648689.132238.18246673092201406766@swboyd.mtv.corp.google.com>
In-Reply-To: <158754648689.132238.18246673092201406766@swboyd.mtv.corp.google.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Wed, 22 Apr 2020 18:16:40 +0200
Message-ID: <CAMZdPi9Jg1ak41-39e2i5dM4Yrw8gGBx=MEvqBy8UCuZNMvCrA@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: clk: qcom: Add bindings for CPU clock
 for msm8996
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk@vger.kernel.org, Ilia Lin <ilialin@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 22 Apr 2020 at 11:08, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Loic Poulain (2020-03-26 05:00:07)
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,kryocc.txt b/Documentation/devicetree/bindings/clock/qcom,kryocc.txt
> > new file mode 100644
> > index 0000000..8458783
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/qcom,kryocc.txt
> > @@ -0,0 +1,17 @@
> > +Qualcomm CPUSS clock controller for Kryo CPUs
> > +----------------------------------------------------
> > +
> > +Required properties :
> > +- compatible : shall contain only one of the following:
> > +
> > +                       "qcom,msm8996-apcc"
> > +
> > +- reg : shall contain base register location and length
> > +- #clock-cells : shall contain 1
>
> Any chance this can become YAML, take parent clocks via the 'clocks' and
> 'clock-names' properties in DT, and have the file name reflect the
> compatible string instead of qcom,kryocc?

Sure, will do that in v2.
Regards,
Loic
