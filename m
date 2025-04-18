Return-Path: <linux-arm-msm+bounces-54734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F41A9375F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 14:45:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 625201B62CA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 12:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F81274FCA;
	Fri, 18 Apr 2025 12:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q9a/F9Jg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1B421C177
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 12:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744980352; cv=none; b=Qkpd8s9RrCzPSwoMlY7IWNTR2740mBmg54zlhIJmc+TU/PYYxQLYiyr/A+oTod2fMrDsqc/txXjcegPi27O02jdiYf2SKOsQkDDAtqGzsG+kdTy0iK4rvE20A8L6YOViSsWjyTXwuRowaZhEUv3LRUoLrj/w5D4pS+di/dXPkvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744980352; c=relaxed/simple;
	bh=eJmcdcasqheQsUfjBkiQdMc04fHQ0iTzJ96GM9qZpd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qsi/Win3iBtxYtNm/Gh84l1hTaw2HM5BChp2gcYuQOe6EPas2LEKL6JoTA7LZy4W/BhGHXxjoRaAKb9eqN1TKS71cwtnd0jkHG7NT1nF7we4yLxfDHgIu7dX+D3EYhQ2U8K3dm5ijTSZfm/YN+TncZDKMNMhF2rtQzhs2F0lWWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q9a/F9Jg; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-225477548e1so18911625ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 05:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744980350; x=1745585150; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MY1YeGNd6w1Dnai1dYNXkVTuw65HW6WJZU6tne3NRRk=;
        b=q9a/F9JgYYFDNoan2z7TEa9sIGTCCDchRvvOlVWN8NdRXhPXihm1g5HswvsVVQ0Fzc
         FRFxz+xybnj+U/Lmw8PMMI9zs3EUrtMDZA4Z4izGCJV1Ou1xyHFzUb6alOpRrkSoh8Sz
         AkWV8tgMR4e8lo9KrV5kXT5eVTpqUNwzCKjYiP4Edpwh/ahBdlEvLfI5FYrMHOwMtAz7
         kJHhPH6CJtMKKinkTTOGTYJU/Sh/HpyL1c8Wnq1Y9NjHTz1eJ8aoKoUMvKox1GE2vo4l
         9DyeXqfIoO2rqz+6p3016prKWTIgt1h6Sett9zQ9qN0iPMw9YRQ7+0o8JvwKmWx+Q1oJ
         AdIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744980350; x=1745585150;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MY1YeGNd6w1Dnai1dYNXkVTuw65HW6WJZU6tne3NRRk=;
        b=aUvETbugrw0aRLQ4AI5YQqVCG3v/TLYVhvDUXdRyXhTCHkiINFbGL63Qcdx9OzmmMb
         1jiuTvoVC++fCHIK4NzayY4aDdoNo4pT7JIX38MMLD5Zi2svBfLVEKHhOUbzyAhDG+78
         dQ3dea6XC0dDiI83G9UeduLr1aZqFWxcMXmqbo5LIkiXeN24ts04nPiBRcD8iiUw9mVI
         gWUhg5rLmsZyenFocJ1ZWWBkvVcQNnSLdi5UEV3WhW66sHJ/jMnX2GMO+NuJkvu7LWdX
         TVmkxawwKIvjb72Kdxrql5Jv/Dd0HvTn4BNj//RDoMEK5GRiqnB2Eg0loQ7AEH8iBxuU
         U1ng==
X-Forwarded-Encrypted: i=1; AJvYcCW12Df3h1AKoMrIoO+/3y7G43osBqq/HEEyWWLK4YKEmGLOTV7yEgI3HoITozDnmNQEDfVxRoJ0QDCvap/C@vger.kernel.org
X-Gm-Message-State: AOJu0YyePNXtxFMunaEaH+zU/rg8KTiywuCQ55wSyJGZRvzv2rb4Xf2b
	GhnySYbdFxV7AowgvxECZywmg41uixx4PNrfK4PMFyDozAal4d5KPVGqLyOkYRpxhVP7s82ldBw
	=
X-Gm-Gg: ASbGncucQw362YBttaAR7ud3fllSmBU5Z3sky7z+psU/T9E0Ce94LWTFXuqnS9PV6+T
	O4cKLJGs6nGVIPQYtuHGAzTW8itTVMj60a/PLFuM9uFa0ZFLDicrh00KIGtu9PvJzTQ/PlECjYn
	W0hrlIdMg9XAJQ1gPJFCcfKikxpwvzCBXPLYr9bOJNPnH/lpuaoRsP2Hz/J6CrG4hVe2nCzfGfP
	e5eevs6XiU5JF4pcYfq0BeJzQWnjezq8eYOHayJBZtboZbpf/5GeCQ644KoltvmgDNYZycek6fy
	imnH9V04z/NIBiOJdeuVIj8pMa61PEauJHgFFpMIkqsyPzF4wr3xatRP6/TdU2ZA
X-Google-Smtp-Source: AGHT+IHeaaTGjZPgOQ9SxEkyin52xIGApRW/zhdV9OBxFloBKDs8lYnW8IxD27iYpLOVTohhHonpig==
X-Received: by 2002:a17:902:d506:b0:220:d439:2485 with SMTP id d9443c01a7336-22c535acc7amr38422685ad.29.1744980349832;
        Fri, 18 Apr 2025 05:45:49 -0700 (PDT)
