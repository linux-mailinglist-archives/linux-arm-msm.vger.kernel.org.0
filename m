Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D79359EAEB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Aug 2022 20:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230294AbiHWSZl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Aug 2022 14:25:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232834AbiHWSZ0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Aug 2022 14:25:26 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE4077E01A
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 09:42:55 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id 73so12742969pgb.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 09:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=CiTVAMBmeZgTNns54/ZRjjMIll+fZRM35ET0N/iSCew=;
        b=gM9QSsTQkKhWzpfwX/ZmC9QIytz881CKpNrrJlXiSi70CtWBcfBGdCBmHaLM2eWszH
         FK+bdgBu9fnF6/omQ5DvDr/CNzqUfLnL3lM7LHAVyiHcQCRltHkopFIcHkRarM3g/s+7
         Q86Y/S49n0krQ2Bl+DoWxWEtpo0Xu18WStexI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=CiTVAMBmeZgTNns54/ZRjjMIll+fZRM35ET0N/iSCew=;
        b=D1HrzUZeRCYNb/jlE0ZeQizaLSHbm5ldJUJrdlyktfijGnyHg1v0PRNddMNnhWAXI4
         EEK6qa4k2JkWIFokoaNH/tAqAQnEzyT/zvzPTNpK39zqj9jhH0HCumdR/+ORj9bIevDZ
         qv2ILx9sY1w+ZgN+f8F3QPenP9fIFNc/ELgsP1LyCIbTfCcYb8HYGIVqk4Phzjv/wzhu
         HvS6kRAG6mhJ+ZdDGt01W0L6s7WfoEROsUiUD8RMYjd5Ft165Fkdk7clEYC/lP9CYbgd
         fPlZZTAr6WBM4r/u5678RnjCc0A5awBGGCdqhGixS0hW43cT+fDDBa5BGkFA9jYEf25y
         ahVQ==
X-Gm-Message-State: ACgBeo3vOlF+DU8rb1IKPt5Yj02e14uLjZMNI7mPkLIkcTjugyYDwBoz
        eG7xmYdbuyU0rywIixRHsQRf5w==
X-Google-Smtp-Source: AA6agR4b+B+CmYuZ7X6Ph1GzceiQelM5K4w7fEKztUhStEjaw1yKzCRdAdoek0y/fzvxtiqc0Ej1dA==
X-Received: by 2002:a05:6a00:35c3:b0:536:ab9f:ceca with SMTP id dc3-20020a056a0035c300b00536ab9fcecamr9635768pfb.37.1661272975462;
        Tue, 23 Aug 2022 09:42:55 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:fee6:a961:5d1d:553])
        by smtp.gmail.com with UTF8SMTPSA id p4-20020aa79e84000000b00535fd0cb58bsm9425178pfq.111.2022.08.23.09.42.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 09:42:55 -0700 (PDT)
Date:   Tue, 23 Aug 2022 09:42:53 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/2] clk: qcom: gcc-sc7280: Keep USB GDSC power domains
 on when USB wakeup is enabled
Message-ID: <YwUDjaG6n95Ddij2@google.com>
References: <20220822115246.1.I45235b7c40997bc2abf813e4722b4dcdd6aecf6b@changeid>
 <20220822115246.2.If09027f73daa6e1ed95f5eab02326b543c67132e@changeid>
 <YwS3FCOqIeajMEgz@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YwS3FCOqIeajMEgz@hovoldconsulting.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 23, 2022 at 01:16:36PM +0200, Johan Hovold wrote:
> On Mon, Aug 22, 2022 at 11:53:11AM -0700, Matthias Kaehlcke wrote:
> > Set GENPD_FLAG_ACTIVE_WAKEUP for the USB GDSC power domains of SC7280.
> > 
> > Suggested-by: Johan Hovold <johan+linaro@kernel.org>
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> > 
> >  drivers/clk/qcom/gcc-sc7280.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
> > index 7ff64d4d5920..4ff855269467 100644
> > --- a/drivers/clk/qcom/gcc-sc7280.c
> > +++ b/drivers/clk/qcom/gcc-sc7280.c
> > @@ -3125,6 +3125,7 @@ static struct gdsc gcc_usb30_prim_gdsc = {
> >  	.gdscr = 0xf004,
> >  	.pd = {
> >  		.name = "gcc_usb30_prim_gdsc",
> > +		.flags = GENPD_FLAG_ACTIVE_WAKEUP,
> 
> Have you verified that the power-domain doesn't need to remain on also
> when USB isn't used for wakeup?

So far I haven't observed issues with this on sc7180 and sc7280 when USB
wakeup is disabled.

> This is the case for sc8280xp and indicates that there are further
> missing pieces here (at least for that platform).

What are you observing on sc8280xp when wakeup is disabled?
