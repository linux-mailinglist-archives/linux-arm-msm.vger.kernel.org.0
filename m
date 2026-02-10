Return-Path: <linux-arm-msm+bounces-92519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGFwF8pNi2mWTwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 16:24:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EA911C70F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 16:24:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A574D3044B8B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 15:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E535536B041;
	Tue, 10 Feb 2026 15:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D72UpHgx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84458327C1C
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 15:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770737053; cv=pass; b=POU+vYz2NwcrvlmWBhfVUWf3drLY5dL1g/W1gu5lIvt9wVRm3cY5WELoXa77G78QhTfcCDJiE3Ei/Lsc9KbzAxFliEL5w40t4pIuMyx9NocC4BTNypFodrM6/jHis0bnrUgur1a28wAn6fs8Llfoy4omI2tfV7hjjlD1BzGgUVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770737053; c=relaxed/simple;
	bh=k0gmt2SK6YJLMLSXE/TJpOL6RyovHLpu3hpDi2DSn3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eFiSNjn2wdVaq7JOhSEYkY2tu5GNhxjqdLQtXinUZyNVaIce202EjW2wptX82gQNNd7GQnuvhJrtjG6ZIG+nZWOl+GhAbQD65erN/PmOg8dQrcboO4CYRuOFhr3npj1YqOM7+4/J+rNoPL76zeSStt85U3+yPwX8FO+bEvziOD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D72UpHgx; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59e4993dff5so3619231e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 07:24:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770737051; cv=none;
        d=google.com; s=arc-20240605;
        b=AOJDrJn1yCe8V8ynwYxxqaWkN2jcnXEy14nTbkBzLzUKX3PgvQoHlRHhJHymTUcvZ3
         ZhCb41ZKnIbUwErS8Q4Nc/Fgvoq55/u6opYDyIhNa/qS0RGhBx/S0Gtwmkzm4itmdrWj
         m1H563PLECuNuss2Ur+JR7ClBLuQCnP1pJLd7gDZlJx6rNFwqL7Nr3mP2rLAi+bU/I6i
         ktslDMnUMq5LZ8IdZ3J8VLYVu9dwwWWSpTuOGfUwn5MyAX6YC9UQEejLDvIVs6a3UMoO
         /FLIkC7qQHwgE7zilstsEwi24c0P6I69UtgB73jOvurltXtNVARLPE4YGhEOwCZpbFu9
         Z35Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GxQFlDkHrupA4LseelclaxK8eMfOdVdlkWQK4k7mZ+0=;
        fh=4b6s1kK9pGRjfXLfQMCRayioLzq7joxMFdHjTpfhk08=;
        b=UxnWXygDsCO0ITyrliFC5Ga68TrmqgSV1O4RrO1eSxEauhgZIiU5MZnRdfKjhEfMvn
         Zi5qdEXZzlMy6s/5ukJgScGvPkQ88ynIA0Pi6ovSdzh1W/unCeT+kFrkAM6LniqyQ8mB
         mS29bWuy0Ev2dEyqgyGoWwt2OoJASSCSLb0isDHOioR9ta4Bd4Yq/9q/vXUZo788S/Q/
         d4K4K7ODQ7kkQy2IEov+l+zvvwHXBhPyQs5luj8QYHl6E02S08sh8fedK2C7/BJBonzF
         WyIIYqHYiQORotmViVsffFbiLaHICe5RbKkHzKqcRV7fwa34Yrovhf6GJfW85hbbqQFD
         Vh8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770737051; x=1771341851; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GxQFlDkHrupA4LseelclaxK8eMfOdVdlkWQK4k7mZ+0=;
        b=D72UpHgxhDUkjrXSG0pnzdiDMJKPqQXlXpA9RzIdiiltVSj8RkQvuY4wBIa2SbfZym
         +kSztaMsXMC3M7wmBJtuE6Cfj7N7bd8KUyoM3xoaB77afcJGcjLjweWGdF+mpOccHVYw
         Q7WHJumbRqt+N/Rs1ejDbYGatWJ4dM0iDkxOwdc+DNmuDiwsSlRYX5vOvnaCmKCJaeO/
         dVaeikN7Sa/l7JhiQgSB1iSisN+oo5x8feMgOr04iyHxfJIlt8X/kAciqNgcPEVlMOtu
         IdyVo1zUuBxX8rLLPPOhZA9DT+yOxm3nDXzOZQPCQg54xRptxKlNWo0/rpzWCuigt/th
         hpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770737051; x=1771341851;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxQFlDkHrupA4LseelclaxK8eMfOdVdlkWQK4k7mZ+0=;
        b=YNsHGvDhSIQxL/H55ir1NJXWG2v3SlrxBGFK4LFsjF0k/g0Ntg4+9NloKQjsk1WUwz
         UeFLa18ACn/1e0+NWdeRYWCkKoPwxU3DMeTTXihXU4KsnOzP2q632OqkVUGLSVHeB1Cx
         VG6gK3hAElxXt7BXQzOb2yuty9NMkiJzn7I2l2k/6BG4kpbNGCAOLentm+nAI/xJgk41
         pAnEbu6HY/gUBY07fj+b3l0MAs9J6VXQhTONJwnuML1Hev7rOQa9vyccw0TAQvjcg4+2
         7sHnRhEaVe+KmDjV1k9ghSpiEwgsaO3mP+hJEjHreyx2aJVRLnMtxK9fG/blWv2m+xUp
         vSaA==
