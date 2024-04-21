Return-Path: <linux-arm-msm+bounces-18106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 949958AC1D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 00:32:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BDD81F20FBE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Apr 2024 22:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B84CE51C59;
	Sun, 21 Apr 2024 22:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jWasorDv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E39A51C4D;
	Sun, 21 Apr 2024 22:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713738588; cv=none; b=Me93SNrUtMKZwdf4qbONK5PjGiC1CQTUvTkGALNnyZ/H2zO6H5J68RWT8EO3HejuC3AjnDMrJTYJhH7IfC1TpnENGV4VpJiV/2bc03V2KqYSpGzHtqGAywwr5e+nyqQh2/M9z0w8RFoFaQj5bVhE0Lk/c0rhYKjDLHzIq0TeF3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713738588; c=relaxed/simple;
	bh=UCjcMAbcr8/0auJHCJCp3GJfRrk8GV/7CaCfpb7xFbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OP0Iz2G3ADUFcdTYutJkK+I6Ue4GQWN7qrWNX66E64Gld0p+a/Plkf3zaq6DEJQl5KamsCY/3opKqfvV70X67t9pyAp77xT+mCYgUi/arC7+9Ke4ZtVZBNACZzih6oN6oVSdv8ku3OicdZ2ESgaqdZas3xSBD0jxBijzGju1K8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jWasorDv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC501C4AF07;
	Sun, 21 Apr 2024 22:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713738588;
	bh=UCjcMAbcr8/0auJHCJCp3GJfRrk8GV/7CaCfpb7xFbM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jWasorDvdEg3p/lfFxZcyRxfrnWe2AK4g/7GUaf686dM0GUCpAjDY2CvdnIr/iZce
	 JaiB8oIBWG/EqCXYBSuKTwJarVC4NbAFVtpH0jx4F92Cvj1l4l2Rn1SAcChl/FV0Ds
	 Ba7nR/PK8jySYiFIkEiot1wVZhD8Wm/ZL90NxFtn/J22mLaX9PI0K2H1xzPocL2XEG
	 lpCWIpGMD8TuKO3taO+7rS7J/QMT0eY7OoenyksinaCCbr7iQgZqgu6rUuN+3815MX
	 7ZQMk0CloYagiWcHXtczz6zcSYV1mAV9LSKFphCGzQWFEbqNgrm3278S1GpdOSlLXO
	 wQTDXxGkjYWBQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] drm/msm: Add support for the A750 GPU found on the SM8650 platform
Date: Sun, 21 Apr 2024 17:29:22 -0500
Message-ID: <171373856766.1196479.16576249501267244578.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240318-topic-sm8650-gpu-v4-0-206eb0d31694@linaro.org>
References: <20240318-topic-sm8650-gpu-v4-0-206eb0d31694@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 18 Mar 2024 11:09:44 +0100, Neil Armstrong wrote:
> Unlike the the very close A740 GPU on the SM8550 SoC, the A750 GPU
> doesn't have an HWCFG block but a separate register set.
> 
> The missing registers are added in the a6xx.xml.h file that would
> require a subsequent sync and the non-existent hwcfg is handled
> in a6xx_set_hwcg().
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: sm8650: add GPU nodes
      commit: db33633b05c0b57aef197f072826127f65f59ee9
[2/2] arm64: dts: qcom: sm8650-qrd: enable GPU
      commit: b8cf87ca7827388ed8d817fadec7ea65aef2a172

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

