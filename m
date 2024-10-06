Return-Path: <linux-arm-msm+bounces-33201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 557CB991BC9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 03:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 862571C2109A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 01:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B251F165F01;
	Sun,  6 Oct 2024 01:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fXEAM5bm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A125153BF7;
	Sun,  6 Oct 2024 01:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728179741; cv=none; b=RyFF+hRhGpF/c9mHEbW+MqiSHpihBe8asRpCVmymGjXb7YmjJnG86GNGzjrrCoIMh5V1G9VfJPdjDI9GAuxyT2pT3lpJGh7rqbobxPiRDiZ8yXLj77SPrJBWCdNvwNodakAsCJJSUypczpzswbwVyN+6/xKsstQJa5nqpwdEXGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728179741; c=relaxed/simple;
	bh=193fPrDKaXzScSAHlRYdiZJHr2vOYr9mn6kH106FvkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J+V3qBdvbLtZmtcADztqEBxjOWTpiE4SiXwvfAumZCEFQJ/miPRCVBgKWwYrjISaGrzukV/+oX75bBQ8mG8fvvsRtvmbQgy0SC5K6wc7c1I5wis1V55ItadVvhAPSXA+E+ZAnRdR2JonNt/TbQ6CeWxofXNZVmC/aylZPbFTkrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fXEAM5bm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0CA3C4CECE;
	Sun,  6 Oct 2024 01:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728179741;
	bh=193fPrDKaXzScSAHlRYdiZJHr2vOYr9mn6kH106FvkU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fXEAM5bmWeux6q1eAQXXn2tYN5dp5qr15qjVknE9xzEaSpKCOb81TnpVKlLJa2FNZ
	 Vtx4+OOxtlxjBqJEgdUKdI06bjIPbi5je3jVDC0JhFgMOFVe10Vx/zyOaKtsGpwkq9
	 s+5i/ejR6LqFYvSw9kPOv/JENXjJrx2dIWHlC1WyopXOGcVFzWCV45PTRrhm3kCal6
	 bu19GorDKqbREV7HUmmrMXx8HLoEp8Q1lCDA+DlFDxX5xG7jLHDmSOwOznNP70ZycM
	 m1+X9BaZoXUZhwE9RclhBSvw454mFcUl4MKLX1250UoWMAH/l5k2Dd1cYklY9T2YEB
	 +5X01BMyLRmrQ==
From: Bjorn Andersson <andersson@kernel.org>
To: kimran@codeaurora.org,
	konradybcio@kernel.org,
	Charles Han <hanchunchao@inspur.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: Add check devm_kasprintf() returned value
Date: Sat,  5 Oct 2024 20:55:33 -0500
Message-ID: <172817973323.398361.8465371028019981200.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240929072349.202520-1-hanchunchao@inspur.com>
References: <20240929072349.202520-1-hanchunchao@inspur.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 29 Sep 2024 15:23:49 +0800, Charles Han wrote:
> devm_kasprintf() can return a NULL pointer on failure but this
> returned value in qcom_socinfo_probe() is not checked.
> 
> 

Applied, thanks!

[1/1] soc: qcom: Add check devm_kasprintf() returned value
      commit: e694d2b5c58ba2d1e995d068707c8d966e7f5f2a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

