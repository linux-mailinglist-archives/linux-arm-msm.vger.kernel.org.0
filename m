Return-Path: <linux-arm-msm+bounces-33399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E637992F50
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 16:30:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8B81B2502F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 14:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED5881DBB28;
	Mon,  7 Oct 2024 14:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZyaSspto"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4ADC1DBB21;
	Mon,  7 Oct 2024 14:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728311191; cv=none; b=KshnVF5rM6Xf15X6GruZJ5ol/4+/E/iJiwQd18NjTbx7Pd1Jfd3l9aWY7lx1dr3TZqA9Go79SFjnO3WCeWemMycTR5qvVsLePDC2ey6U+8S/pEO6RSaru/uPrGvj2Dl01YK316h+1XH+qQRpzO5bs3IiFmEapvu/UTt/am0dhF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728311191; c=relaxed/simple;
	bh=q/5IDEOxvt+lySm+Hi3CpCqQJo9vaNUOTVRMkuR8r1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JHgBo3rYpvyLVb8g3eZxV5M2wbSKLXCq9aBt6zhouKjm6w3V49A+1XdlIa8TSYYcZxF06hFMtg/v29zMLt51OA8pC+hGx83pEzrjxaFSJ7h2omuk6Bz0x5rTXeqLFtFh3I36/ITtEAk6Oj7Y6GjgYeXq0GqrM1667d/PWutCSPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZyaSspto; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4D2EC4CECF;
	Mon,  7 Oct 2024 14:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728311191;
	bh=q/5IDEOxvt+lySm+Hi3CpCqQJo9vaNUOTVRMkuR8r1s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZyaSsptoonXydKWcf/OL68mH0Cx91WOXzP4Rymc/wSz8N+tqx2KG2hkgV9vrhflAT
	 P18OglYxMTDQduqVVsNJg2aaWfFBV73VKyohJMGG3jMoWLd0T5RNV3vRERIzDZkXI5
	 fttbDkvDv2DxhpQXeEXUc2cU2Hq+d9UE/+ptXqoi5qOWqM//3aFdlrQMJn5QxHbmxL
	 rfiWTK0sI9ZndwGoTTv2pI5HHNDgB8GEe0UvGptAff/82KEx0iR56dRJw0a3Tlpv3+
	 rJQHThVkG6vGvHsaPDK6+rDugpR1ahWK6BlkDcjB13gdcKkta0tBr5T5086rKL2gHQ
	 s3MvSM9hNIpbg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Maya Matuszczyk <maccraft123mc@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: qcom: enable qseecom on Lenovo Yoga Slim 7x
Date: Mon,  7 Oct 2024 09:26:04 -0500
Message-ID: <172831116159.468342.12330010377735148008.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240919134421.112643-2-maccraft123mc@gmail.com>
References: <20240919134421.112643-2-maccraft123mc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 19 Sep 2024 15:44:21 +0200, Maya Matuszczyk wrote:
> I'm not sure how to test it beyond checking if efivars work fine, and
> reading and writing them works, persisting after reboot - adding a new
> boot option with efibootmgr works perfectly.
> 
> 

Applied, thanks!

[1/1] firmware: qcom: enable qseecom on Lenovo Yoga Slim 7x
      commit: c6fa2834afc6a6fe210415ec253a61e6eafdf651

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

