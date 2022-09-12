Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7896C5B5B3A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Sep 2022 15:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbiILNcY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Sep 2022 09:32:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiILNcW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Sep 2022 09:32:22 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C41C622B2A
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 06:32:18 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id b136so12806629yba.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 06:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=WvP/x+fCZxYCMiNOMMw6Im5i56naXzsqIQAk9GCt+2c=;
        b=N5Yc8JvZu0ZC1+InYD0uhXoRkbBXkfd9RS4qb8IqrlfR146XTCBR9WjqAXpXsfnBUX
         etqPpV6vNrXg1tjEayXCP/Ks/qdgFiFS3LQ/UHlY2Pz/UMuDbZ6C4WMHKPJCUhdwtXY3
         ogk6oBVpUP4bsK9XOcGrgF/gbeIcCq6fk2dYC0OEE3g0pg1xpjOJCjjBxFkDNxrfcjJ0
         k22J30ZwZIWttJo6XPbQKb2/Vo/PXUs/9X7dxST0rI4NS0CI3lXoNXREXs4Pv8LdusQq
         cRtcNzZBqdG5b7uCKRNVDI3tEbO7VWXDW79iCOT9MGGl3LH7nB6lHOp1PqH6V++K9nsz
         jd0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=WvP/x+fCZxYCMiNOMMw6Im5i56naXzsqIQAk9GCt+2c=;
        b=Gzbuiy3vq996WZCB7pAAMG19kGfYD5QYysVEVEkEKsUl8JlYTYmNLstRdbRd2oWzRJ
         JbyJtLswBdE8rKJsR/43jZz2qFhyplKIf2Oilqk1MiF978zBifbl+BtJhfvfSQYWvipD
         oAwvvEL01wKNIvnZFdsuboiYYdT1Lb8AThU/voX8+OzY8FH+7YNHF2wEnbchSorKH/BZ
         sOJW0QEngdju3JPl4c5IYbwZLbxL4gw4n5S9BMGAz1h2VBViHM6v40U1eBvNmoAlncQF
         N1rnsAQM5fAOY1PjsUglOsqDQy9gtlQrxCglZlgUMV/aynCq7OE8Q6CHWc24nnvXNpOb
         SCaQ==
X-Gm-Message-State: ACgBeo0g7UbkSbbYZObq80Jhv3FWZcslth8UUBLNmpXsYaFTOzx2APdd
        3xVCqWOW4s4RMIV+H1KqlRT/26xsERGRiMJ9I2v7ww==
X-Google-Smtp-Source: AA6agR6R+jK3kreNZKXAI1lHh3Mfck+8y0IA1Ml+8+hw5jJge/fH6yBe8CDqGJ8wEob4KZqomXaiJ+WGELAhXUgwYm0=
X-Received: by 2002:a25:ba45:0:b0:67a:6298:7bac with SMTP id
 z5-20020a25ba45000000b0067a62987bacmr23756170ybj.194.1662989537861; Mon, 12
 Sep 2022 06:32:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220910170207.1592220-1-danct12@riseup.net> <0a2bb48f-c67d-0544-5037-d02f658a3351@connolly.tech>
In-Reply-To: <0a2bb48f-c67d-0544-5037-d02f658a3351@connolly.tech>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 12 Sep 2022 16:32:06 +0300
Message-ID: <CAA8EJpr4_G_uK5oj9Y0j_tE_LsnqDHKaU1D_nhXOiL0sA=aMnQ@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: sm6115: Select QCOM_GDSC
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     Dang Huynh <danct12@riseup.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Mon, 12 Sept 2022 at 16:17, Caleb Connolly <caleb@connolly.tech> wrote:
>
>
>
> On 10/09/2022 18:02, Dang Huynh wrote:
> > While working on the Fxtec Pro1X device, this error shows up with
> > my own minimal configuration:
> >
> > gcc-sm6115: probe of 1400000.clock-controller failed with error -38
> >
> > The clock driver depends on CONFIG_QCOM_GDSC and after enabling
> > that, the driver probes successfully.
> >
> > Signed-off-by: Dang Huynh <danct12@riseup.net>
> > ---
> >   drivers/clk/qcom/Kconfig | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> > index 1cf1ef70e347..d566fbdebdf9 100644
> > --- a/drivers/clk/qcom/Kconfig
> > +++ b/drivers/clk/qcom/Kconfig
> > @@ -645,6 +645,7 @@ config SM_DISPCC_6350
> >
> >   config SM_GCC_6115
> >       tristate "SM6115 and SM4250 Global Clock Controller"
> > +     select QCOM_GDSC
>
>         depends on QCOM_GDSC

All other Qualcomm clock drivers select the GDSC if required, so I'd
tend to disagree.


-- 
With best wishes
Dmitry
