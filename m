Return-Path: <linux-arm-msm+bounces-55676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7B1A9CD81
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 17:47:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05C464C8997
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 15:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C05E027932E;
	Fri, 25 Apr 2025 15:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j05UV5dP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB4D28DF1C
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 15:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745595980; cv=none; b=oN6Qi6Lltt4W1k4ItV91sQR7qTIqUu1+YuG/ETXZOFL9iJxt+bS2XtWpcaSVQCx/yoGas+UnzInG7JEh4BZna3NaCH7HYTRX0I4vLE8d9mX9Phe2gofetCzEij50cVszWjM6JXg4i3cxhlM1xdCvXF1aEkAQ6I+0s5v8gVUYZiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745595980; c=relaxed/simple;
	bh=OEN/M7xAkfDtjvNwKlr/jucG4cQOWcjtHRGd69J9SGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OWTJIRr8eqPSZERDwM5NC6mOSvLbbgvlPZX7TdltbZoUHVv5ynAjOx90cGJY03P075E1+caVAJx96BKuA1mWhuzY3dL3Z1MkHziXto9CMPr232xsbXb305zozePfIOl57e/AC/NYLP5KYAuTgnM4vU8aSQgTjNuIMgjXwvndAA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j05UV5dP; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7399838db7fso2615263b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 08:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745595976; x=1746200776; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b0yjiKObWEJiwO02DaOrPmXbmFq+eaftYKKT34xnJk0=;
        b=j05UV5dPOBy43iHV+sWZT+yAPem7J7c/EFHZyA9g/WbDbkdHA4L4U5mlWTvXyZ/pya
         1KZJEJJM8+mH1KufUe/KDFW17zAkJGGDWvnFdxr/+IdzMlfmg5rBFAfZppMbD+pPs9yq
         SAfquee+kxH36o3IUKPzBN/PKsk66fQnTs8ouVt0hYQXar0wscnL7c+zFIrOgInHwI47
         ImAPwxXq8Vj0/1RdLNd8DkqhtEZ4UrDL0MKceZzGhd3rnQfEMWKIoFYF/bhPuhYyOK7v
         2GB9WWtKRTUxIOGhVnuVdqzrkCR4ab6v+RC47jbQWN2hoxuAdbFyqMcGs6N3jJHUEt9Z
         wVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745595976; x=1746200776;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b0yjiKObWEJiwO02DaOrPmXbmFq+eaftYKKT34xnJk0=;
        b=ZeUDorB1I0k+8AwSaQcZ/pEVzpS7zvGJCVyqbfx6cva6jEBF++22xVGUhKz+WdzbLd
         Xjp+PpqvoFUlWNVMsuwmWflJdXX71ujb4ak9LyMUhLX+HFF4Uqq7B9kLoCFVphFztZue
         Bu9Z4wlJs2bAuUORXbYjacgerSbHDZlb0/is2Cb1kzs08tmBij0MX6ABZLWt6/gq1Gig
         FdwhLMs0IVJK/urolssQ9a8EOgs9I03v6lTPm7fXjl1ss/iscnh96pIxp2/nw9oARE+7
         tg5Uwby+CW7V5Ls2jtzkwqWu3iztZPLm15a6T1Q25ik/krq/TXpt+vVCDQoZHErKCPaY
         XwQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgN2BSH8Mnu3lPLD0NU5/T2uRuJANSZVPqoyanS21iOsgZntwTKxAN+qI8U7E7CJ1EXS0VfNkCuqtZ5Wub@vger.kernel.org
X-Gm-Message-State: AOJu0YxcVxaSJ8Mq9TX7XSwXjyVa1pQbuPm/q1yIJTVzPsiQNUeNsu+H
	aomJBOutS23Kw8cMQXvv6Qbq6AGCxBbBOtp8d4RRUFsXpzTWH0m0mIZdme1A3w==
