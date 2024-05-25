Return-Path: <linux-arm-msm+bounces-20474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9038CF137
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 22:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A86231C2089F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 20:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44528127B70;
	Sat, 25 May 2024 20:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EEbl0RgC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B881C126F1F
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 May 2024 20:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716667916; cv=none; b=Yf1KrSLdyox6pv0iOK6Z5xuYr3tzR5js/9Fj0IRAWT6WmtXSjNbyOHMCMGPutbYg2YIt5LdYC2LkRG9DRGiakv/JgSusSXMOriS9Ydxjok7BTniXg/+qOr4SeTTpjw8F65i/XXrR+UZ8EJLJjjY7dlOXgWZrpwHLOcuwqRd0T+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716667916; c=relaxed/simple;
	bh=us9ik86KhVJieBUfWzAd0oY32qXp0XESF6mTPnXJHr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QsaJuVwNkvwmMTAVdPcyakT4Dewx0QO/MbRY4R0vjVCM0TBr5ijaOZ/oz7C6NRSJk1oJt8+hlxJXwJVd/QXChm9YphWOEanLFSWNn42UMvf5pizsWe7aMrQHWXPITQDoL6QGBbG4neZWlX9vTbNxffjmRIfNcL8Aa1sPiZ0GZIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EEbl0RgC; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2e72224c395so76251381fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 May 2024 13:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716667913; x=1717272713; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yr0oGTIJ6hTJXhdkpnUryZauDgeE2tsEAIL5rTX1fRE=;
        b=EEbl0RgCe/KoVM83A/D6hSUMQ97Ly8LrduYJQmcLmI+DPPzimhkpJ6dJb9Kaa/R4V2
         LHz25F37tI2Z4N5TI6k5jdqwLWKEoQUqwsLkGc5P7/RPOn/ddDA9qCPJLiZHvPGbqnnV
         vrDS/tVoPmK7dCVBNBerHHnVjfv0Uc83AJu2QAxJW8zEvbapQ7ARpWsRSOgZ7AcAW1f6
         OxCGZi5qvqxp5kViPOvNV2Tzx/ho/WOxZn+NStbVASW4vrk0chofRJcKVx73UBcpTjYP
         cqyLyHxqXqLdaAeIhRsbvrURuzJoyyXS2p34MNC67DJ+2y1fK4vGZwl3PwMBGw3WLhyz
         Baaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716667913; x=1717272713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yr0oGTIJ6hTJXhdkpnUryZauDgeE2tsEAIL5rTX1fRE=;
        b=Rx/06VOzzTuLLj1SGGemBNRAmoBJ23nGAVawMAUnZQIFR7dazs00YFC8TZIKSLZbQq
         PIJhufLUNrtbprYeMKwFYne3coPJTExOXHV3jEAthNt4JIR/xM1OZM4CBgUVgb9kKTer
         dmtXn77AP2N26/U7TAx5EgjDXS7chsn35QTyRiZzhjA5StXLA64fIAIE84cwRNPJ5QWU
         9fEgrzRZm+MBZXBwCPU0rcEdo5paO9DqVewMG8mihlyY8fTrxHPqfY1LjEIHX+S/qUWt
         pJ8rENfvpnMLnUw29+ZkiP0dj3N5TdvX10IR4/uMA8hnuLdL6+aQhVUgFRyX7977xfby
         bZ0w==
X-Forwarded-Encrypted: i=1; AJvYcCU3Ddh38XKSEeo8dB+vj9HOM/rj9RHC8T25glwpWEsYTUOi/yzqw6ootLLoGimMJf/N9uuckbpr1m5J+ceCwj71HDzZab2PSpAMn89HBA==
X-Gm-Message-State: AOJu0YwVgr0fzm6gOaaM5gzrWn0/WsPx3O5EQEU8uASVe1c3HYUzILYC
	zQ9VdjQWgaklHxUHmZ3HUMK1FAk94+NKDWeWvhMFisJU8xMD1WppNwAWgIFKXtw=
X-Google-Smtp-Source: AGHT+IEMp9+eMiHdss+tfC19xR2VRaqqnzTBjHPqAfFT4ZS1DOkUxYnHpVVDnTZPpt/FjHWUTEv4Sg==
X-Received: by 2002:a2e:918d:0:b0:2df:c1e7:ab65 with SMTP id 38308e7fff4ca-2e95b0c0334mr33713441fa.26.1716667913057;
        Sat, 25 May 2024 13:11:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bcd7900sm8861601fa.36.2024.05.25.13.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 13:11:52 -0700 (PDT)
Date: Sat, 25 May 2024 23:11:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8180x: Add UFS PHY power-domain
Message-ID: <cl6meuv3l673hqz74rpqd4ibef4w2aiuwt7fsbnlqmejhsr3nu@a54bz67d7vtb>
References: <20240525-sc8180x-ufs-phy-add-power-domain-v1-1-019d515b1c26@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240525-sc8180x-ufs-phy-add-power-domain-v1-1-019d515b1c26@quicinc.com>

On Sat, May 25, 2024 at 10:50:21AM -0700, Bjorn Andersson wrote:
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> As defined by the binding, the UFS PHY node should have a power-domain,
> add this.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8180x.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 

https://patchwork.kernel.org/project/linux-arm-msm/patch/20240501-qcom-phy-fixes-v1-5-f1fd15c33fb3@linaro.org/

-- 
With best wishes
Dmitry

