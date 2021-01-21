Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 341542FED32
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 15:45:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729195AbhAUOn6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jan 2021 09:43:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731686AbhAUOn0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jan 2021 09:43:26 -0500
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC8EAC0613D6
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 06:42:39 -0800 (PST)
Received: by mail-ua1-x92d.google.com with SMTP id 43so719263uag.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 06:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BvC/wUBpDtVC8NW/Nj6pwtaxWOyv/SI0O5/Rri37VqQ=;
        b=OKd9r/nzEr0AuQ6vKzc2QjU3BAo9z6oRKyzxyVDU6oi+Wc7I2X0g8IviviUY+5zm0t
         5McqOG5POvnEKazbg9ZEWSw1NNTbqDIzIjLOjiGt09AxU6nzi/tDv84fkgwLsQQb9FFU
         IdHw4CRyIQqztjN+a0ML5O2gEwddjItOYlyq/jh4vXlU+dM3sZH+mxbhMOKzGNgFEdv8
         zY8fv1yymEPmdGULk2Jrt+ggwfRdvDjBadqc7jMCNab0kvKxf78wIRYsoS7b4kl44Qr2
         60Deszm7RbPrVf90sQZejwVCJG1Mgqke8uAmbQTdPl/re+cGkRIgoUKmevUmIKPkkt3U
         DcwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BvC/wUBpDtVC8NW/Nj6pwtaxWOyv/SI0O5/Rri37VqQ=;
        b=PWOFIrguWdW0FLGENRe7jABkI0M++sE+oVJRN4XhK9uQnKzK1J3HZsYOSjXMawkKtD
         MiAX9MXsBYaXlAyps8n2MgPJ4cia9Fuo9Hnf9oEaw/zu/9G5MorZdMeH1h1DrAyrDdzZ
         1jnK/JMJ/fAb4fvPBYss6GdnPoxdxegn3eXeC0mFOjEMfoeQ+jkgxhlk0YEe6hdnFnK5
         hk0EQHyXlK7x5yeDizoAJa/TenFm2pcIHimQ3rkDVx/ol/BpzbF9oV5mIGY/S2dKKT4X
         wxyuvLfw7qXJ+FdKB5BqoIyCXpLlWpisub/rvRp+y2/hR4svj8SKlKgx+KjhsmrtcnmS
         OTRQ==
X-Gm-Message-State: AOAM5314LzsbdDmpMnIdb9zLtUtv949MySqwdXUQqU7zkSGIlJ/SS5+C
        8ohxSQ2HSOFCxrNAhcEQim3vgWkFDqN/f5kjjI4y7w==
X-Google-Smtp-Source: ABdhPJweGqkbp2xqCql+HOOHoYuTVRyXbSlZWTm4qFmvWdoVmrS3QI8Z9RpNC+jjkdEC/LhoMCw/M8Q666wtUx4xi/U=
X-Received: by 2002:ab0:1c10:: with SMTP id a16mr53832uaj.100.1611240159022;
 Thu, 21 Jan 2021 06:42:39 -0800 (PST)
MIME-Version: 1.0
References: <20210121090140.326380-1-ebiggers@kernel.org> <20210121090140.326380-7-ebiggers@kernel.org>
In-Reply-To: <20210121090140.326380-7-ebiggers@kernel.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 21 Jan 2021 15:42:02 +0100
Message-ID: <CAPDyKFoOL2Dsqb=nKw5hF5hiVLn-TDHWH4Th9icvoLY4aJtpSA@mail.gmail.com>
Subject: Re: [PATCH v5 6/9] firmware: qcom_scm: update comment for ICE-related functions
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Eric Biggers <ebiggers@kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Satya Tangirala <satyat@google.com>,
        Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

- trimmed cc-list

On Thu, 21 Jan 2021 at 10:03, Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> The SCM calls QCOM_SCM_ES_INVALIDATE_ICE_KEY and
> QCOM_SCM_ES_CONFIG_SET_ICE_KEY are also needed for eMMC inline
> encryption support, not just for UFS.  Update the comments accordingly.
>
> Reviewed-by: Satya Tangirala <satyat@google.com>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Bj=C3=B6rn, may I have your ack on this one? I intend to queue this via my =
mmc tree.

Kind regards
Uffe

> ---
>  drivers/firmware/qcom_scm.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index 7be48c1bec96d..f57779fc7ee93 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -965,8 +965,11 @@ EXPORT_SYMBOL(qcom_scm_ice_available);
>   * qcom_scm_ice_invalidate_key() - Invalidate an inline encryption key
>   * @index: the keyslot to invalidate
>   *
> - * The UFSHCI standard defines a standard way to do this, but it doesn't=
 work on
> - * these SoCs; only this SCM call does.
> + * The UFSHCI and eMMC standards define a standard way to do this, but i=
t
> + * doesn't work on these SoCs; only this SCM call does.
> + *
> + * It is assumed that the SoC has only one ICE instance being used, as t=
his SCM
> + * call doesn't specify which ICE instance the keyslot belongs to.
>   *
>   * Return: 0 on success; -errno on failure.
>   */
> @@ -995,10 +998,13 @@ EXPORT_SYMBOL(qcom_scm_ice_invalidate_key);
>   *                 units, e.g. 1 =3D 512 bytes, 8 =3D 4096 bytes, etc.
>   *
>   * Program a key into a keyslot of Qualcomm ICE (Inline Crypto Engine), =
where it
> - * can then be used to encrypt/decrypt UFS I/O requests inline.
> + * can then be used to encrypt/decrypt UFS or eMMC I/O requests inline.
> + *
> + * The UFSHCI and eMMC standards define a standard way to do this, but i=
t
> + * doesn't work on these SoCs; only this SCM call does.
>   *
> - * The UFSHCI standard defines a standard way to do this, but it doesn't=
 work on
> - * these SoCs; only this SCM call does.
> + * It is assumed that the SoC has only one ICE instance being used, as t=
his SCM
> + * call doesn't specify which ICE instance the keyslot belongs to.
>   *
>   * Return: 0 on success; -errno on failure.
>   */
> --
> 2.30.0
>
