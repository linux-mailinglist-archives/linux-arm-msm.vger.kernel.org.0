Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D6AF7092BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 11:11:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231502AbjESJLJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 May 2023 05:11:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231497AbjESJK4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 May 2023 05:10:56 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D36E1BD3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 02:10:34 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3078aa0b152so1977398f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 02:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684487433; x=1687079433;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m4PUn3laZkjlv9r91VlagRE7SeQ4y7zfvRtcaATbBto=;
        b=tPPNaiTO8lJ5jKQV6OBH0hubdfYT6e0g5een+CNh5ZVnoqtMivb80X9jt62BmL7Ntc
         JmDTguBRtWeMmeWge9aFO2HntpQSdodBZm/+Bk5lRIzSoCNh6vAi8eupqFAh9LXyq/av
         mqb/xGE2oU0pXdzRbXi6jBqk9jQj2FCBBKMSVhMYeAHY7KTU9fNZZweDD4jivvMWtQrj
         OENV18nIItD13qed13rPXMEVGHvBz7PVZ5m4CA4oa5LRABnMxGoPL0J7t8A0zq94JhVp
         hXc9a81Ra8u+zRHvw9la+GPmwDtH70uD0C2A8Dgcu+vmuDYVDVWK0L5Gt0RgSYf0hcyL
         pd/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684487433; x=1687079433;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m4PUn3laZkjlv9r91VlagRE7SeQ4y7zfvRtcaATbBto=;
        b=g4yg9hVP0EpzkNPXLbRVJDO2PT230C4ZHoBIASIBRIL8nnaQ2Y/sznSgDH62ErOyVS
         wJc9TC5h6Ko70kvfIKJ388CcWXbOicDckCOwqA1UlVPO7ZB3lXihE5ynpxxHVlk4mdVg
         Escq88bdmzLRJightPyZt+pNyuhv8z2UnI5Y7q99F3KjjHN/04dUYerfMaqBnXkcwiyS
         GL3mP7wqN2pUnMG7+lnvhMNdubyWWQ9czQZK0qg8RAXIwRGymQImEEBw+QywDEITcJgT
         0ft08PXCOyAnckEA4P4yvS/5zjgHLS5GHuziwWLmI0YQXGCYS3Oh5Kzc60M/fbdhGe2w
         3jKg==
X-Gm-Message-State: AC+VfDxELnWSAQK1h7QFlxFR1OmJkpwoT7/F3Mk9+hubOs/1AExm8MX3
        ohicYpv51a1wZvZ3UuoE3hG0eD6isNxMPhh/uNy5mQ==
X-Google-Smtp-Source: ACHHUZ6Ls/fxuZgcyZ694cYOnC1gqFmjt2rYX4qoLImFgpcP92r4Yt0cObiHBFfjDzWMPfy6SRBwmNGjFRTCq9koXeo=
X-Received: by 2002:a5d:6388:0:b0:309:492a:bb07 with SMTP id
 p8-20020a5d6388000000b00309492abb07mr1162243wru.26.1684487432711; Fri, 19 May
 2023 02:10:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230518-bamclk-dt-v1-1-82f738c897d9@gerhold.net>
 <CAH=2Ntya7bqHVri_F8BOUJ6kJxtG2_usV08do+=OgkaoVJvxBQ@mail.gmail.com> <ZGYKQkgRrBqO2rsx@gerhold.net>
In-Reply-To: <ZGYKQkgRrBqO2rsx@gerhold.net>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Fri, 19 May 2023 14:40:21 +0530
Message-ID: <CAH=2Ntw0BZH=RGp14mYLhX7D6jV5O5eDKRQbby=uCy85xMDU_g@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: qcom: bam_dma: make channels/EEs optional in
 DT with clock
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 18 May 2023 at 16:51, Stephan Gerhold <stephan@gerhold.net> wrote:
>
> On Thu, May 18, 2023 at 04:43:57PM +0530, Bhupesh Sharma wrote:
> > On Thu, 18 May 2023 at 14:56, Stephan Gerhold <stephan@gerhold.net> wrote:
> > >
> > > If we have a BAM clock in the DT we are able to turn on the BAM
> > > controller while probing, so there is no need to read "num-channels"
> > > and "qcom,num-ees" from the DT. It can be read more accurately directly
> > > from the identification registers of the BAM.
> > >
> > > This simplifies setting up typical controlled-remotely BAM DMAs in the
> > > DT that can be turned on via a clock (e.g. the BLSP DMA).
> >
> > Can you please list which qcom board(s) you tested this patch on?
> >
>
> It works fine at least on MSM8916/DB410c (for blsp_dma) and MDM9607
> (blsp_dma and qpic_dma (for NAND)). More testing would be much
> appreciated of course!

I tested this yesterday on RB1/RB2, RB5 and saw no improvement, so was wondering
why exactly is this needed and which platforms are impacted.

> Personally I don't see much of a risk: If enabling the clock doesn't
> actually enable the BAM controller, then the clock probably does not
> belong to the BAM in the first place... :)

Right, but I think the commit message needs a bit more clarity to
reflect that it is now proposed to check for the bam_clk presence
earlier in the _probe flow (as compared to earlier).

Thanks.
