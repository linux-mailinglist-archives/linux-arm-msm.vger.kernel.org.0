Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFC3C558C56
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jun 2022 02:42:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbiFXAmP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jun 2022 20:42:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbiFXAmP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jun 2022 20:42:15 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0715B563B9;
        Thu, 23 Jun 2022 17:42:14 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id o10so1305694edi.1;
        Thu, 23 Jun 2022 17:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:from:to:cc:subject:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZV6ruGNMP3nrZcz/XRxoV2WAJS9Hob/Ze+TH7Bv7L30=;
        b=Ffj2KbQupIvxHCM3+j88yM0GIw5/JabCHyC9PkwtaRfZp4U8Eq/j80kfUXKaBmRIq+
         p73i/HNPIiRcifzNyl3u5GiTvFrSODoTCC1PWridllct8gya7Bq29OpCNeoSN2AGX9dx
         QfCEIIbYjcfubrumgnL8pDJjOOuAezuC9CVPw7azk9RBE+iRs1pWR2zSV+8Xgu1lNDO9
         KdZV2MVeH51V3axMDq2QIVroJKaV3igOgQghsE7yEx4j3hZ8t1d5Vumy4nLRZ9mh0DRc
         br1c5L+FqZtyCslWLG00aMWdKz3t2HG1xvSasthM0gWs8AHd3CixDZbjfBFp51KePFwt
         b+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZV6ruGNMP3nrZcz/XRxoV2WAJS9Hob/Ze+TH7Bv7L30=;
        b=LqrjzXRiRklP1kmkf26tuDlLiiDLTkmx3nFFL5GQqFiDj8rBe/HJ3IaYprhE6W05J3
         cSp1+IGnbX26NPocKCJC7vMuHqCIT3vqrPA0jjNXz9DtmFzHcCFLC8YVxXJsv3p2IJkC
         RPFTuehOJMUFZigFpUWqR9qciKbtiZbOjJlFcGKaUeO1/JcFpg652l2a9rTA7XK2ut68
         vQRi15DO+ha23Tt/GjWeOlWyZ/oVd7P8JTsCqPqkDrzWyijHrMNWdQylFioU61V6+xes
         cm6VFjZajRI6jajf41x8CcZzcVGwaz/cNsfyJ6hv4xZM0WgnLM6hMp87I74pyvroT1yC
         n8zQ==
X-Gm-Message-State: AJIora8BEhopF0KVW+UFsaz7A6kRe+TpId8lS1xV2v+jTML7+/56GQJG
        Q7m8MTn3ftWRn+BtNNmTWNI=
X-Google-Smtp-Source: AGRyM1s44IHFfLojD+QfBuTOAgAza/WMDpEz8DpF/DYaIn20W/82BeKEoJEuEsImnuAKNMCC+Xkc4g==
X-Received: by 2002:a05:6402:350e:b0:42f:b2c1:9393 with SMTP id b14-20020a056402350e00b0042fb2c19393mr14186987edd.11.1656031332341;
        Thu, 23 Jun 2022 17:42:12 -0700 (PDT)
Received: from Ansuel-xps. (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.gmail.com with ESMTPSA id t12-20020a50d70c000000b0043590660f16sm741465edi.35.2022.06.23.17.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 17:42:11 -0700 (PDT)
Message-ID: <62b50863.1c69fb81.be104.158e@mx.google.com>
X-Google-Original-Message-ID: <YrUIXUUOZMdAlUR0@Ansuel-xps.>
Date:   Fri, 24 Jun 2022 02:42:05 +0200
From:   Christian Marangi <ansuelsmth@gmail.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-ipq806x: use parent_data for the last
 remaining entry
References: <20220620215150.1875557-1-dmitry.baryshkov@linaro.org>
 <CAE-0n53X6mwQuoZAgC-mBP42HKqy=NuE7nJpgHGk-pYSFQpcjQ@mail.gmail.com>
 <20220624003714.918ACC3411D@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220624003714.918ACC3411D@smtp.kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 23, 2022 at 05:37:12PM -0700, Stephen Boyd wrote:
> Quoting Stephen Boyd (2022-06-23 17:27:18)
> > Quoting Dmitry Baryshkov (2022-06-20 14:51:50)
> > > Use parent_data for the last remaining entry (pll4). This clock is
> > > provided by the lcc device.
> > > 
> > > Fixes: cb02866f9a74 ("clk: qcom: gcc-ipq806x: convert parent_names to parent_data")
> > > Cc: Ansuel Smith <ansuelsmth@gmail.com>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  drivers/clk/qcom/gcc-ipq806x.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/clk/qcom/gcc-ipq806x.c b/drivers/clk/qcom/gcc-ipq806x.c
> > > index 718de17a1e60..6447f3e81b55 100644
> > > --- a/drivers/clk/qcom/gcc-ipq806x.c
> > > +++ b/drivers/clk/qcom/gcc-ipq806x.c
> > > @@ -79,7 +79,9 @@ static struct clk_regmap pll4_vote = {
> > >         .enable_mask = BIT(4),
> > >         .hw.init = &(struct clk_init_data){
> > >                 .name = "pll4_vote",
> > > -               .parent_names = (const char *[]){ "pll4" },
> > > +               .parent_data = &(const struct clk_parent_data){
> > > +                       .fw_name = "pll4", .name = "pll4",
> > 
> > Is there a DT binding update?
> 
> Also I'd appreciate clk patches be sent to my kernel.org email instead
> of chromium to help my filters.

Sorry for the OT but as you mention... there are many series for ipq806x
all reviewed. Wonder if they can be picked or should I RESEND them?

Some of them are blocking me from sending other fixes as the current
dtsi have wrong definition that would cause kernel panic (if things are
correctly implemented on the driver side)

-- 
	Ansuel
