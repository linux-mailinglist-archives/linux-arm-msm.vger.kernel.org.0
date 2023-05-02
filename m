Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9198B6F4382
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 14:16:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233548AbjEBMQ3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 08:16:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234142AbjEBMQ2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 08:16:28 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 764C89B
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 05:16:27 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-b9d8b2e1576so5487074276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 May 2023 05:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683029786; x=1685621786;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h9ardPWYosUAO+3QKtmsKLmvu8qo+YDZ1OFVvflCLdU=;
        b=JSSUtIpFUmmQC1t2blYcBA8h1ekJDGVQFJ9WBHxN6hVxKB5iYgENAQArMQKzl4VOM5
         QZ+p+CGq+dkk8er+1SXAde1CTpVmic2GwQaMCmkLz3ywJ78BbaxZmn2jJ7yHecOlGPnr
         yBBo7VlMbpTQLKTRCokTaXPo24GIb3P5kDhNDbTYHoviQ8npZ6CS9T7HqTuAgc+KLGBV
         m/9EaFV03EaoxqkSs8ayzquoQJ3HrymICjSGNEwePLRI1lMbaKCiggAWuVGqYQ60aplW
         JpY4S1O8kq6cPLBSnFOlk9cCsVYy7OCufwJ1ixsclabW0S4Wp1bBPLsi+mw3hhpDUiBG
         yO2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683029786; x=1685621786;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h9ardPWYosUAO+3QKtmsKLmvu8qo+YDZ1OFVvflCLdU=;
        b=X/sPXOuldWPoKWrB7XAnKu0JMS5JSEUAX52YteEP9wCTizk6Zdwn5TiJVt5G3x0vst
         KEqFTo19fQCMcymhjZkwiG8eVjxTxHytXJUctes8R7rspUc98+UbuYXdb54DeqZokXZq
         pD/WFlQAWuF3xLY/6P03XYxzQQT63lz9hUCwbqQFJaFTs3qgn6RjbeYKfs+rBcK75PDp
         O2JYGPtJvnGB7LCNezA8DbKrYYf/7zE5lJt12Idgn2a+hFQof6pNOAiTtpb4KSMRSjVB
         a10GohdyPmz5zn3Mt+Z8joaBtLzLd2SOhj/NRlTf0C8GN1uQd3NRZWEHLANMQJFtACWr
         ZGsQ==
X-Gm-Message-State: AC+VfDwRBdG+sKLlMRukveWPBA50n/MgUDFay4KJhBhfeeCisxAsF98K
        BiOLsBLD7AVbPNM0EcmONqHxx6aZmaz9wYnSjRsUEA==
X-Google-Smtp-Source: ACHHUZ6hzSiLDwegEeRiqDAbVdwIWCIpf8rlCKny2lSh22T8sFJachUE6vPV6cDQARuaEUD8A0ap2ZmWE7vMgw3tVME=
X-Received: by 2002:a0d:e68b:0:b0:55a:95df:7175 with SMTP id
 p133-20020a0de68b000000b0055a95df7175mr2167346ywe.9.1683029786689; Tue, 02
 May 2023 05:16:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230501203401.41393-1-dmitry.baryshkov@linaro.org>
 <20230501203401.41393-7-dmitry.baryshkov@linaro.org> <8684a7c7-5af3-c773-4330-200e4b897937@linaro.org>
In-Reply-To: <8684a7c7-5af3-c773-4330-200e4b897937@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 2 May 2023 15:16:15 +0300
Message-ID: <CAA8EJpqkEA7RZBOc4xeKXBGhRuPM8W2BN8=o59b_TW6h7VOAVQ@mail.gmail.com>
Subject: Re: [PATCH 06/10] clk: qcom: gcc-mdm9615: use proper parent for
 pll0_vote clock
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 2 May 2023 at 14:15, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 1.05.2023 22:33, Dmitry Baryshkov wrote:
> > The pll0_vote clock definitely should have pll0 as a parent (instead of
> > pll8).
> >
> > Fixes: 7792a8d6713c ("clk: mdm9615: Add support for MDM9615 Clock Controllers")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> Cc: <stable@vger.kernel.org>

Not sure if it warrants that, but let's include it into v2 if there is one.

>
> ?
>
> Konrad
> >  drivers/clk/qcom/gcc-mdm9615.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/qcom/gcc-mdm9615.c b/drivers/clk/qcom/gcc-mdm9615.c
> > index fb5c1244fb97..2f921891008d 100644
> > --- a/drivers/clk/qcom/gcc-mdm9615.c
> > +++ b/drivers/clk/qcom/gcc-mdm9615.c
> > @@ -58,7 +58,7 @@ static struct clk_regmap pll0_vote = {
> >       .enable_mask = BIT(0),
> >       .hw.init = &(struct clk_init_data){
> >               .name = "pll0_vote",
> > -             .parent_names = (const char *[]){ "pll8" },
> > +             .parent_names = (const char *[]){ "pll0" },
> >               .num_parents = 1,
> >               .ops = &clk_pll_vote_ops,
> >       },



-- 
With best wishes
Dmitry
