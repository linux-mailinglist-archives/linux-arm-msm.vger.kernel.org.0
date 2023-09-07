Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6D79797ACD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Sep 2023 19:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245419AbjIGRte (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Sep 2023 13:49:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239531AbjIGRtP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Sep 2023 13:49:15 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1211C1BC7
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Sep 2023 10:48:53 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-402d0eda361so14613375e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Sep 2023 10:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694108915; x=1694713715; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FdAB2Jh5naeisydTV3u43XXNVH38AlgAr9dXqaut4m8=;
        b=jgFNX4j5w5BhR18K1fn7rqTbyCMwRZtKvPkJsa/QtP3N5H5zbVZ7vVCMYswqzhuM3U
         cj4i6WMRlmaZ0geODOfXZ7HQXLSkT1XQ3zSsiHmW5XmWkMVS4LEf1mm3fey6WwuLqHZ4
         S6VMlyKXie/gKrgWH+6v9RQUDQsSKB6fCdJCchzpsvRmreDKji6HWNFjL+eacd6Mo8NM
         qaS78IQKNtCNEpSNTCycQ2hF21j2djlUgLpNLsk/1GsYhYWLY+U/97Q4fL1jGqYWpcSf
         wz/o3fDjuNdgEWTN5e/6iKHoeSjIEfCIbW4E/kWQfkJOCWlu+wSCU1gyyZsE2zQ6gJHN
         TMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694108915; x=1694713715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FdAB2Jh5naeisydTV3u43XXNVH38AlgAr9dXqaut4m8=;
        b=hAQNsXdsmFSUwMIl+wi835HlY40byT3EdVQkOQ+GIRjZ3c0EuBLc4WoeV769btgQH0
         6Sy+2x9tlxUCPm0QQwHzoYTfgfowsOxL+FLS3iw24jS33ygSOQomrgmkY31KlgLVJsL9
         yv+oSRfV5HHy9JgR3PXXiM5Y6tFdQklFxR43+WexUwuVhYL9TtvUUSfgAwQNvTwBz99R
         1GDoawLGBl4OyoBpvOaOp91JHnHfhNI47+lF9Q3phoTxzVniCoqYWugxC/5GfmFRuCsg
         6vN82W7fJ2G0JrO5tYp2AFlwTP5O7le2IaVFLMJsJ3zZLAWSaQvGJ1zaUh9s5FAaeoQM
         JayA==
X-Gm-Message-State: AOJu0Yx/bDFwcn4xGLHs2uhrmC2ETnF5jWFO0sUrlp+vX/61w0Kbhan+
        PzEbMHjLkVcBPdD8tvVDn84xuXTxQJ2eUnBfqwE=
X-Google-Smtp-Source: AGHT+IFVw0hhgJ9cIVl3OyrJhRbiJmQ67lfQPapydSicLHG49QPh+uB3ol2Bh2Lb6O0nBJh4qYsOpA==
X-Received: by 2002:a5d:4441:0:b0:317:e04c:6791 with SMTP id x1-20020a5d4441000000b00317e04c6791mr4011818wrr.62.1694082564882;
        Thu, 07 Sep 2023 03:29:24 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k11-20020a5d6d4b000000b0031ad2663ed0sm22917456wri.66.2023.09.07.03.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 03:29:24 -0700 (PDT)
Date:   Thu, 7 Sep 2023 13:29:22 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] phy: qcom-m31: Fix error code in probe()
Message-ID: <4c60268a-0896-4ce8-8c9f-61ff520cc90a@kadam.mountain>
References: <7926c8e6-630e-4d7a-b0b2-d29b3c8b2c09@moroto.mountain>
 <20230907102405.GA7987@varda-linux.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230907102405.GA7987@varda-linux.qualcomm.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 07, 2023 at 03:54:05PM +0530, Varadarajan Narayanan wrote:
> On Thu, Sep 07, 2023 at 12:54:39PM +0300, Dan Carpenter wrote:
> > This accidentally returns the wrong variable.  It should be "qphy->vreg"
> > instead of "qphy->phy".
> >
> > Fixes: 08e49af50701 ("phy: qcom: Introduce M31 USB PHY driver")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > When we're adding new drivers then we should use the new driver
> > prefix instead of the subsystem prefix.  For example:
> >
> >  Bad: [PATCH] phy: qcom: Introduce M31 USB PHY driver
> > Good: [PATCH] phy: qcom-m31: Introduce M31 USB PHY driver
> >
> > That way it's obvious to the first person who sends a bugfix
> > what the driver prefix is.
> >
> >  drivers/phy/qualcomm/phy-qcom-m31.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/phy/qualcomm/phy-qcom-m31.c b/drivers/phy/qualcomm/phy-qcom-m31.c
> > index ed08072ca032..99d570f4142a 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-m31.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-m31.c
> > @@ -256,7 +256,7 @@ static int m31usb_phy_probe(struct platform_device *pdev)
> >
> >  	qphy->vreg = devm_regulator_get(dev, "vdda-phy");
> >  	if (IS_ERR(qphy->vreg))
> > -		return dev_err_probe(dev, PTR_ERR(qphy->phy),
> > +		return dev_err_probe(dev, PTR_ERR(qphy->vreg),
> >  						"failed to get vreg\n");
> >
> >  	phy_set_drvdata(qphy->phy, qphy);
> > --
> > 2.39.2
> 
> I believe this is addressed by https://lore.kernel.org/linux-arm-msm/20230824091345.1072650-1-yangyingliang@huawei.com/
> 

Ah, I normally look up these sorts of fixes using the following command
`elinks "http://lore.kernel.org/all/?q=${FUNC}`
before sending but Yang Yingliang's patch wasn't in the first page of
results so I missed it.

regards,
dan carpenter

