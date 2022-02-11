Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCD674B249D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Feb 2022 12:43:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349534AbiBKLlr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Feb 2022 06:41:47 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345246AbiBKLlr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Feb 2022 06:41:47 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73D5EE9F
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 03:41:45 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id on2so7843788pjb.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 03:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Q8UopWdsOFlzJ+Z3GOtI+FpDIRhnoSpt3FpppfjbAIA=;
        b=nbfWsHZW1l6ukplYAjrYNpBC9AZ/xqfLumN5+l15rN+Nm7KBdBsMuvxj12fTwueg1E
         ZKANUYOAz7b5dB3wbInFyHvvXIs/ZGUE+sAnZ5DEK9UY+X/a/H4eljBmuS863I8dTxJQ
         CYOZHqA7WX8JixUOi6Q1fbz1v3D8C8rbH0F+p7/bPp4umFfLXuT0C4KKM6V8x2mGOqZA
         YlcbjWQ54LIspbn7iW4Bue1dwEBYRKKRnSxIj3D6sWsWITR0okXKcy+OnHl4i4FPyV1+
         3pNIpKs2/zzSSrMD3Pfm9D5g2Zz7u7I7vBL1h0RU0xEis7p1YuWlhADL/syVncL475Ps
         MUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Q8UopWdsOFlzJ+Z3GOtI+FpDIRhnoSpt3FpppfjbAIA=;
        b=f1SisXzm4YLByOmKpDTmUZiVn66Ss7A+eM5fbcntPqU68IX3ENFchxzAJ2VgBrd5ua
         wrO5L73iA5uuRlF/cn8ogFKfzUGJQiQuGibziG1hwY985z26qfg4EbXeKdt7nnZru8ZO
         p+LrjZl7sBTGJKSYDN6fRtOyJ86oeZ7fqyhYNWz02QIqE5F2nzFAaQdg9LmLgsOnDjAO
         a5rZzahYk1n+DGAvbxqdy7D9ABzKT5JBkjY6Na2bWrwpLEMVrar0Bog6r9nUJTbeVXf1
         Pm2PF0DIDHLT6TT/9cdjDAq1y8X++bmUl1kKWOMyImcCBMa2NhqqfIqjsHkkQb2yTBvB
         5DhQ==
X-Gm-Message-State: AOAM532ab3tOMy1Uab8stOqpcnLS2orhrtbgp4+SbNcpG+HPZEbXCyV6
        sHlxC+WOtxr1fiEZTWedPFJ5Gug5YH5TWcI=
X-Google-Smtp-Source: ABdhPJzbceK6B1tYas22862Se5sBLDRo1iyWFmOzBM3aFc1AjqNXDFc1QnMwIlNa6qhp1jataBXmVQ==
X-Received: by 2002:a17:902:7ec2:: with SMTP id p2mr1203636plb.168.1644579704895;
        Fri, 11 Feb 2022 03:41:44 -0800 (PST)
Received: from thinkpad ([27.111.75.38])
        by smtp.gmail.com with ESMTPSA id w11sm26946300pfu.50.2022.02.11.03.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 03:41:44 -0800 (PST)
Date:   Fri, 11 Feb 2022 17:11:39 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     bhelgaas@google.com, bjorn.andersson@linaro.org,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: pciehp: Add Qualcomm bridge (0x0110) to the command
 completed quirk
Message-ID: <20220211114139.GC3223@thinkpad>
References: <20220210145003.135907-1-manivannan.sadhasivam@linaro.org>
 <20220210224930.GA660547@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220210224930.GA660547@bhelgaas>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 10, 2022 at 04:49:30PM -0600, Bjorn Helgaas wrote:
> On Thu, Feb 10, 2022 at 08:20:03PM +0530, Manivannan Sadhasivam wrote:
> > The Qualcomm PCI bridge device (0x0110) found in chipsets such as SM8450
> > does not set the command completed bit unless writes to the Slot Command
> > register change "Control" bits.
> > 
> > This results in timeouts like below:
> > 
> > pcieport 0001:00:00.0: pciehp: Timeout on hotplug command 0x03c0 (issued 2020 msec ago)
> > 
> > Hence, add the device to the command completed quirk to mark commands
> > "completed" immediately unless they change the "Control" bits.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Applied to pci/hotplug for v5.18, thanks!
>

Thanks!

> Should we assume that this erratum will be fixed in future Qualcomm
> devices?  Or should we apply the quirk for all Qualcomm hotplug
> bridges, as we do for Intel?
> 

I'll check with the Qualcomm hardware folks and update here.

Regards,
Mani

> > ---
> >  drivers/pci/hotplug/pciehp_hpc.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/pci/hotplug/pciehp_hpc.c b/drivers/pci/hotplug/pciehp_hpc.c
> > index 1c1ebf3dad43..4e4ccf3afbe3 100644
> > --- a/drivers/pci/hotplug/pciehp_hpc.c
> > +++ b/drivers/pci/hotplug/pciehp_hpc.c
> > @@ -1084,6 +1084,8 @@ static void quirk_cmd_compl(struct pci_dev *pdev)
> >  }
> >  DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_INTEL, PCI_ANY_ID,
> >  			      PCI_CLASS_BRIDGE_PCI, 8, quirk_cmd_compl);
> > +DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_QCOM, 0x0110,
> > +			      PCI_CLASS_BRIDGE_PCI, 8, quirk_cmd_compl);
> >  DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_QCOM, 0x0400,
> >  			      PCI_CLASS_BRIDGE_PCI, 8, quirk_cmd_compl);
> >  DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_QCOM, 0x0401,
> > -- 
> > 2.25.1
> > 
