Return-Path: <linux-arm-msm+bounces-57991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E82E3AB7790
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 23:04:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C60559E2948
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89DE8297107;
	Wed, 14 May 2025 21:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xn8lXw6I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DADB297102;
	Wed, 14 May 2025 21:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747256652; cv=none; b=LU+0I1tJgun37rJotZdrDUEMoEBvtEz8oxQrhw3WWJH63xKmbj+tA5UM8J3t8cdcfiB8zPDNheYZCqz9yU9pEJRUyrWEHWJNwzzuIZUkgXqkp8hptNRz1NzUPI7Rp19Y/UUs2wRGT3+aeotvtSPKK+K1lAHTVIoiDzkCUrwnSL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747256652; c=relaxed/simple;
	bh=ck1toqLhlVRgpEh9C2pB9VxQoo8io/jSk9ProbifXak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZyIedAbfLMlbGXcHO8vPs1TCoJQe9h0enAO6xhQZ+2d3yi7QMFv9oDfYbMC91dupfNtC0iabue77cuM5y63fChvlHoB+17CkZMVRANW4/kDetVKUv+Mn9cdxpcj3R8f5pBPf/diaTy6XKNL57MLJ1pVYEI9aST6HhtDazAqt37Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xn8lXw6I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE66CC4CEE3;
	Wed, 14 May 2025 21:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747256651;
	bh=ck1toqLhlVRgpEh9C2pB9VxQoo8io/jSk9ProbifXak=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xn8lXw6IeF0c3MQ1Ms5+/L0/NcooC3NpNRmuO6NYc05Y79pnAboVjCCAbqseiBZMm
	 2ikNejg9hxVvEBSuO6igS0THHD5K11bust0w6gkKvHUgXSqCXf2e6DrX4fO/IttLUv
	 rF73VQqftx4nKS+lqG2sTNx716Ekq5u6tyesi9RmazuStsI6fkEgFoh4XJ7N1tW34T
	 Th9jpv1JxKyANE+JYP35YOAJBUhWXdoKwCiGFTB6BeFjqjK7wUACMZi+2K9ByejLW9
	 ih5jpfW9cUdRmSS0MVXR0TaM+TSvkHe6R1SgDwsaTD654vo9uBi9GKdTc63xjI+gFJ
	 euPn8ZTGty37A==
From: Bjorn Andersson <andersson@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	George Moussalem <george.moussalem@outlook.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] Add the download mode support for IPQ5018
Date: Wed, 14 May 2025 22:03:45 +0100
Message-ID: <174725663047.90041.16492317619640781307.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512-ipq5018-syscon-v1-0-eb1ad2414c3c@outlook.com>
References: <20250512-ipq5018-syscon-v1-0-eb1ad2414c3c@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 12 May 2025 18:36:45 +0400, George Moussalem wrote:
> Enable support for download mode to collect the RAM dumps in case of
> system crashes, to perform post mortem analysis.
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: ipq5018: enable the download mode support
      commit: 43fefd6c71291b5793e7c4052b6e3e54d1d87715

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

