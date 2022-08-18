Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECCDC598D71
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Aug 2022 22:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243948AbiHRULm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Aug 2022 16:11:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346079AbiHRUKw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Aug 2022 16:10:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FC30D87C0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Aug 2022 13:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660853136;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ekfMu/NlgHnoEql9XLmlRVPwjxrh2EoMdj4w3IuDChw=;
        b=adkKSpV54nyv2L2AFeKxSjw+HYLT+3yepLlw9YQoANC+u7Y1Wq331DrXBImifqVw7TvtOl
        aEk9edu2vZGEommfwqST4RLNZsXqUndCmFU+51O6ZJ+Ppb1FONgrhOkxE7XPZHe89e0qtY
        E7HWOSLHyOR0TiGdva2Xst9vSStLTgY=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-270-_9gnyQozMtWrc9Bm8o1eQw-1; Thu, 18 Aug 2022 16:05:34 -0400
X-MC-Unique: _9gnyQozMtWrc9Bm8o1eQw-1
Received: by mail-qk1-f199.google.com with SMTP id bs43-20020a05620a472b00b006bb56276c94so2281809qkb.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Aug 2022 13:05:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=ekfMu/NlgHnoEql9XLmlRVPwjxrh2EoMdj4w3IuDChw=;
        b=QDi1ww7STIZTseQyLwgOM1M3Lp80hmwWs3Lf52S8zep1DheB3XrfHBDuB8mVZsbwVi
         SBAaWyqkJLP6E9FAT3mrG/5AQQ/qe9FYb5wMNnltDpL/PvJiUW++F13NuP3Od4rRFtKM
         9KzCc+F+ge0GollklaXnJ5C/hT0vC2AY6SufNlF1SAWOHIj0VMXSvpEvEuOm797UmNPF
         F6hqmo2KQqF1qYMpQTDNZXHFS4SWLIqTykCu8DtVPNAATo2VrFKB6tEXObUw0Y9lGbE3
         2ZcZ2nCLmJeR5/PBp8czGwg9ljLOaf7R3+V7dkZg/7w/UIwli2ioM5ks9qncbDtMSxgj
         IeCg==
X-Gm-Message-State: ACgBeo0IqCpbk+pux5+EqfjzoOyqo6Uii+JCtPEGg1OTLiHNjLjQE0Gn
        NU6y6PACXiAa/jKPNtFNp5+I/E0etTI9sJng9Fl3IVbUVy0HgMXDH7b08xqsyb519g+P8WRCSle
        Mz+Kktfde3U80gv2dQbs0PZIpQQ==
X-Received: by 2002:a05:6214:20cb:b0:496:ae48:d2e8 with SMTP id 11-20020a05621420cb00b00496ae48d2e8mr3767809qve.113.1660853134090;
        Thu, 18 Aug 2022 13:05:34 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7dHzQ3nxL/TMyb38jqS9VwCzXhHQeOQHvaHmUhUqlkC39MNQ5tbo9wHlGuZ25bF1KoAQmfWw==
X-Received: by 2002:a05:6214:20cb:b0:496:ae48:d2e8 with SMTP id 11-20020a05621420cb00b00496ae48d2e8mr3767788qve.113.1660853133830;
        Thu, 18 Aug 2022 13:05:33 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::1e])
        by smtp.gmail.com with ESMTPSA id bb27-20020a05622a1b1b00b00342f917444csm1551151qtb.85.2022.08.18.13.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 13:05:33 -0700 (PDT)
Date:   Thu, 18 Aug 2022 15:05:30 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc:     Johan Hovold <johan@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 8/8] PCI: qcom: Sort device-id table
Message-ID: <20220818200530.lab2zlcaetekcclq@halaneylaptop>
References: <20220714071348.6792-1-johan+linaro@kernel.org>
 <20220714071348.6792-9-johan+linaro@kernel.org>
 <YtAny03L/RLk9nv6@xps13>
 <YtEaqHT7NdXPhK+y@hovoldconsulting.com>
 <YvvAfQJChCVX4cPH@lpieralisi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YvvAfQJChCVX4cPH@lpieralisi>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Lorenzo,

