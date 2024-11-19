Return-Path: <linux-arm-msm+bounces-38368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4EA9D2C28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 18:10:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D0B7280A8C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 17:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91C0C1D0B9B;
	Tue, 19 Nov 2024 17:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cR/KpTDE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEFD1D0967
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2024 17:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732036245; cv=none; b=NEbr/BHSSmxXdSMGOATPd22VP6WMCC7Oo82X1bdkqapwpXqIeaSCjc84hf3otxX8kPUfXHGJn4XzdwGJ6J/kriVVloBkQWu/0M5htmp+hms6ydMgZUnTV6zpdabwd14LrznmCt2DfYHGv3wp/REfrRs60JmOM//d0URR/DzZK8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732036245; c=relaxed/simple;
	bh=kvLbJ579ZwGw3Oaztv7AZcVCN5b4MH15HVGgmcj/8IM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BDyP63tpWxyX6u4EvNjShhoZ79xIgRemJWmuNlTi4QUgBIiEE+EMzCayKFS1iZUCnkp9XK/ZhM0E1Yr27sTiAK9mXYXqdCSd05GjzcWhz6jLO019EbjO+A7AZUKq7pR/EkvmJMq2mtvGZl1M8ijyHoY2lpqIGSXcSDSK/vCCGcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cR/KpTDE; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7f43259d220so2377650a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2024 09:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732036243; x=1732641043; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iUUWg+UGhAfZ69jZ3O5Hxqi/tTrKLMmbgFAb621AXyg=;
        b=cR/KpTDEgBQGSMM9IX/9DcjhRtrjBECc4DLuL++mrfhj6BYnu/PJXqxmD3ZjPBPqtf
         vD5AIaHmNPfxic9TDtIZz6KN/MY96olvObj7Xs4bhAf2aR8+1u6hEzZj8sgtNkoSw/A2
         Wpp/vatU9zB1qp1K88sLHDjkUdItS8+nBr5PTEjwHFUuSRktdjEjJo7sQHenxKwzGcE1
         X8wX+8Aa7F7DCceXmJXgWAWnA1jOZt9FlpjY2G3ltZC3R2ykk597Q80tZLpPndrhL27J
         moBoXxO31JMfvQ/KMBYTxPnEXck7DjooJsE88jn3qnI7t+hh2uENKoJGCY1q3/oTeYbB
         8x8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732036243; x=1732641043;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iUUWg+UGhAfZ69jZ3O5Hxqi/tTrKLMmbgFAb621AXyg=;
        b=GNvohOGXhXuynodwHuMxe96GBiqEFEmAyS5x7Bwm0E71eqNTl3FGOJmP30dcHFdZcH
         RlUB9oLnD06Q6qRWpryQyNhA8yywV7UxvDsvBaodyBJLk/4JLLAWI/mutrs/wffkG7oi
         G6HSHNAGMQwLIbDLGGHwndm2DDNymsx9h902+Jvr8FwF21iBzL+NmlclD3x6g++3DEIW
         9SLbKoLP52X+xmKTpqnLWoqCgZMimnAYRDrYlI0cCI71/oYODKZ8T7YM27eqcnf0KK/l
         daUPAQ2fWuUS7wj9VdlfbzbjojlAxFJusKQgMNMSgirnI3sJpzf704bZw0WlYIYUind7
         GuPw==
X-Forwarded-Encrypted: i=1; AJvYcCVD7VXSVt9qBWAQ+tXU17nzO5t+D1aW/nTGFxhAnNwCHyVjMihu6fWP6USWCMuMtQ7/UprZJrBnsjeoiLpE@vger.kernel.org
X-Gm-Message-State: AOJu0YxweqK0tzvDeGSeznnytiZlPwR58R2at7AiOsiKeV4msTL0Ezg6
	feSpu/i6g31ftP1PzM1lfE3aMCRe+jd/lDUA1xqQ32BqK521xYeR5Geh1Xq4uwU34Zwm7Kv2gEQ
	=
X-Google-Smtp-Source: AGHT+IE7E3Zp2kHPwg5lXWa8INvXlJxcFdphad7gNVjXAQACkRCQ/vp5YyEU16SHnGc89YQPOSIJpw==
X-Received: by 2002:a17:90b:3c52:b0:2ea:95ac:54d1 with SMTP id 98e67ed59e1d1-2ea95ac56damr6412420a91.19.1732036243274;
        Tue, 19 Nov 2024 09:10:43 -0800 (PST)
