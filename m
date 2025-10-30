Return-Path: <linux-arm-msm+bounces-79720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD8EC212D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 17:27:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A0931AA096E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 16:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4496536C243;
	Thu, 30 Oct 2025 16:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DIQWL2K9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184FB3678A4;
	Thu, 30 Oct 2025 16:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761841374; cv=none; b=Nwj3IhWawjNl/PxiNtCePBdfMUhgEyhnaqnO22rwiuVUlmFYam580zlFmCICL2Tfq2Zx3F7Odmj+0mlfKgaYZgOMrtIXVKAzVsZY4fSF2oA1VAvFpVcTJ6FZ0o60X20KtRFc4X6+ZLcseYwx7+Y0P6XTkkCTGerBJLCoiyRYHtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761841374; c=relaxed/simple;
	bh=4r46k69x84AQ7OGqRlpSHPw6W84J56Tgbb5OuRWi61A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IbM6fTEan9+3vd3aBwp3Eg8IBfeypeKR6ikhKmgFv0gA23cw+F1zjsPReI2T5HkAIU+AfjOzNEbmX7DXs5BoH96MloE9+LTQFY+1QTE5uv59muzQvpkaSBglh6Zpu4v/iyXIaPa0i4gNwSukindw/WRBcX66ZhO+s3nDp/LRA0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DIQWL2K9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B8D0C116B1;
	Thu, 30 Oct 2025 16:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761841374;
	bh=4r46k69x84AQ7OGqRlpSHPw6W84J56Tgbb5OuRWi61A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DIQWL2K9+6Lso6yn1cLyKwRHpfzonPBG7ZSVBJVZ6OnSVvm3IaZyWtAbel0zhSfcX
	 eiGGZfrG37jtqW7aMnh5FwBv+rNHuYwGUe6LFJRUTK74eHoWgaVRyqUY3sSQ3z0Wgv
	 0lD9Etu5Tbe3KbwzNtB5d9heuCvnrYrFSvLxdYReGO5rqczXtoSIjCijXOL9lkUsga
	 Drjo55+n3no43c81iZQcaZywrBdwk/7EkQoJbq7OWfNuBZwqXvgeVZnYWGOg4rnkrz
	 dk58XSiKid48E7kNBP48wmO1tr+MewnlkA+a+GmW0wI6kp3WM2jQXvxLk25xTzAM1l
	 K82PmvXwJQT8Q==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	"Yu(Yuriy) Zhang" <yu.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs615-ride: Set drive strength for wlan-en-state pin
Date: Thu, 30 Oct 2025 11:25:45 -0500
Message-ID: <176184154199.475875.10102987970277063907.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918112729.3512516-1-yu.zhang@oss.qualcomm.com>
References: <20250918112729.3512516-1-yu.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 18 Sep 2025 19:27:29 +0800, Yu(Yuriy) Zhang wrote:
> Set the drive-strength to 16mA for gpio98 used as wlan-en-state in the
> QCS615 ride platform device tree. This ensures sufficient output
> strength for controlling the WLAN enable signal reliably.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcs615-ride: Set drive strength for wlan-en-state pin
      commit: 7cb69f89700d031f6984b787a918bc5825c067cd

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

