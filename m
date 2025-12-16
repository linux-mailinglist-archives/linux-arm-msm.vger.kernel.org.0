Return-Path: <linux-arm-msm+bounces-85324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C78ACC1B9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 10:19:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C52DF3006D86
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 09:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038DF339B3D;
	Tue, 16 Dec 2025 09:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KajvJRcC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8E6338917;
	Tue, 16 Dec 2025 09:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765876795; cv=none; b=VpIPRFuicdCax7bwcVMe3wO/7W4VBYnU3An6x3qXeYFmrqxGy4DLb5LIEL+BkqsKRilaRX/VhWGT2AyRzbKY2R21zdDRTM/nMp1jBnXHiaWViSQeg1arS/AttoK7EJ+yST4yns7C7Z1VXlXQbZV/F3EgOiA4By83GuNlmm41jsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765876795; c=relaxed/simple;
	bh=r0kpcR2OHwi1d7NbDqXWtTEUvm6L4IsvQmKQvw5GPtg=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=G3RRcROq9yBGjSSV4qCBGRmd7ONoBMYc9//iewkN6eD0G+OcXKSYMkkKH7j9qWcWsLQ+/713JDyyC9DBqsn3zm/JrChdJS0eGqyFRrqStUDKmJgVdfKv1m8Pq+WO3w2tSM2y3er0P3q2GSwjlH1zj8Cvw1wNf1I72fxDwPIG5lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KajvJRcC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A2D4C113D0;
	Tue, 16 Dec 2025 09:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765876795;
	bh=r0kpcR2OHwi1d7NbDqXWtTEUvm6L4IsvQmKQvw5GPtg=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=KajvJRcCVQTcl/2lCSq2cxlW2Q/CKB25wko+b+dK5jPqWIk3e41KsphbtFJKKxYKi
	 YokFUPXcKs0ObjUi4EzslGMsPy6yIVeJL1TtCLXzD0WaaIXlEzhGISekl91mxn7NU9
	 QKrLifIOtshRI3O0+codXn8BLKw24V6flk53oBZr37nT89/v2egSRm760UHVRVfdZm
	 iq4sKidfoa+v41IMVvRnZP4laK5VT/Arhl6925hLTgCTDD4qV0lxBDLeqEMmLj7baq
	 JWJX77uvzC5P4KKmlQkFRWVP4GAP71KPS5Ifn/XEhlR4Oa/iEMn9k24l83WHAtPCm+
	 VDMfr9tghtg6Q==
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251201102627.146182-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251201102627.146182-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] soundwire: qcom: Use guard to avoid mixing cleanup and
 goto
Message-Id: <176587679319.348344.13509792002074257048.b4-ty@kernel.org>
Date: Tue, 16 Dec 2025 14:49:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 01 Dec 2025 11:26:28 +0100, Krzysztof Kozlowski wrote:
> qcom_swrm_stream_alloc_ports() already uses cleanup.h but also has goto.
> Such combination is error-prone and discouraged:
> 
> "... and that the "goto" statement can jump between scopes, the
> expectation is that usage of "goto" and cleanup helpers is never mixed
> in the same function."
> 
> [...]

Applied, thanks!

[1/1] soundwire: qcom: Use guard to avoid mixing cleanup and goto
      commit: 82ab754d102273f4c974a285aa8025bed7521b15

Best regards,
-- 
~Vinod



