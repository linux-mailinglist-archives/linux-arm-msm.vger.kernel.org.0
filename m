Return-Path: <linux-arm-msm+bounces-87380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F40EECF23D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 08:40:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 622FA3000E8D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 07:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 085812D24B7;
	Mon,  5 Jan 2026 07:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DfmW3yBd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFFB254B18;
	Mon,  5 Jan 2026 07:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767598805; cv=none; b=bH0M6h0x4PzI4ATWHr+NdaPCbRtqYYNU0Qafvy4foBUCLkgE9DbwRNsDj4QEDt/kNpXhdpG2FYhkPXkH+7BoOsUBNjhxCoh3gW8g0uY1ZpTk2ren/dFhOejI9rEtc28EnCI3v+fbLxZkdX5v1pdIcVAVe2JAgkq7FEECmUP0Jq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767598805; c=relaxed/simple;
	bh=PpycFFVo6d67uW2ow6i4VxbFkB3D1IT1U43lxSm7wyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BBAnGsEpa6dHU+PqkTYP/ZncuVB6vByXJ/oRVtfoIQk3Xv8Nb94itGuEoKQJTwAUXSXMM+YMZgjf9p45kPdu4Mhz9cE6g3WCr97gXHsHFyarQP6PvnIFrFQYbeV1SrMOsZeA5tou3SUZGJFtsy2cdFcYfUy954nbPZdubScBMpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DfmW3yBd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CED5CC116D0;
	Mon,  5 Jan 2026 07:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767598805;
	bh=PpycFFVo6d67uW2ow6i4VxbFkB3D1IT1U43lxSm7wyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DfmW3yBdeIvQmgnN9TGVTTvCcg6+b7eQPcT9mmTXwQwhcKULc796jY5y+eIP8bWOt
	 6C9mojhFOdZAwLjTHhogh1yN1so+rHLXmiHkzUdHTdcY3C15EvvtfekHuVpJtjNXe1
	 zhl6tFaF5zV9Xi0otmT67DWcXX+tJSjZB1Z9W/xA9xyvW+ufyg+JJxh0RHw/Xedmfu
	 yaVFroXhPQ//dt2vaHxaoDZESfv5PZqgtVaaEzg7pVvMeMQKWaTFqetLv99lhEVqzp
	 AaiRASeY6QQxNEEhFVTTA0g7+Pn5Uj/ESaqWJEVnGXt2quDm19rGdOtArk+LmPXMPm
	 ADBHHiu28L8cg==
Date: Mon, 5 Jan 2026 08:40:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	robdclark@gmail.com, dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run, 
	marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org, 
	krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com
Subject: Re: [PATCH v5 2/5] dt-bindings: msm: dsi-controller-main: document
 the QCS8300 DSI CTRL
Message-ID: <20260105-enchanted-overjoyed-caracal-1c8ff4@quoll>
References: <20260104134442.732876-1-quic_amakhija@quicinc.com>
 <20260104134442.732876-3-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260104134442.732876-3-quic_amakhija@quicinc.com>

On Sun, Jan 04, 2026 at 07:14:39PM +0530, Ayushi Makhija wrote:
> QCS8300 MDSS DSI controller reuses the same IP as SA8775P, with
> identical register layout and programming model. Introduce a
> QCS8300-specific compatible with a fallback to
> `qcom,sa8775p-dsi-ctrl` to reflect this hardware reuse.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


