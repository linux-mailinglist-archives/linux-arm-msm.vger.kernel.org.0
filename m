Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F17C15D020
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2020 03:43:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728529AbgBNCnG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Feb 2020 21:43:06 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:51280 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728052AbgBNCnG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Feb 2020 21:43:06 -0500
Received: by mail-pj1-f68.google.com with SMTP id fa20so3239275pjb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2020 18:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=uhAnaYBibh71jLGyT/MAQHtwtB/q365HXNevkI1NHmw=;
        b=bqza2qpu0iMia0lDRZcLlw1hsj7t4HxHSBGtkrUkfecnRtXkQV9k9Hr+P3fXTdeYwG
         WIGaXJCtnBYGIvhfHG2pUPZuZW0jCLv5UTd5aIQk7vLOBWUsvdfPeteI55NNImnKObNd
         2+6JO7ErmbVY4W9L1QidUq0BRuc7LOtlUUygs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=uhAnaYBibh71jLGyT/MAQHtwtB/q365HXNevkI1NHmw=;
        b=IZi+RjPZm+8URHwP83Rqn2LJXBX+wuoeKiw4f6o6MhJtvCWQWDPNcVEdsEDsik7o7B
         ThhoZ+UMWz0bo0d6xsPwAB8bjNWApJAdH5ZjSTQivKN/xS8V4ZQwj9gRAfnyoqL8sNg9
         Zj3OUnJ5wzXCEH+4ZjrFkdhjUMPoo2cAzZjIjCCueP8eRQgagOHx1277t3iAbPAe2S45
         VS5HTB06m+mWEPqNhWGTU/lObhBn9Yc6qq+oHxlP6za9McsGIpuInk/RnGX0Z9i27UGR
         z+iezHLTahcxoKRG5D8G7HHwscWdq9GYXvcORr19yMxUrPmtutz+85BDfIEOoKib+1Y2
         2v+A==
X-Gm-Message-State: APjAAAUH/ct//k/bv5TnIWed/ZETLVeYupYVCwQzq2IUb09nVgh3fWPV
        kHKcC9XsC5fPcziCiBqB0gixVIr0tnk=
X-Google-Smtp-Source: APXvYqyieuX93wS+pYXvIYep4RXo0jartYxK5/w/PiWzurnNWGvHpO1ykyoIhsad7KiPH8fJQYxXTA==
X-Received: by 2002:a17:90a:8001:: with SMTP id b1mr745812pjn.39.1581648185439;
        Thu, 13 Feb 2020 18:43:05 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id t66sm4628079pgb.91.2020.02.13.18.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 18:43:05 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200211005059.1377279-9-bjorn.andersson@linaro.org>
References: <20200211005059.1377279-1-bjorn.andersson@linaro.org> <20200211005059.1377279-9-bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 8/8] remoteproc: qcom: Introduce panic handler for PAS and ADSP
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Date:   Thu, 13 Feb 2020 18:43:04 -0800
Message-ID: <158164818421.184098.5580195556346218701@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2020-02-10 16:50:59)
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qco=
m_q6v5_adsp.c
> index 19f784adf91c..822881534d37 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -291,12 +291,20 @@ static void *adsp_da_to_va(struct rproc *rproc, u64=
 da, int len)
>         return adsp->mem_region + offset;
>  }
> =20
> +static unsigned int adsp_panic(struct rproc *rproc)
> +{
> +       struct qcom_adsp *adsp =3D (struct qcom_adsp *)rproc->priv;

We don't need to cast from void. Please drop the cast.

> +
> +       return qcom_q6v5_panic(&adsp->q6v5);
> +}
> +
>  static const struct rproc_ops adsp_ops =3D {
>         .start =3D adsp_start,
>         .stop =3D adsp_stop,
>         .da_to_va =3D adsp_da_to_va,
>         .parse_fw =3D qcom_register_dump_segments,
>         .load =3D adsp_load,
> +       .panic =3D adsp_panic,
>  };
> =20
>  static int adsp_init_clock(struct qcom_adsp *adsp, const char **clk_ids)
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index d20ce3c62256..ac38624fb14d 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -242,12 +242,20 @@ static void *adsp_da_to_va(struct rproc *rproc, u64=
 da, int len)
>         return adsp->mem_region + offset;
>  }
> =20
> +static unsigned int adsp_panic(struct rproc *rproc)
> +{
> +       struct qcom_adsp *adsp =3D (struct qcom_adsp *)rproc->priv;

Same.

> +
> +       return qcom_q6v5_panic(&adsp->q6v5);
> +}
