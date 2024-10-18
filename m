Return-Path: <linux-arm-msm+bounces-34874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 630879A36B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 09:12:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17F4D1F24ECB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 07:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D9418A6CA;
	Fri, 18 Oct 2024 07:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CVNk4C4J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D931885B8;
	Fri, 18 Oct 2024 07:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729235411; cv=none; b=FphJT3FknwIcWvIRc7X9YT9sazgPiZ4EwOl3AyX8xbd14wL18/UaVhJCfOcjth1vS4dwSiRpemoXRpTClIoKN1ehTz8TV/8DZYBSeS+A4ZiWaJXtrKIunnSbbbX21xf/gfO7sMIXaFmKGC5lwRkruHAJRMF3pStmrt7bMF4h/rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729235411; c=relaxed/simple;
	bh=pt6xLPPRzPaYcT0UP4D9nl92+vx0Fvn5waa4V16kSh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RR/APos3BubFc8Jc8TxvdVyOROQSRpCmQdX8cxcZITQlfo3YibU6YBPwdiLwgzbudj8ZiaEaf1PBSOgngzMldCrEljw2sMHirfR7a3gr8dDQRRmuKfSHsIGjpxd3e2CpF2a3/gYnWnvk/o16Z25wTcAOzm61vci8RsoFhOK58Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CVNk4C4J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 355E9C4CEC3;
	Fri, 18 Oct 2024 07:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729235411;
	bh=pt6xLPPRzPaYcT0UP4D9nl92+vx0Fvn5waa4V16kSh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CVNk4C4Jw8QYB+t7RKdH8Zwe0gTNlc6UMhGNTUm1MYc6zFq2Gp8e7sQ1Hlc8LXBYR
	 tWkWGaBRUWAQgjMF/zidUGiXBagSNqyBJQBNy514y+Jb5tf3nL9jIJSFO4TiR6RRTq
	 mXQS9BJ+JWDIRxutZs1dov8zif602LKZtXjcEKN++QVOQZ7OuLeiyy9yNmiOvx7nY0
	 KAbdvWFOsVqyMCDK4SptK7mqu+pZREpZr111i1eTxG9tuWMy3RZIlChNFVGpZ18ux5
	 6OFKoDdtjYFMNmmbZeLVuDzlsLSISw4uO3wZR+NFtlyIw+2OR1mMEvuZzAzSaCZjI1
	 yQBqOKYDDe9nQ==
Date: Fri, 18 Oct 2024 09:10:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/14] dt-bindings: clk: qcom,sm8450-gpucc: add SAR2130P
 compatibles
Message-ID: <lue5xeab77eqnghpnxrhsezymf3e26ii7kccqlcm4fig57f4ug@sauhknjyrqbn>
References: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
 <20241017-sar2130p-clocks-v1-5-f75e740f0a8d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241017-sar2130p-clocks-v1-5-f75e740f0a8d@linaro.org>

On Thu, Oct 17, 2024 at 07:56:55PM +0300, Dmitry Baryshkov wrote:
> From: Konrad Dybcio <konradybcio@kernel.org>
> 
> Expand qcom,sm8450-gpucc bindings to include SAR2130P.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Mismatched SoB and from.

Best regards,
Krzysztof


