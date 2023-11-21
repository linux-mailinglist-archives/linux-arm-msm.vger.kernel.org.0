Return-Path: <linux-arm-msm+bounces-1408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 127BF7F382C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 22:20:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 431FE1C20F57
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 21:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64D55584C3;
	Tue, 21 Nov 2023 21:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52AF1DD;
	Tue, 21 Nov 2023 13:20:42 -0800 (PST)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 5D14720053;
	Tue, 21 Nov 2023 22:20:35 +0100 (CET)
Date: Tue, 21 Nov 2023 22:20:33 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: qcom,dwc3: adjust number of interrupts
 on SM6125
Message-ID: <igbswtmfpwadvb6gbjbrkub5bsntcfvf6eh7hluzgnxtzhpmwi@3ucuaji2os3t>
References: <20231111141953.51841-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231111141953.51841-1-krzysztof.kozlowski@linaro.org>

On 2023-11-11 15:19:53, Krzysztof Kozlowski wrote:
> Qualcomm SM6125 DWC3 USB controller comes with two interrupts (verified
> with downstream/vendor code of Trinket DTSI from Xiaomi Laurel device).
> Move the qcom,sm6125-dwc3 to appropriate place in allOf:if:then blocks
> constraining interrupts.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Agreed.  I believe this is what I got stuck on when trying to address the
warning over a year ago [1].  It makes sense to drop the dm_hs_phy_irq and
dp_hs_phy_irq interrupts entirely.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

[1]: https://github.com/somainline/linux/commit/b57f7fa80cb3f5cd2db3db2d79548cbf063056d9

> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> index 64043b91ffb9..3f41362b2a91 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -375,7 +375,6 @@ allOf:
>                - qcom,sdx65-dwc3
>                - qcom,sdx75-dwc3
>                - qcom,sm4250-dwc3
> -              - qcom,sm6125-dwc3
>                - qcom,sm6350-dwc3
>                - qcom,sm8150-dwc3
>                - qcom,sm8250-dwc3
> @@ -408,6 +407,7 @@ allOf:
>                - qcom,msm8996-dwc3
>                - qcom,msm8998-dwc3
>                - qcom,sm6115-dwc3
> +              - qcom,sm6125-dwc3
>      then:
>        properties:
>          interrupts:
> -- 
> 2.34.1
> 