X-Gm-Gg: ASbGncvszzEebKneEGufwWoE/QuNDt2B8QYGcnJOQH1y4c/Z56RMdkkojEJ3RRxYUun
	vZHbdZiUlwowPONJJtYXRMV5dSquWHgCds6jwYQsyB2mlsvnPj1N1v7ONmLZWJn7htFhcpFzDj5
	nynDhbgDS25f1pttjb09SutL3o3gh42QoIuiHoPKLdnzp330tCYOw5OhltSK0bTSvDtmfJPvRv+
	kDbDYVWnqJMKpB4ALzZ8nCXpwuvHl0KMmgyZRziuovSz8j0t1jyEzGsDa5axUQhpaHrYvgcbTfT
	yY7uy6q1upe4AavjVRdOCMip8cLej/2xYPYaypdaHSNaqMSa1GU4
X-Google-Smtp-Source: AGHT+IGs6qXZbOiWmzBGdrbn2GeizUSvYWBYF7LQu+E/gHowSvXPMU/F/cIhQAuYikQ05w1s5IHkLg==
X-Received: by 2002:a05:6a00:e1b:b0:736:b3cb:5db with SMTP id d2e1a72fcca58-73e268ee7b6mr11186888b3a.11.1745595976351;
        Fri, 25 Apr 2025 08:46:16 -0700 (PDT)
Received: from thinkpad ([120.56.201.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25967608sm3316408b3a.81.2025.04.25.08.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 08:46:15 -0700 (PDT)
Date: Fri, 25 Apr 2025 21:16:09 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Jingoo Han <jingoohan1@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, quic_pyarlaga@quicinc.com, 
	quic_vbadigan@quicinc.com, quic_vpernami@quicinc.com, quic_mrana@quicinc.com, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 01/10] PCI: update current bus speed as part of
 pci_bus_add_devices()
Message-ID: <azxdhgvf6vo6eilmdmxa2ryir33h5uqwuru2a7jrgjuunyncrb@q3fdjhcaskjm>
References: <20250313-mhi_bw_up-v2-1-869ca32170bf@oss.qualcomm.com>
 <20250313170001.GA738398@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313170001.GA738398@bhelgaas>

On Thu, Mar 13, 2025 at 12:00:01PM -0500, Bjorn Helgaas wrote:
> [+cc Bartosz since this is related to pwrctrl]
> 
> On Thu, Mar 13, 2025 at 05:10:08PM +0530, Krishna Chaitanya Chundru wrote:
> > If the link is not up till the pwrctl drivers enable power to endpoints
> > then cur_bus_speed will not be updated with correct speed.
> > 
> > As part of rescan, pci_bus_add_devices() will be called and as part of
> > it update the link bus speed.
> > 
> > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > ---
> >  drivers/pci/bus.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/pci/bus.c b/drivers/pci/bus.c
> > index 98910bc0fcc4..994879071d4c 100644
> > --- a/drivers/pci/bus.c
> > +++ b/drivers/pci/bus.c
> > @@ -432,6 +432,9 @@ void pci_bus_add_devices(const struct pci_bus *bus)
> >  	struct pci_dev *dev;
> >  	struct pci_bus *child;
> >  
> > +	if (bus->self)
> > +		pcie_update_link_speed((struct pci_bus *)bus);
> 
> Why the cast?  I guess to discard "const"?  I would prefer to avoid
> that if we can.
> 
> The only existing callers of pcie_update_link_speed() are from bwctrl,
> where it obviously makes sense because bwctrl manages link speed, and
> from pci_set_bus_speed() in the pci_alloc_child_bus() path.
> 
> If we call pcie_update_link_speed() here, do we still need the
> pci_set_bus_speed() in pci_alloc_child_bus()?
> 
> Bartosz, so you have any suggestions?  Is there a point in pwrctrl
> where it would make sense to do this, similar to what bwctrl does?
> 

I'm not Bartosz, but I could speak for pwrctrl.

This should really be part of pci_pwrctrl_notify() in pwrctrl driver. Pwrctrl
driver is already getting notified with device additions and removals. So the
update can be performed once the device addition happens.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

