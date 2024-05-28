Return-Path: <linux-arm-msm+bounces-20696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2477C8D12DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 05:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3EE728360D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 03:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80BE613E05F;
	Tue, 28 May 2024 03:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pQ9jNwfB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C9E13E055;
	Tue, 28 May 2024 03:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716867189; cv=none; b=KcznxuPL2Nju83Z5Df/8KvUTk+DhHDa65vDDIFOOfQhFKn0SJ3DeWOPPTtY8AnmwN5mBB2quVlhwIB5JjLQ3h+qZUHbLGM2PZDB35dkdE1diqXCrAnRyrIIgyG7LPWdfWa2CdTBHyh6Yu3cin6L9XjLG7YX+a6D/3tNXiwSu7VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716867189; c=relaxed/simple;
	bh=C1fbViM0xOZbOqJcuD5ecYH+ZL+Qsko7qhXbp6auDQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sNYcpljaVlywSfeJYhhCbM7voYHMKYiepl8fVZihQ0G6uor11NzvWfc+WOAyOeHzNhI+g4lG+Dn8TU6Njmp1MNZJtafVvU7zfHPJrjC+mX3WrAmUie47Tm07x7kP9uyH/+LcvxdeFRNuGT+E/p/urD3Yk5qKFUexQznu6kMjh2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pQ9jNwfB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89F34C4AF0A;
	Tue, 28 May 2024 03:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716867189;
	bh=C1fbViM0xOZbOqJcuD5ecYH+ZL+Qsko7qhXbp6auDQw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pQ9jNwfBiJEahDpezK3zz/P3tGVOaaEgQNPT8DfdeTiqn4ylHI6AJLP6mn9mVv8Wp
	 f3SVM62xLTOEeIqc0MJqXzHnGslIUJUeSM+dV6A0vXJbvK+xuTrqcphNEUrirlfRD2
	 bgBhYCOgMzuMnPueTjcaz+NAGmeEOqmHfgMxjwOG5OO1QMfoBt7tyV9Ycpkq7A4xQi
	 6snIfG6PLPbg77p1BgEtDijLqwvZ+pa5Zs+2wucOR0u1z8/wdI6/groooCBOUm2JnM
	 HZtsRcWjXn0wEDEMWVxCqXDT//tQub+F31sB5/Mw0xf4OuDfALtGWjTHDqktuhrQwu
	 QN+9mKM/wZELQ==
From: Bjorn Andersson <andersson@kernel.org>
To: konrad.dybcio@linaro.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robh@kernel.org,
	Mukesh Ojha <quic_mojha@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: Enable download mode register write
Date: Mon, 27 May 2024 22:32:29 -0500
Message-ID: <171686715151.523693.2712397777077820282.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <1715888133-2810-1-git-send-email-quic_mojha@quicinc.com>
References: <1715888133-2810-1-git-send-email-quic_mojha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 17 May 2024 01:05:33 +0530, Mukesh Ojha wrote:
> Enable download mode setting for sm8650 which can help collect
> ramdump for this SoC.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8650: Enable download mode register write
      commit: 49e950487b3e55cbc8bf9f7062e7094f052d11bf

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

