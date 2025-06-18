Return-Path: <linux-arm-msm+bounces-61774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBD4ADF83F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 22:59:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9ADFA189F9AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 20:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 002BB21D5B0;
	Wed, 18 Jun 2025 20:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gmYyFfpg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA95C21D583;
	Wed, 18 Jun 2025 20:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750280339; cv=none; b=KBJkt0uj0ScpSKJMpxAo2anaKxtKixgNoU8LMLPgJxGwGTwUILWRcaDDlAbSuCayNTrccwDXroQ/BBrxXPlfiAOTCzjzsfjlHOoAUfYCf6DVW10b+bI6R8DUVo8yGgZGN1e1TI3YfpZ3WODVrg/Yh1U0mQqWzH2BXhYpx6ZfcEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750280339; c=relaxed/simple;
	bh=acTXH0J8l6R1gRWKXaCBisQbuI739gqQtIdFH5AIoGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M8LDyudFFf8EuY8GpoRYby6B1/ijefxGRa3P80xOAdh4N2NLhRNpoN2mHWggMga0kA9XS7ImStx2ONnirN7Ex6WlglDEjNhyPNJzkliYrsDYqVoNo2EboDN8V/OfOaIJGObpRE8PrY90Zvdra9dj7s9CE7lr/i+sF3mAB/Tp74s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gmYyFfpg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AFD2C4CEEF;
	Wed, 18 Jun 2025 20:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750280339;
	bh=acTXH0J8l6R1gRWKXaCBisQbuI739gqQtIdFH5AIoGM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gmYyFfpgZ9zTdUAocwRyF/CkJbvpuSmLqBpAJGuX8Qc3fWVQZzC6v1sVpxHW6U/CU
	 RwJ3u+3sq7pnQN6YrBttg4F5WGQPBZiG0ilhBozW1q4uWM4KVFaWKBCi2PeFA9plGl
	 vKeXHjRnRCtrKf1s3YchrWHgp7Vw7cuXCHSScmH2BFTqNPC47rohIY9aeLsc3nBd3P
	 ABUYp+++jGp3akUOZjtsQnpiOZY/IPdlE5dqVxOrrR6MorSUkGNIxqeuGeC7y+Oxl7
	 N7aiV/zVK9dzYsXKHrTl1pe3o6cOaq+K8yrc7Oc2X0u3/UIg0lIogQ00ZC1mDJMiKb
	 viCge3sIZf+CA==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Ling Xu <quic_lxu5@quicinc.com>,
	Tengfei Fan <quic_tengfan@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Lijuan Gao <lijuan.gao@oss.qualcomm.com>
Cc: kernel@oss.qualcomm.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] Correct the ready and handover interrupt number for sa8775p remoteproc
Date: Wed, 18 Jun 2025 15:58:55 -0500
Message-ID: <175028033292.754649.4291862790980842746.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612-correct_interrupt_for_remoteproc-v1-0-490ee6d92a1b@oss.qualcomm.com>
References: <20250612-correct_interrupt_for_remoteproc-v1-0-490ee6d92a1b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 12 Jun 2025 10:39:31 +0800, Lijuan Gao wrote:
> The Ready and Handover interrupt numbers for sa8775p are incorrect. The
> correct interrupt numbers are as follows. So they need to be corrected.
> 
> Fatal interrupt - 0
> Ready interrupt - 1
> Handover interrupt - 2
> Stop acknowledge interrupt - 3
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: sa8775p: Correct the interrupt for remoteproc
      commit: 7bd7209e9cb11c8864e601d915008da088476f0c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

