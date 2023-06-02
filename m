Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6DB971F8D6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jun 2023 05:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbjFBDTx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 23:19:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233488AbjFBDTu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 23:19:50 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 797A0136
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 20:19:48 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-75b1975ea18so156149585a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 20:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685675987; x=1688267987;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tGL4korHyAlLV6EY+V438PKb1cdQIlIg6Ev2NR37sNE=;
        b=wmmCQNqcXHaJO6QcGvdy0Ry81qgY6h6oGR0kmHf6zQidpqlNra9VDWGh1F0ldbT54d
         /GS5drcRU0DGjQ0eGaZH3vmbrvJLOGfk5uyD/TWP8RSfu/bwuQfKcmiuKRvCjiDPx6nz
         k+aFCocudPhxpw1SsopAvCP6ulM8SXQBMhPWR3YpBAYmRjjV3FhdfbpcGuhZYYH4CVww
         0WEs1sdnMnytxITGhfXdc/ZG6jwstLoXQd68ia7yI11b/oaCtU9BZ4Lbqo+ZDoD+7+/P
         YFSVocLRhlHrTHW8Jq16ZIKwiFgiFMvdNFyXsofazTKN2S3dUm/DyRyLs+xf0AnXKtV7
         C5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685675987; x=1688267987;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tGL4korHyAlLV6EY+V438PKb1cdQIlIg6Ev2NR37sNE=;
        b=DUUeo3wJi0tZAE0QVj31QGT+y8nNTtmFB+Yi1fDkYjjYrPhAHIQWmbUaXa3snrM/Mu
         NE+U9rEj79SoIZcYEI8SRUQXadzRv51IictJhSNgbJZDPk7DnG18gjVkHHwcNRzArVkt
         alSvZxwditocY7/18GXAGt2CeHKtePvvQJsNYqJa1qKo9PkyhxaHWoxpp7ZdFil7y3rd
         ezaAZggacuSI4RtHLe4WzW6HDjCUXQuvHGnElx7U4Eyv0M97epRxNIvbkN6I+vBHWreO
         5LYIMq/3pb6Tl9C/WfZt4SLNwyU6yZd9v9ZTQoPJW88e3Gy9osGCRzQ2RSgDoxo0ptFU
         J+4g==
X-Gm-Message-State: AC+VfDwkaqJtNSB7YJuNMR/ehXWnrTKpM3cgeRg2wSq/Dn0r3rPjkHho
        dOTt3+lLX4DMojSP66bqJ+jo
X-Google-Smtp-Source: ACHHUZ4j4fvIpgSAF1Ls4caTohCkARl8PPno9aLi1e7TU+P5kg5Ig/JCHJ6Q8rQdHEHenoCUct7r5A==
X-Received: by 2002:ac8:5a91:0:b0:3f4:f3e0:ee84 with SMTP id c17-20020ac85a91000000b003f4f3e0ee84mr12437798qtc.9.1685675987492;
        Thu, 01 Jun 2023 20:19:47 -0700 (PDT)
Received: from thinkpad ([117.217.186.123])
        by smtp.gmail.com with ESMTPSA id j20-20020a635954000000b00519c3475f21sm181036pgm.46.2023.06.01.20.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 20:19:46 -0700 (PDT)
Date:   Fri, 2 Jun 2023 08:49:40 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Damien Le Moal <dlemoal@kernel.org>
Cc:     lpieralisi@kernel.org, kw@linux.com, kishon@kernel.org,
        bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 3/9] PCI: endpoint: Pass EPF device ID to the probe
 function
Message-ID: <20230602031940.GA5341@thinkpad>
References: <20230601145718.12204-1-manivannan.sadhasivam@linaro.org>
 <20230601145718.12204-4-manivannan.sadhasivam@linaro.org>
 <65ed4b9f-a153-7c7b-6462-a5c11024a1f6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65ed4b9f-a153-7c7b-6462-a5c11024a1f6@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 02, 2023 at 08:16:45AM +0900, Damien Le Moal wrote:
> On 6/1/23 23:57, Manivannan Sadhasivam wrote:
> > Currently, the EPF probe function doesn't get the device ID argument needed
> > to correctly identify the device table ID of the EPF device.
> > 
> > When multiple entries are added to the "struct pci_epf_device_id" table,
> > the probe function needs to identify the correct one. This is achieved by
> > modifying the pci_epf_match_id() function to return the match ID pointer
> > and passing it to the driver's probe function.
> > 
> > pci_epf_device_match() function can return bool based on the return value
> > of pci_epf_match_id().
> > 
> > Reviewed-by: Kishon Vijay Abraham I <kishon@kernel.org>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> [...]
> 
> >  static int pci_epf_device_match(struct device *dev, struct device_driver *drv)
> > @@ -510,8 +510,12 @@ static int pci_epf_device_match(struct device *dev, struct device_driver *drv)
> >  	struct pci_epf *epf = to_pci_epf(dev);
> >  	struct pci_epf_driver *driver = to_pci_epf_driver(drv);
> >  
> > -	if (driver->id_table)
> > -		return pci_epf_match_id(driver->id_table, epf);
> > +	if (driver->id_table) {
> > +		if (pci_epf_match_id(driver->id_table, epf))
> > +			return true;
> > +		else
> > +			return false;
> 
> 		return pci_epf_match_id(driver->id_table, epf) != NULL;
> 
> is simpler. If you do not like this, at least drop the "else" as it is not
> necessary at all.
> 

I settle for simplicity :) Also, there is a theoretical possibility of passing
NULL as the id->name, so doesn't want to rule out that.

> > +	}
> >  
> >  	return !strcmp(epf->name, drv->name);
> >  }
> > @@ -520,13 +524,15 @@ static int pci_epf_device_probe(struct device *dev)
> >  {
> >  	struct pci_epf *epf = to_pci_epf(dev);
> >  	struct pci_epf_driver *driver = to_pci_epf_driver(dev->driver);
> > +	const struct pci_epf_device_id *id;
> >  
> >  	if (!driver->probe)
> >  		return -ENODEV;
> >  
> >  	epf->driver = driver;
> > +	id = pci_epf_match_id(driver->id_table, epf);
> 
> Not sure that the id variable is that useful.
> 

Thought it makes the code clear but looking again, it doesn't hurt to call match
directly in probe. Will change it in next iteration.

- Mani

> >  
> > -	return driver->probe(epf);
> > +	return driver->probe(epf, id);
> >  }
> 
> -- 
> Damien Le Moal
> Western Digital Research
> 

-- 
மணிவண்ணன் சதாசிவம்
