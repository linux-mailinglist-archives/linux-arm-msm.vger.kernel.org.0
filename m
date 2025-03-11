Return-Path: <linux-arm-msm+bounces-51063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C02A5CF18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 20:15:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1A427A1848
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 19:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54F36262809;
	Tue, 11 Mar 2025 19:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kIrkeFel"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772E625B69B
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 19:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741720545; cv=none; b=FEMzpAcQ0+jRpzpo0XFrZvdbhL1qslcXrQfH4zYnRKJRQsmCmc95cmDbTru2yNgp539U71hYUJUjHnuqMbJvKfqUKvx3d5NdLLf5MtqC4+owuKQ9AzB1o3j7OvX7IuBLaOun45MQxI/c6Oe7T+TIf30AUPjN2NZhbmPudRa62z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741720545; c=relaxed/simple;
	bh=krckIoN1Yt1X2R2aNMnVSqupWCPnV/MnderkXA9y9as=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s3Zui0asdkIfFdQWMFagejGqap84AY18tRSZvAcYC6tfTWojEcAoeV6YBMrp+Mq3hFJcYGt6eCEqEWHWftZw+N4PUvRJgT/ybKrXyKEupbooJZu1MwtDv9qL06l97tJDACNkiLq5zwdy/xglpgH3hf7ihCbNq1GOPxbg+AKgS/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kIrkeFel; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso19548195e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 12:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741720542; x=1742325342; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3D7DcqzXtXay65MOmV9DzhULAHuxDLESiJA/LkHgEnQ=;
        b=kIrkeFelWNGVa7qyzF96Gg/uwCrlmB6bDPnXeiQjTBkioPTToBmID8pXQcAGoi81L0
         8fPbdE6Se5YkfEHfVN2h0QBbHSKBXNErUr2GG3B24bSjD3TbzUBCsVi/fl5A/8tEVf9K
         SNyj3LaClEEzsrydQK++OEa+J68zIGtjaPEJaprRKlHt/cylMp4kS7DtYQE9ArjWv8rW
         SUvWcMpK5MxBVrP3ndOROO3zGgtBUK5Nz1hNF9VgC0AXsU7VI6h+IA3GVx2/bdupYzeR
         3R/lY2ln2+t0T+6iSlLwEn+Uvk7jPKFXvLfCo8vnmZPBsCrk8WFyeWMBmHMUduYbwTdM
         xIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741720542; x=1742325342;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3D7DcqzXtXay65MOmV9DzhULAHuxDLESiJA/LkHgEnQ=;
        b=RO+hDMwLIjJK3cFXWMqkYoO0ddoU3ZN3OcM3CF5g80vu4loA9YZBYAnnepjWJcYwq1
         +lvm2FIwsD+rj8RQZ662qWcI3eA9AsjtZC+2qo1LYbJqNTtHoBH0usWKX3uHuaLQqLO5
         gktP6jzzbpkuN/kb9iJNnZ1NNCddjyu14CJFNqjMI2s/7QCOpHoBNL6uGca2RhEcgl0c
         ao5qqeKLx8VlHflxS2SuGOn4Dd/06hy9lQcW+5nVeRQPxaSO6tiVMCMBudDWTiqrLgMj
         a2ofGAdBR1KC8tM1lTUtyJpsuU98v3gsupKu/1yIZNSK4gCQ0IoDn63rbH2eAmTfTpBa
         mS0g==
X-Forwarded-Encrypted: i=1; AJvYcCVefmjND+CYiLeo0zpJS9p891f8gY+qANDHec79H5hqJx+zv9MxI/ysUR56rExUNFFzMNBuckzkIbpnRiCN@vger.kernel.org
X-Gm-Message-State: AOJu0YyyAtGstpClpqtjZr97TjDU2znWkJjzDhtFNcgiXpzP1xmRnPKN
	vCO68SZfqS82rCFQZxdLVfYiRLAKjX2xTkWmnPc/DoANh65SLd1GqjnvtMAZEn4bXVNazkzu+nT
	EPvfwC3EGIl+Bk/j7VkN/2HdguUtHZjoarPqFAA==
X-Gm-Gg: ASbGnctKwOapvGAkAZDmFi/rxncTF64puAclejS40Gwe1lji/hQaVDsiQrn+i/7EpLu
	hsc9VnEHCjNMNycWCIQqQiOUTsQcLRy/RIoOZ9u98VaGYOVDFNLvsbt1d2I8aZuamKE2X6VlGUO
	2tDgGsaIBpOVa58AgLGq8bk3YgL+0=
X-Google-Smtp-Source: AGHT+IEKaY3f/jwf8rjJ6P4i1mXmye8xaJcsyi8fySc9Crm9HPFFdA+QVKIx8M9phSTEfNJutY9OZDhw/KDAR0n/sLc=
X-Received: by 2002:a05:600c:4f0c:b0:43c:eec7:eabb with SMTP id
 5b1f17b1804b1-43ceec7ee09mr102106865e9.8.1741720541648; Tue, 11 Mar 2025
 12:15:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311-wip-obbardc-qcom-defconfig-interconnects-builtin-v1-1-675b6bc57176@linaro.org>
 <CACr-zFC=mPNeeHMp9XnSby+cMQaPWt_3s8iUiCN+EnVPeGad8Q@mail.gmail.com> <uljqxwfgl26txrfqvkvzzpj6qurgmwcbuot7gu2u6rwjaqgncb@jeuyi4mexjff>
