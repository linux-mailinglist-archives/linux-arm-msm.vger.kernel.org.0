Return-Path: <linux-arm-msm+bounces-24969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6907924FDB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 05:41:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0F02B28E19
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 03:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78025136E38;
	Wed,  3 Jul 2024 03:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pXO/cnDk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0A3136E34;
	Wed,  3 Jul 2024 03:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719977873; cv=none; b=PoVzxUw6ZIqDctND0VzBJ/NMqeub6cWzTjDGzwmpjAVNZTrzeHX7NJR6p5ug0CuTnFSqgVUeuw869pcQJZYfvltSpdaTAUFKdzUQyruLwjbcPnmMguwuZY0oaT970uMlDVB9FOl4Wh0BS2J10bqF7ydwPD3SwXRFQPLvu5hhSNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719977873; c=relaxed/simple;
	bh=AWlKbGxkg8EHIpMhkU6ZC3GVkJjPIGmUP8n5jnBrS9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MbW7j+vYuA6W+YUqYujTXDLMpaBwBzyfvd95TFj2FsF+8RTyYpA1id7QF0m7vkKoQH4aGR+WWwWLf3zraemNnw/Q/e4MZa1Vlp6EaLKUHu722MvIiIF9o6siqU6l1l3tK+01Z6STYAs2bUABn1a0nPlpwzBYkjWWaQoGf6Bxt2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pXO/cnDk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E178C4AF0A;
	Wed,  3 Jul 2024 03:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719977872;
	bh=AWlKbGxkg8EHIpMhkU6ZC3GVkJjPIGmUP8n5jnBrS9g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pXO/cnDkzqVGKoxNklZMnAv/7bhs9NO+VSnz8KKt7ior4n35gSATz/V4uxJqD/zQj
	 NxR7Qw41Knk3e0NMly9OdJA0cRbz7bnY7yr6AVvJluqXK43XgblKe0DSD/NnHqvijB
	 LZMrydIM/ATW/VspL9JCaQEcRJ2B2kM0RugGIm0V+XEhpLvAtxVkhum9F1WMhCtK3h
	 ydvuplmjaSrhLyy/g/SpxdgJQYkwjavGKYSZzRnl/VaWu2TSKzqf3BmVwMnq+qLV3P
	 WTLMgC5vHanT0uMpzzAMcNRZbwhjUHk8fWQ6qiNu9+dsbLYj0WieBuA8KhlSBYebJ2
	 BeqorRIw8QMFQ==
From: Bjorn Andersson <andersson@kernel.org>
To: quic_bjorande@quicinc.com,
	quic_clew@quicinc.com,
	mathieu.poirier@linaro.org,
	Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
Cc: linux-kernel@vger.kernel.org,
	quic_deesin@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: Re: (subset) [PATCH V3 0/2] Use of devname for interrupt descriptions and tracepoint support for smp2p
Date: Tue,  2 Jul 2024 22:37:34 -0500
Message-ID: <171997785365.348959.8013084242190824614.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240627104831.4176799-1-quic_sudeepgo@quicinc.com>
References: <20240627104831.4176799-1-quic_sudeepgo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 27 Jun 2024 16:18:29 +0530, Sudeepgoud Patil wrote:
> This commit enhances the smp2p driver by adding support for using the device
> name in interrupt descriptions and introducing tracepoint functionality.
> These improvements facilitate more effective debugging of smp2p-related issues.
> 
> The devname patch, along with the callback to print the irq chip name as the
> device name and the removal of the ‘smp2p’ string from the irq request,
> results in a unique interrupt description.
> 
> [...]

Applied, thanks!

[1/2] soc: qcom: smp2p: Use devname for interrupt descriptions
      commit: e49380c155940cb47e291a4b3fcb7fdffee6aa4d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

