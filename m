Return-Path: <linux-arm-msm+bounces-39616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E76889DEB23
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 17:36:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB68D1617C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 16:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD3B1514F8;
	Fri, 29 Nov 2024 16:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IPC2Vp6t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7AD14831E
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 16:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732898167; cv=none; b=BL/4OIbzbrSamzLC8GMGRk0l368Y4/Leq+3Zn9PKcsK6J/dnsHEJLySXhT8rvCQaL/3eonIl9IAUzDh/kqXcDlj+awTGp8bOjCedXeiZH1jpJWmC2veyTwZydoE4Bx0IeOHMYhYbg2j+6aMPO7YVfL/TqNGvHxHPawBPJtEN0DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732898167; c=relaxed/simple;
	bh=InsIgXgLx7YQgnFJY31nsgNKsFevoHh8zNHdDTTAP4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tuWvnj0H50XOFQsAHCAm+P2E8yGgrZeK+As8ow9B0CMQvc6K/CslW5o/Y7APhx0TfCRGpXk5PIz2acheTNGtMU/aMMfBAcR01c3dkrRiuQYjgnzhIz3asfWKX5zKLz/hIebpCa8TzB3QBkCLoUMFkHd+SlIBeZGgYIl9EA5ZmKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IPC2Vp6t; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7252fba4de1so1892604b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 08:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732898165; x=1733502965; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KAS4qmfhKfQCTxA5dEKDiEOUQ8ijX4qkasD6tbLsLDY=;
        b=IPC2Vp6tUBD6IckBjhM4xhIBQtW6h2a6Vb+KKST/25Ev1SZT96/UDRqWq+nd0KZ5ui
         xRiQVgQxuyNr6tFpO+Q21r/SwNqJ+aRmmeFqv8rhSeRgCe1Os1Ar4OzNJgFVwkwPczr/
         MLubFE5MMUtxzTbYbZ1KYTePxz8vaz2plXYks2F2eSIIhhxSF6lxpe/DU8rcQ3to44k3
         6ZTOH9SgvrJgleMjTcvxuzw2J2oIJQ5tXzJdr0FExIbZ+O2tdZhY++KEBH0WrEswuIK4
         AYJjUi6uEkpSINUBb66kQkHLMH47Z+N+WmmC/dAuTJXjoKCfYeAlSwxJG0XGcwwOJthd
         7hdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732898165; x=1733502965;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KAS4qmfhKfQCTxA5dEKDiEOUQ8ijX4qkasD6tbLsLDY=;
        b=f1WjJSt1WtTlBIKo6TllosErQJusTsb/Hu3Kx3/UmpSk/cbIl9cnBGL8wt05RMOj0e
         eAC8Yu8AIQBIfP8LGBRmJ14lXqUN0hQ5afA/O32gdZl7mPP1TCFL/ygwMwWiK7wC5flC
         874PNofEd+Otbx9V3+urAeP9gCJdQBgyhdzC3o3FJiG/7SIKsFNg2JZPXYFF6BvhJgwL
         gsqiJyvPA+5h2LbHoGgOoNApAvNJye17R63Zr+8NAYpUaMkEeuChuNlV0R+rxNDzyrw/
         Ld0YUHV6WFetyaQuGz+CWY8dfaNQbVb8tV0gn+J9RFI1/Q7/q6lqFRe6YZZnZyEpLZgk
         iEgA==
X-Forwarded-Encrypted: i=1; AJvYcCUSiwW5WK95XQqSIYDc8lSrhYSdtCQsFgBbv+of7lytUrAJpDsxqJw3seBJ26TIQ2l7PbjAWRf+e1lQJoAs@vger.kernel.org
X-Gm-Message-State: AOJu0YwY4a1H1l2hdx3foKXmgrRVoqsoDNt9KUZikreNGDqFykZMKpQH
	/1QtKd+hq8QohIjdmBtooHiHOAzwk3I8CaIdEkDDY/Wv+H9XIsANZ8OrDKR+aQ==
