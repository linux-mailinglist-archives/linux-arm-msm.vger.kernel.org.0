Return-Path: <linux-arm-msm+bounces-49226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7337AA43774
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 09:22:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3A711733FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 08:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73134152196;
	Tue, 25 Feb 2025 08:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CQ4h2EQh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA616260A48
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 08:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740471472; cv=none; b=nknFbKAUDgCcw779Ccm7ZNbiWVMEkhoub/yoTyEthgk1fFuq4fRsEvWbm+PWc71pwu4D+5SlP8IiwmtwNmVkdsV8dQBjXAsFVQOaoQjmdRvv9T07rcd1mGzVtwDPThtZTEUfFCQvDsHqZzrtUbVbQQpD6TjWD2qwGkQAhgJZb2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740471472; c=relaxed/simple;
	bh=iKdnUTC2SL9RWox/NZyjSQlFZl5BzggDAPhGbl4SBLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qPkznjCSyKcCQbO1TRTvE1fpoqHJECX7MK73uWuIip9a1SfjvLRwpb0wf8aSetWCNl2OiSsQIzuQYa7318cG3zNkmui7zD/LmtPotA75KP8xTO5LcBDNQUrXEkYpLRRIb33oMY4zOd41HzugdBlca6nNUjAHnTty67zBw7vgwcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CQ4h2EQh; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-222e8d07dc6so32509415ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 00:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740471470; x=1741076270; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K5qgM7poxXm8j+OGJ1RCh5kOjLjfZERLhGhbtMwbOUg=;
        b=CQ4h2EQhtBg+LRtoyp7ke3wIeASvEC5PdobVXgfiOIhJlSyt0MfC2w5S/fUg8poSGx
         OFCb8ATGqon0MTaK2P34I9S2lyI537r15D6Ktj+sXUFvlazEMX9D8hu6fYRXfMkVMkqi
         MKQGiWRLmaiRHaFyUPhpI+eYCp8G7rBND0A9uvQx6yEbG+3qGFbldACtfEtbvipqUTWT
         xBW4Ik/ZQakQrYzJ8mXaPuLM8yCa5sgSv39Ag65aWCimOjaHGCZRLkiKzQ6Utpfze2Sv
         3gsLuVdJSA7h4sfYB9Pw/HwKwBfzOTrvfmxZC/hmGf+H8eGGT5CISWl1iZspkNfOs6Id
         PtoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740471470; x=1741076270;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K5qgM7poxXm8j+OGJ1RCh5kOjLjfZERLhGhbtMwbOUg=;
        b=wi5gvQz872sc1MVY7mtNEYyiYHeq2n0EHDqWL/DIAvJiQnnwF768Xz9oE2r0lX9L78
         ikk6rPJI58e7yEFWsJuKkWwLNvKvvxuNJNM/hOZi6r2JoobcXvBHCMOIkqX3eiutk9Hu
         miW9VpShqMWAjpXgjVAZHBFP7DKCfygFQ2Uetywo342wOV7tAl+a/kZiD2IFTucwt9Nr
         nNFT61bjHTBiA1l4cykbnD54WSYljqClxvYYrjQ+EeWkb1AtcKAoL+W/siywOLDFIwkG
         F+UnZP3DTQiWTO3zmSy2bJCddN0ZcoUuejuB7b0KvGwAX8P9TFRomp80dkN3eV4zwsLH
         dciQ==
X-Forwarded-Encrypted: i=1; AJvYcCVakKSRsKeq0u9sY/ePmBJdgi4WYo89BGw1zH/hhAcV3uMsqxu3n5wd5mKrr53AJ3uDMNN+yQb5amFwkZV/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3jk8FBj4hd1/VpOcy+R+JWxOmLdj38bXTjPctx6gHdiipKZcE
	uxhKTBdM6BAe66Cc2e3Tkr5D2/DQNS1jxrXg1xOXcaUeZQ0dfmgFwH0/IiWQnA==
X-Gm-Gg: ASbGnctWu7QpXEV1LXKPz+ozx9toCH6CHpxBBTr/KPxzF0se6JdfYaRMwQxWQw1d0A8
	knUbzeZtg+BhC7BQVqOfpsuDcM2NlSGDSYP/YAfzNWUMm3k8Gqi0qPRCmr2NU3J+MNAOWYyIyQa
	R1dpHjzkzHF+D7oO+Vcttd/zJm00svMaVdj165oSS8KdwwHAabZkZYxigkMGWO6ARKLkdFiZnPm
	dCFr/O2NhyOmy40OEvVUmvcSoWfGB4LBS4+CibNSDjeuGhaz9jkW5RLFuNXyO0tCUV8o7DRvpjo
	qRDKG7HPPrChzbUfiZyE+kXBQImMI/iBWZXF
