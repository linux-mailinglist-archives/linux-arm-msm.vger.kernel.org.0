Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67B4D6BB4BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Mar 2023 14:32:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231766AbjCONcU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 09:32:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231374AbjCONcT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 09:32:19 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F03F94751
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 06:31:41 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id 6-20020a17090a190600b00237c5b6ecd7so1823166pjg.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 06:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678887099;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1umFQFep3VeRVxL/2QOHz0Xbwyv0Y2jIwYRUg9n+RZQ=;
        b=t9FZ0nqkNjZnpc+EfAhhcqfUHyiyD9NGbxd/eUMt9Vj3g+hrbja3xu9dShgvH+V5Kx
         ik0q4c8kYpW4deQsZ7oakqtpCskXxm++Z4dd9lJB3H30j5Z/+f+3xO917fTZ7pt2596H
         L+HrLR76LRlmE2s7iQXofBhmDkurDEhfs6shvl3CNiwikXMYkN+OFXMdqI6UxBIfSX0W
         jVEPSsmiKVGDMb2++cTsgCc8KOQwfO3XlBAaXcGJwX1HUFOO8hTmF8J8M+EqWOd3kq3h
         SO8GzLknSMq3WmFCpr2X9FwUANgvLgHm4FZUUckI8VlceY7Tb5PoCaNEzr9AeatsEhvb
         08ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678887099;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1umFQFep3VeRVxL/2QOHz0Xbwyv0Y2jIwYRUg9n+RZQ=;
        b=u45eGjr5dHbiQVPf1MgmpSYLKILMnLU0s3L3hbU/SUPzdXQzON9sztFV9rp8cMVMGw
         Yx9i5bgjW0rUdSzAgO8/z74OteKjNk8b0m+DYvWPmsMsT/9LJt9fHEUXKgjl/5v5bqy8
         cqPEP1GchE4EUu3+wB2IwXoZ05U+C9ZqrSAPKiORbG8zxbaF1C+k0SivzHAW99sYfHwI
         V26QbcXiNSPnVtUptEr2JJQ4Chpb+4VD2zvDOzhqJTxv7v9SnKW+E/Pe1oB2xvlBVV/x
         9NAqP+1ttj4ATDzCC2p2bAKZX2ayy8qiMGnSmjn/nt5/3Du83Ujngq/mux0smYgjFPCa
         GUwg==
X-Gm-Message-State: AO0yUKVfu4ciUdfe2DvzvGMRQHufvN98dS7Zgmnl2CZe2K/962jOkmjQ
        QE9qXnqXDIxf/CjWfnL0hVpt
X-Google-Smtp-Source: AK7set/6pkkXcPa9ad9aqSnFLR9LabDIdkMEszn3dlthApizssp7HnhLd8f1ZJld9zC7ttt36nGrwA==
X-Received: by 2002:a17:902:9887:b0:1a0:49eb:4c8c with SMTP id s7-20020a170902988700b001a049eb4c8cmr2293357plp.0.1678887098585;
        Wed, 15 Mar 2023 06:31:38 -0700 (PDT)
Received: from thinkpad ([117.207.30.24])
        by smtp.gmail.com with ESMTPSA id kz13-20020a170902f9cd00b0019f3da8c2a4sm3673054plb.69.2023.03.15.06.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 06:31:37 -0700 (PDT)
Date:   Wed, 15 Mar 2023 19:01:23 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     andersson@kernel.org, lpieralisi@kernel.org, kw@linux.com,
        krzysztof.kozlowski+dt@linaro.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_srichara@quicinc.com
Subject: Re: [PATCH v4 05/18] PCI: qcom: Use lower case for hex
Message-ID: <20230315133106.GA98059@thinkpad>
References: <20230315064255.15591-1-manivannan.sadhasivam@linaro.org>
 <20230315064255.15591-6-manivannan.sadhasivam@linaro.org>
 <6425fcb2-2ce9-0986-ed28-64717dee240a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6425fcb2-2ce9-0986-ed28-64717dee240a@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 15, 2023 at 11:34:13AM +0100, Konrad Dybcio wrote:
> 
> 
> On 15.03.2023 07:42, Manivannan Sadhasivam wrote:
> > To maintain uniformity, let's use lower case for representing hexadecimal
> > numbers.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> To be fair, preprocessor defines are the only place where uppercase
> hex is widely used
> 

I perfer lower hex all over the driver and in this case, I also want to match
what is being done for pcie-qcom-ep so that it helps me in maintaining both
drivers.

Thanks,
Mani

> Konrad
> >  drivers/pci/controller/dwc/pcie-qcom.c | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > index 926a531fda3a..4179ac973147 100644
> > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > @@ -39,17 +39,17 @@
> >  #define PARF_PCS_DEEMPH				0x34
> >  #define PARF_PCS_SWING				0x38
> >  #define PARF_PHY_CTRL				0x40
> > -#define PARF_PHY_REFCLK				0x4C
> > +#define PARF_PHY_REFCLK				0x4c
> >  #define PARF_CONFIG_BITS			0x50
> >  #define PARF_DBI_BASE_ADDR			0x168
> > -#define PARF_SLV_ADDR_SPACE_SIZE_2_3_3		0x16C /* Register offset specific to IP ver 2.3.3 */
> > +#define PARF_SLV_ADDR_SPACE_SIZE_2_3_3		0x16c /* Register offset specific to IP ver 2.3.3 */
> >  #define PARF_MHI_CLOCK_RESET_CTRL		0x174
> >  #define PARF_AXI_MSTR_WR_ADDR_HALT		0x178
> > -#define PARF_AXI_MSTR_WR_ADDR_HALT_V2		0x1A8
> > -#define PARF_Q2A_FLUSH				0x1AC
> > -#define PARF_LTSSM				0x1B0
> > +#define PARF_AXI_MSTR_WR_ADDR_HALT_V2		0x1a8
> > +#define PARF_Q2A_FLUSH				0x1ac
> > +#define PARF_LTSSM				0x1b0
> >  #define PARF_SID_OFFSET				0x234
> > -#define PARF_BDF_TRANSLATE_CFG			0x24C
> > +#define PARF_BDF_TRANSLATE_CFG			0x24c
> >  #define PARF_SLV_ADDR_SPACE_SIZE		0x358
> >  #define PARF_DEVICE_TYPE			0x1000
> >  #define PARF_BDF_TO_SID_TABLE_N			0x2000
> > @@ -60,7 +60,7 @@
> >  /* DBI registers */
> >  #define AXI_MSTR_RESP_COMP_CTRL0		0x818
> >  #define AXI_MSTR_RESP_COMP_CTRL1		0x81c
> > -#define MISC_CONTROL_1_REG			0x8BC
> > +#define MISC_CONTROL_1_REG			0x8bc
> >  
> >  /* PARF_SYS_CTRL register fields */
> >  #define MAC_PHY_POWERDOWN_IN_P2_D_MUX_EN	BIT(29)

-- 
மணிவண்ணன் சதாசிவம்
