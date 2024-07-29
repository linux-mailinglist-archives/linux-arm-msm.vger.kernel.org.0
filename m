Return-Path: <linux-arm-msm+bounces-27179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 681C393EC49
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 06:02:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 066CC28266B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 04:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803B113D53F;
	Mon, 29 Jul 2024 03:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dJmFBbcF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FF813D51B;
	Mon, 29 Jul 2024 03:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722225538; cv=none; b=Xwt30qCyTFL9y/za6p4YGVTbJImfBT0nhKKggknYFEMKB4v6AhWeMfKLR/9oxLsgkNjEB9adDik7aTmP5h0Awjn2QQ9ClM5MWwD9qp2RjSucKz4jlOXUvzz80esAEZtWvuv7ZfxLCLRvlgbnUsMsc5dgg74uEsVcwtZvAf1MPzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722225538; c=relaxed/simple;
	bh=1t7/FltCQU50AljIErNTnLoHcOSZdN118ZE8rm1jyr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OT/ospmtpP4SeN/BNHFXqnDO8g0FOMalwlaIpSL1jx/u936VKXk2T3371BzxQgc+xCJkVebFzwt+J0Bik8wKAMjbmILhArE544EiEd24X9O4yD4mIjtLDR0BYgxQLx9yg7jqx9cC2PfbYw4fBEEZE9Gzx9WpMgj1PpS1WuZsCdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dJmFBbcF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E06AC4AF13;
	Mon, 29 Jul 2024 03:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722225537;
	bh=1t7/FltCQU50AljIErNTnLoHcOSZdN118ZE8rm1jyr0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dJmFBbcFRiLN364VuI268pAtq2TG2Zr/Hngh2sktSo3w6WOlO7aUcrA9P7fIVJCYu
	 Yzq4ht1WVcc5L3WTSbNKRs855/KcxswdpryMD2gWXIlDssfBfjpORw9yQT7/eAoAPL
	 Gh1+P9BdMOyVIHYJwDwdFB3bfEb+K11c9kixEhIUOrHPIy9Vw5ro+rNaorOwxEiI4y
	 YUUtHpBn3QbW43dXXXFZy88GiJ6KJEIQ6BbM2cddD5IoBLoPEs5SbDBZB5OFhqgf9E
	 78pXRZnQGGkwE5New7vPkttj6I2o/6zW1K3i+lhUy4y0y1FZjHuymO+PWJZ5VzMQNn
	 a1yRkpyWpN2uQ==
From: Bjorn Andersson <andersson@kernel.org>
To: konrad.dybcio@linaro.org,
	Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: llcc: Update configuration data for x1e80100
Date: Sun, 28 Jul 2024 22:58:23 -0500
Message-ID: <172222551324.175430.6844502288201270672.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240723081542.1522249-1-quic_rjendra@quicinc.com>
References: <20240723081542.1522249-1-quic_rjendra@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 23 Jul 2024 13:45:42 +0530, Rajendra Nayak wrote:
> Update the configuration table for x1e80100 with the latest recommendations
> from the SCT table.
> 
> 

Applied, thanks!

[1/1] soc: qcom: llcc: Update configuration data for x1e80100
      commit: 99a7b371eef63507c1761e367382d78ebec0a5ab

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

