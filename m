Return-Path: <linux-arm-msm+bounces-3834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7DE8099E5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 03:54:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A0FBB20E25
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 02:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D2296FAD;
	Fri,  8 Dec 2023 02:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cY2M07Ws"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCBB6FA7;
	Fri,  8 Dec 2023 02:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85932C433B8;
	Fri,  8 Dec 2023 02:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702004029;
	bh=Uq3mdwqnalaDIGToom72ls1kQksFpiADMtHIPg/KbLI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cY2M07WsNxf4MUZOwAroQ95Cjg2A0G4FMux4nCilQylDSlG7cbP2/CkFSgDxzYVZs
	 FiuATw1qcse5HZFVrJZH85kXvsQQN7HihGz7x16RIzT/7mndulIk8CtQaMGp4/jRpN
	 Ofg6AneTWKPmZZGan2mFSiq1mw7Vgq0bM3Dut9+zS3wRxRRdsJjifKKCKfGq3DgpNu
	 stGYZTvogS6dkKPA0ncxsec1lctjVgYGXf/xixxmXCSAYtAgCNNXqxr8r5FEjSYnwT
	 YhBl23C9fDaZab52whuXXx9ulA/6MnbCBWG2rh2zUwxYwTZQekT0DK9+JUKz9WKGSq
	 lVJqht1g80YpA==
From: Bjorn Andersson <andersson@kernel.org>
To: agross@kernel.org,
	konrad.dybcio@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Robert Marko <robimarko@gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: ipq8074: Add QUP4 SPI node
Date: Thu,  7 Dec 2023 18:57:53 -0800
Message-ID: <170200426933.2871025.13636461799951955480.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231123121324.1046164-1-robimarko@gmail.com>
References: <20231123121324.1046164-1-robimarko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 23 Nov 2023 13:12:54 +0100, Robert Marko wrote:
> Add node to support the QUP4 SPI controller inside of IPQ8074.
> Some devices use this bus to communicate to a Bluetooth controller.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: ipq8074: Add QUP4 SPI node
      commit: 6a25e70214fde6dcf900271c819c8d7fe7b9a4b0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

