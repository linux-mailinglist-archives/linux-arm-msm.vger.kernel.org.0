Return-Path: <linux-arm-msm+bounces-20666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ED68D10CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 02:15:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 299C8281599
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 00:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234D939B;
	Tue, 28 May 2024 00:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kxJCvSI3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CEC646
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 00:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716855318; cv=none; b=Cl9SJMY9kabzThNUU6hfGMu9d0f4kLoiYgWBTpfy1hl7GsVafw5dYryIoOI+MUIVJsru+Jo/camRoD9B4Xfa+hIlqeRZhi98F50dVaKo83d7krwzgZOyJbDR4HATXvTjpu0y6DYGP1VgTXXM3ymJbTo+aACm01Qf3qsIRmbJkjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716855318; c=relaxed/simple;
	bh=bFkjRI0v59j8QAShIUcq9TqUrcPPqujIH/PT/RDL09E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hL/ZqC7/0+CqnAnpZAOze3GM2CJ5itvT7ArCVcMohhYBe+nmT9dxwb7MtHgzJkLLixvbUknjIV7okc2aT9GmG1xdKmVKniPNvkvjVZOwqmd2bdpC9zhQQED7ndYNE3sJ/cdN0WWK0zfNGc5uDE7hZE9tw3jrUZixokUptGs94DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kxJCvSI3; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2e95a75a90eso2011741fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 17:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716855314; x=1717460114; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+rSeBn+G5kqm63ocBibHltmGEw4hG8lY4/WBrGkeNbg=;
        b=kxJCvSI3VAvaK4XchHlCElHPNLpJ2X3v76NxwHJNfGBzQeQk6ymBLWwHJqXk5dKvL2
         +fqi9Dj82SoO0WZqXXB8uXu/MqbMdtcBuLZqE5vUuQ0s5nh40Gx89QkRXqXMnevH9zmm
         5jnxUImHK/c52zi5jhUVEY6QxNdxQoQNlkoIf/gwNFPFUYShtDYrIn+Kt2W5nh3h09SB
         kzNzf9H3YyhdqtZcxJGX+SiFyhJ7LhDcWeNWgHdAog+j739GDw0mPXIBRNeqiRXWN/T6
         /jct5PwXkU1B2VYsAPCMJherymuMoWFFbI5qk076NVz+sDbx03pa8agfoD2CKgTc1HbW
         QuAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716855314; x=1717460114;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rSeBn+G5kqm63ocBibHltmGEw4hG8lY4/WBrGkeNbg=;
        b=INY97rvd1+o12vIGlAtzn50r6ruMaXkLUpwpuLlkMHm9nz3szzhjKmk9cTgJM2P4nB
         slawoSRmdumEj5VY7Pjl4maUUQX4tnzfrh0HU0Z2YCkx8SvLOTjzhWd5aCqi45VY0Z9H
         DKKurZSyA7KPeu31dy4U1nFqm2bC4KaxVaPFuexTWalqPqor6OQdjQZfrxbzKs1ThX1k
         4OXFyE1kLesMVSWmFjSKaZNHkD75+ScHH0HY/6AnR3tAmOihKZBOV3zRGFVvZ6/V5O9M
         TP2mRIEYfB8t8S+diGIICkjy3o27+L3eDahPpJQo0GbB+6S8kaiFeIVywkdFoRfruD7C
         PY+w==
X-Forwarded-Encrypted: i=1; AJvYcCVvZMzPBjdygQgNY9P/SDU1bLZLNXq9HlrwARsBQEF/8UR7els3hNA0gmUo1LMj1cBKL11S3DyoVSS2egG08qA5SC6Gt5ys9zrymFKETg==
X-Gm-Message-State: AOJu0YxTwUR+2S/ffw0iw0kT0EUvOwmib/AvJgVGSqXjCXgZmC4eMS5K
	Ib5ZtAq7mb4WuC+t9yNvs+Je1C4e8+Qm1RWSEZNxGnWhblL/J/6E/oASV7UOtw8=
