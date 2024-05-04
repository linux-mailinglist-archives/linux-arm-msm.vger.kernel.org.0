Return-Path: <linux-arm-msm+bounces-19206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E948BBB18
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 May 2024 14:15:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0864282C3B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 May 2024 12:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA5ED20DCB;
	Sat,  4 May 2024 12:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NNk+jcmV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6741097B;
	Sat,  4 May 2024 12:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714824884; cv=none; b=uRKo9WY4siiTpDmMmHIoiwk6uAqWXG2/z69PrN3ll1KEqcPb1y1dU7r//KYRLG4hsg6yqXlZHn7jc7K+UU9ZdXsUHtt/9Q4IWV132v2WENlW55CIJXl67fQyUlMUiAlypE/VlQbZifC9Msb9WkPEIM3x5cPIb53sy/SuuZ/WAi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714824884; c=relaxed/simple;
	bh=BZotsts8Ss6E1tlPRELTAGgjW4d8FiJLqjJwmNAqcXk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=I07tctYY8XC50HbbpIsdiHwfN3xL9sPzlcKYFAi9Tysaq5uU+i8oGIChwv3P7RCNAuKcOpP1clNmDEqU8vSqFguKkgxLc63zjw/U7ILq/2+zKeb3U+e1CrpvojoF2KQSDpahRHTc2Xh9VM7WXI77SL6SuvSmCf/4G5Pi2HXgL74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NNk+jcmV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF4B7C4AF1B;
	Sat,  4 May 2024 12:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714824884;
	bh=BZotsts8Ss6E1tlPRELTAGgjW4d8FiJLqjJwmNAqcXk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NNk+jcmVQkDZTPk1YRdRT+geY1ICaBO5k+04TSF+tAwbvZtvKOyk9+aOpJcb7enN0
	 X/QSa13d/5bzrGns9N10z7n2T5mwNbg1ZqIaKTLRyGrwLXeuuvovoWgZQdVAqLM3Lf
	 bfXW3vpO/lgkIlLa2DRlTZgL/EhQ0sKvMs5L4mhx2AkPuyX/a+gfVI6K2fJPrmYA22
	 q3CVOj4/rWKUj7SsZXS4hg4g9ZzFzwtxRt5VRWVcY11bItjtvlBrGEJ+TGcxXz9Vpw
	 bXadFx7fGjkcDkQs+kCetVW73sU2zKt1i9/gfr7hT8e1olN74poWtXsKp8mI+zGYCH
	 hCoHjD+Uol9VA==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Adrien Thierry <athierry@redhat.com>, Mantas Pucka <mantas@8devices.com>, 
 Abel Vesa <abel.vesa@linaro.org>, Komal Bajaj <quic_kbajaj@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, quic_ppratap@quicinc.com, 
 Jack Pham <quic_jackp@quicinc.com>, 
 Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
In-Reply-To: <20240502082017.13777-1-quic_kbajaj@quicinc.com>
References: <20240502082017.13777-1-quic_kbajaj@quicinc.com>
Subject: Re: (subset) [PATCH v3 0/4] Add USB Support on Qualcomm's
 QDU/QRU1000 Platform
Message-Id: <171482487453.28322.6906999225104918671.b4-ty@kernel.org>
Date: Sat, 04 May 2024 17:44:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 02 May 2024 13:50:13 +0530, Komal Bajaj wrote:
> This series adds support of USB3 PHY support for Qualcomm's QDU/QRU1000 Platform.
> 
> ---------
> Changes in v3:
> * Rebased on linux-next
> * Link to v2: https://lore.kernel.org/linux-arm-msm/20240319090729.14674-1-quic_kbajaj@quicinc.com/
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: phy: qcom,usb-snps-femto-v2: Add bindings for QDU1000
      commit: fbd3b6fe36242562bcd70464cfa8ee0fb26882d6
[2/4] dt-bindings: phy: qcom,qmp-usb: Add QDU1000 USB3 PHY
      commit: f75a4b3a6efccfc879d078cc9b5c21ef8a8dc392
[4/4] phy: qcpm-qmp-usb: Add support for QDU1000/QRU1000
      commit: 495341664af1d9ab4bb5a71f3ffcb08659cf8fa7

Best regards,
-- 
~Vinod



