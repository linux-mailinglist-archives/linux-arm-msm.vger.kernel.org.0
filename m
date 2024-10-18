Return-Path: <linux-arm-msm+bounces-34863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7319A3622
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 08:52:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11BD0284EB4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 06:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC8F1865E2;
	Fri, 18 Oct 2024 06:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zl4XZpCV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6A817B41F;
	Fri, 18 Oct 2024 06:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729234239; cv=none; b=ORVz9+e//qzRKvmwy5qZYnLXMWQXsgp7vkoD8lc87p1nDnHVYYluUIM5n6vHmeN8dv6OvwUrIKk4TWHrp5xFt9r4TTGBKMzi9SBx5q8HggwKDspzkw2rtxVoIAXli5K/TnAfF3oDFVMeVZJd+FvGGdQuujKhnyhiOXh4kThXnbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729234239; c=relaxed/simple;
	bh=caTCuzfbSI5bG/474Ao95eU0g0pW2l1vEZXczfxqzmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y2Sz0N7FRK0XZBJdGFXx2afePatHsNvNWYdpRguQ+KRhYIRpCiS7QFSgvAH+Yl4KpcjlErP+UdxeEDs75+Try8GJSwpbka0oqtN22gaYQTlE371tjWuV3vQhrJbKZKzVNX2ew0OG/6KkHXZzaT7FXzkJqbPKxvinZLeJM0F9O+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zl4XZpCV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B76D2C4CEC3;
	Fri, 18 Oct 2024 06:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729234238;
	bh=caTCuzfbSI5bG/474Ao95eU0g0pW2l1vEZXczfxqzmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zl4XZpCVPlPX3UNk/UBRh54oAye9uBs0Trk1NG9+a7MDahPPp9UoF/1G15KC3GPLq
	 9GCljVy0ja0yOA86mmO8k1Oi5JmXu83z4yEDIDIgYYoTelTdY9YtUxmG7txWugSAXl
	 80MdYjM5a41rofokSA0RJ/QLUOrXkgAqKKceWZ/vTomSz3Dg5tc9jT7TrgkXmZxeqi
	 RLSHVnekAmcia2XplUKExhqZm0bKuQU6GuB/ADVs3hcli83eGwRb2wcBj31dKq0+q4
	 VH8fGAJ3LGvb16QDZhZJMrHi1Epa6VPnOnE4RGduq97KwzWDOOXp3xj7ogI7shyD+h
	 p/fWGHP7xMs5g==
Date: Fri, 18 Oct 2024 08:50:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/14] dt-bindings: clock: qcom: document SAR2130P Global
 Clock Controller
Message-ID: <zfjn64gk2s5fbhphrnppazqopyer3itcptvca5ie4zjmqqlfzo@vyw236t5rkiy>
References: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
 <20241017-sar2130p-clocks-v1-2-f75e740f0a8d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241017-sar2130p-clocks-v1-2-f75e740f0a8d@linaro.org>

On Thu, Oct 17, 2024 at 07:56:52PM +0300, Dmitry Baryshkov wrote:
> Add bindings for the Global Clock Controller (GCC) present on the
> Qualcomm SAR2130P platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/clock/qcom,sar2130p-gcc.yaml          |  65 ++++++++
>  include/dt-bindings/clock/qcom,sar2130p-gcc.h      | 181 +++++++++++++++++++++
>  2 files changed, 246 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


