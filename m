Return-Path: <linux-arm-msm+bounces-43760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A6E9FF15D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 19:51:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 659823A300F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 18:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD9661B0416;
	Tue, 31 Dec 2024 18:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jms04nY3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D913B165F09
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Dec 2024 18:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735671092; cv=none; b=jIeI+bxKtl6Z9DOANrvbbq6LB7+xxVaNSavvZAB2B5GVRs2qgebhHZHENuXokkMGlIRJLaW6NAUNd4UNCM/ubEFYMTfCjSFZs2vEA/6eTcUUelxnoofmX9z5OyCClJwlJsmnW786CH2/WpWPZO9XQcl63nxzWceO8+5U9Cy+Izk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735671092; c=relaxed/simple;
	bh=azU98vO31SNIAZBhQsgizDHYDGJVyVDcLdRUF835Ap8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hvcDFjG90cIhERO8pTDgXvX38GhMEe8kiur2aQ3UZLJjsE4cGGdlbBl6FUAUAea//Q8kJ9PG7jVlE5DFQNK5hpdMG8b1VTi34udxfUICYGw+y7pTc5z9oDtkf2vgGBHJcfHCLY8ZYdOHxfyiUhhblle4/EPYvyhxQga2YLffrnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jms04nY3; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-216281bc30fso157076315ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Dec 2024 10:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735671089; x=1736275889; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E334ZcZ7CwPkqPg976DHkaYzDYOWts3xcgbUbSOfEho=;
        b=jms04nY3UcaoGMBvugECOE7KsBMMwHgWNqj7mkZ/hSNKXfWAMqp8tLxMKthWJGKQvt
         vXJq5gnRwurnCVCyKXhhzTt9XkPsDBrm6rUr6HgoWwgtpmUDMeUBKpO4IsYgG23K0FSW
         S7wKdFeCVLL3EdR+ph9d44+uhEEHViwIsGSKWYeznzyE7l5ikAAOIrAjCS1+IdhjgJIZ
         m48PmtV7PozNLurKJr7s+KeHHXQVXZoig79kjUfzvMskoFpM+W2gW7mjJ7RaUszCl2bN
         2Ji7W7+AfcNruRKgLWvEhgq4EWYQgLgJ1N1+Qkn2H/0n1/G/trjENhRb9+LniS9i37ul
         x3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735671089; x=1736275889;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E334ZcZ7CwPkqPg976DHkaYzDYOWts3xcgbUbSOfEho=;
        b=uficKjb8ov8ix4AHlMhFXBJDPuAZwdotsLHR/4AiBj/aRl4IeuartKMNNb8xyAbMz1
         7zmWjInQElbgSDxIEUn1prMp7Guph551FhGjnL7oGF4UKPOW4xWXAHTn3HmAFGuBT6ku
         Wm4TqBFsz/pgRJbhV/psZ2RmY2QjoLaryjjD6UUuqdaYCHhGzg7Y0tq7X0zcuVvGRFba
         vFvWsLbgdQt6TUdY4RHWS5Tp8WZuEDIgLZbvy0o2mK9T5zpjiT9HuhKB8zivXI8T9Zh6
         mLciBYPIOnGTdigqgbqNzLaFmbykHaipfqnn5+XogHFLp2hdF5tlpIBolIxopgoFnPRI
         Le0A==
X-Forwarded-Encrypted: i=1; AJvYcCVLR52kSF/FwC2nn9a1u9OAUdZWv1UKGFWws6uI6V0AMffktxcXEIOhs7Vn9IyYxs0e9rfXNvNmlOcFGlGv@vger.kernel.org
X-Gm-Message-State: AOJu0YwR+5C3RKBm/dMd6uFv7UyeVdrFlgvcWbOj2xyR6SA0RZmmKBne
	Jmym3h36ufFaZhOGjx+vpvni6Ag1k6Qvlbv106HZKRP7MB37mdKU8kUFr0L/zQ==
X-Gm-Gg: ASbGncs6MWGrld6GVVG0dPziPPXLC0TKCtdjGw5GQ0+Tvjot6c53uxgIwzdeG2y3brj
	P7MQx6FSdPS2Ayj8gnY9JjJTmiagugX4V0rZ9nzL3Lhe822UAky1C4qobCNphoZflPdFX55ZZyg
	sYmPq5P1kyygRTYXTrgTGJo3P9FrUPudR2i5GaRvNcQDQ518mKMspLwEwQ5p9Z9KJApwhKmV4C7
	Q4JaqkH70bvHIeRKvmvGVNh0JiP45dBT+16xkxMLbPbfGicDlaNw6qGz69RtSujn8YohQ==
X-Google-Smtp-Source: AGHT+IGwVGbLmDVZpt6B+0AieoEIml+NQ87VsD3igzaQnYjjX3XsoInBdqw8aBrZMCZea0xS3EiNZA==
X-Received: by 2002:a17:903:1105:b0:215:a3fb:b4d6 with SMTP id d9443c01a7336-219e6e8c5a0mr582168825ad.8.1735671089132;
        Tue, 31 Dec 2024 10:51:29 -0800 (PST)
