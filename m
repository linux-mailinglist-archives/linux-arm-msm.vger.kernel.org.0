Return-Path: <linux-arm-msm+bounces-68589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B598BB2192E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 01:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B97A91908635
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 23:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5AAC277CA5;
	Mon, 11 Aug 2025 23:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fyyK8F6z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3001E47CC;
	Mon, 11 Aug 2025 23:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754954841; cv=none; b=sMOQXCIr7PEhTeAJedRKuYIvXhtQ5DUR/0gPWFPyeGwQSai2UMlictmdWNQWRnyHDZRKRyhZjN4Rih8YiVx9PU6hZcUglRUf1s9ILNTBHjaA7QrtGUITpOofFptOpZXN41DnHa+Biku2iuXuWu8siNPN3WfqTqNHc3n3YQ/otro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754954841; c=relaxed/simple;
	bh=JtnkBjOI3c6sT/pkTXIRsDbnA6hXyfqYEaACOADNHFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hq7PEdyq2zeUmBVsnYRYkG8jcfwK7HdVkiysbIHCefnabQOmgSRRsE+RMddjMxLCiWP8zW/I5Uqy00drTLnzIIGipDWrK6odTc/x9wWRs15Vh6PGvlZXAq3NN8XAs8oJ9JKCQGWg+j9udFVjAGosLK/RPGypAmLkuRcqFnVliWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fyyK8F6z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABD65C4CEFB;
	Mon, 11 Aug 2025 23:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754954841;
	bh=JtnkBjOI3c6sT/pkTXIRsDbnA6hXyfqYEaACOADNHFY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fyyK8F6zSzhzb0NnuHUQBoumaapjNWoknLT4pqUlCHVnqpUkTcrHehEa1Pqm5U4+N
	 9uBgUgmj15GHjKp7Iv4u559Hqz8GeWYmYOvy3YJo1BL1qd7Xa9vUV3JouJ8i2L8+5t
	 YBPPMJFi4NX38IAGsqRJ6Moc7SeXMZDUm24lENtSvQRkRQioA0SfVJrDytkPWARfLT
	 z2piplZPRMzD3VXBAB8z6Y7WcOz5XZJ3T1hoDIkicjn2zJBw2mnboRC/uWmeM09Wxe
	 yovj4aQTeZ06+OiyFcaM4vfw8v/xYL+sGcuvt7nmKQUIjofKmLQXhR3H0NK8jFLS/F
	 AQROYOHNxYH4A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Add missing clkreq pinctrl property
Date: Mon, 11 Aug 2025 18:26:57 -0500
Message-ID: <175495482437.157244.18064210682405908325.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250717-clkreq-v1-1-5a82c7e8e891@oss.qualcomm.com>
References: <20250717-clkreq-v1-1-5a82c7e8e891@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 17 Jul 2025 16:10:57 +0530, Krishna Chaitanya Chundru wrote:
> Add the missing clkreq pinctrl entry to the PCIe1 node. This ensures proper
> configuration of the CLKREQ# signal, which is needed for proper functioning
> of PCIe ASPM.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcs6490-rb3gen2: Add missing clkreq pinctrl property
      commit: 84f3849d0526b22589dd5b4a5634ed4235a6ccf9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

