Return-Path: <linux-arm-msm+bounces-83409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C539C88F05
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 10:27:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BA925356965
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 09:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD5A8309F02;
	Wed, 26 Nov 2025 09:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i2Oi3vYd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC34303A15;
	Wed, 26 Nov 2025 09:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764149180; cv=none; b=oQkqBRt+1LDHF7aDbGJVMD0mZr3NH2FmZdz0dsRBV9Ik3x0BVjFVPMrxHblyE2Fm0dXOfwj7nrQcJU0B/NKn4lJKxQvS4MjY1qZ564wZP45klLpcW9YLkFMFnokXnGYWDR2Dgq8onDcC8Sa1+T71sHfA6Is9KntY5Q3+e+YwSy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764149180; c=relaxed/simple;
	bh=Aqdv8eAr+DkSWRvQTMrwCYMHbQlK24qsrxmibeb83K8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q6aICqufOVz4QogLuaXfEDaf+nwfkpwj4a5y6a0W29hm2dZ24sbiF+E0cCgmWiYjnVyV+5kv36r1fk8QbIQaYIQbBIR5H1gdLUOQfTP6aUt397UScykxT0LSTPSVux6EzNpbtPowhxVUxzMu6JzzKM7VAKdcETwaIKBLSSSVMVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i2Oi3vYd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50F99C19421;
	Wed, 26 Nov 2025 09:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764149179;
	bh=Aqdv8eAr+DkSWRvQTMrwCYMHbQlK24qsrxmibeb83K8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i2Oi3vYd294Wws/pPJDMVWSkyodtI4Xp8H+d/a8jfJkBSG8M6OIzinXX4D36Rw2IQ
	 ewot5VVa/5+vCqJ722UNje8osvh6wyUYMrb2QXXpgZmRHKw8OPQdQRaTTZynclfFbT
	 qL7p3Pyhhhz2LEtlrMXn4dHl/dkruerBJwc/+kCofO5dgHNLHhIk2vCApKD/0zWblu
	 5p97F94S2D87PSjxXKZQiDO3ZwN1+apRSDxyrNZjOLUPOsRU9HPDZMjIdR+kCP6Mfp
	 eyd1HUTlVXhsPIk8IMxMY2WZmnCPNe3k5ZZjSWSAYMK5HCfJsORLODs4KTgGLoGd3B
	 Feblb/oQC2l9A==
Date: Wed, 26 Nov 2025 10:26:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Imran Shaik <imran.shaik@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 05/11] dt-bindings: clock: qcom: Add support for CAMCC
 for Kaanapali
Message-ID: <20251126-gorgeous-hospitable-caracara-b8cbe8@kuoka>
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-5-fb44e78f300b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251125-kaanapali-mmcc-v2-v2-5-fb44e78f300b@oss.qualcomm.com>

On Tue, Nov 25, 2025 at 11:15:14PM +0530, Taniya Das wrote:
> Update the compatible and the bindings for CAMCC support on Kaanapali
> SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8450-camcc.yaml          |   6 +
>  .../clock/qcom,kaanapali-cambistmclkcc.h           |  33 +++++
>  include/dt-bindings/clock/qcom,kaanapali-camcc.h   | 147 +++++++++++++++++++++
>  3 files changed, 186 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


