Return-Path: <linux-arm-msm+bounces-68560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86884B214B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 20:44:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98C813E46D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 18:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC40B2E7160;
	Mon, 11 Aug 2025 18:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M1yVSjAa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A7C2E62D6;
	Mon, 11 Aug 2025 18:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754937686; cv=none; b=TLl3v7y4pWh8NOd3IIiBn1vBvtyrZY2rda1gdMm3YI93nOF9mtnpa8tcGFkAfRrzpTeu5gyC6tR1r5N69EOQA8wtjh7WWnhAZwLbeuuDq6qpwPkVzB48PGyfF9S/QeEykmjCteo8e9VD3IWnUN37OpLWOIfRzrUv6U50+iPl3B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754937686; c=relaxed/simple;
	bh=nGLBk0spJ4rOZY3aTd42CMFaNUpB8EMZ6f1cMvAXNIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ACdEwyn2SWVodMtQ4jG+cHNXgLJLJcCC1xIWCZtqthExGGZi6EhUyr9rsyTBSZrnwBf4Qruca1SdBPKwdwEg6+KG4xIuz72ql5bm2u12MswTj2AEr1FuzhT+WxzK0JMHGNdSgeF3z2nxbb+8pVooKNdrVRVnshi49fchHjLcswg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M1yVSjAa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFEF2C4CEF8;
	Mon, 11 Aug 2025 18:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754937686;
	bh=nGLBk0spJ4rOZY3aTd42CMFaNUpB8EMZ6f1cMvAXNIE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M1yVSjAamOi4rOwqFWtPmYUiXXzpdpu/Uz0ObAvrONL5N3hOl2SJHVRwWd/jMBo1Q
	 J6kZAajEVixs8ZXo3uYBd+jS4cSOvD206SdDXE8+ReFZXeEeOtLxcPhIuqPJwwVWpf
	 Z8lz4Sje1hr4rut9lXvqzZBMbJV6LwEvKbnE2z7YIO8u6ReawMfSoTt//lb4pUKyW4
	 yrt1JAv01ok/q/jYGf2tTchITmA3a1ZXI+ceYzHG90tPCYHaVqsVi6iMRqXd8YaS30
	 EgJEmjWfs5npw/YLjI8OX70lbsNOnzC5Nc3jdxV4RXyxb7ivCttVfrcEBTMmRd2QDW
	 Vp83KwBj39AXA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: sm8[56]50: flatten the primary usb controller node
Date: Mon, 11 Aug 2025 13:41:05 -0500
Message-ID: <175493766081.138281.16232235662724197490.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250811-topic-sm8x50-usb-flatten-v2-0-0bbb3ac292e4@linaro.org>
References: <20250811-topic-sm8x50-usb-flatten-v2-0-0bbb3ac292e4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 11 Aug 2025 14:25:16 +0200, Neil Armstrong wrote:
> Flatten USB Controller node on SM8550 & SM8650 to move away from legacy USB
> Qualcomm glue driver and make use of new one.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: sm8550: Flatten the USB nodes
      commit: 33450878adfc9d6bfd9cd2da2135b7fd33f2a4fe
[2/2] arm64: dts: qcom: sm8650: Flatten the USB nodes
      commit: 77e1f16b930221b427ec24c634703388a64175af

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

