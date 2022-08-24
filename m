Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7724259FDDF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Aug 2022 17:07:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238257AbiHXPHM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Aug 2022 11:07:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237876AbiHXPHK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Aug 2022 11:07:10 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0C739858B
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Aug 2022 08:07:08 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id g189so1225719pgc.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Aug 2022 08:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc;
        bh=en5fJioWb1/tYEyOYyeymC+F2mSt5gCOg/3YQO22W/s=;
        b=kmCU1wRgOodNOCpDQZjRxGbuZn9IFI1hLbQdaa4sSq5wQ9RROkfwkRrG/Rp/8n83lb
         rc00wtM8LXLy9/SA2AIkJwV5ORHesIwyVxoK5HRzXziJETcKR23ORwxKipF1UGglYVpm
         mL1HEdU4h9uiX6F5dhtaz1Ni7e2FB/ZzORfCWPJKyrp4dlBaRfG4dXQdoEmS0VxSicRm
         Yyzdmn3iMplldGN2NooCN8di1J1LMBoBfuwEf+bmtdbZiXqgiGqWVkxSVAUzfVINE4z9
         /T6JsvjbjCVTszRlwuHZnaLWOX0s1uxD2ksoNU5+bez5Utccbtx+QyHUtlnMZq1tMbx7
         OLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=en5fJioWb1/tYEyOYyeymC+F2mSt5gCOg/3YQO22W/s=;
        b=sMAfc0ITBi2HsA02VHQsp0HK8Ven4mzj6sNCMQWnZ2UZCxTNUvKzFjV1oHh3tjbNTU
         OrXxEnJnXhxBB/R5TE/bMxsjLbV9FGeDai8oUesr1j7P1N5HWNrTiKQiuBrsV0dkJVxG
         g/zlz4iTFHECG6vOy+Kv/iDdlrh86ZfM0JcyW0ceN8dTJz/cCmtqGggd7hhXCr20BuhI
         aglADDTmAhCl6UosLm4xDXct17SDpGREiBUqdtNAt9vjVFyLEASf0l8z3b1ceY67YBdh
         fTM+cMQJw8ChNFdnAqI6OyqwRiKsrg84IwBbcumkFIdI7QHe4qkf+HvSghqOTpUi4Je7
         7wCw==
X-Gm-Message-State: ACgBeo2gL7Dv7h8PqtcDMr4NYF3p5ktr0tKp/79fW/d5/TGOnX1DUxha
        aMQxTR/iVxRkulw1AW0HtC5i
X-Google-Smtp-Source: AA6agR4I9qbzYAiGbI+cKiSPz6vV8dLS8BKWrwUL0WyVPYcNCgprOjlUILqDhdnHLbLF43532+mQ7w==
X-Received: by 2002:a65:6cc7:0:b0:42a:4d40:8dc1 with SMTP id g7-20020a656cc7000000b0042a4d408dc1mr19894592pgw.321.1661353628331;
        Wed, 24 Aug 2022 08:07:08 -0700 (PDT)
Received: from thinkpad ([117.207.24.28])
        by smtp.gmail.com with ESMTPSA id q4-20020aa79604000000b005367a03d566sm7673082pfg.112.2022.08.24.08.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 08:07:07 -0700 (PDT)
Date:   Wed, 24 Aug 2022 20:36:58 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v1 3/4] PCI: qcom: Setup PHY to work in RC mode
Message-ID: <20220824150658.GG4767@thinkpad>
References: <20220726203401.595934-1-dmitry.baryshkov@linaro.org>
 <20220726203401.595934-4-dmitry.baryshkov@linaro.org>
 <20220824145748.GF4767@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220824145748.GF4767@thinkpad>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 24, 2022 at 08:27:58PM +0530, Manivannan Sadhasivam wrote:
> On Tue, Jul 26, 2022 at 11:34:00PM +0300, Dmitry Baryshkov wrote:
> > Call phy_set_mode_ext() to notify the PHY driver that the PHY is being
> > used in the RC mode.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Thanks,
> Mani
> 
> > ---
> >  drivers/pci/controller/dwc/pcie-qcom.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > index 93d75cda4b04..f85f2579c087 100644
> > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > @@ -1485,6 +1485,10 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
> >  	if (ret)
> >  		return ret;
> >  
> > +	ret = phy_set_mode_ext(pcie->phy, PHY_MODE_PCIE, 0);
> > +	if (ret)
> > +		return err_deinit;

Oops... Missed this one. Should be goto err_deinit;

Thanks,
Mani

> > +
> >  	ret = phy_power_on(pcie->phy);
> >  	if (ret)
> >  		goto err_deinit;
> > -- 
> > 2.35.1
> > 
> 
> -- 
> மணிவண்ணன் சதாசிவம்

-- 
மணிவண்ணன் சதாசிவம்
