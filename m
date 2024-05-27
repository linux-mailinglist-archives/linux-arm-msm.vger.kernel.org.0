Return-Path: <linux-arm-msm+bounces-20505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 878D88CF7A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 05:03:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41F0328135F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 03:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC46948CFC;
	Mon, 27 May 2024 03:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JlHKq93m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B8447F69;
	Mon, 27 May 2024 03:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716778863; cv=none; b=Awb+HVIC7pEzjS19k1oqU6tRm256iCPUTD0eA4DvrPffvVkA5c/i4GqlU7QZRQV+t0+RTNragQ9pO7WVlqKb2kppWP/ZO7IlWOhyTj7kqa/z7ECgiya93jUvKOthEp4fBkzSyncIMx+k3WxX9L5QJA3KuPxl/R8mcOWAguNzkzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716778863; c=relaxed/simple;
	bh=jtYU25nS6Ctxk/cMelrMilsWIozPiXfwg0gWA0kEY08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LSMcdIATEVV1RpT7OVKkiiKdkU8koqmr5eri0+Zqk2dANpoMOMlelS/ICKBMS4PP2DUEHAOqsu1IqXPS9FLp+kKHop8rRkBAjzvH+iyVKVY+/G8XzxLyzuRkkd4BNp8p8X8VGrbeO91n4pvSg6bDZ1eW6wx6anGI8GlhyqYjUGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JlHKq93m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6FDFC4AF07;
	Mon, 27 May 2024 03:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716778863;
	bh=jtYU25nS6Ctxk/cMelrMilsWIozPiXfwg0gWA0kEY08=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JlHKq93mLlrA1hd4hAG8kU0ktZm1CKH39J9dPB/lpcad1+8g2LN9qTieKthbL5aYh
	 prYZzDkhE5rIciWO/jkzk02DhQMXjre73WwlyWjxkjuqvv/bskVJvCs8PGqcmJl9zB
	 2l0wz51sFODD/VASOy1GwyK66B8aeuiR9226jUHbDYomKSPxnEGxQrvHsjKWSn0xSr
	 7ynXlW8XQSshCn2RZ7LFJ5R0i2bbWSIFwNAkv3+Slrp80cn3zgdIalm7UBln5F39ge
	 VU6EI6z+G26NkBWEdhSWlgPr2VzeVg/K6oJtdwUUHICTrSaSYjNykVc5LPBTDv/mMd
	 wXD+ZMN2woFlA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8650-hdk: enable GPU
Date: Sun, 26 May 2024 22:00:31 -0500
Message-ID: <171677884206.490947.2571046945819616642.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240425-topic-sm8650-upstream-hdk-gpu-v1-1-465a11af7441@linaro.org>
References: <20240425-topic-sm8650-upstream-hdk-gpu-v1-1-465a11af7441@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 25 Apr 2024 10:07:16 +0200, Neil Armstrong wrote:
> Add path of the GPU firmware for the SM8650-HDK board
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8650-hdk: enable GPU
      commit: 404a89438abc0b89ec9adaf35c26743c17e448ce

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

