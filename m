Return-Path: <linux-arm-msm+bounces-82169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9333CC6677E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 23:48:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id A49282A0D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 22:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 877F334C820;
	Mon, 17 Nov 2025 22:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lELBF3A4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5870C2F39A0;
	Mon, 17 Nov 2025 22:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763419637; cv=none; b=AY7HbkTIMMQnBfDmEV0ZDpb78+6zGNgQy4x8hHLlTFgMP6lLF+mOKb8aGAqS6IQ/CHbrtzSVNyK754aBMqRqMn+ofVfG7pdMtPQlem7BqpcEeZIIHm1Ij/vabelscj1V0ug9pRddnALl0+05Jp8FpJYyYd/cXV6frAHqyNWs7HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763419637; c=relaxed/simple;
	bh=mrbT0WxcJdbaGoPgzlHFge9VwUjoU+46O2Py3f1iM1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lK09z9YVvLN3M/JHYprhMXSb/mNrowG0enZBuyklKg3RHmP55JNaSgBn6Y5V12nmag3Pt52ab9WZGChVK5mlEvDSF3zyxfjK8qi18Hvb/o19J9E3zPqJ/TxOLExVLNBtzzyoEPQN+uqxIPP2XBVbkU4mqNXxaKaB8m5Nz8vPGKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lELBF3A4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E50CC19424;
	Mon, 17 Nov 2025 22:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763419636;
	bh=mrbT0WxcJdbaGoPgzlHFge9VwUjoU+46O2Py3f1iM1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lELBF3A4C0/3jSe/fOIj2o3tS12m9+KBPZWeu6kd19O2cj96UO5EAs1zGuAu+m6SR
	 VComBBT8t5sxObV/Hbh4baA32Sgk5WGSvaSPe6ohEyzBHiBXtV3EwaP1s8sn+SakVt
	 /6cDLeHfVxiN1CCrPE1k6WfErzg7uNvkcsjL21s8JsHg3gSWRR+pHQUwKqPswrrScy
	 rMXnRa1wVcmH0yk4wudMIS3aDofXE3WGRx7KncJbLlfD2ZVrqjHslTJ+BNEgpMoFAP
	 W0s87Hb9TscgrZqZFbJxQA6YjXYBjKeoLM3HrAq71N7fFWYx5DpRrjMt9IgZJ/0mBH
	 F3GBqy/Z4v9hA==
Date: Mon, 17 Nov 2025 16:47:14 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?B?QmFybmFi4XMgQ3rpbeFu?= <barnabas.czeman@mainlining.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: gcc-msm8917: Add missing MDSS
 reset
Message-ID: <176341963429.859152.11740860069143116254.robh@kernel.org>
References: <20251117-mdss-resets-msm8917-msm8937-v2-0-a7e9bbdaac96@mainlining.org>
 <20251117-mdss-resets-msm8917-msm8937-v2-1-a7e9bbdaac96@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251117-mdss-resets-msm8917-msm8937-v2-1-a7e9bbdaac96@mainlining.org>


On Mon, 17 Nov 2025 18:17:52 +0100, Barnabás Czémán wrote:
> Add definition for MDSS reset can be found on MSM8917 and MSM8937.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  include/dt-bindings/clock/qcom,gcc-msm8917.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


