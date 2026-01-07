Return-Path: <linux-arm-msm+bounces-87797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6E9CFC633
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 08:36:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E13873010288
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 07:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF9F22256F;
	Wed,  7 Jan 2026 07:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hsg6TQFj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8931F1D6AA;
	Wed,  7 Jan 2026 07:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767771132; cv=none; b=Nh+Vhv/fLs1g/03zBc39u2zL9OiAhpx1Xfg4phL2u0uVqDDiQwsQcEEuMBgAEtkwlemR78GPlvMvE3C7UL7rXElz7OFb6/AoS3gc38Y1c3BGSeKrztKksapRKIkrZLTAKTpYBIOzoPV5mZk4cxKIVFJf9TxI5m/bF995gP1NoJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767771132; c=relaxed/simple;
	bh=Me1MQB8p4vt4d18ujl8lzsSIszAY2TFC1Bnkr0Wan3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cf8qMQSexHWb3qMvIbfdzo5yozN4SdiSmFECKy2u9j8HYgSam6nbOmrpsLEWb0E86Q5yCwX3t5dHPF68uvVIeydRaRi6UXCnBRnh7mB3v/zb7F9V19JODqw5oxwWCjW2lTRiSo//hEJAe6ykuZT8kbWB9u+Ic15QeGabjI+uhvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hsg6TQFj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D7FFC4CEF7;
	Wed,  7 Jan 2026 07:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767771132;
	bh=Me1MQB8p4vt4d18ujl8lzsSIszAY2TFC1Bnkr0Wan3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hsg6TQFj/oUMayh4cZF+X9LT4XX5vFPzNYkQ8uHoaj39fYWJRqgnU1482zomDZYa4
	 UeHkKvgYOzeFywDLUN6mK45KpYDfdzC8sguox8VQHdUBnss9poY5+9YW2vw9EHFjgi
	 Jc67gR0og5u5BXtAAoOt1npPV+U9lbXB3qTW7qoVCiFYzAoZN4/4/RVc72VP6q24hD
	 vY0DglecAbJH77Yep1c72HyrTZ9kYOXWhZIeQLdjoDlMhWE+oW4en8IwVM7/ABkgB2
	 ruaShzbqiZKCdNU1r3A3+yt5kMpu1i7VHXc3tFmN8nSmuLP+vuU65T5JfSesq+zfkp
	 zOQGwZuQKCIlg==
Date: Wed, 7 Jan 2026 08:32:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org, 
	quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>, George Moussalem <george.moussalem@outlook.com>
Subject: Re: [PATCH v9 2/6] dt-bindings: remoteproc: qcom: document hexagon
 based WCSS secure PIL
Message-ID: <20260107-sticky-gopher-of-weather-f2b369@quoll>
References: <20260106105412.3529898-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260106105412.3529898-3-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260106105412.3529898-3-varadarajan.narayanan@oss.qualcomm.com>

On Tue, Jan 06, 2026 at 04:24:08PM +0530, Varadarajan Narayanan wrote:
> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> 
> Add new binding document for hexagon based WCSS secure PIL remoteproc.
> IPQ5018, IPQ5332 and IPQ9574 follow secure PIL remoteproc.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> [ Dropped ipq5424 support ]
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