On Tue, Aug 16, 2022 at 06:06:21PM +0200, Lorenzo Pieralisi wrote:
> On Fri, Jul 15, 2022 at 09:43:36AM +0200, Johan Hovold wrote:
> > On Thu, Jul 14, 2022 at 10:27:23AM -0400, Brian Masney wrote:
> > > On Thu, Jul 14, 2022 at 09:13:48AM +0200, Johan Hovold wrote:
> > > > Sort the device-id table entries alphabetically by compatible string to
> > > > make it easier to find entries and add new ones.
> > > > 
> > > > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > > > ---
> > > >  drivers/pci/controller/dwc/pcie-qcom.c | 12 ++++++------
> > > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > > > index 8dddb72f8647..fea921cca8fa 100644
> > > > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > > > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > > > @@ -1749,24 +1749,24 @@ static int qcom_pcie_remove(struct platform_device *pdev)
> > > >  }
> > > >  
> > > >  static const struct of_device_id qcom_pcie_match[] = {
> > > > +	{ .compatible = "qcom,pcie-apq8064", .data = &cfg_2_1_0 },
> > > >  	{ .compatible = "qcom,pcie-apq8084", .data = &cfg_1_0_0 },
> > > > +	{ .compatible = "qcom,pcie-ipq6018", .data = &cfg_2_9_0 },
> > > >  	{ .compatible = "qcom,pcie-ipq8064", .data = &cfg_2_1_0 },
> > > >  	{ .compatible = "qcom,pcie-ipq8064-v2", .data = &cfg_2_1_0 },
> > > > -	{ .compatible = "qcom,pcie-apq8064", .data = &cfg_2_1_0 },
> > > > -	{ .compatible = "qcom,pcie-msm8996", .data = &cfg_2_3_2 },
> > > >  	{ .compatible = "qcom,pcie-ipq8074", .data = &cfg_2_3_3 },
> > > >  	{ .compatible = "qcom,pcie-ipq4019", .data = &cfg_2_4_0 },
> > > 
> > > qcom,pcie-ipq4019 should be moved up above qcom,pcie-ipq6018.
> > 
> > If we only had some sort of machine that could sort strings for us... ;)
> > I'll rely on vim for this from now on.
> > 
> > Perhaps Bjorn H can fix that up when applying unless I'll be sending a
> > v3 for some other reason. This series still depends on the MSI rework to
> > be applied first.
> 
> I can do it while applying. A link to the lore archive for the MSI
> rework please (I don't think it was merged for v6.0) ? I was away for
> two months, catching up with threads.

I don't see a reply to this, so here I am following up out of interest
for getting this in mainline for my x13s laptop to use.

It appears the MSI rework[0] (which is in the cover letter here so I
know I grabbed the right thing) was applied in 6.0:

    ahalaney@halaneylaptop ~/git/linux (git)-[remotes/upstream/HEAD] % git log --oneline --abbrev=12 --grep=2436629 v6.0-rc1 -- drivers/pci/controller/dwc/ 
    cd761378e62c PCI: dwc: Handle MSIs routed to multiple GIC interrupts
    db388348acff PCI: dwc: Convert struct pcie_port.msi_irq to an array
    226ec087497a PCI: dwc: Split MSI IRQ parsing/allocation to a separate function
    3c62f878a969 PCI: dwc: Correct msi_irq condition in dw_pcie_free_msi()
    ahalaney@halaneylaptop ~/git/linux (git)-[remotes/upstream/HEAD] %

Just a friendly FYI, hope that helps!

[0] https://lore.kernel.org/all/20220707134733.2436629-6-dmitry.baryshkov@linaro.org/

Thanks,
Andrew

> 
> Thanks,
> Lorenzo
> 
> > Thanks for reviewing.
> > 
> > Johan

