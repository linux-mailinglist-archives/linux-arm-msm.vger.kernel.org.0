Return-Path: <linux-arm-msm+bounces-79709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C48C21255
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 17:24:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58C081A25DF7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 16:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C78213678A8;
	Thu, 30 Oct 2025 16:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VkwzKzv5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE143678A3;
	Thu, 30 Oct 2025 16:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761841361; cv=none; b=axizeBpSnHiBvogA1mWfyZeQ+DSP21hzPuS7qVrNiMybKCXFuqz0P9Sc8kyOP5XRoApYUbxaRni9TBD9xknbz904kHSTHwp3Ye7rOsrX6Dc6thcm5K5GNW68nab+/L3v9NxnWQIo9OZgIXP4azZnOjVzN53Kbdzk4UPn0ASwPLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761841361; c=relaxed/simple;
	bh=L5z6jlHkcpP9cvdw41Qbbk+N1H8oSP3YINCm0jFWMgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mLtIHgwBQeBZvXekSdAUou62l7mNTKcoBJ1D9082LKpsddkkXUpMDiOKPUVZtaYjgWMVEroofARthuX+UdS7IqXDvCHnvFuiiW/W4ujOSEDGHkuzmPyRjKhl9bQ61ds6Ad8bmJ9v0f/iEbM/JOxRcnCX6V6lSHgniqswqKJ6f2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VkwzKzv5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A691C4CEFF;
	Thu, 30 Oct 2025 16:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761841361;
	bh=L5z6jlHkcpP9cvdw41Qbbk+N1H8oSP3YINCm0jFWMgI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VkwzKzv57TSDcgncR8ecZIapJ5iltIEHsrbMefxtSqiqxQjGBKOrT32RJoel1gHbP
	 5B1Vd5UOk9vh8XyHpTfxoF7RaPLd+/jGoUfjEAiZttncYz2PeAJWwEd2/aiPShC3c7
	 ppvtwH+Fb4nd9Kn/bjuKy8tKhXSygvtnhu17zpS+EvLOFQb5ZNYhOtcCzXsi+sW9jE
	 saS6GHcbaYopGslGXUBqDqOkWupUL14oNuyTFxNLPsz0ValJpQSR/AG4BO4+bptjMI
	 KPO4efNh2e18t0Ao25cL/te2HPZH+seH+73+x2x0/7MiYu+QCzMQ27Owb/c/r3xlEe
	 icLmFOvAGmdug==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fange Zhang <fange.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	xiangxu.yin@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com,
	Li Liu <li.liu@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v8 0/2] Add display support for QCS615 platform
Date: Thu, 30 Oct 2025 11:25:34 -0500
Message-ID: <176184154244.475875.14579349859707097278.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903-add-display-support-for-qcs615-platform-v8-0-7971c05d1262@oss.qualcomm.com>
References: <20250903-add-display-support-for-qcs615-platform-v8-0-7971c05d1262@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 03 Sep 2025 18:49:27 +0800, Fange Zhang wrote:
> 1.Add MDSS & DPU support for QCS615
> 2.Add DSI support for QCS615
> 
> QCS615 platform supports DisplayPort, and this feature will be added in a future patch
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: Add display support for QCS615
      commit: bf9f0bb2ec478926c50769ad0df363719d5d2302
[2/2] arm64: dts: qcom: Add display support for QCS615 RIDE board
      commit: 0b4bbf0514fce4acf34676dd107c01dba7f96c33

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

