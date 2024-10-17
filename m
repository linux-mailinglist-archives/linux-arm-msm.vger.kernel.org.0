Return-Path: <linux-arm-msm+bounces-34705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA9E9A1D2D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 10:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 602181C212EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 08:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C3081D27BA;
	Thu, 17 Oct 2024 08:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eTX6GnHE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501CA1D2200;
	Thu, 17 Oct 2024 08:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729153769; cv=none; b=j5vv/AXiR5mP/xhxCJy+3qCxxPPoD8QImmOVKkILcMT8wXWYFKDb27LR9UnCYtct9pE1NpKQV/6Gix97Rm2N4ijowkkW9Wt8DeJfWH453ZVYI7aeeq81AQ71T6jPWaKpIuivDnr3t6H7p8DagxBbHxQTfV84s9EocD/ihHdZWGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729153769; c=relaxed/simple;
	bh=M+/XrHY4LUdQvprB3NDCFEVmvOF5skkVES1svfVrtOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ShnNofzYRlAzu7z4qYG+109EzZ7wTJKLHSGva625O9tYbQnA9r+v6ipwKANNBKDdvMzcVNv+Re+Rw7Iz6JZBOIIFoujqzYnGbNuj8c4mT9CPcHCRncH5V8umKLGyUCtiPe7j/KoelG8NF7grLg3y92WhAm7Cm0mTZjLmecBaw+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eTX6GnHE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE6F9C4CEC3;
	Thu, 17 Oct 2024 08:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729153768;
	bh=M+/XrHY4LUdQvprB3NDCFEVmvOF5skkVES1svfVrtOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eTX6GnHEGtkCPxlUORUfk6J4IcWCBcum5OJaddlPAxNpx9JtKctMCwS9qGzCq0tE3
	 ogOokShvEx+qy6bU5UWlw+mWaE83H2GdBgj8ryDfNuWNZVjI9UmIhxhYWhdcdusXIA
	 eAT3JG3clVFhQAKUlusf2GN38UuP3QO9qxHoT+Cz0uL7fEnFMlRTFANKXYMktG6MI/
	 ep8HSyhIyH/YPDj9HVIpuGHSHEd26S+eozxhyIyIr7+NxykmY6XwLswsvVfz7+JnRS
	 V000m0pEe8Lzt556yzjhlh+cV18lcdAXWAwqxbvGJhwdUk11ECxPx+g44ynKTVOIgz
	 7QGspQR6VDK6A==
Date: Thu, 17 Oct 2024 10:29:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, quic_srichara@quicinc.com, 
	quic_varada@quicinc.com
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom,ids: add SoC ID for
 IPQ5424/IPQ5404
Message-ID: <hqi3vzsega63x6ac5adctgvgfbr427qgjuzhjci7awnvev26kv@z66mtob5yyjd>
References: <20241016151528.2893599-1-quic_mmanikan@quicinc.com>
 <20241016151528.2893599-2-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241016151528.2893599-2-quic_mmanikan@quicinc.com>

On Wed, Oct 16, 2024 at 08:45:26PM +0530, Manikanta Mylavarapu wrote:
> Add the ID for Qualcomm IPQ5424/IPQ5404 SoC.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
>  include/dt-bindings/arm/qcom,ids.h | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


