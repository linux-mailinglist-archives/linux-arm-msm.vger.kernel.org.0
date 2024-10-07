Return-Path: <linux-arm-msm+bounces-33404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03805992F5C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 16:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCE95283B34
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 14:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D4F1D8E0D;
	Mon,  7 Oct 2024 14:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OqgYQh3Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8C01D4353;
	Mon,  7 Oct 2024 14:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728311196; cv=none; b=pqNb+Icov+Hy83zfWFX9tDdFukH0zMlrw4j70sjOTnwlbl0CRnNqjNrcbW9x64RO+JZdT6l4JR8a+IqNOp3OOXRDapXCE7QdvtiCcnxa3QwmmQkSu0p4K3O04n+l3UibGxHJD8xDX13+P3cFHHhwC+x0HJqj36zzBT7IstTA3oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728311196; c=relaxed/simple;
	bh=+HHUcKdy8SK2RxsBmAhtrVwMxI1z+vhoZuC6xS1zbXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hPRqvIefzk8lKqkl59HlTJwGU4Pdrc1yXZI0H4xr6F4ckRgiJE3ZFe3BX3jX3MRqu7wqpbQLbByUhDY+na2FR2R3kZVXr0wffJ3vKrhgiiZWS2us+16E2WnmQWzR3g8P6/cJmdycItEdYIBGzAUKF5ThZLBTkT46sVMORng54yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OqgYQh3Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E541C4CED1;
	Mon,  7 Oct 2024 14:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728311195;
	bh=+HHUcKdy8SK2RxsBmAhtrVwMxI1z+vhoZuC6xS1zbXY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OqgYQh3ZqTKQSld8p6ZuNXhihFdvK33oie+U9Irg+gOiIYNXSAV1edk8X4NNtd+tl
	 y/Z5Vz+Jq5DoopTW7u+gK4McJCEAK+jg/RwjtiYWl6lNeVzoPvUEcRBm1zRrMbKRz3
	 Zcx4KyMWb2dQvp1PpPrwBRDoQPsjv9HGC9jhfh0qllqjfnq3LLNlSFHnml7x+nYaLP
	 1hoMNDGdBiOUadHdwlr6UZA73Z8H1dKhfeHonQjEsYULumAxPDXD0rLeG8p3gJHs7r
	 NUCfGVcbsZNoSLRfjhqxqi3lJs2NDJJAnrdXFwWEjy0IDQuLI0nf1qX/PwiUHbuERd
	 ILpOvg0jS9NGw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 0/9] arm64: dts: qcom: enable dispcc controllers by default
Date: Mon,  7 Oct 2024 09:26:08 -0500
Message-ID: <172831116158.468342.7119970387947528210.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240924100602.3813725-1-vladimir.zapolskiy@linaro.org>
References: <20240924100602.3813725-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 24 Sep 2024 13:05:53 +0300, Vladimir Zapolskiy wrote:
> The changeset is based on a discussion about necessity of enabling clock
> controllers, which is found here:
> 
>   https://lore.kernel.org/all/9ac4117c-755e-4e49-b3a2-661e7195a7ed@linaro.org/
> 
> Still on a few boards display clock controllers are kept as disabled
> to follow the intention of having a non-function changeset.
> 
> [...]

Applied, thanks!

[1/9] arm64: dts: qcom: sm8350-hdk: remove a blank overwrite of dispcc node status
      commit: 4bd9b84e093d0cf221a5f2f55f5895fa58a5156e
[2/9] arm64: dts: qcom: sm8450-qrd: explicitly disable dispcc on the board
      commit: 23be31bdf0aa8b8a9960c109377f90b1384ddc59
[3/9] arm64: dts: qcom: sm8450-sony-xperia-nagara: disable dispcc on derived boards
      commit: 30326d120ac855490b0580eaad290bc7eff2d9c1
[4/9] arm64: dts: qcom: sm8450: don't disable dispcc by default
      commit: c014190967dbc731b138e99800debabebf06058f
[5/9] arm64: dts: qcom: sm8450-hdk: remove status property from dispcc device tree node
      commit: c9c87512a5ddd6f1a4d5e5541feda9ac74b5dfde
[6/9] arm64: dts: qcom: sm8650: don't disable dispcc by default
      commit: 959176141ee6a2ff25b801bdd42a1333ea7bd70d
[7/9] arm64: dts: qcom: sm8650-hdk: remove status property from dispcc device tree node
      commit: 5a93da04248f2359bf54752e0a3283c637c653ea
[8/9] arm64: dts: qcom: sm8650-mtp: remove status property from dispcc device tree node
      commit: 615ce95458a322b7bb16cba5cafaf10df80e3d6f
[9/9] arm64: dts: qcom: sm8650-qrd: remove status property from dispcc device tree node
      commit: 7bce7fa2777a5dd73db203df7f063fad1e315f85

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

