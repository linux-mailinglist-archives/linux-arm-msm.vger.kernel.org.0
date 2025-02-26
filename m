Return-Path: <linux-arm-msm+bounces-49416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F635A454E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 06:32:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2159189B62C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 05:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28CA621ABA4;
	Wed, 26 Feb 2025 05:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UNcSHEow"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4260425D55A
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 05:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740547923; cv=none; b=NZwWSySiNnzhvHVtcDaPgIAhskTVkFFl2Hh0tFOw8jxVOpMorXKLSF9azIDl/YN/YZVhAFwTaXSUtrRzcjEKBpNJm3IhQfFCQOnFRaTK/Xc/4To55whoEOKZ1UVQQLDlH10LMdL+PmnJwblYDmXSkriRW8PGOS4Ionyw2KFHK2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740547923; c=relaxed/simple;
	bh=aRqVdEuak5heTNn+0IQ7qSzt5Pfpvlefp5Eal42WI6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p+YYYPBf8xG4CaYmGJLWfjN9eLxf6xGdzd4U7uz+mZCquGb8BZEG3FPXknX7PbKkFnpxuhywjYcC5bkunM3bdr7QVgF0E4Tk1GOhZ9e/4tLmBEVVrgm2KMfbuUYg4fl4byU/IOf0hP8ErPFTZAmox6WNcwp5l3TI4ZaNjjL/gmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UNcSHEow; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-220f4dd756eso135750565ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 21:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740547920; x=1741152720; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cs/FB4vjop09Xx6EiHePqeXJoRbdqusicfo9VoaYw5E=;
        b=UNcSHEowNK9r1D3LFH/yGNXwxbZbKYfP+G2EMK/v3rydARUsj/HJ1618zBZoHZZZnC
         P6B68dDbwL8sxmz52YTkov4tpQD+0l1txdYJC8smuFcpzTO02MvYE/rD/sp3toQdsYg0
         ABekkQsLJurf+WpU8qrKoIoUNmhfpXNxIwdlLERnGsY58nBcOj+UIJxOe/oQFJigpQYZ
         UtPEOFhcsfM8Vlo0hYpzCgWgIJaB5zdksVsobHs0qbKwLAsg1nSknWQe1a3Blw97TCKk
         vDbA8+SAVz4ywvktewBD759dkaYy9xhvFK5bR/4VNk+0j6bbQ2qPsku5p9F822LcXi7O
         XlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740547920; x=1741152720;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cs/FB4vjop09Xx6EiHePqeXJoRbdqusicfo9VoaYw5E=;
        b=qH7Kj80WvblQLOcrGLt3kk0guh4Hq5mV/ReB36+/KKTUhzXq7ys24gwzaYPL3I0Tk9
         cgGgt8yEeZrR9DDcgsQADaPE32cxlZST+JaALb6DmOGP5vC74hi10DA88za6l0cAw2JF
         FMcoXlF5UZkRPZFrgwIcNyedeu/c+4tn23vLHlkMAKzvxKp/dge2b4fXMGIyiOgo+IxK
         Ipr9erBPPdVj7z/Rh33X0GkwQ1zcsoZlKxjpkdzkXwF7CXITwlGG+7d5pxjFMhiCqNql
         8zzYFOYQtpkw3JVfoy5X6kOWxyn8TGQNhKVGpmBrwIUJUKAobViH5js9qGWgF6EnanDk
         Y5yw==
X-Forwarded-Encrypted: i=1; AJvYcCXOv1QrdDMJG0sdpg0xLybFz3tuB0XFgjiWqySBM6kRsUbQQ0aGi/30e3wGsmePEfXwRcxiHBvvQlFgXIeb@vger.kernel.org
X-Gm-Message-State: AOJu0YylGNzTMLORaWoEm0y1KmxTIcKM2nIw4yILinJmIOnjq8CuqrwD
	Sdl5nH1YE60SExDEQS/v3ZL49jbaW+IbiIHOupubaQnTEC7vGcFlb+obgOw4lQ==
