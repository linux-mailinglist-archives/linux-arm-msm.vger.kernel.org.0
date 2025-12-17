Return-Path: <linux-arm-msm+bounces-85600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76256CC9C17
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 00:00:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58B4B3050CC9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 22:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C31E32F762;
	Wed, 17 Dec 2025 22:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o6w7dFFu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443FD33030C;
	Wed, 17 Dec 2025 22:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766012373; cv=none; b=CSc3EyxX5URB04brej7Pcppdtw1yglMDDElQd5Z/IipY6uQiZHeAxTOQkRPzjJ7KuuUGDg/59oF0/fiqDv3GDkYnNtXyPf8GTp0Sq/gwpVr4Lw2Uc4XSXomFXePPX2pdhb7FjU+VyOLE6MnLMTbeJBGSmMjR47naJlL1czx2r+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766012373; c=relaxed/simple;
	bh=H2lmm66bvmkAJUyQBDD9FovfQmjD+zSvRmSPTx3zrhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qty11TSg6aThT5WKB5vHYA/6Q6boJzBdWyTrWF0KoAztE5cVVpU1byVM8FlNbQKRPYiVQ9XyuqiPSHt2CRt5i3jyxY1nbgGQCloSNcHq7Wl3Z/fAWWdWEYx8EUaA1WPv8eT3KftpQoGS1FGFn0W+fFjn/B4j1USdtx1y5wmgLA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o6w7dFFu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70097C19421;
	Wed, 17 Dec 2025 22:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766012372;
	bh=H2lmm66bvmkAJUyQBDD9FovfQmjD+zSvRmSPTx3zrhE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o6w7dFFuDOe70E6xP+JC9gWOcLVUlkEblSq/vwq1bjzVArWPXEdn5y5dd8bhxs8w+
	 mQvA/TtEl38U0Q+twrl5GF8Nnx4JjpUwcDezX6vPPp1J1HQAxNvukwfohKF3pQ8Uhy
	 BglulyWUhxnZ7cp/aFmdeUkbworGOz0RcAoUxZd9TUYsRhf3wcOIFhKfKk6pkCMBcE
	 FpfvPyLX0er6rwt2w/UhyKayDwRWVwmFeFpKriHUWfEN25yeglJ6L6Tm/qzVhe3dXZ
	 PkNGFAAtjkCW4arR+N9y9/evBtnnd2CvP+VmRtwtH+TjC+J6JM5uWGFim+NTbYz1tn
	 9d0t/1FneUGDg==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: smem: handle ENOMEM error during probe
Date: Wed, 17 Dec 2025 17:07:35 -0600
Message-ID: <176601285475.201175.5257735475212603604.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209074610.3751781-1-jorge.ramirez@oss.qualcomm.com>
References: <20251209074610.3751781-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 09 Dec 2025 08:45:37 +0100, Jorge Ramirez-Ortiz wrote:
> Fail the driver probe if the region can't be mapped
> 
> 

Applied, thanks!

[1/1] soc: qcom: smem: handle ENOMEM error during probe
      commit: 0fe01a7955f4fef97e7cc6d14bfc5931c660402b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

