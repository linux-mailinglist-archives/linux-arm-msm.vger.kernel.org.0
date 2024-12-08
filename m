Return-Path: <linux-arm-msm+bounces-40926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E399E86D6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 18:02:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BB7218814D0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 17:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB51715ECDF;
	Sun,  8 Dec 2024 17:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VmCNVXhV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13EB14F102;
	Sun,  8 Dec 2024 17:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733677371; cv=none; b=amas4ZqmpGAooxO2/htODg8BRWqz1Qx9rq+TsDUpomQytMevd47iBGEO5QDK/hI+lm66GCEPiL9T2nJWsV6qf7w5wj/EHCuzmr/WIuR6Ot3zgZkuRXbqUiZQfadOYLrynd3w28XKToiMe9sGmuPbO7Yv6x74S+3WaWNj3ydwx+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733677371; c=relaxed/simple;
	bh=HCHmFGhqgwiw+/GQHlPW56J6axCw7STGcQpRvYj2W3w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NhdjD4Nbh51+cUOOvRxgiHdd8I1lTBEIKFxglCk91c+S62QWJUbdNExVN/AZoUpGaUoG+Te6RJSX7uc3N1IMM9s6zBerxTcfvhV4nwvPZdt9CDJ7zw6LPBcS7eH65XeZ0CoO7nThNc0C0KCKw7HHpjjynF+lTYZiv/gN+xgg1X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VmCNVXhV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50046C4CEDD;
	Sun,  8 Dec 2024 17:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733677371;
	bh=HCHmFGhqgwiw+/GQHlPW56J6axCw7STGcQpRvYj2W3w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VmCNVXhVyAuGESKLdZYpRnoiBVbx8uUR7z2HN0Taja3QoXPvanJ+R9dgLHpQfT9t9
	 f11/8V0csqwELM5/x6LacT21ffpxnjsd7/mQiJqIog8Od37BQGQhurOfTAds5TKUUl
	 SErXJUCFRZ5Y8q4QCL6OtNFxnY8urDxVYILGicA5x1dDItWnI9EBP9qZoWGe3Deyw3
	 AiaGab+8AsXM2vj9RCN7seMvGnXRv5UrFXJyIOBO7ylEQhU7VyGmd9oO8SSLfXAxBK
	 e08yPoxK2+xujhmjiQFTkgLW8OSS2nhwWg3R9HEbNAyljkctlR/I7cQvz54JNbdpv5
	 JT1Dc9PThP6dQ==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, robh+dt@kernel.org, manivannan.sadhasivam@linaro.org, 
 bhelgaas@google.com, kw@linux.com, lpieralisi@kernel.org, 
 quic_qianyu@quicinc.com, conor+dt@kernel.org, neil.armstrong@linaro.org, 
 andersson@kernel.org, konradybcio@kernel.org, 
 Ziyue Zhang <quic_ziyuzhan@quicinc.com>
Cc: quic_tsoni@quicinc.com, quic_shashim@quicinc.com, 
 quic_kaushalk@quicinc.com, quic_tdas@quicinc.com, quic_tingweiz@quicinc.com, 
 quic_aiquny@quicinc.com, kernel@quicinc.com, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Krishna chaitanya chundru <quic_krichai@quicinc.com>
In-Reply-To: <20241122023314.1616353-1-quic_ziyuzhan@quicinc.com>
References: <20241122023314.1616353-1-quic_ziyuzhan@quicinc.com>
Subject: Re: (subset) [PATCH v2 0/6] pci: qcom: Add QCS615 PCIe support
Message-Id: <173367736385.1042266.3592021837823660516.b4-ty@kernel.org>
Date: Sun, 08 Dec 2024 22:32:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 22 Nov 2024 10:33:08 +0800, Ziyue Zhang wrote:
> This series adds document, phy, configs support for PCIe in QCS615.
> The series depend on the following devicetree and smmu.
> 
> Base DT:
> https://lore.kernel.org/all/20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com/
> 
> APPS SMMU:
> https://lore.kernel.org/all/20241105032107.9552-1-quic_qqzhou@quicinc.com/
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Document the QCS615 QMP PCIe PHY Gen3 x1
      commit: 1e889f2bd8373229ce48be5860b8383e75393e13
[2/6] phy: qcom: qmp: Add phy register and clk setting for QCS615 PCIe
      commit: 21364b0fe378646fa301f29f714140a1f465561b

Best regards,
-- 
~Vinod



