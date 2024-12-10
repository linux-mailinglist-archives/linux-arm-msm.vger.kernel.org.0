Return-Path: <linux-arm-msm+bounces-41324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5A69EB45C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 16:09:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D165316865A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 15:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D0E1B0F2C;
	Tue, 10 Dec 2024 15:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v343TJ32"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270BA1A072A
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 15:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733843367; cv=none; b=O/yKQJhgxMc0G15v4oXBsBwcusJAHZ7lJtcT1RabRI8t0hAxkxzvY+nrdnyN4fs/xWWg2xzTlk8Dg/Q1laziSun4ErS19gulbQQh4XH0pfErKJmiMXXLt7NZmdNNRLcZDqnLksWZ2YZwiYK5+aJouTzRf0EjQVySfrJs2vZ1SOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733843367; c=relaxed/simple;
	bh=80/01DvwhCk8ER/fRhyWLCJzR9PTogDCxXobO9F/RVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U1qwl/c63szr82H0roOnLqqkh7bu0I/kAsETvC7a39QOtcFjRXfLzoq00lDxAkX+6QPGcqGn4/LMwMDSXaObet+bDtEozImpYvVIGU8UJEcrRMBqmO/vPLoCGyh/URxCuYsvFxCgpyVLQFf1vQnX55jblh5jl3f2u/6vU10B1kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v343TJ32; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30225b2586cso19724931fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 07:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733843363; x=1734448163; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ONPoAWCr/z6lJfjDFKtgqfFAw1BGCZer+GCPiaXmPhw=;
        b=v343TJ323DUGi5/m5/FrFrr89Ph+Zv0XeBvNt5huqxBnTkff5QRbzRW4pZWUNVttAH
         Tlu95DPvvAHT6zUodswBHcvRf56JzyawVTfBR3dNWKdZBuljZlgr98bGiaYlYhsT2uPr
         gu2V6zwkFTh/b0OkdHryyJxrj6RtGPrHiLfKlc7gYXsQf9dCVs7btgZvkKZX6c2s7A5D
         j16flk5a/dCWOovI+7SnICyPlYr2x69lQCEDNw3b+KKPoQstS9stPw88m8Cgd+fcoYjM
         k5eTuUxolSI1b/X9ta78apmdeiOgLYvib+f/TqAunaMr6fsiBMlz4PwghoiKHHVF7aMN
         xuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733843363; x=1734448163;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ONPoAWCr/z6lJfjDFKtgqfFAw1BGCZer+GCPiaXmPhw=;
        b=NdVmj3OXOQ5sRzXgfs6bFFfnUg9CVhtOPtlTKUxehkwjMAuR2QyH3NQQGOBcdYKSQB
         DAhPzlEDJ7koP2FWdvKt7mXi7/xf5vVIHm/X0ZuSCpGTO4IqWEQYVyuhzxL55RXBcS00
         Xzhu+q+spK9QlUsExNoQtMKNflytjod1IcCQFUv/5kAXUts/kx5jI06S85Y3CFCH+uri
         Zf7Yoq0cDfbOTaDTOs/lUGbAnh9gqPsyJkBNCU5wXsFh6VixG1v7dKeuGSPes8dGwNnZ
         vmDO6TyKLw+XO9cx6I+u+TPsCmyUXLUfhbBWoXKGAURXMb6DDW5BkAbs362VZ3zrQHHm
         hWEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUovP9iwRf6Lj6mLUZ/4VAuLkjG8kZNiiL7ycm0oMpKvlqZSq6xA49wLbwFze0Q5JbRLEKZIihpNhruNTJW@vger.kernel.org
X-Gm-Message-State: AOJu0YySrpqTg5sxIF4vSyCBAef+X0z5jBhNpoxJ3CAULCW7qPWYX6nK
	VtNBBQf3+FcBHm0tsCOe5oyC95p/xycC6UaR4yQ0bu7V7GeoWtQnW/SYwF/BMeY=
X-Gm-Gg: ASbGnctQ+gEIT9Z6kxfvFOJCbZtZ77244xwpjHJFDNVSTsFI31yjgw7UEl6ftWzRPiT
	XkoIJAXs7z/B8qOd95ANBHZPq0ikj75hfLeaqIfua3SKA+YbNdF0gmszLKoj3B4SQQs0aDBaRdD
	Ojla9nRJ02PMEbumQJkIJOKp6Az9SesIplg/qPXquyOjKSlY3HONmV7vMW3THze6sdPCoTXvtSn
	QRuv/kLkYL4HFln6NFzFLl9SQipUHSjK/4anw07WftdIhMvc+wBtWDbYFAMwjRUlDyh4tlyrkdI
	NouIWNefFVrXgvsUx7hk1dEinNEFdNx2zg==
