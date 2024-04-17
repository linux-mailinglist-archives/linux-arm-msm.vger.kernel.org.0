Return-Path: <linux-arm-msm+bounces-17735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6912D8A8B04
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 20:25:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23310286A25
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 18:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D1F2172BC3;
	Wed, 17 Apr 2024 18:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cQFpYVCe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827447D410
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 18:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713378353; cv=none; b=DJbP3Y+YJACgHAGW2U5c0on0Z1b6bccuJbQRZQSNOZXy+AwLZH8SP4Gals6ijOtZ9hMDjqAUXQtKbkyJvfa5557+31NFHj4QrNHu82TB7aKpR7dE7qi+bSizh3K7A0kvqQKy4ZQ28uxqfWsbtoDSSdc+GiJVdXoHI5obaqbmRxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713378353; c=relaxed/simple;
	bh=iiQLaL7b913aQ4z6/ivZCDreLLoJ4wNRNa/JjNa+94k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XqBOuhWV4xTuxZOG58c7Iq7R361EGOr1ILXfpAk6ISQzg4dsQMqjIO3LAasGYx1MpoS5LUOlytpFPYZtsiQyrNMY64gRss9VJkJO5wn3JpSuc5cbbsbEO44k0mieBGivXn2tsS+IfgvVZZa4dY3qugR8VLtB7F6WJKayZUTX0To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cQFpYVCe; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dbed179f0faso794930276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 11:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713378352; x=1713983152; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vnxByDMxHaJ/yp+U1go7qjtuLDX7LgOj9TU8bRJJnlA=;
        b=cQFpYVCeXRL+sPY8Mmw8+b1ZozEeX7I4KAqycaXISDDqg5SaIbZ59gKff1ZI/sZKH9
         ZSops/xfbGv7Q73105GtczYO/PsCUiYkV3fsSF/CFzdAG1UygQlqMWqOJt2GN2mCQmnA
         JivlH5ZjaLyEZ1huaL8CKv1/MHUHT6cLAA6YZFLsKpYTjkFE69KGNFUVSKn0bjGwtiYe
         k10AdgROrDnrWslkcS8JFBpOHd5PT4fDUzT22ILj0lnc6clJstDFK2AoK5gJwk3czGaD
         3c/0OX2cX8iqLfLtAR9CQY0Rirx6M173ulEWM7+26MCMzZ9+JHkNIOdLjxUojfvLMe9l
         mYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713378352; x=1713983152;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vnxByDMxHaJ/yp+U1go7qjtuLDX7LgOj9TU8bRJJnlA=;
        b=d05FWC4alZ1OWDpjyZKujVC0eEWLOwRR1OBr0egux0ExUTwEju4PtoPlTmceoGARQd
         VOOej9WGmwborss55lYOR17aUsk1C+2oegKdFY/yVIKmTps4rKYLth3Vq9DyvSfvvCf/
         54reEuSijicu3a4at2KZsces4SbD31vV6dTDkvJIMH2Rf4T88pJkPxq0CCJr6j+JefWo
         o55dsFsm8rkH4yTpTNhEq3awkNwtyAbYINLXV8Jnr4CmapDqkKn/4QGyrWRhW4raTEJq
         8Ia2zacVdTPF/k3v6aWASnD+5B/z20NEO/ZRkQpxPmmTzFPAlKK6p3nrF81/O31AKPXL
         8xkg==
X-Forwarded-Encrypted: i=1; AJvYcCVvi02CxbLy1iggNnKD9Iy0aUgPsowy3cNRHVO6uTwYaBaImWsW4a4Rda14gYruWhLa9+IXwTo/vQUaZyGE8/ooxiTC23HoU+C0uzCW4w==
X-Gm-Message-State: AOJu0YzhCcUi911W2X8f+xU6R1to4BKQBIxZcpiQEXEws87m8UI43Dp9
	5KbM+se3UXdz+XiOAkCvzF/LdUDh7SDAx61huPHl2/Pf0qsmUz98tfsIolbuaHQjc/M2LUToiiC
	/EA/R5pIktyIlc3Fjv1ExfGKDgn3F8G0P1DkU3w==
X-Google-Smtp-Source: AGHT+IG5X85eRnbEWZuj/J/DWMBMjP9X7Ftox8ChGo4OUxp+VDFrWQS+EVuzjA7/OcnTXygpMOOtNH8E2Fim/3e4ftE=
X-Received: by 2002:a25:800e:0:b0:dcc:6894:4ac0 with SMTP id
 m14-20020a25800e000000b00dcc68944ac0mr234809ybk.20.1713378351697; Wed, 17 Apr
 2024 11:25:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240417120928.32344-1-quic_kbajaj@quicinc.com> <20240417120928.32344-2-quic_kbajaj@quicinc.com>
In-Reply-To: <20240417120928.32344-2-quic_kbajaj@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Apr 2024 21:25:40 +0300
Message-ID: <CAA8EJpqWW9PH8jHRm0PmmjAXEq6VDn3_0GwDCUQJHg2y4djDbg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: qcm6490-idp: Enable various remoteprocs
To: Komal Bajaj <quic_kbajaj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <quic_bjorande@quicinc.com>, quic_tsoni@quicinc.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Apr 2024 at 15:11, Komal Bajaj <quic_kbajaj@quicinc.com> wrote:
>
> Enable the ADSP, CDSP, MPSS and WPSS that are found on the SoC.
>
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> index f8f8a43f638d..01ea64b16969 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> @@ -580,6 +580,26 @@ &qupv3_id_0 {
>         status = "okay";
>  };
>
> +&remoteproc_adsp {
> +       firmware-name = "qcom/qcm6490/adsp.mbn";

Is there a difference between qcm6490 and qcs6490 firmware files? If
there is none, can we use the existing paths?

I assume that modem is the only difference there. In such a case,
please use "modem_nm.mbn" for the not-modem mpss and plain "modem.mbn"
for the standard one.

> +       status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +       firmware-name = "qcom/qcm6490/cdsp.mbn";
> +       status = "okay";
> +};
> +
> +&remoteproc_mpss {
> +       firmware-name = "qcom/qcm6490/modem.mbn";
> +       status = "okay";
> +};
> +
> +&remoteproc_wpss {
> +       firmware-name = "qcom/qcm6490/wpss.mbn";
> +       status = "okay";
> +};
> +
>  &sdhc_1 {
>         non-removable;
>         no-sd;
> --
> 2.42.0
>
>


-- 
With best wishes
Dmitry

