Return-Path: <linux-arm-msm+bounces-23144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5A690DF08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 00:17:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D314C1C22FFF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 22:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE11F1849C4;
	Tue, 18 Jun 2024 22:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xLRZGYc1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA57A55E58
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 22:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718749013; cv=none; b=JNXJCYIIrrRzV/8rskrcNsI69QVacDvkxQ0YHOYZpF3VtK0eYYSvOPTc2pl0zOKzv7csL6tSxvCYAsVbocrRHDUGgfaG1SqckuVJDt8Nxk95fW3OBEZ1cH67LT4mSfCJKCqG3+zHDR1a2ThzKMzf52ELBpion4JuNZSvPmturnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718749013; c=relaxed/simple;
	bh=B2nEN6xCzHzuw/h5tlG3vIg6ooWlpjdVVu2qTX9HvTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hJ8SAnfYgXLahyTCbG7rRzdLxQ7nA2oT9TJhv4ESSLcTpi3FScELnDnzH1dvtzQ11A6h7QM42pJ79Gn/knSrKSKm0qDAgUkZufoeOGIQ0iI7UgJYB3jtJQgQvRBhwgXgT5dbaja+/o17a2+VoBaLQLte8m5halNvPRu4pyy+ydA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xLRZGYc1; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dff26b612a9so3440573276.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 15:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718749010; x=1719353810; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tjyjO9ibWwmpUMBeTig0DOR47Ix9ZSlNLMNYQGCsgYY=;
        b=xLRZGYc1yBkVRFk3FxR44LhNkCHfzT/JxA7dlQGymXqVNied4BYWTCtTZvP6ZR2wW+
         vKlGBLRpbq7hkhIkHpEl8STBVqfEieksEWDCtiEo8Vi9m4cafigi5tBdt8qq1hNjCnzU
         CVLv8qO2WF+iDPch1TeN4+lIboBe/55WgkpaYNk7LyAGBKseG3zvpu+PTiG3JBgDAX7N
         oVpaNs/VdQ1SENr7uIf/Yryrta2f2JCQOAbwnP10wk6sZPXSACwsxStV7Vq8igEYYzHy
         cjbb3xDSN3jqX57kCid30kQcCppK5OGEo1LyPmhHY4tKe0o3DSxP23PJZ3c8G5x9G6m6
         AVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718749010; x=1719353810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tjyjO9ibWwmpUMBeTig0DOR47Ix9ZSlNLMNYQGCsgYY=;
        b=Bf+Jr5pb+EdQsMs2hBWYbqLFKaCgzNyv9WIkYI3PQBlqTztHcjdIwUYhSx0qER15hO
         uIK8GikwleS5RpANZ8lXjsw90VFQi09I1rTK8Hh+cmqePxIJsaOXx1SqKUf0maQG+yJm
         blbXBSLuhhlKCYaXwNGD/XkRABMjZtVt1/wbzwnTgfOxk5+R8dNBGaqonIl2JdzxV7Vp
         4rYdvmQk5bx115sFbECPga65zXe8iQnDt1u4xkoERcZcyi75eqLb/AxJy8pHYnidjyXl
         e1uBRivaXzuv+/TOOcJq8nosUBRfhqXd5tl28U/VRKN4DILFrsJZL0bBqF4UTfK7NgTM
         sNUQ==
X-Gm-Message-State: AOJu0YyngSMIUAgglZdz61fLPrdFcMH4Wm4nelsORU5wQetu88ZC1QyG
	F8Dh9UIMRN9HkSteeRQBi9Cf+hKKkPxtfgJz5PC7jsw31BhtOLU3sP5JIE4O7BPS3V4MRFd6GYN
	N9IbLyNRmSEXl0O15R4daq+HmNu04hyaPCvm05A==
X-Google-Smtp-Source: AGHT+IH5TYmerYRrw/tHz5G2/ja74cvoBF4cQp6mqZFDkHBoFu42NpbCHgLQonpPakj+oxEeWCYQLF3ekzZnxyR0BK4=
X-Received: by 2002:a5b:c48:0:b0:dd1:491e:bf0 with SMTP id 3f1490d57ef6-e02be22cff2mr1173003276.60.1718749009790;
 Tue, 18 Jun 2024 15:16:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240617005825.1443206-1-quic_gaurkash@quicinc.com>
 <20240617005825.1443206-5-quic_gaurkash@quicinc.com> <3eehkn3cdhhjfqtzpahxhjxtu5uqwhntpgu22k3hknctrop3g5@f7dhwvdvhr3k>
 <96e2ce4b154a4f918be0bc2a45011e6d@quicinc.com>
