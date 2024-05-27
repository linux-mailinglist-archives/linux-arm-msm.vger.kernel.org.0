Return-Path: <linux-arm-msm+bounces-20603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE2D8CFFA0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 14:11:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B4451C2048A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 12:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A4715DBB7;
	Mon, 27 May 2024 12:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a6V/3nQG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E20F1581E2
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 12:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716811889; cv=none; b=UroPKsFxTcoqBOUXj/AsztHN7bgBJWtyYgg/NYDDed5TUXF3yZEhGTBZRnHlj21amKgfMgUYKfomQDTj56LAeZi+TWe0ohQ3sEKEptV2rdmNCT7hO0ceuWwubAUQeO+/+1yq8vhgPRODC8FogQ1ja9gqkERgh0H7NS1oW1uxFvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716811889; c=relaxed/simple;
	bh=kPugquBTq3xsoXyLwQVOrBR/n9HXciJ0GGF+JeRxeXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E7IlVN/O2osKlxcDK1KSR3Ip4sPCScLXRZU12ElF1YQex/9f6mYXt5j3A2b7W/bK1yznsUibRZs0kkjtkzyKhStmbuUgw14z6sbRdvbgnqT1yLH5XkVT4fodbTC36YZbvIAtE6oLeyLgt2Lwya2lAM+hbmyT0zZZt2zINcizWGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a6V/3nQG; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-df78acd5bb6so1751919276.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 05:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716811886; x=1717416686; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uE9dGI47OGcr1OCD++S9WEEhkXLb3lAf+X4P+A18CQY=;
        b=a6V/3nQGRfL55v9XMwmZJSAlHmfCEQflG7huUtbHAvtFPsCytSPCi5nDDsU0et56pI
         pQL66rY0ftv2MccuOJSHI1VLu+yIKuywlP/8bYHVJcLb/WP+V0+KADlnuk/ENVVG9Htb
         325bNbx6NnygUvCgF71grQCBUX+VPmKnq6X2ktAo+heUAAXXaCZKKjg/ejJIU2UpiD9b
         o9AE1KmBEXg3ykOUIp24WUKYjXN/oCX1Rdz60YFSrOJWWvejxSgQpRrjtfDj9tfrlC6O
         ChCVrYcUkzMBWOqt6CHoUKvzJN10sSR3K7pfgczPc4jjWm1fimoybvZ4fw6aQgAQPiWi
         VQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716811886; x=1717416686;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uE9dGI47OGcr1OCD++S9WEEhkXLb3lAf+X4P+A18CQY=;
        b=spo4gJ0BEbkgNj7vFEcr7Vhnbyyg8o9JA8c7GFe3i9SOv76STUL00eWEUuduUpXBIG
         jiZ6Dycjs52T8F6rX5sIypZOHXowYTN5DiBpCXeSnEAqBHU41H/4/yPyTHRgZ3vdsoP/
         DaOruXiylE5kK5i92RKyDb3jeGu7AFmbrwdB+KnPtqdDoQsJdkKoAsP6A579XrUN5xXd
         SiDHyBRfI6viLT7e8/yc6+MSs1DF28Ka44uQ3u7OcviWCdsCUM1MzU+UVpWsM9kU4CGl
         uuXzBwb+UjCRPw1Qpav9YotRej6izo31zlDAUHQAX8h10adQv/S8ZzBesWnu826DsYI6
         0+Nw==
X-Forwarded-Encrypted: i=1; AJvYcCVX5yVytlB89xNhOQ10UpdIFJPBPqI0DwtaqPoa8TYsGmGkqJMajoGWtG+2m0/lC4wWYPV4L8z03QNs9yXTJ5fU3SQ8YxVVYRaEsorB4A==
X-Gm-Message-State: AOJu0YzICMViRZA/Fr4irNHBv1CwomoH1yakMPwr+fJ6FoCQf4XPMcvz
	b1pIns6OaueiiApmYUm2kmG1ltNGi2rHRA1NQI9UrU8J+vaNsK9PnHul84sNpmspUHmBlZ+evAO
	H2GEYUChViYsBNhu4gt2EYWl6JdlxmN3K3fOLgA==
X-Google-Smtp-Source: AGHT+IGxgRFb4ObXElKCq0kpmMwuYdA96pRrqkqE2Ky1ptIy4dfuqDwv1cWZhN6FtS0OjSYQtqJ8qzJcDOyxUV7tctc=
X-Received: by 2002:a25:b18b:0:b0:df6:d068:76d7 with SMTP id
 3f1490d57ef6-df772237e93mr8734388276.57.1716811886206; Mon, 27 May 2024
 05:11:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <63337d63-67ef-4499-8a24-5f6e9285c36b@freebox.fr>
