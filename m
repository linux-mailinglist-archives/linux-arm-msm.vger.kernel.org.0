Return-Path: <linux-arm-msm+bounces-3109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BEF8020FC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 05:53:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7BB62B20A14
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 04:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852878F48;
	Sun,  3 Dec 2023 04:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S4N6YGMO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FB39455;
	Sun,  3 Dec 2023 04:52:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49BBBC4339A;
	Sun,  3 Dec 2023 04:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701579131;
	bh=/BK9sneiywqbw/2AYIt8hfLlFSPiv1QzMH5lU43mbYw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S4N6YGMO5flZ/w3EhTGiHktojzUSQqzga1Vgr4bvyBTGI+nxvhT2yRxmxmUPCoWtA
	 +F/1Xd1+dk3HEV+U+M5mUT1cLcnA2EQ3nOLTI6LbnclQAYjNGntTagzc74LbxahNLD
	 0By4PwFxPBlK0gMKXoqoBuKELdQE5yQxQ2p+VSpdGcSHX6b/N338KPv+O+5PlYwFTx
	 ZUuU6eI43kVd9c1MaWKbQKaQ6PwGWIKHigI80Rd4NBUb5otr2/JMVUPCBcqOVHft1N
	 7kVQGndBpUYFSdESfiS8NbDMgi7MqxYsO3bIufWbZpXhAvZtmpMqqhi6IXnl3cFgUi
	 HTrxi1e+2iAmw==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Stephen Boyd <swboyd@chromium.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Alexandre TORGUE <alexandre.torgue@foss.st.com>,
	Yanteng Si <siyanteng@loongson.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Douglas Anderson <dianders@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] dt-bindings: arm: qcom: Fix html link
Date: Sat,  2 Dec 2023 20:54:56 -0800
Message-ID: <170157925814.1717511.17865242683482227464.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231129030443.2753833-1-swboyd@chromium.org>
References: <20231129030443.2753833-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 28 Nov 2023 19:04:41 -0800, Stephen Boyd wrote:
> This link got broken by commit e790a4ce5290 ("arm: docs: Move Arm
> documentation to Documentation/arch/") when the doc moved from arm/ to
> arch/arm/. Fix the link so that it can continue to be followed.
> 
> 

Applied, thanks!

[1/1] dt-bindings: arm: qcom: Fix html link
      commit: 3c3fcac8d3b1b0f242845c3b3c3263bd38b3b92f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

