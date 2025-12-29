Return-Path: <linux-arm-msm+bounces-86881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 96958CE8253
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 21:39:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B72FF30206A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 20:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 817E52D4B40;
	Mon, 29 Dec 2025 20:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BtO3HXVU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CB62D47E3;
	Mon, 29 Dec 2025 20:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767040767; cv=none; b=pc6xYPORYS1zRG9Midk6SsvuHBcGtaK+5NZUJKe3+KVzkjk5Ah8//KaGSoMQt0oVWS1haePUFojIXkKK0ckcHlUlHzfmpRiOEzYkU3DspT0fsSOfs3zqZfl9sZwAF2f/wVWkpLRk101kQm5szC+e6kjCpO/OUBzQNhXIhiBpuAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767040767; c=relaxed/simple;
	bh=IP5BJlRcf6Fjn0YRi0MtozjpXCwGjV18rYbK7Bqv0QY=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=UKNPFSUv2K1rn/v8nWCHXrGeO10BvLRqL5bWfWwChKfu53/1DbvoCp8d0h55XNA4v18DluhRgH0T5d9SRIn4BRe26j/Z+9oa8422tLZKR11vY0FcD1ra9G2izmvhreWdDsw2AVtXzI6/HRXAvSqI12j2hsSAi74pODwp88Z3PSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BtO3HXVU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1493EC4CEF7;
	Mon, 29 Dec 2025 20:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767040767;
	bh=IP5BJlRcf6Fjn0YRi0MtozjpXCwGjV18rYbK7Bqv0QY=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=BtO3HXVUhuaiX6tc/YAyp1OuKeoiPqB3guWrt9ZdDcTkj0XRcO1hZV6X08t8ZPn+C
	 wrCJWd9NhCP3QYub91R+5xvlLybtIbHYvjs6rAS0g6rCOU7ETu5YC4OZEMNlRw2XvA
	 /E6YhZns6TgBn3QnzsqX8DL0kbkf1VFk4DGFt6BS/uVPNDnw/kfpEHATvYjx2RZB1L
	 H0WBvdTpuT3LlIQWG/9+liaV/x4ciGNdKuEsqyvykPLnNT2GywAnqj/DYJGrKiXLQe
	 Uswm61HVbvwzw49UkVqmRmkMJNLTZFbALrCN1ZBZmk22OncQFj5J1CQDBc0vOHVYHs
	 Iwg9bX75SQdWg==
From: Rob Herring <robh@kernel.org>
Date: Mon, 29 Dec 2025 14:39:26 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: linux-arm-msm@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Gustave Monce <gustave.monce@outlook.com>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251226003923.3341904-1-vladimir.zapolskiy@linaro.org>
References: <20251226003923.3341904-1-vladimir.zapolskiy@linaro.org>
Message-Id: <176703895505.2172593.15829542385340941457.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: msm8994-octagon: Fix Analog Devices
 vendor prefix of AD7147


On Fri, 26 Dec 2025 02:39:23 +0200, Vladimir Zapolskiy wrote:
> Trivial change, Analog Devices vendor prefix is "adi", but there is
> a valid "ad" vendor prefix of another company, this may explain why
> the issue hasn't been discovered by the automatic tests.
> 
> A problem of not described compatible value is out of this change scope.
> 
> Fixes: c636eeb751f6 ("arm64: dts: qcom: msm8994-octagon: Add AD7147 and APDS9930 sensors")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20251219 (exact match)
 Base: tags/next-20251219 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20251226003923.3341904-1-vladimir.zapolskiy@linaro.org:

arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb: /soc@0/i2c@f9963000/touch@2c: failed to match any schema with compatible: ['adi,ad7147_captouch']
arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dtb: /soc@0/i2c@f9963000/touch@2c: failed to match any schema with compatible: ['adi,ad7147_captouch']






