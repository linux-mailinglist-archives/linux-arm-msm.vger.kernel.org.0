Return-Path: <linux-arm-msm+bounces-67265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2165B175A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 19:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD6643A96D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 17:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FE6423B620;
	Thu, 31 Jul 2025 17:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PmuK0P+h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CB513D51E;
	Thu, 31 Jul 2025 17:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753983224; cv=none; b=ji1zq7lalaLfZUqwT0usx1TpBSwxA9QiFuY8Y7aYEA5GLUD+XusjjXxahOVOldBZ3P5u6mqMuXoc05YtFiP0yqQh0x1Nlc0DM553kOqWdT7z3jl0wjfwbYtXg6JF0EiScBfIZUig0Pu74Gu+BhZeoUQN4oHuyF2cSVTUINhBzLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753983224; c=relaxed/simple;
	bh=YpXL7/8GOse0WRrHbRbLwnHhzr/SJuXbjAbKjP89ejc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=un/pDMfc2BEHTnSMVDiY5pI4sIe/RdB/5WxtuBOicBwXPr4I0JPcn1N2gBvEk4BbgkYQXTPMqFHabWJmsDmWdGZzEISqJ+UawwzxlE6DYnI3A3YiPCzDZ1BYy9oKKqwRm4pKq5GH2IlpzMH6w/raURhZ8V7TIGQCMHnlkFb/oA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PmuK0P+h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BD2FC4CEEF;
	Thu, 31 Jul 2025 17:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753983223;
	bh=YpXL7/8GOse0WRrHbRbLwnHhzr/SJuXbjAbKjP89ejc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PmuK0P+hFZvzZQIemNxk6g/Riuin+GhD3f5hSjkCZGRHlb4yEXmVkiXD9yZBeH9IY
	 dIR0vEcBDVavvgS9ikaff81T/d9zWN9Y5LLsfZJxSzSZsdGCJSf2Y6NNsiewiRG+cq
	 CJ+yekRuapgLaBqZagLQoQ/x1T+vMne2kjRHGqLGrxUM/JXw+3LPVFJ2YpHRydPf3T
	 kIadzkQhPS5CnsmkgzLSdLCjYOndP27/sKuvf8PgmYPoYfuJeQD6KOugqA3Tsoj3Iy
	 E8evpHuNcg+WOXMOBuz6LzCD70t2nZT8teQ1b+7IQa9tnU1c9t2Gta1s9BwUe4/2N5
	 1Cbf1UesDm+fw==
Date: Thu, 31 Jul 2025 12:33:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-msm@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Avri Altman <avri.altman@wdc.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-scsi@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>, devicetree@vger.kernel.org,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-kernel@vger.kernel.org,
	Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: ufs: qcom: Split SC7180 and similar
Message-ID: <175398322200.2266729.9650159522825473337.robh@kernel.org>
References: <20250731-dt-bindings-ufs-qcom-v2-0-53bb634bf95a@linaro.org>
 <20250731-dt-bindings-ufs-qcom-v2-2-53bb634bf95a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250731-dt-bindings-ufs-qcom-v2-2-53bb634bf95a@linaro.org>


On Thu, 31 Jul 2025 09:15:53 +0200, Krzysztof Kozlowski wrote:
> The binding for Qualcomm SoC UFS controllers grew and it will grow
> further.  Split SC7180 and several other devices which:
> 1. Do not reference ICE as IO address space, but as a phandle,
> 2. Have same order of clocks (SC7180 has one clock less than SC7280 and
>    other variants in split binding).
> 
> The split allows easier review and maintenance of the binding.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml | 167 +++++++++++++++++++++
>  .../devicetree/bindings/ufs/qcom,ufs.yaml          | 104 +++++--------
>  2 files changed, 202 insertions(+), 69 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


