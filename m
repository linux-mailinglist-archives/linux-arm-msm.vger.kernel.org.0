Return-Path: <linux-arm-msm+bounces-26598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF2B93528F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 22:57:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14BC91C2114E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 20:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F03145B18;
	Thu, 18 Jul 2024 20:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y4XVzMaf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FAB13DDAD
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 20:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721336261; cv=none; b=AnXghLITB4PG9ARFaN71zVZXxI9dt1U7bWFF9Ucn3lXqiRUBVlgiuzn6syqZRNI2i2hGCB8XvKrMdpVKhRZ6tjyX/05nX+ThR5+LLNDs6vFFpD7CYZq08NUxzmQVd8PX9YqiOriZR+htx3wQ/IEYjCvisSSjpgNboWs0NdEjne0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721336261; c=relaxed/simple;
	bh=tAbWfIQ4v/HuPHVEJge1CzK9VejlF4IPKDtclv3TUFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZLMUyvmYkGGrv/XX4qVKxTgM7O1a/xJ92kWKyVLkklBSduARBEfJ/8Qqnx8z1euhgyXwf3tld/arBGHtyKK+McbDJEx/eg7WUFgxeYtHlE4HPBwa9SehlDYJ+sbspb/1M+aIZEdETHrl9unETwHG0JiQVpnTEaYlIy8wLWX+54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y4XVzMaf; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52ea5dc3c66so1537426e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 13:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721336257; x=1721941057; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jt4qMEVwM35lFX7t2weYvu2/XW9ujOBzqearuBlFYJA=;
        b=y4XVzMaftnfDmsaFWC/eRYFOQlpYCVih7cFAF/CzvCNJ3v36njPSVyMvo9FvF1T8ar
         cMKEhO483mkwIjssRRHobgutyOHboFlE3jNIqk4XE9U/qzmYZbAG0iqrLeQBtXPNEhyd
         lbsfnx8ZsETqA1lZvAqsBxS6+G+vRXyfPxx3PI7D+cXnCd4MsADerlM0nw8C9Azipv1L
         /WnnQe+OBHtzypMYileVh8ciAGebHhW4Ypo9oLMKox7ABLYexmsgLHVCggXI/J3mcsLf
         8uR2qfgYGeNG9IMFpjm8a+44zQhBKs4ebZWM+XUqNLvlibA1YDVGij1sG84OECnDuToh
         nuPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721336257; x=1721941057;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jt4qMEVwM35lFX7t2weYvu2/XW9ujOBzqearuBlFYJA=;
        b=n0G1JFkDGK2qyXo9TG9p/XKUg6ccyn9x8FbLAnjf24uxUwEPsCCLOFtClkq8a4lxOa
         ifa3PpZfQ5Upd648LxB8hnSqGzRYAsnQw063zNRPMLUttCfsdee7/cSn1bJbvvsUJIyf
         3jdaUGKGOuPQQXjYuo3lBW/0SZI5zBxO8JtYJdeIyAkdBp1uR1Z/d2eANLVcN7p5XpLN
         /r3AYSalhR8hfY6ZgfSLR3DC8NdHuDNmoOnPF67Y903g5ASgJo36DDYLqSzHy+N+kkHj
         T2f8wNso0TxEUXe6l/Q4cE5RAebgCc47ltoWV8u4ywOCgBUE23yu9XDxUC0B/lda42TD
         Eh3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXOSX/98MPDmAErk12ZUN7I02TGbWHgR+wNYIHHw5qZL6g0e+6tfbtYIxsAGkji7v8ynkkj9tT2O9amlDHnCXAC3PtuCTSueGBJ/ucWdg==
X-Gm-Message-State: AOJu0YxYUf82PVDk2t8xlZ7Q10KAwR5DfHTivdLpzfp8pn4x88BKG8My
	rILrOLLw09tm+nvvgklLhu4WEKyNDPTSyp5hJQoTjqhmvLsbOMYChpYrYJMhsyk=
X-Google-Smtp-Source: AGHT+IFOEhmrc8/7gP/gyY2lxQaJjz0l0DPkZEGt1Jaui5UPWhGGxU9XXD2bP5LA9cGX048zWkpoOA==
X-Received: by 2002:a05:6512:10c2:b0:52c:8342:6699 with SMTP id 2adb3069b0e04-52ee5453fd4mr6044046e87.55.1721336257180;
        Thu, 18 Jul 2024 13:57:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ef07a044dsm196680e87.285.2024.07.18.13.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 13:57:36 -0700 (PDT)
Date: Thu, 18 Jul 2024 23:57:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Patrick Wildt <patrick@blueri.se>, Kalle Valo <kvalo@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Steev Klimaszewski <steev@kali.org>, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Johan Hovold <johan+linaro@kernel.org>, "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: Re: [PATCH 0/2] arm64: dts: qcom: x1e80100-yoga: add wifi
 calibration variant
Message-ID: <gb5ykva2z2kkn4w4xnpbpkfthglifkygsbwplmqmd53hlxpqlg@gv7qknl3uuob>
References: <ZpV6o8JUJWg9lZFE@windev.fritz.box>
 <d44fdc0b-b4a7-4f36-9961-c5c042ed43df@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d44fdc0b-b4a7-4f36-9961-c5c042ed43df@quicinc.com>

On Thu, Jul 18, 2024 at 07:40:13AM GMT, Jeff Johnson wrote:
> On 7/15/2024 12:38 PM, Patrick Wildt wrote:
> > This series adds the missing calibration variant devicetree property
> > which is needed to load the calibration data and use the ath12k wifi
> > on the Lenovo Yoga Slim 7x.
> > 
> > Patrick Wildt (2):
> >   dt-bindings: net: wireless: add ath12k pcie bindings
> >   arm64: dts: qcom: x1e80100-yoga: add wifi calibration variant
> > 
> >  .../net/wireless/qcom,ath12k-pci.yaml         | 59 +++++++++++++++++++
> >  .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |  9 +++
> >  arch/arm64/boot/dts/qcom/x1e80100.dtsi        | 10 ++++
> >  3 files changed, 78 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ath12k-pci.yaml
> > 
> 
> +ath12k mailing list.
> 
> Qualcomm expects, on x86 and Qualcomm-based ARM devices, that this information
> come from ACPI.

Unfortunately we can not use ACPI on Qualcomm-based ARM devices. They
all are manually converted to DT. 

> 
> That support is currently under review:
> https://lore.kernel.org/all/20240717111023.78798-1-quic_lingbok@quicinc.com/
> 
> /jeff

-- 
With best wishes
Dmitry

