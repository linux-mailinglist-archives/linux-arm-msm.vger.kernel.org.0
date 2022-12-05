Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0BF4642844
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 13:20:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231574AbiLEMU2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 07:20:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbiLEMU1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 07:20:27 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D34F2F02E
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 04:20:25 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id 124so11206309pfy.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 04:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vid55BOGkVKUC6ugttNvlVPCmxI78SYJSflCKm2/2lo=;
        b=RwOkcT8DY8bHR4l7myzhYvnkTXGwsVR7F7ycfbwnoCpGhcyUpIUst/il59G+OA956Q
         XbYbBtV0El5ZEcvNcDjDh+6WNkJhq8jQBsRsNK8j9GXqLVUNryt3aI2K28Qw+iofwnz5
         gY0BHNZvXX16br9WauSHnjrBqHaW5eo2++yiUfHROwRj3FcHbz2DpU7HQY5u4Qn2ALGX
         B53ATSPsHv8Ewz/ah8EecL7WNGoIz4cPxCpPoOkHXH89mPwPwmxNJA7hc9f1hzV5DU6m
         8aii1lNXLN+m9OzgYk2cQrwXwF0uRUySVcDN06AsZdMzc8VgHZWobS8hbOJg3r4P2e81
         VQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vid55BOGkVKUC6ugttNvlVPCmxI78SYJSflCKm2/2lo=;
        b=IEshQ6n+QxQnPnTKJY/j5kYy8hwZWJ9z3wyJXuQknf9cgFb2cYawIQdsd9BHagvoqN
         vYCeLv9QUOvYHZlNKpyiD6vkKolXVmFTxfe3MwA5STTSw3QgBeF5izYyzOCkKzsw2C8D
         oM/c/XyJoKlm7bOgIp5KEND+LtMPprHGm8Cg/2hq0JIuusZg2YqvV5jXzvjc9nW2osae
         LBX9J9rSNzLHZAGj10C757Y0a6x0C2/BCSZ2XYMl9WrN/hVGaJFrCxRCjRb9Lmzi7mZl
         B7Kjk8CfFkWI7hHYCpStGfd6GxsEIVgCWwT6yvbfkxfAGeVrSrchUhgsoQ13hiiX/t9X
         morQ==
X-Gm-Message-State: ANoB5pm/SIg5c2YMJ/IldK3mPHM4hdutpQ1wsQUXiJzn5FJgSG1dx5zj
        5SehSAom7ER8Dc5IwGEQ9mXv
X-Google-Smtp-Source: AA0mqf7fbJzRKUmWsG4BnD+ZT4Whr1kbgIOdUPfXz2ApiKpUMLnQoLrjVr+5P0Fkgu4J9S4iYepfmQ==
X-Received: by 2002:a63:5f83:0:b0:478:ab05:4da9 with SMTP id t125-20020a635f83000000b00478ab054da9mr6863980pgb.369.1670242825289;
        Mon, 05 Dec 2022 04:20:25 -0800 (PST)
Received: from thinkpad ([59.92.98.136])
        by smtp.gmail.com with ESMTPSA id ca12-20020a17090af30c00b0020bfd6586c6sm9093073pjb.7.2022.12.05.04.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 04:20:24 -0800 (PST)
Date:   Mon, 5 Dec 2022 17:50:18 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bart Van Assche <bvanassche@acm.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: ufs: qcom: allow 'dma-coherent' property
Message-ID: <20221205122018.GC20192@thinkpad>
References: <20221205100837.29212-1-johan+linaro@kernel.org>
 <20221205100837.29212-2-johan+linaro@kernel.org>
 <20221205115906.GA20192@thinkpad>
 <Y43e9KRDsTCS5VI4@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y43e9KRDsTCS5VI4@hovoldconsulting.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 05, 2022 at 01:07:16PM +0100, Johan Hovold wrote:
> On Mon, Dec 05, 2022 at 05:29:06PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Dec 05, 2022 at 11:08:36AM +0100, Johan Hovold wrote:
> > > UFS controllers may be cache coherent and must be marked as such in the
> > > devicetree to avoid data corruption.
> > > 
> > > This is specifically needed on recent Qualcomm platforms like SC8280XP.
> > > 
> > > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > > ---
> > >  Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> > > index f2d6298d926c..1f1d286749c0 100644
> > > --- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> > > +++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> > > @@ -44,6 +44,8 @@ properties:
> > >      minItems: 8
> > >      maxItems: 11
> > >  
> > > +  dma-coherent: true
> > > +
> > 
> > This property is not applicable to all SoCs. So setting true here will make it
> > valid for all.
> 
> Yes, it would be a valid, but it will only be added to the DTs of SoCs
> that actually require it. No need to re-encode the dtsi in the binding.
> 

But if you make a property valid in the binding then it implies that anyone
could add it to DTS which is wrong. You should make this property valid for
SoCs that actually support it.

Thanks,
Mani

> Johan

-- 
மணிவண்ணன் சதாசிவம்
