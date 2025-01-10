Return-Path: <linux-arm-msm+bounces-44759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46566A09697
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 17:01:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51975166103
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 16:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF880211A04;
	Fri, 10 Jan 2025 16:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k5rV6QeI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE18820551F;
	Fri, 10 Jan 2025 16:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736524894; cv=none; b=XNjf4yDoUS1hjnCQq40ZnQuyT17JPmEZMlc3U3HF/r706rUyGa6TBoIrjqI88PhWEly2205aQ2/SvJTUsodIp4mSnqtKirMfV3DcxYa5RKd/SuF5p8acrNyWVD1A3jGXNx9AHA+21TsvNXhqRXt1eJRl2qlNHVTaHzV2WWDKpyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736524894; c=relaxed/simple;
	bh=qwdMN8BKirpP2oUeyawD9XexI+vErL5D+CkcO8cUzFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X59P4op5Ea4T2XHJahR90Qn0xy3UMFxhn1MON/FaRFVK6MW8KmMG3QWkM5UW6FDnCbA+TG36jUsaRDYUavzaXvH1XyT6MGDFPshq26CQtKNm1OEfwm24/Q+8WhQ0IGIrUVwwPlXxD1JFVJgZ1CZ/2ALrLpNOyFAFR9gYJomwdto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k5rV6QeI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED3C9C4CEE1;
	Fri, 10 Jan 2025 16:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736524894;
	bh=qwdMN8BKirpP2oUeyawD9XexI+vErL5D+CkcO8cUzFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k5rV6QeIXI/56DKy2z+Jb6M2c8NGoKARK6vDL3Ymuyw+qNZ23kN+GfW97+FMmvJa9
	 8Sp9WyC6i/9cqVTdlolK0LxM1le1BW3w1JmX9BSKfNYlw00lE2eG/oEFWrWqhWxm/6
	 LdASPhJWGl7zpWNRcMOXzg7zwVqLKMmYgmoAMUgcf9u0wyLt6WHRFKsbbpPu5gBVhq
	 hzSSOMj4fZOhDpX9Wzn8eRdUcMiV1YiLVHUvGl6VTKi5PGD0VyjjK/UBHanb8uoz2n
	 hoQc7U6tPmphLTry/a3FN1fjz0xGmROxayCymwHZivnXUXZd5hcNa/KAYN+NdU6+V+
	 6rMMRkV1faViQ==
Date: Fri, 10 Jan 2025 10:01:33 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,sm6115-pas: Use
 recommended MBN firmware format in DTS example
Message-ID: <173652489265.2943940.6262633134663779863.robh@kernel.org>
References: <20250108120221.156131-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108120221.156131-1-krzysztof.kozlowski@linaro.org>


On Wed, 08 Jan 2025 13:02:21 +0100, Krzysztof Kozlowski wrote:
> All Qualcomm firmwares uploaded to linux-firmware are in MBN format,
> instead of split MDT.  No functional changes, just correct the DTS
> example so people will not rely on unaccepted files.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml         | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


