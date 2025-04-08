Return-Path: <linux-arm-msm+bounces-53507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA1AA7FC21
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 12:34:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF134189B389
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 10:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A18D268C41;
	Tue,  8 Apr 2025 10:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="l0iUWLzS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE10E2686A9
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 10:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744107803; cv=none; b=ikPymjGZOoOhM3xX9fSGkKLd4MEe6x7obsu6sji+8DZlh6bmV3pg+HoT/obGTYp1yOkp0yBgqPrJCmSEMTAWgFbvN/Dvk4yYnd2Ck+rLU/dSdF0iQ89fJ137mdDZ5bhWpvwakoCVfwdHJgAcYu/AqUwY/q5fddf7+/4Dp6rNV20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744107803; c=relaxed/simple;
	bh=OGNuM13Jn2n20UyvzyKj9h90vOLjQ7TUEPBE+s/TVZc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ce15g16jnKAk19qm1COkLSQTL6RWIqHSb/OW8vJiBGXGm9VkP66c5BzOeY92g8OkXOP7jJgwpEs54SgG0FCra55kSWwrB88F/5l57g9T7hJ2xzLU/F0P8uGDRv45V9dgmFKzo5ugQGs89FhJxqX2OMcLq7m6nbm3yrwsTQFcyo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=l0iUWLzS; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5ec9d24acfbso11829639a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 03:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1744107799; x=1744712599; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ATjvu1YuAWOqdIdSFjKRxn6bFisEx6/wr2o3X2NPy/4=;
        b=l0iUWLzS8/ij7Kcua7IjG/NLTV8wM07QYHdjzRlm+LQstzU20PXVR6VeaDklllgMCg
         ti8XxNoNSijrxDJROigMDzYdNKJ+FuRrlhqe9k+PBZ1/hBIhVr9Y9y9PStjhY5uoGUEP
         G1m8z0xjvCk5eXeEF9nwf/sX1F28hEJyJpcyL1K5HaCwD2PR5aNfj3+CyyjslpwNaxFU
         lX5S6ej9HcxpFZFbL+PCu230b+xVzdA93UsTi3F6u+eoxrFo3gl0to6BGTfdcvI4LFvn
         v5E0llgxCYQZrVJpERiHPzF+jARDJRX2vqlkuzZxMnW178euJ2yo2kA757PXG0FTpr4A
         7AqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744107799; x=1744712599;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ATjvu1YuAWOqdIdSFjKRxn6bFisEx6/wr2o3X2NPy/4=;
        b=Z+bipUg2lnE+RLvZBivr/95PqsXySkaCitsRGUf2VYdISZkRwAOO/tStIj5fxVqUgG
         TPdJgbyFhey0eaZnMnTNp0hN2CuBil6QMu1IIoEZAmhFhZvJBRFZAFsBJTSTLmi4OfCM
         C9dLZKtWNokGcDsM2PGP0M9DWqhd/l7se2gqayaSgVsq6vGGWccN7iDLnmLNJ5Sdu1pG
         4Q8drE6Y98v1ZSn7EYiaV3oOk3Hxu94ObSnRdF7aB0ysgHyaDXJnzOPtYEBDT+JmccWs
         DYLiM59xY3SjeOxiOc9Un2oPPwBwFGb+CV7a45+KZDrjCDxssdG7YOnK54a7mYiJLhct
         d3Dw==
X-Gm-Message-State: AOJu0YxI9XK3fbmpKxOQyCKNMlRdb6IHKgHXHGO03mrBNpIBISowrlnq
	VTfSMnLywJSZ5dBkFDaLdVXMr2sub3iPTDn+dhBStfgr0EgsNlKB6ihIdUKGLEY=
