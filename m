Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF436FE9D6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Nov 2019 01:41:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbfKPAlh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 19:41:37 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45750 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727151AbfKPAlg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 19:41:36 -0500
Received: by mail-pl1-f196.google.com with SMTP id w7so5792134plz.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2019 16:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:subject:from:user-agent:date;
        bh=9yDnCue+dWr9HxY0N6Q2Pch2FE87EcvqUib0TtR7pSQ=;
        b=SS09XMCCT188I3/yk/6QftNMC9IzPDYnQmdpD8FJApyiRworrCIHWetparqWbZqWfh
         sE82EvbhMwpgbLEHsZ261itWPBv2wNpDGEFunxQYMSVby8PR3RU1562IzkkAROSbXOjn
         IyKeUAD0YV6+aWB43jPUxzP0vmTiJL/RssgK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:date;
        bh=9yDnCue+dWr9HxY0N6Q2Pch2FE87EcvqUib0TtR7pSQ=;
        b=UooyYEdsxbqhg1BE88QIVPVr9I7UhcD8adzvs9OUfXvg12RnPRNhaSWxhnDsRgnUf/
         rtw5cfQfc97/49vKVAO8I7nDESTvXcmSnIJpywzXyWWfulWke7Boqd+vLUk0wcQMltiH
         jfgi0LOX/WZWeVCHYbG1Jb0I+Oh8Z08NBgtoT35uTRJo+vny70W70WHaTGHqmey2QQ1W
         cc2Ku5uvsHmDSsEXDU8fR5VDTfow3CG18rc0qQ8liqSRlfNVwtpSmQ7IRlC5Rm7V2eIZ
         irVMrY2t1BniUMpcqlsc/XeZRA1KfH8p2GFBKE3E/qmNIK+2LkzDoQorHtqQBCMZ/AZ/
         o6iQ==
X-Gm-Message-State: APjAAAUEpjEBkiBd+loGyv3REvf5+s4TiIBpH7CXHxQrT+YqqYcah+wh
        KqpQVuVcp9eFOsGjCmzykzPbAA==
X-Google-Smtp-Source: APXvYqyvjrTceDeetKzJjeqQs3diL1hZzZJ5Y8qhrrcMn2HLl3bmepesp6jkH4039XhUy5/6ptKlmQ==
X-Received: by 2002:a17:90a:35d0:: with SMTP id r74mr23276348pjb.47.1573864894228;
        Fri, 15 Nov 2019 16:41:34 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 193sm13872761pfv.18.2019.11.15.16.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 16:41:33 -0800 (PST)
Message-ID: <5dcf45bd.1c69fb81.297bb.9cb9@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573593774-12539-12-git-send-email-eberman@codeaurora.org>
References: <1573593774-12539-1-git-send-email-eberman@codeaurora.org> <1573593774-12539-12-git-send-email-eberman@codeaurora.org>
Cc:     Elliot Berman <eberman@codeaurora.org>, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Elliot Berman <eberman@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org
Subject: Re: [PATCH v2 11/18] firmware: qcom_scm-32: Use SMC arch wrappers
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 15 Nov 2019 16:41:32 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Elliot Berman (2019-11-12 13:22:47)
> Use SMC arch wrappers instead of inline assembly.
>=20
> Signed-off-by: Elliot Berman <eberman@codeaurora.org>
> ---

Nice. Can this come earlier in the series?

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

> diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-3=
2.c
> index e06d59b..c3aeccf 100644
> --- a/drivers/firmware/qcom_scm-32.c
> +++ b/drivers/firmware/qcom_scm-32.c
> @@ -10,6 +10,7 @@
>  #include <linux/errno.h>
>  #include <linux/err.h>
>  #include <linux/qcom_scm.h>
> +#include <linux/arm-smccc.h>
>  #include <linux/dma-mapping.h>
> =20
>  #include "qcom_scm.h"
> @@ -124,25 +125,13 @@ static inline void *legacy_get_response_buffer(
>  static u32 __qcom_scm_call_do(u32 cmd_addr)
>  {
>         int context_id;
> -       register u32 r0 asm("r0") =3D 1;
> -       register u32 r1 asm("r1") =3D (u32)&context_id;
> -       register u32 r2 asm("r2") =3D cmd_addr;
> +       struct arm_smccc_res res;
>         do {
> -               asm volatile(
> -                       __asmeq("%0", "r0")
> -                       __asmeq("%1", "r0")
> -                       __asmeq("%2", "r1")
> -                       __asmeq("%3", "r2")
> -#ifdef REQUIRES_SEC
> -                       ".arch_extension sec\n"
> -#endif
> -                       "smc    #0      @ switch to secure world\n"
> -                       : "=3Dr" (r0)
> -                       : "r" (r0), "r" (r1), "r" (r2)
> -                       : "r3", "r12");

I assume that the clobber list is not a problem? i.e. r12 is going to
get clobbered and that's not a problem.

> -       } while (r0 =3D=3D QCOM_SCM_INTERRUPTED);
> -
> -       return r0;
> +               arm_smccc_smc(1, (unsigned long)&context_id, cmd_addr,
> +                             0, 0, 0, 0, 0, &res);
