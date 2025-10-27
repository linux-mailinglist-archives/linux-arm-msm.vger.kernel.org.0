Return-Path: <linux-arm-msm+bounces-79032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DEDC11C62
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:39:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 30B034FBBB1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 086D2332ED7;
	Mon, 27 Oct 2025 22:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oh6yGwD+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D222932BF21;
	Mon, 27 Oct 2025 22:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604499; cv=none; b=V/5LS3A5F1z5LDI6zXaKvD+xvzYHVZOtBD+7WVHRqAtsnG6oWAoKGOGXufyN+YRW8+Gw9hglW1ul1OmMnhnFW7yPMCuP0L5i2KEu4MKjVxXIas0PFkls/45eqamxhhh27tNV2kzwHQJZ/ObGi38+rZkAjkMX/wlmCfEcjkbVA7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604499; c=relaxed/simple;
	bh=Y/RxOndNvIAogBRBC/3TRzDywzPHwzgvE+5fOzumoDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tlLSwc6SqpK7vHyMLuI7c+DWNXOl9bpfN+mhD5A6CAzqmIKL6UgAI0L75Y1n7sC5yg9RxdCg+xVKgd+RYj+ZyCOQhFbBS/cpjIo8gfX2BBZwib7QrpY6EEMZ1CmNs7DNGvXEgzj2+VzewUEIghSp3jUKmZXsA/VKOl2Yi7XsFPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oh6yGwD+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2B74C116B1;
	Mon, 27 Oct 2025 22:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604499;
	bh=Y/RxOndNvIAogBRBC/3TRzDywzPHwzgvE+5fOzumoDk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oh6yGwD+X9sGa+02dbXSmmO/kf1xi4sKPm39JStRQADgHLymJpAlxAcNVp0dgafbD
	 Kp4f2V878aP6Vdg9n8Jn0Hs0b+FITEIXay7j1r0Ilw+fVUSs440UEVxLqK9iD2eT1F
	 29xEKriNfiIkHcRfeUJ8wk7h6DztqHF7TdxPFjwBY218UBbI83V4mLI8CYu37qOJe2
	 Q0GjAVG6RktJPnCdqDHSK2yAOp/yWNUIr0RZcrLiW2aropwbvaN6vIl2ydiSi+cs6o
	 ieZfqD8IzSYqEukThWZ6VC1w7EqIlvftmEm5p1Wk/8ENSGoDZHnhf5udlbiFf3v7sd
	 d5SjCKtinVMZw==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: lemans-evk: Enable AMC6821 fan controller
Date: Mon, 27 Oct 2025 17:36:53 -0500
Message-ID: <176160465239.73268.5678722394669488498.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017050256.987660-1-gaurav.kohli@oss.qualcomm.com>
References: <20251017050256.987660-1-gaurav.kohli@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 17 Oct 2025 10:32:56 +0530, Gaurav Kohli wrote:
> Enable AMC6821 fan controller for lemans-evk platform and
> configure pwm polarity as inverted.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: lemans-evk: Enable AMC6821 fan controller
      commit: 8053174aac836f192e5738b2886fd4da35a25cd5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

