Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB6221E09A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2020 21:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726409AbgGMTVf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 15:21:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgGMTVe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 15:21:34 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6071FC061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2020 12:21:34 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x72so6440850pfc.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2020 12:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lnlvSS8yRTjaa31L4bdqfl6S2JOUPE+8vLPyFLQzIA0=;
        b=Os6izMQO5HU2C9KMSKfCwZQxDgXOjXhkpAFRF2xk9FvopUV1KIpH3xyunGonqiRihD
         YJDPvYc1aFxRAMGvPN5QPXG3IG86/9ascA8OlOT68leWXeVDnTfdbbBA6ZZiG68UdNac
         QNzEtglbjw/alG4spZBMMxLRrFL8lgUlvHV7ERnck8TjIQSqwfXUmLIRjp+0zI/kFq0r
         UdWsXlpULiynQmoeYVzMUgp+Srg/ZqSXqXh3QOkrUbnARBtNAO5mJLFLk4UVJU3o5SBC
         dFfI3065HWFu8sUAD4e3lYGsD2YzmGKDNkatjLTAXI5tOTuyjRIAsnNZNpPOp4fgrK3S
         gu0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lnlvSS8yRTjaa31L4bdqfl6S2JOUPE+8vLPyFLQzIA0=;
        b=om+pFhQqJj+ibQkIqwYlB4XBqXBAnYE95jTQQ7HpVUoymcjZJ4mPmsWYtfCqsR5NuJ
         Gq0lJlo4/XIqf3gq0WLud56dFWmsGTRzVlg6GLFnGh2aVc6GRxRxhNgnlxMcHZnmSwpu
         DAXqjM84tdriLqTNu5jkrcez+C/GQMNlmqLS6Aa+j+mi13RMEH0lNNo9eQ540iDInwSg
         MwxwRZnKkP678xHMqkCY5pmDf/yv539UQjLgps7kF65GadGAPdiOAQlKX0ZTPFPiiJgA
         gd+Y+9EcSml7LMJJ3vVBwMOoP2O+GiF/YQRlK4lxIvwGrEw9b5A9NsjbAYEnjJyMGXjk
         uM3Q==
X-Gm-Message-State: AOAM532DoGJvby2yF4C7O9TVG3T3+xN4xCMXtRzvsq5Ul24aktY25vUe
        Qna+Ay8NnPOOfN/Flx5I+d8iOQ==
X-Google-Smtp-Source: ABdhPJwGB1uxYOzm+iqLQAWuBTRahO/IW3KpbEcEwDkgmZiU7vjTTS+yyUzAEByjIHvJZETQz2iCaQ==
X-Received: by 2002:a63:564e:: with SMTP id g14mr550912pgm.326.1594668093886;
        Mon, 13 Jul 2020 12:21:33 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z10sm15863750pfr.90.2020.07.13.12.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 12:21:33 -0700 (PDT)
Date:   Mon, 13 Jul 2020 12:19:25 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Alexey Minnekhanov <alexey.min@gmail.com>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc:     Konrad Dybcio <konradybcio@gmail.com>, skrzynka@konradybcio.pl,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 7/7] mailbox: qcom: Add sdm660 hmss compatible
Message-ID: <20200713191925.GD388985@builder.lan>
References: <20200622192558.152828-1-konradybcio@gmail.com>
 <20200622192558.152828-8-konradybcio@gmail.com>
 <20200623072535.GX128451@builder.lan>
 <CANi4RBQY8dXU=74JfB3hHZYMqMgVwtHoQsLZXV7CpwZ8ue2icw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANi4RBQY8dXU=74JfB3hHZYMqMgVwtHoQsLZXV7CpwZ8ue2icw@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 26 Jun 08:48 PDT 2020, Alexey Minnekhanov wrote:

> Tue, 23 Jun. 2020. 10:29, Bjorn Andersson <bjorn.andersson@linaro.org>:
> >
> > On Mon 22 Jun 12:25 PDT 2020, Konrad Dybcio wrote:
> >
> > > Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> >
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >
> 
> Hi, I can see dts file in linux-next using compatible
> "qcom,sdm660-apcs-hmss-global",
> but not this patch that adds it into the driver?

I take the dts patches through the Qualcomm tree, but the driver patch
should go through the mailbox tree.

Regards,
Bjorn