Received: from thinkpad ([220.158.156.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50ed1301sm15807295ad.184.2025.04.18.05.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 05:45:49 -0700 (PDT)
Date: Fri, 18 Apr 2025 18:15:45 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Vivek Pernamitta <quic_vpernami@quicinc.com>
Cc: Veerabhadrarao Badiganti <quic_vbadigan@quicinc.com>, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci: Disable runtime PM for QDU100
Message-ID: <tbktzaxkgsc6d4ma4o6vkkcpnqiwghxkvwryrm36znepgqjotl@5n3di2ew3s6f>
References: <20250414-vdev_next-20250411_pm_disable-v1-1-e963677636ca@quicinc.com>
 <ec99379e-fd54-42b0-a383-8ed212072396@quicinc.com>
 <o7rv3xgg3btaoqjlzfenbfkrp3fuw54cx6zqojclcfslfg3ha4@c3sqaqqdjdjv>
 <c8699f79-54cc-4adb-8047-b37a69e69d96@quicinc.com>
 <qrb4ozkj3zxfpo733mf6xf35tetfyekytkty6sq7civhycbahm@c6s3wfvmdycs>
 <2ab9a8f9-b051-4213-a9df-4b2c2fa8c6be@quicinc.com>
 <09ec85db-cc02-4b35-9939-aea3426d0e0b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <09ec85db-cc02-4b35-9939-aea3426d0e0b@quicinc.com>

On Fri, Apr 18, 2025 at 03:40:48PM +0530, Vivek Pernamitta wrote:
> 
> 
> On 4/18/2025 3:04 PM, Vivek Pernamitta wrote:
> > 
> > 
> > On 4/18/2025 2:06 PM, Manivannan Sadhasivam wrote:
> > > On Fri, Apr 18, 2025 at 11:55:24AM +0530, Vivek Pernamitta wrote:
> > > > 
> > > > 
> > > > On 4/17/2025 11:37 AM, Manivannan Sadhasivam wrote:
> > > > > On Thu, Apr 17, 2025 at 10:00:38AM +0530, Veerabhadrarao
> > > > > Badiganti wrote:
> > > > > > 
> > > > > > On 4/14/2025 1:17 PM, Vivek Pernamitta wrote:
> > > > > > > The QDU100 device does not support the MHI M3 state,
> > > > > > > necessitating the
> > > > > > > disabling of runtime PM for this device. Since the
> > > > > > > PCIe core framework
> > > > > > > enables runtime PM by default for all clients, it is
> > > > > > > essential to disable
> > > > > > > runtime PM if the device does not support Low Power Mode (LPM).
> > > > > > > 
> > > 
> > > Not true... See below.
> > > 
> > > > > > > Signed-off-by: Vivek Pernamitta<quic_vpernami@quicinc.com>
> > > > > > > ---
> > > > > > >     drivers/bus/mhi/host/pci_generic.c | 10 ++++++++++
> > > > > > >     1 file changed, 10 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/drivers/bus/mhi/host/pci_generic.c
> > > > > > > b/drivers/bus/mhi/ host/pci_generic.c
> > > > > > > index 03aa887952098661a488650053a357f883d1559b..a011fd2d48c57cf9d1aec74040153267a206d797
> > > > > > > 100644
> > > > > > > --- a/drivers/bus/mhi/host/pci_generic.c
> > > > > > > +++ b/drivers/bus/mhi/host/pci_generic.c
> > > > > > > @@ -43,6 +43,7 @@
> > > > > > >      * @mru_default: default MRU size for MBIM network packets
> > > > > > >      * @sideband_wake: Devices using dedicated
> > > > > > > sideband GPIO for wakeup instead
> > > > > > >      *           of inband wake support (such as sdx24)
> > > > > > > + * @pm_disable: disables runtime PM (optional)
> > > > > > >      */
> > > > > > >     struct mhi_pci_dev_info {
> > > > > > >         const struct mhi_controller_config *config;
> > > > > > > @@ -54,6 +55,7 @@ struct mhi_pci_dev_info {
> > > > > > >         unsigned int dma_data_width;
> > > > > > >         unsigned int mru_default;
> > > > > > >         bool sideband_wake;
> > > > > > > +    bool pm_disable;
> > > > > > >     };
> > > > > > >     #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name,
> > > > > > > el_count, ev_ring) \
> > > > > > > @@ -295,6 +297,7 @@ static const struct
> > > > > > > mhi_pci_dev_info mhi_qcom_qdu100_info = {
> > > > > > >         .bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> > > > > > >         .dma_data_width = 32,
> > > > > > >         .sideband_wake = false,
> > > > > > > +    .pm_disable = true,
> > > > > > 
> > > > > > |no_m3|orno_|m3_support|would be more suitable than|pm_disable|
> > > > > 
> > > > > Yes!
> > > > > 
> We named variable pm_disable because the M3 state is implicitly set during
> runtime PM suspend. Both are not needed and not fully supported for the
> QDU100 accelerator card, so we want to disable runtime suspend for it.

You are mixing terms here. Only M3 is not supported by the device. The fact that
you do not want to enable runtime PM for the device to avoid latency is a side
effect of that. So you need to name the variable as 'no_m3'.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