Received: from thinkpad ([36.255.17.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea499aff4esm5636614a91.34.2024.11.19.09.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 09:10:42 -0800 (PST)
Date: Tue, 19 Nov 2024 22:40:37 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Mayank Rana <quic_mrana@quicinc.com>
Cc: jingoohan1@gmail.com, will@kernel.org, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, krzk@kernel.org,
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_krichai@quicinc.com
Subject: Re: [PATCH v3 0/4] Add Qualcomm SA8255p based firmware managed PCIe
 root complex
Message-ID: <20241119171037.53zxi47u643zztvx@thinkpad>
References: <20241106221341.2218416-1-quic_mrana@quicinc.com>
 <20241115112802.66xoxj4z5wsg4idl@thinkpad>
 <6e9db73e-0441-453c-978c-961f308f8a11@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6e9db73e-0441-453c-978c-961f308f8a11@quicinc.com>

On Fri, Nov 15, 2024 at 10:31:17AM -0800, Mayank Rana wrote:
> 
> 
> On 11/15/2024 3:28 AM, Manivannan Sadhasivam wrote:
> > On Wed, Nov 06, 2024 at 02:13:37PM -0800, Mayank Rana wrote:
> > > Based on received feedback, this patch series adds support with existing
> > > Linux qcom-pcie.c driver to get PCIe host root complex functionality on
> > > Qualcomm SA8255P auto platform.
> > > 
> > > 1. Interface to allow requesting firmware to manage system resources and
> > > performing PCIe Link up (devicetree binding in terms of power domain and
> > > runtime PM APIs is used in driver)
> > > 
> > > 2. SA8255P is using Synopsys Designware PCIe controller which supports MSI
> > > controller. Using existing MSI controller based functionality by exporting
> > > important pcie dwc core driver based MSI APIs, and using those from
> > > pcie-qcom.c driver.
> > > 
> > > Below architecture is used on Qualcomm SA8255P auto platform to get ECAM
> > > compliant PCIe controller based functionality. Here firmware VM based PCIe
> > > driver takes care of resource management and performing PCIe link related
> > > handling (D0 and D3cold). Linux pcie-qcom.c driver uses power domain to
> > > request firmware VM to perform these operations using SCMI interface.
> > > --------------------
> > > 
> > > 
> > >                                     ┌────────────────────────┐
> > >                                     │                        │
> > >    ┌──────────────────────┐         │     SHARED MEMORY      │            ┌──────────────────────────┐
> > >    │     Firmware VM      │         │                        │            │         Linux VM         │
> > >    │ ┌─────────┐          │         │                        │            │    ┌────────────────┐    │
> > >    │ │ Drivers │ ┌──────┐ │         │                        │            │    │   PCIE Qcom    │    │
> > >    │ │ PCIE PHY◄─┤      │ │         │   ┌────────────────┐   │            │    │    driver      │    │
> > >    │ │         │ │ SCMI │ │         │   │                │   │            │    │                │    │
> > >    │ │PCIE CTL │ │      │ ├─────────┼───►    PCIE        ◄───┼─────┐      │    └──┬──────────▲──┘    │
> > >    │ │         ├─►Server│ │         │   │    SHMEM       │   │     │      │       │          │       │
> > >    │ │Clk, Vreg│ │      │ │         │   │                │   │     │      │    ┌──▼──────────┴──┐    │
> > >    │ │GPIO,GDSC│ └─▲──┬─┘ │         │   └────────────────┘   │     └──────┼────┤PCIE SCMI Inst  │    │
> > >    │ └─────────┘   │  │   │         │                        │            │    └──▲──────────┬──┘    │
> > >    │               │  │   │         │                        │            │       │          │       │
> > >    └───────────────┼──┼───┘         │                        │            └───────┼──────────┼───────┘
> > >                    │  │             │                        │                    │          │
> > >                    │  │             └────────────────────────┘                    │          │
> > >                    │  │                                                           │          │
> > >                    │  │                                                           │          │
> > >                    │  │                                                           │          │
> > >                    │  │                                                           │IRQ       │HVC
> > >                IRQ │  │HVC                                                        │          │
> > >                    │  │                                                           │          │
> > >                    │  │                                                           │          │
> > >                    │  │                                                           │          │
> > > ┌─────────────────┴──▼───────────────────────────────────────────────────────────┴──────────▼──────────────┐
> > > │                                                                                                          │
> > > │                                                                                                          │
> > > │                                      HYPERVISOR                                                          │
> > > │                                                                                                          │
> > > │                                                                                                          │
> > > │                                                                                                          │
> > > └──────────────────────────────────────────────────────────────────────────────────────────────────────────┘
> > >    ┌─────────────┐    ┌─────────────┐  ┌──────────┐   ┌───────────┐   ┌─────────────┐  ┌────────────┐
> > >    │             │    │             │  │          │   │           │   │  PCIE       │  │   PCIE     │
> > >    │   CLOCK     │    │   REGULATOR │  │   GPIO   │   │   GDSC    │   │  PHY        │  │ controller │
> > >    └─────────────┘    └─────────────┘  └──────────┘   └───────────┘   └─────────────┘  └────────────┘
> > 
> > Thanks a lot for working on this Mayank! This version looks good to me. I've
> > left some comments, nothing alarming though.
> Thanks for reviewing change. I would address those in next patchset.
> 
> > But I do want to hold up this series until we finalize the SCMI based design.
> ok. I want to send these changes which are prepared based on previously
> provided feedback, to see if we have any major concern here in terms of
> getting functionality.
> 

That's fine. My comment was a note to the maintainers.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