X-Gm-Gg: ASbGncsXFYmTm0S1XEzSU4vWovlmyES4LXW/b6qef8iE1+o13LFkyafoEGOxzcFBDZv
	Ac/Oum5bJDuFaCE3jCXOgMgFXmVZbCj7IMkeOsB+MyFRT+2FpoeFhzFXQ60/nn/UFack/L6FQYo
	KaiiroOF+AiHUxY0DHoKNp7K3dvImfjWFn1dIvaYcne3OjiZgTLbuVqtd7IZamWXufKe0xMfjsI
	jPu6bZb1pWpvBdWZDEpJ4txnYvW78Su3E36cD6qXNbwkzTGe6S4zq0jK6nNmRJpYCj9sJNzd7d8
	Hhrroe3YZ33s2yNVog0LBCTIIGrnmPOhjNHim57YNFkZ4SNpMjV8wQKuIs0/m1keqk7CehNlFhJ
	GcAUOfauWKZUDVg==
X-Google-Smtp-Source: AGHT+IESezrO0NwdMHDG4u4oSclKwyxgWMeMzsPuPPHtz4vm8/nQJIpzM61Y73uij3wfyLK4ntLQ6g==
X-Received: by 2002:a17:907:9495:b0:ac8:1ea0:650d with SMTP id a640c23a62f3a-ac81ea06691mr191813166b.0.1744107798996;
        Tue, 08 Apr 2025 03:23:18 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a55aasm8049772a12.78.2025.04.08.03.23.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 03:23:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Apr 2025 12:23:18 +0200
Message-Id: <D916M5DUK1YC.282XEZ0TMSNEC@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Dmitry Baryshkov" <lumag@kernel.org>
Subject: Re: [PATCH v2 03/24] ARM: dts: qcom: msm8916: Use the header with
 DSI phy clock IDs
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <cros-qcom-dts-watchers@chromium.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250408-dts-qcom-dsi-phy-clocks-v2-0-73b482a6dd02@linaro.org>
 <20250408-dts-qcom-dsi-phy-clocks-v2-3-73b482a6dd02@linaro.org>
In-Reply-To: <20250408-dts-qcom-dsi-phy-clocks-v2-3-73b482a6dd02@linaro.org>

On Tue Apr 8, 2025 at 11:32 AM CEST, Krzysztof Kozlowski wrote:
> Use the header with DSI phy clock IDs to make code more readable.

Hi Krzysztof,

This patch was the wrong subject, it's touching arm64, not arm32.

And thanks for sending this series, it's nice to see some magic numbers
disappear that make little sense if you don't know what it's about :)

Regards
Luca

>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/=
qcom/msm8916.dtsi
> index 8f35c9af18782aa1da7089988692e6588c4b7c5d..c89f9e92e832eae8f630555e9=
e7f5817d6731d4d 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -4,6 +4,7 @@
>   */
> =20
>  #include <dt-bindings/arm/coresight-cti-dt.h>
> +#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
>  #include <dt-bindings/clock/qcom,gcc-msm8916.h>
>  #include <dt-bindings/clock/qcom,rpmcc.h>
>  #include <dt-bindings/interconnect/qcom,msm8916.h>
> @@ -1497,8 +1498,8 @@ gcc: clock-controller@1800000 {
>  			reg =3D <0x01800000 0x80000>;
>  			clocks =3D <&xo_board>,
>  				 <&sleep_clk>,
> -				 <&mdss_dsi0_phy 1>,
> -				 <&mdss_dsi0_phy 0>,
> +				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
> +				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
>  				 <0>,
>  				 <0>,
>  				 <0>;
> @@ -1590,8 +1591,8 @@ mdss_dsi0: dsi@1a98000 {
> =20
>  				assigned-clocks =3D <&gcc BYTE0_CLK_SRC>,
>  						  <&gcc PCLK0_CLK_SRC>;
> -				assigned-clock-parents =3D <&mdss_dsi0_phy 0>,
> -							 <&mdss_dsi0_phy 1>;
> +				assigned-clock-parents =3D <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
> +							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
> =20
>  				clocks =3D <&gcc GCC_MDSS_MDP_CLK>,
>  					 <&gcc GCC_MDSS_AHB_CLK>,


