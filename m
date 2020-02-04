Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D974E1513CF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 01:52:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726928AbgBDAwI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 19:52:08 -0500
Received: from mail-pl1-f177.google.com ([209.85.214.177]:36772 "EHLO
        mail-pl1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726853AbgBDAwI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 19:52:08 -0500
Received: by mail-pl1-f177.google.com with SMTP id a6so6534038plm.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 16:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:subject:cc:user-agent:date;
        bh=hcIePRtjEpO0TZ9jpC5LlD4R/lpZZZ3BibuM5fjf+D8=;
        b=Wd7mzS76ljQ/4qpb1siNkBg4U0iNC8Flv4k2iIn7K7CX6OYPrVh+iypR8nVmEpBhCV
         2fa2RhLn4FsSP7mNmro9wArlkyph4AMAVVjj5S3RZgsK1ZsQFdONdfCDj+qsOUesrGxu
         94HRhQlbXJBpAwNFkv65dUXbSIG69xmiBmVXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:subject:cc
         :user-agent:date;
        bh=hcIePRtjEpO0TZ9jpC5LlD4R/lpZZZ3BibuM5fjf+D8=;
        b=snueOxc/YR1dudjpzBILS5B82eLv5zumhc5o3EQ3AxO0GX1TSStwPqqfNM1X5fg9Qy
         IBhTnL6nk551x7Cb79CVmfbJVmQ7VYLiwT81ZX7JD+20ZK2GYCNrHV3qIj72KttQE/iO
         Vm0XGg46lSL6OpcSpl/8mFSgefiFEl0dx7Qvwr4rxa74oLPTMTk5ZiifgZxWz8PEtVU9
         uxw4lIIgG90flXUXFHgpZJG+mqijtAmaCGyvN6OSbZwRpIgnrjzcnp/72FftVI91xfdd
         vTL4Tp7rUxbfR+goFuaE4pdNQ8s3XDO15CsEfCBGbVWvwJpSVFGbxnEzhpk1GEQznzNc
         Sq8Q==
X-Gm-Message-State: APjAAAViBLl6YU4fVqJZ9gNmsuzwGsIIPk7BKrnRDsr0FitKdciDmPPE
        A6JCjeo8KI4rlHYYLB3HuKNOHg==
X-Google-Smtp-Source: APXvYqzXCR3u4HFYZyRHw5Y2qD6gJW15nagfIOV2RqNELlue/UXK8myO+hYQBmo83ngr9qpX9ygUnA==
X-Received: by 2002:a17:90a:d986:: with SMTP id d6mr2438594pjv.78.1580777527487;
        Mon, 03 Feb 2020 16:52:07 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id y23sm21626086pfn.101.2020.02.03.16.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 16:52:06 -0800 (PST)
Message-ID: <5e38c036.1c69fb81.3da87.c53d@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1580305919-30946-6-git-send-email-sanm@codeaurora.org>
References: <1580305919-30946-1-git-send-email-sanm@codeaurora.org> <1580305919-30946-6-git-send-email-sanm@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: Re: [PATCH v4 5/8] phy: qcom-qusb2: Add support for overriding tuning parameters in QUSB2 V2 PHY
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Sandeep Maheswaram <sanm@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Mon, 03 Feb 2020 16:52:05 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sandeep Maheswaram (2020-01-29 05:51:56)
> @@ -277,6 +289,34 @@ static const char * const qusb2_phy_vreg_names[] =3D=
 {
> =20
>  #define QUSB2_NUM_VREGS                ARRAY_SIZE(qusb2_phy_vreg_names)
> =20
> +/* struct override_param - structure holding qusb2 v2 phy overriding par=
am
> + * set override true if the  device tree property exists and read and as=
sign
> + * to value
> + */
> +struct override_param {
> +       bool override;
> +       u8 value;
> +};
> +
> +/*struct override_params - structure holding qusb2 v2 phy overriding par=
ams
> + * @imp_res_offset: rescode offset to be updated in IMP_CTRL1 register
> + * @hstx_trim: HSTX_TRIM to be updated in TUNE1 register
> + * @preemphasis: Amplitude Pre-Emphasis to be updated in TUNE1 register
> + * @preemphasis_width: half/full-width Pre-Emphasis updated via TUNE1
> + * @bias_ctrl: bias ctrl to be updated in BIAS_CONTROL_2 register
> + * @charge_ctrl: charge ctrl to be updated in CHG_CTRL2 register
> + * @hsdisc_trim: disconnect threshold to be updated in TUNE2 register
> + */
> +struct override_params {
> +       struct override_param imp_res_offset;
> +       struct override_param hstx_trim;
> +       struct override_param preemphasis;
> +       struct override_param preemphasis_width;
> +       struct override_param bias_ctrl;
> +       struct override_param charge_ctrl;
> +       struct override_param hsdisc_trim;
> +};
> +
>  /**
>   * struct qusb2_phy - structure holding qusb2 phy attributes
>   *
> @@ -395,23 +423,33 @@ static void qusb2_phy_override_phy_params(struct qu=
sb2_phy *qphy)
> @@ -421,6 +459,11 @@ static void qusb2_phy_override_phy_params(struct qus=
b2_phy *qphy)
>                                       cfg->regs[QUSB2PHY_PORT_TUNE1],
>                                       PREEMPH_WIDTH_HALF_BIT);
>         }
> +
> +       if (qphy->overrides.hsdisc_trim.override)
> +               qusb2_write_mask(qphy->base, cfg->regs[QUSB2PHY_PORT_TUNE=
2],
> +               qphy->overrides.hsdisc_trim.value << HSDISC_TRIM_SHIFT,
> +                                HSDISC_TRIM_MASK);
>  }
> =20
>  /*
> @@ -864,26 +907,44 @@ static int qusb2_phy_probe(struct platform_device *=
pdev)
> =20
[...]
>         if (!of_property_read_u32(dev->of_node, "qcom,preemphasis-width",
>                                      &value)) {
> -               qphy->preemphasis_width =3D (u8)value;
> -               qphy->override_preemphasis_width =3D true;
> +               qphy->overrides.preemphasis_width.value =3D (u8)value;
> +               qphy->overrides.preemphasis_width.override =3D true;
> +       }
> +
> +       if (!of_property_read_u32(dev->of_node, "qcom,hsdisc-trim-value",
> +                                 &value)) {
> +               qphy->overrides.hsdisc_trim.value =3D (u8)value;
> +               qphy->overrides.hsdisc_trim.override =3D true;
>         }
> =20

Is it possible to make a local array that we can crank through the
overrides with? If they're all u8 values maybe we can have an array like

	const char * const char override_names[] =3D {
		[HSDISC_TRIM_VALUE] =3D "qcom,hsdisc-trim-value",
		[PREEMP_WIDTH] =3D ...
	};

that we then link to another array inside qphy named overrides:
=09
	struct override_param overrides[NUM_OVERRIDES];

and then we can bounce from overrides to override_names to parse out the
random u8 values from the DT node. The idea is to avoid "wasting"
pointers to the name when we don't care after parsing it. It may not be
any different vs. just having a const char *name in the override_paramt
struct though, so please measure it.

Also, why not  use of_property_read_u8() and make DT writers have

	/bits/ 8 <0xf0>

properties so that we can keep things smaller. I don't understand why
they're u32 in DT besides to make it simpler to specify a u32.

