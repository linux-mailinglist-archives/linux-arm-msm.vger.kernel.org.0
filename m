Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 317A26C7DEB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 13:19:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbjCXMTo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 08:19:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231839AbjCXMTm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 08:19:42 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8590EC7B
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 05:19:23 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id n125so1868362ybg.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 05:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679660362;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8TOoc2P/covbfEozOoPRNxWEkdDXKymUtV6P3HpaZvk=;
        b=ht+mL8EDec/L3PgDQ5WMUMfMXgKm8odJ+OzDgyfYiOoXEy8XBPiVTnSp+WVCW4X2Ap
         35K6HOOdLs59nnKMwYLejnHGaNwrS+n8JbEU5EotRm/XQvonvv9OwR4Akq//IHeIiM6B
         4kavnz0ThZwp5B30FYt58rsUJ+dYFCCS4vN3YtBPebFVGhsVWHqjASsw4Sin8a3PVe0k
         z9QFwbmF2bBDzVUzqg7loSIwNC6jycplQlQTswwTmpPtZV7HJq0iinV1PYIl1VMXiXsZ
         3f426k7bYjpsBrAN/JfPmTD7t0l72usDeAHCc/m4yVVYh1uwg3uf/3reMPqKyH0xiBoU
         XpRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679660362;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8TOoc2P/covbfEozOoPRNxWEkdDXKymUtV6P3HpaZvk=;
        b=1bmTVGNebKM4DlBkvYHiHb+z7Leuy75J5ZYRDWe+i+bdoXvNg8LmrOWBt/q6hHIhse
         rmgCy0MkqlxDGxaAAKWnalaNx++X+qNck0BVLLYxAW/o0Ks/AeXk1TD/vDY92SDqkltc
         qGHCujhIUPuFs/j3/BFeX3xA6yLkiCcL7AKQDEOqzYtIX8ataN8NIt83NxWexykCbGDk
         I5YLAqNqm9hGR1jNa4H9JyrNokiLpXwjZxR4t8ZQnADhzH4hz621n0YgjcrYW2/JplFK
         JBVZxBUH7Drtlyx5rT8s/38oQjB6ZBKCVKVfAQLfnq1fV8JEQUc/Onvlt17IZpu5MhCX
         Y8Lg==
X-Gm-Message-State: AAQBX9eAh5W1651b9l3N4EsnKIKXBOGfg+T7gPvgoK0tZTx0NWpXrHAv
        /kLcD2+Tog/wbiYpOzzeKVjHgyjhiPU8QUZEFniDxQ==
X-Google-Smtp-Source: AKy350bGXLauoWAYWG/zSrBryz9Djw/9sFVdv4WxZI3ju9VN2EJ4JlLNZj1dNeRAti5yNPn+RQ/ueE++oNMsNk7PyT8=
X-Received: by 2002:a05:6902:102b:b0:b46:4a5e:3651 with SMTP id
 x11-20020a056902102b00b00b464a5e3651mr1171972ybt.9.1679660362119; Fri, 24 Mar
 2023 05:19:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230324001752.1768505-1-dmitry.baryshkov@linaro.org>
 <20230324001752.1768505-2-dmitry.baryshkov@linaro.org> <ZB1P7h0FdT66k/LG@hovoldconsulting.com>
In-Reply-To: <ZB1P7h0FdT66k/LG@hovoldconsulting.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 24 Mar 2023 14:19:10 +0200
Message-ID: <CAA8EJprw0kPZtbO22-TcMYy+cqyUZCbJdMvUoiXWbcWDPCe0Aw@mail.gmail.com>
Subject: Re: [PATCH 2/2] phy: qcom-qmp-pcie: sc8180x PCIe PHY has 2 lanes
To:     Johan Hovold <johan@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 24 Mar 2023 at 09:23, Johan Hovold <johan@kernel.org> wrote:
>
> On Fri, Mar 24, 2023 at 03:17:52AM +0300, Dmitry Baryshkov wrote:
> > All PCIe PHYs on sc8180x platform have 2 lanes, so change the number of
> > lanes to 2.
> >
> > Fixes: 94a407cc17a4 ("phy: qcom-qmp: create copies of QMP PHY driver")
>
> This is not the right fixes tag either. This should have been
>
> Fixes: f839f14e24f2 ("phy: qcom-qmp: Add sc8180x PCIe support")
>
> Should this also be backported (i.e. should you add a stable tag)?

Maybe, but it's not that important. We don't have corresponding DT
bits, so it seems not that urgent.

>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> > index d580f3d3e221..c95bf7ec2abe 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> > @@ -2193,7 +2193,7 @@ static const struct qmp_phy_cfg msm8998_pciephy_cfg = {
> >  };
> >
> >  static const struct qmp_phy_cfg sc8180x_pciephy_cfg = {
> > -     .lanes                  = 1,
> > +     .lanes                  = 2,
> >
> >       .tbls = {
> >               .serdes         = sc8180x_qmp_pcie_serdes_tbl,
>
> Johan



-- 
With best wishes
Dmitry
