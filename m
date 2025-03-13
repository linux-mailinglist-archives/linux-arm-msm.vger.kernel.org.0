Return-Path: <linux-arm-msm+bounces-51252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C1BA5EDEC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 09:24:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8CEC168FA1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 08:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 821E5260A25;
	Thu, 13 Mar 2025 08:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bnlCx8r5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE001EA7FC;
	Thu, 13 Mar 2025 08:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741854258; cv=none; b=hAzb/6fYNqacsp0BCngCSg4ZL29t3AuJSafsamqE3iA92iIQJhR+qDCPgcYpOS4v1FuVL1SgUMHU20bbLUSvA1LuqiyBReW5U15QB5PP/gcZw73BMMYd1q8HlDtYQ1F7htn/Q2DCTyjTy4kEzcSMvn7BrNnaRNkkhfyP3xZKxP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741854258; c=relaxed/simple;
	bh=nzEoy2Dm6WdPm0bsSQMi/Pi0gl+x9sAMvCNvyjcf8w0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n/6TvF7Prvx7SLz45keBxNpyUoBpY+WTsYjPseaMGrimpr/Ee9hHvDx9P0kpb5MLYiJqoeT1aauXdXvb5/JW/Z93zDRqt0EfWoYumiTh0+8gGm9Mpuq+nDKa4E832J2ohj9SwGS0T83snZzIV5p5hsvCO+8xTWD1A98bXZDZJas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bnlCx8r5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B9AEC4CEE9;
	Thu, 13 Mar 2025 08:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741854257;
	bh=nzEoy2Dm6WdPm0bsSQMi/Pi0gl+x9sAMvCNvyjcf8w0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bnlCx8r5QwZudVcnRFXkQ1/mShMlI7S9sNXIJ4mIckmfuhk7xAEPAFGfSKILwYrJR
	 q2H3UNAsxYwuDi8A0LOMPV0du9lLjSGcePOm5ghr2wkIHFiOL/7zVi2p4L7Esi7/lY
	 kq5DF0j/MpU5EUsSEUN/hknlvSWobgVt7qaPJgvLWWWBQ9v1x8dBioVK5p8ezZJ6A7
	 k70YQOXiIsL4Z8ERTGw78t+MIFzSfp/DJsHBZCj+vHfZMOcyYTGgG8xIs7UOxWYdvE
	 SPUIMMHvzqwIJ8PRGZYN7NOb/sI11IjH/oykGoVY4w1JAU+NavEA/zxKhQqYQZh3vb
	 NbfeAfr+L8JUQ==
Date: Thu, 13 Mar 2025 09:24:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 06/10] dt-bindings: clock: Add Qualcomm QCS615
 Graphics clock controller
Message-ID: <20250313-graceful-jackdaw-of-opportunity-62996d@krzk-bin>
References: <20250313-qcs615-v5-mm-cc-v6-0-ebf4b9a5e916@quicinc.com>
 <20250313-qcs615-v5-mm-cc-v6-6-ebf4b9a5e916@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250313-qcs615-v5-mm-cc-v6-6-ebf4b9a5e916@quicinc.com>

On Thu, Mar 13, 2025 at 12:29:43PM +0530, Taniya Das wrote:
 +
> +  '#reset-cells':
> +    const: 1
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - '#clock-cells'
> +  - '#reset-cells'
> +  - '#power-domain-cells'
> +

I don't get why this binding is different than others and you do not
reference qcom,gcc.yaml? Is it not applicable here? Other gpucc do
reference.


Best regards,
Krzysztof


