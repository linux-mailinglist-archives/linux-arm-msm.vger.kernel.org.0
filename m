Return-Path: <linux-arm-msm+bounces-87473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 96717CF41E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 15:32:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7BD53300672D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 14:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52841332EB7;
	Mon,  5 Jan 2026 14:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XFrvT2SZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B3133291D;
	Mon,  5 Jan 2026 14:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622089; cv=none; b=GzoM80L1lbiLjuh68vn8yauEuzQMQGuo1gOKbkLiela4B+wYV2przAonFpPte+/KH2pav2s0Q20SiCLRdaNQDF7X9c1peFqlESekivAuikA4rBqrMXWBNH36MJYINxs+POdqV33I/sg2FW0BMSXcOHJkk3mqzrGjjiXJib/c6Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622089; c=relaxed/simple;
	bh=IUZSzBw6dSCRSQeA2o8mKf79w2HV3+KNrSwDxHIJdu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VpxN/T4n/f1tZ6x0YoZJHMh+MNARk7Su12RxMOMBv265Ring4seJUQwsxnyGnN9ZENj4nvS8MWG4gbEtFN7SybuTlEcaeglOVVNrvHk1jjUF6PuHWott3WR9Yw6/9qDDM+Ac2fgSQb0F54XmkfhxcwAIXvpzDx0UdI91GJeLKN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XFrvT2SZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29344C19421;
	Mon,  5 Jan 2026 14:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622089;
	bh=IUZSzBw6dSCRSQeA2o8mKf79w2HV3+KNrSwDxHIJdu4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XFrvT2SZagiZx7owXad+Q9kO8lgQaK7W1RNc+nOXCSklgAkPvWiy7Sxx+UDT1sOZH
	 6kY1WB2fUphQREZJKUqyz7kHpt71zyIF8nDwHBtt8BvcLloD8YnBMghbP+bD45NdJr
	 2eZByr8LEScXRpvuYUTachlOQRzxH9UBkhBVkU1pMkf0PBETDIQMEKcBvHqHtY2XWO
	 tRofOJg8gfK4f1TzhzTo7Ge7Zi14j8/7craoMSXrbUBrKp2htImoeHtvUAGpVyxpS5
	 gk5KV7u+gV/YbnDtPhWHPy9eMuxwT1mPHI45ebdgnWZZ2IdKv5CAbHHh6gnp38hNyJ
	 2QjKBCZTWDNzQ==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco-evk: Enable AMC6821 fan controller
Date: Mon,  5 Jan 2026 08:07:20 -0600
Message-ID: <176762206393.2923194.890196136171433912.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251204041158.2613340-1-gaurav.kohli@oss.qualcomm.com>
References: <20251204041158.2613340-1-gaurav.kohli@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 04 Dec 2025 09:41:58 +0530, Gaurav Kohli wrote:
> Enable AMC6821 fan controller for monaco-evk platform and
> configure pwm polarity as inverted.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: monaco-evk: Enable AMC6821 fan controller
      commit: fc4795cf96af49a03b72fc0f260f824d969243e8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

