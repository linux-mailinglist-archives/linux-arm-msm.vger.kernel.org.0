Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 933A436D2A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2019 09:17:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726103AbfFFHRn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jun 2019 03:17:43 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45164 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725784AbfFFHRn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jun 2019 03:17:43 -0400
Received: by mail-pf1-f195.google.com with SMTP id s11so917889pfm.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2019 00:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hcWZk37MluweMWQW5kURRUWLOOrFjT2oPnVPPLPHyMo=;
        b=O3e+gR3QjxlY+TukOifhxUhwrU3NQR9N60NyUoUy2uHUzeQ5KzKmm22cgKDvq9AaJa
         HBGqpO0VEYMp0+DsxlKagVVxBG5mngX5vhbyuBCbFEc64bWcpGSZDbONnglt4HCdyMTT
         gAHr9JUL56oourAFBSHRUZ9hJubAKsm7DjmHYvMrHhbisgdNMH1KQPc6GjAxwEudVouO
         pIGF8m/RYSGkUtvnQN1fVj/L+5Vo8t7aUAykze+iK61/eKcNXTCaWI9ACCLz8IPMvXGu
         RYrFpq+7LQ5/u4AA76LNdgSRPpHxDsxfDMtgnN3FfsGb5M9viJKACY2o0B8cEH2hfUAa
         rbWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hcWZk37MluweMWQW5kURRUWLOOrFjT2oPnVPPLPHyMo=;
        b=ilA8Aoky7b65ZEB7USMU37zIeTTZdLYmoFqFO+SLdY0Thwhh5QrPODg5rzwkKBMAPC
         vkXUlT8So7jNlwN05vJPr/escvx0SFSVCeR/nsc8/iE98wJmFV3cp/h1h58CUTcnZDPv
         CDdUDBXEh5Ly8XkkrH6BKUwzT9gq7eh2xXQDvVZebSQ4np6a8WNWhCokPWjFJfddfS3J
         oRoI3ybNgR6WkyTrxiy74VT2Ne/KkR+lPFnRlkZw0MogbOFHJTnc2jujo8v/yRDp6EQG
         hylFi9tIAimhsm+QbyqEm913JbHkd0N0nyDPrvKYzdAz0a5TkawLkG93d4CdTsiTS8xC
         juqA==
X-Gm-Message-State: APjAAAXu0nXo4qCVvWCHkg0y3VXaSpd3lrxTsZ2F5I327MHiILibyGJy
        HBLsIVQqLpQfUHrK9XzioB2RXQ==
X-Google-Smtp-Source: APXvYqwJj7EcN4AJ9SENmqHf4hWfVQH6OLhC5JBuOCIoK19YSarjdumJo7ny/lpvNb23GM0WxHXIZg==
X-Received: by 2002:a17:90a:3ae8:: with SMTP id b95mr13710133pjc.68.1559805462753;
        Thu, 06 Jun 2019 00:17:42 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b4sm1058689pfd.120.2019.06.06.00.17.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jun 2019 00:17:42 -0700 (PDT)
Date:   Thu, 6 Jun 2019 00:18:28 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Avri Altman <Avri.Altman@wdc.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] scsi: ufs: Allow resetting the UFS device
Message-ID: <20190606071828.GS22737@tuxbook-pro>
References: <20190606010249.3538-1-bjorn.andersson@linaro.org>
 <20190606010249.3538-3-bjorn.andersson@linaro.org>
 <SN6PR04MB4925FC3F1001326AA218DF21FC170@SN6PR04MB4925.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR04MB4925FC3F1001326AA218DF21FC170@SN6PR04MB4925.namprd04.prod.outlook.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 05 Jun 23:36 PDT 2019, Avri Altman wrote:

> 
> >  static int ufshcd_hba_init(struct ufs_hba *hba)
> >  {
> >  	int err;
> > @@ -7425,9 +7460,15 @@ static int ufshcd_hba_init(struct ufs_hba *hba)
> >  	if (err)
> >  		goto out_disable_vreg;
> > 
> > +	err = ufshcd_init_device_reset(hba);
> > +	if (err)
> > +		goto out_disable_variant;
> > +
> >  	hba->is_powered = true;
> >  	goto out;
> > 
> > +out_disable_variant:
> > +	ufshcd_vops_setup_regulators(hba, false);
> Is this necessary?
> ufshcd_vops_setup_regulators() was just called as part of ufshcd_variant_hba_init
> 

Yes, so my attempt here is to reverse the enablement of the vops
regulators (hence passing false). But looking at it again I see that we
should also do ufshcd_vops_exit(), so the right thing to call here is
ufshcd_variant_hba_exit().

PS. This initialization sequence should really be rewritten to first
acquire all resources and then turn them on. This mixes init/setup
sequence is really hard to reason about.

Regards,
Bjorn