X-Google-Smtp-Source: AGHT+IFwo5+bskOQVB5Inq6y+TLk7VCTI94Q2GG3EddGvRVtvDuP1xwmS4N406tmyhv3JFYIET69aw==
X-Received: by 2002:a05:6512:34d2:b0:51d:9e17:29ea with SMTP id 2adb3069b0e04-529645e3440mr5010655e87.15.1716855313755;
        Mon, 27 May 2024 17:15:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5296ee4a5f1sm834811e87.72.2024.05.27.17.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 17:15:12 -0700 (PDT)
Date: Tue, 28 May 2024 03:15:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Arnaud Vrac <avrac@freebox.fr>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, MSM <linux-arm-msm@vger.kernel.org>, 
	freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Bryan O Donoghue <bryan.odonoghue@linaro.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, Pierre-Hugues Husson <phhusson@freebox.fr>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [RFC PATCH v1] drm/msm: add msm8998 hdmi phy/pll support
Message-ID: <ow3p535eidouzd4jwsqe7kogkley4axmk7nj6rhimimijezuz2@2qmfyhptrx2u>
References: <63337d63-67ef-4499-8a24-5f6e9285c36b@freebox.fr>
 <CAA8EJpptbpRj2htzcsXAiwQe-1Xdgoev-mdMki2OApm3gMEBcw@mail.gmail.com>
 <e4c2e552-9004-4735-a3b3-ba1f50a145ac@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4c2e552-9004-4735-a3b3-ba1f50a145ac@freebox.fr>

