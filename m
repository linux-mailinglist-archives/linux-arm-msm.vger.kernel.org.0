Return-Path: <linux-arm-msm+bounces-29706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB4E961F8F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 08:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50EB31C239AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 06:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97724155A3C;
	Wed, 28 Aug 2024 06:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KufCsqgx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA9514D29D;
	Wed, 28 Aug 2024 06:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724825950; cv=none; b=I5GoR5QbQHePbcHBK6u86l1cMJG0EpDqScc04FnMRXODJE/7YH113prlqK0xK5tltil7+Cq7gHPIOdqtxojvBABSGmrYT8RXAeWfs1C/UCbgybHE94o78/20VFxLdLxSvpUtciQnraKaPVs5K9u0BsKJmyBXEe8wbJ2XcGkPwL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724825950; c=relaxed/simple;
	bh=gk6trbFLOOK8GDI4cGc8rOtPHbBQotgfLDzBXprlBmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LlgnMpsckdIt7Uh/9IwTuF1feYlT9WNu/qnmcruSgJKgFpzn3LA7U8PLIR29WSxAiqDMc/bSfp99q1X7k2rEUyEw5fk61eGFyz4yTnb0eiNMIDXZ55nfH7Ge8xzbJf1Ws9qzC37EuDAyEb2q15vfsQRtFnZLCyqA+o+cGkoqgpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KufCsqgx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B4D5C4AF1D;
	Wed, 28 Aug 2024 06:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724825950;
	bh=gk6trbFLOOK8GDI4cGc8rOtPHbBQotgfLDzBXprlBmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KufCsqgxClWzSa1TA52rYYQavJoCyiGwt/ZD6oUzONuy2/wYMK+BTacRsRNb4Dd1Q
	 SwOw6dIB69mNekXi2AYDDVZr4pHlOBj3AmXM6Ujrki5eQ2zpZFn/BNiJVdPJXmcBYt
	 nfAeDEW29xNX0vIirmGIJTNuHHnwI52uyKm+8Ub4Jv743vGhn4TkgOtyOCr4s0theU
	 SmFQvwxQRqOyOy/NuqXavgccUTBiKgwwCNrPblYcA2c/6Rh3lIPb6DtcnjH/gaWwB4
	 UaxX77B3FKtDwdUGock/NPBE0JM4uzPag3txwhpE28CvjW9vN5SAyi1WpR7/bUjb/E
	 QmpqJVZRMabqQ==
Date: Wed, 28 Aug 2024 08:19:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, kernel@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: qcom,pdc: document QCS615 Power Domain
 Controller
Message-ID: <x5s5l237mlsg4gojgxczy3n5xxwz4sp4fkfnzy6efppnheqzfl@bazl4yp4bfhy>
References: <20240828-add_initial_support_for_qcs615-v1-0-5599869ea10f@quicinc.com>
 <20240828-add_initial_support_for_qcs615-v1-1-5599869ea10f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240828-add_initial_support_for_qcs615-v1-1-5599869ea10f@quicinc.com>

On Wed, Aug 28, 2024 at 10:02:11AM +0800, Lijuan Gao wrote:
> Add a compatible for the Power Domain Controller on QCS615 platforms.
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


