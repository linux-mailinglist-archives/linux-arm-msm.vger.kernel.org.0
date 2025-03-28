Return-Path: <linux-arm-msm+bounces-52733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86681A74522
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 09:11:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B3BF189FADA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 08:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4FC8213243;
	Fri, 28 Mar 2025 08:11:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AFF212D8D;
	Fri, 28 Mar 2025 08:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743149482; cv=none; b=m9sKRNqo0CdE5HB1oAQFNHYS0an5xLgETfhZU8GRlquRMyV701ViFq34f4aKjwuk8t/CvzY/LXgH423gY0DkEt3RVe6HzEx3cDBgCKnSlS70ZBDhdrd2gkM2M+Tm9XsxMwplTKiQCvx6Fbq22c6yiN99S0xqpBnCj/I1dMjoF8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743149482; c=relaxed/simple;
	bh=CRPlWJM2tA1Y+X2msMtTS+SlW5MlQ7mYsR7+wX8qQSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hfe46lfyUjvk6NZf4RC6CDZXQGC3A3RRr1grs6RBeT5ljW6HvOp5pBhCZ/F4T/Jc/EqyWFKSUVspoGQmPwqsz0H1BYP9Db8bva8wHG2wetGNqqXjJx34YzUX3c+zraewLLZcMGmPgfWqW07bYLnVXcV+RI4YINIiBBglH71k95I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D16FC4CEEE;
	Fri, 28 Mar 2025 08:11:20 +0000 (UTC)
Date: Fri, 28 Mar 2025 09:11:18 +0100
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 03/18] dt-bindings: clock: qcom: sm8450-camcc: Allow
 to specify two power domains
Message-ID: <20250328-cautious-glorious-chupacabra-b42cc0@krzk-bin>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
 <20250327-videocc-pll-multi-pd-voting-v3-3-895fafd62627@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250327-videocc-pll-multi-pd-voting-v3-3-895fafd62627@quicinc.com>

On Thu, Mar 27, 2025 at 03:22:23PM +0530, Jagadeesh Kona wrote:
> From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 
> To configure the camera PLLs and enable the camera GDSCs on SM8450, SM8475,
> SM8550 and SM8650 platforms, the MXC rail must be ON along with MMCX.
> Therefore, update the camcc bindings to include the MXC power domain on
> these platforms.
> 
> Fixes: 9cbc64745fc6 ("dt-bindings: clock: qcom: Add SM8550 camera clock controller")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  .../devicetree/bindings/clock/qcom,sm8450-camcc.yaml   | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


