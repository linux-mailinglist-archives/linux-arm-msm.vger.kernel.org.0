Return-Path: <linux-arm-msm+bounces-46269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19447A1D83F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 15:25:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7AB1160E0D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 14:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42CDFEED7;
	Mon, 27 Jan 2025 14:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xpdyJH/5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E45EEA9
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 14:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737987893; cv=none; b=BHIa/6KObMXVEVRDfm7px0HbfPwIkgkZnzkpjRDCJFBc+0eEScksIYOVpA4NcjQqSloJKtG+n0sKjXCxhbjNGpp41UPGu8LoS2YN7CKmutebY5/vspS9xWQLVEnFalAXVfE9w7GUz1SL/yom3eTzW/ssyhrqc92XHlEftmqgkng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737987893; c=relaxed/simple;
	bh=EyhPBwBiQ91M0zxVRGX9by3jICKOXEvrxtDR0/vOi4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cNX+t6rWVDPY3N70ETZPQPA7tBr16popHvnZxLUuJlXBXpGl53eiQZbr22yYPKVIxbkrePlzV5SGeCamd8DTiDSqOuxRmohkfO4DupSulQrP44oJqnIW66Qc534/OkHR5dUBUNQYRdtvv/tr0pNbIEBZFiO6CqI3yzTwHoytnOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xpdyJH/5; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso4766666e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 06:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737987889; x=1738592689; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aDxxOWu3fI3iDcdEKWaJuUs9DgyAIUQG7oziGiW6Sn8=;
        b=xpdyJH/52xmhtCh/XjIQjWJhD2fF9bfpn1Mzb6l2kjoXN6FDDCePIR0ryFDaNsVYug
         hXH1SgRwZ53rCsI1o+HQ9cCpPeA2hUFZo3oqmwEO2D2IuASLneolqfpQu4mIPGHvU2J6
         q2dL9a4Gx7UzCo33+BgnWyfdv2FOeRLOVoI3a7HgFULho7T3228iATBzHk4YKImV3oAQ
         MsRG9YERNCBDT0xf8RB7DYhHrVcWQAJkuco5G7OWVR4VuWGOsbPZf8q6uf0Z5wU7K/rU
         Hao6718//diSaMNrnhxK/mwumRxuQxqGCxRNNolQeL5SOtDCGFUDbyDhy2r7lH0lfXhc
         z9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737987889; x=1738592689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDxxOWu3fI3iDcdEKWaJuUs9DgyAIUQG7oziGiW6Sn8=;
        b=LKly8wYVfNjbVSmmoqnf8sNjLf8ziFXzFLZyLTY68YSCPLWrJr94cYQz2YzqttnzJb
         ctiZLTfmL0+sO+0esjy84Qn4hyA4VJxrLpK0YFxfbBEoMiCPIelGsUwDxGXVBHOga1vT
         RKmC/gbRLX/BRxtXk/CELh1EXmQFbHV2z69v3u2hfIlccq8aM5kGM1FkPhQEa3R43Wfm
         JCWHx7UNvATAELrYkxHDYL64REGs+29kkfBZ+un/mrHRTwbheXoTrMFIEXpU+pM1Q5MF
         JA+de/iIx5+7mIxUfX2hVvHsE/50LdSrRQX+/NEOZ8s0VoYrlrnWLsayMtEf3XmcfDvL
         mDkw==
X-Forwarded-Encrypted: i=1; AJvYcCVIw1q4eXRFuij5Seo/6iqf6xE/AdAg6TkGX07BezKVZU0OCf6KMXqMq1EVnnQUaqpOvtRRHB/zfTr+UbJp@vger.kernel.org
X-Gm-Message-State: AOJu0YyOVQ1TUJS35mdw9gmcosbgICQBsyTBiTla3bXV5AsrUoSicFD3
	RchFubYNR+ZNpdfG+ZxVsWKKswF8tVD+pei2KBV4buWaoyQVORN7gqUHrCQYy1I=
X-Gm-Gg: ASbGncuRHzsQJATvNwFXJTlPHKCAdgeav9HSIlZvDrBW5fY4akYKxyn361Xz/K9dzpR
	w1ublB88EVRnsebtbEfk3lA93LFS5IMOi5u1nQFCYPSFJjHROPcIwTWEllesuEbVxNh9egilUtC
	fkxrplO0Dj5g+lKfX/dbVdpEgXRECkQpUN0AOOsNe+aTS46h50Qz5jPcKB4HtEUZap76PrAZIkb
	tg4T6xpjO9okG6eif/TGLteJ9Jpxwo961mnUJ1yw0XgxmdpD83MysK1F8bZA6rBHJKLN6hUhJby
	vDc0BFfgxrg3zgKcq2YYCm985uGyZW9lAogAEtE+Uwj71heBE4Ugu21pvQ/D
