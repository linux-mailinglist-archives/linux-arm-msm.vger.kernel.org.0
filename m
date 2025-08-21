Return-Path: <linux-arm-msm+bounces-70190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B071B2FB5E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 15:55:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 766A618809CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 13:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6900C2EC55D;
	Thu, 21 Aug 2025 13:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UzSjDFX2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890E22EC57E
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 13:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755784056; cv=none; b=nmGEz/et9ciAvxsYfC6kUWWaOghk5i0Oi/CnSBsIurkBllKOKrHHQW8OPx9uWCeLYBWeqEnSNEE3Rq1xD/MUxPFPndH1Fk8TTRtK054GFLd8UdSuHwgjnaSWyWlzgSe9xZ58RrpAG6Mpb+vMiNmdOrqwvKCTME0fdreM2mGQZos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755784056; c=relaxed/simple;
	bh=HKdq5zrnBFDA5jHszrIlOFxSN9mtx8yukFEXWRNwoE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ESVk2wmEst9UJKJA67sEQPLCnwb6KgxlAFP7buhixgHxCPS2LHgHfM+JSDQU7HWa1jCd4WgjLkcMRtl7qeQcL65JeWqc9mObIFstF5G8DUelvwRmUiKoUMu+H8CFuGm+DtW6+7dXykjaeEYQNozFJzh5kNOsF3cexh2/PqSruiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UzSjDFX2; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b9edf4cf6cso779468f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 06:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755784053; x=1756388853; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1cNqt6F+utCAzBkTSdbP3iFxYXyHm8glU0KYUD049Co=;
        b=UzSjDFX2JC2iVIfkV7SrLRXUGI8MA3tTT/ME/ryo7U6g8qv1Kosb3WlElqeccU1XGq
         r97/ZYwb9yGrNtrXTYUP0XDUxIVhpzViS4T3LS6EQ7OX491epL7mnG/aVohXxQaBTXob
         tgDasAA5sXILXmRuj5oN2F3mxN82V/DiqmwkEHApEK6AwsZSGOa4/g5q9yvH3lmkhWaR
         uAobFMCvDju5bEuu0ypmFiUlkEdomayEi2/BPtOuWPjcWDftBe5b2k1BQV1/3Sbv9gWS
         y2KF+j17YgtoA71kDExi+jTeCZLSG4bV2oh7rI1fxIGueuPDccn5d00cDux6VSJ/yqH0
         2egw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755784053; x=1756388853;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cNqt6F+utCAzBkTSdbP3iFxYXyHm8glU0KYUD049Co=;
        b=sFv8Zju+DKn9PyzHmIgkaXZ9/JkviDHbkxfrEPqQBXyzCqZAWyW/hQbkS0F2clzRDb
         yD21CngGWsyCkg1cZnozFblBTdqzEHkXXiCp4te06R7+E//3HVuPC/d4d2U1uwCvhZZv
         EeFz+2XnKWFMoEUwDrPpfS9H0FjqUCnQFTqWRbX5uv6SsLTRwvSI/S1y3MbAY9r2iw1/
         KYcWa88E6b2u6qw8+WNmnwFDCbKstFsUkCw2OGw0iHa9mARqVC56GsGypff+D0Xd0BHR
         xOokDlMyvbpqv1VZ53K0AW02XRFIWjrIliIJg6fXXS37dPFzv4eDJ0YlT96kN//nYkdL
         iQWA==
X-Forwarded-Encrypted: i=1; AJvYcCVcvz0RoYE4XCDAIcX6CAeEi5/zuHuyCstDku6qA9qluFBy726mWBwqqeT24UYmuHfgnMC6t3MwjvmcOJXW@vger.kernel.org
X-Gm-Message-State: AOJu0YxVCg0GPVUoxHgPzEpLbMlpfqrqlG2HKEAA/qEMFudCPEned8gG
	RbdOHKXVcrs5FZbit7ERhSgafGCbhsQZ0HbMiIejhss2pgFCYCtDCs0fL8uYbJzoYpM=