X-Gm-Gg: ASbGncsOZRfOgmQF4ck34yrzAPc5YTAZCmF0C6bKSBazShFej3jZN05dK8EUuA6U/QL
	ZubYKFs5G3GKb+bHhNjx+3ja4JjETc7Kcrkmu3mGY4tAKBxHEqktPzMM2PNs+zbLKkMCL+g0CF+
	Cd/NCS1S6YwpTvwghAw+eZ24hWA0W7Oiyfd/C1qnxXkykYlJgk2PvnvTRYDE6R4KIqCQuMgp1Se
	z8KrTMpJUeCtNR/yQLuQio+QsdX/8K6A7U12PqB/6XrpKB24UCMQIQSkl5bT39TY0n5Oa4yvpWE
	JEpVm9RGJqXlXTgeCHMHZsj+HZA3XBL5CqAOj5tzv5lIvWrnosQHUKw=
X-Google-Smtp-Source: AGHT+IEPcQAWKYX9SpkFskmh4pTKxjy5wF3kTp/GFxEcYxWygfsPcia+keXfCSwcEiGOT4D3V58cmw==
X-Received: by 2002:a05:6a00:3d48:b0:730:75b1:7218 with SMTP id d2e1a72fcca58-7347918de02mr10524786b3a.16.1740547920456;
        Tue, 25 Feb 2025 21:32:00 -0800 (PST)
