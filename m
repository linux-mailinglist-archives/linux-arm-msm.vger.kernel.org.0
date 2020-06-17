Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 865D21FCED1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2020 15:49:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgFQNtW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 09:49:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbgFQNtV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 09:49:21 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C762C0613ED
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 06:49:20 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id i27so2899637ljb.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 06:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vC2m/NVOsMePL7cd05WEIx6qonlbpRgoDsdMvHqyOPM=;
        b=WTmaZqP6UdEgLvq/OSB7yIjYV9nBX4EXBL9g7HIak/60g/87RpOi2miJaHBNwUgwkc
         H+5ch+9xdNeq6Eykr1eRu0BWx/1ulGmSUqh1/BbrvYCcsDa1ZPbxrIxaLJdo7j0PSAEf
         Q2vRfD29srze/fsC6mP9pcuSJLoSP+bUbVZD52WfQ5XBgdZNhxM5IfB+FQETiu071r9D
         yqqdzmF224Y7++hl3mLT2AyQLSS2lj5jC+ljT3Y3pSQI4y4JZRU4mgyjc8noBbCTOb5V
         mz+mmSeD5JGuL7JWtzL+dgLfJZ9QhZzrNtdSSQEV7PA5YZxk4W69Vw2Kfu3+YDF/LdKt
         GTCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vC2m/NVOsMePL7cd05WEIx6qonlbpRgoDsdMvHqyOPM=;
        b=D1nwxBoMG+9d2Re3+S8OoBF8nz736zqIW2wn1qp+ToN4dbyZYxVtXBgXKOrYrQIiNX
         +aq9ArZP/8ZQUTmnJK0GmxgZ2yt2423wo6OFT8rFBP4EhKrdp1WXIlyJK7oUfF3pYiXq
         ho5FZ+grrKBjJIFR/zLkWMgUvrTGPdby2WPVfVxS0hEdf5aUrJo7pJ25KuoLnbF9oe98
         TIwVvXPZATotlbXL8Wk3hbbQxGRR/tkKCxWymgtWbp1ImpyGFoeheGIa/bQikRiE5L9j
         L9205erwQMmoRplPTN/aCZ4sSrz3VQu589/YpCVIu0X+7pLQtvDB9W6EOrlf9oerzuYQ
         AJuQ==
X-Gm-Message-State: AOAM530i0Jqmofw5msuKwzyEi7JWZDiVYXQ8cI252Nv4wSB2Np3ISdDI
        Aj9OKQEaPaSvvHlQAVPORWSmoKWNzq/MsRqdLUEbgS+fiNq3ug==
X-Google-Smtp-Source: ABdhPJyvm7mXDGUIA1HB62LGReElqV+BhcGKmVz/LfVuEfkWC4MV5x1jr6gooo2ixzzp+Ijd7hPb38OMLUJtFoXFTqs=
X-Received: by 2002:a2e:974e:: with SMTP id f14mr3960178ljj.102.1592401756905;
 Wed, 17 Jun 2020 06:49:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200617065658.27567-1-naresh.kamboju@linaro.org>
In-Reply-To: <20200617065658.27567-1-naresh.kamboju@linaro.org>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 17 Jun 2020 19:19:04 +0530
Message-ID: <CA+G9fYuEojvbmvLPZ7JzY9bNh4f030sYGZOWQU1Rf=6rFUPuUw@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: qcom: q6v5-mss: Fix kfree build error
To:     linux-arm-msm@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org
Cc:     Sibi Sankar <sibis@codeaurora.org>,
        Vinod Koul <vinod.koul@linaro.org>, agross@kernel.org,
        Ohad Ben Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+ linux-remoteproc@vger.kernel.org

On Wed, 17 Jun 2020 at 12:27, Naresh Kamboju <naresh.kamboju@linaro.org> wr=
ote:
>
> This patch adds linux/slab.h to fix build error in qcom_q6v5_mss.c
>
> Build error:
>  ../drivers/remoteproc/qcom_q6v5_mss.c:
>   In function =E2=80=98q6v5_mpss_init_image=E2=80=99:
>  ../drivers/remoteproc/qcom_q6v5_mss.c:772:3:
>   error: implicit declaration of function =E2=80=98kfree=E2=80=99;
>   did you mean =E2=80=98vfree=E2=80=99? [-Werror=3Dimplicit-function-decl=
aration]
>    772 |   kfree(metadata);
>        |   ^~~~~
>        |   vfree
>
> Signed-off-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom=
_q6v5_mss.c
> index feb70283b6a2..903b2bb97e12 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -26,6 +26,7 @@
>  #include <linux/reset.h>
>  #include <linux/soc/qcom/mdt_loader.h>
>  #include <linux/iopoll.h>
> +#include <linux/slab.h>
>
>  #include "remoteproc_internal.h"
>  #include "qcom_common.h"
> --
> 2.17.1
>
