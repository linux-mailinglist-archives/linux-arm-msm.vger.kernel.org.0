Return-Path: <linux-arm-msm+bounces-44475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93385A068D1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 23:52:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB0C0163893
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 22:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 327BA204F64;
	Wed,  8 Jan 2025 22:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DuGT4mSL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07461204C36;
	Wed,  8 Jan 2025 22:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736376711; cv=none; b=tVU9MlHD3U6RlW5ZtANvx3Rmu4tV9X2ZNmlv5gAL1uDfr/bfWlhzqxkf/ok6DpDQg4ylSQzZNjaEh2SNjcvUx2cnj87p3ixUx0yF/5n5AxDmGtp9WBx2emuInDTC0GAKTsQfLnQAKuUTXfqZo7JB/YHY/3rP2SBOlUqFqJveSLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736376711; c=relaxed/simple;
	bh=rn+nRSwdtd94mIJ0M5TJJvAJOrE2zm0T8bzlKKvilKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=faBdYe3gCPasVv9dzhz4mzHAo4G9CyuyVvpQawZszsXHTX+foqq+/nJ14X+ua2Ij9mjrT7aBfpy0ig9VnyNpLZrLGOrgb7nvP1+kZAcWjQnOA7VPUl9PVAOQ1Ix3Q73mAhoDKaduCKPENP5MlGVEMFrjGE9Z7Ni49Y2l6kIA+gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DuGT4mSL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39D33C4CEE2;
	Wed,  8 Jan 2025 22:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736376710;
	bh=rn+nRSwdtd94mIJ0M5TJJvAJOrE2zm0T8bzlKKvilKQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DuGT4mSL4q/CJZj7Ok0X32U8OpPuSrcKLbjwqfyfRxHx5x1jh9A9dOs/Z7gX/7fT2
	 57i1zCwDiMT4CHOmwBZ28UmHh9rosHvEqrucLZNX/Z1+gLQBU1TdDRGoyTlr1i9OSU
	 yoQHCZnzGDixA3Gf6kfSS1XKIJrIHXrBbR2QXqB6EBU3sRcJCPqDmNM85pMv0ljsgK
	 udc+b6AFa7FiykN0A2KVt/9xrFSrUjVHAZTBTZP7F5aE/wT76rNEvTmnwMPnMckbL1
	 +zSkjsN43HvWFqO7iDsH8D06BJ8y4ZDHiq2cAFNckVBk+lLMu1EkCadQpSuoLkeM7w
	 tV+eNwsSOMHrQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: sdm450-lenovo-tbx605f: add panel nodes
Date: Wed,  8 Jan 2025 16:51:43 -0600
Message-ID: <173637670471.158785.5940174966816912651.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241115-topic-sdm450-upstream-lab-ibb-v1-0-8a8e74befbfe@linaro.org>
References: <20241115-topic-sdm450-upstream-lab-ibb-v1-0-8a8e74befbfe@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 15 Nov 2024 11:20:52 +0100, Neil Armstrong wrote:
> Add the necessary nodes to enable the DSI Panel on the Lenovo
> Lenovo Smart Tab M10.
> 
> The panel is already upstream with:
> https://lore.kernel.org/all/20240828-topic-sdm450-upstream-tbx605f-panel-v3-0-b792f93e1d6b@linaro.org/
> 
> And the LAB-IBB bindings changes was sent at:
> https://lore.kernel.org/all/20241115-topic-sdm450-upstream-lab-ibb-bindings-v1-1-1f4bff4583b0@linaro.org/
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: pmi8950: add LAB-IBB nodes
      commit: f8ed8fd08426df23037fd73e9f1c3cfdef827769
[2/2] arm64: dts: qcom: sdm450-lenovo-tbx605f: add DSI panel nodes
      commit: cddaf231361d83a0605d51a8b70855eb57a58131

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

