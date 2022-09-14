Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 660335B8148
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Sep 2022 08:05:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbiINGFT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Sep 2022 02:05:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229999AbiINGFN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Sep 2022 02:05:13 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECDA019281
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 23:05:08 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id 78so13364858pgb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 23:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date;
        bh=/X/hrxEDXB1FnKpdmfp7H1uqteANRjGF7Msi8LITKs8=;
        b=yavRiXiUwVngjIdqB7RYjjqmbN/ayKQYaDiL9lMsMV36dKDHb+pr1C+57QxwPhumjF
         hsoeGPPCMncKy8OWuh1MI5HfZgvKATOFnzdeUaBOwQqX2YqNDbHlrUJwuFbc8+yEAdAg
         +60nyW0wnDrtqYX5Emuvww4D2O2eg4w++u6Cy7HTdSxxctpY7TVpbxCpNImFuSNDrfcG
         OM+4bFoAzHUYE/8CR4hb3rxdO6Qq4OCd2ZNskR1HyRlPw+xZ5ycJxRoDfG15lyNNmYBj
         mc5fAuY9H2R7kySwyZGbf035NG0f0TG0le2H/Gd+zjyqN4UAfZz39h1QYHdSIrWQLKXx
         sbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=/X/hrxEDXB1FnKpdmfp7H1uqteANRjGF7Msi8LITKs8=;
        b=Oo85HuczKT5dfbnt5+wSAI9/ja0oOBqT45OsZfB0r0UTZtLCvHetWo0Pj9NmCbv3YH
         mmQ0DNBGElbYsfYDT6jTp0xyBM1oOr3WzcUavOSCIGTOJDCLElVwLOqDaV2E/l89Szdf
         axBRekwLha4WlSMFltgBAqLkPJb9TlFy0eqkAtf6+oaBG9dn2tCCRoENAUMCU7GKltvh
         PYwC57zwFDfieHgkvBnzSreGDUdPf4YhwuepPqB0GovxUirhm9zsoKSYSWoTHabuIWSV
         83yj23RBfJQSzBOvsvyfubTDSUF7Cg6G8YXTJxkbkrrIlmh+IdYMH2V3ikO9iPuZUZHl
         7M7Q==
X-Gm-Message-State: ACgBeo1wm8J2ekkqLbXF0pFPNiNHldy0pxdqjFRkHcwXDMr5bOEXVLls
        v2044lj1eLixbvued84Mp+4R
X-Google-Smtp-Source: AA6agR78bMrG8NvKJqeIisp/zzSqAl0jm+XL3mkWM+Gx9ibtrIqvRV3J8lWwtNAn2bvA4WfbHLuOig==
X-Received: by 2002:a63:201c:0:b0:434:8bd6:87e1 with SMTP id g28-20020a63201c000000b004348bd687e1mr31227271pgg.394.1663135507897;
        Tue, 13 Sep 2022 23:05:07 -0700 (PDT)
Received: from workstation ([117.202.184.122])
        by smtp.gmail.com with ESMTPSA id d4-20020aa797a4000000b0053e3a6f7da4sm9285174pfq.12.2022.09.13.23.05.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Sep 2022 23:05:07 -0700 (PDT)
Date:   Wed, 14 Sep 2022 11:35:02 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     lpieralisi@kernel.org, robh@kernel.org, andersson@kernel.org,
        kw@linux.com, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@linaro.org
Subject: Re: [PATCH v3 02/12] PCI: qcom-ep: Do not use hardcoded clks in
 driver
Message-ID: <20220914060502.GB16459@workstation>
References: <20220910063045.16648-3-manivannan.sadhasivam@linaro.org>
 <20220913201256.GA620427@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913201256.GA620427@bhelgaas>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 13, 2022 at 03:12:56PM -0500, Bjorn Helgaas wrote:
> On Sat, Sep 10, 2022 at 12:00:35PM +0530, Manivannan Sadhasivam wrote:
> > Generally, device drivers should just rely on the platform data like
> > devicetree to supply the clocks required for the functioning of the
> > peripheral. There is no need to hardcode the clk info in the driver.
> > So get rid of the static clk info and obtain the platform supplied
> > clks.
> 
> Possibly reword the subject line to say what this does instead of what
> it does not do?  E.g., "Rely on devicetree 'clock-names' instead of
> hard-coding" or whatever.
> 

Okay.

Thanks,
Mani

> Bjorn