On Mon, May 27, 2024 at 02:39:35PM +0200, Arnaud Vrac wrote:
> On 27/05/2024 14:11, Dmitry Baryshkov wrote:
> > On Thu, 23 May 2024 at 18:14, Marc Gonzalez <mgonzalez@freebox.fr> wrote:
> > > 
> > > From: Arnaud Vrac <avrac@freebox.fr>
> > > 
> > > Ported from the downstream driver.
> > > 
> > > Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> > > Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> > > ---
> > >   drivers/gpu/drm/msm/Makefile             |   1 +
> > >   drivers/gpu/drm/msm/hdmi/hdmi.c          |   1 +
> > >   drivers/gpu/drm/msm/hdmi/hdmi.h          |   8 +
> > >   drivers/gpu/drm/msm/hdmi/hdmi.xml.h      | 162 ++++
> > >   drivers/gpu/drm/msm/hdmi/hdmi_phy.c      |   5 +
> > >   drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 941 +++++++++++++++++++++++
> > >   6 files changed, 1118 insertions(+)
> > >   create mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
> > > 
> > > diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> > > index b21ae2880c715..5b5d6aded5233 100644
> > > --- a/drivers/gpu/drm/msm/Makefile
> > > +++ b/drivers/gpu/drm/msm/Makefile
> > > @@ -26,6 +26,7 @@ msm-$(CONFIG_DRM_MSM_HDMI) += \
> > >          hdmi/hdmi_phy.o \
> > >          hdmi/hdmi_phy_8960.o \
> > >          hdmi/hdmi_phy_8996.o \
> > > +       hdmi/hdmi_phy_8998.o \
> > >          hdmi/hdmi_phy_8x60.o \
> > >          hdmi/hdmi_phy_8x74.o \
> > >          hdmi/hdmi_pll_8960.o \
> > > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> > > index c8ebd75176bba..2a2ce49ef5aa3 100644
> > > --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> > > +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> > > @@ -549,6 +549,7 @@ static void msm_hdmi_dev_remove(struct platform_device *pdev)
> > >   }
> > > 
> > >   static const struct of_device_id msm_hdmi_dt_match[] = {
> > > +       { .compatible = "qcom,hdmi-tx-8998", .data = &hdmi_tx_8974_config },
> > 
> > Missing DT bindings.
> > 
> > >          { .compatible = "qcom,hdmi-tx-8996", .data = &hdmi_tx_8974_config },
> > >          { .compatible = "qcom,hdmi-tx-8994", .data = &hdmi_tx_8974_config },
> > >          { .compatible = "qcom,hdmi-tx-8084", .data = &hdmi_tx_8974_config },
> > > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
> > > index ec57864403915..cad0d50c82fbc 100644
> > > --- a/drivers/gpu/drm/msm/hdmi/hdmi.h
> > > +++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
> > > @@ -137,6 +137,7 @@ enum hdmi_phy_type {
> > >          MSM_HDMI_PHY_8960,
> > >          MSM_HDMI_PHY_8x74,
> > >          MSM_HDMI_PHY_8996,
> > > +       MSM_HDMI_PHY_8998,
> > >          MSM_HDMI_PHY_MAX,
> > >   };
> > > 
> > > @@ -154,6 +155,7 @@ extern const struct hdmi_phy_cfg msm_hdmi_phy_8x60_cfg;
> > >   extern const struct hdmi_phy_cfg msm_hdmi_phy_8960_cfg;
> > >   extern const struct hdmi_phy_cfg msm_hdmi_phy_8x74_cfg;
> > >   extern const struct hdmi_phy_cfg msm_hdmi_phy_8996_cfg;
> > > +extern const struct hdmi_phy_cfg msm_hdmi_phy_8998_cfg;
> > > 
> > >   struct hdmi_phy {
> > >          struct platform_device *pdev;
> > > @@ -184,6 +186,7 @@ void __exit msm_hdmi_phy_driver_unregister(void);
> > >   #ifdef CONFIG_COMMON_CLK
> > >   int msm_hdmi_pll_8960_init(struct platform_device *pdev);
> > >   int msm_hdmi_pll_8996_init(struct platform_device *pdev);
> > > +int msm_hdmi_pll_8998_init(struct platform_device *pdev);
> > >   #else
> > >   static inline int msm_hdmi_pll_8960_init(struct platform_device *pdev)
> > >   {
> > > @@ -194,6 +197,11 @@ static inline int msm_hdmi_pll_8996_init(struct platform_device *pdev)
> > >   {
> > >          return -ENODEV;
> > >   }
> > > +
> > > +static inline int msm_hdmi_pll_8998_init(struct platform_device *pdev)
> > > +{
> > > +       return -ENODEV;
> > > +}
> > >   #endif
> > > 
> > >   /*
> > > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.xml.h b/drivers/gpu/drm/msm/hdmi/hdmi.xml.h
> > > index 973b460486a5a..c9ca1101b5ad4 100644
> > > --- a/drivers/gpu/drm/msm/hdmi/hdmi.xml.h
> > > +++ b/drivers/gpu/drm/msm/hdmi/hdmi.xml.h
> > > @@ -1396,4 +1396,166 @@ static inline uint32_t HDMI_8x60_PHY_REG1_OUTVOL_SWING_CTRL(uint32_t val)
> > >   #define REG_HDMI_PHY_QSERDES_TX_LX_TX_ALOG_INTF_OBSV           0x00000110
> > > 
> > > 
> > > +#define REG_HDMI_8998_PHY_CFG                                  0x00000000
> > > +
> > > +#define REG_HDMI_8998_PHY_PD_CTL                               0x00000004
> > > +
> > > +#define REG_HDMI_8998_PHY_MODE                                 0x00000010
> > > +
> > > +#define REG_HDMI_8998_PHY_CLOCK                                        0x0000005c
> > > +
> > > +#define REG_HDMI_8998_PHY_CMN_CTRL                             0x00000068
> > > +
> > > +#define REG_HDMI_8998_PHY_STATUS                               0x000000b4
> > > +
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_ATB_SEL1                 0x00000000
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_ATB_SEL2                 0x00000004
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_FREQ_UPDATE              0x00000008
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_BG_TIMER                 0x0000000c
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_SSC_EN_CENTER            0x00000010
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_SSC_ADJ_PER1             0x00000014
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_SSC_ADJ_PER2             0x00000018
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_SSC_PER1                 0x0000001c
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_SSC_PER2                 0x00000020
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_SSC_STEP_SIZE1           0x00000024
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_SSC_STEP_SIZE2           0x00000028
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_POST_DIV                 0x0000002c
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_POST_DIV_MUX             0x00000030
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_BIAS_EN_CLKBUFLR_EN      0x00000034
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_CLK_ENABLE1              0x00000038
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_SYS_CLK_CTRL             0x0000003c
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_SYSCLK_BUF_ENABLE                0x00000040
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_PLL_EN                   0x00000044
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_PLL_IVCO                 0x00000048
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_CMN_IETRIM               0x0000004c
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_CMN_IPTRIM               0x00000050
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_CP_CTRL_MODE0            0x00000060
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_CP_CTRL_MODE1            0x00000064
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_PLL_RCTRL_MODE0          0x00000068
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_PLL_RCTRL_MODE1          0x0000006c
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_PLL_CCTRL_MODE0          0x00000070
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_PLL_CCTRL_MODE1          0x00000074
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_PLL_CNTRL                        0x00000078
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_BIAS_EN_CTRL_BY_PSM      0x0000007c
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_SYSCLK_EN_SEL            0x00000080
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_CML_SYSCLK_SEL           0x00000084
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_RESETSM_CNTRL            0x00000088
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_RESETSM_CNTRL2           0x0000008c
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_LOCK_CMP_EN              0x00000090
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_LOCK_CMP_CFG             0x00000094
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_LOCK_CMP1_MODE0          0x00000098
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_LOCK_CMP2_MODE0          0x0000009c
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_LOCK_CMP3_MODE0          0x000000a0
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_DEC_START_MODE0          0x000000b0
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_DEC_START_MODE1          0x000000b4
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_DIV_FRAC_START1_MODE0    0x000000b8
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_DIV_FRAC_START2_MODE0    0x000000bc
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_DIV_FRAC_START3_MODE0    0x000000c0
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_DIV_FRAC_START1_MODE1    0x000000c4
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_DIV_FRAC_START2_MODE1    0x000000c8
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_DIV_FRAC_START3_MODE1    0x000000cc
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_INTEGLOOP_INITVAL                0x000000d0
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_INTEGLOOP_EN             0x000000d4
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_INTEGLOOP_GAIN0_MODE0    0x000000d8
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_INTEGLOOP_GAIN1_MODE0    0x000000dc
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_INTEGLOOP_GAIN0_MODE1    0x000000e0
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_INTEGLOOP_GAIN1_MODE1    0x000000e4
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_VCOCAL_DEADMAN_CTRL      0x000000e8
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_VCO_TUNE_CTRL            0x000000ec
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_VCO_TUNE_MAP             0x000000f0
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_CMN_STATUS               0x00000124
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_RESET_SM_STATUS          0x00000128
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_CLK_SEL                  0x00000138
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_HSCLK_SEL                        0x0000013c
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_CORECLK_DIV_MODE0                0x00000148
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_SW_RESET                 0x00000150
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_CORE_CLK_EN              0x00000154
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_C_READY_STATUS           0x00000158
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_CMN_CONFIG               0x0000015c
> > > +
> > > +#define REG_HDMI_8998_PHY_QSERDES_COM_SVS_MODE_CLK_SEL         0x00000164
> > > +
> > > +
> > > +#define REG_HDMI_8998_PHY_TXn_EMP_POST1_LVL                    0x00000000
> > > +
> > > +#define REG_HDMI_8998_PHY_TXn_INTERFACE_SELECT_TX_BAND         0x00000008
> > > +
> > > +#define REG_HDMI_8998_PHY_TXn_CLKBUF_TERM_ENABLE               0x0000000c
> > > +
> > > +#define REG_HDMI_8998_PHY_TXn_DRV_LVL_RES_CODE_OFFSET          0x00000014
> > > +
> > > +#define REG_HDMI_8998_PHY_TXn_DRV_LVL                          0x00000018
> > > +
> > > +#define REG_HDMI_8998_PHY_TXn_LANE_CONFIG                      0x0000001c
> > > +
> > > +#define REG_HDMI_8998_PHY_TXn_PRE_DRIVER_1                     0x00000024
> > > +
> > > +#define REG_HDMI_8998_PHY_TXn_PRE_DRIVER_2                     0x00000028
> > > +
> > > +#define REG_HDMI_8998_PHY_TXn_LANE_MODE                                0x0000002c
> > > +
> > >   #endif /* HDMI_XML */
> > > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> > > index 88a3423b7f24d..95b3f7535d840 100644
> > > --- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> > > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> > > @@ -118,6 +118,9 @@ static int msm_hdmi_phy_pll_init(struct platform_device *pdev,
> > >          case MSM_HDMI_PHY_8996:
> > >                  ret = msm_hdmi_pll_8996_init(pdev);
> > >                  break;
> > > +       case MSM_HDMI_PHY_8998:
> > > +               ret = msm_hdmi_pll_8998_init(pdev);
> > > +               break;
> > >          /*
> > >           * we don't have PLL support for these, don't report an error for now
> > >           */
> > > @@ -193,6 +196,8 @@ static const struct of_device_id msm_hdmi_phy_dt_match[] = {
> > >            .data = &msm_hdmi_phy_8x74_cfg },
> > >          { .compatible = "qcom,hdmi-phy-8996",
> > >            .data = &msm_hdmi_phy_8996_cfg },
> > > +       { .compatible = "qcom,hdmi-phy-8998",
> > > +         .data = &msm_hdmi_phy_8998_cfg },
> > >          {}
> > >   };
> > > 
> > > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
> > > new file mode 100644
> > > index 0000000000000..28c4824a30e89
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
> > > @@ -0,0 +1,941 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (c) 2016, The Linux Foundation. All rights reserved.
> > 
> > No changes since 2016?
> > 
> > > + */
> > > +
> > > +#include <linux/clk-provider.h>
> > > +#include <linux/delay.h>
> > > +
> > 
> > [...]
> > 
> > > +
> > > +static inline u64 pll_cmp_to_fdata(u32 pll_cmp, unsigned long ref_clk)
> > > +{
> > > +       u64 fdata = ((u64)pll_cmp) * ref_clk * 10;
> > > +
> > > +       do_div(fdata, HDMI_PLL_CMP_CNT);
> > > +
> > > +       return fdata;
> > > +}
> > > +
> > > +#if 0
> > 
> > This should probably go away.
> > 
> > > +static int pll_get_post_div(struct hdmi_8998_post_divider *pd, u64 bclk)
> > > +{
> > > +       /* FIXME: use downstream ratio list ? */
> > > +       int ratio[] = { 2, 3, 4, 5, 6, 9, 10, 12, 14, 15, 20, 21, 25, 28, 35 };
> > > +       int hs_divsel[] = { 0, 4, 8, 12, 1, 5, 2, 9, 3, 13, 10, 7, 14, 11, 15 };
> > > +       int tx_band_sel[] = { 0, 1, 2, 3 };
> > > +       u64 vco_freq[60];
> > > +       u64 vco, vco_optimal;
> > > +       int half_rate_mode = 0;
> > > +       int vco_optimal_index, vco_freq_index;
> > > +       int i, j;
> > > +
> > 
> > So, first of all, the code needs to be cleaned. It contains debugging
> > and temporary code all over the place. Such code should be removed
> > 
> > Second, at some point I worked on moving HDMI PHY drivers to
> > drivers/phy. Oh my, it was nearly a year ago.
> > https://patchwork.freedesktop.org/series/118210/
> > 
> > I hope to land the HDMI HPD rework this cycle, then get back to the
> > HDMI PHY code. No promises though, just wanted to point out that we
> > might need to rework this even further in few months.
> > 
> > 
> 
> Thanks Dmitry. I wasn't planning on sending the patch anywhere in this
> state, but Marc did so I'll ask some of the questions I had when I
> wrote this. The first thing I was planning to do was indeed to rebase
> on your patch series refactoring PHY drivers.
> 
> First, I understand the XML files describing registers have been
> integrated in the kernel tree, so we will have to move the definitions
> of the 8998 PHY registers there.

Yes

> Second, the #if 0 code is the phy setup code I tried to write based on
> the simpler 8996 driver, but it doesn't work, hence the actual
> compiled code which is a direct port of the downstream code. We'll
> probably have to dig a little more to ask more detailed questions on
> the phy internals.

Let's see, probably we can figure them out.

> Last, I tried to implement the recalc_rate callback which does not
> exist downstream but I'm not able to get a correct value with the
> little data I have on the registers. Is this callback actually needed
> ? I don't see why the values programmed in the set_rate call could
> change under our feet.

The recalc_rate callback is used by CCF to read back the rate from the
hardware. For example, when CCF probes all the clocks.

Regarding reading the clock rate. As you can see from the 8996 PHY
driver, it's easier to follow LOCK_CMPn_MODE0 registers.

It *looks* like the code from the refactored 8996 driver should be
mostly applicable for 8998 too. Maybe except for the 15 => 1 vs
15 => 35 HSCLK setting).

In the end, msm8998 uses what looks like QMP v3 with a different TX
register set

-- 
With best wishes
Dmitry

