Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78E536CD9AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 14:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229781AbjC2MxA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Mar 2023 08:53:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbjC2Mw7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Mar 2023 08:52:59 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF4CC19B2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 05:52:40 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id o6-20020a17090a9f8600b0023f32869993so18450191pjp.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 05:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680094360;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BCg5KJ4aalw7URIKrf7Z4sofbQeaUPjVmaP5ALWxTDs=;
        b=uc/smf75hOiBcv8M0SvwePw5cx0uJrFhFREYa3QnbjQweT+tT0N/lAZ6GjIDbUUz8J
         Y6Hf6FsLe40uu+TRcuvMHjSVsPPZ947gwS388R3Gv5WkKiC3S3C7uIKDmzZ+hX/AIqLm
         pa3g48gCxq75i9rpLp1XXAmPYLeZYpJdxgToPPAJ924VyB/hDRYyJXNeE8ZL25dCcnjD
         73ijlxhBl2u6i8ebVY51ytUUGV6RRuKyEE5zoHhHZ/BGHLrSIqUBB/22cbD1fs0P9FRQ
         lGMKOCy8K7ePN6jfnGCUTwJja+W4yys0pE9uNEkKC+FpXnPTd9giZZ+dveJejpnxZoZd
         2pYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680094360;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BCg5KJ4aalw7URIKrf7Z4sofbQeaUPjVmaP5ALWxTDs=;
        b=ik7c3gppodxchtTokOt6maNAdd90ucn38Un6aXLreJPINF2Ms03C95Syw7TpWlWUyB
         iyy9YVPZ+JbgCvGb5IXQIWCEkoGKeM1Voyh3kHVLdOagJWli5ND9+v6WXzLnUBoDzn+R
         jG6X53Be0ynr2x4aEtx21DsgOpDxj5Z2CQV0iVXi5Flm3n3bW+JsdpDLbwcDFjc/OL1d
         WGqjUP21EPchYPWhv18KQpPu8NCzyu9j5LC66hdfCzk2IZBbkxUqj+4ksqsIoTB4G5BI
         Jg61X93KT/NZdTvHZtVlEzceNbYkUeXAzkfce72KYXnUyCtCCsN2Leyl0DF7jGgBAe8D
         hX/A==
X-Gm-Message-State: AAQBX9cXVILGDDzL3xeErfD+WrCOBWqJ6lSfJB5CMxchgpRGHaMV9vdY
        abptK3S8XJ4iP3avSKC6lwRlc9HhoWXGygya1A==
X-Google-Smtp-Source: AKy350bFB8wusqWw92UFGnEQW85Vvmw7xBP5dHUfXM0saPSOd8IKOX0TsqTF6VTQK3aYyjuLY89paA==
X-Received: by 2002:a17:90b:1c08:b0:23d:44c6:745a with SMTP id oc8-20020a17090b1c0800b0023d44c6745amr21267829pjb.2.1680094360105;
        Wed, 29 Mar 2023 05:52:40 -0700 (PDT)
Received: from thinkpad ([117.216.120.213])
        by smtp.gmail.com with ESMTPSA id u13-20020a17090a450d00b0023fa2773aa5sm1355951pjg.26.2023.03.29.05.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 05:52:39 -0700 (PDT)
Date:   Wed, 29 Mar 2023 18:22:32 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_krichai@quicinc.com, johan+linaro@kernel.org, steev@kali.org,
        mka@chromium.org, Dhruva Gole <d-gole@ti.com>
Subject: Re: [PATCH v3 1/1] PCI: qcom: Add support for system suspend and
 resume
Message-ID: <20230329125232.GB5575@thinkpad>
References: <20230327133824.29136-1-manivannan.sadhasivam@linaro.org>
 <20230327133824.29136-2-manivannan.sadhasivam@linaro.org>
 <ZCQLWzqKPrusMro+@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCQLWzqKPrusMro+@hovoldconsulting.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 29, 2023 at 11:56:43AM +0200, Johan Hovold wrote:
> On Mon, Mar 27, 2023 at 07:08:24PM +0530, Manivannan Sadhasivam wrote:
> > During the system suspend, vote for minimal interconnect bandwidth and
> > also turn OFF the resources like clock and PHY if there are no active
> > devices connected to the controller. For the controllers with active
> > devices, the resources are kept ON as removing the resources will
> > trigger access violation during the late end of suspend cycle as kernel
> > tries to access the config space of PCIe devices to mask the MSIs.
> > 
> > Also, it is not desirable to put the link into L2/L3 state as that
> > implies VDD supply will be removed and the devices may go into powerdown
> > state. This will affect the lifetime of storage devices like NVMe.
> > 
> > And finally, during resume, turn ON the resources if the controller was
> > truly suspended (resources OFF) and update the interconnect bandwidth
> > based on PCIe Gen speed.
> > 
> > Suggested-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> > Acked-by: Dhruva Gole <d-gole@ti.com>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pcie-qcom.c | 62 ++++++++++++++++++++++++++
> >  1 file changed, 62 insertions(+)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > index a232b04af048..f33df536d9be 100644
> > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > @@ -227,6 +227,7 @@ struct qcom_pcie {
> >  	struct gpio_desc *reset;
> >  	struct icc_path *icc_mem;
> >  	const struct qcom_pcie_cfg *cfg;
> > +	bool suspended;
> >  };
> >  
> >  #define to_qcom_pcie(x)		dev_get_drvdata((x)->dev)
> > @@ -1820,6 +1821,62 @@ static int qcom_pcie_probe(struct platform_device *pdev)
> >  	return ret;
> >  }
> >  
> > +static int qcom_pcie_suspend_noirq(struct device *dev)
> > +{
> > +	struct qcom_pcie *pcie = dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	/*
> > +	 * Set minimum bandwidth required to keep data path functional during
> > +	 * suspend.
> > +	 */
> > +	ret = icc_set_bw(pcie->icc_mem, 0, MBps_to_icc(250));
> 
> This isn't really the minimum bandwidth you're setting here.
> 
> I think you said off list that you didn't see real impact reducing the
> bandwidth, but have you tried requesting the real minimum which would be
> kBps_to_icc(1)?
> 
> Doing so works fine here with both the CRD and X13s and may result in
> some further power savings.
> 

No, we shouldn't be setting random value as the bandwidth. Reason is, these
values are computed by the bus team based on the requirement of the interconnect
paths (clock, voltage etc...) with actual PCIe Gen speeds. I don't know about
the potential implication even if it happens to work.

- Mani

> > +	if (ret) {
> > +		dev_err(dev, "Failed to set interconnect bandwidth: %d\n", ret);
> > +		return ret;
> > +	}
> 
> Johan

-- 
மணிவண்ணன் சதாசிவம்
