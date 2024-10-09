Return-Path: <linux-arm-msm+bounces-33740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6A7997782
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 23:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 272271C21A3D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 21:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 329FA1E1311;
	Wed,  9 Oct 2024 21:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fKX0jZfw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F247317A583;
	Wed,  9 Oct 2024 21:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728509478; cv=none; b=VPAKmrkWVkefwFPzId7KhBkDEL7yzhS+EbnYoKpJA5DXnKKSsuqiP0P5eeJcoO0zGw1RQEmphSHw4jCXdk11rWIFf84Zj1E+6HH2LLvlI7p+7NqQ3HXsLRDzfe7+MH1rXO6picCtZrNjlt7UJ+wno1YiLbZjR2xxk9udIhYc/yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728509478; c=relaxed/simple;
	bh=CDmpHt4cVnqH2CMq/UZ5gellTMhqUaoAikzncUK3EyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jH8Cl0GCRbq+YYfd1c625iNRKaXvwYq+qAntQJWJ/KACIovJl7YDG2/D3z/H+7Hp+FXBmoPngodvglAorTFZ32Jw+Jjrlq+hkg7YTHnVqnlQBsjqBe40tB/S+y4g1U+ijRtWUrcUYFE78nTTd0yMZQ5HfXzqks4Lglo713eA9Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fKX0jZfw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66189C4CECE;
	Wed,  9 Oct 2024 21:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728509477;
	bh=CDmpHt4cVnqH2CMq/UZ5gellTMhqUaoAikzncUK3EyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fKX0jZfwvEI6+/cfTuvHWPCQAu78JEr7r5kIJ4yyqhLTQ7LaaFd9jUJXNkNrHOA4k
	 SyGb7YOqnaNCSY+RLxmLt8aCxiRLPfqIQOg96gZgw3zfTRhiS+Docl21mdJ5i/+vHN
	 j5sMy+WJlODGqoaQnrHmjzkLbTgMGUCiDraZ2L56wm+Rbu9HMALs1iC2PXVIJRwP8Z
	 dXFOnBwVrUgiQbalOfaurxuGZeM2ms7C5ZbKolb7JMj4+Wc13YBKUw48Ts7pNBZPKD
	 8ttlmj52TAKy9EERvJ7K8AKpWAZoUSeH+L6NIiDbxmzdFRP/vz5GSMhxixpJHA+/tu
	 6B4r5v11Tf70w==
Date: Wed, 9 Oct 2024 16:31:16 -0500
From: Rob Herring <robh@kernel.org>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mantas Pucka <mantas@8devices.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org, quic_ppratap@quicinc.com,
	quic_jackp@quicinc.com
Subject: Re: [PATCH 1/4] dt-bindings: usb: qcom,dwc3: Add QCS8300 to USB DWC3
 bindings
Message-ID: <20241009213116.GA740340-robh@kernel.org>
References: <20241009195348.2649368-1-quic_kriskura@quicinc.com>
 <20241009195348.2649368-2-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009195348.2649368-2-quic_kriskura@quicinc.com>

On Thu, Oct 10, 2024 at 01:23:45AM +0530, Krishna Kurapati wrote:
> Update dt-bindings to add QCS8300 to USB DWC3 controller list.
> The second controller of QCS8300 is High speed only capable and
> doesn't have ss_phy_irq.
> 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Rob Herring (Arm) <robh@kernel.org>

