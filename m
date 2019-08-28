Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5691A0D8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2019 00:31:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726943AbfH1WbS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Aug 2019 18:31:18 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33595 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbfH1WbR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Aug 2019 18:31:17 -0400
Received: by mail-pf1-f196.google.com with SMTP id g2so700670pfq.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2019 15:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:subject:to:from:user-agent:date;
        bh=p4kczEged4PJNYuJuOKUVrGMVyqBPXCMEIi25oSs9zE=;
        b=J+0oZUK+9Yo1u47+ar5On6fbk1R7IVCW8Gt/TLA2mEIJUBhsB0B2kdGCuVcAn6NOUA
         2ltzMJiUnbamaWDWxrssuzuAjajeytOxlIEF7/48sE64gpEQpItt7fZLUfHiNwImYzAf
         Xg4CoYF8tDhYiLL6yV4loyFfs2v5ByVlNUC6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:subject:to:from
         :user-agent:date;
        bh=p4kczEged4PJNYuJuOKUVrGMVyqBPXCMEIi25oSs9zE=;
        b=X/rTwCsh78Gp5LMMlYAF/iVCrJykXzKXJNbiqwJ8A+TuGKIbt1HOSOCcf8dVoZXSXh
         I0+haL0DrWvenKFu8LU9hsH9ycIrDTJ5QqZ2RsFblGOwTKwBDIgoFCGAciUMgNsXXxYk
         5J9WB07r1IikjawDoJDQUqxMEsciF7M2OkyHVEH9RZwFpXRWWCkZuUDZO5Nn0w2TWfrO
         DqpYp8fueolxtUsyur8mFGB/ftOnFxkB2YlZhMB8M73e2a/wagWmnQlghYSZB0lEG4ud
         d9sCOXNGsZyMpTtKi083TdTbMEABsZit9H5d/qdU6CF5r/rEB18pTHkMLl/FpvIWgr90
         evgw==
X-Gm-Message-State: APjAAAUxYpTCvU5TVexK2MOmsoDYJlv3X/j6F0ce7SosrypqSTy/uBt8
        aDOI8HxsVb99uX0bgy2LXTkAJQ==
X-Google-Smtp-Source: APXvYqzUVNl95TJe5vg9vAyJ/wl9U3ASLCXCtEdozjIsaVJVnwYEPlFPokGNdsN/7UrrZeKEDbtZzw==
X-Received: by 2002:a63:ec13:: with SMTP id j19mr5377502pgh.369.1567031476880;
        Wed, 28 Aug 2019 15:31:16 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id c35sm191974pgl.72.2019.08.28.15.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2019 15:31:16 -0700 (PDT)
Message-ID: <5d6700b4.1c69fb81.24793.0bff@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190826164625.6744-1-jorge.ramirez-ortiz@linaro.org>
References: <20190826164625.6744-1-jorge.ramirez-ortiz@linaro.org>
Cc:     niklas.cassel@linaro.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mbox: qcom: add APCS child device for QCS404
To:     agross@kernel.org, jassisinghbrar@gmail.com,
        jorge.ramirez-ortiz@linaro.org
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Wed, 28 Aug 2019 15:31:15 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jorge Ramirez-Ortiz (2019-08-26 09:46:24)
> There is clock controller functionality in the APCS hardware block of
> qcs404 devices similar to msm8916.
>=20
> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qc=
om-apcs-ipc-mailbox.c
> index 705e17a5479c..76e1ad433b3f 100644
> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> @@ -89,7 +89,11 @@ static int qcom_apcs_ipc_probe(struct platform_device =
*pdev)
>                 return ret;
>         }
> =20
> -       if (of_device_is_compatible(np, "qcom,msm8916-apcs-kpss-global"))=
 {
> +       platform_set_drvdata(pdev, apcs);

Why did this move? It's required in the child driver or something now?
Is it a Fixes sort of change?

> +
> +       if (of_device_is_compatible(np, "qcom,msm8916-apcs-kpss-global") =
||
> +           of_device_is_compatible(np, "qcom,qcs404-apcs-apps-global")) {

Maybe this should be a compatible list instead of two calls to
of_device_is_compatible().

> +
>                 apcs->clk =3D platform_device_register_data(&pdev->dev,
>                                                           "qcom-apcs-msm8=
916-clk",
>                                                           -1, NULL, 0);
> @@ -97,8 +101,6 @@ static int qcom_apcs_ipc_probe(struct platform_device =
*pdev)
>                         dev_err(&pdev->dev, "failed to register APCS clk\=
n");
>         }
> =20
> -       platform_set_drvdata(pdev, apcs);
> -
>         return 0;
>  }
> =20
