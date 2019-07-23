Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67DBA71AC2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2019 16:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388298AbfGWOuH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jul 2019 10:50:07 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36204 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732608AbfGWOuH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jul 2019 10:50:07 -0400
Received: by mail-pf1-f194.google.com with SMTP id r7so19272858pfl.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2019 07:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:to:cc:from:user-agent:date;
        bh=qFGyu2e0qPfrwHi7OXbbKa0ySxd874e1ZB3q+1beBgk=;
        b=B/1NfqRknQzOA9lNUKMjw8bei1USgk+jf8C7LimjmeeuY/nXbOwY9qKGdqr1xB0Ep1
         fF+uGyD6SZT5kkwDHqgcI+JJucEKJ2eELk1VJumWUxl26Nnj5D2cJF8WjuYyVe4s8NF3
         VlozWZllNLHU0k5+JPfpJ+vslVBC70FPXvsr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:to:cc:from
         :user-agent:date;
        bh=qFGyu2e0qPfrwHi7OXbbKa0ySxd874e1ZB3q+1beBgk=;
        b=dtiycs5sAlmEuTh2MZ0zNWHjCS+eB5yegT4AvAR8Pqai95saoIj9MKv2ptSUGGoNEf
         gy+OoTDJJKhkgn7pQBCcybdEcgGGBjcpoXFOtlU67sN1L/pCbXrqkai8Xq4Ui4eksuTH
         4rBnY5Ukk1S+UFOjN9DkTS6uSyklisDDsZBJUHFAUi+OJ5piTwtX64HLrq2DM69NaZJH
         PTfbyQXRZVIuYbVONgAuFeqySRz40KL6/x/WidNd0x3jDIv4pNhfuuRKF/NIkI7pYUH0
         nMYijYdYji4sfYP7mG/0DUsO9FSUicfErYUoqN0ZszmX8OibO+VIg+Ctyyl2/CqM03kV
         ZSNw==
X-Gm-Message-State: APjAAAWXY7IbCwXP1TmViwl1SeI4Ns/5Kc/O5ondEO/iCyCXOkOpTDWv
        4A6SuePu6Qd9MnT55Dtcqq1Nig==
X-Google-Smtp-Source: APXvYqzh3JlVXvMXshU7/BGzt6pys4NOV2ew9Hhpy6X+ywpiQ45vC0nwZXvmBT2O3iv2LcxoEYem+A==
X-Received: by 2002:a63:eb56:: with SMTP id b22mr77607662pgk.355.1563893406340;
        Tue, 23 Jul 2019 07:50:06 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id w2sm36341678pgc.32.2019.07.23.07.50.05
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 23 Jul 2019 07:50:05 -0700 (PDT)
Message-ID: <5d371e9d.1c69fb81.8d9f4.1ac0@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190722123422.4571-2-vkoul@kernel.org>
References: <20190722123422.4571-1-vkoul@kernel.org> <20190722123422.4571-2-vkoul@kernel.org>
Subject: Re: [PATCH 1/5] arm64: dts: qcom: sdm845: Add unit name to soc node
To:     Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Tue, 23 Jul 2019 07:50:05 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-07-22 05:34:18)
> We get a warning about missing unit name for soc node, so add it.
>=20
> arch/arm64/boot/dts/qcom/sdm845.dtsi:623.11-2814.4: Warning (unit_address=
_vs_reg): /soc: node has a reg or ranges property, but no unit name
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/q=
com/sdm845.dtsi
> index 601cfb078bd5..e81f4a6d08ce 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -620,7 +620,7 @@
>                 method =3D "smc";
>         };
> =20
> -       soc: soc {
> +       soc: soc@0 {

This is kinda sad, but ok. Maybe you can apply this fix to at least all
the qcom boards then.

>                 #address-cells =3D <2>;
>                 #size-cells =3D <2>;
>                 ranges =3D <0 0 0 0 0x10 0>;
