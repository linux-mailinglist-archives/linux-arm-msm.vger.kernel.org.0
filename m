Return-Path: <linux-arm-msm+bounces-23796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72042913E4C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 23:02:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27DBC280FEC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 21:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E08184116;
	Sun, 23 Jun 2024 21:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CbnNhFqy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C4E65C;
	Sun, 23 Jun 2024 21:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719176543; cv=none; b=r2EO4kCNjZYo1KNvicHdtwDB4tKyV8fT2cURuljON0l1VN/22yvAdUPLaal4A1y2Qqj+vOsf7SPok9Q3CHnPFwtxzodr2CdwrjqQ5QCCFLmhGmnr2SQyoDMAnUNZiM1ozQ/gBCqbj0WOQ8E2wn/AuqYJo3R1eQNUDjSKf4nehjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719176543; c=relaxed/simple;
	bh=4KLu7gpjn9dKVkS3LE5kBhJOf2GxObRCgQ1szgrBYWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y7GSbpqy6ljdlC1/jeZ9fuGTQYrCwuahwAwK0N5BseU6ZPupbRDqT70CjAaTumF/piY22HsMhcVmJRc1W/A3GMEiBlJCG8CbzXySrqnPBpGDvi/XDCXry48U9EI3onQRapZ2GNdzhotct/cm5U1GJQ3ihy00vztTZ/zzwJcYdPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CbnNhFqy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EDC7C2BD10;
	Sun, 23 Jun 2024 21:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719176543;
	bh=4KLu7gpjn9dKVkS3LE5kBhJOf2GxObRCgQ1szgrBYWU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CbnNhFqyHnmgA9swmVruMhlkpHmrO+NYLAJr9SINzOSc6snoCCJIijYdOjWfX3Ekn
	 j4VOR6s3L07lWR1Eg3JAB7e3n7kAypgWhXT308aal8Ltq9CVJFqZWOzH2ZdXVZYRij
	 5Nl7k71ULpVCjOrlUCEr6toTcJk+6jxFD6+QRaSr/zWSeqS+l19urtoxHg6VTNppXl
	 td+BaAInzsAUUhoEM7XMvkN7x+7eHpr0WJKfGChydfjqCLmj6GTAIlKSN+iDcVnNcq
	 AA213XBMf1z7b721/3zwcsqDGB2KR2Had/u1Mw23pRTeOgRoXUqCTMA4zuu8sD90wa
	 Br+PwRv4FPmBw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rajendra Nayak <quic_rjendra@quicinc.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: x1e80100: Enable tsens and thermal zone nodes
Date: Sun, 23 Jun 2024 16:02:14 -0500
Message-ID: <171917653478.4580.11870072360400428064.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240621-x1e80100-dts-thermal-v3-1-abd6f416b609@linaro.org>
References: <20240621-x1e80100-dts-thermal-v3-1-abd6f416b609@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 21 Jun 2024 10:20:06 +0300, Abel Vesa wrote:
> Add tsens and thermal zones nodes for x1e80100 SoC.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100: Enable tsens and thermal zone nodes
      commit: 4e915987ff5b91ea531e716367373ff4442d9614

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

