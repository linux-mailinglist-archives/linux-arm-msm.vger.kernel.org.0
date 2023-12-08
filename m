Return-Path: <linux-arm-msm+bounces-3808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E6D809990
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 03:53:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CAAA1F211DE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 02:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09F611FC8;
	Fri,  8 Dec 2023 02:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VoPqPnkw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0D81FA4;
	Fri,  8 Dec 2023 02:53:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF056C433C7;
	Fri,  8 Dec 2023 02:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702004002;
	bh=e0VlqsTG0pB8Rl5+YyJh0QUhq2ltOPMQvtTm4uUb7kA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VoPqPnkwvu1h36SYGXu2TMSAtFpXCijdbVOIakxte47LdMIUMbR8nInNiyZnfldFz
	 c9ka3TBfgm/friwEY9oc4/NJxPHA6tmdOoObQhI6gXe09pWpe3NootKPc2OaW5Yhnc
	 g+70eZqtuPpWKwzS5rmXJ9WSBYjPTzX7NFg9i664iaGLXplDvxQjzmiQRLmBTK3ykv
	 SFVY0vxGJHk51GO4Wy4prSmgLHM8AQlAXA9TZchJ32RhXGaPgSPePj9w+o/Zm/dUrg
	 cHqEQ5ba7SgJjVTe4a3tk8RhqUpZ5UDnt7TpZh/sfgWOAv0hKw/2DAHAt98mxSqvLJ
	 7KRchPscm+xTw==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Caleb Connolly <caleb.connolly@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qrb2210-rb1: use USB host mode
Date: Thu,  7 Dec 2023 18:57:27 -0800
Message-ID: <170200426907.2871025.14366002711786377960.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025-b4-rb1-usb-host-v1-1-522616c575ef@linaro.org>
References: <20231025-b4-rb1-usb-host-v1-1-522616c575ef@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 25 Oct 2023 12:58:00 +0100, Caleb Connolly wrote:
> The default for the QCM2290 platform that this board is based on is OTG
> mode, however the role detection logic is not hooked up for this board
> and the dwc3 driver is configured to not allow role switching from
> userspace.
> 
> Force this board to host mode as this is the preferred usecase until we
> get role switching hooked up.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: qrb2210-rb1: use USB host mode
      commit: e0cee8dc6757f9f18718eec553be9fffa503e103

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