X-Gm-Gg: ASbGncuyfpRzta3o3Ola+YBxtliZIzPkeQmZNCiEJ07E6/RamNRiPgwJEI9V1TLv7or
	XhYiUYyicJy28i2mXHQvYGTD4+kPy3GY25/0If1RFwcBO4+g9HFgl6IVDuF35obJr8DIxBqy0Yx
	t+o5mo652rsW4yWinwnWrA74h8sO3escf1dDaT8ZR+bcldyxGNR20sjYzaKaDlELvwbyxvXBrRA
	7ZFb9lLufRhEnS95N+iBY3RTeC1FXONNgkD0M9BaCK92vRe7Y67wK6PnuRG
X-Google-Smtp-Source: AGHT+IFsGXl/IU7bXt5NrZfPNWz7fsWHGMuIQFgh7MSCJkj2+YOoJBdoGnq61lBkrYp/j8HLEMymlA==
X-Received: by 2002:a17:902:d491:b0:215:4e40:e4b0 with SMTP id d9443c01a7336-2154e40e808mr23212585ad.9.1732898165186;
        Fri, 29 Nov 2024 08:36:05 -0800 (PST)
Received: from thinkpad ([120.60.57.102])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215219c31a0sm32731185ad.249.2024.11.29.08.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 08:36:04 -0800 (PST)
Date: Fri, 29 Nov 2024 22:05:55 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: kw@linux.com, gregkh@linuxfoundation.org, arnd@arndb.de,
	lpieralisi@kernel.org, shuah@kernel.org, kishon@kernel.org,
	aman1.gupta@samsung.com, p.rajanbabu@samsung.com,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	bhelgaas@google.com, linux-arm-msm@vger.kernel.org, robh@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 4/4] selftests: pci_endpoint: Migrate to Kselftest
 framework
Message-ID: <20241129163555.apf35xa6x5joscha@thinkpad>
References: <20241129092415.29437-1-manivannan.sadhasivam@linaro.org>
 <20241129092415.29437-5-manivannan.sadhasivam@linaro.org>
 <Z0nG3oAx66plv4qI@ryzen>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z0nG3oAx66plv4qI@ryzen>

On Fri, Nov 29, 2024 at 02:51:26PM +0100, Niklas Cassel wrote:
> Hello Mani,
> 
> On Fri, Nov 29, 2024 at 02:54:15PM +0530, Manivannan Sadhasivam wrote:
> > Migrate the PCI endpoint test to Kselftest framework. All the tests that
> > were part of the previous pcitest.sh file were migrated.
> > 
> > Below is the exclusive list of tests:
> > 
> > 1. BAR Tests (BAR0 to BAR5)
> > 2. Legacy IRQ Tests
> > 3. MSI Interrupt Tests (MSI1 to MSI32)
> > 4. MSI-X Interrupt Tests (MSI-X1 to MSI-X2048)
> > 5. Read Tests - MEMCPY (For 1, 1024, 1025, 1024000, 1024001 Bytes)
> > 6. Write Tests - MEMCPY (For 1, 1024, 1025, 1024000, 1024001 Bytes)
> > 7. Copy Tests - MEMCPY (For 1, 1024, 1025, 1024000, 1024001 Bytes)
> > 8. Read Tests - DMA (For 1, 1024, 1025, 1024000, 1024001 Bytes)
> > 9. Write Tests - DMA (For 1, 1024, 1025, 1024000, 1024001 Bytes)
> > 10. Copy Tests - DMA (For 1, 1024, 1025, 1024000, 1024001 Bytes)
> 
> I'm not sure if it is a great idea to add test case number 10.
> 
> While it will work if you use the "dummy memcpy" DMA channel which uses
> MMIO under the hood, if you actually enable a real DMA controller (which
> often sets the DMA_PRIVATE cap in the DMA controller driver (e.g. if you
> are using a DWC based PCIe EP controller and select CONFIG_DW_EDMA=y)),
> pci_epf_test_copy() will fail with:
> [   93.779444] pci_epf_test pci_epf_test.0: Cannot transfer data using DMA
> 

So the idea is to exercise all the options provided by the epf-test driver. In
that sense, we need to have the DMA COPY test. However, I do agree that the
common DMA controllers will fail this case. So how about just simulating the DMA
COPY for controllers implementing DMA_PRIVATE cap? I don't think it hurts to
have this feature in test driver.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

