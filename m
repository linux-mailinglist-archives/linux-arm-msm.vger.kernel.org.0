Return-Path: <linux-arm-msm+bounces-41409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F27289EC5EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 08:48:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 799221882324
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 07:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 205791C6F70;
	Wed, 11 Dec 2024 07:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cqXLx55g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A3E1C5F3A
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 07:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733903288; cv=none; b=kpih2kdskqMxeau42mFX6e0mTFC3XIC3rVOu0VmxuzzThOtEIzxgJTCpZpo1DXNSg+7z4Dg+7fxt4cBcRW7vo5REqxXrJ9D9T6CMRjg4TJtbQ+y4mNsWYK8PR06yKb7Kg48WCKuiMTxE+4QttmWSZXkeO3szWakHxZo+W4CNZzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733903288; c=relaxed/simple;
	bh=FL0ECQxCvQ32p81Mcm1ddqDNtG56JuJQDXNqTmoIIxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uu3agJx1Fu490rZpzHkdNDs4uxJ+gxJbDRODUqXP+XHZwbNX9c7YAnxR8b/UnM75LMacgF1+jrS+QEoy1P4hDCwMJNGSH0tkXeQe7BEZUvIdkluV5pdhRMwxtiKTtLPqV1VRni7ZcQO9Mnn/DE5rDJXj5Fwiaf/zYDwKkyin+Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cqXLx55g; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-216281bc30fso44226905ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 23:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733903286; x=1734508086; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=We1H/O/5JSivIAPtQ7Na6FEoBB6GPBDqGbOj3m5VHPI=;
        b=cqXLx55g1B8IVj5yBnGQDPfJMBJCe5vhyGbf3jJnKO1dZZRIQjcS+HhrE5aHspIw3u
         l59ZweYgg/b8GHEUr/luWaWymkqC+/abKjrd5A088oNDC3ctsFAtNkfhgBtuy+7MInv5
         fhj/MgyM6Cxr8S/Z6Z5s1VwVm0/1StqlOOWE/euRRD58/yulMHOsroHvuN0GP8ys5HkM
         5h5HZuVjAMfTRaYxAzb5HEM/kx1Nk3KWmwVDKfhGhb/GPGEk5XhtFyLcPx6mHa5ksu/C
         UlxSG3hSTWgAgYO7v4gybK0hbrnMVGHFNg8Pim91SkDTpV08/OkRBamh7kf19eF5YSuI
         FFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733903286; x=1734508086;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=We1H/O/5JSivIAPtQ7Na6FEoBB6GPBDqGbOj3m5VHPI=;
        b=FCQc4A/b7/+f5MGFhgUeTrUbMpuw+jgrOg7BT4utVzcMyt0W1c8yZpOyZY2UZ3S3od
         GMq28t8caLnFQ5JIdrcxukCW7IWOsR8KDtQDRe0QnjHpTscTZuJr/BPZxrgUmnIY5kxQ
         6nSc/Mu3bYD7MNSPWfmc4k7P61sUTqf5tMXdvgM7KLr62J2zSuCONLjclg0aHOdAB2mM
         IlwmdRogAC3eSGtm1FiLFjKIk8Sdiv/SmQM2bWrlViq5BTUE5aS9Za0ga8KHn+tlsq3a
         34LrXzI03I2qAkQWJctepP6W5R0pj6Im2ea0130k/Sfcuo26x4zOYkmiFAyUE7O7u0ZH
         Q3EQ==
X-Forwarded-Encrypted: i=1; AJvYcCX74CyYYPg60SIs2Y62LsgX5Iir35rmKcUWtgt18SLcO1q3VwXTBResfGTkU1hYCHiyW25BF3fHT49v6V3+@vger.kernel.org
X-Gm-Message-State: AOJu0YxoY3g9TpiKKBdiuvxB2hhT9tVy3ozR3ocZ1iZkoVT0qS7DSg8H
	QP1NkxDI1quzuQj3gnRsS8HFz0ehCRTADkH5GImU1UJ4EoEOAnSE5QDmjfIkew==
X-Gm-Gg: ASbGncvEYjFF9sd9V8VimVrYiKvpYwMTvZRQ7pDPbnwMRPxr0zgt/52mDyWzOwQ7Hhq
	MrVWfZeZjvx3YBr+nVr0ypL9igopEx1onsUYUyFodRQMjuGbcbL+StfD8rtYu29EzI52FcPmqA3
	Xh/Hp9W66J0W6V5ETaqa3y0n1u3qLw9bJQLDel3ew2u1OFWvKaOR3iqJGQ/UyFVMSC9HM+LKyI5
	78E1HxGmQZkgSyQVgW7L0pcIlMD8f3BHcRSTXA00LcaFYPsBXzuTv0TY5lxpRU=
