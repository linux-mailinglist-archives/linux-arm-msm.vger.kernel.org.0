Return-Path: <linux-arm-msm+bounces-70505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2474CB32D2A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 04:59:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E17C2072B5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 02:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2388123F43C;
	Sun, 24 Aug 2025 02:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PslZ+yaS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFDB1EB9E1;
	Sun, 24 Aug 2025 02:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756004175; cv=none; b=cRM2Y6u/M2v3Ilq5wt+iXw08tOWaM1PEdnc6zDhM7oNK7QMlZux429y+31rYvdkpicweaHhtcNDL+4wYah4mG96UhBkNDi83S0VCHk6PQLvxJfF12jQkHapUPyIElw7j18V4VSRTZUcwkjLpmIBn4YRCWc2tHy6ABUoLJ2U2IfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756004175; c=relaxed/simple;
	bh=9zR23kFr93g2/qXDcgqULbxbTp5AnLvGXkHBhaID9NU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HEupJ2Dk5hg7hJzG+3Kqs3IJcfmS4GPO+jiEcqLV/Pk4VLEJqHw3wDTyXb9XuIni8GM3UbmpCgb7i5kjWqhLRv5eDQ+wGmJ0v/H8r1CYOouGiJoD7gVj5Xz4T2kA+JI5WOJJGlUYqEDAYZp50Ta8Hk9FrmR1L5x5vfgl8UcNU98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PslZ+yaS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11809C19421;
	Sun, 24 Aug 2025 02:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756004174;
	bh=9zR23kFr93g2/qXDcgqULbxbTp5AnLvGXkHBhaID9NU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PslZ+yaSvMqlo7HZUWpzmNntpVS29ns2BfqC8ZdQnhzRUDnG/vqZPTldVMTn98jWJ
	 vbKPBTKc6lk5n5m6Npio6CCbLAaMmZb3UfyV2onylVji0NK7bUHxk+pUmdwHHuLwnQ
	 0FySBkiIl4IixJD0gFvJVqJptADEsha3qoUsAN/uDzSHSlwcXqBD0ob3ih5yHOg0Q4
	 XDpSctoCFy3JjOICHf13YFMDVgvY6XylXJAxENFzl8gbj30lDy0bVd32hYWhe0tonR
	 ny4LMQlfmWg6Pp8Ktjwvippt29shSzBoACF1oNn3isVHTT+OAiQt+XTRy3/YNfVUKq
	 FCfvb79wwMsYw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@oss.qualcomm.com,
	srinivas.kandagatla@oss.qualcomm.com
Subject: Re: (subset) [PATCH v1 0/1] Add SM8750 protection domain support
Date: Sat, 23 Aug 2025 21:55:48 -0500
Message-ID: <175600415286.952266.13278099913337832653.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250821160618.1037157-1-quic_pkumpatl@quicinc.com>
References: <20250821160618.1037157-1-quic_pkumpatl@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 21 Aug 2025 21:36:17 +0530, Prasad Kumpatla wrote:
> This patch adds support for the Qualcomm SM8750 SoC to the
> protection domain mapper. Since SM8750 shares the same protection
> domain configuration as SM8550, the existing SM8550
> domain data is reused.
> 
> Prasad Kumpatla (1):
>   soc: qcom: pd-mapper: Add SM8750 compatible
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: pd-mapper: Add SM8750 compatible
      commit: 72e9f68bf1a0d55174bba13fba2d8d37fd3355e1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

