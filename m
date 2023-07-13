Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75946751735
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 06:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233784AbjGMEJ7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jul 2023 00:09:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233760AbjGMEJg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jul 2023 00:09:36 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08E992735
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 21:09:21 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-1b0606bee45so229285fac.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 21:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689221361; x=1691813361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6C1hFH1e1r14+LlLoW2U5T6jLyfkGUaKnsim50K84rk=;
        b=MHk1ZLmI+NLEzwdzzXFJ2jjDX0NfoPhZMypbHUVS5rPsQUoutqeC37UymQQ2KZVbvw
         y2FtVRnCNBZs0xLnERTZMH4wcoW9RnQv6EJ6TKI6g3bmoxZw6MuMKg7K0y6PPBNloVJI
         KsDVSpgVpErLhM1X1m1JHigX65HcwWsMPBTGZG4AoRK6E15HwzyPfMIZbiflH0OZS4md
         C0HHVu63WL2fwlqCv6wvAe69E3kVdpvwmvpeZ8v9A1oDy569bACXor3gBJgekbT+evjF
         9qlEliA415d2cixtzugl6FUOQeQxXrVUfDzxEkF+1LzD+YTQx/QS5oU5O488h+QhdzwR
         SObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689221361; x=1691813361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6C1hFH1e1r14+LlLoW2U5T6jLyfkGUaKnsim50K84rk=;
        b=R9Lc6wwTlE2Johhs4lNF1dNxQH579/okuxZ2o9dK5dP4cBFJG54r7jySi5+d6XUn2r
         OrHo1jYA9cjHxBsxf6whVSJw0fdfu52r6fCXIHAY6mgBljwuinYcHVtp0O9gSWuS/qTC
         MNq0UAAsSeVvSMuME23GTzMgQtTSO9fK1ZIlUgX5sR4ked+RyIla7MH8/7YQ7Pq5U/dk
         cOja692DTEH3Z6WL0u6ZSSxpDJsqhMKfsQTfev+t7kEHK8lMJ4y14QKEQ81MbQxbaA1B
         Ky8L1QeysZ10/wS9Uc3zc+ZvCTIZfOLEYhHXwZH+kxxrBnMEFYns3V8XJ5nzha8/ijzw
         i+YQ==
X-Gm-Message-State: ABy/qLYaeWMw/oZiESYJjyDEKmyd+pf97GxJPC8qlyMFFisWh1G/o0Ol
        cQSVPrPvCS0I4jgO9lqbFZty/w==
X-Google-Smtp-Source: APBJJlHltuR/N+6Ns0BpUwIbzkwv42caxHmZintv/YBkjLmokXkXL5Q/QOp+ih2yXtk7i+F4MR8pIg==
X-Received: by 2002:a05:6870:1fc8:b0:1b0:89e0:114f with SMTP id gp8-20020a0568701fc800b001b089e0114fmr713337oac.31.1689221361112;
        Wed, 12 Jul 2023 21:09:21 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id f12-20020a17090ac28c00b00262ff206931sm10788288pjt.42.2023.07.12.21.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 21:09:20 -0700 (PDT)
Date:   Thu, 13 Jul 2023 09:39:18 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        vireshk@kernel.org, nm@ti.com, sboyd@kernel.org,
        myungjoo.ham@samsung.com, kyungmin.park@samsung.com,
        cw00.choi@samsung.com, andersson@kernel.org,
        konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        quic_asutoshd@quicinc.com, quic_cang@quicinc.com,
        quic_nitirawa@quicinc.com, quic_narepall@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_richardp@quicinc.com,
        quic_nguyenb@quicinc.com, quic_ziqichen@quicinc.com,
        bmasney@redhat.com, krzysztof.kozlowski@linaro.org
Subject: Re: [PATCH 11/14] scsi: ufs: host: Add support for parsing OPP
Message-ID: <20230713040918.jnf5oqiwymrdnrmq@vireshk-i7>
References: <20230712103213.101770-1-manivannan.sadhasivam@linaro.org>
 <20230712103213.101770-14-manivannan.sadhasivam@linaro.org>
 <e6a5129a-db07-977d-2ecd-328a52cbcdc0@linaro.org>
 <20230712163406.GG102757@thinkpad>
 <CAA8EJpovHr1qxepVprk6UvnhKe+nu4VuziyKKgjV3UzommFz6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpovHr1qxepVprk6UvnhKe+nu4VuziyKKgjV3UzommFz6g@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12-07-23, 19:48, Dmitry Baryshkov wrote:
> On Wed, 12 Jul 2023 at 19:34, Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> > On Wed, Jul 12, 2023 at 04:15:12PM +0300, Dmitry Baryshkov wrote:
> > > On 12/07/2023 13:32, Manivannan Sadhasivam wrote:

> > > > +static int ufshcd_opp_config_clks(struct device *dev, struct opp_table *opp_table,
> > > > +                             struct dev_pm_opp *opp, void *data,
> > > > +                             bool scaling_down)
> > > > +{
> > > > +   struct ufs_hba *hba = dev_get_drvdata(dev);
> > > > +   struct list_head *head = &hba->clk_list_head;
> > > > +   struct ufs_clk_info *clki;
> > > > +   unsigned long freq;
> > > > +   u8 idx = 0;
> > > > +   int ret;
> > > > +
> > > > +   list_for_each_entry(clki, head, list) {
> > > > +           if (!IS_ERR_OR_NULL(clki->clk)) {
> > > > +                   freq = dev_pm_opp_get_freq_indexed(opp, idx++);
> > > > +
> > > > +                   /* Do not set rate for clocks having frequency as 0 */
> > > > +                   if (!freq)
> > > > +                           continue;
> > >
> > > Can we omit these clocks from the opp table? I don't think they serve any
> > > purpose.
> > >
> >
> > No, we cannot. OPP requires the clocks and opp-hz to be of same length.

I am okay with having a patch for the OPP core to modify this
behavior, as I told privately earlier.

> > And we
> > cannot omit those clocks as well since linux needs to gate control them.
> 
> Hmm, I thought we push the list of "interesting" clocks through
> config->clock_names.

Yes, another way to solve this would be keep the interesting clocks in
the beginning in "clock-names" field and let the platform pass only
those to the OPP core.

> >
> > > Maybe it would even make sense to move this function to drivers/opp then, as
> > > it will be generic enough.
> > >
> >
> > There is already a generic function available in OPP core. But we cannot use it
> > as we need to skip setting 0 freq and that's not applicable in OPP core as
> > discussed with Viresh offline.
> 
> Ack.

I am okay with either of the solutions, it is for you guys to decide
what works better for your platform.

-- 
viresh
