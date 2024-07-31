Return-Path: <linux-arm-msm+bounces-27524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E67942D01
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 13:13:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 962BF1C23119
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 11:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5D61AC45E;
	Wed, 31 Jul 2024 11:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IqAYGOpX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488971AB52E
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 11:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722424432; cv=none; b=Xw/vw9K4qEypf6nuh2dG1lxHgiXfkVy0QhENvkVQdHl8d3WFTAsLu/rNy6ZGfRfJggIOWNnH3ZFC1KXnG+PT9UPbMzXzJrSsea+lkB2bS5B63BrSG4JHsi+O1ewZBtbtIaIdkljVxEE1rdNBTvMyPofWn5F/FAj+B6gW/oPN4ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722424432; c=relaxed/simple;
	bh=k85fIEDQsiqzt/RqUNSYKo+/sV4yzirvaADWzzxO5Lg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XdW69fU7McH5C3jPjxBtQVUD5KnSajTzEI9vNTNW0Tuq+7wHdXgo6aL68GECYDhkP02hQhb/quRSHIN+3MSkKnC/21VEjpbPed2vfOIikhfd3PsU6Wj9tu007mm2Fubp52yX0JI6n3OGul/O6V/xfm8NMAG3z8Xc3XAufHCM2rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IqAYGOpX; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a7a8e73b29cso437478666b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 04:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722424430; x=1723029230; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OlLQXU1YYTz38Qbe2t9ZiljMXVGAE2UwbufdyYLNy6A=;
        b=IqAYGOpXOaCP9qYaPuQM6sZhAx0eq2hFGtZGAvbBxp4mTSrxH7dEK8BFcbpvoKF26Y
         ecwVwtnEfDDh5Gl+X1GdEvLxmHvO8EoqPH6TdWAbJymnb2S/87eO2RAQ8GQbbPT5aigT
         YJ29Hd9nZtypqv85TEA5IM6Y89PuSnM1FBgWJlLPeX1maTJ8CYjRN4/TqB+CZMQP/wM3
         xCBlYIB7MJlq2pNbmGwFFTOIcjzdKbs9fX8yTJI5I5m9BzAJqIrsozWnG1ftS259vGdz
         RaVbyrRV1JzpBPjs3Qx+cX+R+Ev7VFHyXQzMPnAAavdjDl8yD/rDhnV0tfdHjodAn3dI
         sbaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722424430; x=1723029230;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OlLQXU1YYTz38Qbe2t9ZiljMXVGAE2UwbufdyYLNy6A=;
        b=UnXrXw9QMmNl5jJPTCZ0TlYFjXFA/l6wh2ygEgQGD4oSbtX+XGYP2s4ftT+rfNcXit
         fcevNkWRBwiPN7g9tbuvKG2f5lnUqW6OQF1bO/rLb8SE2h8LlK1APLzSwKNTr8fIFnOC
         eK+gCWdYou9MFekpZUyUPxsNnU6VVkVdRDvqYCEJ4AR0ixXwu5zvWtMTZA88d13Zzb5w
         hc9a/+brE3nt6VGaEaGJMAD08Id4Tsf/foOm9BliAcRNh4/z+pKbTQx1c5nCNN1cF8zS
         rG0vgbdAQbnuLJcwNZQ3kTJu6FNXUl8iYyQRHYWy5CQ0eAzkjekS7+YgKBzl1g08by7Z
         6BTA==
X-Gm-Message-State: AOJu0Ywl6QnbAJngpJ96Q08bnifIo+Vsh0qtsNba/wpsDJsOLjognEiR
	xydOtzLqr8EM5NZFTtN21g4lM9L18KSG5fNDWQ1Q32kgTiVxOeVa+1JFrUtWfwo=
X-Google-Smtp-Source: AGHT+IHGjJTeTxJqEgwE71cEFYOEfZQxduOvoGQx3kI/0iNz9R/KYl4BEutWT+YryytsPXhOaeT02g==
X-Received: by 2002:a17:907:7205:b0:a7a:9144:e23a with SMTP id a640c23a62f3a-a7d40129016mr1005259366b.43.1722424429589;
        Wed, 31 Jul 2024 04:13:49 -0700 (PDT)
Received: from ?IPV6:2a02:8109:aa0d:be00::7424? ([2a02:8109:aa0d:be00::7424])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acadb9819sm752741466b.205.2024.07.31.04.13.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 04:13:49 -0700 (PDT)
Message-ID: <023d4ea8-635d-435f-bae2-87284f70123b@linaro.org>
Date: Wed, 31 Jul 2024 13:13:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] Enable EUD on Qualcomm sm8450 SoC
To: Elson Roy Serrao <quic_eserrao@quicinc.com>, andersson@kernel.org,
 konrad.dybcio@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, gregkh@linuxfoundation.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20240730222439.3469-1-quic_eserrao@quicinc.com>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20240730222439.3469-1-quic_eserrao@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 31/07/2024 00:24, Elson Roy Serrao wrote:
> The Embedded USB Debugger (EUD) is a mini High-Speed USB on-chip hub to
> support the USB-based debug and trace capabilities on Qualcomm devices.
> The current implementation lacks in below aspects that are needed for
> proper EUD functionality.
> 
> 1.) HS-Phy control: EUD being a HS hub needs HS-Phy support for it's
>      operation. Hence EUD module should enable/disable HS-phy
>      accordingly.
> 	
> 2.) Proper routing of USB role switch notifications: EUD hub is physically
>      present in between the USB connector and the USB controller. So the
>      usb role switch notifications originating from the connector should
>      route through EUD. EUD also relies on role switch notifications to
>      communicate with the USB, regarding EUD attach/detach events.
> 
> This series aims at implementing the above aspects to enable EUD on
> Qualcomm sm8450 SoC.

Are there any plans to make this feature available for folks outside of 
Qualcomm / an NDA?

There is an openOCD fork on CodeLinaro but it still requires some 
proprietary library which is only available to folks with a quicinc 
email as I understand it.

Kind regards,

~ someone eager for JTAG access
> 
> Elson Roy Serrao (8):
>    dt-bindings: soc: qcom: eud: Add phy related bindings
>    dt-bindings: soc: qcom: eud: Add usb role switch property
>    dt-bindings: soc: qcom: eud: Add compatible for sm8450
>    arm64: dts: qcom: sm8450: Add EUD node
>    arm64: dts: qcom: Enable EUD on sm8450 hdk
>    usb: misc: eud: Add High-Speed Phy control for EUD operations
>    usb: misc: eud: Handle usb role switch notifications
>    usb: misc: eud: Add compatible for sm8450
> 
>   .../bindings/soc/qcom/qcom,eud.yaml           |  17 +++
>   arch/arm64/boot/dts/qcom/sm8450-hdk.dts       |  15 ++-
>   arch/arm64/boot/dts/qcom/sm8450.dtsi          |  29 ++++
>   drivers/usb/misc/qcom_eud.c                   | 125 +++++++++++++++---
>   4 files changed, 164 insertions(+), 22 deletions(-)
> 

-- 
// Caleb (they/them)

