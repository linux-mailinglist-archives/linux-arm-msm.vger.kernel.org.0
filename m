Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DBAC575D35
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jul 2022 10:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231251AbiGOIUm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jul 2022 04:20:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbiGOIUl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jul 2022 04:20:41 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C9D43AE6E
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jul 2022 01:20:41 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id g4so3818158pgc.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jul 2022 01:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vAkweYtGWawn+nrfC5G5aLmi9f3fxYHqq+9XF6X0vcM=;
        b=zOYQApFE5da5FGAEpiMld9uBRRRXhO/k9UXGcH2WQcqXVG6gAIsBCco5T8L5Iy1xnn
         e0ycEdRHVJc24vi3DQ4WVu4beu9X4O87k1MNfsT6190YIjblhM0McfrgdPvJ8otyKCMV
         Ezws5XiUikpGIjPghEdAVfhpOC47WTd97CDpUlxoAX707s0N4Nr6v+lORSbRfk2LzA1o
         V/LP290Al7dKbx23EY9VhE57aqjQASw1JR4o+uVLby2pzj/ESEz0fF3O3eMSI9F7JunK
         jpUQPQ49Wr8kc3hy98qU1p2bXhpn+h2yPSIw0JH1a9hv2xAYgqRA1u0FJYyc7ROvpn3/
         c7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vAkweYtGWawn+nrfC5G5aLmi9f3fxYHqq+9XF6X0vcM=;
        b=6lbJ30G22F2Apw0ACDm7cAfWD210lmOtLn/3GgO8CqomsFeTQgnxTIq07ICIZHFLVP
         SU2xTsEPNG6Qjo/r8VCktuwrOuTZd4fy8X0S3rAc6Fj67GBfW4uEPIF4v+Dg3P2IXUqo
         yKhyYQKX3vx2WBRx99bB2juWVxNGbD/SJM1Q6Rw0lsudeA6Hfz3F8Mn7ck8CT85kACc3
         t0TjNTu6gy+ccGyUBtyJTonJpJ02+EkwjCx70K33UbrmxdBUQjrhuc7okckmnp0SDsQR
         1Np/IWH/ga6zTpW6JdHZ3/8jwrjaeQDBGnQ+ckGpvO4iLHY7wOYtYUZqvB+LXIrENnwH
         QwIg==
X-Gm-Message-State: AJIora++l7tT7gQdACDhOYiGdUvaJNu0MBBMXpd/rINiCtVN3xpEWVsc
        aycoldHL2eSVyRUg6rtTuYA0
X-Google-Smtp-Source: AGRyM1vFGJS/miySv2tX/qr7uZNAkW7WgRIIhjT8PZf6LrCAixhSmUHRMir+sO7yv+Myn2jpKVUDoQ==
X-Received: by 2002:a63:7c49:0:b0:40c:b3f9:18c5 with SMTP id l9-20020a637c49000000b0040cb3f918c5mr10764560pgn.588.1657873240491;
        Fri, 15 Jul 2022 01:20:40 -0700 (PDT)
Received: from workstation ([117.248.1.85])
        by smtp.gmail.com with ESMTPSA id n8-20020a170902968800b0015e8d4eb1d3sm2880222plp.29.2022.07.15.01.20.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Jul 2022 01:20:40 -0700 (PDT)
Date:   Fri, 15 Jul 2022 13:50:36 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Parikshit Pareek <quic_ppareek@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Johan Hovold <johan@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Prasanna Kumar <quic_kprasan@quicinc.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sc8280xp: fix apps_smmu irq
Message-ID: <20220715082036.GA12197@workstation>
References: <20220712140009.20765-1-quic_ppareek@quicinc.com>
 <20220712144044.GD21746@workstation>
 <Ys2gSWpColgPW17+@hovoldconsulting.com>
 <CAA8EJprN-Y2cFR=9TSCw6Db8GAJC8eh08FgFBmxumEKt0iGPBw@mail.gmail.com>
 <20220712182627.GA7766@thinkpad>
 <7290abc3-8ec7-8128-9d29-651e9b8aa861@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7290abc3-8ec7-8128-9d29-651e9b8aa861@quicinc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 14, 2022 at 12:37:45PM +0530, Sai Prakash Ranjan wrote:
> Hi Mani,
> 
> On 7/12/2022 11:56 PM, Manivannan Sadhasivam wrote:
> > On Tue, Jul 12, 2022 at 07:41:14PM +0300, Dmitry Baryshkov wrote:
> > > On Tue, 12 Jul 2022 at 19:24, Johan Hovold <johan@kernel.org> wrote:
> > > > On Tue, Jul 12, 2022 at 08:10:44PM +0530, Manivannan Sadhasivam wrote:
> > > > > On Tue, Jul 12, 2022 at 07:30:09PM +0530, Parikshit Pareek wrote:
> > > > > > Wrong values have been introduced for interrupts property. Fix those
> > > > > > ones, and correct the mapping of context banks to irq number.
> > > > > > 
> > > > > And you ignored my comment about sorting the IRQs...
> > > > Isn't the order significant here? Either way, that would be a separate
> > > > change that shouldn't be merged with the fix.
> > > I'd tend to agree here. Let's get the fix in first and sort the IRQs
> > > in a separate commit. The order of them is strange indeed.
> > > 
> 
> As per "arm,smmu.yaml" devicetree documentation, context interrupts are specified in order of their indexing by the SMMU
> and not the IRQ numbers, quoting relevant part below.
> 
> "Interrupt list, with the first #global-interrupts entries corresponding to the global interrupts
> and any following entries corresponding to context interrupts, specified in order of their indexing by the SMMU."
> 
> And the current order in DT without sorting by IRQ number matches with the SMMU IP interrupt document,
> 
> For example, in the current DT order, you see 409 and then 418 instead of 410. Here 409 is app_tcu_cxt_irpt_vec[73],
> 418 is app_tcu_cxt_irpt_vec[74] and 410 is app_tcu_cxt_irpt_vec[90] and hence the ordering of 409, 418 .... 410.
> Also the reverse ordering at the end from 913 to 891 is also as per this indexing.
> 
> So the current ordering is proper and do not require sorting.
> 

Ah, I missed reading the binding. Sorry for the noise.

> As for the missing IRQs and duplicate ones, I will reply on the patch, looks like there are some other misconfigurations as well.
> 

Thanks,
Mani

> Thanks,
> Sai
> 
