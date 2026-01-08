Return-Path: <linux-arm-msm+bounces-88022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 764D6D0399A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 15:58:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C8513064609
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 14:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB7FF349AF4;
	Thu,  8 Jan 2026 08:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R/WPAav2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BEC342519;
	Thu,  8 Jan 2026 08:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767862308; cv=none; b=MQFGVdAnH0WNMGw8OpxQCn2OlhBX3X/nQHDhOOw8XZEIUeoqPaCU7RLmvqs7d6QLlGRIAC5j5CN0/XKWBgl1rOWT1vOpUDord4XtwYQcVSRvPHyB0qbnpenW+ApxsISv3/vEOBBGSI89PdmHsLoMhJvYA4V85muE6YWdrz65OU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767862308; c=relaxed/simple;
	bh=V7W+NQGt0vybJ+WuTB0cOraNUQuW+LI0LarzZ5orrxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hpDHQchhNLvy8wYgHndkVUgkYUwX+5SFqGYEdrnY7W4Bhq8ZHmPbYJAZ8yvZJpfUc1pFARBpmebCddhsIMmw5Agb5oMoFexwbmzf5X8LXu0QAdn9/1cNeN5V+3sbiRvcprFRN716AirPOR+84jqEROKvj84MBK8qRbgPk8jLG1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R/WPAav2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65027C16AAE;
	Thu,  8 Jan 2026 08:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767862307;
	bh=V7W+NQGt0vybJ+WuTB0cOraNUQuW+LI0LarzZ5orrxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R/WPAav2GiSwRoj2IBVdrMwpx6icanUFEkJUd76htnM5SlUxTNpPFtV6XQke21iKm
	 AlQ/GCJxi+IdUAAkqnoi/RR5+Z9yeJYBClSu0cGA5mLHVZn8uZZ076lOHxSOzXCrEj
	 VxCnO7LvYAX5BQAF6ZIrjZIvlIcHm1O06BVfzDI6ngBfXkJM/IuV9+/4frjJvD4E1J
	 Ltq7uY5FiAVeogXPgoX2pqguQYvVWdeRQ1GkG+fbzYBW+poZ5lIDqpz2ejQbnc+lr4
	 zqaN4sH6WzeqwbGmkPB7Yqmf3HsK/1yxtyW9ykH+xWu6Ghiq1NrHrzFHjSQYWbfsVt
	 5s01oP2sRtYRw==
Date: Thu, 8 Jan 2026 09:51:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	Ronak Raheja <ronak.raheja@oss.qualcomm.com>, Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: phy: qcom,m31-eusb2-phy: Document
 M31 eUSB2 PHY for Kaanapali
Message-ID: <20260108-paper-wolverine-of-agreement-c7dbcd@quoll>
References: <20260108052459.1819970-1-krishna.kurapati@oss.qualcomm.com>
 <20260108052459.1819970-3-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260108052459.1819970-3-krishna.kurapati@oss.qualcomm.com>

On Thu, Jan 08, 2026 at 10:54:59AM +0530, Krishna Kurapati wrote:
> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> 
> Document M31 eUSB2 PHY for Kaanapali which handles the USB2 path. Use
> fallback to indicate the compatibility of the M31 eUSB2 PHY on the
> Kaanapali with that on the SM8750.
> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


