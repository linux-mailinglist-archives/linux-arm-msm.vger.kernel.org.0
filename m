Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82CCD572290
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 20:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233607AbiGLS0m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 14:26:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233583AbiGLS0f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 14:26:35 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD781D13BD
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 11:26:34 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id x184so8188881pfx.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 11:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=U3xJcWneMqgiAyw8Jg1WDUatCHTvmyE012XIjJk8fc4=;
        b=haklBytDvK+IcrCoVHQy7BzKC63ENsGH1WvcZQwCxw23OIIGwwtKf70cb5ZuPJeBFR
         BZwcTM5nxhKYuw2SfRB/WnToVTHDBd8huNlBYKYq1kkoqheU1JFNLFyHasCOtnwlH6We
         QA0OVFNUGnXKaJFz9Pod7JYaQZhPlu7GVP6QuLTmEPFnn954qvKMVx11CXAGb/4TQ53m
         hzyboW+EoJkcac/NqDvNNHyoCKaNBUPpEIYC0+lZtf2XOkvcvkMODXVWt9fhCO2YKnWL
         GIUTMzvQab1gsaK7iRt8LR9ZX6Rk5iJ1PjQ3kR1Vne04g0GByEFT31eZdJBIpnxnbpTS
         D7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=U3xJcWneMqgiAyw8Jg1WDUatCHTvmyE012XIjJk8fc4=;
        b=AQhRw2KST0IGmL4V0KD2o62orYkhNpcvTWlvJuh3LVxSEXy/err2ZY0Xq3iOnoCc0k
         4B80n0UXnb1/BaQ/hGNfIOkeNRam5vAayi2KEKD8+/hBxMwiZlbq7+U4bKdtQ4QRd1vC
         81yiUJL2EEITUeUhL7P4b4jkcuG8473c26TWsbKT8rfEk1majRU4NwdtZh0se7p7antd
         JmpN2wWspxPD+zoIECQ3q13yfPLmvf3DTpCkbN8Iwlkp73mN+GvyVImceQgllmW0Xxqh
         Rl2guXkMioudiW08GUVN9xnP1Cf1jV4fmXzfzQ6wd2VMxD4F1lirQkelok2sYb17PTvr
         K4Nw==
X-Gm-Message-State: AJIora/TAVXSofy4+NyAPFT1UnlzUHcevI7oQ79gaQLFgaQkt5jSZnmF
        4hQMTzqWOKaA7h57Ycest5qG
X-Google-Smtp-Source: AGRyM1tjM3CZrh0aj0pnVnmy1o35GfNU3abbRRuh2tV7TQOX1/q9PsTOhjIyIq/29Pfqvc2XclMqhw==
X-Received: by 2002:a63:7c49:0:b0:40c:b3f9:18c5 with SMTP id l9-20020a637c49000000b0040cb3f918c5mr20967150pgn.588.1657650394155;
        Tue, 12 Jul 2022 11:26:34 -0700 (PDT)
Received: from thinkpad ([117.207.31.14])
        by smtp.gmail.com with ESMTPSA id c37-20020a634e25000000b004119deff40dsm6437757pgb.23.2022.07.12.11.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 11:26:33 -0700 (PDT)
Date:   Tue, 12 Jul 2022 23:56:27 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Parikshit Pareek <quic_ppareek@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Prasanna Kumar <quic_kprasan@quicinc.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sc8280xp: fix apps_smmu irq
Message-ID: <20220712182627.GA7766@thinkpad>
References: <20220712140009.20765-1-quic_ppareek@quicinc.com>
 <20220712144044.GD21746@workstation>
 <Ys2gSWpColgPW17+@hovoldconsulting.com>
 <CAA8EJprN-Y2cFR=9TSCw6Db8GAJC8eh08FgFBmxumEKt0iGPBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA8EJprN-Y2cFR=9TSCw6Db8GAJC8eh08FgFBmxumEKt0iGPBw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 12, 2022 at 07:41:14PM +0300, Dmitry Baryshkov wrote:
> On Tue, 12 Jul 2022 at 19:24, Johan Hovold <johan@kernel.org> wrote:
> >
> > On Tue, Jul 12, 2022 at 08:10:44PM +0530, Manivannan Sadhasivam wrote:
> > > On Tue, Jul 12, 2022 at 07:30:09PM +0530, Parikshit Pareek wrote:
> > > > Wrong values have been introduced for interrupts property. Fix those
> > > > ones, and correct the mapping of context banks to irq number.
> > > >
> > >
> > > And you ignored my comment about sorting the IRQs...
> >
> > Isn't the order significant here? Either way, that would be a separate
> > change that shouldn't be merged with the fix.
> 
> I'd tend to agree here. Let's get the fix in first and sort the IRQs
> in a separate commit. The order of them is strange indeed.
> 

Yeah, I was expecting a separate patch for the cleanup.

Thanks,
Mani

> -- 
> With best wishes
> Dmitry

-- 
மணிவண்ணன் சதாசிவம்
