Return-Path: <linux-arm-msm+bounces-48993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFC5A40164
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 21:54:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2327B861782
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 20:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB4F6253331;
	Fri, 21 Feb 2025 20:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FvSLS1aQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898071EE028;
	Fri, 21 Feb 2025 20:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740171246; cv=none; b=jakI/gsoX/4/LPgyxo8+SxK7pcBvXK4nz+XEHC3r5AAZ36W564i41xz097k4iUzpf+yELR/kbEuqABuorjsfvb3gOmfX4VhhGrRjonK9Ewrn4Ct5KcAMLBI0Vuw91IKfn1D06U8dMBaHjsjE0fSctdXoSqbC2pjLURNK3OrNMz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740171246; c=relaxed/simple;
	bh=aU340i1VryrZnAEgyIdPRTfGAY6WaT/kAv4A3/BYmK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e+GeJP20zCxp2FwyJcPnfhAtvs5PNjP4bgdLTp33GdFtDoGAQe5VWIVdPoycn3iDnpg06KbrS4uKcvv02vJJbra8AIP8TeOmJAGtDTb87h0APbnarJORLM7nvQY/W+jz39XdTq/wcKaVyChaL9qmdw7VO/dOt0/59H0EvQpu46c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FvSLS1aQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5772C4CED6;
	Fri, 21 Feb 2025 20:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740171245;
	bh=aU340i1VryrZnAEgyIdPRTfGAY6WaT/kAv4A3/BYmK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FvSLS1aQB8fEIsJwnipVmT+2ZYR+DJgfZ7SEH44WFKw+vulmWJDl/FAoS431cppAq
	 p4INYYqzBoeJZFD9XmE0mRszsLAmmQKUAP9maRbWhgoSkhU/HWgHHDJ+Q19sOor4Hi
	 7RtfX+oXo0eSBnYTxz0nA/959z6NTQqZpXOGHpshDS548UrEoGtLNTNgjn+YPmF2Dx
	 nm56qsozqzqhuSB/jcfTqOU/jeRqGK3a2TWtcvJRXGa+KPtMbH0Bu0F3dA/5oMKog8
	 QcZXeJHzHHtUKch4CfxZZ1iA+m+rqaj2vvq/JniUvJfzkMMY9tzcNtPdpoOKKWIWpk
	 8/G8zoXbBrnew==
Date: Fri, 21 Feb 2025 14:54:03 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Imran Shaik <quic_imrashai@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Taniya Das <quic_tdas@quicinc.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: clock: qcom,sm8450-videocc: Add MXC
 power domain
Message-ID: <174017123873.53026.16356740656319644564.robh@kernel.org>
References: <20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com>
 <20250218-videocc-pll-multi-pd-voting-v1-1-cfe6289ea29b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218-videocc-pll-multi-pd-voting-v1-1-cfe6289ea29b@quicinc.com>


On Tue, 18 Feb 2025 19:56:46 +0530, Jagadeesh Kona wrote:
> To configure the video PLLs and enable the video GDSCs on SM8450,
> SM8475, SM8550 and SM8650 platforms, the MXC rail must be ON along
> with MMCX. Therefore, update the videocc bindings to include
> the MXC power domain on these platforms.
> 
> Fixes: 1e910b2ba0ed ("dt-bindings: clock: qcom: Add SM8450 video clock controller")
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


