Return-Path: <linux-arm-msm+bounces-31841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C35E97A4DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 17:10:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEB301C211FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 15:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3679158536;
	Mon, 16 Sep 2024 15:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rahRTUur"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C838D158218;
	Mon, 16 Sep 2024 15:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726499427; cv=none; b=VARgMyAsv9TcMisCpfcfe1MGSOGyO5KcNmmSYaZpElrci4CsxeVFW9Pyd6fTbChjit5VeAozwEUVmhJ9KsS1y+uLE2ApMizIIpCd2n62kB0f785CgAMUnk7LUHGXcIYE2+0/WDV2R7YL96OYK8fiIKdHCZG3ZTTyfNcqcpU7wq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726499427; c=relaxed/simple;
	bh=WnvM22ulRIo2veggKNyEz6XzwCPrfl9sBdBAqw2PfTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CP83Lbb1vovRv3gXZLDV1sEpkE/DU+6xIz4qvoK4n20Ww6RywuWnCvk2zPbURNdvcxxxaPna04eCjoztFezB+CFNSW8bJW/ReU2yF6gr/WLVjzUSz3hffhihT5Dr9bn+1m6JOoEcu9TLDnghuGO18ZU30+lQHLOPQNwZgtAZd4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rahRTUur; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E17F7C4CEC4;
	Mon, 16 Sep 2024 15:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726499427;
	bh=WnvM22ulRIo2veggKNyEz6XzwCPrfl9sBdBAqw2PfTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rahRTUurG874d1UKAmS4U60k7rmW++KsQuxWCxrVEavK/KhQ+kVwEKy6lGBtuPTA+
	 6RLuPPDJmCHBnw3cVe5r9wCE6uunjOsmD12YTLNvYTMkQAQUgYGUVOaCCjF0AZh6cK
	 +lBCgJn+PZAm3VpM2v+Z3vjnlfu0tUYCAEWknNbRXInH0i7Y4HJj4nMyWeP2Ox4pwt
	 B2khMMJM30nxv6wtlxV8FTlCpMoiVZ2d08/HOKFkmFIDeKcs/8ACZOO9vd+adq1v5r
	 +Lxcvbf20D/K44wsnng5VgT3sCmePOFXhJgCddUE+vUqaoq3NPmGKEehhyGP8XKJs0
	 iLZq8Q2U0Tr7w==
Date: Mon, 16 Sep 2024 17:10:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Robert Marko <robimarko@gmail.com>, quic_tengfan@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, quic_tingweiz@quicinc.com, 
	quic_aiquny@quicinc.com, Zhenhua Huang <quic_zhenhuah@quicinc.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: firmware: qcom,scm: document SCM on
 QCS8300 SoCs
Message-ID: <loqybuhzopj3hbnyeivqodmf3iet5dplb532g4zg2qtik5tx6u@dnb2jlfforjf>
References: <20240911-qcs8300_binding-v2-0-de8641b3eaa1@quicinc.com>
 <20240911-qcs8300_binding-v2-2-de8641b3eaa1@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240911-qcs8300_binding-v2-2-de8641b3eaa1@quicinc.com>

On Wed, Sep 11, 2024 at 04:03:16PM +0800, Jingyi Wang wrote:
> From: Zhenhua Huang <quic_zhenhuah@quicinc.com>
> 
> Document scm compatible for the Qualcomm QCS8300 SoC. It is an interface
> to communicate to the secure firmware.
> 
> Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


