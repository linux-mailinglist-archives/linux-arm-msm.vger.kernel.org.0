Return-Path: <linux-arm-msm+bounces-71182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16741B3AB36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 22:02:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0433A007B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 20:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34A201FE474;
	Thu, 28 Aug 2025 20:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Aj/zIdXi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE6D220F5D
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 20:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756411317; cv=none; b=ZIOXZS1fc2vHwBjNWO73Vd1dzCs8ZJ4+zDYnqYE3wcHpWK+v0wkH5MnwyjYbUXuur75zs/4OY1cjMveuku8Gb9DQp5MqaUmmKHIWaHijbhV8RdGL64eaLOidnx2USDmAiNWzZaYtDOCZr7uAxVoziWO8kMG3/fwni+38ck+AeCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756411317; c=relaxed/simple;
	bh=oFN7wNXWLeYqEKNIevToJQ/RzV8ZlgtiskiMxC59NR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kU9ulBgRWmxVlp13O3xUJkNBjNiIo0e08QJ2Z1USCDMUnCDZFuywCEChsLHjaic5ifcKjI6fo+y+J+F0DAW4tzwEi87yHLmD5p1d6KZqCwXxSywUhmmYTHc37SkNnW6wnVZb2uiOWQX4Z0pK7rEesE0gHRyzqCDY4qWJpEg7h8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Aj/zIdXi; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-771e15ce64eso1193809b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 13:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756411315; x=1757016115; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=phR9doI5X4q1LR98gybIzZyU1kdJD+t4ijHV2CMLbUI=;
        b=Aj/zIdXinEHD9VWJVQyaxdHA1AEVnfZS1PfPz/Bbe3byufLPQKQVtJY1hsM5+Ej1l0
         rJwsOfAEqa0ZiOu7oiXbjDVsdsO1dyzJ1XccuIIYxiFhFNf/YYCcwAr8PHOCPeyf8E3e
         2WdUI50wmVl8zyun3MvRq8VyfzLu76yke29ck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756411315; x=1757016115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phR9doI5X4q1LR98gybIzZyU1kdJD+t4ijHV2CMLbUI=;
        b=kwI2p51Pxh7Zs1X9ekxuh/Xsa1L0hbv1zmRJx6L3pFb8ylS8YhIgKY1d/VWJAnBIw1
         4N+VqbAlg5GtPTt8rOeBtPOA7lx67FzZyWbnxcl4HTN0dN7PgVjPDQsUYqFO6wfI0Iwz
         xR0tur2f2CmUmjVLX2q+fEXvu76r9cX4CqrXLQtzE5o5SDTHE7PgsJQJXH0uroQe8vah
         1t1nj5/TgkVbuyzczNaHIDQdU4iStJSnENkeje/qRzecsg7m3bntGrulNij3/bir0wJ9
         xC9Vu3uP7Qk0kJSfjrr+JUWP1EtvThFYmp77AkeV2EkemVCyxqKt+s5B79ZZlsTfOpKO
         YSkA==
X-Forwarded-Encrypted: i=1; AJvYcCVXY6c77xV+sCoXSsacmZucvuvYFEwWQF/GyfEq2AuqxfbY/gIPI7zeQoZF71Emn7mEEkCNI3eV9TBxKk45@vger.kernel.org
X-Gm-Message-State: AOJu0YyC5E3iRVA6Ts/N28s56rKsuPohVmJnURXeO1846oTzY2O9oxeu
	5bh61uMtKak8+ce45NmZ7Whd7Fn4QZJOTHLyB7ZsRFBl5fPIPKCglsU0RTFUPbYY0w==
