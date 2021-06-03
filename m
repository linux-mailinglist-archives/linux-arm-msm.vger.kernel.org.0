Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08FAE39AC91
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jun 2021 23:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbhFCVSX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Jun 2021 17:18:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbhFCVSW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Jun 2021 17:18:22 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B2ECC061756
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jun 2021 14:16:37 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id o9so3296357pgd.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jun 2021 14:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kvk9gslJOENTo6gRzwBFIjsERHiJMZgRHbw94r2xW9A=;
        b=VXgaTUaYAJDtDx/9sRAupTT/6+VvFP1y46HCUvnq4hGT+/pyTJuNzjTbXKEWExBUsU
         cxwGk7v+dkoI3+XN4I54OifcaSE/GQRa4D1jk2TcIzt9s1leutsX11/AxM7grfK4/WT1
         k9KOP1QrRf5vSI/qWUfIM4omB09fWJ71qi1eQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kvk9gslJOENTo6gRzwBFIjsERHiJMZgRHbw94r2xW9A=;
        b=t8IfFvlSnVs1Q9tifXkjutpcs5P7nm8fUw+ayEjWudMLCkhNvi4uv6E/nmUepNgzQQ
         sQUi+LPOrXqg5wecmGsvwpv54SfxP5zD8PcffH9nokF28HdNILuVLbrGNZD4V7wtk6Q/
         LEiJ7zgW10Aa5JKBGmeTuBP8GP5BvJqpmWE8rr9gn6yoNtvpfVS74ydLWYlCuHXes2ug
         N/nsHL5Jj42wnMcpUhhzckwdEgP6/h39ppgJTtPEQywboUoH0IXfCqbipw+U/20rtVld
         KgytPsj50KilSvwnikiPrFNr9b2C28EYn6RcPB07QX2TtNakDL0Ir3nUWD6zRscSeWDR
         E+XA==
X-Gm-Message-State: AOAM532yYTKDTrG5bU+3ArDbPAngKi39Tv4nPM0sdR50bIGP2BLwVvRn
        5y8yBhFuQKGNM3mq6Nq1cdJ83g==
X-Google-Smtp-Source: ABdhPJwZSwvbOF7F+yQSC2HeThqJ0Rt+yj7Kcehm2KQ5tifHrhsvzKkzsO9SXD9CPsG0VjPAPVbkxg==
X-Received: by 2002:a63:1161:: with SMTP id 33mr1411868pgr.270.1622754997011;
        Thu, 03 Jun 2021 14:16:37 -0700 (PDT)
Received: from google.com ([2601:646:8e00:b2f0:9b75:481:32db:356b])
        by smtp.gmail.com with ESMTPSA id c62sm22833pfa.12.2021.06.03.14.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 14:16:36 -0700 (PDT)
Date:   Thu, 3 Jun 2021 14:16:33 -0700
From:   Sujit Kautkar <sujitka@chromium.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sc7180: SD-card GPIO pin set
 bias-pull up
Message-ID: <YLlGseTHHCTDN68V@google.com>
References: <20210602191338.1995827-1-sujitka@chromium.org>
 <20210602121313.v3.2.I52f30ddfe62041b7e6c3c362f0ad8f695ac28224@changeid>
 <CAD=FV=WzgvkT-F-LoDHJXsRamHH2g0GVUzoU4Qe8wAc4Y_L2Dg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=WzgvkT-F-LoDHJXsRamHH2g0GVUzoU4Qe8wAc4Y_L2Dg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jun 03, 2021 at 01:33:07PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Wed, Jun 2, 2021 at 12:14 PM Sujit Kautkar <sujitka@chromium.org> wrote:
> >
> > Some SC7180 based board do not have external pull-up for cd-gpio.
> 
> nit: s/board/boards
> 
> Presumably Bjorn could fix this when he applies the patch. I wouldn't
> re-post just for this fix unless Bjorn asks you to.
I can repost this patch again with this fix if required

> FYI: I had my Reviewed-by tag on v2. While you did make changes
> between v2 and v3, in this case I don't think the changes were
> significant enough to warrant removing my Reviewed-by tag and I would
> have been happy if you'd kept it.
> 
> In general, if you ever have questions about whether you should keep
> someone's reviewed tag, it never hurts to mention your logic "after
> the cut" (I think you use patman so this would be "Commit-notes:").
> For instance, you could say this if you removed Reviewed-by tags:
>
It is good to know this.

> I totally recombobulated the frobnication logic in v3 and removed
> previous Reviewed-by tags. Hopefully reviewers can re-add if they
> still think the patch is good.
> 
> ...or, you could say this if you kept them but you weren't totally
> sure it was OK:
> 
> Even though every single line in the v3 patch changed from v2, it's
> only because I fixed a stoopid spelling Mistake. Thus, I kept previous
> Reviewed-by tags. Please yell if you object. Who knew that the only
> acceptable spelling of the English word "stupid" in kerneldoc comments
> was written as "stoopid". Live and learn.
> 
> :-)
> 
> In any case, here's my Reviewed-by tag again. I also agree that
> Bjorn's comments made sense and were good to fix...
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
Thanks for adding review tag again. I intended to keep this tag since
only commit message is updated, but I forgot to add it back while
posting latest version.

-Sujit

