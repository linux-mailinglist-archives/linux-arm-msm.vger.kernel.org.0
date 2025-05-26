Return-Path: <linux-arm-msm+bounces-59377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4419AC396D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 07:53:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 960AC7A2D5B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 05:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFA271C8612;
	Mon, 26 May 2025 05:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WM/Bq9Or"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745AF72636
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 05:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748238797; cv=none; b=Tpf6/80faKDy9zVcAuctvAPP3di72HBXwoO9FV2UX2M0b2AkOtp2A250+CVCn4xOQavM7j6knlFeusH9V04X9bDUfnafzTDUVjF3jUIEMQs/lI0MR9L1JTAqvfVKYOyV8ImwZ4qTYm6gbqMJOI3ApZWxN7bTgNsHhcpBQJuOldE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748238797; c=relaxed/simple;
	bh=kmyubVlunoIUiEKvSOIf5A+2whmj3s42M06AcmAhLsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I7ptD79lTayPL4bw4yTeT+2zAQP09dVq3+o5So7d4bNq6nwpKzBrvUHAleqy2wOqobv/162PCfIBcYa04t1g4DHcRVmBN2Ix4nwcO0PxL/lNzgGeF/9LP2jleWvfY9N5TZfLtZAqgo2HMhbFqwZtLIE64ti8AQgeMyvXNgNlOXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WM/Bq9Or; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-30f0d8628c8so1840633a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 22:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748238795; x=1748843595; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BZ91f7dL2KrSUC6ZCQ76XjXZbCOo3Qh60BX2sHpVW4o=;
        b=WM/Bq9OrgoQ+/LEMZVrGLzThu1fB5CoGfseukGa4srXBexOpTgaB4M9Me3Gi6DzQL+
         FUZAlQ1dnpfsSr1NdLFRRfK5uYmnvoZGys2iGI+6VBd4LzrtfP/kYixaDrSNTXgWd7PJ
         4bydNdqCBQKjvDs8GieOEpSY1oeEosPa66iTuOldJQ6I/7f7C6jeylIQkcwDRgvv+knj
         MvswvnQZrQUO0BpdR0fuMa6LYUPTq/6T6zsV2Ald2PFpal2Msch4g9FoTr3XhrHp2kS2
         tas24SZc7+aq+YMgXLWYYVZUHYk4v/6WGnF8Pv5GWB2FnHEFtkkVH6HG+g3mq6E0ZhjA
         FFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748238795; x=1748843595;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BZ91f7dL2KrSUC6ZCQ76XjXZbCOo3Qh60BX2sHpVW4o=;
        b=YLLtZyv60am+xFJBxH+cksaz92sevgae5RCn/lj6D9IQPILjIqaWQEzFKirIMJ6rIt
         Jin10xMHA+c4Jiyfgoxu31R4MOUKAGK42Xv3mjGD3ZmSPsgKjlv5eNt6cSej88yDYkVq
         Xo2SsU3UoWMygjIToJ+bFrCwqtpsuPDLHC9aqREZgJaAbKudA6FCWdRPUA8aMaj2d5uU
         UvZiQ0AZ7qlpxY/hNxKj3/QCclDsqDo9/kx/VwZ8HrRT5Fx9zJq7e+R2CgY7vfJGc46F
         H5G1bPqev/svjPqc8SB2+FDNAAiQVGGKXLHSQvHffoTIb/0kzQDwppgEtlmpmjTHVN0Q
         R8AA==
X-Forwarded-Encrypted: i=1; AJvYcCU+oV8I72n/v0dTgYMZIN2/BwQ6viLF4vaHRqLqjLt1YxaPhKq/h6Oc15NY1f2BBGfjMmgKEskqJFB3mUDP@vger.kernel.org
X-Gm-Message-State: AOJu0YyWhPko01Oqwx9RfoDceIinyXAO7IDk9IU67J3ObC5jbCy7SW9U
	pvWhtChxQxLKpC8oAHR9y+/CMK5OEDuZL6bAkOmJPo8SZmaOoF3yk9w/45PdXdK3JA==
X-Gm-Gg: ASbGncv+dYhmrqbwXbwe+bnH6HvUB7D1Ozz7hDZH4BtKPrEZIPlEONIFStRPYr34cO+
	hObH0K07RqeMUNwX+GRURy8ix5pP739KP/rRg8OTjrFy+lq7ltvzJIYmTl6ifQYFQPKGFDaV6rh
	HVvWYe09waKsu4KuuYwHd9isPM5f/gpAyMXWTqySErrrrGe3olHORkJCFSNd+iFuM4pXhMTj/+N
	6i91KmFHFGku5FPFfrqzjNLmtzXNSUuQVCsPObApVqwlOwNVfAlv+nxboHoPHW/PD5eUS+vJxAU
	+yjJDlfV26OH5B4Vh+8IaOpe4qLOME2VjeGtdI1lPhc2IrSCdJPyfj6TUtU5j4w=
X-Google-Smtp-Source: AGHT+IGnHfzhN3nQjnh6URSDPC7YA6MxsMC2oe5i0GekUNsUAvcMub/70E3JjwBAb9SXaVgpwTPaSw==
X-Received: by 2002:a17:90b:4c50:b0:30e:6a9d:d78b with SMTP id 98e67ed59e1d1-3110b7a51c7mr11722634a91.12.1748238794701;
        Sun, 25 May 2025 22:53:14 -0700 (PDT)
Received: from thinkpad ([120.56.207.198])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36385b68sm11490336a91.11.2025.05.25.22.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 22:53:14 -0700 (PDT)
Date: Mon, 26 May 2025 11:23:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cassel@kernel.org, wilfred.mallawa@wdc.com
Subject: Re: [PATCH 0/2] PCI: Slot reset fixes
Message-ID: <5zm6no23j7dakjqksb6b4vwwe4ef6iewc4nl4sjvc6nyjnafbh@jcc6im6ydgwi>
References: <20250524185304.26698-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250524185304.26698-1-manivannan.sadhasivam@linaro.org>

On Sun, May 25, 2025 at 12:23:02AM +0530, Manivannan Sadhasivam wrote:
> Hi,
> 
> This series fixes the issues reported for the slot reset feature merged for
> v6.16.
> 
> This series is on top of dw-rockchip branch where the slot reset patches are
> merged. The patches in this series can be squashed into the respective commits
> since they are not merged into mainline.
> 

Squashed to dw-rockchip!

- Mani

> - Mani
> 
> Manivannan Sadhasivam (2):
>   PCI: Save and restore root port config space in
>     pcibios_reset_secondary_bus()
>   PCI: Rename host_bridge::reset_slot() to
>     host_bridge::reset_root_port()
> 
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c |  8 ++++----
>  drivers/pci/controller/dwc/pcie-qcom.c        |  8 ++++----
>  drivers/pci/controller/pci-host-common.c      | 20 +++++++++----------
>  drivers/pci/pci.c                             | 15 +++++++++++---
>  include/linux/pci.h                           |  2 +-
>  5 files changed, 31 insertions(+), 22 deletions(-)
> 
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்

