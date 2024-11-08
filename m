Return-Path: <linux-arm-msm+bounces-37367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2579C27BB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 23:46:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D674AB22556
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 22:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974001C1F0E;
	Fri,  8 Nov 2024 22:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zOqq15lj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F407B233D99
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Nov 2024 22:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731106006; cv=none; b=Wz7Ls8iUJtxeyMuP+lH0FHvIkl3ZJQQCkTvFwZvSbjaJXeTFcBof8W3WlJ2QLjfGsnA7e3qWb4OX5z64bF59vLAsNcTRaWuL5j/sKJ1nS8F0aTqTMXPD3CcNBHX/c2O0SY6BnLbr/IVX5bjgPx9xFGtnuIBak/KwF2AqBYx3H9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731106006; c=relaxed/simple;
	bh=wvl9mX+vmFBiDsDTbhPdsBiRGfr24yDQVr9pWlCBKUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bZ5EPV6hvNyGNAqE0q/ojagIoN3uX+ORr9td3K0sdMYiA+C0EzB5hg0XtpMoUWZOoXZvuth1wEngPpp52hrJWIgHWhQVsPp14Eci0i8a6OjK3fUHXPGrj54eTWVWrsHTi9uls58+W+PgpoEaC5CVK7r/BVsy/nqf4c4SFQ16pt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zOqq15lj; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e38ebcc0abso29625067b3.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Nov 2024 14:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731106004; x=1731710804; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gybKJd4yozMQySGQeVUjW1u2bPYPo6uGaXdbypWFLRU=;
        b=zOqq15ljPL+OGVuMUlwb/5i3osnzQ70mfR+Ln6Q3+zruKPDxo9w9CGCp8xxw/Vrg57
         6S2ULhotW/wiamPV2kmoLPxL5otHB3xd30SFuFASViDIeOmwVRYGNarLw0kefEZbL6+W
         TQXjVkM+4UXuqe2PM3UZq46o6N8+i5xoNTejir9U+1sGFHdBdXxBemsKac+/9mdnjPmx
         EXHmuz+qzR1KlADzX+SLupWW47DiOlXvAbrkFqybFA5QoNNQIry7znEzGODbcYgNlyYn
         kBjAZIgpFL90tJ4sSPQfiXy9hcGFiVty28XDPVB9rzKHzyXkFogllKotJO8aa1xeDYZP
         sPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731106004; x=1731710804;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gybKJd4yozMQySGQeVUjW1u2bPYPo6uGaXdbypWFLRU=;
        b=Hozkm6OE8NUvFVcgE0R2oENf0bAPtblenuI8ADpK3GGzPbxpfrOryX7LszT1XxGN8S
         KMfu8HyUpWsLeKr9QUYPG2S+833K4AYDg5tpsU7VsH1ZGkTtIJgOr4Me89NblvFTYX6H
         0KNdXXIKAnShetlpde4VxxrK8e4ViDcTNofkz5rJVYI32NENJBxBcaEpYfqDQzgTJSx8
         hm48+PE5SQMs2uM6bVcTeWimhYSsamI5HsyUBU1liyk/DdNOy78TDTQv5OYFKGQMbzpO
         pb2gAVdXmZID+0nUVSVQ3THFZcKcUEpBjXNEDxAfP4PfOmzC/kq+bJKLv7+C82f8smgp
         +yTw==
X-Forwarded-Encrypted: i=1; AJvYcCX1wjONwJt5UIOgUWKzVch7IwR8ejSiVNruJP4AUbscctpb3J/KAYZ95IIyUQXQLEAsrs3PxrOoMRJoFbur@vger.kernel.org
X-Gm-Message-State: AOJu0YyAPndlmfauRYyhxW+VnSQvnOtk6nVtHpuwH8gOXLkOxabesylX
	otSo6eLtdVPrf9GZh+zCGp6dLdCEjM1qmrKybjo2ToEyWAO13hSWqhjS/bBKEvsuU69EIow+Pas
	CG8kN5Y30g4we+blDvWDYM05qmAEpt5/nsV6QJQ==
X-Google-Smtp-Source: AGHT+IHPhG7djd76JAwReRTfdeI25+6PxdLvdUpDYWuoC4NJOs1pAxhj475UGUW/fpUc670SsOvrbgumdzIEALNiykI=
X-Received: by 2002:a05:690c:338a:b0:6ea:4d3f:dfa6 with SMTP id
 00721157ae682-6eaddc1e128mr58708387b3.0.1731106003938; Fri, 08 Nov 2024
 14:46:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241109-x1e80100-fix-address-size-cells-missing-warnings-v1-0-c1e173369657@linaro.org>
 <20241109-x1e80100-fix-address-size-cells-missing-warnings-v1-3-c1e173369657@linaro.org>
In-Reply-To: <20241109-x1e80100-fix-address-size-cells-missing-warnings-v1-3-c1e173369657@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 9 Nov 2024 00:46:33 +0200
Message-ID: <CAA8EJpoj1wF5rGa70y2mUgwKQT7B6CE5Wgm+wX1Tcn2+hdiuOQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: x1e80100-pmics: Add missing
 #address-cells/#size-cells to pmk8550_pon
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sibi Sankar <quic_sibis@quicinc.com>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
	Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, stable+noautosel@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 9 Nov 2024 at 00:05, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> The commit 4b28a0dec185 ("of: WARN on deprecated #address-cells/#size-cells
> handling") now forces the parent nodes to specify #adddress-cells
> and #size-cells, otherwise it will throw a warning.
>
> So add the #address-cells and #size-cells properties to the pmk8550_pon node
> to get rid of those warnings.
>
> Cc: <stable+noautosel@kernel.org> # Depends on commit 4b28a0dec185
> Fixes: 2559e61e7ef4 ("arm64: dts: qcom: x1e80100-pmics: Add the missing PMICs")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> index 5b54ee79f048e3208cbcd6f91e0cec073420fe63..5b9d67c340dc7a4550c9c7f16269542e400e4ee4 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> @@ -205,6 +205,9 @@ pmk8550_pon: pon@1300 {
>                         reg = <0x1300>, <0x800>;
>                         reg-names = "hlos", "pbs";
>
> +                       #address-cells = <1>;

This is incorrect, nodes under pon don't have reg and don't use addressing.

> +                       #size-cells = <0>;
> +
>                         pon_pwrkey: pwrkey {
>                                 compatible = "qcom,pmk8350-pwrkey";
>                                 interrupts = <0x0 0x13 0x7 IRQ_TYPE_EDGE_BOTH>;
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

