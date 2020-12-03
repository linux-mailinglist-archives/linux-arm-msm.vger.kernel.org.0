Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55D952CD047
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Dec 2020 08:20:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387944AbgLCHTO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 02:19:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387551AbgLCHTO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 02:19:14 -0500
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B912C061A52
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Dec 2020 23:18:28 -0800 (PST)
Received: by mail-pj1-x1041.google.com with SMTP id o7so615273pjj.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Dec 2020 23:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=XboQBpa5SksH1iZ7g9IuRzqF6Oz1AM+DEQhjumRKkpU=;
        b=gJeZZTf1TU9E/PphFzlCR3PhtxCTKrw85fe2boTXN2UfZUD5faSjo2MsqUodQrLjH5
         zauS9CHw8F/p/nJKZEvy0o1GIbK1HBYkurUupjJCdn9Cdpw+zahjLVz7bvpPpXQVGqCq
         +2KSkItg1JS0p2JCKMMdOrtIGd689aHsdj0H4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=XboQBpa5SksH1iZ7g9IuRzqF6Oz1AM+DEQhjumRKkpU=;
        b=FhOllbzdN71u+5UqFSFuPPmqNfm77FJAUtzzjaqp2E4QV1WVaer72R+NLWobaGl72K
         y6UcVQepAAXhBcwk9gQDeaHg7X8so9giZqSbEW9RfpgO5KR34jHm+HE1fnZylRb8Gtlc
         uxOVirfakaj8yttdwlx8ArKo4Vo+6jAoDVeKEEOgNYkCmWnQIjly7nF6BZVDDnmAUNsF
         KRrJ62HnfWVyo9JZdbiNmgeFhtSbB5Bt8+PCt5NSq+3+/mtb1/NvKW/Yvpz1cG/QLnsU
         FC+MaiyATAgGaTZq5KJSMjZbFU2gRihENPhRyvhgLRbof35MVDLGQ+pQM0VPJqOpckgP
         dOxg==
X-Gm-Message-State: AOAM533tQEs4cq6nGsKiZ9FNbYtTgTnfaM+nbN8MBqrRe+4CuWJRArF7
        l19cLc7/2x+rUCrVSN6pFX6SBQ==
X-Google-Smtp-Source: ABdhPJxkH2B4+N1724zMBChAGI+PsJEn6+Y/h5Paxsz4QrRHNnHMdmdONnH14euFPegHQKQ7TqzpZA==
X-Received: by 2002:a17:90b:204d:: with SMTP id ji13mr1917017pjb.20.1606979907857;
        Wed, 02 Dec 2020 23:18:27 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id y21sm745604pfr.90.2020.12.02.23.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 23:18:27 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1606714572-1113-1-git-send-email-dikshita@codeaurora.org>
References: <1606714572-1113-1-git-send-email-dikshita@codeaurora.org>
Subject: Re: [PATCH] venus: core: add support to dump FW region
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Date:   Wed, 02 Dec 2020 23:18:25 -0800
Message-ID: <160697990547.2717324.13284456705336253152@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dikshita Agarwal (2020-11-29 21:36:12)
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/pla=
tform/qcom/venus/core.c
> index 6103aaf..01a0cfe 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -22,6 +24,48 @@
>  #include "firmware.h"
>  #include "pm_helpers.h"
> =20
> +static int subsystem_dump(struct venus_core *core)
> +{
> +       struct device_node *node;
> +       struct device *dev;
> +       struct resource r;
> +       void *mem_va;
> +       size_t mem_size;
> +       void *data;
> +       int ret;
> +
> +       dev =3D core->dev;
> +       node =3D of_parse_phandle(dev->of_node, "memory-region", 0);

Any chance this could be done at probe time and saved away as some sort
of pointer?

> +       if (!node)
> +               return -EINVAL;
> +
> +       ret =3D of_address_to_resource(node, 0, &r);

of_node_put(node);

> +       if (ret)
> +               goto err_put_node;

And then just return ret;

> +
> +       mem_size =3D resource_size(&r);
> +
> +       mem_va =3D memremap(r.start, mem_size, MEMREMAP_WC);
> +       if (!mem_va) {
> +               ret =3D -ENOMEM;
> +               goto err_put_node;

And return -ENOMEM;

> +       }
> +
> +       data =3D vmalloc(mem_size);
> +       if (!data) {
> +               ret =3D -EINVAL;
> +               goto err_unmap;
> +       }
> +
> +       memcpy(data, mem_va, mem_size);
> +
> +       dev_coredumpv(dev, data, mem_size, GFP_KERNEL);
> +err_unmap:
> +       memunmap(mem_va);
> +err_put_node:
> +       of_node_put(node);
> +       return ret;
> +}
>  static void venus_event_notify(struct venus_core *core, u32 event)
>  {
>         struct venus_inst *inst;
> @@ -67,6 +111,9 @@ static void venus_sys_error_handler(struct work_struct=
 *work)
> =20
>         venus_shutdown(core);
> =20
> +       dev_warn(core->dev, "dumping FW region!\n");

Do we need this warning?

> +       subsystem_dump(core);

Maybe call it venus_do_coredump() so it isn't so generic.

> +
>         pm_runtime_put_sync(core->dev);
> =20
>         while (core->pmdomains[0] && pm_runtime_active(core->pmdomains[0]=
))
