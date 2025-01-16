Return-Path: <linux-arm-msm+bounces-45277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA35A13C52
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 15:34:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B48E0163F1F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 14:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 095621A08BC;
	Thu, 16 Jan 2025 14:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dDYdyOsX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF27B24A7C9;
	Thu, 16 Jan 2025 14:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737038072; cv=none; b=bUMmgQoJnA8eWW0Th7ec5cWn++0pOTEDNpNRwneqpl5tuw3HUjgg2EAZJBUYeehRWYxRKp7VsHyfhcbBdT1dg3OWclHQ/Vy+OiENqC3jMimqY+usYGyA56gS6J26exSLdGhhpDDebj5NxgLhP3IG6F92WaXKbkn2IGCMqeUlDiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737038072; c=relaxed/simple;
	bh=0zDNAkgEPmTQ9ijNf/YMlGkQXo8XEzIXRvPAn+NzZ7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t/TbxKhqD1weuA5a++hIWpbzHWpnepv0Tjd4gn6UA2OD8IfNZm1GVo6KRcqM75FM0PXnbk8vo7Avskqe1haqBkTqFoUTB+zmcKwlyhWt+rgU/J0uxdyN71MnfT6dZL+QVpuQo6rFuCvPQdPfKa0bqXz4ENo4PrRQwmtgA/xSRnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dDYdyOsX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53D5DC4CEE3;
	Thu, 16 Jan 2025 14:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737038072;
	bh=0zDNAkgEPmTQ9ijNf/YMlGkQXo8XEzIXRvPAn+NzZ7Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dDYdyOsXGumufp8xsbvbFP+VUYIbby3EyCsdTTEKG0+Wrq0qYHp8D5NY6zrk0Gaym
	 GdnGKF8uOWh25sALEsU6DdVWtq23vn4xIN3hK5N/CnGpMC08qUHKMMiq40kxtniwye
	 jE9xVomMBarsrBXjrEvxXl8yIgAr+mosEZQuES8Hxeu4M6eCwnkDzn3bycxWgQjURi
	 atd2qBCNp1CNugJ7IYeu85NOBEm5xuMsfv+8Oq1JskL2P/FITbSZ496mahz+/L3HhX
	 6zLO0QKgonBC5xH9JDOswh76WvyhR2S4Y8Q7461Vd3wPtDIOrMAzXq4uqFNAKHhIvE
	 E3WrOv3gqDG9A==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5401d3ea5a1so963163e87.3;
        Thu, 16 Jan 2025 06:34:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUDQg/iomDC756r8+jFwve6OzmcZVJfO7/u9rf1q1i3BD89CTY/7KRvhiw26nutkhnZnMKGHacVj/VwDG1Y@vger.kernel.org, AJvYcCUHbxSYAR2lobBxnTdR0U+Rh288z3jnNbyLkZJwV4V7XYLbl2QjX8Aq2AZoQvH//jyLskwywBy/hKfR@vger.kernel.org, AJvYcCVxHfZWeLK1GSawVhNHrzC99YUWYCc2a/2Cd/QZMWuXi9sc9hPK4R7xft1u+qk40ZMHLaGdiULpiboRn7ELZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKPCe4uZlxCldlIOTp6uj06N69fK2u6M2tQ68opVc73eSE8wpG
	J3AArwMUrCknjXXAkRqXR/XjfulTBGqL7F1jqa2FpXVwAhK6CVvPGyZsrnwf1/sIij3xTlUthnk
	jd2lXyzexFyB+E65WwRhpFaLYRA==
X-Google-Smtp-Source: AGHT+IHzsQ2o/IbQIRRO0hOtZknL9BYsHZ3qoB+Mry/3OEDc6BJkS4IlvpFK8Nl5f5mL5RgNVG8J9jsLX2MmmcfwYwk=
X-Received: by 2002:a19:911e:0:b0:543:9ab4:2a1f with SMTP id
 2adb3069b0e04-5439ab42b45mr85582e87.40.1737038070668; Thu, 16 Jan 2025
 06:34:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241223110936.3428125-1-quic_yrangana@quicinc.com>
In-Reply-To: <20241223110936.3428125-1-quic_yrangana@quicinc.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 16 Jan 2025 08:34:18 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL0HzzGXnCD+z4GASeXNsBxrdw8-qyfHj8S+C2ucK6EPQ@mail.gmail.com>
X-Gm-Features: AbW1kvbwJdOzxJB_l8oLrw5jUdQwJWvEPj30j8vf9HC_Kz8qnaUmRNO2-qFCXTM
Message-ID: <CAL_JsqL0HzzGXnCD+z4GASeXNsBxrdw8-qyfHj8S+C2ucK6EPQ@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: qcs8300: add QCrypto nodes
To: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 23, 2024 at 5:09=E2=80=AFAM Yuvaraj Ranganathan
<quic_yrangana@quicinc.com> wrote:
>
> Add the QCE and Crypto BAM DMA nodes.
>
> Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
> ---
> Changes in v3:
>  - Wrap the lengthy lines
>  - Reduced the patch series as other patch is merged.
>  - Link to v2: https://lore.kernel.org/all/20241125111923.2218374-3-quic_=
yrangana@quicinc.com/
>
> Changes in v2:
>  - Set the interconnect tag to QCOM_ICC_TAG_ALWAYS instead of passing 0(n=
o TAG).
>  - Link to v1:  https://lore.kernel.org/all/20241113055830.2918347-1-quic=
_yrangana@quicinc.com/
>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/=
qcom/qcs8300.dtsi
> index 73abf2ef9c9f..30c1de1c4ad2 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> @@ -736,6 +736,31 @@ ufs_mem_phy: phy@1d87000 {
>                         status =3D "disabled";
>                 };
>
> +               cryptobam: dma-controller@1dc4000 {
> +                       compatible =3D "qcom,bam-v1.7.4", "qcom,bam-v1.7.=
0";
> +                       reg =3D <0x0 0x01dc4000 0x0 0x28000>;
> +                       interrupts =3D <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
> +                       #dma-cells =3D <1>;
> +                       qcom,ee =3D <0>;
> +                       qcom,controlled-remotely;
> +                       num-channels =3D <20>;
> +                       qcom,num-ees =3D <4>;
> +                       iommus =3D <&apps_smmu 0x480 0x00>,
> +                                <&apps_smmu 0x481 0x00>;
> +               };
> +
> +               crypto: crypto@1dfa000 {
> +                       compatible =3D "qcom,qcs8300-qce", "qcom,qce";

This doesn't match what the schema says.

You didn't test your schema change with this. That's the *whole* point
of the schemas...

Rob

