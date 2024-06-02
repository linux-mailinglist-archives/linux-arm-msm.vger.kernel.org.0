Return-Path: <linux-arm-msm+bounces-21393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8850E8D73A8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 05:55:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9E341C21280
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 03:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0016F3BB24;
	Sun,  2 Jun 2024 03:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G8mVZnH5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBD73B2A2;
	Sun,  2 Jun 2024 03:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717300442; cv=none; b=mQUCPF1oRRJDfA3dFObmdFAMBNXTuO6opxNj4zUuR7tuVy3ybckXFIfSbItcum/v7aHphhxdeuNP+XJVUN/LaY3Z90FgDl4vVvNi6AG3KCokCflNG3k46y3PDd2L3A0K+9V/Wc/PrSrUFPowwqZRzj2keOLTqB7OZbIliK7RBOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717300442; c=relaxed/simple;
	bh=pCsS5ItjtVSjKnYxIpks10S712aXGTHVX+1+zeNy078=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ruq7FX8WYFjBXEfRrtwznt5iexEAvmtFAsN1eEsJmbc9sbgWEKV8hwfW21FaEzoGe3Za3LabTMzn6One+g6aBYmE3o/Ib6EhIsEnPTc675bi6g6yxykhe2Z87K3rRPlTHZyK09qYpzqQCEJ1cegS25w6KK6Et9Q85LanvmKXNz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G8mVZnH5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F344DC4AF07;
	Sun,  2 Jun 2024 03:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717300442;
	bh=pCsS5ItjtVSjKnYxIpks10S712aXGTHVX+1+zeNy078=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G8mVZnH5M/7h+DHAxDCufggmP+Bv7lqzLCW6ZOeVFajPPOFp7twZjHzxFnLS1jVlY
	 YK+ohfPJZqhIkUBJFZeq1ceMadJloFcVDXaZZsCx/ocX5VofjlIzy/naRLpA1shX9q
	 5dkfNABQN9VfxidqTH3mqhqov4Tk0Zb0lHmOzjcwgH+pqyY4Bik/OyxcJiuCBsYqZC
	 AOwKRjYHNWRC6JBTz1qKI2JFXT7nrJSA6+VdiKv1YBNlYqPFGSbIEgKvMdfykHyFb7
	 /i+GvpgeNo9sxYXeAJypKKjhU4PIQJO33r2K9SzOOXXYIHQHZBHzfolRzwxMc0gBL0
	 /EH2sQUxeSG9g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Unnathi Chalicheemala <quic_uchalich@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@quicinc.com
Subject: Re: (subset) [PATCH v6 0/5] LLCC: Support for Broadcast_AND region
Date: Sat,  1 Jun 2024 22:53:48 -0500
Message-ID: <171730042577.665897.8196444348725965878.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1717014052.git.quic_uchalich@quicinc.com>
References: <cover.1717014052.git.quic_uchalich@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 31 May 2024 09:45:23 -0700, Unnathi Chalicheemala wrote:
> This series adds:
> 1. Device tree register mapping for Broadcast_AND region in SM8450,
> SM8550, SM8650.
> 2. LLCC driver updates to reflect addition of Broadcast_AND regmap.
> 
> To support CSR programming, a broadcast interface is used to program all
> channels in a single command. Until SM8450 there was only one broadcast
> region (Broadcast_OR) used to broadcast write and check for status bit
> 0. From SM8450 onwards another broadcast region (Broadcast_AND) has been
> added which checks for status bit 1.
> 
> [...]

Applied, thanks!

[3/5] arm64: dts: qcom: sm8450: Add Broadcast_AND register in LLCC block
      commit: c566143137aaacfed1af09d8710edab1971c312d
[4/5] arm64: dts: qcom: sm8550: Add Broadcast_AND register in LLCC block
      commit: 2a71a2eb1f5ec438f0ac1c7e294cd7ed32119af3
[5/5] arm64: dts: qcom: sm8650: Add Broadcast_AND register in LLCC block
      commit: a7823576f7f7b1cb0a595332ab6b0b38e15f45a7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