X-Google-Smtp-Source: AGHT+IH4LG5o5SbyEh1Vovj71WLwSfFbBGhk7NJh/k58qLpSj2p2TBBGrOFSDDq9rnPlmsaGShNmLg==
X-Received: by 2002:a2e:be0b:0:b0:2ff:b8f5:5a17 with SMTP id 38308e7fff4ca-3023282c1femr12568441fa.5.1733843363188;
        Tue, 10 Dec 2024 07:09:23 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-302259416c5sm5907321fa.6.2024.12.10.07.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 07:09:22 -0800 (PST)
Date: Tue, 10 Dec 2024 17:09:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xiangxu Yin <quic_xiangxuy@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, quic_lliu6@quicinc.com, quic_fangez@quicinc.com, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 3/8] phy: qcom: qmp-usbc: Add DP phy mode support on
 QCS615
Message-ID: <iqcofcntirmlwcpyfr4yabymqfcgyrij57bibf337tmxpa73t6@npkt6wquenf6>
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-3-09a4338d93ef@quicinc.com>
 <CAA8EJppOR_UXoVpMt-dhfWdCz3UNfsXGdz8X9NqpaSmYj3AZDg@mail.gmail.com>
 <5ea14162-567b-462d-be02-b73b954b7507@quicinc.com>
 <5whv4z7u6fkfwlv5muox5dmv6fow4mga76ammapw7wph7vwv3f@xibcjdfqorgf>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5whv4z7u6fkfwlv5muox5dmv6fow4mga76ammapw7wph7vwv3f@xibcjdfqorgf>

On Thu, Dec 05, 2024 at 08:31:24PM +0200, Dmitry Baryshkov wrote:
> On Thu, Dec 05, 2024 at 09:26:47PM +0800, Xiangxu Yin wrote:
> > 
> > 
> > On 11/29/2024 10:33 PM, Dmitry Baryshkov wrote:
> > > On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
> > >>
> > >> Extended DP support for QCS615 USB or DP phy. Differentiated between
> > >> USBC and DP PHY using the match table’s type, dynamically generating
> > >> different types of cfg and layout attributes during initialization based
> > >> on this type. Static variables are stored in cfg, while parsed values
> > >> are organized into the layout structure.
> > > 
> > > We didn't have an understanding / conclusion whether
> > > qcom,usb-ssphy-qmp-usb3-or-dp PHYs are actually a single device / PHY
> > > or two PHYs being placed next to each other. Could you please start
> > > your commit message by explaining it? Or even better, make that a part
> > > of the cover letter for a new series touching just the USBC PHY
> > > driver. DP changes don't have anything in common with the PHY changes,
> > > so you can split the series into two.
> > > 
> > Before implement DP extension, we have discussed with abhinav and krishna about whether use combo, usbc or separate phy.
> 
> What is "DP extension"?
> 
> > 
> > We identified that DP and USB share some common controls for phy_mode and orientation.
> > Specifically, 'TCSR_USB3_0_DP_PHYMODE' controls who must use the lanes - USB or DP,
> > while PERIPH_SS_USB0_USB3PHY_PCS_MISC_TYPEC_CTRL controls the orientation.
> > It would be more efficient for a single driver to manage these controls. 
> 
> The question is about the hardware, not about the driver.
> 
> > Additionally, this PHY does not support Alt Mode, and the two control registers are located in separate address spaces. 
> > Therefore, even though the orientation for DP on this platform is always normal and connected to the video output board, 
> > we still decided to base it on the USBC extension.
> 
> Could you please clarify, do usb3-or-dp PHYs support DP-over-USB-C? I
> thought that usbc-or-dp platforms support that, but they don't
> support DP+USB pin configuration. Note, the question is broader than
> just QCS615, it covers the PHY type itself.
> 
> Also, is TCSR configuration read/write or read-only? Are we supposed to
> set the register from OS or are we supposed to read it and thus detemine
> the PHY mode?

Any updates on these two topics?

-- 
With best wishes
Dmitry

