Return-Path: <linux-arm-msm+bounces-29372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 030DB95D1C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 17:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 366D81C20441
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 15:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A501898F9;
	Fri, 23 Aug 2024 15:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CBHi8NBK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54FC188CDA
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2024 15:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724427615; cv=none; b=BgAGp5HCvLX4AOIe/HNkHkSdGC16sq7fE5vi64/3ZYSseYkWtizp1ZOTztfA/y3L3Eat5kHNXAYnk99dKpIciCky1d79aZw8fvwzMp2lQwfTHH+7C1OTF635SRXCMqqEUuNGLneZEzLp/WVI9cOL2pz2FL33wVzQC+qTZCiJmpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724427615; c=relaxed/simple;
	bh=GaP3IZrd5RcE9Ge4dIzx32rmwqF5NAyUSCzfoCvnFqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dde35W6/yMOzgemZFRJer07pFQThj/c3H1fzbbKYYYdOSBR+RhbVBq2R6Pw0It0H8Qpi39U45LgTwbnigTgFsq1s5IBA/MZk0X4CYrmr63KW5cnGUlTv7+vehXD3WS7GfvDsf+P6cz4C11iBFHoVnjUMlUKNW2+z9IkcKhUrK3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CBHi8NBK; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-201fbd0d7c2so19970275ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2024 08:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724427613; x=1725032413; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7PswcGyJCTUDaExiPb+cp181Qy+ul9NVt4xbxRyvgH4=;
        b=CBHi8NBK50ce1ZSLXcvgXuFRyvK3+rzQXgSny7GMaTBigXH6bgnAbnvH84FKCD55mv
         3EHyp40zA5RFx+5qXqCPRpgFo0YlORHzAgJuB5QbsdvY+wHkqekT2gstx/ksKOHpUrXt
         bajZAMYUR6CCtn2I/5musaR3pCM/ZttOsKdWQgfm8msehHm9xZkkWvZ0QAQ5lcMGsmZ+
         XBEPAa+kFE0tEQg1YJOrpYRHUXIA4NwwFyGrPG5ncaxf0nedAcfWjbvp+8DImEam9ma7
         DfyQm1/sYphsmSdVZOCC2TgHKJHYbHYnQWbdRDY+tGBIGWAmGMnom9u6lCjCk+qA5NR0
         7hmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724427613; x=1725032413;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7PswcGyJCTUDaExiPb+cp181Qy+ul9NVt4xbxRyvgH4=;
        b=RSr1nbIUd4vd6irwLGGgvElQJpsCi3r8MvrOUykUGwLp/Y6MXLj/J1pety2rM8bKY1
         oBwRExUYlbuouxju83h9EYSWxoJcE50eVFlke2pxijX43xnNlxzkOIAkOoic7a802m/6
         9dEZjagbhzDRlBXwNYjLYeXxckwOmyRCsGv7Tfd++b4MPHNVTwlQhZ3Czm/rzXnb5LR8
         7H9xUyeRwWDoJh6mTawuueWlIT+YWbQIFeFqphMOLYBClKZLiMw0Ny1f4PnlFPef0jp/
         3jUAy04Iq0vyyLaWK1zBUleikfdf4HC447J9EErVc1bB/vl28kj+dZPfPlUAcvdFJwwk
         quQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUi+DWiR0SFCKMSA/jjTJuuBZ0Vh5uV5xEgFTCHN75ENEc6hvDCTaSZYNqFW41tUHMhqJhaRDlqz/aLZcb0@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4Tra5wda4md0PzIP5owugfKMcQZtcLpLCyg79EHIOBw/MwNM6
	SadiCN4vKHTQhu5dao+uHxvaEdRgVBeKvmUqFIG3tGfSaPvTcUhWArEGF+Vesw==
X-Google-Smtp-Source: AGHT+IF74dSdz3Lddcc4Y1HpHeUo4j1K1gSy0t0eup/KCqO1Hsm3KR379cw9PEgNYC8BJ6xrSdPAcA==
X-Received: by 2002:a17:902:e5ce:b0:1fd:67c2:f97f with SMTP id d9443c01a7336-2039e4e7cf1mr23598545ad.28.1724427612976;
        Fri, 23 Aug 2024 08:40:12 -0700 (PDT)
Received: from thinkpad ([120.60.50.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2038556686asm29835955ad.40.2024.08.23.08.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 08:40:12 -0700 (PDT)
Date: Fri, 23 Aug 2024 21:09:58 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
	thara.gopinath@gmail.com, herbert@gondor.apana.org.au,
	davem@davemloft.net, gustavoars@kernel.org,
	u.kleine-koenig@pengutronix.de, kees@kernel.org, agross@kernel.org,
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, quic_srichara@quicinc.com,
	quic_varada@quicinc.com, quic_utiwari@quicinc.com
Subject: Re: [PATCH v2 01/16] dt-bindings: dma: qcom,bam: Add bam pipe lock
Message-ID: <20240823153958.vk4naz34vgkqzhrb@thinkpad>
References: <20240815085725.2740390-1-quic_mdalam@quicinc.com>
 <20240815085725.2740390-2-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240815085725.2740390-2-quic_mdalam@quicinc.com>

On Thu, Aug 15, 2024 at 02:27:10PM +0530, Md Sadre Alam wrote:
> BAM having pipe locking mechanism. The Lock and Un-Lock bit
> should be set on CMD descriptor only. Upon encountering a
> descriptor with Lock bit set, the BAM will lock all other
> pipes not related to the current pipe group, and keep
> handling the current pipe only until it sees the Un-Lock
> set.
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---
> 
> Change in [v2]
> 
> * Added initial support for dt-binding
> 
> Change in [v1]
> 
> * This patch was not included in [v1]
> 
>  Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
> index 3ad0d9b1fbc5..91cc2942aa62 100644
> --- a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
> +++ b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
> @@ -77,6 +77,12 @@ properties:
>        Indicates that the bam is powered up by a remote processor but must be
>        initialized by the local processor.
>  
> +  qcom,bam_pipe_lock:
> +    type: boolean
> +    description:
> +      Indicates that the bam pipe needs locking or not based on client driver
> +      sending the LOCK or UNLOK bit set on command descriptor.
> +

This looks like a pure driver implementation and doesn't belong to the DT at
all. Why can't you add a logic in the driver to use the lock based on some
detection mechanism?

- Mani

>    reg:
>      maxItems: 1
>  
> @@ -92,6 +98,8 @@ anyOf:
>        - qcom,powered-remotely
>    - required:
>        - qcom,controlled-remotely
> +  - required:
> +      - qcom,bam_pipe_lock
>    - required:
>        - clocks
>        - clock-names
> -- 
> 2.34.1
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