Received: from thinkpad ([120.60.72.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a7f9aafsm2570705b3a.105.2025.02.25.21.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 21:32:00 -0800 (PST)
Date: Wed, 26 Feb 2025 11:01:55 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Qiang Yu <quic_qianyu@quicinc.com>,
	"Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, vkoul@kernel.org,
	kishon@kernel.org, p.zabel@pengutronix.de, abel.vesa@linaro.org,
	neil.armstrong@linaro.org, quic_devipriy@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] phy: qcom: qmp-pcie: Add PHY register retention
 support
Message-ID: <20250226053155.5cdzeorzb5jlvdna@thinkpad>
References: <20250224073301.aqbw3gxjnupbejfy@thinkpad>
 <7ffb09cd-9c77-4407-9087-3e789cd8bf44@quicinc.com>
 <ea5de507-1252-4ff3-9b18-40981624afea@oss.qualcomm.com>
 <20250224122439.njrcoyrfsisddoer@thinkpad>
 <eea55dfa-3dd3-488b-958c-cd20e18a7d7d@quicinc.com>
 <20250225081744.3aprpztylrdgs2cl@thinkpad>
 <4a672888-a90e-434c-b494-bb58b91c99a2@quicinc.com>
 <zppwzqdi5xbggurbqho6ivuorvlubldpjw3pyw2fdgrap4nrhp@5otsko6o5cv3>
 <47f5ab83-d25f-4132-83a6-38236575510c@quicinc.com>
 <ophii26vvcogjtvktsexi6ffnug2wi5hjsppyb44uhypk43o5b@t4bbghgatd73>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ophii26vvcogjtvktsexi6ffnug2wi5hjsppyb44uhypk43o5b@t4bbghgatd73>

On Wed, Feb 26, 2025 at 07:19:11AM +0200, Dmitry Baryshkov wrote:
> On Wed, Feb 26, 2025 at 11:12:18AM +0800, Qiang Yu wrote:
> > 
> > On 2/25/2025 7:46 PM, Dmitry Baryshkov wrote:
> > > On Tue, Feb 25, 2025 at 06:08:03PM +0800, Qiang Yu wrote:
> > > > On 2/25/2025 4:17 PM, Manivannan Sadhasivam wrote:
> > > > > On Tue, Feb 25, 2025 at 04:06:16PM +0800, Wenbin Yao (Consultant) wrote:
> > > > > > On 2/24/2025 8:24 PM, Manivannan Sadhasivam wrote:
> > > > > > > On Mon, Feb 24, 2025 at 12:46:44PM +0100, Konrad Dybcio wrote:
> > > > > > > > On 24.02.2025 9:46 AM, Wenbin Yao (Consultant) wrote:
> > > > > > > > > On 2/24/2025 3:33 PM, Manivannan Sadhasivam wrote:
> > > > > > > > > > On Thu, Feb 20, 2025 at 06:22:53PM +0800, Wenbin Yao wrote:
> > > > > > > > > > > From: Qiang Yu <quic_qianyu@quicinc.com>
> > > > > > > > > > > 
> > > > > > > > > > > Some QCOM PCIe PHYs support no_csr reset. Unlike BCR reset which resets the
> > > > > > > > > > > whole PHY (hardware and register), no_csr reset only resets PHY hardware
> > > > > > > > > > > but retains register values, which means PHY setting can be skipped during
> > > > > > > > > > > PHY init if PCIe link is enabled in booltloader and only no_csr is toggled
> > > > > > > > > > > after that.
> > > > > > > > > > > 
> > > > > > > > > > > Hence, determine whether the PHY has been enabled in bootloader by
> > > > > > > > > > > verifying QPHY_START_CTRL register. If it's programmed and no_csr reset is
> > > > > > > > > > > available, skip BCR reset and PHY register setting to establish the PCIe
> > > > > > > > > > > link with bootloader - programmed PHY settings.
> > > > > > > > > > > 
> > > > > > > > > > > Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> > > > > > > > > > > Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> > > > > > > > > > Some nitpicks below.
> > > > > > > > > > 
> > > > > > > > > > > ---
> > > > > > > > [...]
> > > > > > > > 
> > > > > > > > > > > +     * In this way, no matter whether the PHY settings were initially
> > > > > > > > > > > +     * programmed by bootloader or PHY driver itself, we can reuse them
> > > > > > > > > > It is really possible to have bootloader not programming the init sequence for
> > > > > > > > > > no_csr reset platforms? The comment sounds like it is possible. But I heard the
> > > > > > > > > > opposite.
> > > > > > > > > PCIe3 on X1E80100 QCP is disabled by default in UEFI. We need to enable it
> > > > > > > > > manually in UEFI shell if we want.
> > > > > > > > IIUC this will not be a concern going forward, and this is a special case
> > > > > > > > 
> > > > > > > I'm wondering how many *special* cases we may have to deal with going forward.
> > > > > > > Anyhow, I would propose to atleast throw an error and fail probe() if:
> > > > > > > 
> > > > > > > * the platform has no_csr reset AND
> > > > > > > * bootloader has not initialized the PHY AND
> > > > > > > * there are no init sequences in the kernel
> > > > > > > 
> > > > > > > - Mani
> > > > > > Hmmm, regardless of whether it's a special case, we can't assume that UEFI
> > > > > > will enable the PHY supporting no_csr reset on all platforms. It's a bit
> > > > > > risky. If we make such an assumption, we also won't need to check whether
> > > > > > the PHY is enabled by UEFI during powering on. We just need to check
> > > > > > whether no_csr reset is available.
> > > > > > 
> > > > > I am not supportive of this assumption to be clear. While I am OK with relying
> > > > > on no_csr reset and bootloader programming the PHY, we should also make sure to
> > > > > catch if the PHY doesn't initialize it. Otherwise, the driver would assume that
> > > > > the PHY is working, but the users won't see any PCIe devices.
> > > > > 
> > > > > > But it makes sense to check the exsitence of PHY senquence. How about
> > > > > > adding the check in qmp_pcie_init, if a PHY supports no_csr reset and isn't
> > > > > > initialized in UEFI and there is no cfg->tbls, return error and print some
> > > > > > error log so that the PCIe controller will fail to probe.
> > > > > > 
> > > > > Sounds good to me.
> > > > I'm wondering is it necessary to add this check? In current PHY driver,
> > > > for PHY that doesn't suppot no_csr reset there is also no such check.
> > > > If a PHY supports no_csr reset and isn't init in UEFI and there is no
> > > > cfg->tbls, the worst issue is link training fail and PCIe controller will
> > > > also fail to probe. Adding sucj check seems not change the result.
> > > Failing the training is a random error which can mean a lot, e.g. the
> > > missing voltage rail. An explicit check is beneficial, it helps
> > > developers (and users) to better understand the reason of the failure.
> > In the struct qmp_phy_cfg, tbls is not a pointer, we can't directly check
> > if tbls == NULL to determine if the PHY init sequence is available. Can we
> > add a separate patch to change the definition from
> > "const struct qmp_phy_cfg_tbls tbls" to
> > "const struct qmp_phy_cfg_tbls *tbls" like tlbs_rc and tbls_ep, even though
> > this will affect all platforms?
> 
> Of course no. There is no need to introduce extra indirection. Checking
> for qmp_phy_cfg.tbls.serdes_num should be more than enough. No matter
> what, the PHY with a proper configuration tables will have non-empty
> SERDES table.
> 

+1. The check needs to be present in this series itself and it makes absolute
sense to have it. Otherwise, it will become a hard to debug issue.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

