Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54C51FE8BD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Nov 2019 00:40:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727141AbfKOXkd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 18:40:33 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:38537 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727056AbfKOXkc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 18:40:32 -0500
Received: by mail-pl1-f194.google.com with SMTP id q18so2022338pls.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2019 15:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:subject:from:user-agent:date;
        bh=+XDMDwtLZbF6RVlSCLkQwNjqRZYVVLh4tuHqqX3hF8k=;
        b=ATy8lieENSWkqw31dbniYF5chS9Ym+ri46pF2L2cPudIPAXD/K+eooeSBtUNldl5th
         TE+/gN5y4OpCd/AKQvI3Pjnh/uJX1ZRd8n7zFSrcgF+Us24LoATpFWNf2ukbR0gfewTU
         HHq79yGE8Lf0ZLO9uG7oEk3pO3besCb571IsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:date;
        bh=+XDMDwtLZbF6RVlSCLkQwNjqRZYVVLh4tuHqqX3hF8k=;
        b=RQlex3+fyFTlGN48SAio7lANuj4ZO6JJVDA4ZFvQq7s4DvVz+v9Xy2HwMZem2Z3A6X
         PzEYbVvMNHAREPTge/F1lwqrS9kF2iTthaIgmHupLyMuFZ6Weqr6UpwnFQnQqVR8BLHe
         j0ZjbhsVy2t2pNWBUYqW9o0Do9sBQ4vSVcjvkbilr7VDCHtOH+fLnahpfinxbXznSphF
         6T9c6t0YvDygeuOgG4Bs4WxhVWI7t1vI2PKUm73yP8pZKLRQhprvm4nxdOfVUiqE4lja
         IJGg+dfOrFTBtwyM0kDX74HIuOaPvWwWZriXPXt8UP+eCOV2IW2+iMExd16EOlLc4BzL
         U1WA==
X-Gm-Message-State: APjAAAU9GWhH77qhbc2dhvn8mdxvc9edYYfk/+8DGOznJs7oRLduKSKX
        C3cQ2zE542mRCKv6d4lSKtFQJA==
X-Google-Smtp-Source: APXvYqwn1638XPWFmd6YFWaYv6V9xuStQxxnhD+ycGHaJb4RleXlcXVY6Isx3yZhz9MsGaJwE/X0Yw==
X-Received: by 2002:a17:902:6bc5:: with SMTP id m5mr17276746plt.185.1573861231936;
        Fri, 15 Nov 2019 15:40:31 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id c12sm12027324pfp.178.2019.11.15.15.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 15:40:31 -0800 (PST)
Message-ID: <5dcf376f.1c69fb81.6fa51.4fa7@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573593774-12539-7-git-send-email-eberman@codeaurora.org>
References: <1573593774-12539-1-git-send-email-eberman@codeaurora.org> <1573593774-12539-7-git-send-email-eberman@codeaurora.org>
Cc:     Elliot Berman <eberman@codeaurora.org>, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Elliot Berman <eberman@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org
Subject: Re: [PATCH v2 06/18] firmware: qcom_scm-64: Move svc/cmd/owner into qcom_scm_desc
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 15 Nov 2019 15:40:30 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Elliot Berman (2019-11-12 13:22:42)
> diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-6=
4.c
> index 7de6022..e81fb6e 100644
> --- a/drivers/firmware/qcom_scm-64.c
> +++ b/drivers/firmware/qcom_scm-64.c
> @@ -46,8 +46,11 @@ enum qcom_scm_arg_types {
>   * @res:       The values returned by the secure syscall
>   */
>  struct qcom_scm_desc {
> +       u32 svc;
> +       u32 cmd;
>         u32 arginfo;
>         u64 args[MAX_QCOM_SCM_ARGS];
> +       u32 owner;

Owner is always the same. Why move it to the qcom_scm_desc structure? I
can understand svc and cmd but there's no justification for this struct
member.

>  };
> =20
>  static u64 qcom_smccc_convention =3D -1;
[...]
> @@ -542,26 +584,32 @@ int __qcom_scm_io_readl(struct device *dev, phys_ad=
dr_t addr,
> =20
>  int __qcom_scm_io_writel(struct device *dev, phys_addr_t addr, unsigned =
int val)
>  {
> -       struct qcom_scm_desc desc =3D {0};
> +       struct qcom_scm_desc desc =3D {
> +               .svc =3D QCOM_SCM_SVC_IO,
> +               .cmd =3D QCOM_SCM_IO_WRITE,
> +               .owner =3D ARM_SMCCC_OWNER_SIP,
> +       };
>         struct arm_smccc_res res;
> =20
>         desc.args[0] =3D addr;
>         desc.args[1] =3D val;
>         desc.arginfo =3D QCOM_SCM_ARGS(2);

The style is weird here. Half of the struct is initialized during
declaration and the arguments are set here with individual statements.
Can we have one way or the other and not both?

> =20
> -       return qcom_scm_call(dev, QCOM_SCM_SVC_IO, QCOM_SCM_IO_WRITE,
> -                            &desc, &res);
> +       return qcom_scm_call(dev, &desc, &res);
>  }
> =20
