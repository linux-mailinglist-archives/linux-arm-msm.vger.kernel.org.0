Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9BD83471A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 07:33:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbhCXGcv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 02:32:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbhCXGcl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 02:32:41 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B446DC061763
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Mar 2021 23:32:40 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id w8so11207624pjf.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Mar 2021 23:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=L7in4zMNdZBc1GxLcnECgmkXR6YAII8UXVAv+IYWr9s=;
        b=nAUos0/1sE5Lk8+Ki56nM1Qm5MHroKWX0tekqp9IenEnrLL1pUDMRtqPL05UGkOQhT
         BviFz134utRDij4/zmq+KBoveP+J5Azz3OaNBrHQeesm3MUdgq1jF0Ea2uDxdSdOhmAX
         /Yp3JAp29Xm6tXZFHj6Xucofys2cEVkzKToPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=L7in4zMNdZBc1GxLcnECgmkXR6YAII8UXVAv+IYWr9s=;
        b=Jv/UzyDqoUEkNiXD2D6sU4CCg66iyuq8TTVDEl3ibWRKJQ8BWzlbzhsFvTFEsGfZtg
         2OqluRs56O1WrDMoN9G3E4jws0gJkhEc9XSMj0VZ/HV1OiB6vW+fvauQ5ws3YBSkMdd8
         TyQPEUc3oYEcogACtw5GMxi0nsi/faEy/0I8mQozuJDCqJ4JaT1nQSkYJpYlDHhog0Mv
         eW8YvdPE029nXF8LkNYeqmfixGkd/7mK9KfaYa4reBx0rWOl9FtmSKIdwEmDtC2cNiuR
         xxerOVGI757v4a0aroW/hqC3YsE//mIKsvOwKKXwYnskz4xFiel2OwNhikPhjyJNkQV3
         fhtw==
X-Gm-Message-State: AOAM530aUSuSF13ssu8bNHbaeavB3rT1qPJkKjP52HJ4H4N25mjCK8RE
        QJp4PPWu33vK6+o208GjDaPJlA==
X-Google-Smtp-Source: ABdhPJzt701pViCL3Ey/mou0tQDFBpd/u1Pc+j5WrvFpZLxETd1pmRXxQtG7il+tiahqieaQ6NzBGA==
X-Received: by 2002:a17:90a:5b11:: with SMTP id o17mr1992274pji.32.1616567560296;
        Tue, 23 Mar 2021 23:32:40 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:84ac:62f7:16a8:ccc7])
        by smtp.gmail.com with ESMTPSA id w79sm1210900pfc.87.2021.03.23.23.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 23:32:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1616564457-25221-1-git-send-email-dikshita@codeaurora.org>
References: <1616564457-25221-1-git-send-email-dikshita@codeaurora.org>
Subject: Re: [PATCH] media: venus : hfi: add venus image info into smem
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Date:   Tue, 23 Mar 2021 23:32:38 -0700
Message-ID: <161656755819.3012082.9032882357160965681@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dikshita Agarwal (2021-03-23 22:40:57)
> fill fw version info into smem to be printed as part of

s/fill/Fill/

> soc info.
>=20
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/hfi_msgs.c | 36 ++++++++++++++++++++++=
++++--
>  1 file changed, 34 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.c b/drivers/media=
/platform/qcom/venus/hfi_msgs.c
> index 06a1908..0e94921 100644
> --- a/drivers/media/platform/qcom/venus/hfi_msgs.c
> +++ b/drivers/media/platform/qcom/venus/hfi_msgs.c
> @@ -239,15 +242,44 @@ static void
>  sys_get_prop_image_version(struct device *dev,
>                            struct hfi_msg_sys_property_info_pkt *pkt)
>  {
> +       u32 i =3D 0;
> +       size_t smem_block_size =3D 0;
> +       u8 *smem_table_ptr;
> +       char version[256];
> +       const u32 version_string_size =3D 128;
> +       const u32 smem_image_index_venus =3D 14 * 128;

Can these be #defines instead of local const variables?

> +       u8 *str_image_version;
>         int req_bytes;
> =20
>         req_bytes =3D pkt->hdr.size - sizeof(*pkt);
> =20
> -       if (req_bytes < 128 || !pkt->data[1] || pkt->num_properties > 1)
> +       if (req_bytes < version_string_size || !pkt->data[1] || pkt->num_=
properties > 1)
>                 /* bad packet */
>                 return;
> =20
> -       dev_dbg(dev, VDBGL "F/W version: %s\n", (u8 *)&pkt->data[1]);

Why is pkt->data not already a u8?

> +       str_image_version =3D (u8 *)&pkt->data[1];
> +
> +       /*
> +        * The version string returned by firmware includes null
> +        * characters at the start and in between. Replace the null
> +        * characters with space, to print the version info.
> +        */
> +       for (i =3D 0; i < version_string_size; i++) {
> +               if (str_image_version[i] !=3D '\0')
> +                       version[i] =3D str_image_version[i];
> +               else
> +                       version[i] =3D ' ';
> +       }
> +
> +       version[i] =3D '\0';
> +       dev_dbg(dev, VDBGL "F/W version: %s\n", version);

Instead of replacing the string with spaces can we find the first
non-null character up to version_string_size and then stash a pointer to
that and print it out with dev_dbg()? That would save 256 bytes on the
stack for something that is presumably a string and will be NUL
terminated.

> +
> +       smem_table_ptr =3D qcom_smem_get(QCOM_SMEM_HOST_ANY,
> +                                      SMEM_IMAGE_VERSION_TABLE, &smem_bl=
ock_size);
> +       if ((smem_image_index_venus + version_string_size) <=3D smem_bloc=
k_size &&
> +           smem_table_ptr)
> +               memcpy(smem_table_ptr + smem_image_index_venus,
> +                      str_image_version, version_string_size);

It would be nice to have shorter variable names so this was an

	if (condition1 && condition2)
		memcpy();
