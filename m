Return-Path: <linux-arm-msm+bounces-51484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F332A61B9A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 21:05:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59DD6882228
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 20:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECFCD20F09F;
	Fri, 14 Mar 2025 20:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G/rKXAmK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C016720DD54;
	Fri, 14 Mar 2025 20:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741982505; cv=none; b=rnCZ6oTJALdgd6tOfk7zI6rwx2e58KqFnPcprADngMfILeOjBN0aahidvUpeZ8AmyWG1mK+kn3duYjMkjxHI2U85/g58iMT1Tg3pxujW8gjDf5YY2UJ4wzkhNoQpoIWc/Wpx4KBk8JivlGv866zboEO38CAFo0ZdifUGe2HyFYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741982505; c=relaxed/simple;
	bh=7ubbXRHCO0QerupphO7BCUzEl3DWF0nyQBr820z0clE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VGwzdGAux7TCG95jH7e4u83wFCkgVxbk0AVXwMu3Pvgp94xzYQzQys/PnozqXlRCw1d5f+dTc3fdC+7vRSwKDPmCht3Nn/iRRJuJGt2LBzcnMUqd396/KZJRlrowgcytXn9QSS7YMBpOEtuf4F7iNqHJ/eH6H08CGHH/0vXMpEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G/rKXAmK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41995C4CEEF;
	Fri, 14 Mar 2025 20:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982504;
	bh=7ubbXRHCO0QerupphO7BCUzEl3DWF0nyQBr820z0clE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G/rKXAmKgv6TQGb9OWHD2UH28PyekIRJfD13yA1qMMWGsm+I26C7iU/Y9SNHBa9bt
	 ofvbXmdOQM8gow/cGhhta2daWQkwCeUOm9EhpA0212Rqm6EcPKcN6eq/apWZSE30PA
	 bgNoOd1D4pxXPJU4JT9aghQE/oPbkU77z0sAcVDYPrm2nWpPpsN0jgzehU+1uGaQH6
	 xXe3Vs8Xsn5Iwsws0f+gljlrp+ZPa2D9h9YczKtIaAO680NbgoqJsPJzkpzEwIQbpz
	 TxbX/XxWTeLjfsn0rpG92WBMc2pSR0ItmAI/8L3ZIYYvlhxYeYUMDUs4YTHN2PGous
	 cSr9tMFtEVIlA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jens Reidel <adrian@mainlining.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: qcm6490-fairphone-fp5: Add touchscreen node
Date: Fri, 14 Mar 2025 15:00:58 -0500
Message-ID: <174198247900.1604753.10000458299596411188.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312-fp5-touchscreen-v2-1-4bed270e0065@fairphone.com>
References: <20250312-fp5-touchscreen-v2-1-4bed270e0065@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 12 Mar 2025 12:14:59 +0100, Luca Weiss wrote:
> Add a node for the GT9897 touchscreen found on this smartphone connected
> via SPI.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcm6490-fairphone-fp5: Add touchscreen node
      commit: 6c6d55f41c1b54b16d35f16c02fe99cc0ad019e0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