X-Google-Smtp-Source: AGHT+IESqlrJFUd8o4WG3EsJg0NRnzgOO2V6+BjsGL/z8+RmKae0D4aialVzIoEWPr5okG7c9idrFA==
X-Received: by 2002:a05:6512:b81:b0:542:29ec:d5be with SMTP id 2adb3069b0e04-5439c21f256mr14299786e87.10.1737987889271;
        Mon, 27 Jan 2025 06:24:49 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c822935csm1308558e87.3.2025.01.27.06.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 06:24:47 -0800 (PST)
Date: Mon, 27 Jan 2025 16:24:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/6] phy: qcom: qmp-pcie: Add X1P42100 Gen4x4 PHY
Message-ID: <vranblkrzxcb33pyjqw5nwvef7fepx32r6wilobrmfyjlt5uic@udhfkej5u6zp>
References: <20250125-topic-x1p4_dts-v1-0-02659a08b044@oss.qualcomm.com>
 <20250125-topic-x1p4_dts-v1-3-02659a08b044@oss.qualcomm.com>
 <h6zfhxkc4dj2ueaxipha6prbvmv7pnqglghtjs7vkhlc2s7ndi@vhbj4uojlzwd>
 <A64B8332-78F2-4B76-908E-4119E4A54BAE@linaro.org>
 <cy3x35h4id3gegwb23j6rwblx2pecpw7ffjpri5ddqdd35kzrt@bxdmaumb6bbp>
 <20250126163222.nhcxvr4m2vncwi23@thinkpad>
 <CAA8EJpq-aNVhSc0fTf4zD63VgrzDokR5uvdGiPvecaBHXYtd+Q@mail.gmail.com>
 <20250127053412.anbdj6hgwcmkildf@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127053412.anbdj6hgwcmkildf@thinkpad>

On Mon, Jan 27, 2025 at 11:04:12AM +0530, Manivannan Sadhasivam wrote:
> On Sun, Jan 26, 2025 at 11:43:38PM +0200, Dmitry Baryshkov wrote:
> > On Sun, 26 Jan 2025 at 18:32, Manivannan Sadhasivam
> > <manivannan.sadhasivam@linaro.org> wrote:
> > >
> > > On Sun, Jan 26, 2025 at 01:39:05PM +0200, Dmitry Baryshkov wrote:
> > > > On Sun, Jan 26, 2025 at 12:59:52PM +0530, Manivannan Sadhasivam wrote:
> > > > >
> > > > >
> > > > > On January 25, 2025 11:00:23 PM GMT+05:30, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > > > > >On Sat, Jan 25, 2025 at 04:31:19AM +0100, Konrad Dybcio wrote:
> > > > > >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > > > >>
> > > > > >> Add a new, common configuration for Gen4x4 V6 PHYs without an init
> > > > > >> sequence.
> > > > > >>
> > > > > >> The bootloader configures the hardware once and the OS retains that
> > > > > >> configuration by using the NOCSR reset line (which doesn't drop
> > > > > >> register state on assert) in place of the "full reset" one.
> > > > > >
> > > > > >I know your opinion, but my 2c would still be for not depending on the
> > > > > >bootloader. I think that was the rule for ages for many possible
> > > > > >reasons.
> > > > > >
> > > > >
> > > > > But if Linux or other OS can trust the bootloader, then it makes perfect sense to rely on them. Obviously, the question here is that on which platforms this level of trust should be established. And the answer I got was starting from the compute platforms (atleast X1E).
> > > >
> > > > Is there any way how those values can be lost that we still might want
> > > > to support ? The GDSC going to the OFF state? Some deep sleep state or a
> > > > power collapse? Actual suspend to RAM (instead of current S2Idle)?
> > > >
> > >
> > > As per Konrad's reply to my identical question, PHY register state is supposed
> > > to be maintained by MX domain even during CX PC. This seem to be case on X1E
> > > based platforms (compute).
> > 
> > Is MX on during S2RAM?
> > 
> 
> Qcom says that their current s2idle implementation is equal to S2RAM (when CX PC
> is achieved). In that sense, yes, MX is ON during S2RAM. Do note that, on
> majority of the platforms, MX is the AON (Always ON) domain.


Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

