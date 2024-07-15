Return-Path: <linux-arm-msm+bounces-26184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7BB931611
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 15:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 748F91F2264D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 13:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5001C18C35A;
	Mon, 15 Jul 2024 13:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UycriWBr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2DA1836D4
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 13:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721051291; cv=none; b=i5QOJRnuW0f8dOkNMHheAvxP8lzf0VJ+OdLMKCMbqTFJwk8Tk5H1m55CV/+MMDAOZEHTKHY6Hoh3a2EU79ljcaXH8j8EM0yYnKG/OgxtAyJRzSS9MY8XVNkdGLW4BBFU5iroYBfHlsbFAkMgXSVWEPp9eBPk4WTkuq6m8kRA3H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721051291; c=relaxed/simple;
	bh=pqxMzZ9ylaa/c/L2lBUhRSnbTqXYR2aT7mkDhR4L1uM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TjQ09JH/3bNWVIMzOUrJxv4YjU5X/98fY87SRXcm1nfgM1FGZU4D4jOuylV/+4H9rzL/mYKcUP/bOU/mmbhRAjDcPP+t1y256Wuv1xQWxRCpcnu7Uqcs1CLPQCCKObebCEaHHydFANy5elHOm3GrgAsyIzHdaE7n8wDeMn546hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UycriWBr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7569C4AF0A
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 13:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721051290;
	bh=pqxMzZ9ylaa/c/L2lBUhRSnbTqXYR2aT7mkDhR4L1uM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=UycriWBrQssHXa6D9Ur7ZvTI+D6pl0eZYJGzE4ZGi61+YlzEqMGiV2j9ZRHlmGpu6
	 ritFkGamTddnJZ+8z55U1VqQwreB5kKtDYg/FwNKbdycW+Sl7aaF2oKhisBR5dQX89
	 8P5X8ABBQcqSuR5u0QbRpbE0XzOduwxIvClzR/KVlyB8Dc0iH7+d9AOvJyi3+X9+X9
	 QRXr7xlRSWxBEXFY0ljKbQsJjEs+dQwxbP/vaeUeM6XqYIJvS3QNKInmCCE5gZq1f5
	 3TGVJ0yKXIKrGS548Qw4ZRlbNx4vsHuoHNCnJW1748gZYebN3jLBH3d3tJaivZng+l
	 KJBo6yYNxo+DQ==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-65f8626780aso20232877b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 06:48:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWKww0QTTQpasjq4T5arGKkTQ/2uvxqz7EZHeJAqZYpY8Bkigu6X1H9zQoTyqXYG60dDNmxjrNntGh3oSNeXKiUaGwtmoq5xPXrucU/jA==
X-Gm-Message-State: AOJu0YzwDnfkgqAn3zYSMUOgCOYxHAvR+uK9JFOhdk93Qjq+MI2QYMQ3
	3OORjpHYiXLnFbBppxhdPYu5rHv4tMgxtKtkzWvHFEZU8rGopV7scxf7ECcp0p49XLaWtZaf5cS
	9Y9G0Gv3FgRCbuE5PyhjyorpUA7c=
X-Google-Smtp-Source: AGHT+IFCrmysz+nWKnHRmtzHQcWIvgOCy2tA9d6yEGmAMYsEEM5MRD8v8yfgsMQl+jqO/XDMQOq7c6m0lJb12D/9eEU=
X-Received: by 2002:a81:c304:0:b0:65f:8a8e:1064 with SMTP id
 00721157ae682-65f8a8e1267mr69685097b3.47.1721051289784; Mon, 15 Jul 2024
 06:48:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240715122500.3115456-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20240715122500.3115456-1-dmitry.baryshkov@linaro.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 15 Jul 2024 09:47:58 -0400
X-Gmail-Original-Message-ID: <CA+5PVA50rRtwzCqDD4c4RBeyp+cLorptG7Ff6dTJMyeURAWqZw@mail.gmail.com>
Message-ID: <CA+5PVA50rRtwzCqDD4c4RBeyp+cLorptG7Ff6dTJMyeURAWqZw@mail.gmail.com>
Subject: Re: [PATCH] qcom: move signed x1e80100 signed firmware to the SoC subdir
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-firmware@kernel.org, Akhil P Oommen <quic_akhilpo@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2024 at 8:25=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The ZAP shader is signed and is specific for the particular SoC. As such
> it should be put the corresponding subdir rather than the topdir.
>
> Move it to the subdir (like all other zap.mbn files).
>
> Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/251

josh

> ---
>  WHENCE                               |   2 +-
>  qcom/{ =3D> x1e80100}/gen70500_zap.mbn | Bin
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename qcom/{ =3D> x1e80100}/gen70500_zap.mbn (100%)
>
> diff --git a/WHENCE b/WHENCE
> index e4e06b966e89..b6451372a6ef 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -5992,7 +5992,7 @@ File: qcom/leia_pm4_470.fw
>  File: qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn
>  File: qcom/gen70500_gmu.bin
>  File: qcom/gen70500_sqe.fw
> -File: qcom/gen70500_zap.mbn
> +File: qcom/x1e80100/gen70500_zap.mbn
>
>  Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for detai=
ls
>
> diff --git a/qcom/gen70500_zap.mbn b/qcom/x1e80100/gen70500_zap.mbn
> similarity index 100%
> rename from qcom/gen70500_zap.mbn
> rename to qcom/x1e80100/gen70500_zap.mbn
> --
> 2.43.0
>

