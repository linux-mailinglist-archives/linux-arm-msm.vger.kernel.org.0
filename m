Return-Path: <linux-arm-msm+bounces-28708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D4D953C69
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 23:14:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA9B51F23363
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 21:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A55E14D6F9;
	Thu, 15 Aug 2024 21:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zG0EOPnq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C758249F
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 21:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723756443; cv=none; b=k3ovINuCw0HzisuegmKxl/a5VjKZPnLSBs0QXWEzWw493in/11lngfsqLE81NtS8rbN/dAyyvZ653FSQJ5zMQ+aAjLLxbUFzYnfonXnMIVC7Mtl35n2tlpCr8Iag9pMhuRur7Op4/3tkugLgoPdEzLmiuZfhPbgPvcNwCxd/w54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723756443; c=relaxed/simple;
	bh=kfnQy20qCZFG/fYvYRSSM/1kjgQQ38QFxepA5XY1YOE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=n8Y/r21brjVhC3fTSojn44vhPBIYxcZozWhkJiOklilXYL65INU6K4ysB+DDobyTk7WV5WuEmk6n9o6ydlOIie/b0IeBaumRCksyUlTuHrGg6C1ZcxzCFnbsPvxFJw98mhcPBwvOJ3k3GlzBbrfcuV/7QUjeAP6kKbuo/xp76Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zG0EOPnq; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-201fba05363so6376675ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 14:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723756440; x=1724361240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f+Bo5qGxveMLxcUla0CxNhPSPtEBrJGkqTsX3F/lJYg=;
        b=zG0EOPnqAzcWTRuPR7ceVehqg6s3ODPrUauuwX0EISb6GE8noOojG3QaFwE74+lwgo
         8qITyMKppfI1zWp7mgZEt71uS1e7LOnIVsphfHC4T8aa+N+7gMmBssJjT+S4yQOsP3vn
         7DTZTA9DUEtsqSuMdom8Nq9RIug4bih+HLva033wewvjNhonr80O+UMKG9faf0hzTZu8
         Ssfwtj65ks/hCcRDnShqhruGWAMZieZJ931uc9HKnqORkrZHK5qANnKreSt1QRL1tzWq
         LkoVbAs0h4kVe8G1Kn7NDyf5+E31J+7qaBueWK1aRV409AKnSy2XJ28szkjMQC7HGjgW
         3XjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723756440; x=1724361240;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f+Bo5qGxveMLxcUla0CxNhPSPtEBrJGkqTsX3F/lJYg=;
        b=XQfxGfF7w9KVYIMBY/BClFwlUVlAV+eAQ2QjepQcdMHOTzPo1smgG65mbiJE4K51MH
         Yx7bZ5B5l1Y/dXXsFTLnXkp8tt2hJOrZDx1QfbktBZmk+QRiXS67StLo46ZHkYiBan3S
         VC2h7yHpsNoBuUFGgfJEp+jDrJR94O8H5vKizcZX5/4JswgDnI1kxYfVnHKEGzVgmRv6
         JVAeH2qQsfqHhVUDQMmIFuf3jJTqIem7kJPSI2CZvdQllRTzA1vP0VLKkzyNc5ENGCiN
         z6036taO6hqrPW1VFxAqjL5xIHS9IOlVxVu5gHh6zQzezVPsTrieOFoPKxw0msmgQepX
         KVPA==
X-Forwarded-Encrypted: i=1; AJvYcCXKNdr3+GMBPXLItHBuvVW82KalKerNOBOUt9yrHYeWdzz6EqldGNkUxW7Qa5a2W2hILvIVqy9ijPMPooyWguxXWqqG55yyUlfCPtxMsw==
X-Gm-Message-State: AOJu0YylcyvnLI2GxiXPtQQFLdyyYkQB3ek2Y6+2QDtnIv+CNuZGViAN
	EBENdQaEVfkDTBNLFP9S700UncnRzl1Vzq+Ue6peLlJQFHsVqAuOwsvPCTLUD8k=
X-Google-Smtp-Source: AGHT+IHYiHCCAZQFrrszXwuCV4IST2TRqtQq3mnRszdxBlut7DuoLFfTf+/XFwocpFr1LFNC8YumTg==
X-Received: by 2002:a17:902:e74d:b0:1fd:78dd:8578 with SMTP id d9443c01a7336-20203f4fdb5mr13359885ad.55.1723756440095;
        Thu, 15 Aug 2024 14:14:00 -0700 (PDT)