In-Reply-To: <96e2ce4b154a4f918be0bc2a45011e6d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 19 Jun 2024 01:16:38 +0300
Message-ID: <CAA8EJppGpv7N_JQQNJZrbngBBdEKZfuqutR9MPnS1R_WqYNTQw@mail.gmail.com>
Subject: Re: [PATCH v5 04/15] soc: qcom: ice: add hwkm support in ice
To: "Gaurav Kashyap (QUIC)" <quic_gaurkash@quicinc.com>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, 
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "andersson@kernel.org" <andersson@kernel.org>, 
	"ebiggers@google.com" <ebiggers@google.com>, 
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, 
	"srinivas.kandagatla" <srinivas.kandagatla@linaro.org>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, kernel <kernel@quicinc.com>, 
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"Om Prakash Singh (QUIC)" <quic_omprsing@quicinc.com>, 
	"Bao D. Nguyen (QUIC)" <quic_nguyenb@quicinc.com>, 
	"bartosz.golaszewski" <bartosz.golaszewski@linaro.org>, 
	"konrad.dybcio@linaro.org" <konrad.dybcio@linaro.org>, 
	"ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>, 
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>, "mani@kernel.org" <mani@kernel.org>, 
	"davem@davemloft.net" <davem@davemloft.net>, 
	"herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>, Prasad Sodagudi <psodagud@quicinc.com>, 
	Sonal Gupta <sonalg@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Jun 2024 at 01:07, Gaurav Kashyap (QUIC)
