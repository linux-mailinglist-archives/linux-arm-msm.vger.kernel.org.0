Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92A204FE99B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Apr 2022 22:44:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbiDLUq2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 16:46:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234131AbiDLUME (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 16:12:04 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84F866A011
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 13:07:59 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id e4so20203891oif.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 13:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HS/t9fInoBASlo5XNi/0B/mBl/RmkpwKB28iS3MPbuY=;
        b=lkBFXM7aaukUHOGTj1Ot2swztuEx9Ac+pPU5fa3ML5oaYHBBbxyM1yco+GVNGPyiLq
         0l/peM1b/Cadt9njBgMHbFAtpCoKguiT9dNODNqahVT8/WGH/VNerKkPYZJG/TpskZwE
         fBqS2KoJyyd6LdkFmRqpPMMyV/gLWE7/iPl+PYZ62CpL5w/OGz62cDndGa9udw6oLMxX
         iKZk8pYaF0t5uL3P9cxvYLkuWA2pcHseFbj8X1Xy3dZsPPohtzF+Tz+u+GgUWQeL4GyX
         gK41UDwjUB9xRQpkP94OVRK80uB5/oGCjMg8lrNO3ODFKkCGVG7npVuhEY1xLpqvEdD4
         WLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HS/t9fInoBASlo5XNi/0B/mBl/RmkpwKB28iS3MPbuY=;
        b=DqaNbUSaPM1AjlYQAXjKRLHNQcH2FU360HfMDuZZ0nFosh52RSczor/lJrGNoXL/uh
         N13oJ0ffUNvc3sFwMpcAdIgavjrM0rFs827WeC3/sgNzZnvPAtQBA/+qQX2gXrDxCI1+
         It/Yil9A4RBc9va1DHcoQVGz9+XRT0YpZeHEUnDfwsoZ7lP6vD7W6yEODVNAoosekBvG
         8dlaaVJSKnAQ6A97GeSQ8aeN5RUlPxQ2TQhEcyK8WuxD0yNCnB8O6VDA33vQ3O/dNmhG
         fQch9E5brXdX4PkNvp6Oi7k4PqyrI/b7LeMChqXW95cn9JV9rsJfJ9P5gcnHh67L8MKt
         7biQ==
X-Gm-Message-State: AOAM532JHL0EqcUx/Q8lqn2EdcRuVRQoQluSjIfa0+2pQ53AF8UQn46r
        udWd4pPGQU/207/OHqtUnFKuRw==
X-Google-Smtp-Source: ABdhPJzoB3ldGw8dI1IaA47ugaHgwdHizRBi2jaMxfcrdgLQQ7xwYbP5cKugEete7oH7ExqXNlJVeA==
X-Received: by 2002:a05:6808:1115:b0:2ec:e78e:3fc0 with SMTP id e21-20020a056808111500b002ece78e3fc0mr2580411oih.207.1649793991113;
        Tue, 12 Apr 2022 13:06:31 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id v17-20020a9d69d1000000b005b2319a08c4sm13705206oto.18.2022.04.12.13.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 13:06:30 -0700 (PDT)
Date:   Tue, 12 Apr 2022 13:08:44 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 0/4] arm: qcom: qcom-apq8064: add separate device node
 for tsens
Message-ID: <YlXcTNv4ex54G/ig@ripper>
References: <20220406002648.393486-1-dmitry.baryshkov@linaro.org>
 <20220406154028.EC897C385A3@smtp.kernel.org>
 <CAA8EJpod2cNOYr3g+DmdWo_2Ujv7-pW39fBKqcpCPvtVgP5-NQ@mail.gmail.com>
 <20220412184304.79012C385A8@smtp.kernel.org>
 <CAA8EJppha+V77S6LAZW9us6XiVu9vD9X=RF+RKd+5cvCz+NxEg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJppha+V77S6LAZW9us6XiVu9vD9X=RF+RKd+5cvCz+NxEg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 12 Apr 12:20 PDT 2022, Dmitry Baryshkov wrote:

> On Tue, 12 Apr 2022 at 21:43, Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Dmitry Baryshkov (2022-04-06 12:57:30)
> > > On Wed, 6 Apr 2022 at 18:40, Stephen Boyd <sboyd@kernel.org> wrote:
> > > >
> > > > Quoting Dmitry Baryshkov (2022-04-05 17:26:44)
> > > > > Currently gcc-msm8960 driver manually creates tsens device. Instantiate
> > > > > the device using DT node instead. This follow the IPQ8064 device tree
> > > > > schema.
> > > >
> > > > Why can't the schema be changed?
> > >
> > > But these commits change the schema. They make apq8064 follow more
> > > logical scheme of ipq8064.
> > >
> >
> > Sounds like ipq8064 and apq8064 follow different schemas. Is there any
> > benefit to harmonizing the two vs. just leaving it as it is in the dts
> > and making the schema match whatever the dts has?
> 
> I'd prefer to harmonize them. It makes no sense to have two different
> approaches for the single IP block (shared between ipq and apq/msm).
> And having a separate device tree node for the tsens removes a
> dependency from gcc on the nvmem/qfprom.
> Note, upstream qcom-msm8960.dtsi doesn't describe tsens at all, so we
> don't have to worry about it.
> 

The apq8064 design was chosen in order to make the dts represent the GCC
being a single hardware block, and the fact that this is a clock and a
thermal driver in Linux is an implementation decision.

Seems like we forgot about this decision when we introduce the
ipq8064...


I'm not against harmonizing the two, but I don't see any changes to
Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml and the
clock patch describes what happens, but not why (i.e. if it's to
harmonize the implementations the commit message should say so).

Regards,
Bjorn