X-Forwarded-Encrypted: i=1; AJvYcCVCyPE9hyfOmhD1oxlUy9K6YtJY4u3WHyJTjexd9nDL3sk0DxechOKzip3lGB2FD4XRtGKs2a7k+4Sj6tB3@vger.kernel.org
X-Gm-Message-State: AOJu0YzGbGnWfChsOisCg6rvMSuFhKcctRSTogRc1knSjgiIm8Hxj+4Y
	aOkT1eVBbzQaTpMzJot5GxUlZ/vUHj9xdLhtJZM13bg46DlX1MYYKnMdvDbleThELD6oMLELYmk
	160iYnY8LyAfCO/G6c5rhiZRrU64GNAMNs3DXuwQAZA==
X-Gm-Gg: AZuq6aKkSsz4q7Pnof5yr3TruZnzrzgpP8j7ZFQqjKql49JdOr3NG9IomvfCFZXcaae
	fsFOc5jXR0+ARbGpaqVnziMsP/xq5ABrT9Bmb6kSsH4vZXblWEDqM/8oSqh7NjPGi3WKJ3s2h2y
	1URu0hkhb96XAICZtTyMCQ3LE3/hdntUlMYr/CUFk+gyoUxsjjO4koGaA4yy5avuclNOQw4ncLg
	qve0gTSQVt8H6dDST4eg24PGg0d17zB+6UkHJkiNLYXSxLdDobf19PhDCH617RSBk/7dcvYSvxw
	4BKVwLWyxU2wWTmHGcalJISxQfdgwkbLn4IeCqrj
X-Received: by 2002:a05:6512:ad5:b0:59e:45ae:7034 with SMTP id
 2adb3069b0e04-59e55bdc59fmr883838e87.36.1770737050449; Tue, 10 Feb 2026
 07:24:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260210-qcom-ice-fix-v2-0-9c1ab5d6502c@oss.qualcomm.com> <20260210-qcom-ice-fix-v2-3-9c1ab5d6502c@oss.qualcomm.com>
In-Reply-To: <20260210-qcom-ice-fix-v2-3-9c1ab5d6502c@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 10 Feb 2026 16:23:32 +0100
X-Gm-Features: AZwV_QjnOROVr9Ygs9hCFhr8L9ZPMcLim0_8y8vdfEht-oO3Vkh2tAqIyIExc0o
Message-ID: <CAPDyKFoYAqkLxJTN8BWGWkcjaD7fs+XkfqWhgnTbhekUnXUw9A@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] mmc: sdhci-msm: Remove NULL check from devm_of_qcom_ice_get()
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-scsi@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-arm-msm@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,mail.gmail.com:mid];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92519-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Queue-Id: B3EA911C70F
X-Rspamd-Action: no action

On Tue, 10 Feb 2026 at 07:56, Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> wrote:
>
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> Now since the devm_of_qcom_ice_get() API never returns NULL, remove the
> NULL check and also simplify the error handling.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Please take this through the qcom-soc tree.

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

> ---
>  drivers/mmc/host/sdhci-msm.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 3b85233131b3..8d862079cf17 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -1906,14 +1906,14 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>                 return 0;
>
>         ice = devm_of_qcom_ice_get(dev);
> -       if (ice == ERR_PTR(-EOPNOTSUPP)) {
> +       if (IS_ERR(ice)) {
> +               if (ice != ERR_PTR(-EOPNOTSUPP))
> +                       return PTR_ERR(ice);
> +
>                 dev_warn(dev, "Disabling inline encryption support\n");
> -               ice = NULL;
> +               return 0;
>         }
>
> -       if (IS_ERR_OR_NULL(ice))
> -               return PTR_ERR_OR_ZERO(ice);
> -
>         if (qcom_ice_get_supported_key_type(ice) != BLK_CRYPTO_KEY_TYPE_RAW) {
>                 dev_warn(dev, "Wrapped keys not supported. Disabling inline encryption support.\n");
>                 return 0;
>
> --
> 2.51.0
>
>

