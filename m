Return-Path: <linux-arm-msm+bounces-65318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 954ECB07E30
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 21:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B2571C42E7C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 19:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC3102D780B;
	Wed, 16 Jul 2025 19:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WnUMonS0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFFD2BE05B;
	Wed, 16 Jul 2025 19:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694865; cv=none; b=FBRwhfoBtTd2ksRPlSemDPulZSPyNHhSlohDZ28XT+rgayR6AilGQAdPSh1ga8PZRtLJHdVA85CIyu02Usq8yLL5qIlyaO6vXlnqnMxops6oNA02jSQMPTsPi9Stwgd1qgZShKyJJ253uKrihgDmRv9jCZSOa4go5vKUARljSI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694865; c=relaxed/simple;
	bh=gHdLQkmSWRZSESATjXbEaiCKRX4QclamIOc4vL9QijI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lck8X1IDjAVvAt6/dT+0HkAT5kGxkh8nLli0JPKpZboG8QsdDVxF6yB6uTEDXuP/IqDn7AGa8IxvRKF2/BhZRBEP3JSa1qSvRj4CPtCYBI9cLrpS56dBP16OXliUd1WbGb1QomY8Bb0dCX0XTqGhZnhylQbxvH978DX97ycFPlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WnUMonS0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86C03C4CEF4;
	Wed, 16 Jul 2025 19:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752694865;
	bh=gHdLQkmSWRZSESATjXbEaiCKRX4QclamIOc4vL9QijI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WnUMonS0pQ17SBtj5WkWm5pEXvkW1CP5imnE7YXe/83gamJn8Bd0YAMOZru5qYmaH
	 aZUaPQW09emcm0kvZfBjP3nA2sI1B2qMh93YUNQp2e8q0NdvQHp3oNym9WPa6hzg8q
	 VnXV1XlcppowGZQNcABxTHtelX33sMbVCAUaBQ/ODaeGwn1xAyxCevOKb4yaXFuxJp
	 rSnIBAen9ed8vwQZUgWrkCL9976kbGmgaabCPD6Z+FcdOl1/AGh+ZbNitr89zFVhNE
	 7empT/1UQQFSYlPKkPKxVc6ClglCNjInRGa5l9STmiWRido4cH1YU4fIKEbANj089L
	 mfT5dly07/eYg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm850-lenovo-yoga-c630: add routing for second USB connector
Date: Wed, 16 Jul 2025 14:40:54 -0500
Message-ID: <175269485295.105136.5238464720097426068.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608-c630-ports-v1-1-e4951db96efa@oss.qualcomm.com>
References: <20250608-c630-ports-v1-1-e4951db96efa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 08 Jun 2025 19:16:05 +0300, Dmitry Baryshkov wrote:
> On Lenovo Yoga C630 second (left) Type-C port is not connected to the
> SoC directly. Instead it has a USB hub, which also powers on the onboard
> USB camera. Describe these signal lines properly.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sdm850-lenovo-yoga-c630: add routing for second USB connector
      commit: 6ee9ad0a58f9caec8e959bb1f01752b6ca0784d9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

