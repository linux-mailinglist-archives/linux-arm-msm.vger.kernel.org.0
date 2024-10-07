Return-Path: <linux-arm-msm+bounces-33398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE91992F48
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 16:29:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D9EC285CD7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 14:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06FE41DB92A;
	Mon,  7 Oct 2024 14:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gtavfA8g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D001F1DB555;
	Mon,  7 Oct 2024 14:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728311189; cv=none; b=qr6s4YKcuxP98ChzRAgbNH5SD/6t53CAzl/1w+sjBcgytP74l8QwdatCCX5v2BJkCVZeK6SBsCxiMkQu2XMDyV7afHE05x7jTmBNAk3mFMhSYY+Gd8td2Gk6/LMvwXpK7EW3Ipilis1MYx63/HDhWSSjjP0/htPY5HS3wWkkalg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728311189; c=relaxed/simple;
	bh=6j3AdVq5JamKDRd6Pmv/+AipJYgGagMIZ64YeG5pKoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LIoann6KVhublGd3NSoIgPFPo5t3+xX5mocAJqU+JCp/sixatZJiAmCInF7ilsrANVK6najG2zCHgx3sG6f+0sOESVz9K80U/IW03Gsygk+cjR6HOloqhtcayPln3GHmuzLDBfNnawQW2SDN8CsKFtguM0BKucmlQU7LMvOeeSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gtavfA8g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D91B1C4CED2;
	Mon,  7 Oct 2024 14:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728311189;
	bh=6j3AdVq5JamKDRd6Pmv/+AipJYgGagMIZ64YeG5pKoo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gtavfA8g704VnLwZlsmMqy5YpBOjS2Wi4I0OwxNe/58bTbMKxpenMVWDq1Gr3pOXK
	 Om6oLyHFmg1WZula+g0HkiSqLr14lsZiMNL+0tDU4PyERYFOHXhVY/kThvggIvbYAr
	 yF0g4cFkjBV33ZZ3HwucTzaOHPyp47kWQAUTh4QiHXKh+38aC/uPGqtOs7u/OTTceI
	 AxnRotg1DOpMm+1xSV0vPfQkC0BEyH3BK8KDlV2n4+3QVdHPvqg19JpJcSfG07zUbD
	 bvn2vE0s6c3qeeM++yIaoTu8WSu2NKOCIY80zVyiK1De6jGa5CUUQ0lqbYq8UsxE1c
	 ZKSUXmP5ttfiw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm6350: Fix GPU frequencies missing on some speedbins
Date: Mon,  7 Oct 2024 09:26:02 -0500
Message-ID: <172831116178.468342.13422970631298352794.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241002-sm6350-gpu-speedbin-fix-v1-1-8a5d90c5097d@fairphone.com>
References: <20241002-sm6350-gpu-speedbin-fix-v1-1-8a5d90c5097d@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 02 Oct 2024 14:58:06 +0200, Luca Weiss wrote:
> Make sure the GPU frequencies are marked as supported for the respective
> speedbins according to downstream msm-4.19 kernel:
> 
> * 850 MHz: Speedbins 0 + 180
> * 800 MHz: Speedbins 0 + 180 + 169
> * 650 MHz: Speedbins 0 + 180 + 169 + 138
> * 565 MHz: Speedbins 0 + 180 + 169 + 138 + 120
> * 430 MHz: Speedbins 0 + 180 + 169 + 138 + 120
> * 355 MHz: Speedbins 0 + 180 + 169 + 138 + 120
> * 253 MHz: Speedbins 0 + 180 + 169 + 138 + 120
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm6350: Fix GPU frequencies missing on some speedbins
      commit: 600c499f8f5297c2c91e8146a8217f299e445ef6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

