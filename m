Return-Path: <linux-arm-msm+bounces-39902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AB49E06FC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 16:26:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F83F16C591
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 15:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 636A8202F95;
	Mon,  2 Dec 2024 15:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gBqXi62I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592CD204F70
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 15:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733151752; cv=none; b=BZYZpyEUb3/m1/zBMT87B7QakH9liZIHPKObcdakDrmIiHQEZn6iCbkhi+uU10TOmegItSrCok0j0YGJ6d21oKR2+RTOgVGgPQDBdB7CfO9IHcvoUEdVPA1TmFO0S9ROiKD285mrkNIWybjeZ1bhJdcdqDXGveEqUuY6Yn1clgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733151752; c=relaxed/simple;
	bh=Tss2wX7BVTMGLLgBPwI3Bxd0nhDmhT/WVBqiMlc+Up8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=atdDYlcF6p8PcBfpeUwPKPA3Xf1zAdA2zDvco4FgZxnkqz9qnx4lNFjzKDJhXlifUBBPsGDQ06LyK5HmZ3D3nx57qr3xXU7oR8QR3ihDKYGeQyV/k/xaNhHJN4Lu/AAx/hYf4NFOu6X/JdysJVQqmnSn4AxyLIqb7s/zbmyzGJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gBqXi62I; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53ddd4705f8so4164773e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 07:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733151747; x=1733756547; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/YvM66VLjGaWFMoBlw0v965vjYa9KnUHS0gdOSnCBuU=;
        b=gBqXi62I/Aag3MjA+zhShuDWP3UFuchk2GVFlIRZKWrbvYGMzXko5zbPLI9gwRItP5
         6K0hMuwez0ls52h28yW731k1xIqGRkxipaqqwvvIiEp9Rac3YyrNDlHM6E+bCdkzyl5W
         0c720nvOv1XODUMKy/WTpvLq1WSCiZRm2wCUQt1Zplc5dHfT7NmCqrPG0KpGE56ECgb7
         Bq8CYdPP0MZ8FrzdYQqJ+ijpwjLJG8rqH1QfpRkhgbOgNQiYrEwHObrMeronAlVpeJ2T
         kWSZhat9PugcZz2PtwXJw7cDCN9uG0MKucA04EnsM5wWCpEtsHcz9W9bNO/squ+CjYFV
         Uapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733151747; x=1733756547;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/YvM66VLjGaWFMoBlw0v965vjYa9KnUHS0gdOSnCBuU=;
        b=sYRbXRQnFF2AOlpqtKMU/uUh5FIE5sr+4XdoGrToFNVhebrWd3T4GAeKs/YkV7sexg
         f6diy3AIy9myz1POi4TQP79soXvOeRWi829WxxQebsteJGcgVLbImlnXALIgtzrqOmmU
         n5lcAMhy7iKM6VGShZa8ejEm7fGkb2Bz9p1ofnTtb8KrHsnAJJfeZqwHBimTidE8YQL9
         zG7uI43VR6tRJZwz3KY6kL11XCA6Vr5pN7WmkgkIF1vTWpzNT+SjsMPdxoT6fYV3h/we
         xuWr1OElc03Knl7SE5O1dAJLtt7gdihCSl98bAzoZL5iX0Sw10TLhoDhp7LH9A4m0RbJ
         ulNg==
X-Forwarded-Encrypted: i=1; AJvYcCXaOZdFuv7V3Om5mc8necFnDZREB78KskJ7X4KPf5cBFTQLluUP+c1Nvll2/rpxpQqYSx5uLzO0krxw7PU9@vger.kernel.org
X-Gm-Message-State: AOJu0YxoUsF/2RNfBcd2UxAYktBRpvBllDnwwG9CIXnLY+FxZZepNZ+p
	OiZYyKxfnPoUuVbofK/bBYaaUAf5SkrEutiAaT1Ua5rLnqpIRecyR3fEC7BJGZE=
X-Gm-Gg: ASbGncuIeaDHqDPSp72NPVnzumQCUELd+8KYA2/9U5nb48vQ5TnntLV2OzzjEDgV6ly
	KWh9RS+Loigumm/IhRmpOLO1b1qTUh6C9kARasw3cOdfkDKwK2Exe848o67jLtHua6sf2s+GwO0
	rqs1koGoSnzFlacdQIQvidxLiFr4Y1teZYNCeLnVhGZ39UMCDecJ9Rv9oGCfRhI0DRlAX5RsgGm
	xk8D7qcaW27r82pJuu6DMxCD14wfAkZXqi11GEIchL/iZkR8fxFNwjPRA2RC1Ky6axfmidg4wph
	dAwX0BtyP3QZHOgPDI4tfnmJ+0b9Iw==
X-Google-Smtp-Source: AGHT+IGpWLZTubAjL+EcRvPsaRs1q62SFavCte2XH3l1UUlQtQ0yI4iXJlCQ+K7wtS1kFUnHwKp47w==
X-Received: by 2002:a05:6512:3b0f:b0:53d:f786:c364 with SMTP id 2adb3069b0e04-53df786c447mr5437857e87.19.1733151744243;
        Mon, 02 Dec 2024 07:02:24 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df6442e26sm1491277e87.67.2024.12.02.07.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 07:02:22 -0800 (PST)
Date: Mon, 2 Dec 2024 17:02:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 4/6] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
Message-ID: <2chygbm3yjozhkhps64oae5gwirdk5b3orsybss7jgutu5g7ke@4jskpnermxfm>
References: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
 <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-4-54075d75f654@linaro.org>
 <02dd5593-38ba-4344-aa64-0913eca45808@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02dd5593-38ba-4344-aa64-0913eca45808@oss.qualcomm.com>

On Mon, Dec 02, 2024 at 03:27:11PM +0100, Konrad Dybcio wrote:
> On 19.11.2024 2:10 PM, Bryan O'Donoghue wrote:
> > Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
> > of previous CAMCC blocks with the exception of having two required
> > power-domains not just one.
> > 
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > index c18b99765c25c901b3d0a3fbaddc320c0a8c1716..5119cf64b461eb517e9306869ad0ec1b2cae629e 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > @@ -3,6 +3,7 @@
> >   * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> >   */
> >  
> > +#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
> >  #include <dt-bindings/clock/qcom,rpmh.h>
> >  #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
> >  #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
> > @@ -4647,6 +4648,22 @@ usb_1_ss1_dwc3_ss: endpoint {
> >  			};
> >  		};
> >  
> > +		camcc: clock-controller@ade0000 {
> > +			compatible = "qcom,x1e80100-camcc";
> > +			reg = <0 0x0ade0000 0 0x20000>;
> > +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> 
> This clock is not registered with the CCF

Isn't that be going to be handled by the CCF on its own (like orphans,
etc)?

-- 
With best wishes
Dmitry

