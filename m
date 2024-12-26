Return-Path: <linux-arm-msm+bounces-43431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B45E9FCE9E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 23:40:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC385162272
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 22:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D84F61D1E74;
	Thu, 26 Dec 2024 22:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sqK/d3HS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4131D049D;
	Thu, 26 Dec 2024 22:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735252745; cv=none; b=iZ38bFHvpl/MVFC1zLqdxq27WvvHf0uUphb5WMVxEl70UfYxqgsbT/q8xy9MT4wUiX2s/KAnHA8IszAIoT4mFVXX+BbK4htVxmZ1uaWyuDm47eiSL/t1nhKEGCop7OC77l4iehOZTBOZtpG498bTNFdXj+m6Eahu/5AE7Z8pliI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735252745; c=relaxed/simple;
	bh=gpdi/AWlm3tVylg0F6W099i1eTFD3lHAqNrCLXKuv4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tyPJgeqy/K76fhgGrpeDkGX7kyy+vo716Gn/ID39lVPh/MGGtblNa6m8u7X4IGdFq9T7Eh6opoEp05PLlxchb0RxOLkxk/tiHFdD7tdeD7QXgzRmP++phaZA0tIfTyLOiaPtOe7axmTVSo5TF60U6mupTOJCKQVXFJjvP/Bj4aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sqK/d3HS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45202C4CED1;
	Thu, 26 Dec 2024 22:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735252745;
	bh=gpdi/AWlm3tVylg0F6W099i1eTFD3lHAqNrCLXKuv4E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sqK/d3HSXrxaNnLRjC8PIoTURr+SLeMB8FFKqD+06JDGrGp/TgljrQqcySu+TPCwG
	 4R5jfNekS02dWBwwJNU6qHS8yDspfjCpYthrvjKLO6N8JVXV87+hJRwnijXUzquOAX
	 WHhYfi/uhydUGSOL6jT2g7d7TcX0kRq27KCEIFat1Wt5D06P2ujFLjIBVHlrWDRwgm
	 hkXhKP5gjHFajEL8T1+JYnWyi9x6WXVvifg3iflYWvKC9kh6wNzcXAdNJ6WZTvXgp2
	 FcJ8UezJ5AmlXXz42ybPT5a0WmTC1iZChWdSusXxANwBRXAZx6lS0CbWw+igmNXvU+
	 5/U7r7AYT24IA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Merck Hung <merckhung@gmail.com>,
	xlazom00@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v9 0/3] arm64: dts: qcom: sc8280xp-blackrock: dt definition for Windows Dev Kit 2023
Date: Thu, 26 Dec 2024 16:38:35 -0600
Message-ID: <173525273253.1449028.17472780057345131847.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241202-jg-blackrock-for-upstream-v9-0-385bb46ca122@oldschoolsolutions.biz>
References: <20241202-jg-blackrock-for-upstream-v9-0-385bb46ca122@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 02 Dec 2024 20:59:44 +0100, Jens Glathe wrote:
> "Microsoft Windows Dev Kit 2023" aka "Blackrock" aka "Project Volterra"
> 
> Device tree for the Microsoft Windows Dev Kit 2023. This work
> is based on the initial work of Merck Hung <merckhung@gmail.com>.
> 
> The Windows Dev Kit 2023 is a nice little desktop based on sc8280xp.
> Link: https://learn.microsoft.com/en-us/windows/arm/dev-kit/
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: qcom: Add Microsoft Windows Dev Kit 2023
      commit: 4e65a0642255b75aa5668043f902856cbb79a547
[3/3] arm64: dts: qcom: sc8280xp-blackrock: dt definition for WDK2023
      commit: 16a7fed117140b2f604250f5a116d10638c4417e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