<quic_gaurkash@quicinc.com> wrote:
>
> Hello Dmitry,
>
> On 06/17/2024 12:55 AM PDT, Dmitry Baryshkov wrote:
> > On Sun, Jun 16, 2024 at 05:50:59PM GMT, Gaurav Kashyap wrote:
> > > Qualcomm's ICE (Inline Crypto Engine) contains a proprietary key
> > > management hardware called Hardware Key Manager (HWKM).
> > > This patch integrates HWKM support in ICE when it is available. HWKM
> > > primarily provides hardware wrapped key support where the ICE
> > > (storage) keys are not available in software and protected in
> > > hardware.
> > >
> > > When HWKM software support is not fully available (from Trustzone),
> > > there can be a scenario where the ICE hardware supports HWKM, but it
> > > cannot be used for wrapped keys. In this case, standard keys have to
> > > be used without using HWKM. Hence, providing a toggle controlled by a
> > > devicetree entry to use HWKM or not.
> > >
> > > Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > Signed-off-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
> > > ---
> > >  drivers/soc/qcom/ice.c | 153
> > +++++++++++++++++++++++++++++++++++++++--
> > >  include/soc/qcom/ice.h |   1 +
> > >  2 files changed, 150 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c index
> > > 6f941d32fffb..d5e74cf2946b 100644
> > > --- a/drivers/soc/qcom/ice.c
> > > +++ b/drivers/soc/qcom/ice.c
> > > @@ -26,6 +26,40 @@
> > >  #define QCOM_ICE_REG_FUSE_SETTING            0x0010
> > >  #define QCOM_ICE_REG_BIST_STATUS             0x0070
> > >  #define QCOM_ICE_REG_ADVANCED_CONTROL                0x1000
> > > +#define QCOM_ICE_REG_CONTROL                 0x0
> > > +/* QCOM ICE HWKM registers */
> > > +#define QCOM_ICE_REG_HWKM_TZ_KM_CTL                  0x1000
> > > +#define QCOM_ICE_REG_HWKM_TZ_KM_STATUS                       0x1004
> > > +#define QCOM_ICE_REG_HWKM_BANK0_BANKN_IRQ_STATUS     0x2008
> > > +#define QCOM_ICE_REG_HWKM_BANK0_BBAC_0                       0x5000
> > > +#define QCOM_ICE_REG_HWKM_BANK0_BBAC_1                       0x5004
> > > +#define QCOM_ICE_REG_HWKM_BANK0_BBAC_2                       0x5008
> > > +#define QCOM_ICE_REG_HWKM_BANK0_BBAC_3                       0x500C
> > > +#define QCOM_ICE_REG_HWKM_BANK0_BBAC_4                       0x5010
> > > +
> > > +/* QCOM ICE HWKM reg vals */
> > > +#define QCOM_ICE_HWKM_BIST_DONE_V1           BIT(16)
> > > +#define QCOM_ICE_HWKM_BIST_DONE_V2           BIT(9)
> > > +#define QCOM_ICE_HWKM_BIST_DONE(ver)
> > QCOM_ICE_HWKM_BIST_DONE_V##ver
> > > +
> > > +#define QCOM_ICE_HWKM_CRYPTO_BIST_DONE_V1            BIT(14)
> > > +#define QCOM_ICE_HWKM_CRYPTO_BIST_DONE_V2            BIT(7)
> > > +#define QCOM_ICE_HWKM_CRYPTO_BIST_DONE(v)
> > QCOM_ICE_HWKM_CRYPTO_BIST_DONE_V##v
> > > +
> > > +#define QCOM_ICE_HWKM_BOOT_CMD_LIST1_DONE            BIT(2)
> > > +#define QCOM_ICE_HWKM_BOOT_CMD_LIST0_DONE            BIT(1)
> > > +#define QCOM_ICE_HWKM_KT_CLEAR_DONE                  BIT(0)
> > > +
> > > +#define QCOM_ICE_HWKM_BIST_VAL(v)
> > (QCOM_ICE_HWKM_BIST_DONE(v) |           \
> > > +                                     QCOM_ICE_HWKM_CRYPTO_BIST_DONE(v) |     \
> > > +                                     QCOM_ICE_HWKM_BOOT_CMD_LIST1_DONE |     \
> > > +                                     QCOM_ICE_HWKM_BOOT_CMD_LIST0_DONE |     \
> > > +                                     QCOM_ICE_HWKM_KT_CLEAR_DONE)
> > > +
> > > +#define QCOM_ICE_HWKM_V1_STANDARD_MODE_VAL   (BIT(0) | BIT(1)
> > | BIT(2))
> > > +#define QCOM_ICE_HWKM_V2_STANDARD_MODE_MASK
> > GENMASK(31, 1) #define
> > > +QCOM_ICE_HWKM_DISABLE_CRC_CHECKS_VAL (BIT(1) | BIT(2))
> > > +#define QCOM_ICE_HWKM_RSP_FIFO_CLEAR_VAL     BIT(3)
> > >
> > >  /* BIST ("built-in self-test") status flags */
> > >  #define QCOM_ICE_BIST_STATUS_MASK            GENMASK(31, 28)
> > > @@ -34,6 +68,9 @@
> > >  #define QCOM_ICE_FORCE_HW_KEY0_SETTING_MASK  0x2  #define
> > > QCOM_ICE_FORCE_HW_KEY1_SETTING_MASK  0x4
> > >
> > > +#define QCOM_ICE_HWKM_REG_OFFSET     0x8000
> > > +#define HWKM_OFFSET(reg)             ((reg) +
> > QCOM_ICE_HWKM_REG_OFFSET)
> > > +
> > >  #define qcom_ice_writel(engine, val, reg)    \
> > >       writel((val), (engine)->base + (reg))
> > >
> > > @@ -46,6 +83,9 @@ struct qcom_ice {
> > >       struct device_link *link;
> > >
> > >       struct clk *core_clk;
> > > +     u8 hwkm_version;
> > > +     bool use_hwkm;
> > > +     bool hwkm_init_complete;
> > >  };
> > >
> > >  static bool qcom_ice_check_supported(struct qcom_ice *ice) @@ -63,8
> > > +103,21 @@ static bool qcom_ice_check_supported(struct qcom_ice *ice)
> > >               return false;
> > >       }
> > >
> > > -     dev_info(dev, "Found QC Inline Crypto Engine (ICE) v%d.%d.%d\n",
> > > -              major, minor, step);
> > > +     if (major >= 4 || (major == 3 && minor == 2 && step >= 1))
> > > +             ice->hwkm_version = 2;
> > > +     else if (major == 3 && minor == 2)
> > > +             ice->hwkm_version = 1;
> > > +     else
> > > +             ice->hwkm_version = 0;
> > > +
> > > +     if (ice->hwkm_version == 0)
> > > +             ice->use_hwkm = false;
> > > +
> > > +     dev_info(dev, "Found QC Inline Crypto Engine (ICE) v%d.%d.%d,
> > HWKM v%d\n",
> > > +              major, minor, step, ice->hwkm_version);
> > > +
> > > +     if (!ice->use_hwkm)
> > > +             dev_info(dev, "QC ICE HWKM (Hardware Key Manager) not
> > > + used/supported");
> > >
> > >       /* If fuses are blown, ICE might not work in the standard way. */
> > >       regval = qcom_ice_readl(ice, QCOM_ICE_REG_FUSE_SETTING); @@
> > > -113,27 +166,106 @@ static void qcom_ice_optimization_enable(struct
> > qcom_ice *ice)
> > >   * fails, so we needn't do it in software too, and (c) properly testing
> > >   * storage encryption requires testing the full storage stack anyway,
> > >   * and not relying on hardware-level self-tests.
> > > + *
> > > + * However, we still care about if HWKM BIST failed (when supported)
> > > + as
> > > + * important functionality would fail later, so disable hwkm on failure.
> > >   */
> > >  static int qcom_ice_wait_bist_status(struct qcom_ice *ice)  {
> > >       u32 regval;
> > > +     u32 bist_done_val;
> > >       int err;
> > >
> > >       err = readl_poll_timeout(ice->base + QCOM_ICE_REG_BIST_STATUS,
> > >                                regval, !(regval & QCOM_ICE_BIST_STATUS_MASK),
> > >                                50, 5000);
> > > -     if (err)
> > > +     if (err) {
> > >               dev_err(ice->dev, "Timed out waiting for ICE self-test
> > > to complete\n");
> > > +             return err;
> > > +     }
> > >
> > > +     if (ice->use_hwkm) {
> > > +             bist_done_val = ice->hwkm_version == 1 ?
> > > +                             QCOM_ICE_HWKM_BIST_VAL(1) :
> > > +                             QCOM_ICE_HWKM_BIST_VAL(2);
> > > +             if (qcom_ice_readl(ice,
> > > +
> > HWKM_OFFSET(QCOM_ICE_REG_HWKM_TZ_KM_STATUS)) !=
> > > +                                bist_done_val) {
> > > +                     dev_err(ice->dev, "HWKM BIST error\n");
> > > +                     ice->use_hwkm = false;
> > > +                     err = -ENODEV;
> > > +             }
> > > +     }
> > >       return err;
> > >  }
> > >
> > > +static void qcom_ice_enable_standard_mode(struct qcom_ice *ice) {
> > > +     u32 val = 0;
> > > +
> > > +     /*
> > > +      * When ICE is in standard (hwkm) mode, it supports HW wrapped
> > > +      * keys, and when it is in legacy mode, it only supports standard
> > > +      * (non HW wrapped) keys.
> >
> > I can't say this is very logical.
> >
> > standard mode => HW wrapped keys
> > legacy mode => standard keys
> >
> > Consider changing the terms.
> >
>
> Ack, will make this clearer
>
> > > +      *
> > > +      * Put ICE in standard mode, ICE defaults to legacy mode.
> > > +      * Legacy mode - ICE HWKM slave not supported.
> > > +      * Standard mode - ICE HWKM slave supported.
> >
> > s/slave/some other term/
> >
> Ack - will address this.
>
> > Is it possible to use both kind of keys when working on standard mode?
> > If not, it should be the user who selects what type of keys to be used.
> > Enforcing this via DT is not a way to go.
> >
>
> Unfortunately, that support is not there yet. When you say user, do you mean to have it as a filesystem
> mount option?

During cryptsetup time. When running e.g. cryptsetup I, as a user,
would like to be able to use either a hardware-wrapped key or a
standard key.

> The way the UFS/EMMC crypto layer is designed currently is that, this information
> is needed when the modules are loaded.
>
> https://lore.kernel.org/all/20231104211259.17448-2-ebiggers@kernel.org/#Z31drivers:ufs:core:ufshcd-crypto.c

I see that the driver lists capabilities here. E.g. that it supports
HW-wrapped keys. But the line doesn't specify that standard keys are
not supported.

Also, I'd have expected that hw-wrapped keys are handled using trusted
keys mechanism (see security/keys/trusted-keys/). Could you please
point out why that's not the case?

> I am thinking of a way now to do this with DT, but without having a new vendor property.
> Is it acceptable to use the addressable range as the deciding factor? Say use legacy mode of ICE
> when the addressable size is 0x8000 and use HWKM mode of ICE when the addressable size is
> 0x10000.

Definitely, this is a NAK. It's a very unobvious hack. You have been
asked to use compatible strings to detect whether HW keys are
supported or not.

-- 
With best wishes
Dmitry

