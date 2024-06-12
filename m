Return-Path: <linux-arm-msm+bounces-22450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FD99055BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 16:52:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2CDD1F253A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 14:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D06A417F37E;
	Wed, 12 Jun 2024 14:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MJYcE4KY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC1917F374
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 14:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718203920; cv=none; b=eg8MHDQtt2mDn3DlO8FjxAGlQWKt26SDzndhjSJjEU7LgPTtFcxILFkCVmMX3EFJmQsn5giS3udeQJPsU0t8m+XNR/Ew9H71s/v0eNiLbqpyrPAf0ky2tIvNfNyxe0HftEFay0CPcfk6/r+CVYirCko1uyDV39VSaYB8NEqq26k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718203920; c=relaxed/simple;
	bh=AeqMoyy136EGDb0dzZP8XtwJcrC4ZlwbNxyV6GvQdiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VfWhUqKJdNZRSIiBKA+xDh3uGxUdULMnCybQLF/mnNkVqRvfPrT3XrVnbUuMxEkN5Bs6ZX9L05R26dqu6xKZM5wCTAbe/w/VnwWy/q4MwVeMOPE011J5Wnp6K0OgT0+sZgER5GnOn7GzB7uPw0WsQ+twAE+7f7VpjRsDdtLkzUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MJYcE4KY; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-681ad26f4a5so1531873a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 07:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718203918; x=1718808718; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pdm0MxlnE9mvGLW6dM72J7+DWmReIl//Ic2Mk/zy3V0=;
        b=MJYcE4KYrgYajp92pF0JkPnJDSf3Sy48hRTuQ3mg0GWbGMJt/2AT9OEE68x/Y6FHsT
         eoH4U6vB6LHYqhIPX0o+Bd4JXY/4cZ3tKW15dJTl8Zu/WrorJTje5DrNXi/AXTzovd4/
         cKdwr2oh9CaInA+wwKVPUUF0Iv9HzikU1KaorOwn6EJHo+4r0zjjbX57xKQ2aHZlrv42
         SElfcUoq6qZ75YMCxyw7yk0TUsm/0WwiLTh8mpWFZHSCVSYmJdm2y6aAL0v8YgPcO0Pu
         j7lwzjRpUfdIhIfpGHrGvYazuaer/78uGWypCILPoebZQXZHDsGkFMRsl2KrUCceE/3a
         Dj4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718203918; x=1718808718;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pdm0MxlnE9mvGLW6dM72J7+DWmReIl//Ic2Mk/zy3V0=;
        b=Q5pKUfjqakcPp05093g/Uzv2yG3a3XMvNwjEUauCEegxNYXurOWSCie4eXh/UQNSMU
         UhX1r+hwLWs7vXs5A7KmGN1HCUXGz1XV4OcsHdRnJdbL7eErw0IYnIL3NrLP5YAW8WNV
         SlyW6l/IZxL0lyth3qxdCSIYOeMb2Ol68krQ5roNTEylUEHjxA7ZQtSBFXLqRejT2yT0
         LKuDmHWjo6UkOyg6BnvQPKp06Rf28FeL8D81gnXy6h8F9y5WLFsMIM7zmlbaDv0MSE+q
         5f/6qfAZcqO8leGyk1gsjjg7f9nWrch0LthDu2SCbqaxuF0VsCVmw2Koy/0nwjL9fhTq
         2CyA==
X-Forwarded-Encrypted: i=1; AJvYcCWfHEu2wI8UbfN7GZxqTWDnl9PaVqmLbfZpwEJoH/BJ9L2Z0TQnb//Hnk46v4dSD26Nzsf/zGOHfPUKMuJ40zIJUy9eQNWkuwE6MU1EKA==
X-Gm-Message-State: AOJu0Yxgq+jSKL4L9bbvigWyCafHtxe5LkShhG5bQ7H05WSX2eGXLp1F
	5DAnfp98yokh6+C6zwC7syGuw99JRMTw8hDkA3zQlB+uO2E7zyqDdolcTJXbpg==
