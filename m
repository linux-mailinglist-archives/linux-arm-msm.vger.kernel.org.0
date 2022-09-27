Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04A695EBE71
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 11:24:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231496AbiI0JX7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 05:23:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231939AbiI0JXk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 05:23:40 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C58081075A6
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 02:20:56 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id f189so11458160yba.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 02:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Ls1fJJA+5aCvqe8aN5+zfKTfcvmiFtGTM0zRAaqzArc=;
        b=tUQ5qHcFnvKK3CtWEMfPVAXpJUnV78O/82ehwN9baGfWcGV9ux868SBsiFtXFh1TvE
         v8I1qC38oWPQuYoFBWPjjFVJ0A4Eua5Pt9iidsSzeHZMTKuqsqnA37W2rvFCRX+txR9n
         hxkuHlRtSSWvfbI8w6w+st2UfHX9BXgzPzCyFVMzO+gKAgLXfuuPbZDdxhiCTrFgplyE
         GlRnIPzxRMTZWh5hMyngySmiNF84ugM3pTZRjFupz8k+uNcvdjaXTEUIYAnx4SnL9dPs
         nSV3IQfJ0gSfo3cU2zSCHUPiiMK/hP1Womk6KEBZwKPQUheAx3z9VFWFweCT834w1lRu
         1dVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Ls1fJJA+5aCvqe8aN5+zfKTfcvmiFtGTM0zRAaqzArc=;
        b=v0Ye+OtlKAYY0IkAPnzb/8+GsNwYXFFqgcRSy7NmEkGHZaaUIn6BrtFj9s0v6yBoy4
         V3UYBdBPr79fyGso8WGzWuxPFRLjVIFoUPqE+md1r1hDRVJARS3+G6oF87S1XDepC6vR
         rGYXp2puRckSNEnS5t0OYXOtz0mPL77ZUgedJjn8H3IVextlTtCX24h0IuKkfiIeQsAQ
         of2PEhqFstftQFKFZO20vqQ9AXivKGxIEJd4pQAaosKwV4tZE4NAmZYfd5aIotmi/KtM
         Tk1a9BceQGEEi9UZkrsw66uAVeOjVdK/sdUHm7puQerx+6VI3OpolaYEqA6MdnvAjpNS
         5PxQ==
X-Gm-Message-State: ACrzQf1w7qeVvn2AB/qh3ySi5I7ZiireMzRAoZK6x/UgbclpCEsDxVTu
        KNy1ETTieHRvCyIO4k/DgSmKmxtzdDFP5c4syC6L7w==
X-Google-Smtp-Source: AMsMyM44Toj/GmnYIF3aKtPYB/9uB/7/jMGKWlnTErJNcC2qJFXKOMDAMDOLbb0Ov9UOfyb06xZNGRjuhzPhaHxmCJI=
X-Received: by 2002:a25:3f86:0:b0:6bc:998:873e with SMTP id
 m128-20020a253f86000000b006bc0998873emr3931908yba.152.1664270454983; Tue, 27
 Sep 2022 02:20:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220926173435.881688-1-dmitry.baryshkov@linaro.org>
 <20220926173435.881688-6-dmitry.baryshkov@linaro.org> <YzKxeWrhed20XLKj@hovoldconsulting.com>
In-Reply-To: <YzKxeWrhed20XLKj@hovoldconsulting.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 27 Sep 2022 12:20:44 +0300
Message-ID: <CAA8EJpp=DZRC=M_emfLxR-cspzH_qJPyc3=xWXZaPp4mgQq-Xw@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] PCI: qcom-ep: Setup PHY to work in EP mode
To:     Johan Hovold <johan@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 27 Sept 2022 at 11:16, Johan Hovold <johan@kernel.org> wrote:
>
> On Mon, Sep 26, 2022 at 08:34:35PM +0300, Dmitry Baryshkov wrote:
> > Call phy_set_mode_ext() to notify the PHY driver that the PHY is being
> > used in the EP mode.
> >
> > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

Thank you for your review! I'll send v6 with fixing the typos (and linebreaks)

>
> You forgot Jingoo's tag here too.

... and missed r-b tags.


-- 
With best wishes
Dmitry
