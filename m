Return-Path: <linux-arm-msm+bounces-36966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8EA9BB959
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 16:47:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27EEFB230CE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 15:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 873E61BE86A;
	Mon,  4 Nov 2024 15:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hVmran2L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CC913D246;
	Mon,  4 Nov 2024 15:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730735256; cv=none; b=AEx2CO9a8MUpeh3bGVLoPhT976MQCjYViPUkC8P/uHU/DlSTGQylqYRXo0LJN/nKOl8JW96QU1WoiEORvkEttycQaqkHBkrzqeWQPGfY4cBipOK7tosuL3fGgaU6de6vuouO9SRScrb9tVol8epWd+/06BUnrB8vG8hfWgBsOx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730735256; c=relaxed/simple;
	bh=thCjFnNDPilh94gVyOhCKzVXMSGdfN2FgGarlKfx91U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F34VdVWaD0NbGCU4DS5Y/4WC3G1Vr8GCD1juMaLJjww0GzDOmHvXONozXMxJ1R7878FeNtJa+EP3TriU8r20S/aFFiP/9y1xwhPZK85r09SPHNIbmNI7CqMtHNO3Dc6+PpFjzRSCO2p75yZBbq9FsXmFhXADy+4+PG8dNsd2Al0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hVmran2L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B13BCC4CECE;
	Mon,  4 Nov 2024 15:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730735255;
	bh=thCjFnNDPilh94gVyOhCKzVXMSGdfN2FgGarlKfx91U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hVmran2Lb0MC3j0jbuh7IiZSvCSx2oUjTLOShp9l7mY3Gm3NNPsWVmDxX6bsR9xeh
	 bnWRB4Yfa9b42e6FwM9qWPmIJbod44dFIn529DW97Y0d0Y6AmMklSwhR270YhPNVpg
	 G7o7tSjVwvqBIhKPgsIQqGPEOYkdRw9fmt46n4Mf5FoGHY3R7MMR7s1NjmwQEXDcWO
	 608mNNQrlkBztgNI7160NhdyYVXsRBdA+8qIgn8o1WgZtrkE1c/wOnWhkr0vyC0nF4
	 I+o0m75a9c9buHv00I9gU/C8qVxK+vC9IfPDYUJ7a3vHPcIfI8nNiYkuvdKyYehjeU
	 SF6DLNPJTDQ9Q==
Date: Mon, 4 Nov 2024 09:47:33 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Melody Olvera <quic_molvera@quicinc.com>, linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	devicetree@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,sm8550-pas: Add SM8750 ADSP
Message-ID: <173073525333.217463.16399518132776024798.robh@kernel.org>
References: <20241101170309.382782-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101170309.382782-1-krzysztof.kozlowski@linaro.org>


On Fri, 01 Nov 2024 18:03:09 +0100, Krzysztof Kozlowski wrote:
> Document compatible for Qualcomm SM8750 SoC ADSP PAS which looks fully
> compatible with SM8550 variant.  The only difference from bindings point
> of view is one more interrupt ("shutdown-ack").  Marking devices as
> compatible, using SM8550 ADSP PAS fallback, requires changing some of
> the conditionals in "if:then:" to "contains".
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Cc: Melody Olvera <quic_molvera@quicinc.com>
> Cc: Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/remoteproc/qcom,sm8550-pas.yaml  | 48 +++++++++++++------
>  1 file changed, 34 insertions(+), 14 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