X-Google-Smtp-Source: AGHT+IEpO/yJbCJfiyxz5Zgl+Ab9e8pW5yGytcKSCdHEpsimzdcIh/9jYIizG0EAUBk3flqU4p1GwA==
X-Received: by 2002:a17:902:ce11:b0:21f:6167:183a with SMTP id d9443c01a7336-2218c3f434fmr337409465ad.15.1740471469949;
        Tue, 25 Feb 2025 00:17:49 -0800 (PST)
Received: from thinkpad ([36.255.17.214])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a092eb0sm8545385ad.142.2025.02.25.00.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 00:17:49 -0800 (PST)
Date: Tue, 25 Feb 2025 13:47:44 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: "Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, vkoul@kernel.org,
	kishon@kernel.org, p.zabel@pengutronix.de,
	dmitry.baryshkov@linaro.org, abel.vesa@linaro.org,
	quic_qianyu@quicinc.com, neil.armstrong@linaro.org,
	quic_devipriy@quicinc.com, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] phy: qcom: qmp-pcie: Add PHY register retention
 support
Message-ID: <20250225081744.3aprpztylrdgs2cl@thinkpad>
References: <20250220102253.755116-1-quic_wenbyao@quicinc.com>
 <20250220102253.755116-3-quic_wenbyao@quicinc.com>
 <20250224073301.aqbw3gxjnupbejfy@thinkpad>
 <7ffb09cd-9c77-4407-9087-3e789cd8bf44@quicinc.com>
 <ea5de507-1252-4ff3-9b18-40981624afea@oss.qualcomm.com>
 <20250224122439.njrcoyrfsisddoer@thinkpad>
 <eea55dfa-3dd3-488b-958c-cd20e18a7d7d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eea55dfa-3dd3-488b-958c-cd20e18a7d7d@quicinc.com>

On Tue, Feb 25, 2025 at 04:06:16PM +0800, Wenbin Yao (Consultant) wrote:
> On 2/24/2025 8:24 PM, Manivannan Sadhasivam wrote:
> > On Mon, Feb 24, 2025 at 12:46:44PM +0100, Konrad Dybcio wrote:
> > > On 24.02.2025 9:46 AM, Wenbin Yao (Consultant) wrote:
> > > > On 2/24/2025 3:33 PM, Manivannan Sadhasivam wrote:
> > > > > On Thu, Feb 20, 2025 at 06:22:53PM +0800, Wenbin Yao wrote:
> > > > > > From: Qiang Yu <quic_qianyu@quicinc.com>
> > > > > > 
> > > > > > Some QCOM PCIe PHYs support no_csr reset. Unlike BCR reset which resets the
> > > > > > whole PHY (hardware and register), no_csr reset only resets PHY hardware
> > > > > > but retains register values, which means PHY setting can be skipped during
> > > > > > PHY init if PCIe link is enabled in booltloader and only no_csr is toggled
> > > > > > after that.
> > > > > > 
> > > > > > Hence, determine whether the PHY has been enabled in bootloader by
> > > > > > verifying QPHY_START_CTRL register. If it's programmed and no_csr reset is
> > > > > > available, skip BCR reset and PHY register setting to establish the PCIe
> > > > > > link with bootloader - programmed PHY settings.
> > > > > > 
> > > > > > Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> > > > > > Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> > > > > Some nitpicks below.
> > > > > 
> > > > > > ---
> > > [...]
> > > 
> > > > > > +     * In this way, no matter whether the PHY settings were initially
> > > > > > +     * programmed by bootloader or PHY driver itself, we can reuse them
> > > > > It is really possible to have bootloader not programming the init sequence for
> > > > > no_csr reset platforms? The comment sounds like it is possible. But I heard the
> > > > > opposite.
> > > > PCIe3 on X1E80100 QCP is disabled by default in UEFI. We need to enable it
> > > > manually in UEFI shell if we want.
> > > IIUC this will not be a concern going forward, and this is a special case
> > > 
> > I'm wondering how many *special* cases we may have to deal with going forward.
> > Anyhow, I would propose to atleast throw an error and fail probe() if:
> > 
> > * the platform has no_csr reset AND
> > * bootloader has not initialized the PHY AND
> > * there are no init sequences in the kernel
> > 
> > - Mani
> 
> Hmmm, regardless of whether it's a special case, we can't assume that UEFI
> will enable the PHY supporting no_csr reset on all platforms. It's a bit
> risky. If we make such an assumption, we also won't need to check whether
> the PHY is enabled by UEFI during powering on. We just need to check
> whether no_csr reset is available.
> 

I am not supportive of this assumption to be clear. While I am OK with relying
on no_csr reset and bootloader programming the PHY, we should also make sure to
catch if the PHY doesn't initialize it. Otherwise, the driver would assume that
the PHY is working, but the users won't see any PCIe devices.

> But it makes sense to check the exsitence of PHY senquence. How about
> adding the check in qmp_pcie_init, if a PHY supports no_csr reset and isn't
> initialized in UEFI and there is no cfg->tbls, return error and print some
> error log so that the PCIe controller will fail to probe.
> 

Sounds good to me.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

