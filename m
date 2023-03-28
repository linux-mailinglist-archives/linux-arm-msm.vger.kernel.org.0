Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADA2F6CBB82
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Mar 2023 11:51:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233029AbjC1JvN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 05:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230250AbjC1Juf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 05:50:35 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2401A6EAC
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 02:50:16 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id q206so6820471pgq.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 02:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679997016;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=savA42+t30mTd9rOjIgnp5RGjWHZtgVT9nH0jQI5MeU=;
        b=Z2MdKaFIakeP5bVLEtuQ/us2JLrUJZEGjx1QY2SUyJzAU1+gJoezn/+zJm27rwIt1S
         8JzW5WpiJbp/o95EljAyyw6k0rNcjZ1nYMu4i03LDW8uKODSa/feaZX7sYkEqiw3b877
         fwIBHfxMaEqMzjOKIibe+LCgM3vDE6nBVDMLy05lDUjWuzSx3ycvIzxal/tgSmPAKpeL
         HXYamUkVgJ3gI6CwppqN7qbloUyI7uSqEBkDSWkDxRiyhOLWWgLLYrQDoiTd0fCL1lyU
         jY7lNZwmDKRM8E11tG+8e7Jdy9oS3HxKdTRCcHFWYr4KJd/SVHhooLNWMBEhlBwPn5KF
         6/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679997016;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=savA42+t30mTd9rOjIgnp5RGjWHZtgVT9nH0jQI5MeU=;
        b=uGRrH1hp9JzTMLgSkPQLpOOG96abHVJgYiz3rIY4D40vc0W4RFtGCgeZettALDMWR5
         eQ8CsNRtdy3t/Kmvc3I5NGz8cHjxCltbHU8NNxNh/A4mBIjKnBOK2Rv9uKxd6NiAS4ap
         A0QCX2yMpTbiNrRI54hKna0QwvHjdC9EomCiG86EmLoLhaosdA36Tubw9fgVlpWbD4Pp
         o7t/BEf/VK+lFtJP2gfbxjiRa/MK1buz9TpYRRqX0r8zZD1NTYjzoYKjfRZ4uMjdxlxH
         5Zh1M6C5bXzOHwrAyUiHQ3lwxN+1fKGQmRjPurpCt4rbHJL71UfJGD3ve5rbJXxk0HN4
         tynQ==
X-Gm-Message-State: AAQBX9ek+0pHgODBPdxUi7I8An20xS0iUMFRw6q6Ge6obNAKIOf62WFJ
        riPIb0tbNqQ9W/svxNavLres
X-Google-Smtp-Source: AKy350ZYmbuWMEQRc+4NP1mt32BUkgR6DbHCPdiXkQ6eZdQJM+4FyDHCLgrMUvJGdj40W9b61JYQpA==
X-Received: by 2002:aa7:9402:0:b0:62b:107d:c3cb with SMTP id x2-20020aa79402000000b0062b107dc3cbmr12149943pfo.33.1679997016151;
        Tue, 28 Mar 2023 02:50:16 -0700 (PDT)
Received: from thinkpad ([117.202.191.80])
        by smtp.gmail.com with ESMTPSA id d1-20020aa78141000000b0062608a7557fsm20702468pfn.75.2023.03.28.02.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 02:50:15 -0700 (PDT)
Date:   Tue, 28 Mar 2023 15:20:09 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     andersson@kernel.org, Thinh.Nguyen@synopsys.com,
        gregkh@linuxfoundation.org, mathias.nyman@intel.com,
        konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 4/5] usb: dwc3: qcom: Clear pending interrupt before
 enabling wake interrupt
Message-ID: <20230328095009.GC5695@thinkpad>
References: <20230325165217.31069-1-manivannan.sadhasivam@linaro.org>
 <20230325165217.31069-5-manivannan.sadhasivam@linaro.org>
 <ZCKzQA1YhXQ/6n3L@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCKzQA1YhXQ/6n3L@hovoldconsulting.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 28, 2023 at 11:28:32AM +0200, Johan Hovold wrote:
> On Sat, Mar 25, 2023 at 10:22:16PM +0530, Manivannan Sadhasivam wrote:
> > It is possible that there may be a pending interrupt logged into the dwc IP
> > while the interrupts were disabled in the driver. And when the wakeup
> > interrupt is enabled, the pending interrupt might fire which is not
> > required to be serviced by the driver.
> > 
> > So always clear the pending interrupt before enabling wake interrupt.
> > 
> > Cc: stable@vger.kernel.org # 5.20
> > Fixes: 360e8230516d ("usb: dwc3: qcom: Add helper functions to enable,disable wake irqs")
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/usb/dwc3/dwc3-qcom.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> > index bbf67f705d0d..f1059dfcb0e8 100644
> > --- a/drivers/usb/dwc3/dwc3-qcom.c
> > +++ b/drivers/usb/dwc3/dwc3-qcom.c
> > @@ -346,6 +346,8 @@ static void dwc3_qcom_enable_wakeup_irq(int irq, unsigned int polarity)
> >  	if (!irq)
> >  		return;
> >  
> > +	irq_set_irqchip_state(irq, IRQCHIP_STATE_PENDING, 0);
> > +
> 
> This looks like a hack (and a layering violation). Note that there are
> no other non-irqchip drivers calling this function.
> 

I can check if this can be achieved by clearing some dwc specific registers.

- Mani

> >  	if (polarity)
> >  		irq_set_irq_type(irq, polarity);
> 
> Johan

-- 
மணிவண்ணன் சதாசிவம்