X-Google-Smtp-Source: AGHT+IEEszIpfWjt+j2J+ofzaMw29P0ZLiOqhilxxHJLGEkXkLRKQGtaaf54uh3t5ga5appr/f9iEw==
X-Received: by 2002:a05:6a20:430f:b0:1b7:d050:93e5 with SMTP id adf61e73a8af0-1b8a9b4de5bmr2487914637.15.1718203918415;
        Wed, 12 Jun 2024 07:51:58 -0700 (PDT)
Received: from thinkpad ([120.60.129.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c4a76ab1c8sm1863792a91.52.2024.06.12.07.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 07:51:58 -0700 (PDT)
Date: Wed, 12 Jun 2024 20:21:47 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Slark Xiao <slark_xiao@163.com>, loic.poulain@linaro.org,
	ryazanov.s.a@gmail.com, johannes@sipsolutions.net,
	netdev@vger.kernel.org, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] bus: mhi: host: Import mux_id item
Message-ID: <20240612145147.GB58302@thinkpad>
References: <20240612093842.359805-1-slark_xiao@163.com>
 <20240612094609.GA58302@thinkpad>
 <87aecf24-cdbb-70d2-a3d1-8d1cacf18401@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87aecf24-cdbb-70d2-a3d1-8d1cacf18401@quicinc.com>

On Wed, Jun 12, 2024 at 08:19:13AM -0600, Jeffrey Hugo wrote:
> On 6/12/2024 3:46 AM, Manivannan Sadhasivam wrote:
> > On Wed, Jun 12, 2024 at 05:38:42PM +0800, Slark Xiao wrote:
> > 
> > Subject could be improved:
> > 
> > bus: mhi: host: Add configurable mux_id for MBIM mode
> > 
> > > For SDX72 MBIM mode, it starts data mux id from 112 instead of 0.
> > > This would lead to device can't ping outside successfully.
> > > Also MBIM side would report "bad packet session (112)".
> > > So we add a default mux_id value for SDX72. And this value
> > > would be transferred to wwan mbim side.
> > > 
> > > Signed-off-by: Slark Xiao <slark_xiao@163.com>
> > > ---
> > >   drivers/bus/mhi/host/pci_generic.c | 3 +++
> > >   include/linux/mhi.h                | 2 ++
> > >   2 files changed, 5 insertions(+)
> > > 
> > > diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> > > index 0b483c7c76a1..9e9adf8320d2 100644
> > > --- a/drivers/bus/mhi/host/pci_generic.c
> > > +++ b/drivers/bus/mhi/host/pci_generic.c
> > > @@ -53,6 +53,7 @@ struct mhi_pci_dev_info {
> > >   	unsigned int dma_data_width;
> > >   	unsigned int mru_default;
> > >   	bool sideband_wake;
> > > +	unsigned int mux_id;
> > >   };
> > >   #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
> > > @@ -469,6 +470,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx72_info = {
> > >   	.dma_data_width = 32,
> > >   	.mru_default = 32768,
> > >   	.sideband_wake = false,
> > > +	.mux_id = 112,
> > >   };
> > >   static const struct mhi_channel_config mhi_mv3x_channels[] = {
> > > @@ -1035,6 +1037,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> > >   	mhi_cntrl->runtime_get = mhi_pci_runtime_get;
> > >   	mhi_cntrl->runtime_put = mhi_pci_runtime_put;
> > >   	mhi_cntrl->mru = info->mru_default;
> > > +	mhi_cntrl->link_id = info->mux_id;
> > 
> > Again, 'link_id' is just a WWAN term. Use 'mux_id' here also.
> 
> Does this really belong in MHI?  If this was DT, I don't think we would put
> this value in DT, but rather have the driver (MBIM) detect the device and
> code in the required value.
> 

I believe this is a modem value rather than MHI. But I was OK with keeping it in
MHI driver since we kind of keep modem specific config.

But if WWAN can detect the device and apply the config, I'm all over it.

- Mani

> Furthermore, if this is included in MHI, it seems to be a property of the
> channel, and not the controller.
> 
> -Jeff

-- 
மணிவண்ணன் சதாசிவம்

