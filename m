Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A39F34B44DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Feb 2022 09:50:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242314AbiBNIuN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Feb 2022 03:50:13 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233183AbiBNIuM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Feb 2022 03:50:12 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41F5F5F279
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 00:50:04 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id f6so7073152pfj.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 00:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Iy4s+sH4IijtoXttifBEvscv0QbXaesAxYnXzr5xIco=;
        b=UiSqg5nEGEYUdC8/j2+pP2pBJraqro5uN50BO1QvB2QndJyh/6BLtJ7WQz+Mx71yAp
         vxVo6mIt6SWHpLdFQghE81u42xhJ62dEY6+LVHnFltVzKr5JLAJC8jXRvcxDbnXoO/6r
         zsLLGgeSdBselyZchNtMHIwypkFXHLeVhkJSEEYnQbf42ieeKyuE99vgj2g8RCAspLx7
         P1bsG8IASe9eO/6hwaegBh/VEik8sXiJPfWUp2mUZre5XFkezUF/kfNwIFIDXL8mFZX2
         gUSVI3hccS4hjubpoUOmcnyd1O3owCk1SHQfSYP+jyq72N+xHdJD3Q9l7oeoY9EY2pMM
         /1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Iy4s+sH4IijtoXttifBEvscv0QbXaesAxYnXzr5xIco=;
        b=bLys13jnKa6THFQeQeQ/xfDZ7zmsGG7nWPzY9eA0ifCfDAMN9s5KOlpJ5j+a5wrd8C
         wJusq6GcQ25QDggkIltwYfISFIFyR/j1ZqC0GLgrvL/b/9AF5WRS89ldgmPREsKOt1mj
         eTJusEYKPEYGecnYNtGMx9cNewkZeQHnhoXVvHydNXwkB16mvnfFc6nZeaud2deW8UuY
         upx4pp7xV6MA37NSQJy2ZC0cdHpy1DzKscP1D1xSHAHDE5T6Ok/f3PA9P26QuZ+VnSLS
         idI2v8l64sjWziW5K+ZnRQ8rEXQmERa3x8m5nXlKqQy8rL49+/YzlsqPSSuLjb/oaACn
         s/Sw==
X-Gm-Message-State: AOAM532F+urtcKbhSkRhZFXaz5CyjKY5f52XEM6yH+LLpkGaj9b/TD31
        pe0ONN40N1AkdNOWbxwGHFl6/a/lfKUKJfY=
X-Google-Smtp-Source: ABdhPJzDId7et9KmPWwuqiCL+6zIlpobDnaYfXKOR7zZwfofxC8JPnCWCpmbzmg6aLyM83B2vkoHHQ==
X-Received: by 2002:a65:6090:: with SMTP id t16mr10730170pgu.323.1644828603709;
        Mon, 14 Feb 2022 00:50:03 -0800 (PST)
Received: from thinkpad ([2409:4072:817:5a6f:3104:62c0:1941:5033])
        by smtp.gmail.com with ESMTPSA id om1sm13688419pjb.55.2022.02.14.00.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 00:50:03 -0800 (PST)
Date:   Mon, 14 Feb 2022 14:19:57 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] mailbox: qcom: Add support for SDX65 APCS IPC
Message-ID: <20220214084957.GH3494@thinkpad>
References: <1644821755-27059-1-git-send-email-quic_rohiagar@quicinc.com>
 <20220214083409.GB3494@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220214083409.GB3494@thinkpad>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 14, 2022 at 02:04:14PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Feb 14, 2022 at 12:25:55PM +0530, Rohit Agarwal wrote:
> > In SDX65, the IPC bits are located in the APCS GCC block. Also, this block
> > can provide clock functionality. Hence, add support for IPC with correct
> > offset and name of the clock provider.
> > 
> > Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Thanks,
> Mani
> 
> > ---
> >  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> > index 9325d2a..3f8612c 100644
> > --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> > +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> > @@ -53,6 +53,10 @@ static const struct qcom_apcs_ipc_data sdx55_apcs_data = {
> >  	.offset = 0x1008, .clk_name = "qcom-sdx55-acps-clk"
> >  };
> >  
> > +static const struct qcom_apcs_ipc_data sdx65_apcs_data = {
> > +	.offset = 0x1008, .clk_name = "qcom-sdx65-acps-clk"
> > +};
> > +

After looking at patch 7/8, I think we should be able to reuse
"qcom-sdx55-acps-clk" for SDX65.

Thanks,
Mani
> >  static const struct regmap_config apcs_regmap_config = {
> >  	.reg_bits = 32,
> >  	.reg_stride = 4,
> > @@ -159,6 +163,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
> >  	{ .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
> >  	{ .compatible = "qcom,sm6115-apcs-hmss-global", .data = &msm8994_apcs_data },
> >  	{ .compatible = "qcom,sdx55-apcs-gcc", .data = &sdx55_apcs_data },
> > +	{ .compatible = "qcom,sdx65-apcs-gcc", .data = &sdx65_apcs_data },
> >  	{}
> >  };
> >  MODULE_DEVICE_TABLE(of, qcom_apcs_ipc_of_match);
> > -- 
> > 2.7.4
> > 
