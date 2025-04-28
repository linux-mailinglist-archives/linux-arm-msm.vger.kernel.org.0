Return-Path: <linux-arm-msm+bounces-55867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D84A9EA07
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 09:52:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CC7E3AA5B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 07:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC49D22CBFD;
	Mon, 28 Apr 2025 07:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d5uzH0QI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E134409;
	Mon, 28 Apr 2025 07:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745826762; cv=none; b=F5NQ8lX+CRnAfjToRkyh1WnmQIQtMsIdhvmDl41ZQxk5cS7LK6oaSw049ZNfaIHvLdmChaM6ubcM5s9C6ObWegMQw7637r/ixCoBojU8OIHBJkdk2mhv9hj5jB+UziRnnJXShongsVz5p9d90odtuXcS2//bKZkm/urEaAwNB5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745826762; c=relaxed/simple;
	bh=0S4nS2pn24Cs3yXHhThWDLIKyoW+O5rQ5XbUuvSuwPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tdhSI+fPRLIvuDWZZDFUMHs6+hZm61xNk/vtPuCZ+wIx1SJ2GV91Yyzqw4hIWm1qoh7eJrQbAN2caLKNdiz/clpFP+3NZHrwn0C9ln81hDWRdIFDkZmITzWZOY7fpJNHCxY4h1PGgFi3+5BUPMfuF67L2PCjqzFth5cd+avMbf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d5uzH0QI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC883C4CEE4;
	Mon, 28 Apr 2025 07:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745826762;
	bh=0S4nS2pn24Cs3yXHhThWDLIKyoW+O5rQ5XbUuvSuwPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d5uzH0QIitjDD0xySL+fHTjRsbMWRsti0CtC+lY/CIUaFpZ3+dl+M68pI+DY6dams
	 XWdi0oqq0EkGYjcuOP+SNiB4ojIk7rSzxcOfFv9WWj9pgsAh8hPdBRuEb97wSyK2Mf
	 OuiPKGSuZPjWt9KeA25z3mm5YctUT/xQTa5fl3n1XCxW4+YQdo4L3CjzooMFXXf5ar
	 8NDtd2xw9wDzfPgCaHk+eXJzVABlo0bv94hdxHhvLU7f3CdVNrYj7XhdGO8MUqm2sw
	 bXE5gGzbdgPBCaX/OgnKsiRZzCxl4AWo3uHXhPuzzrayL2Nd7AYNC4Du3ymfyHVN/N
	 /w19gkuUtA38w==
Date: Mon, 28 Apr 2025 09:52:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, kernel@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] dt-bindings: soc: qcom: add qcom,qcs615-imem
 compatible
Message-ID: <20250428-dexterous-hairy-spaniel-bdf0fc@kuoka>
References: <20250423-add_qcs615_remoteproc_support-v1-0-a94fe8799f14@quicinc.com>
 <20250423-add_qcs615_remoteproc_support-v1-2-a94fe8799f14@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250423-add_qcs615_remoteproc_support-v1-2-a94fe8799f14@quicinc.com>

On Wed, Apr 23, 2025 at 05:17:38PM GMT, Lijuan Gao wrote:
> Document qcom,qcs615-imem compatible. It has a child node for debugging
> purposes.
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