In-Reply-To: <uljqxwfgl26txrfqvkvzzpj6qurgmwcbuot7gu2u6rwjaqgncb@jeuyi4mexjff>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Tue, 11 Mar 2025 20:15:31 +0100
X-Gm-Features: AQ5f1JogDXTrmR57agoVvLVzDGF-kWOnB5039Wi_AANd56pvT-_X7Ug39zfiuvE
Message-ID: <CACr-zFDSFizYmrVN-dV334n1kq17UB9k4FxrV20NNQCQMhzrwg@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm interconnects as built-in
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dmitry,

On Tue, 11 Mar 2025 at 19:58, Dmitry Baryshkov <lumag@kernel.org> wrote:
>
> On Tue, Mar 11, 2025 at 07:10:06PM +0100, Christopher Obbard wrote:
> > I sent this patch to start the discussion, some things I found:
> >
> > 1) Some interconnects are missing from arm defconfig. Should they be =y too ?
>
> No, unless those are required for the UART console.

OK, that makes sense. FWIW the cryptic (to me, at least) commit log on
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6eee808134ecf1c1093ff1ddfc056dc5e469d0c3
made me think that the interconnects should be built-in on all devices.

Of course, the real problem here is RB3gen2 not actually finding the
UFS/eMMC device due to no interconnect driver.
Until now, I have been building that into the kernel. I will
investigate instead shoving into the initrd (in both debian and
fedora) which should solve my issue and render this patchset useless.


Thanks,

Chris

>
> > $ grep CONFIG_INTERCONNECT_QCOM arch/arm/configs/qcom_defconfig
> > CONFIG_INTERCONNECT_QCOM=y
> > CONFIG_INTERCONNECT_QCOM_MSM8974=m
> > CONFIG_INTERCONNECT_QCOM_SDX55=m
> >
> > 2) Some interconnects are missing from arm64 defconfig (which should
> > probably be in there) (I have included just two examples):
>
> I think `git log -S CONFIG_INTERCONNECT_QCOM
> arch/arm64/configs/defconfig` will answer this question. The drivers are
> enabled on the premises of being required for a particular device, not
> because they exist in the Linux kernel.
>
> > $ grep CONFIG_INTERCONNECT drivers/interconnect/qcom/Makefile
> > obj-$(CONFIG_INTERCONNECT_QCOM_QCS615) += qnoc-qcs615.o
> > obj-$(CONFIG_INTERCONNECT_QCOM_SM7150) += qnoc-sm7150.o
> >
> > I can handle these in follow-up or v2 of the patchset as follow-up
> > commits, please let me know what you'd prefer.
> >
> > On Tue, 11 Mar 2025 at 19:03, Christopher Obbard
> > <christopher.obbard@linaro.org> wrote:
> > >
> > > Currently some Qualcomm interconnect drivers are enabled
> > > as modules which isn't overly useful since the interconnects
> > > are required to be loaded during early boot.
> > >
> > > Loading the interconnects late (e.g. in initrd or as module)
> > > can cause boot issues, such as slowdown or even not booting
> > > at all (since the interconnect would be required for storage
> > > devices).
> > >
> > > Be consistent and enable all of the Qualcomm interconnect
> > > drivers as built-in to the kernel image.
> > >
> > > Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> > > ---
> > >  arch/arm64/configs/defconfig | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > > index 219ef05ee5a757c43a37ec9f8571ce9976354830..6582baee2ab02ecb2ff442c6e73aa6a23fee8d7f 100644
> > > --- a/arch/arm64/configs/defconfig
> > > +++ b/arch/arm64/configs/defconfig
> > > @@ -1656,11 +1656,11 @@ CONFIG_INTERCONNECT_IMX8MN=m
> > >  CONFIG_INTERCONNECT_IMX8MQ=m
> > >  CONFIG_INTERCONNECT_IMX8MP=y
> > >  CONFIG_INTERCONNECT_QCOM=y
> > > -CONFIG_INTERCONNECT_QCOM_MSM8916=m
> > > +CONFIG_INTERCONNECT_QCOM_MSM8916=y
> > >  CONFIG_INTERCONNECT_QCOM_MSM8996=y
> > > -CONFIG_INTERCONNECT_QCOM_OSM_L3=m
> > > +CONFIG_INTERCONNECT_QCOM_OSM_L3=y
> > >  CONFIG_INTERCONNECT_QCOM_QCM2290=y
> > > -CONFIG_INTERCONNECT_QCOM_QCS404=m
> > > +CONFIG_INTERCONNECT_QCOM_QCS404=y
> > >  CONFIG_INTERCONNECT_QCOM_QCS615=y
> > >  CONFIG_INTERCONNECT_QCOM_QCS8300=y
> > >  CONFIG_INTERCONNECT_QCOM_QDU1000=y
> > >
> > > ---
> > > base-commit: b098bcd8278b89cb3eb73fdb6e06dc49af75ad37
> > > change-id: 20250311-wip-obbardc-qcom-defconfig-interconnects-builtin-258fcc961b11
> > >
> > > Best regards,
> > > --
> > > Christopher Obbard <christopher.obbard@linaro.org>
> > >
>
> --
> With best wishes
> Dmitry

