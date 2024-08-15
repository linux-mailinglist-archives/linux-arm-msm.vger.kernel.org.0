Return-Path: <linux-arm-msm+bounces-28683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 744C6953BBE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 22:44:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29B071F24B3B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A201515A878;
	Thu, 15 Aug 2024 20:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pj0bRWdl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF51156F21;
	Thu, 15 Aug 2024 20:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754474; cv=none; b=TcjqUn0lw6xQ5GuWEHkFasTwUQAaMLdHUduLc3OZkwEquUZnCF/3ftkvzxmzlxIajXYnOFVjGCtOZ+eugWzjnY6eTHS6tMTjPpDoyWxAbCUkwsnIUQpezXh6aZ3MIyX/baWs6jL5cUHkOgwRFCNYkBTilLiFM+oQvDKM60I64NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754474; c=relaxed/simple;
	bh=zLGOMGoKwUCFDdiXn3enjJ0O9mURCn4+cOCpMaC8Qy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kRYFvLZAO1Ha02XHlGci2q9kZkwx3HC84Y5peBnNR8fwE0gn0jDCETja+lN65tNmKUoLS5waJfigX94BrK2qyN3afVDGLg4f/nyYU05QV0zIjpxw5svuEQ+g2REk6i4qxHGt7OAl+PIMUTlezKY1j4YzVCA91lfmg4GZmp3BNGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pj0bRWdl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B5D7C4AF14;
	Thu, 15 Aug 2024 20:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723754474;
	bh=zLGOMGoKwUCFDdiXn3enjJ0O9mURCn4+cOCpMaC8Qy8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Pj0bRWdlmEwx7zvGEBSxn0Aw8qM2P8v0okGRFRsdybaTbLg2B6hrwn3ziBRbmQxuu
	 Zgefx9+PkwrZ9DT1Clo5UlZqjp17rqVTIsNsN2khziIp/Lsj0CYwciKPk8LIwlvCF3
	 RhqKuIMTJYlQqmoq+TIFiKKaO8UzK8B65BydIarUDzwm5/c3LZwIPP//vsjmdMVafj
	 37cQCONun48HfZLuRjoaRApD8dSL4dKuehOiR46+iaRxTrcmydRKI/m1QR/aNOAXfJ
	 g7y/IDja9PG/RkzZJLevsH4SpWzcjK5KE/MxC4r3qho8rgruwLkzBj7MPbncAHwfp1
	 1OMiRKewIPI/g==
From: Bjorn Andersson <andersson@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] soc: qcom: use scoped device node handling to simplify error paths
Date: Thu, 15 Aug 2024 15:40:29 -0500
Message-ID: <172375444834.1011236.2412246368890909822.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240813-b4-cleanup-h-of-node-put-other-v1-0-cfb67323a95c@linaro.org>
References: <20240813-b4-cleanup-h-of-node-put-other-v1-0-cfb67323a95c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 13 Aug 2024 15:09:46 +0200, Krzysztof Kozlowski wrote:
> Use cleanup.h/scope on device nodes to get rid of of_node_put(). Code is
> a bit simpler.
> 
> Best regards,
> Krzysztof
> 

Applied, thanks!

[1/6] soc: qcom: apr: simplify with scoped for each OF child loop
      commit: 6c26d9c764c62343722d6ea6c9e4c7e65989f634
[2/6] soc: qcom: aoss: simplify with scoped for each OF child loop
      commit: c50203cbba1573546f115330530d24382fc53f09
[3/6] soc: qcom: ice: use scoped device node handling to simplify error paths
      commit: 877840f13bcc96e05aca2e1e6cc0f957afb788a4
[4/6] soc: qcom: ocmem: use scoped device node handling to simplify error paths
      commit: f4c1c19f5c0e5cf2870df91dedc6b40400fd9c8a
[5/6] soc: qcom: pbs: use scoped device node handling to simplify error paths
      commit: a29e97bdc160aaa27187c7be3bcd052af66c027a
[6/6] soc: qcom: smp2p: use scoped device node handling to simplify error paths
      commit: f728778272242c84d36682c0aabbb845195e745d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

