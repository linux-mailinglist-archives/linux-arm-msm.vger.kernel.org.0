Return-Path: <linux-arm-msm+bounces-4648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A02D8126E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 06:21:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA7DA282792
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 05:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CDEE63DF;
	Thu, 14 Dec 2023 05:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UAspA/Is"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D8B9F7
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 21:21:42 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6da3659535fso1136033a34.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 21:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702531301; x=1703136101; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+EpxA/oQdOsjZ3ZViQvYoAgBSxxBD7k1MJl0VMHDlZw=;
        b=UAspA/IsK57VOg0BoQsC8pQj/alUB8bxVhcPY94S9xw0qBtoS6fSqtfuOfoj24I4YM
         hftxh+s0oa4pjgxi2/tYMVnmQssr0FvmF9pkEb5aMNcpxpkCQVRhM4kLLX1kadDLkvkl
         LIRt4qXHKFKwnFOhHlx1dMBVX+f11KLvwadj7Rmcs+DO05MWggQ97+Nn6Vn+cfPsU46N
         FXlahyJe/0A3xV8O4B2350ah4759Nog1Q9WCrgFx5R+V3paXNzrxM1zlL8ZdmttRNqA2
         lOId9/NGlvX8salpEXBEpoyqoGu3rVUwa6C14SkjvcKF/qQ/7QTCg7pqW+JNBhA82ztb
         clyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702531301; x=1703136101;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+EpxA/oQdOsjZ3ZViQvYoAgBSxxBD7k1MJl0VMHDlZw=;
        b=iVaWgwxOjZxcg79iXj3VHhPy/Azz5t6r+EXkPSyE/0iRG8Cgs7HmxRZA/PHYosV2MB
         5ATLgcZNx1othTKddEUitpPSWeMQL0Qf8nHSWGMEqSHXVVDKKtIIKqIBxLRzm7HvCqDf
         3SMecJCsHX+B4Pj241g8bN4CH7rrMREzHz7wJsUrXGejcfNBtXSLJan6VQVFA7RWOG70
         ClogMcgVoWdX+5tKXuhEjUoy2E0vjLiILrBP5rNa8v8ktz2SDlvZRzvCECV/ZfqiX4im
         hP+xnyH5AZAjuoYyfZDsp7cQPuE3rzDQ/3VgCG3F3kKs0Mj0SCeYg0RfpzwqZdTWzmgx
         fxpw==
X-Gm-Message-State: AOJu0YyV41mP2JbNGkLT35uYlw5YuFk+JBq/Fz5nOXAcUWUwvQhZ1vsF
	4FYtJYjvxBpkcvLYF1TV458r
X-Google-Smtp-Source: AGHT+IHVTBKVkd8pye6vCTczHqoOYH7dPwaMxiXCor8WD546zVln59FMabz/8e68g683gZ5DkOPHoA==
X-Received: by 2002:a05:6830:10cb:b0:6d9:e37f:5c54 with SMTP id z11-20020a05683010cb00b006d9e37f5c54mr9479978oto.9.1702531301439;
        Wed, 13 Dec 2023 21:21:41 -0800 (PST)
Received: from thinkpad ([117.213.102.12])
        by smtp.gmail.com with ESMTPSA id gu4-20020a056a004e4400b006ce4e3e2524sm10907827pfb.135.2023.12.13.21.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 21:21:41 -0800 (PST)
Date: Thu, 14 Dec 2023 10:51:33 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: lpieralisi@kernel.org, kw@linux.com, kishon@kernel.org,
	bhelgaas@google.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/9] bus: mhi: ep: Add async read/write support
Message-ID: <20231214052133.GF2938@thinkpad>
References: <20231127124529.78203-1-manivannan.sadhasivam@linaro.org>
 <20231213193103.GA1054774@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231213193103.GA1054774@bhelgaas>

On Wed, Dec 13, 2023 at 01:31:03PM -0600, Bjorn Helgaas wrote:
> On Mon, Nov 27, 2023 at 06:15:20PM +0530, Manivannan Sadhasivam wrote:
> > Hi,
> > 
> > This series add async read/write support for the MHI endpoint stack by
> > modifying the MHI ep stack and the MHI EPF (controller) driver.
> > 
> > Currently, only sync read/write operations are supported by the stack,
> > this resulting in poor data throughput as the transfer is halted until
> > receiving the DMA completion. So this series adds async support such
> > that the MHI transfers can continue without waiting for the transfer
> > completion. And once the completion happens, host is notified by sending
> > the transfer completion event.
> > 
> > This series brings iperf throughput of ~4Gbps on SM8450 based dev platform,
> > where previously 1.6Gbps was achieved with sync operation.
> > 
> > - Mani
> > 
> > Manivannan Sadhasivam (9):
> >   bus: mhi: ep: Pass mhi_ep_buf_info struct to read/write APIs
> >   bus: mhi: ep: Rename read_from_host() and write_to_host() APIs
> >   bus: mhi: ep: Introduce async read/write callbacks
> >   PCI: epf-mhi: Simulate async read/write using iATU
> >   PCI: epf-mhi: Add support for DMA async read/write operation
> >   PCI: epf-mhi: Enable MHI async read/write support
> >   bus: mhi: ep: Add support for async DMA write operation
> >   bus: mhi: ep: Add support for async DMA read operation
> >   bus: mhi: ep: Add checks for read/write callbacks while registering
> >     controllers
> > 
> >  drivers/bus/mhi/ep/internal.h                |   1 +
> >  drivers/bus/mhi/ep/main.c                    | 256 +++++++++------
> >  drivers/bus/mhi/ep/ring.c                    |  41 +--
> >  drivers/pci/endpoint/functions/pci-epf-mhi.c | 314 ++++++++++++++++---
> >  include/linux/mhi_ep.h                       |  33 +-
> >  5 files changed, 485 insertions(+), 160 deletions(-)
> 
> Mani, do you want to merge this via your MHI tree?  If so, you can
> include Krzysztof's Reviewed-by tags and my:
> 
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> 
> If you think it'd be better via the PCI tree, let me know and we can
> do that, too.
> 

Thanks Bjorn! Yes, to avoid possible conflicts with other MHI patches, I need to
take this series via MHI tree.

- Mani

> Bjorn

-- 
மணிவண்ணன் சதாசிவம்