Received: from [127.0.0.1] ([182.232.48.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f03795edsm14165365ad.153.2024.08.15.14.13.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2024 14:13:59 -0700 (PDT)
Date: Fri, 16 Aug 2024 04:13:55 +0700
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: srinivas.kandagatla@linaro.org, andersson@kernel.org
CC: konrad.dybcio@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 amit.pundir@linaro.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_arm64=3A_dts=3A_qcom=3A_sm8250=3A_mov?=
 =?US-ASCII?Q?e_lpass_codec_macros_to_use_clks_directly?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20240815170542.20754-1-srinivas.kandagatla@linaro.org>
References: <20240815170542.20754-1-srinivas.kandagatla@linaro.org>
Message-ID: <857A240A-54F7-4257-A4AA-DC4ADAF4F1A5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On August 16, 2024 12:05:42 AM GMT+07:00, srinivas=2Ekandagatla@linaro=2Eor=
g wrote:
>From: Srinivas Kandagatla <srinivas=2Ekandagatla@linaro=2Eorg>
>
>Move lpass codecs va and wsa macros to use the clks directly from
>AFE clock controller instead of going via gfm mux like other codec macros
>and SoCs=2E
>
>This makes it more align with the other SoCs and codec macros in this SoC
>which take AFE clocks directly=2E This will also avoid an extra clk mux l=
ayer,
>provides consistency and avoids the buggy mux driver which will be remove=
d=2E
>
>This should also fix RB5 audio=2E

So, is it a fix or an improvement? In the former case, it misses the descr=
iption of the issue and the Fixes tag=2E In the later case the commit messa=
ge shouldn't be mentioning 'fix'=2E

>
>Remove the gfm mux drivers for both audiocc and aoncc=2E
>
>Signed-off-by: Srinivas Kandagatla <srinivas=2Ekandagatla@linaro=2Eorg>
>---
>DT bindings changes to fix the incorrect number of clocks is available
>at
>https://mailman=2Ealsa-project=2Eorg/hyperkitty/list/alsa-devel@alsa-proj=
ect=2Eorg/thread/BWBTJHLNBQIMPUQNR274CPYXRBIBAYP5/
>CHECK_DTBS=3Dy might fail without this bindings change patch=2E
>
>
> arch/arm64/boot/dts/qcom/sm8250=2Edtsi | 31 ++++------------------------
> 1 file changed, 4 insertions(+), 27 deletions(-)
>
>diff --git a/arch/arm64/boot/dts/qcom/sm8250=2Edtsi b/arch/arm64/boot/dts=
/qcom/sm8250=2Edtsi
>index 9d6c97d1fd9d=2E=2E630f4eff20bf 100644
>--- a/arch/arm64/boot/dts/qcom/sm8250=2Edtsi
>+++ b/arch/arm64/boot/dts/qcom/sm8250=2Edtsi
>@@ -8,8 +8,6 @@
> #include <dt-bindings/clock/qcom,gcc-sm8250=2Eh>
> #include <dt-bindings/clock/qcom,gpucc-sm8250=2Eh>
> #include <dt-bindings/clock/qcom,rpmh=2Eh>
>-#include <dt-bindings/clock/qcom,sm8250-lpass-aoncc=2Eh>
>-#include <dt-bindings/clock/qcom,sm8250-lpass-audiocc=2Eh>
> #include <dt-bindings/dma/qcom-gpi=2Eh>
> #include <dt-bindings/gpio/gpio=2Eh>
> #include <dt-bindings/interconnect/qcom,osm-l3=2Eh>
>@@ -2633,14 +2631,13 @@ tcsr: syscon@1fc0000 {
> 		wsamacro: codec@3240000 {
> 			compatible =3D "qcom,sm8250-lpass-wsa-macro";
> 			reg =3D <0 0x03240000 0 0x1000>;
>-			clocks =3D <&audiocc LPASS_CDC_WSA_MCLK>,
>-				 <&audiocc LPASS_CDC_WSA_NPL>,
>+			clocks =3D <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_CO=
UPLE_NO>,
>+				 <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK  LPASS_CLK_ATTRIBUTE_COUPLE=
_NO>,
> 				 <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> 				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>-				 <&aoncc LPASS_CDC_VA_MCLK>,
> 				 <&vamacro>;
>=20
>-			clock-names =3D "mclk", "npl", "macro", "dcodec", "va", "fsgen";
>+			clock-names =3D "mclk", "npl", "macro", "dcodec", "fsgen";
>=20
> 			#clock-cells =3D <0>;
> 			clock-output-names =3D "mclk";
>@@ -2674,20 +2671,10 @@ swr0: soundwire@3250000 {
> 			status =3D "disabled";
> 		};
>=20
>-		audiocc: clock-controller@3300000 {
>-			compatible =3D "qcom,sm8250-lpass-audiocc";
>-			reg =3D <0 0x03300000 0 0x30000>;
>-			#clock-cells =3D <1>;
>-			clocks =3D <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_N=
O>,
>-				<&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>-				<&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
>-			clock-names =3D "core", "audio", "bus";
>-		};
>-
> 		vamacro: codec@3370000 {
> 			compatible =3D "qcom,sm8250-lpass-va-macro";
> 			reg =3D <0 0x03370000 0 0x1000>;
>-			clocks =3D <&aoncc LPASS_CDC_VA_MCLK>,
>+			clocks =3D <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_CO=
UPLE_NO>,
> 				<&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> 				<&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
>=20
>@@ -2792,16 +2779,6 @@ swr2: soundwire@3230000 {
> 			#size-cells =3D <0>;
> 		};
>=20
>-		aoncc: clock-controller@3380000 {
>-			compatible =3D "qcom,sm8250-lpass-aoncc";
>-			reg =3D <0 0x03380000 0 0x40000>;
>-			#clock-cells =3D <1>;
>-			clocks =3D <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_N=
O>,
>-				<&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>-				<&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_N=
O>;
>-			clock-names =3D "core", "audio", "bus";
>-		};
>-
> 		lpass_tlmm: pinctrl@33c0000 {
> 			compatible =3D "qcom,sm8250-lpass-lpi-pinctrl";
> 			reg =3D <0 0x033c0000 0x0 0x20000>,


--=20
With best wishes
Dmitry

