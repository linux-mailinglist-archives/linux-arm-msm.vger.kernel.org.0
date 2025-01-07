Return-Path: <linux-arm-msm+bounces-44188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A28B0A046C7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 17:42:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3140B3A5244
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 16:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A44E21F8F07;
	Tue,  7 Jan 2025 16:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tztzvl/Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BCF1F8EFF;
	Tue,  7 Jan 2025 16:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736267964; cv=none; b=KhcuTX6xohZ77/y30IE/N9XQgJzlQwzKumiJ5kP4bQlD8AgGEenK9/T+d90UL1CoDm9GWHK2asV5KDv1G8OUqKv8ndR6mcsvJJz+IOQGYX4EI/DxPjQE1zOWWqYL5kTQ2Cm0OzYepfzfCFIHgD5BFC4LL6x3XZKJP5aa/kMEEVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736267964; c=relaxed/simple;
	bh=nb261taPhq9tJlNvKdwNjXQzAa9kn/E2j1tLHE44bVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fKiKX4nkZaOakdN5Z1x6ArGdMdpXIm0LIeh++8hdravyeLp2Zh7xrJE0qH9Ig7SvwXgCHnvWms8QX58yQPPtMj3mEewCdAFAgyRhWMQpzRK1adVIJmwSP5CQHIao/mZ2qwgaraJlb0ZZn++C1utRRx5rJQP1838NNnm+hI9iuwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tztzvl/Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34EFFC4CEDD;
	Tue,  7 Jan 2025 16:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736267963;
	bh=nb261taPhq9tJlNvKdwNjXQzAa9kn/E2j1tLHE44bVg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tztzvl/YFy1SepCcDWgSScdWhYPAQB9UT+EeWxZ4jJyYRkvRIGaPUqqm+iSuUh0iZ
	 rSXXTq4NnKK/rpQNi1ja756HECFQDEMC01HIfd2B9+HRV8CmhWiGT/VkCYyWOlJGx+
	 B8a2dft3VDEx6moVfYyAz8MdsPwFSOJzd4Ho3nZEXZDDxTkL7ptshEQLzHTJAMDFag
	 o9PnkU4uLuF//Zpi22e+dS3ISSZkxt7hES4Fy6DwieGI5kroabNOOvRKY7Iy4o/bRA
	 5s4tEvTepfAb7y8MPwIIXr5/HLGpKgqgDNCNLUPZq3310YUcdBx/3L62IO6HMNiy23
	 wGsHMHTP1e6vg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wasim Nazir <quic_wasimn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@quicinc.com
Subject: Re: (subset) [PATCH v5 0/6] arm64: qcom: Add support for QCS9075 boards
Date: Tue,  7 Jan 2025 10:38:52 -0600
Message-ID: <173626793396.69400.2542176338027658175.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
References: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 29 Dec 2024 20:53:26 +0530, Wasim Nazir wrote:
> This series:
> 
> Add support for Qualcomm's rb8, ride/ride-r3 boards using QCS9075 SoC.
> 
> QCS9075 is compatible IoT-industrial grade variant of SA8775p SoC.
> Unlike QCS9100, it doesn't have safety monitoring feature of
> Safety-Island(SAIL) subsystem, which affects thermal management.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: arm: qcom,ids: add SoC ID for QCS9075
      commit: cee3947b1aed42f71f99ce4e5d1410ee8670621a
[2/6] soc: qcom: socinfo: add QCS9075 SoC ID
      commit: 7b115b623545650407e3f262ee9cdd8a778a9fdf

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

