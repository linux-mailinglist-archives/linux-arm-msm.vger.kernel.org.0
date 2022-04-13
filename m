Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C85FF4FECD1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Apr 2022 04:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbiDMCXe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 22:23:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbiDMCXd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 22:23:33 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D007A25286
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 19:21:13 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id a19so682981oie.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 19:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MsG3W3NlwKbTx9r7ueE6NBTZ86QigySMV6+0aM5nDrY=;
        b=TEsi4mHvLpdfwU8kMTqIx5nnRggSLXwj0f80jPSfVmniD1jWs/0wGVpOUSDNsOzvcN
         nXq7lFRtjWrkOxf8icP+3rJO3oks8FYjRB7l5PsxriD8nWzV7dXLZf+MiGIl9/OghNRE
         ivp98vMiDtT23qYRQ5qrJeJd7sBvFohE6bAfUHpp48Woo6hbXIPbklv2/dm+ehrOcHz1
         wxsEPGCduzF1TP9vdLYjByj1pxXNfyKBohjcf85v6izdIpo4EzP47rDJMIQfL3ldUld2
         VZ7RvlQ8x829MKKkLVSD5ZqUkRN+FMNueHKzu6bHMJOh4Ay0j9Rnl0mju8ckHNbQOQby
         /R+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MsG3W3NlwKbTx9r7ueE6NBTZ86QigySMV6+0aM5nDrY=;
        b=7jEIp30zhwnWREVfWEnk0EZATK7pGzC1mTZamRl6c2mzl4EhCtb5utbAMTBkzsryu4
         dN4ADvIKXrCmyLMVnhOxkHtaIU345QXa5sdSrOX6/J8ZodCIZD4YE2gyn/AXcHsoBCsD
         3h88hTbAqdWJe7AToDKkr5KptHZMRF+0CKMI0mLsn3pSsvSHxFS0g4FCXECp5h4SeUnN
         6yIBFQTkrzswsXnJycG801JeT/R/7/h/sm9AfvBhneSp9HoptOxsjsaXxYDsF1EYWqav
         AYTzdhOzPZsUN/5Zr3KrgGgMBuakS1bZjXkoci7A/S7vmA5GU/H6dJn67z2hOeoL+PQ/
         6afg==
X-Gm-Message-State: AOAM5325xiwuII5PCSZr2osg4C1ygpcZENHEBp/dUTghzk9XatMDLqBT
        b72nmlcEGLk+Zs3tZzYlttwpZA==
X-Google-Smtp-Source: ABdhPJxeyTum5SSAXay6qkE8OWmXy8X4yEVnWqYHuQPg2P5M6Mu7oDLECkM7tnVLmogTF4J3KB+9Zw==
X-Received: by 2002:a05:6808:1152:b0:2da:c7f:66c2 with SMTP id u18-20020a056808115200b002da0c7f66c2mr3195249oiu.253.1649816473192;
        Tue, 12 Apr 2022 19:21:13 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id e9-20020aca3709000000b002ed1930b253sm13146569oia.30.2022.04.12.19.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 19:21:12 -0700 (PDT)
Date:   Tue, 12 Apr 2022 21:21:10 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: defconfig: Enable Qualcomm GPI DMA Driver
Message-ID: <YlYzlmlKUAOBna4A@builder.lan>
References: <20220225044033.1376769-1-vkoul@kernel.org>
 <YhhwEaPdyUcHBL+V@builder.lan>
 <Yhhywyf2ms44Lec2@matsya>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yhhywyf2ms44Lec2@matsya>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 25 Feb 00:10 CST 2022, Vinod Koul wrote:

> On 24-02-22, 23:58, Bjorn Andersson wrote:
> > On Thu 24 Feb 22:40 CST 2022, Vinod Koul wrote:
> > 
> > > Qualcomm GPI DMA Driver is used for DMA transfers for Serial engines
> > > like Geni I2C and SPI.
> > > 
> > > Enable this dma driver
> > > 
> > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > > ---
> > > 
> > > Changes in v2:
> > >  - As dicussed with Bjorn GPI DMA is used by Serial engines SPI/I2C so we
> > >    can make this a module rather than inbuilt
> > > 
> > >  arch/arm64/configs/defconfig | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > > index 30516dc0b70e..d73913f082d7 100644
> > > --- a/arch/arm64/configs/defconfig
> > > +++ b/arch/arm64/configs/defconfig
> > > @@ -948,6 +948,7 @@ CONFIG_PL330_DMA=y
> > >  CONFIG_TEGRA20_APB_DMA=y
> > >  CONFIG_TEGRA210_ADMA=m
> > >  CONFIG_QCOM_BAM_DMA=y
> > > +CONFIG_QCOM_GPI_DMA=y
> > 
> > Would you like me to change this to =m as I apply the patch, just to
> > make it match changelog? ;)
> 
> :(
> 
> Crap, looks like i forgot to add and did the amend, would be great if
> you can, or I can send a v3...

I concluded that you didn't send v3, so I fixed this and applied it.

Thanks,
Bjorn

> 
> -- 
> ~Vinod
