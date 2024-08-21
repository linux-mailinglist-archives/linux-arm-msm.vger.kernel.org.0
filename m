Return-Path: <linux-arm-msm+bounces-29215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A75495A24C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 18:02:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACDBD1C20DDF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 16:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 785151B2EDA;
	Wed, 21 Aug 2024 16:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uZGE8+Xu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5256C1B2ED0;
	Wed, 21 Aug 2024 16:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724256071; cv=none; b=CXeY0HxXfrRTKopCLM44FVZ2UbvZKCcq18Df4PFa+fgLp55E9J2S5vJam6ObRjhLGD+YgnxZDAfpk/lYLTlcjXxLRfWDctX9hlyfzjq+4NewoYfc25iTDBMMxKrMA5Hxv+XmbX8IDSmxUi8oytbl397iCENQM/lJW4t27MREdmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724256071; c=relaxed/simple;
	bh=n0gxe/wFv+OlfPAVhhSR1IdVGilP4UcLbCAx7TfHpKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eyVBbMVKQC28OsHJ+3lWknmXITwL+5aVrsynPSt8ZmKTCW6tV1a8FnuhUoX0gLe3SwPdBQYqz25jXMnFg5sJGYeOg2gRR21FYqL1TNpxILw6cB7Lvkq/r+By+lTs/IkpTZDuPiYkJV7g7dHBsHLYB4k37UyJARqxA9hRYT+g/tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uZGE8+Xu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BBA1C4AF14;
	Wed, 21 Aug 2024 16:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724256069;
	bh=n0gxe/wFv+OlfPAVhhSR1IdVGilP4UcLbCAx7TfHpKE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uZGE8+Xun0A2mCO1myHObWUIfF/0WQLTl7vXA1iw9RzkH3d8uAwNpWIU0Hs82CIHh
	 glsLi5RXtM6xfF+IAXEOM2XKzrr1CoGHQu2j8HUWcrhskmPG21y6++WzToYC3TDdbD
	 InvQvODbTl7i4fXJmGHn+ozNH9FVS2bwlRGs9KfvQe7Ns7P8xnnt2rokueEgP3xMsJ
	 CoELe/gs+NFb/EY8Vh3gUl6AouKnPEm4+Xke1a6bhqxUxUkEPFJchojEm7XjL/uq8I
	 5J168vyq50rUigqr33b2mK0HwS/NDIg21i7TVgAyRgYXvClQd3mjeb89xmiXomEe+r
	 fgAN7wCLmUFYg==
From: Bjorn Andersson <andersson@kernel.org>
To: Chris Lew <quic_clew@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pd-mapper: Fix singleton refcount
Date: Wed, 21 Aug 2024 11:01:06 -0500
Message-ID: <172425606114.1363342.17598413344783276376.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240820-pd-mapper-refcount-fix-v1-1-03ea65c0309b@quicinc.com>
References: <20240820-pd-mapper-refcount-fix-v1-1-03ea65c0309b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 20 Aug 2024 15:59:34 -0700, Bjorn Andersson wrote:
> The Qualcomm pd-mapper is a refcounted singleton, but the refcount is
> never incremented, which means the as soon as any remoteproc instance
> stops the count will hit 0.
> 
> At this point the pd-mapper QMI service is stopped, leaving firmware
> without access to the PD information. Stopping any other remoteproc
> instances will result in a use-after-free, which best case manifest
> itself as a refcount underflow:
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: pd-mapper: Fix singleton refcount
      commit: c158ceb826068a8bbe3c9e78df420f47ba53c8a8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

