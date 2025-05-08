Return-Path: <linux-arm-msm+bounces-57244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20342AAF9AB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 14:20:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 975974C3DFC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 12:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5870D22173D;
	Thu,  8 May 2025 12:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gTfEhYpf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9C7136A;
	Thu,  8 May 2025 12:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746706842; cv=none; b=AAN4PSwvny4xTJY2F7bwejJYVCtqZbL1EI2lDs76z4+cC0r2gYok6/BzzrvjiOAZ9kSu4u+v07P0Wi0R3b0fWqVS78096MGOGAUxBP4s6Ej9rvZ1L2QvoR6Hcf55REy1m7OMQdP2QlAjj6WTulNLxDm2Rg88FjJTj38y69ENSO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746706842; c=relaxed/simple;
	bh=jStuEGl1AI28cwqNnsX1wNCPdcM0C6jQhveYa2VC1ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gek8oLPBYUwTjnTmUSEpPXCmmUXBjmar8S5o1guNZaxjOaiwmGepCqhqT8xi5YxGeWJ2sdv6YiBdN2IeIFfc1caVU8lwvg6+SHuUgKXBWGVIgZmxFfVQZE9t9zoaBwmyxRnNYYxSSoWtudbnsEe1jQwo6z5iAFeFGcIAAquoj7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gTfEhYpf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 933C5C4CEE7;
	Thu,  8 May 2025 12:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746706841;
	bh=jStuEGl1AI28cwqNnsX1wNCPdcM0C6jQhveYa2VC1ok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gTfEhYpfnSt2HnvR7QlQEi6JGzde7YqgQybZkZ8uDw0xnZLPhk12KiBTrn/Nn+PMu
	 1e2qMl9AH3/BYo4lcItR2/aT8QSCgS1JfgROd8pKbuawGNfxurebu8MDvEmhsE8lZF
	 2U9fycOuqylLkNBa1mexSvsB8UI31xHB6GyAtdRwVLYOaU64RsyF580B42NTDX0Pg1
	 Zqy6F0drGPbkhMmfTViTC2OUneqbP3FiGa8sQSwJzqf3nvqbas69ywkVr1KlxUOCUn
	 skWT6MTwhme2BCp+gH8YgbLajWfDc1JDlVL4kFymQtULj6//MbV3wn9LWf+F/cezXe
	 Ln8emFfBQXFXw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uD0Ew-000000003fn-2BI5;
	Thu, 08 May 2025 14:20:39 +0200
Date: Thu, 8 May 2025 14:20:38 +0200
From: Johan Hovold <johan@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com,
	konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, quic_rgottimu@quicinc.com,
	quic_kshivnan@quicinc.com, conor+dt@kernel.org,
	quic_nkela@quicinc.com, quic_psodagud@quicinc.com,
	abel.vesa@linaro.org
Subject: Re: [PATCH V7 0/2] qcom: x1e80100: Enable CPUFreq
Message-ID: <aByhln4CpobzSz3s@hovoldconsulting.com>
References: <20241030130840.2890904-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030130840.2890904-1-quic_sibis@quicinc.com>

Hi Sibi and Bjorn,

On Wed, Oct 30, 2024 at 06:38:38PM +0530, Sibi Sankar wrote:
> This series enables CPUFreq support on the X1E SoC using the SCMI perf
> protocol. This was originally part of the RFC: firmware: arm_scmi:
> Qualcomm Vendor Protocol [1]. I've split it up so that this part can
> land earlier. Warnings Introduced by the series are fixed by [2]

With the SCMI perf quirk for the Qualcomm firmware merged for 6.16, we
can now finally get this one merged.

There appears to be a trivial conflict due to a context change (the new
watchdog node) however.

Can you fix that up when applying, Bjorn, or do you want Sibi to send a
v8?

Johan

