Return-Path: <linux-arm-msm+bounces-16223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BD48968B7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 10:32:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE73A1C25D1B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 08:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E331947A53;
	Wed,  3 Apr 2024 08:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zx58i6sK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0225C909
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 08:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712133119; cv=none; b=cdb1JCCIQ9Vc2vhcOzVq3ID7t6cqvv84pol5iq7uPfiKHxhgkNBlssM2Itarxm0SkBPrFWlQcgk3d7Ht35as4Sn+VSOVPyAZoGoi5sOwR3VPml2cH6ph89235HXNds/pCARM/R7ZqFVYIDWX60Our4+n7SFnOv+9HD0F7NsnBvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712133119; c=relaxed/simple;
	bh=vmChG4RvS48/vCPeh8PPTRlNGv7OMCjK/SENk20N+WA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oBlPvboKBoZ+ucmi72K2OeFW9/CzX6w7VsJyzJh8+wc1P1cK+5iF09S03N8aZuJ9353l4dGkri1sh02ujtPI9unEWHzQmxZ3KyPTeUX7IY0LUix8/d0616aDJem4jUpMx94F5mHiIbezBPLE1Uf+abHW2OKTrNzz0A4R9oN5GMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zx58i6sK; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6154a3df493so5398127b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Apr 2024 01:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712133117; x=1712737917; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WbhmnXPIzCrrvRBigyA0rMaFB8Z2vGCr7i8pWlrM2Yc=;
        b=zx58i6sKToEcOZ43pghDKLV84Py21o0kots8ZLsZawV8+aZAQ8smWhUlNCP359ZRFJ
         Ch2P8/xkDtT1E9jPNFAzJP8ijRj0hVV5/L5ogVCIUY4WvsZwULCish18LB9AGDs9rqGr
         Yb3ncCiuWk4wA8dSnj27fNs0KEwdkkqQa2H8GSlxFFnfCF4bg3d7BQnOJxyPuUkYosNs
         vHepUeyYwk9cyhwoIC+A1P/k2z5C+6TkOYG049ZjgAYDhCSMm8t8NYCOr4j3yh1Jchms
         FzPN5djKjMd2CqF+9AONPDS2bopgkVZ2ICYcIaeJm3BVu2eemsCSWAk6uwJ6tVkVgake
         Hc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712133117; x=1712737917;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WbhmnXPIzCrrvRBigyA0rMaFB8Z2vGCr7i8pWlrM2Yc=;
        b=ht/1MfqN5oG2SGso4CaTDT9Mp0jDKqCrM7YLYRMwfle8b0vuWDmgV1pjPua6yGZIth
         ygX5DlsZCHcaaAGC4FvNse+DwJdeajvPjIv6ct8WVA3Hav6ELyBF/VQuFHMW+WS+9WOW
         r+binisfF3UeoqmbK3hgI6zX5gbOBTWaW78LZ9gHywzRflt3PibrotsbV1Dpy/jYsNPg
         oF99F09bhMJ9l9Rudxgbf603O1U/K5UMbFU8t3av35PP/Ems0TA4A0YTCudpgZmDP/TN
         o3PDhJ7rMkzj0Ti9u0DIsJYPUyN+1O+8YOhml0FcH6G57pkfgQb6XDmWX2y/zXFQvoND
         9/xA==
X-Forwarded-Encrypted: i=1; AJvYcCW/uxsgjlXl4knoyuwsl3Ry7+b3KZzO+4Z7M9JwB9xGYHEXJVs3Nm69a3u3JiidwGX1qiKoNtXI9RYvpSJN/fejN5iO3oKQvX2+s9xE7g==
X-Gm-Message-State: AOJu0Yy/QCW/dseRd19eu77gRrtcwvFprOLI4R5Joef46p+vjJHfyX2l
	4IdcBAkiz3Aw7y7Hy1JB7botemLwWf5F6Z4E+yw/LbvvRw7uSu6nkygntbisswI0jgy4J/Ri27e
	q2i4VAu1DC5fD2woVUQnVgVBOI+uoqfBWR/Pupw==
X-Google-Smtp-Source: AGHT+IHr4jTRWEoNuM2h6y3D9jzRmSc1uZFtbFjviKvgAFWZderr88u5kxnVqxNds6WlZSXlbdPDRGzk85vcKjoUqDE=
X-Received: by 2002:a25:9102:0:b0:dcf:bf81:5f28 with SMTP id
 v2-20020a259102000000b00dcfbf815f28mr1242801ybl.0.1712133117093; Wed, 03 Apr
 2024 01:31:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240402-rb3gen2-gpu-v1-1-a51bb6080968@quicinc.com>
In-Reply-To: <20240402-rb3gen2-gpu-v1-1-a51bb6080968@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Apr 2024 11:31:46 +0300
Message-ID: <CAA8EJprHq6vwVx3YvafG3QBRe4H3o5BqjmsxJrLnp2X+tfBEJA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Specify zap region for gpu
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Caleb Connolly <caleb.connolly@linaro.org>, Komal Bajaj <quic_kbajaj@quicinc.com>, 
	Naina Mehta <quic_nainmeht@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Apr 2024 at 06:33, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> Without the zap region defined the enabled GPU will, if able to find the
> other firmware files, attempt to initialize itself without the zap
> firmware loading, which causes the rb3gen2 to freeze or crash.
>
> Add the zap-shader node and define the memory-region and firmware path
> to avoid this problem.
>
> Fixes: 04cf333afc75 ("arm64: dts: qcom: Add base qcs6490-rb3gen2 board dts")
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 63ebe0774f1d..5b81b5e0b4ce 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -471,6 +471,13 @@ &gcc {
>                            <GCC_WPSS_RSCP_CLK>;
>  };
>
> +&gpu {

Hmm, Is the GPU enabled by default? It should probably be fixed. I
think we usually do not enable the GPU by default on SoC.dtsi.

But now I understand, why it is marked with Fixes:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> +       zap-shader {
> +               memory-region = <&gpu_microcode_mem>;
> +               firmware-name = "qcom/qcs6490/a660_zap.mbn";
> +       };
> +};
> +
>  &qupv3_id_0 {
>         status = "okay";
>  };
>
> ---
> base-commit: 727900b675b749c40ba1f6669c7ae5eb7eb8e837
> change-id: 20240326-rb3gen2-gpu-4343c5dc7e40
>
> Best regards,
> --
> Bjorn Andersson <quic_bjorande@quicinc.com>
>
>


-- 
With best wishes
Dmitry

