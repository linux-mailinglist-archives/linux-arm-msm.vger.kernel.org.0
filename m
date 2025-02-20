Return-Path: <linux-arm-msm+bounces-48726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9455BA3DF80
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 16:57:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36C8C16A9A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 15:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE161F9ED2;
	Thu, 20 Feb 2025 15:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z2HUu2HK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9FF14A82
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 15:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740066938; cv=none; b=VTQKojISz/GwVEd9UEx2t+dGiZHHCdFqToHjx7I0M7Jt2Dzforaoo4PMWROo3uuk11ZzHd4YrJ06ZFWjWEFdPgUCeHb30OX1LEJzWPpnoAi7zOfgU60hRlcYZO7onrv+ueOkEgiV1U8HIXYC+6KxALPAabAMQKVvU/ov3bl8aWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740066938; c=relaxed/simple;
	bh=omAPwoso6uBL42xDlBreEMt1jkCkza3U/DeWmv3X2jM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U3vbismJzpYr4gWIKOjWi03cm0d1BFBjxB6TLNHaS5Zc/i7FzsxNpQCcbGwGAbMJdcp5pl5yr6GO+7ugK1SfKVhINZYeYHOBFVTiHZy8Xs0toshaYhiGsLlV6TVyNkssfsHxwlsf6KJByQX4QL/hhYw7m3pzHwo+vwfovm+LQ3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z2HUu2HK; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54605bfcc72so2524203e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 07:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740066934; x=1740671734; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5uYsXTWYRSMPSzYeuorstCzH5NUmzaHqKU5zOS+Htmw=;
        b=z2HUu2HK7MqY3Zx+s91Qtgfa3WLcjBzI+cnMX7gWD5xAURM0WKnNDIVjzAOjUa3EQV
         c1Ij/6jkDGdn/9DngGzKnS3JmkxRc/WuDdENgl82Zr0CrTclnLMdmtJ7VvcnqHqPF2BO
         I1l2hOe4bTxTlWwB6fM4+KWuRxj2T2SgdVW+rG+WCLCFoSQ6x/LKW4VTWkjHhsMnZwEz
         zHCKtKJF+F5TcOQ16NuzIlk3SNwAw3RcvRrAA7D2cN6kDqmwvrYHnP0epUmbouDQeuNw
         mTwCRgFtOrGwv05g6+dbbK1J/ExtO53lhjZI4Bau2jf88mg7v/syazAiFKDJciNwvt9C
         ae6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740066934; x=1740671734;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5uYsXTWYRSMPSzYeuorstCzH5NUmzaHqKU5zOS+Htmw=;
        b=tZDPrGw499AyIq4bc9uh7V7QGHzHd7MH9v8PPfKXD6AUUqK56ujn5KsVpfL1NhrOxd
         Znabf+kLU+RMeGpCjK8WXzoa4FSSZdeR5Bl9Q0eutZ4Ok4qb1ZLS6hWAcYsz3TGwS/VH
         rlAfKUt8p5LkgSVRbppVL0flhXdd1heB5LlubscuazbOKIgaV9uXeE3iPs8T+7LvZglM
         5X1tT/KhsYl+SO2/nz52hEacTlZCIR2D1Ov7M7EV5L04qhs/EpeejUeT+cGjxaiBcRwz
         aBXGmjoC885RqyCUBT44ZphLHwuvlNupWdJOnCC4JPoVe+sNQZLra4odzyq+PRyeJiHl
         Xv0g==
X-Forwarded-Encrypted: i=1; AJvYcCUwTIUvgUdIyKN2wNJlT7hjx34KN6XSTBROz7z8G9pIUl0agF+UL0rbGCGdbQwfE0PpQl09ZeoipIS7dQq4@vger.kernel.org
X-Gm-Message-State: AOJu0YyaKSqbOA8+2gtf04e05RkXlYkGTXW3Qp9ZB0j1KxDH24hs/wpl
	3r78Xdb+i974zMvXn6LrVMpQfZWlKoOVPxXTw+ntgSFJPlCBFDCRfVPR3ikglOc=
X-Gm-Gg: ASbGnctTiiT7Q3vrgSs43Ripgmdp0fNJRczHZHq8+W6d47XMwfUD8uKHft1C+yTxF5h
	F6uT0mvLEQ1btgJA/ofUj5gJ0HgQWoee3/UsLhjheqU5YpkJuvxLwaZSFFQU4G5a0FS8jBBYmhw
	XlmWzWJh1MCVjdhoYq1wZ3qCmlF4EFnWF8wKi8X03XanqLPLHeuCRh28TXsl7ZnEYC60IttfkBM
	xyueNINa+2xbTpYylCD/NQ6jvCIR3Fz+/M5dPLDZl0LLyS1/YkFvAIoS9ViujqieipsLXVUQ7UK
	DR3LCCSHSTZhxi0C+D/jXNaorUJcKSf8IzcVwUFVp0HI6ARNLQ+uvrbGjwHxfsKYchJX4/s=
