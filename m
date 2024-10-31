Return-Path: <linux-arm-msm+bounces-36528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF9D9B761B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 09:13:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BEEEAB20F26
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 08:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3916153565;
	Thu, 31 Oct 2024 08:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TgaO/6gd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5221514CE;
	Thu, 31 Oct 2024 08:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730362412; cv=none; b=IeFj4jQatkxwUGOh4BG8E7M2RuTLB+DfcchZ2AdaOC5fGDg7fqftdk2QILwUbNDg88vilzUqEYiwTGLD1jJEMbZ1s1YQaDZOsLxoMzYqKf/TaS2r4L/WMwtUodoYyLEl+BEF5lWqGOfijHXa9RgrhJbqvpep/JKrPIULYlAdneo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730362412; c=relaxed/simple;
	bh=7ETzBfcmI5lFNi0VEqJWRXsfMXxJ4zVNS1TzFSIy1/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ocGO4uhkZEpUkp0dyWxShpKnbG9TgvJAiS7YhyQyGkyxrj/71ieB5PRR61i4g2YHJuaB8r8vrg0bkeF812DfFYqER+rw3YRbIAW2KdlktJjBkH6tyHXmw4CXysHK2lymxR+S4LpHd6vhO6hstWziBLb0UgaCNe1qpIq8QmhP4QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TgaO/6gd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45721C4CEC3;
	Thu, 31 Oct 2024 08:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730362412;
	bh=7ETzBfcmI5lFNi0VEqJWRXsfMXxJ4zVNS1TzFSIy1/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TgaO/6gdAu+crswbMGatp5O3XBeYDUfYPccVUBMSORYU3Iym+W4s2FY49I1iyb7fB
	 SI+5gbKheKE7o6PMWCt6ZKVnw2XeKoSYPKw4id4ZXxfq9K81/TMs0+ezdvmExSjmZs
	 sbb/NVVXDpG01/Iw/139LgTWD0dZ5Cj9Td3w3xbQMIW3qfv58+LBb2r/D/m1hswJrI
	 Q8Na5sgP0c0p5tYicDIVD2fxb0m9bkKrZLWEqO+/D0gGelJfwvG/jwGV+RPQX7A5aw
	 jJk6WAkTXqQrfzuRtG/PxIh/7A03lGq6xZwAsFUbSEl6qb1kACYENyt3Bn4xi+IjVR
	 zoMLTTgCNttYQ==
Date: Thu, 31 Oct 2024 09:13:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Kurapati <quic_kriskura@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: qcom-soc: extend to support
 SAR2130P platform
Message-ID: <23i2t2jsnm4mcnaxlzk2x6gyipu3fexw3d452wxrxgyzewkdtg@l5bxqhzcrwsw>
References: <20241030-sar2130p-dt-v2-0-027364ca0e86@linaro.org>
 <20241030-sar2130p-dt-v2-1-027364ca0e86@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241030-sar2130p-dt-v2-1-027364ca0e86@linaro.org>

On Wed, Oct 30, 2024 at 01:50:54PM +0200, Dmitry Baryshkov wrote:
> Extend the patterns in qcom-soc.yaml to support Qualcomm SAR2130P
> platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++--

This should be squashed with next patch, adding SAR2130P. It's logically
one change: you bring bindings for SA2130P.


>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> index d0751a572af39eecbbd2f8323a6c3c94b3fdeeac..1add7267f541a24e82e0cec62af6f0c839aca267 100644
> --- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> @@ -23,7 +23,7 @@ description: |
>  select:
>    properties:
>      compatible:
> -      pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1e)[0-9]+.*$"
> +      pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1e)[0-9]+.*$"

Instead:
s/sa/sar?/


>    required:
>      - compatible
>  
> @@ -31,7 +31,7 @@ properties:
>    compatible:
>      oneOf:
>        # Preferred naming style for compatibles of SoC components:
> -      - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1e)[0-9]+(pro)?-.*$"
> +      - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1e)[0-9]+(p|pro)?-.*$"

This breaks patterns. p|pro should stay as before. 8775p is below:

>        - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"

so this pattern could cover your sar, e.g. split:
"^qcom,sc8[0-9]+[a-z][a-z]-.*$"
"^qcom,sar?[0-9]+[a-z]-.*$"

Best regards,
Krzysztof