Received: from thinkpad ([117.193.213.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca04c54sm197507815ad.236.2024.12.31.10.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 10:51:28 -0800 (PST)
Date: Wed, 1 Jan 2025 00:21:21 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: kw@linux.com, gregkh@linuxfoundation.org, arnd@arndb.de,
	lpieralisi@kernel.org, shuah@kernel.org, kishon@kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	bhelgaas@google.com, linux-arm-msm@vger.kernel.org, robh@kernel.org,
	linux-kselftest@vger.kernel.org,
	Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [PATCH v4 1/3] misc: pci_endpoint_test: Fix the return value of
 IOCTL
Message-ID: <20241231185121.yiakwbdrzdxrqydg@thinkpad>
References: <20241231131341.39292-1-manivannan.sadhasivam@linaro.org>
 <20241231131341.39292-2-manivannan.sadhasivam@linaro.org>
 <Z3Qii43XSnxvc4pp@ryzen>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z3Qii43XSnxvc4pp@ryzen>

On Tue, Dec 31, 2024 at 05:57:47PM +0100, Niklas Cassel wrote:
> On Tue, Dec 31, 2024 at 06:43:39PM +0530, Manivannan Sadhasivam wrote:
> > IOCTLs are supposed to return 0 for success and negative error codes for
> > failure. Currently, this driver is returning 0 for failure and 1 for
> > success, that's not correct. Hence, fix it!
> > 
> > Reported-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Closes: https://lore.kernel.org/all/YvzNg5ROnxEApDgS@kroah.com
> > Fixes: 2c156ac71c6b ("misc: Add host side PCI driver for PCI test function device")
> > Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/misc/pci_endpoint_test.c | 250 +++++++++++++++----------------
> >  tools/pci/pcitest.c              |  51 +++----
> >  2 files changed, 148 insertions(+), 153 deletions(-)
> > 
> > diff --git a/drivers/misc/pci_endpoint_test.c b/drivers/misc/pci_endpoint_test.c
> > index 5c99da952b7a..7d3f78b6f854 100644
> > --- a/drivers/misc/pci_endpoint_test.c
> > +++ b/drivers/misc/pci_endpoint_test.c
> > @@ -169,43 +169,47 @@ static void pci_endpoint_test_free_irq_vectors(struct pci_endpoint_test *test)
> >  	test->irq_type = IRQ_TYPE_UNDEFINED;
> >  }
> >  
> > -static bool pci_endpoint_test_alloc_irq_vectors(struct pci_endpoint_test *test,
> > +static int pci_endpoint_test_alloc_irq_vectors(struct pci_endpoint_test *test,
> >  						int type)
> >  {
> > -	int irq = -1;
> > +	int irq;
> >  	struct pci_dev *pdev = test->pdev;
> >  	struct device *dev = &pdev->dev;
> > -	bool res = true;
> >  
> >  	switch (type) {
> >  	case IRQ_TYPE_INTX:
> >  		irq = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_INTX);
> > -		if (irq < 0)
> > +		if (irq < 0) {
> >  			dev_err(dev, "Failed to get Legacy interrupt\n");
> > +			return -ENOSPC;
> > +		}
> > +
> >  		break;
> >  	case IRQ_TYPE_MSI:
> >  		irq = pci_alloc_irq_vectors(pdev, 1, 32, PCI_IRQ_MSI);
> > -		if (irq < 0)
> > +		if (irq < 0) {
> >  			dev_err(dev, "Failed to get MSI interrupts\n");
> > +			return -ENOSPC;
> > +		}
> > +
> >  		break;
> >  	case IRQ_TYPE_MSIX:
> >  		irq = pci_alloc_irq_vectors(pdev, 1, 2048, PCI_IRQ_MSIX);
> > -		if (irq < 0)
> > +		if (irq < 0) {
> >  			dev_err(dev, "Failed to get MSI-X interrupts\n");
> > +			return -ENOSPC;
> 
> From the pci_alloc_irq_vectors() kdoc:
>  * Return: number of allocated vectors (which might be smaller than
>  * @max_vecs), -ENOSPC if less than @min_vecs interrupt vectors are
>  * available, other errnos otherwise.
> 
> So pci_alloc_irq_vectors() can return errors different than ENOSPC,
> and in that case, you will overwrite that error.
> 

Ack.

> 
> > @@ -442,9 +444,12 @@ static bool pci_endpoint_test_msi_irq(struct pci_endpoint_test *test,
> >  	val = wait_for_completion_timeout(&test->irq_raised,
> >  					  msecs_to_jiffies(1000));
> >  	if (!val)
> > -		return false;
> > +		return -ETIMEDOUT;
> >  
> > -	return pci_irq_vector(pdev, msi_num - 1) == test->last_irq;
> > +	if (!(pci_irq_vector(pdev, msi_num - 1) == test->last_irq))
> 
> if (pci_irq_vector(pdev, msi_num - 1) != test->last_irq) ?
> 
> Or perhaps even:
> 
> ret = pci_irq_vector();
> if (ret < 0)
> 	return ret;
> 
> if (ret != test->last_irq)
> 	return -EIO;
> 

Ack.

> 
> Otherwise, this looks good to me:
> Reviewed-by: Niklas Cassel <cassel@kernel.org>

Thanks!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