X-Google-Smtp-Source: AGHT+IEtf97SsjRtuL6d8IE3D1pgFUBRXbcvvxV4g3GwdxhA+EzzwQ1kj3+RIrBDm6cRLGQC3ggahA==
X-Received: by 2002:a05:6512:a90:b0:545:fdd:9ef4 with SMTP id 2adb3069b0e04-546e4569f20mr1523857e87.8.1740066934306;
        Thu, 20 Feb 2025 07:55:34 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5461f6448adsm1414735e87.70.2025.02.20.07.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 07:55:33 -0800 (PST)
Date: Thu, 20 Feb 2025 17:55:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v2 1/5] drm/msm/dsi: add support VBIF_CTRL_PRIORITY to
 v2.8.0 controller
Message-ID: <xmamjbm67hxxmzwnilqwlb6esbpf3rtxayitzln4lvwfl4ok3c@7g6gsyp36f6y>
References: <20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org>
 <20250220-dual-dsi-v2-1-6c0038d5a2ef@linaro.org>
 <tu6aaz6whzkqz4at26o2h6pvcua53squfpgfmiw3i4qshojoij@2erqc3zmxmos>
 <CABymUCNYypP9h+r1mPhxtmJsFTfXW1DzvwRLk=6p+9qmY5ofFQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCNYypP9h+r1mPhxtmJsFTfXW1DzvwRLk=6p+9qmY5ofFQ@mail.gmail.com>

On Thu, Feb 20, 2025 at 11:45:18PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2025年2月20日周四 18:27写道：
> >
> > On Thu, Feb 20, 2025 at 06:07:52PM +0800, Jun Nie wrote:
> > > This change originates from the Qualcomm Android Linux driver. It is
> > > essential to support a dual-DSI configuration with two panels in
> > > some circumstances per testing. As the name suggests, this modification
> > > may enhance the bandwidth robustness of a bus.
> >
> > Please start by describing the problem and the result of the changes.
> > Otherwise it reads as it "may enhance or may worsen" the robustness.
> 
> OK, will re-test it with older branch. I remember it cause LCD to go
> to black without
> this patch, but not fully confident with my memory. With latest code,
> there is no
> difference to have this patch or not.

For the reference, this is the description from the display drivers
techpack:

    disp: msm: dsi: Adjust DSI priority level

    Sets DSI priority level to 7 before any commands are triggered.
    This DSI priority setting is recommended by systems team as DSI
    and Lutdma uses same Xin for fetch.

Maybe Abhinav can help with the proper problem description.

Also, see below.

> >
> > >
> > > Co-developed-by: Jonathan Marek <jonathan@marek.ca>
> > > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/dsi/dsi_host.c | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > index 42e100a8adca09d7b55afce0e2553e76d898744f..f59c4cd6bc8cdb31c1302f8e3ff395486c0b4898 100644
> > > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > @@ -2238,13 +2238,23 @@ int msm_dsi_host_cmd_rx(struct mipi_dsi_host *host,
> > >       return ret;
> > >  }
> > >
> > > +#define DSI_VBIF_CTRL                        (0x01CC - 4)

Register definition should go to the dsi.xml file. And anyway it should
have used lower case hex.

> > > +#define DSI_VBIF_CTRL_PRIORITY               0x07
> > > +
> > >  void msm_dsi_host_cmd_xfer_commit(struct mipi_dsi_host *host, u32 dma_base,
> > >                                 u32 len)
> > >  {
> > >       struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> > > +     const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
> > > +     u32 reg;
> > >
> > >       dsi_write(msm_host, REG_DSI_DMA_BASE, dma_base);
> > >       dsi_write(msm_host, REG_DSI_DMA_LEN, len);
> > > +     if (cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V2_8_0) {
> > > +             reg = dsi_read(msm_host, DSI_VBIF_CTRL);
> > > +             reg |= (DSI_VBIF_CTRL_PRIORITY & 0x7);
> > > +             dsi_write(msm_host, DSI_VBIF_CTRL, reg);
> > > +     }
> > >       dsi_write(msm_host, REG_DSI_TRIG_DMA, 1);
> > >
> > >       /* Make sure trigger happens */
> > >
> > > --
> > > 2.34.1
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

