Return-Path: <linux-arm-msm+bounces-3823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE368099BB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 03:54:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 314F61F212C1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 02:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 486985396;
	Fri,  8 Dec 2023 02:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="muhlXF5q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282D8538D;
	Fri,  8 Dec 2023 02:53:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EE7BC433C9;
	Fri,  8 Dec 2023 02:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702004018;
	bh=5PzZc1At9JCfV8L5kU1OjcOkl+rwKXg4LIazGQxqucw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=muhlXF5qYx6lmCMc+z6x60f2jQ5uUutRwH0eXLZSwHWQKQL+fUFe/ZncRbMiBvx8+
	 aP33IA/EQHd1Hoa9ya5lpBO/5NSCOhVhgBrpH6SOWwmeRKHVAgm/7kJ2+uJxRJUAIF
	 kGYdTPv4QZIMl9/4s55g2j/3VmRZ7Jz/YpPIG/FCIZXD+ifQUDcokFPOTmLQBnWFw8
	 m44gVfPD76J0MzAvoo6Bb16O7EEEsd/p3fRNFtUHwau2ttl6eJn1dZrrJxm5k8F5bH
	 SO61I1CAc6XMTgTkYNopjFu3FH0pn5c+C2VBH+iVxel+wNSPciULLctvXcR9ztfK3G
	 6nSQIc2jbCAkw==
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
Subject: Re: [PATCH] arm64: dts: qcom: sm8450: fix soundwire controllers node name
Date: Thu,  7 Dec 2023 18:57:42 -0800
Message-ID: <170200426914.2871025.16959172991938976947.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231106-topic-sm8450-upstream-soundwire-bindings-fix-v1-1-41d4844a5a7d@linaro.org>
References: <20231106-topic-sm8450-upstream-soundwire-bindings-fix-v1-1-41d4844a5a7d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 06 Nov 2023 16:58:33 +0100, Neil Armstrong wrote:
> Fix the following dt bindings check:
> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: soundwire-controller@31f0000: $nodename:0: 'soundwire-controller@31f0000' does not match '^soundwire(@.*)?$'
>         from schema $id: http://devicetree.org/schemas/soundwire/qcom,soundwire.yaml#
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8450: fix soundwire controllers node name
      commit: 11fcb81373de52eeb1d3ff135a8d24a4b18978d3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

