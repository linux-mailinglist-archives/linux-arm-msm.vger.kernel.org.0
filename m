Return-Path: <linux-arm-msm+bounces-3106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4938020F5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 05:52:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B05FE1F21011
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 04:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ED663C1E;
	Sun,  3 Dec 2023 04:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rb+m4kO3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1D98F48;
	Sun,  3 Dec 2023 04:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEED1C433AD;
	Sun,  3 Dec 2023 04:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701579127;
	bh=3IWQMAplStI32tTqlVKUtGheICzw+hofNiO3oG6ElaM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rb+m4kO3lhOFWLwquC9W8BlYmj9Z53Q1UOUHOVcNBKpeGaQfgq0V5KeFOUrlLDiae
	 DKFiTSFvs4LTxCrbKgfVfq1y+ZVq9q1CsdJEwF47z1ZYv1LojkrXMh+maarQBxETmM
	 m3n7qB6gGR8tuH9KIPKJFU2U8p5g8pTsgxrsFuo4f41aE0+xLivFsOL4EIR4x1PDyt
	 w2RCHfotK6ouli6QSuw9egua/5uWZFFdKt4a4K8AfAHLjrK3ThKOaAr8fsVTkmtVr3
	 Xn8xF0lzShZHh5yUl4Q6Ijg1pEVxZeApeGcjzja0SMmSPHoNVOEs87b8GzWpRsxHVs
	 szcnvEeXI1h2A==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-kernel@vger.kernel.org,
	Raymond Hackley <raymondhackley@protonmail.com>
Cc: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Nikita Travkin <nikita@trvn.ru>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH] arm64: dts: qcom: msm8916-acer-a1-724: Add notification LED
Date: Sat,  2 Dec 2023 20:54:53 -0800
Message-ID: <170157925832.1717511.1073225570333009442.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017125848.84311-1-raymondhackley@protonmail.com>
References: <20231017125848.84311-1-raymondhackley@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 17 Oct 2023 13:00:11 +0000, Raymond Hackley wrote:
> Acer Iconia Talk S A1-724 uses KTD2026 LED driver. However, there is
> no blue LED on it. Add it to the device tree.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8916-acer-a1-724: Add notification LED
      commit: 50891bc7f1e9e65fa260c442efa7fa24b3523c96

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

