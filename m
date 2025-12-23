Return-Path: <linux-arm-msm+bounces-86287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 518D5CD8495
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 07:47:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 40A6230022E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 06:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D52542EF662;
	Tue, 23 Dec 2025 06:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EuA6tAxK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A5527979A;
	Tue, 23 Dec 2025 06:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766472427; cv=none; b=C7afSmIcs3Mu6MJ/AprHD4Wa9MGaD/vjR1wlzdkHKNhvZe/MBt6ROLy8XwJKuSBBSOEHXlfk+JmHeC+jO1P7dAzJRbAZuYDVaKrMQcpyfO1HYQVH5Vux7UdFngfjyUpY2rvsgQ7mp4yRhhqGbKiJtzQr/06nY8UsNKr8sHfVWA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766472427; c=relaxed/simple;
	bh=nhBsodCYCNjfJDFONZZNFMpNGKaAo5F/ZHJ+Gw+FvYI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QyrR3GFT5M5aeRBQ2NOIO56OygaTeirhZbw0G30PJDFjmI4uXUYPSp6kmOa1UvcnFYIIE2G/hvzOcXRzrS59M8ZFxNuBNg/ifEjijpD1QpGpJf0UikdM+Su8lnOHJg+5NrVAzLSnreyZE8gj/fyN0LGNetP1j31qfHz+j7xoT7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EuA6tAxK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90395C116B1;
	Tue, 23 Dec 2025 06:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766472427;
	bh=nhBsodCYCNjfJDFONZZNFMpNGKaAo5F/ZHJ+Gw+FvYI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EuA6tAxK68CLJ7T0kYYFJWH4S9CnLMRDChaFw0xHVquAX2cpBJxDZY+FB+aZXdOxd
	 Lu0VrXBKQQTDtpF1hx/qE6RpfOQn/XCEOlbWH8WFIHwi5rnLQzakvAxl/FJ/7pkW2/
	 6dBj/2Y5KEW5oGQYTM15ygFFVzYXLrrDKpHmB/g0s/05WIGk1/deQJEHEZeIo00sIw
	 TBPkkzuXpJcvuQnEPHdKdRKLCirfzlvIuhfUtd7/furegN3E0BuL5ODYfdran025BN
	 K3/m7s324TpV6QTk6YQzbiDzZQL0yn3h0QabyqPji0MQCLL67TKzPTTqWIjdmJy1cy
	 0s8lPwpQHpVlw==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
 Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20251105-knp-audio-v2-v4-1-ae0953f02b44@oss.qualcomm.com>
References: <20251105-knp-audio-v2-v4-1-ae0953f02b44@oss.qualcomm.com>
Subject: Re: [PATCH v4] dt-bindings: soundwire: qcom: Add SoundWire v2.2.0
 compatible
Message-Id: <176647242421.660744.1350236126775409321.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 12:17:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 05 Nov 2025 17:49:10 +0530, Prasad Kumpatla wrote:
> Add qcom,soundwire-v2.2.0 to the list of supported Qualcomm
> SoundWire controller versions. This version falls back to
> qcom,soundwire-v2.0.0 if not explicitly handled by the driver.
> 
> 

Applied, thanks!

[1/1] dt-bindings: soundwire: qcom: Add SoundWire v2.2.0 compatible
      commit: ef8405a4f8ca9b15743d024ce00b99480ce173ea

Best regards,
-- 
~Vinod



