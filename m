Return-Path: <linux-arm-msm+bounces-30466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4FD9694EA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 09:13:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2DC9CB22CF6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 07:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898421D6C53;
	Tue,  3 Sep 2024 07:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U0Vg1I9k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB4619C562;
	Tue,  3 Sep 2024 07:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725347507; cv=none; b=IirQ9xPRAWFNY2gk0QRdVuMrwF4XZnMQOwZ7cisehNe1TH/DRy78m7wmJubGeSbWBPXsEyC9+Q4de9jZ72pxylPAGCPD5ERhLDqmRxDeQ61wj5VX4updenNGKbMF5xiwTLMPO5hIGn6kaE5ampTUJaFV1SJaxgNiNSlB4O9Mt+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725347507; c=relaxed/simple;
	bh=NcSd7SwUWMz+zvlXyj7hOgR7KXDNu+Sd5ZkM1LyARqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/+8g9FyN2KJi5MtN+VgBIKbIAP/IRAkR3DzhdcvZP6dNopRyUTX9BwJJnRKIJg3ElVrDAONtcUEAtmERwD6WF1FLquKRe628/zoDyT5eude2XMvMqNeB7T0o6OxR5JGJCQLhktTJZ0lPk8MakrxXYVZZz5Rm5TRxbth2QvDc4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U0Vg1I9k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5124C4CEC8;
	Tue,  3 Sep 2024 07:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725347506;
	bh=NcSd7SwUWMz+zvlXyj7hOgR7KXDNu+Sd5ZkM1LyARqo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U0Vg1I9kYKltPiD58C5TJnVGIS4TdqQZJX5IHbbPXpxbdTpViwYWC2iGI6583JNE3
	 pRF97TUxbGN/7CcifGgvwokSx26bk5ssF5lOVAsprjzPN8RhPWVYcMRztx/wjgLbDo
	 vIXsblK8jedCOLjNs5VupU2dO6+pNq3mmTrUxsXJ4oIoums2uGIUKSRJBFOHrllhJl
	 XaLtNsWvbLLrj03+2vaj/jgy1QTrPeyAlYGiu3uHlVxBXMrxxGOOdwWWAESDLRe7kF
	 6aRhv3/5enrjb4UYA6S9XSaooeMbhmR5v1SUMogx52C5PK2Xhs0s19vLuXAa+clp4a
	 yRslPewev86Yg==
Date: Tue, 3 Sep 2024 09:11:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: cache: qcom,llcc: Document the QCS8300
 LLCC
Message-ID: <ibitsxiudq5rt2t4izami7uayrr24kgge5gxvx6hjedv5hwlgr@dxwdb7z543oc>
References: <20240903-qcs8300_llcc_driver-v1-0-228659bdf067@quicinc.com>
 <20240903-qcs8300_llcc_driver-v1-2-228659bdf067@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240903-qcs8300_llcc_driver-v1-2-228659bdf067@quicinc.com>

On Tue, Sep 03, 2024 at 02:21:30PM +0800, Jingyi Wang wrote:
> Document the Last Level Cache Controller on QCS8300 platform.
> 
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> ---
>  Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Although this looks incomplete, considering you need other properties
for your variant.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