X-Google-Smtp-Source: AGHT+IEhrzTztU1j5OzMUP/bR3EXig9yjni9/ZYqzhtDD5dvE1u59b6+6zz4qP3utDEKyerb33yjlg==
X-Received: by 2002:a17:903:2284:b0:215:4a4e:9260 with SMTP id d9443c01a7336-21778536d17mr31649505ad.14.1733903285776;
        Tue, 10 Dec 2024 23:48:05 -0800 (PST)
Received: from thinkpad ([120.60.55.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21641f46e17sm53537855ad.221.2024.12.10.23.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 23:48:05 -0800 (PST)
Date: Wed, 11 Dec 2024 13:17:57 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: kw@linux.com, gregkh@linuxfoundation.org, arnd@arndb.de,
	lpieralisi@kernel.org, shuah@kernel.org, kishon@kernel.org,
	aman1.gupta@samsung.com, p.rajanbabu@samsung.com,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	bhelgaas@google.com, linux-arm-msm@vger.kernel.org, robh@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 2/4] misc: pci_endpoint_test: Fix the return value of
 IOCTL
Message-ID: <20241211074757.byc5jqpgfe3otjh7@thinkpad>
References: <20241129092415.29437-1-manivannan.sadhasivam@linaro.org>
 <20241129092415.29437-3-manivannan.sadhasivam@linaro.org>
 <ccd1587a-0368-4bde-9c72-4f10393c58b0@kernel.org>
 <20241129163024.dvz2ojldopeoyr6c@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241129163024.dvz2ojldopeoyr6c@thinkpad>

On Fri, Nov 29, 2024 at 10:00:30PM +0530, Manivannan Sadhasivam wrote:
> On Fri, Nov 29, 2024 at 07:51:30PM +0900, Damien Le Moal wrote:
> > On 11/29/24 18:24, Manivannan Sadhasivam wrote:
> > > IOCTLs are supposed to return 0 for success and negative error codes for
> > > failure. Currently, this driver is returning 0 for failure and 1 for
> > > success, that's not correct. Hence, fix it!
> > > 
> > > Reported-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Closes: https://lore.kernel.org/all/YvzNg5ROnxEApDgS@kroah.com
> > > Fixes: 2c156ac71c6b ("misc: Add host side PCI driver for PCI test function device")
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > 
> > Looks OK to me.
> > 
> > Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
> > 
> > One nit below.
> > 
> > [...]
> > 
> > >  static void pci_endpoint_test_remove(struct pci_dev *pdev)
> > > diff --git a/tools/pci/pcitest.c b/tools/pci/pcitest.c
> > > index 470258009ddc..545e04ad63a2 100644
> > > --- a/tools/pci/pcitest.c
> > > +++ b/tools/pci/pcitest.c
> > > @@ -16,7 +16,6 @@
> > >  
> > >  #include <linux/pcitest.h>
> > >  
> > > -static char *result[] = { "NOT OKAY", "OKAY" };
> > >  static char *irq[] = { "LEGACY", "MSI", "MSI-X" };
> > >  
> > >  struct pci_test {
> > > @@ -52,63 +51,65 @@ static int run_test(struct pci_test *test)
> > >  		ret = ioctl(fd, PCITEST_BAR, test->barnum);
> > >  		fprintf(stdout, "BAR%d:\t\t", test->barnum);
> > >  		if (ret < 0)
> > > -			fprintf(stdout, "TEST FAILED\n");
> > > +			fprintf(stdout, "NOT OKAY\n");
> > >  		else
> > > -			fprintf(stdout, "%s\n", result[ret]);
> > > +			fprintf(stdout, "OKAY\n");
> > 
> > Maybe replace all this "if (ret < 0) ... else ..." and all the ones below with
> > something a call to:
> > 
> > static void test_result(int ret)
> > {
> > 	fprintf(stdout, "%sOKAY\n", ret < 0 ? "NOT " : "");
> > }
> > 
> > or simply with the call:
> > 
> > 	fprintf(stdout, "%sOKAY\n", ret < 0 ? "NOT " : "");
> > 
> > to avoid all these repetition.
> > 
> 
> Sounds good to me. Will incorporate in next version, thanks!
> 

Maybe not. This test is converted to Kselftest in successive patches, so no need
to simplify it.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

