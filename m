Return-Path: <linux-arm-msm+bounces-75010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A06EB9E066
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 10:23:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05CA63A64D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD90C26FA4B;
	Thu, 25 Sep 2025 08:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bS89TZM/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D8E28F4
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 08:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758788600; cv=none; b=PgkaG1xbX+mZG9tAN/mLgxJUWxbrjFUcf3QJzsFoz+bHLJSGvVMcxXi3GiB09rfguiNyvghMI/pukwlVVvQ3y9E0rKypA7S+//4l1VyKNz1lDRWUCsk/Tf9omvPCahvDort/YzyCR3gfu+dh9CKSM8NZm7FOLGAUAJ/BFPFVFnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758788600; c=relaxed/simple;
	bh=+i+v8nBQDmYxiOI9yfBbFobo4pYvLGhUh6yGl4OVrWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YYMBlcgtrMIGVd99ra9E44creT7FVjFWZyZOxYf5rtp/CrG+95r3CIZCzmJk0SDcjDzrJvB930n/golny0Jz9NVCXrNUSx2GghsIMyM3xq91zjceCGLDsnNncmBGk9Tf4UY46fWknYvcVzI0a03gjXvg9eP2XDKVtTUdo6GtXHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bS89TZM/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B8AAC4AF0B
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 08:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758788600;
	bh=+i+v8nBQDmYxiOI9yfBbFobo4pYvLGhUh6yGl4OVrWY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bS89TZM/rYSbBJsihrOABaC7Ws4Dymxusk/RzKQtPsLbWYPFsFJbkkJI3jiH7t3MK
	 Bo/UM4sqcFayuDivgoTPN/QwOf5CCVLU23Hpvpsm1GR5eKb4gFAcNmciRfwKlRKqKh
	 Kz3gWT8Mg8fhm1b0Hs0K4acyGg1PKuQG+q72utXuxj62CylhfFdXUhYbuwv5zQrPyI
	 zPD7uHv7DWiYX10BjjJlluVfb4wddalIe3SBFLioAFf7sywQE+1OeY1vyPJBTIVLJF
	 iMANQGs1qECMgD/nxwJ+t6dPAn8Yh7jVbgNUqPb41+8k4tTfiqc1TYfivoZXChHeaX
	 kInqNdAjFGQEQ==
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-279e2554b6fso6253255ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 01:23:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWVBr9B6NUoTmr16/LpD3AMG54ARJib9LO6VXaQG4gJQKZJaucRfXOxtLw4TLKt0JvT6HITZSf8+bLYmJ2o@vger.kernel.org
X-Gm-Message-State: AOJu0YzdDMoVNYvD8jZr6AL5ngRTLA8Ffh1Kwc2+CIYwBfXMRqNaDI+A
	Duf3a2wBPX4QKOFJvQugNjebFX8miXFuLSbEm66Q/Q0aIdmmfkZz+qfXe4SemKsFvm0swsvd6yz
	QVf9/KtoXpcFK5NGu4OfzXlLCeoshfqw=
X-Google-Smtp-Source: AGHT+IHqRi9cxDcwv+8J0r++fES1iGaPLBL7PoV33Z33j0uZ50sYjFgBKelHRg+TSQvlkBiAkVzvHoNNWXSHTJKAekc=
X-Received: by 2002:a17:902:c94c:b0:269:8d1b:40c3 with SMTP id
 d9443c01a7336-27ed4a29ceamr31919655ad.12.1758788600013; Thu, 25 Sep 2025
 01:23:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-6-24b601bbecc0@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v1-6-24b601bbecc0@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 25 Sep 2025 17:23:07 +0900
X-Gmail-Original-Message-ID: <CAJKOXPc8NYrwSLbaFZ_tRVpgkYPUYhaMde77p1VBhqm9PLsGjA@mail.gmail.com>
X-Gm-Features: AS18NWDOUgrqzLHcPEb42eVV56-kTL6L0tFBxQFD6o5ZtdLGSHVdoF-yjnHTMgc
Message-ID: <CAJKOXPc8NYrwSLbaFZ_tRVpgkYPUYhaMde77p1VBhqm9PLsGjA@mail.gmail.com>
Subject: Re: [PATCH 06/24] arm64: dts: qcom: glymur: Enable pdp0 mailbox
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Sept 2025 at 15:33, Pankaj Patil
<pankaj.patil@oss.qualcomm.com> wrote:
>
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>
> Enable pdp0 mailbox node on Glymur SoCs.
>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index 66a548400c720474cde8a8b82ee686be507a795f..ae013c64e096b7c90c0aa4cfc50f078a85518acb 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -4065,6 +4065,14 @@ watchdog@17600000 {
>                         interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
>                 };
>
> +               pdp0_mbox: mailbox@17610000 {
> +                       compatible = "qcom,glymur-cpucp-mbox", "qcom,x1e80100-cpucp-mbox";
> +                       reg = <0 0x17610000 0 0x8000>, <0 0x19980000 0 0x8000>;
> +                       interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
> +                       #mbox-cells = <1>;
> +                       qcom,rx-chans = <0x7>;
> +               };

Again one node per patch. this is really pointless, please read
submitting patches before posting.

New Soc is one logical change. One.

