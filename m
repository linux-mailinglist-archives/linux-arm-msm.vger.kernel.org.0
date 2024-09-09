Return-Path: <linux-arm-msm+bounces-31280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F5F971636
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 13:05:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88F22B228D7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 11:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 058CE1B653D;
	Mon,  9 Sep 2024 11:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HfEq4KrQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7711B6531;
	Mon,  9 Sep 2024 11:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725879898; cv=none; b=ux5CAR0C4OgYsicr1RYJDC0w/QViAhp7efQMLjjbCSI7ExStwBaXRgWVPSwmjwJ6ippaEMks67HGYeWMJcnxy+0vOLURMm1gEaU2GnI1dW5TdprJ5Hz8xBwj+nqtS2q/PNIdWjjeSlFxUjrmpSos16qU3b4SHDSo+C7LnLg22Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725879898; c=relaxed/simple;
	bh=JhdcST/hfvcZje5fcQEi3mhflcQK3zcQtBCQP4PQLYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lbu7y/LxfK6F4WU68APgc8+9y/qiqo5RD7hufi7rSwwJqOYK82sRK672fuNvtKVQ3vVgfgSGJsRG6w+8cnmvkuUkrocxkzFEXPQjGGqtsW+PBTjG/LzFjkaE+vRyGY/DG6+aqjARns9yur1wamZ0vxQ4aKn/0v4w3gD2+0EhQR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HfEq4KrQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 916AFC4CEC5;
	Mon,  9 Sep 2024 11:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725879898;
	bh=JhdcST/hfvcZje5fcQEi3mhflcQK3zcQtBCQP4PQLYg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HfEq4KrQENJ2A9NjhC10p5iHHo7Ft3wSbLCMWpDv5aVCaklFMj8zJMLfRaKFReye5
	 2YRT3YHL6JnqUuUQTZx+c6k4LhTMbEbi1kx4NgEduYyUGD/zmf8H/Q6UevbJP+elr3
	 haKZ7YLm7qtOhu480rsqkI3+v70j+GsGqhoY9l4M3BwekOMyRtAJBv5X4gRxjQuwBB
	 IuTlHQQqN+lvAqKNUm10dsRa1Mu5TA623dybtwjbnoEOnSeFvYsv57z2SIH8TmP8Ov
	 PPh992ukjJf6VgKM+xhBvRm4XqEn+RoruMPJK6sJQ11xiHn1YkTaMiqUWC20FQPnPo
	 gYJJKy4Nh0Rcw==
Message-ID: <98c48a3a-1593-44bc-a448-51850bce7b1e@kernel.org>
Date: Mon, 9 Sep 2024 13:04:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sc7280: don't enable GPU on
 unsupported devices
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Komal Bajaj <quic_kbajaj@quicinc.com>,
 cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240907-rb3g2-fixes-v1-0-eb9da98e9f80@linaro.org>
 <20240907-rb3g2-fixes-v1-2-eb9da98e9f80@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240907-rb3g2-fixes-v1-2-eb9da98e9f80@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7.09.2024 2:51 PM, Dmitry Baryshkov wrote:
> On SC7280 and derivative platforms GPU by default requires a signed
> binary, a660_zap.mbn. Disable GPU by default and enable it only when
> the binary is actually available (QCM6490-IDP, RB3gen2). ChromeOS
> devices do not use TrustZone, so GPU can be enabled by default in
> sc7280-chrome-common.dtsi. FairPhone5 and SHIFTphone8 DTS already
> enable GPU (even though it wasn't required beforehand).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad

