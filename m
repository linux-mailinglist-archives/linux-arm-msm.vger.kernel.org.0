Return-Path: <linux-arm-msm+bounces-35682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F5F9AE5BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 15:11:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 557D61C2221A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 13:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74F981D6DC9;
	Thu, 24 Oct 2024 13:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tFGvmb/h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7631CB9E5;
	Thu, 24 Oct 2024 13:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729775474; cv=none; b=PFfLLvrRDBjNL8iCgeJmiMCfJZpkzm0+Y7eVFOeOV8sMm05S+gXR6lsU4jRMzRWc9wQYKj5VD5JBK/N9iAquR/CSKIx/cjze0oOVDIUmnKb/I0LOLPUCbqfQ20AfaLeIhak0CyRkRMHLx1FZC6N0ycc89B8imBr8xoJS940NNZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729775474; c=relaxed/simple;
	bh=AI1/myMLo/KQjV1YPFWjAT9xvXbzGL5k7SGI9jX2yjE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NQxk1COo2PPsYz9wvr+dLNmV4QRunNvdM20SBO29Fe1smn1d0aKA5EV+qCJEwx57Sx1rVu8TC/KZ05Pd/LJjV849bTE6rGblx2EBZ3KdRav1gYF05KYdyl1wjObxNkFx4BySWfHpfh9cARfCRfv5sPHZbAB47aoe4CxCpDpOyPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tFGvmb/h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3E1BC4CEC7;
	Thu, 24 Oct 2024 13:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729775473;
	bh=AI1/myMLo/KQjV1YPFWjAT9xvXbzGL5k7SGI9jX2yjE=;
	h=From:To:Cc:Subject:Date:From;
	b=tFGvmb/ho14sHrd9GTr+sseYUW4KwayjwZzh2KARc2AChAI7mWOhc/ubSOdyI2voU
	 HPJkGBZXm1ydEUbxl73Z9zOKnDVAwbZw/lmTFB/U+19+nyeix03sMgZU8qWw7Vew0U
	 Rb9Ng4d60D2i1QHxIdtNkFAtiyJwbjn8OkVpVzNELR/TRgXKICnMT4QV17BU7302eH
	 IJ11QKUIdZxtGmn9/avo/TRR4Xy8XXDJwWyWzhi4Pjz9fgrwCBxWRf8qpHp//xqamO
	 R2bXX48ixJdHfSli5odvUBZlj8W4XqBi9ysNHacP2vJ6GPuPwwicvHOrKIwgHxRX0b
	 uA+41u3JL4CGA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1t3xcf-000000003Xo-23B5;
	Thu, 24 Oct 2024 15:11:29 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 0/2] arm64: dts: qcom: x1e80100: fix PCIe interconnects
Date: Thu, 24 Oct 2024 15:10:58 +0200
Message-ID: <20241024131101.13587-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fourth and fifth PCIe controllers on x1e80100 are connected to the
PCIe North ANoC.

Fix the corresponding interconnect properties so that the OS manages the
right paths.

These should go into 6.12-rc.

Johan


Johan Hovold (2):
  arm64: dts: qcom: x1e80100: fix PCIe4 interconnect
  arm64: dts: qcom: x1e80100: fix PCIe5 interconnect

 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.45.2


