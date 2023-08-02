Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E060176C501
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 07:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231936AbjHBFuF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 01:50:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230362AbjHBFuE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 01:50:04 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 244BF1704
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Aug 2023 22:50:03 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-686f38692b3so6209427b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Aug 2023 22:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690955402; x=1691560202;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dJviXEolxDsHscNjJ89nMsWSR/pVTtDnuSmhYDnoX4A=;
        b=BKe9GEyzvb8YtpahAAWJSeYsdv3ZUUlAIlJ9J8BrNBy102qGUmj/NnozyHRuJ00zeg
         qN7Rv2GRTW6QtCydqCufj5+2YffuNZ39A+TEcFp4qkfTj5c20D6uNGJbc0nqpORCScAA
         Lrfa6wOBb0Z0iukec0fdtiyuyBYTAvePudz1460SM28xkZmUiiYyw2ltLRo9pS22kmGa
         NSOPKta7jjqdKdHuIBjG6r7rCYhXbMaed3UdCVe3py2q3lTR9lASYpcziJMqcqo0sVFe
         D6IbEJl2U2XCivjbCLyiv/VdTBnl2zR2Jlphs0mrRhzhfnoy+EJrzJHz1IGHpdQL0iUa
         5IbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690955402; x=1691560202;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dJviXEolxDsHscNjJ89nMsWSR/pVTtDnuSmhYDnoX4A=;
        b=ZXzjVnWGW/QusR3dQP+gnzB5/GmZnK1iSmN+QtGLXD9fwgENgrbL0DkN9w53yKIoKS
         7GTGBskZfKdfAMsn7JiDo2A7C0KvQHD9po0L8ZWGmWaPK4RfzDHuUHGjSvFctiIZLBA5
         Cti/pDSVK8XxXXtGrSoaXaJYyLqknBmrTR7i7+wXkWhzGiR8L12gLG5NSZenSg66eGk/
         xVUo6LlWOuNZbprnkvZFFiD7TRDt6hfL3UALqUd6+hcIL/be5KkV0nGHbRX4slIVuEh+
         kkYDu97BAOFed+IsBo9TKO/gHxTKVeplZI9i1i//1ohb4PyatODfNirMfRkJ1RtSV0o6
         ttmQ==
X-Gm-Message-State: ABy/qLZWCjZj/E6nAOt2GxhKR2/trDDZJy6md/It3A6BbzIWOgq+ebD+
        yAPjsRe5y189X8awAmqsrqiX
X-Google-Smtp-Source: APBJJlHhp0Rpsf5K8jb6rviEQwM7/+spND8NP0jQBv3B2Py1ClnOITOPfT6jeZYgEpevIu/wsJHTeA==
X-Received: by 2002:a05:6a00:a84:b0:668:97bf:5ed7 with SMTP id b4-20020a056a000a8400b0066897bf5ed7mr19895524pfl.22.1690955402602;
        Tue, 01 Aug 2023 22:50:02 -0700 (PDT)
Received: from thinkpad ([117.193.209.129])
        by smtp.gmail.com with ESMTPSA id p24-20020aa78618000000b0068702b66ab1sm9662535pfn.174.2023.08.01.22.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 22:50:02 -0700 (PDT)
Date:   Wed, 2 Aug 2023 11:19:55 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
        bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: qcom-ep: Treat unknown irq events as an error
Message-ID: <20230802054955.GG2370@thinkpad>
References: <20230726152931.18134-1-manivannan.sadhasivam@linaro.org>
 <20230731165738.GA14380@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230731165738.GA14380@bhelgaas>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 31, 2023 at 11:57:38AM -0500, Bjorn Helgaas wrote:
> On Wed, Jul 26, 2023 at 08:59:31PM +0530, Manivannan Sadhasivam wrote:
> > Sometimes, the Qcom PCIe EP controller can receive some interrupts that are
> > not known to the driver like safety interrupts in newer SoCs. In those
> > cases, if the driver doesn't clear the interrupts, then it will end up in
> > interrupt storm. But the users won't have any idea about it due to the log
> > being treated as a debug message.
> > 
> > So let's treat the unknown event log as an error, so that it at least makes
> > the user aware, thereby getting fixed eventually.
> 
> Would it be practical to log the error message, then clear the
> interrupt to avoid the interrupt storm?

Just to make it clear that we are already clearing the IRQs in
PARF_INT_ALL_CLEAR. But the issue is, on newer platforms there are a couple more
of these registers that the driver should mask and clear.

Qcom faced an interrupt storm issue while bringing up PCIe EP on a new
platform. On that platform, several interrupts were added for some specific
usecases. Since we do not mask/clear those interrupts, it resulted in an
interrupt storm. Moreover, the absence of error message made it difficult to
debug the issue as there were no logs from the driver (they didn't enable DEBUG
unfortunately during bringup as I thought one would do).

So to catch these kind of issues in the future, I just want to promote the log
to dev_err().

- Mani

> 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pcie-qcom-ep.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > index 267e1247d548..802dedcc929c 100644
> > --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > @@ -593,7 +593,7 @@ static irqreturn_t qcom_pcie_ep_global_irq_thread(int irq, void *data)
> >  		dw_pcie_ep_linkup(&pci->ep);
> >  		pcie_ep->link_status = QCOM_PCIE_EP_LINK_UP;
> >  	} else {
> > -		dev_dbg(dev, "Received unknown event: %d\n", status);
> > +		dev_err(dev, "Received unknown event: %d\n", status);
> >  	}
> >  
> >  	return IRQ_HANDLED;
> > -- 
> > 2.25.1
> > 

-- 
மணிவண்ணன் சதாசிவம்
