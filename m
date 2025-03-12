Return-Path: <linux-arm-msm+bounces-51136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE988A5DBCC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 12:44:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E397168FFF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 11:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CD4D23E23F;
	Wed, 12 Mar 2025 11:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="js4LyqX0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E403125B9;
	Wed, 12 Mar 2025 11:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741779849; cv=none; b=IM7u/jwjTmyPQlYOL78iAKU+ehwPjhtdLQDK0k2zhfTF59cR+Gg5F47KnZwIIK/ixV2bhB87G7VN59gvuFkfPwR2XF6tFQ3K0cOfYeZVILG451J1aT7vTUKlsVBa02pIPLdxRZr5X7ftbskJT5xF78a1BYiKpI61a5ceMAQJ1k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741779849; c=relaxed/simple;
	bh=B18CTvQcu21pnDR6n1C3QEbb6mim38vwVC0D3qW5SIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gumRr5KYokSQ0BT/te9MIACuf/zCWxRzrVvtoajkmwqzPifYiVm3pcFy/HpIKQ0axf7J+Ivw7AaV8imcSef6laxBp3mZoj5cEgp38YqQEROzGa17JnAcTiyXvXmlgYn1PtyPNK97iWtCIYk3YbJnzZtn53GIh1e2WuiWOyfc0zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=js4LyqX0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 734A3C4CEE3;
	Wed, 12 Mar 2025 11:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741779848;
	bh=B18CTvQcu21pnDR6n1C3QEbb6mim38vwVC0D3qW5SIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=js4LyqX0c4zGgiDIyD04joWIuoW0Jr10byBvUWdFkfwjiFoKECWGef4oeGLm0zwHT
	 A/xkZ0wYp6JOgtcLRmc6gs0WuIFK3B4w/XdgJSbiOfmEH+tBqk/jHAOQWL14/oumcN
	 BDsbmoput5gNSii4QRJ2KaC8Qd7DFbQNeg0lLft1gt1Ag9XpJY/2hDpDAEWlKqlhzD
	 0+BzZcCgh76nyEthdmfUmW1ruv80dHAWFtokp2x1vt0tinBgmTta3x1l03fi3lFcvC
	 3c05nosXUdEividUj+nnIOleNwNCYZWUJ5Y/gLPP1r05HhON60zJ8ljgrHRmSbA1tC
	 GRTRvNEBi0C4Q==
Date: Wed, 12 Mar 2025 12:44:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run, 
	marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org, 
	krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	quic_abhinavk@quicinc.com, quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com, 
	quic_jesszhan@quicinc.com
Subject: Re: [PATCH v2 01/10] dt-bindings: display: msm-dsi-phy-7nm: document
 the SA8775P DSI PHY
Message-ID: <20250312-debonair-unbiased-mouflon-7e3ba4@krzk-bin>
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
 <20250311122445.3597100-2-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250311122445.3597100-2-quic_amakhija@quicinc.com>

On Tue, Mar 11, 2025 at 05:54:36PM +0530, Ayushi Makhija wrote:
> Document the DSI PHY on the SA8775P Platform.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


