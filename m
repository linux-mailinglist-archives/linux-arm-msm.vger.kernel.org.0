Return-Path: <linux-arm-msm+bounces-3824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 255A38099C0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 03:54:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9117C1C20925
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 02:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EF5923DE;
	Fri,  8 Dec 2023 02:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E7QvNf94"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C80F538D;
	Fri,  8 Dec 2023 02:53:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 345B2C433D9;
	Fri,  8 Dec 2023 02:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702004018;
	bh=dMsY+JlCA/vYwZc2IufgR8iPGmeZv7mWBL4rpyxPYP4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E7QvNf94qXenxbnv4BqdXQt6f9g4I41U2sDGjymzYTaNVieLikpOxuW05jk/tXWLx
	 q8bih0LwU5tGN26jWA3TiNIwe/iH8AHYRxDn8ahKcp8fAwSU2jJsYF5kKkvIV7hCnY
	 30lWwcZhp7MNLXS2gO2KrRT5olHMEd5CkEQfxjC9SpP21uaCCsjUSqfvjIICzMVlnI
	 YYwhYoXosc7Qeol6drQxpjgpWx0vPK578iVUqrX3Ziwzgp4FaJA0J8bRYNVAS92tED
	 hEOwN46g9jS1FeQOdG3mML/WbQFCPvfSjeC8aHzw0+q075tn6Uii0V6UP/k53UTMkm
	 ABl5MCZw3UCSw==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: fix soundwire controllers node name
Date: Thu,  7 Dec 2023 18:57:43 -0800
Message-ID: <170200426914.2871025.828146129351543040.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231106-topic-sm8550-upstream-soundwire-bindings-fix-v1-1-4ded91c805a1@linaro.org>
References: <20231106-topic-sm8550-upstream-soundwire-bindings-fix-v1-1-4ded91c805a1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 06 Nov 2023 15:23:57 +0100, Neil Armstrong wrote:
> Fix the following dt bindings check:
> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: soundwire-controller@6ab0000: $nodename:0: 'soundwire-controller@6ab0000' does not match '^soundwire(@.*)?$'
> from schema $id: http://devicetree.org/schemas/soundwire/qcom,soundwire.yaml#
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8550: fix soundwire controllers node name
      commit: 07c88da81caf0e72c3690b689d30f0d325cfeff4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

