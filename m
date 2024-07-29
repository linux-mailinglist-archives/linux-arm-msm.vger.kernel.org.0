Return-Path: <linux-arm-msm+bounces-27177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 043BA93EC42
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 06:02:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 333471C21871
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 04:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD6413C679;
	Mon, 29 Jul 2024 03:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kt+bzZAe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9B713C667;
	Mon, 29 Jul 2024 03:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722225536; cv=none; b=ItmEVbSCBGg5UumWFbcSZ2vRKTv+b0K2mWcEC0YYRvO6q2C2DG3NCE81pDLolINmSIdqq+Kb/wkU2YvAs2Jkz892KIWZxkfdFnHLUx94J/WcQSIuGSEhmuiZQgS4LCUZdztY2rFJvtPulyk0KHTtD+/DBgs/AGkSRdeOss1q5R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722225536; c=relaxed/simple;
	bh=QscZF30ZT2xD4BpA/tys9gM3SwBdSoRymJqB8+v5mIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MDjBjzeDgUYqv1tnFb07D9GWrCzL2oi49pmITOfSVaj4BIMbIMh26+6Gm+d1vX7wVgOqOsei71K/g6gDHRjx2/M+v38DuvYKzd182/PPW+dXc4hISbKwS5Zav/Z9QlDb3NUs5go3mIFzPAN2BiFMKXR9TAn/FdB+4OOlw82QlwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kt+bzZAe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A351C4AF0B;
	Mon, 29 Jul 2024 03:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722225536;
	bh=QscZF30ZT2xD4BpA/tys9gM3SwBdSoRymJqB8+v5mIw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kt+bzZAeq23uM4w/dM2bMpJEKjyn+9mp5dzAF5nrPKYCeSd7JdVhT4j61jQ06VG5F
	 CFYYJRil6kccOVjmsrLE/ZPInPzdBOcQwP3/3kJDceoGI7SDBc7sT7iWe/oleVirlN
	 /KmLzdSw05e+9YRO8nBQ0zk9J0UpMDPnceipFTr+GmPiOSn3IVrO3rmUna1dieT6cY
	 o1BE/Z9rPUyoqj9oOy1H3j48RL2U52ggpY/pW+Gnh2uM4GWRccBfcPoAjPv4/TV1Yp
	 T+cCXbffPSX7HnXhKjtH5zHPuhOu20YmFlGqzpL5GWInF9x2488bsLEoagio0bRrXx
	 1AM/+WxwfbsNQ==
From: Bjorn Andersson <andersson@kernel.org>
To: konrad.dybcio@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ahalaney@redhat.com,
	manivannan.sadhasivam@linaro.org,
	Qingqing Zhou <quic_qqzhou@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: sa8775p: Mark APPS and PCIe SMMUs as DMA coherent
Date: Sun, 28 Jul 2024 22:58:21 -0500
Message-ID: <172222551301.175430.11110704968158737905.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240725072117.22425-1-quic_qqzhou@quicinc.com>
References: <20240725072117.22425-1-quic_qqzhou@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 25 Jul 2024 12:51:17 +0530, Qingqing Zhou wrote:
> The SMMUs on sa8775p are cache-coherent. GPU SMMU is marked as such,
> mark the APPS and PCIe ones as well.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sa8775p: Mark APPS and PCIe SMMUs as DMA coherent
      commit: 421688265d7f5d3ff4211982e7231765378bb64f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

