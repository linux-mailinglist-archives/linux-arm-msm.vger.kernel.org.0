Return-Path: <linux-arm-msm+bounces-61661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8802ADE213
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 06:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B2E9189BFCC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 04:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1329A20C469;
	Wed, 18 Jun 2025 04:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WY03G3H3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DE120B215;
	Wed, 18 Jun 2025 04:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750219777; cv=none; b=oMvjaMlT2OppWNtbz7EJZWVymar0pwgQXubR9oepdZoiFa0D1sHm86vR+Wyu5wOX3zPqW/QCVq0YEUIou7pxAU56ijCxJnC5CGxyti5IBS3T3M6J9uAgUNrgXIwnj3EXhFNJy7B7PrTtLLyEsZzGqx+IvwXSnMmlqladHGe/5gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750219777; c=relaxed/simple;
	bh=FbX0KsLNRX1mvQ3/b/kZaLdoXsh6YjCCQZ6xh0EBC0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kspKXIZnpqE9/fURYbRYluhjI0gKWLfYpoy11Tpx1Gly8NZYYoN3joVY7LwENubr8xf5qjyeIirwLtGPUueInWnA63fbpTuh1l6KjPvyJR1JeZW9EE0rbi5G+dHWCrnUrNaQwfcZX90mAFZqErfyW56P2/3SdpdALCtkOebteHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WY03G3H3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1B0FC4CEE7;
	Wed, 18 Jun 2025 04:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750219776;
	bh=FbX0KsLNRX1mvQ3/b/kZaLdoXsh6YjCCQZ6xh0EBC0Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WY03G3H3Sqh47o3gGa4+hhHg2kgaqbO4no+y5kQ9kGom+ZkX3qXan+OiKMgVvPpSo
	 e/Y0ioNs/+K1v3mIvHH1YtVJta82Jz/PFrd6vHmqDcPpyTmM8fPBE6kVkQRedWM1t1
	 sET16XpO9Vd7FtEYEKvEwVgU6lyIpaZ5QsTG9fESxLKksVGKi81mHTp41ZWdchvAiL
	 Woh7nPztk1Z57lHfVqhDRtjGatQu6Bmsla04KRXd0JxMj+B9INFalxllWxvEhJdbca
	 G00PWV2UldSHThyIHZkG1MwoGbJs+Rs2RJfnfI4qyMpp8mTuYg9QH4z5kRouyghGKi
	 SHDwbV2d568Hg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jie Gan <quic_jiegan@quicinc.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
	Jinlong Mao <quic_jinlmao@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs615: disable the CTI device of the camera block
Date: Tue, 17 Jun 2025 23:09:20 -0500
Message-ID: <175021976649.732077.2642948736370987633.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611030003.3801-1-jie.gan@oss.qualcomm.com>
References: <20250611030003.3801-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 11 Jun 2025 11:00:03 +0800, Jie Gan wrote:
> Disable the CTI device of the camera block to prevent potential NoC errors
> during AMBA bus device matching.
> 
> The clocks for the Qualcomm Debug Subsystem (QDSS) are managed by aoss_qmp
> through a mailbox. However, the camera block resides outside the AP domain,
> meaning its QDSS clock cannot be controlled via aoss_qmp.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: qcs615: disable the CTI device of the camera block
      commit: 1b7fc8a281cae9e3176584558a4ac551ce0f777d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