X-Gm-Gg: ASbGncs68cPmUvAg/AMHwIUILoU8KY1F9flkV/zzhmNBaxhCA3LcY0IG+nP3pvEM42B
	Y6HWVWp34q8AJSEymMpeIDGfMkChIBqPlmjMBLv2MX97S6Vx0JIgigQNHZOak30u9SU+ipH6FLB
	/Y1TQ9RXTFLc+qwufmsNqfe3ytfwFPkKOl7DKU5PHClL1VdtrtKg1+kzIm2dibI7TcP7ivnd1mM
	vToNyxcmVmJ4XCski5u6mtWCPzAPuncKZKTHP3pLzjY78zH05Lf9EAWbbcxcIVqp0lXKjxHAC3L
	34nwmGzP/YWnGLJ3ZJ3AhI9USYHQ0PB6/WvR+EpIjpNMZfGNxhs5pZR4knzyqszl9V8BpeUxtNx
	CYFPiF+atHnkHq72UTysOdkWaozYl35i5rO/Vx25suQOJC8tuk+HtumF3bxNH24NNx4+/ufU=
X-Google-Smtp-Source: AGHT+IGRMI2y6ukLzuxA0A2Y52962J0xzxUUU/p9/lxC5pAaBaeFe2iw+3odm0xYYkw4AIuMGBT6Hw==
X-Received: by 2002:a17:903:13c8:b0:248:6d1a:430f with SMTP id d9443c01a7336-2486d1a46b2mr149396845ad.25.1756411314801;
        Thu, 28 Aug 2025 13:01:54 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:2893:df0f:26ec:df00])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-24905da3be1sm3479885ad.69.2025.08.28.13.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 13:01:53 -0700 (PDT)
Date: Thu, 28 Aug 2025 13:01:51 -0700
From: Brian Norris <briannorris@chromium.org>
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Niklas Cassel <cassel@kernel.org>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v6 0/4] PCI: Add support for resetting the Root Ports in
 a platform specific way
Message-ID: <aLC1rzdTVoN56Phc@google.com>
References: <20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com>

On Tue, Jul 15, 2025 at 07:51:03PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> Hi,
> 
> Currently, in the event of AER/DPC, PCI core will try to reset the slot (Root
> Port) and its subordinate devices by invoking bridge control reset and FLR. But
> in some cases like AER Fatal error, it might be necessary to reset the Root
> Ports using the PCI host bridge drivers in a platform specific way (as indicated
> by the TODO in the pcie_do_recovery() function in drivers/pci/pcie/err.c).
> Otherwise, the PCI link won't be recovered successfully.
> 
> So this series adds a new callback 'pci_host_bridge::reset_root_port' for the
> host bridge drivers to reset the Root Port when a fatal error happens.
> 
> Also, this series allows the host bridge drivers to handle PCI link down event
> by resetting the Root Ports and recovering the bus. This is accomplished by the
> help of the new 'pci_host_handle_link_down()' API. Host bridge drivers are
> expected to call this API (preferrably from a threaded IRQ handler) with
> relevant Root Port 'pci_dev' when a link down event is detected for the port.
> The API will reuse the pcie_do_recovery() function to recover the link if AER
> support is enabled, otherwise it will directly call the reset_root_port()
> callback of the host bridge driver (if exists).
> 
> For reference, I've modified the pcie-qcom driver to call
> pci_host_handle_link_down() API with Root Port 'pci_dev' after receiving the
> LINK_DOWN global_irq event and populated 'pci_host_bridge::reset_root_port()'
> callback to reset the Root Port. Since the Qcom PCIe controllers support only
> a single Root Port (slot) per controller instance, the API is going to be
> invoked only once. For multi Root Port controllers, the controller driver is
> expected to detect the Root Port that received the link down event and call
> the pci_host_handle_link_down() API with 'pci_dev' of that Root Port.
> 
> Testing
> -------
> 
> I've lost access to my test setup now. So Krishna (Cced) will help with testing
> on the Qcom platform and Wilfred or Niklas should be able to test it on Rockchip
> platform. For the moment, this series is compile tested only.

For the series:

Tested-by: Brian Norris <briannorris@chromium.org>

I've tested the whole thing on Qualcomm SC7280 Herobrine systems with
NVMe. After adding a debugfs node to control toggling PERST, I can force
the link to reset, and see it recover and resume NVMe traffic.

I've tested the first two on Pixel phones, using a non-upstream
DWC-based driver that I'm working on getting in better shape. (We've
previously supported a custom link-error API setup instead.) I'd love to
see this available upstream.

Regards,
Brian

