Return-Path: <linux-arm-msm+bounces-51246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 712C3A5ED61
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 08:54:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB7EC3A8487
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 07:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A780625FA2E;
	Thu, 13 Mar 2025 07:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SxpC1gHL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7A425FA1A;
	Thu, 13 Mar 2025 07:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741852443; cv=none; b=FQGMi1IvnqRY7MSSTJgjZPL9ZsdGq2C2NEH63VTpAqzI6OoWyqWRs6kX4cdGQHss3GJxb55TZhFsJPd+daCXvmhHtzzfyUcHJWYhboU2lxbbYmyZae/u//C0JKbjxrvu9BVCkejeCoY2/zPabVBmDKcrd9oWgSrmwg09PwOGj94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741852443; c=relaxed/simple;
	bh=Oy727npOYrvDbZWrxWnM9zWO+qFg0rFlevRSA+NrZME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a7redYTHeEUlFFZm9BMH7dXzSzL11yLp2VmS71rg9eKSD9iqliMXSkDtVwjLM/nxdxT7vDnGXdUcpReBKQus8spUQItb9yzNVv3e3rgjj5q4cHe/95ZQS0sGEXPLdfRDJgpDiwu9+Gch6LiLsOJdVi81oeZRnRPWZO6pPjvJ8Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SxpC1gHL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC868C4CEEA;
	Thu, 13 Mar 2025 07:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741852442;
	bh=Oy727npOYrvDbZWrxWnM9zWO+qFg0rFlevRSA+NrZME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SxpC1gHLTs+PecJ+hInrBRCCE9ad6XT6umULdnQR6nEsT7gW1hsq/BfMqI2JKiMQp
	 EyqfK8Bi0Dixqyk9PM5o1EcaalTWMaDw+82hX9azT/zfTo8PPRKU6bVZza0H2zMush
	 lhSiwKUpeYJ3UJ1RjN7jC6kC7YVIKSeHjiMQ1VY/hljnwEuFikzd7Hc8lMkMFz+bzS
	 i3/TO82rZmgJU2oRMsHZDu9ALXvQMhUgUYoaJws4OMitVwXA4wdv8AGYOVljeQsiBf
	 fC57gOfe3yxRqhUZmElgauWRVyCFX/Zrb3vMBfhJrzqa6FRkykAjHv/xiyCJt8LWE0
	 L6Q+99qAXpocA==
Date: Thu, 13 Mar 2025 08:53:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 04/10] dt-bindings: clock: Add Qualcomm QCS615 Display
 clock controller
Message-ID: <20250313-noisy-hopping-poodle-c51ccb@krzk-bin>
References: <20250313-qcs615-v5-mm-cc-v6-0-ebf4b9a5e916@quicinc.com>
 <20250313-qcs615-v5-mm-cc-v6-4-ebf4b9a5e916@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250313-qcs615-v5-mm-cc-v6-4-ebf4b9a5e916@quicinc.com>

On Thu, Mar 13, 2025 at 12:29:41PM +0530, Taniya Das wrote:
> Add DT bindings for the Display clock on QCS615 platforms. Add the
> relevant DT include definitions as well.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  .../bindings/clock/qcom,qcs615-dispcc.yaml         | 73 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,qcs615-dispcc.h     | 52 +++++++++++++++
>  2 files changed, 125 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


