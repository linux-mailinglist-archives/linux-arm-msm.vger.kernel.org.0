Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06203133BF5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2020 08:03:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbgAHHDC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jan 2020 02:03:02 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:34529 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbgAHHDB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jan 2020 02:03:01 -0500
Received: by mail-pj1-f65.google.com with SMTP id s94so6037092pjc.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2020 23:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:subject:to:from:user-agent:date;
        bh=D87ghgdaSO3k8NnHY1l/nPSvxAChoLFL85zOiWCVIOQ=;
        b=nt1b70vMydunA/QR1B2tf2BIXLFnIBabYtlPrStWr++qSGtx203ggsaQ8g2aawn/Sp
         lvAKA8Iud+EBWvE0Vqa8KhY/8fPBzChYdUQpfn7ZZJxCnJ2/36qCpJbupzJyMLeRncZk
         404Fg2eeY21Q2YtkI9e2f6VQQU1OxeIRWBsBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:subject:to:from
         :user-agent:date;
        bh=D87ghgdaSO3k8NnHY1l/nPSvxAChoLFL85zOiWCVIOQ=;
        b=GgC8n6Ug22iblsCcIS5Y1yXn36b3ZKizbUy+N6LH7T/nDqCN9s3heovUo/ylbUcsCV
         xQy0JXAKJISSTlDIOOBXZABpShce12TVtZr5wVzRqzyw6UZMD/8IwgsjJ8E1xGdc1fDZ
         f+bPCzDyY/vFhIEh8DHy1E+PTkN9dgsqxLpR9ua8fh9tMhArb77Nwt3DEzJChyfj0/UM
         fVnS+lavz/xF1oiK5Yna7WWP4kemMwyCijhVi8LBInGNxgTHrNDE1p49k5OYfhU/s+Ic
         FQNKZ7lAgA+QfrgReHhNhif++jHJ3HZhthUMkHAXoy4QemrkYYK6C03lNFUuejUm9D58
         AO5g==
X-Gm-Message-State: APjAAAUoJLwpf06IdWo+4qQtnB4cF9CMHkL3AHShgRifDMbp0BC1jRt9
        eyf4ugRrpKgyowN2QpqGAIyJOg==
X-Google-Smtp-Source: APXvYqyq6OeXRylbdYejQHCusXuLDRnnLNmFTBkPgoWcAtjQ0nnYI26XidzZIxVEuJk9eG4XYHpXUg==
X-Received: by 2002:a17:90a:2808:: with SMTP id e8mr2750843pjd.63.1578466981196;
        Tue, 07 Jan 2020 23:03:01 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id u18sm2168662pgn.9.2020.01.07.23.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 23:03:00 -0800 (PST)
Message-ID: <5e157ea4.1c69fb81.8361e.6698@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1578431066-19600-18-git-send-email-eberman@codeaurora.org>
References: <1578431066-19600-1-git-send-email-eberman@codeaurora.org> <1578431066-19600-18-git-send-email-eberman@codeaurora.org>
Cc:     Elliot Berman <eberman@codeaurora.org>,
        saiprakash.ranjan@codeaurora.org, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        Brian Masney <masneyb@onstation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 17/17] firmware: qcom_scm: Dynamically support SMCCC and legacy conventions
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Elliot Berman <eberman@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>, agross@kernel.org
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Tue, 07 Jan 2020 23:02:59 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

(Nitpick trivia late at night)

Quoting Elliot Berman (2020-01-07 13:04:26)
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index 895f148..059bb0f 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -72,6 +72,13 @@ static struct qcom_scm_wb_entry qcom_scm_wb[] =3D {
>         { .flag =3D QCOM_SCM_FLAG_WARMBOOT_CPU3 },
>  };
> =20
> +static const char *qcom_scm_convention_names[] =3D {

Can this be const char * const ?

> +       [SMC_CONVENTION_UNKNOWN] =3D "unknown",
> +       [SMC_CONVENTION_ARM_32] =3D "smc arm 32",
> +       [SMC_CONVENTION_ARM_64] =3D "smc arm 64",
> +       [SMC_CONVENTION_LEGACY] =3D "smc legacy",
> +};
> +
>  static struct qcom_scm *__scm;
> =20
>  static int qcom_scm_clk_enable(void)
> @@ -107,6 +114,143 @@ static void qcom_scm_clk_disable(void)
>         clk_disable_unprepare(__scm->bus_clk);
>  }
> =20
> +static int __qcom_scm_is_call_available(struct device *dev, u32 svc_id,
> +                                       u32 cmd_id);
> +
> +enum qcom_scm_convention qcom_scm_convention;
> +static bool has_queried __read_mostly;
> +static DEFINE_SPINLOCK(query_lock);
> +
> +static void __query_convention(void)
> +{
> +       unsigned long flags;
> +       struct qcom_scm_desc desc =3D {
> +               .svc =3D QCOM_SCM_SVC_INFO,
> +               .cmd =3D QCOM_SCM_INFO_IS_CALL_AVAIL,
> +               .args[0] =3D SCM_SMC_FNID(QCOM_SCM_SVC_INFO,
> +                                          QCOM_SCM_INFO_IS_CALL_AVAIL) |
> +                          (ARM_SMCCC_OWNER_SIP << ARM_SMCCC_OWNER_SHIFT),
> +               .arginfo =3D QCOM_SCM_ARGS(1),
> +               .owner =3D ARM_SMCCC_OWNER_SIP,
> +       };
> +       struct qcom_scm_res res;
> +       int ret;
> +
> +       spin_lock_irqsave(&query_lock, flags);
> +       if (has_queried)
> +               goto out;
> +
> +       qcom_scm_convention =3D SMC_CONVENTION_ARM_64;
> +       // Device isn't required as there is only one argument - no device
> +       // needed to dma_map_single to secure world

This isn't kernel style for multiline comments. Please use /* and */.

> +       ret =3D scm_smc_call(NULL, &desc, &res, true);
> +       if (!ret && res.result[0] =3D=3D 1)
> +               goto out;
> +