X-Gm-Gg: ASbGncu2FM4vON6tNjTnD66aFFbN1b7IzvpY2IEKCnOneXIuZvTNfpqHM2i4BnXpxMr
	YU7btfIDegoN0oc4ta7DmRppWkyQj2eSJc9wyMLyamBsvH4zEyq72CLEdsFpflOjbyp2u1tgWqV
	JjeuDPi7qIF4NDW5Vt4FetDZqlWC2ZzfhZ0ubadz5UGLJzUOXv5BTBtt8U8ojA6oNLaqYBsZKAR
	Nxuc+P6X0RaXTOsZdX3f8FjZx8SiEthFx3b7auPeWdt8L0PIMm9jsI5+a+kTrevNFdLbK9H0B3C
	jl3+uuU58qbXtSA6GPZqQr6rgP3u2B/DrypnCNjmJ+CylYpoGZ/8tkkZUeS+1cp3RgIvFBTckDu
	Oh79aaf3rstb3cMNR15XnALHp3fBftkR0hg==
X-Google-Smtp-Source: AGHT+IGRsCsNTbh+Ry1lq6ZEMT9N9yWhON8/4j1DFbRCkoRW57mS/7ADV8FIQiHZDBWtT7+21FMWQA==
X-Received: by 2002:a05:6000:2282:b0:3b7:9c79:3293 with SMTP id ffacd0b85a97d-3c4978384e3mr2380212f8f.58.1755784052676;
        Thu, 21 Aug 2025 06:47:32 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:6153:383:a3fe:6207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c0771c166bsm11846370f8f.33.2025.08.21.06.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 06:47:32 -0700 (PDT)
Date: Thu, 21 Aug 2025 15:47:28 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/14] arm64: dts: qcom: Set up 4-lane DP for sm8[56]50 &
 x1e boards
Message-ID: <aKcjcB9yABjEv1KR@linaro.org>
References: <20250821-topic-x1e80100-4lanes-v1-0-0b1a0d093cd5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-topic-x1e80100-4lanes-v1-0-0b1a0d093cd5@linaro.org>

On Thu, Aug 21, 2025 at 03:37:19PM +0200, Neil Armstrong wrote:
> Now the 4lanes support in the QMP Combo PHY has been merged in [1],
> add the required plumbing in DT.
> 
> [1] https://lore.kernel.org/all/20250807-topic-4ln_dp_respin-v4-0-43272d6eca92@oss.qualcomm.com/
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Neil Armstrong (14):
>       arm64: dts: qcom: sm8550: allow mode-switch events to reach the QMP Combo PHY
>       arm64: dts: qcom: sm8650: allow mode-switch events to reach the QMP Combo PHY
>       arm64: dts: qcom: x1e80100: allow mode-switch events to reach the QMP Combo PHYs
>       arm64: dts: qcom: sm8550-hdk: Set up 4-lane DP
>       arm64: dts: qcom: sm8550-qrd: Set up 4-lane DP
>       arm64: dts: qcom: sm8650-hdk: Set up 4-lane DP
>       arm64: dts: qcom: sm8650-qrd: Set up 4-lane DP
>       arm64: dts: qcom: x1e001de-devkit: Set up 4-lane DP
>       arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Set up 4-lane DP
>       arm64: dts: qcom: x1e80100-dell-xps13-9345: Set up 4-lane DP
>       arm64: dts: qcom: x1e80100-hp-omnibook-x14: Set up 4-lane DP
>       arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Set up 4-lane DP
>       arm64: dts: qcom: x1e80100-microsoft-romulus: Set up 4-lane DP
>       arm64: dts: qcom: x1e80100-qcp: Set up 4-lane DP
> 
>  arch/arm64/boot/dts/qcom/sm8550-hdk.dts                     | 2 +-
>  arch/arm64/boot/dts/qcom/sm8550-qrd.dts                     | 2 +-
>  arch/arm64/boot/dts/qcom/sm8550.dtsi                        | 1 +
>  arch/arm64/boot/dts/qcom/sm8650-hdk.dts                     | 2 +-
>  arch/arm64/boot/dts/qcom/sm8650-qrd.dts                     | 2 +-
>  arch/arm64/boot/dts/qcom/sm8650.dtsi                        | 1 +
>  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts                | 6 +++---
>  arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 4 ++--
>  arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts       | 4 ++--
>  arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts       | 4 ++--
>  arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts    | 6 +++---
>  arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi    | 4 ++--
>  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                   | 6 +++---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi                      | 3 +++
>  14 files changed, 26 insertions(+), 21 deletions(-)

Nitpick: Could you send a patch for x1-crd.dtsi and
x1-asus-zenbook-a14.dtsi as well? :')

Thanks,
Stephan