In-Reply-To: <63337d63-67ef-4499-8a24-5f6e9285c36b@freebox.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 27 May 2024 15:11:14 +0300
Message-ID: <CAA8EJpptbpRj2htzcsXAiwQe-1Xdgoev-mdMki2OApm3gMEBcw@mail.gmail.com>
Subject: Re: [RFC PATCH v1] drm/msm: add msm8998 hdmi phy/pll support
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	MSM <linux-arm-msm@vger.kernel.org>, freedreno@lists.freedesktop.org, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Bryan O Donoghue <bryan.odonoghue@linaro.org>, Luca Weiss <luca.weiss@fairphone.com>, 
	Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 May 2024 at 18:14, Marc Gonzalez <mgonzalez@freebox.fr> wrote:
>
> From: Arnaud Vrac <avrac@freebox.fr>
>
> Ported from the downstream driver.
>
> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  drivers/gpu/drm/msm/Makefile             |   1 +
>  drivers/gpu/drm/msm/hdmi/hdmi.c          |   1 +
>  drivers/gpu/drm/msm/hdmi/hdmi.h          |   8 +
>  drivers/gpu/drm/msm/hdmi/hdmi.xml.h      | 162 ++++
>  drivers/gpu/drm/msm/hdmi/hdmi_phy.c      |   5 +
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 941 +++++++++++++++++++++++
>  6 files changed, 1118 insertions(+)
>  create mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
>
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index b21ae2880c715..5b5d6aded5233 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -26,6 +26,7 @@ msm-$(CONFIG_DRM_MSM_HDMI) += \
>         hdmi/hdmi_phy.o \
>         hdmi/hdmi_phy_8960.o \
>         hdmi/hdmi_phy_8996.o \
> +       hdmi/hdmi_phy_8998.o \
>         hdmi/hdmi_phy_8x60.o \
>         hdmi/hdmi_phy_8x74.o \
>         hdmi/hdmi_pll_8960.o \
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index c8ebd75176bba..2a2ce49ef5aa3 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -549,6 +549,7 @@ static void msm_hdmi_dev_remove(struct platform_device *pdev)
>  }
>
>  static const struct of_device_id msm_hdmi_dt_match[] = {
> +       { .compatible = "qcom,hdmi-tx-8998", .data = &hdmi_tx_8974_config },

Missing DT bindings.

>         { .compatible = "qcom,hdmi-tx-8996", .data = &hdmi_tx_8974_config },
>         { .compatible = "qcom,hdmi-tx-8994", .data = &hdmi_tx_8974_config },
>         { .compatible = "qcom,hdmi-tx-8084", .data = &hdmi_tx_8974_config },
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
> index ec57864403915..cad0d50c82fbc 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.h
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
> @@ -137,6 +137,7 @@ enum hdmi_phy_type {
>         MSM_HDMI_PHY_8960,
>         MSM_HDMI_PHY_8x74,
>         MSM_HDMI_PHY_8996,
> +       MSM_HDMI_PHY_8998,
>         MSM_HDMI_PHY_MAX,
>  };
>
> @@ -154,6 +155,7 @@ extern const struct hdmi_phy_cfg msm_hdmi_phy_8x60_cfg;
>  extern const struct hdmi_phy_cfg msm_hdmi_phy_8960_cfg;
>  extern const struct hdmi_phy_cfg msm_hdmi_phy_8x74_cfg;
>  extern const struct hdmi_phy_cfg msm_hdmi_phy_8996_cfg;
> +extern const struct hdmi_phy_cfg msm_hdmi_phy_8998_cfg;
>
>  struct hdmi_phy {
>         struct platform_device *pdev;
> @@ -184,6 +186,7 @@ void __exit msm_hdmi_phy_driver_unregister(void);
>  #ifdef CONFIG_COMMON_CLK
>  int msm_hdmi_pll_8960_init(struct platform_device *pdev);
>  int msm_hdmi_pll_8996_init(struct platform_device *pdev);
> +int msm_hdmi_pll_8998_init(struct platform_device *pdev);
>  #else
>  static inline int msm_hdmi_pll_8960_init(struct platform_device *pdev)
>  {
> @@ -194,6 +197,11 @@ static inline int msm_hdmi_pll_8996_init(struct platform_device *pdev)
>  {
>         return -ENODEV;
>  }
> +
> +static inline int msm_hdmi_pll_8998_init(struct platform_device *pdev)
> +{
> +       return -ENODEV;
> +}
>  #endif
>
>  /*
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.xml.h b/drivers/gpu/drm/msm/hdmi/hdmi.xml.h
> index 973b460486a5a..c9ca1101b5ad4 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.xml.h
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.xml.h
> @@ -1396,4 +1396,166 @@ static inline uint32_t HDMI_8x60_PHY_REG1_OUTVOL_SWING_CTRL(uint32_t val)
>  #define REG_HDMI_PHY_QSERDES_TX_LX_TX_ALOG_INTF_OBSV           0x00000110
>
>
> +#define REG_HDMI_8998_PHY_CFG                                  0x00000000
> +
> +#define REG_HDMI_8998_PHY_PD_CTL                               0x00000004
> +
> +#define REG_HDMI_8998_PHY_MODE                                 0x00000010
> +
> +#define REG_HDMI_8998_PHY_CLOCK                                        0x0000005c
> +
> +#define REG_HDMI_8998_PHY_CMN_CTRL                             0x00000068
> +
> +#define REG_HDMI_8998_PHY_STATUS                               0x000000b4
> +
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_ATB_SEL1                 0x00000000
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_ATB_SEL2                 0x00000004
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_FREQ_UPDATE              0x00000008
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_BG_TIMER                 0x0000000c
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_SSC_EN_CENTER            0x00000010
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_SSC_ADJ_PER1             0x00000014
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_SSC_ADJ_PER2             0x00000018
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_SSC_PER1                 0x0000001c
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_SSC_PER2                 0x00000020
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_SSC_STEP_SIZE1           0x00000024
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_SSC_STEP_SIZE2           0x00000028
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_POST_DIV                 0x0000002c
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_POST_DIV_MUX             0x00000030
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_BIAS_EN_CLKBUFLR_EN      0x00000034
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_CLK_ENABLE1              0x00000038
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_SYS_CLK_CTRL             0x0000003c
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_SYSCLK_BUF_ENABLE                0x00000040
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_PLL_EN                   0x00000044
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_PLL_IVCO                 0x00000048
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_CMN_IETRIM               0x0000004c
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_CMN_IPTRIM               0x00000050
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_CP_CTRL_MODE0            0x00000060
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_CP_CTRL_MODE1            0x00000064
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_PLL_RCTRL_MODE0          0x00000068
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_PLL_RCTRL_MODE1          0x0000006c
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_PLL_CCTRL_MODE0          0x00000070
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_PLL_CCTRL_MODE1          0x00000074
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_PLL_CNTRL                        0x00000078
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_BIAS_EN_CTRL_BY_PSM      0x0000007c
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_SYSCLK_EN_SEL            0x00000080
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_CML_SYSCLK_SEL           0x00000084
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_RESETSM_CNTRL            0x00000088
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_RESETSM_CNTRL2           0x0000008c
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_LOCK_CMP_EN              0x00000090
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_LOCK_CMP_CFG             0x00000094
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_LOCK_CMP1_MODE0          0x00000098
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_LOCK_CMP2_MODE0          0x0000009c
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_LOCK_CMP3_MODE0          0x000000a0
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_DEC_START_MODE0          0x000000b0
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_DEC_START_MODE1          0x000000b4
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_DIV_FRAC_START1_MODE0    0x000000b8
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_DIV_FRAC_START2_MODE0    0x000000bc
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_DIV_FRAC_START3_MODE0    0x000000c0
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_DIV_FRAC_START1_MODE1    0x000000c4
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_DIV_FRAC_START2_MODE1    0x000000c8
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_DIV_FRAC_START3_MODE1    0x000000cc
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_INTEGLOOP_INITVAL                0x000000d0
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_INTEGLOOP_EN             0x000000d4
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_INTEGLOOP_GAIN0_MODE0    0x000000d8
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_INTEGLOOP_GAIN1_MODE0    0x000000dc
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_INTEGLOOP_GAIN0_MODE1    0x000000e0
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_INTEGLOOP_GAIN1_MODE1    0x000000e4
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_VCOCAL_DEADMAN_CTRL      0x000000e8
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_VCO_TUNE_CTRL            0x000000ec
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_VCO_TUNE_MAP             0x000000f0
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_CMN_STATUS               0x00000124
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_RESET_SM_STATUS          0x00000128
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_CLK_SEL                  0x00000138
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_HSCLK_SEL                        0x0000013c
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_CORECLK_DIV_MODE0                0x00000148
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_SW_RESET                 0x00000150
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_CORE_CLK_EN              0x00000154
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_C_READY_STATUS           0x00000158
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_CMN_CONFIG               0x0000015c
> +
> +#define REG_HDMI_8998_PHY_QSERDES_COM_SVS_MODE_CLK_SEL         0x00000164
> +
> +
> +#define REG_HDMI_8998_PHY_TXn_EMP_POST1_LVL                    0x00000000
> +
> +#define REG_HDMI_8998_PHY_TXn_INTERFACE_SELECT_TX_BAND         0x00000008
> +
> +#define REG_HDMI_8998_PHY_TXn_CLKBUF_TERM_ENABLE               0x0000000c
> +
> +#define REG_HDMI_8998_PHY_TXn_DRV_LVL_RES_CODE_OFFSET          0x00000014
> +
> +#define REG_HDMI_8998_PHY_TXn_DRV_LVL                          0x00000018
> +
> +#define REG_HDMI_8998_PHY_TXn_LANE_CONFIG                      0x0000001c
> +
> +#define REG_HDMI_8998_PHY_TXn_PRE_DRIVER_1                     0x00000024
> +
> +#define REG_HDMI_8998_PHY_TXn_PRE_DRIVER_2                     0x00000028
> +
> +#define REG_HDMI_8998_PHY_TXn_LANE_MODE                                0x0000002c
> +
>  #endif /* HDMI_XML */
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> index 88a3423b7f24d..95b3f7535d840 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> @@ -118,6 +118,9 @@ static int msm_hdmi_phy_pll_init(struct platform_device *pdev,
>         case MSM_HDMI_PHY_8996:
>                 ret = msm_hdmi_pll_8996_init(pdev);
>                 break;
> +       case MSM_HDMI_PHY_8998:
> +               ret = msm_hdmi_pll_8998_init(pdev);
> +               break;
>         /*
>          * we don't have PLL support for these, don't report an error for now
>          */
> @@ -193,6 +196,8 @@ static const struct of_device_id msm_hdmi_phy_dt_match[] = {
>           .data = &msm_hdmi_phy_8x74_cfg },
>         { .compatible = "qcom,hdmi-phy-8996",
>           .data = &msm_hdmi_phy_8996_cfg },
> +       { .compatible = "qcom,hdmi-phy-8998",
> +         .data = &msm_hdmi_phy_8998_cfg },
>         {}
>  };
>
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
> new file mode 100644
> index 0000000000000..28c4824a30e89
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
> @@ -0,0 +1,941 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2016, The Linux Foundation. All rights reserved.

No changes since 2016?

> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/delay.h>
> +

[...]

> +
> +static inline u64 pll_cmp_to_fdata(u32 pll_cmp, unsigned long ref_clk)
> +{
> +       u64 fdata = ((u64)pll_cmp) * ref_clk * 10;
> +
> +       do_div(fdata, HDMI_PLL_CMP_CNT);
> +
> +       return fdata;
> +}
> +
> +#if 0

This should probably go away.

> +static int pll_get_post_div(struct hdmi_8998_post_divider *pd, u64 bclk)
> +{
> +       /* FIXME: use downstream ratio list ? */
> +       int ratio[] = { 2, 3, 4, 5, 6, 9, 10, 12, 14, 15, 20, 21, 25, 28, 35 };
> +       int hs_divsel[] = { 0, 4, 8, 12, 1, 5, 2, 9, 3, 13, 10, 7, 14, 11, 15 };
> +       int tx_band_sel[] = { 0, 1, 2, 3 };
> +       u64 vco_freq[60];
> +       u64 vco, vco_optimal;
> +       int half_rate_mode = 0;
> +       int vco_optimal_index, vco_freq_index;
> +       int i, j;
> +

So, first of all, the code needs to be cleaned. It contains debugging
and temporary code all over the place. Such code should be removed

Second, at some point I worked on moving HDMI PHY drivers to
drivers/phy. Oh my, it was nearly a year ago.
https://patchwork.freedesktop.org/series/118210/

I hope to land the HDMI HPD rework this cycle, then get back to the
HDMI PHY code. No promises though, just wanted to point out that we
might need to rework this even further in few months.


-- 
With best wishes
Dmitry

