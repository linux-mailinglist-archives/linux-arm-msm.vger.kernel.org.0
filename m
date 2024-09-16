Return-Path: <linux-arm-msm+bounces-31839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F80697A4BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 17:02:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 481D828FFA5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 15:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE9A11591FC;
	Mon, 16 Sep 2024 15:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A4Wdqfok"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545FD158DC1;
	Mon, 16 Sep 2024 15:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726498868; cv=none; b=YM9DP7jAVY7tF9mXAC/PGVbRwg0vlGlOI3nFhh6UCRrhIATF5A1MEISwlsCvVdp2TdXDofJ+V/M1UCOq63eWeV+CayGSpCUl5afUAEqHe8eypRpePrzD9yw4mlJFId5Pd2IqacM52zVxKTQu90xRkGd9gzwpwGqfIdixGSNOVIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726498868; c=relaxed/simple;
	bh=s8GNz6yq4x6llzuvN75IwgJtEQqGUgBW3FvNeeZyizM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/rrxpEcy/rl1w4hpbCUgogyV62jZ4KRdurkFl45w78anAocceYtu2765A7OBkw7KiazSB7DpqYvhGjNF0gT6VEmwvBzP8YS/5gXE+GptRNo+PXnvgk0oqFzYG/xvcfZKwf+bakUBj+pZeE1wGXTCVwBcJG0WW3gxZBMhSpMM4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A4Wdqfok; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0814C4CEC4;
	Mon, 16 Sep 2024 15:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726498867;
	bh=s8GNz6yq4x6llzuvN75IwgJtEQqGUgBW3FvNeeZyizM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A4Wdqfok42vkqCSzxBQAZpGStYdzgNhbPxcl9CT1Tc/2JytfjrJCSmZRMvOdc3zMN
	 x0t+wqr9lY+TKgR2pp5jk7VTEv6Z/Dz01/m4kX4Lv4u7E+7OurQ18Scx88h6CjIZtA
	 LzBAZPEZZ2Inr3wThQc7dlmb4aKnpuNEVF/tNBSUMHWCDJZvUiMFlIbePgupLNp/o+
	 PSTjTIUB4CfVxmzAKBc6vYj8Zx9AU9jLAniun9g/kRfgkmkQ5l4aNAxENIVj27Jw+h
	 Zpq12qLyeRRzmXo88WYb7SznnIKtSZFmevv4ycml8mb9GT5J8+2SnuGRR8+sJ5NChL
	 ND8i+fph69ccg==
Date: Mon, 16 Sep 2024 17:01:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, quic_tengfan@quicinc.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, quic_tingweiz@quicinc.com, 
	quic_aiquny@quicinc.com
Subject: Re: [PATCH v2] dt-bindings: mfd: qcom,tcsr: Add compatible for
 QCS8300
Message-ID: <7xagsq4uxzl7l37a424bbzyv75dsesdgnxolowpqwwz7mbrtnc@uhs5t7q35l3y>
References: <20240911-qcs8300_tcsr_binding-v2-1-66eb5336b8d1@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240911-qcs8300_tcsr_binding-v2-1-66eb5336b8d1@quicinc.com>

On Wed, Sep 11, 2024 at 03:44:25PM +0800, Jingyi Wang wrote:
> Document the qcom,qcs8300-tcsr compatible, tcsr will provide various
> control and status functions for their peripherals.
> 
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> ---
> Changes in v2:
> - decoupled from the original series.
> - Link to v1: https://lore.kernel.org/r/20240904-qcs8300_initial_dtsi-v1-0-d0ea9afdc007@quicinc.com
> ---
>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


