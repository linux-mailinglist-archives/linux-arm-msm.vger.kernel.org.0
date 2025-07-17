Return-Path: <linux-arm-msm+bounces-65353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB225B083E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 06:32:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A92DF7B91A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 04:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE57217705;
	Thu, 17 Jul 2025 04:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mTFZ01jf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E1621767C;
	Thu, 17 Jul 2025 04:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752726685; cv=none; b=OH2GHzxSCQs5uQAfjsTKeq71Ni/yPXyV23MP/mclME0t95LliLm8DHP7CVUCTOaSe4RiUChubWPHz02YrJgp2pbYXgB6mXOLgKntIG8zjbq27Wb+Ln9XIVDitkSTaY00oHDGaL89sbyXS3/5eXWsaUQiaeFmv4AWrTCcz/1yGgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752726685; c=relaxed/simple;
	bh=3sfiKXXfIV6Qq4eHx4Py3q1QUNFzJxQJyibpJSXIxbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mG87KD9os5ntdhP7rfeyWE+TP1kzyy1uaUErdfVMH/Twr7iixELIYKVsqffxDAjbEwnykB4mW5UjsTkDEBdKJJC2i9sVIzxufdIuIPCG2TxhdqSSUqc2OpeytKUWF/wr804DlnD5Qko8TJwxtvEVWU7RFFrVS+g7+zYJ+c6uBZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mTFZ01jf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 250C0C4CEF4;
	Thu, 17 Jul 2025 04:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752726685;
	bh=3sfiKXXfIV6Qq4eHx4Py3q1QUNFzJxQJyibpJSXIxbM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mTFZ01jflIKbnWm7IdOGADCcT/tQn+cmr3UTymqQ6MAcncdAdFnYIKINVoHk0A+33
	 BCqeBCzww0krtMmTMaZcFYINdIQWBT7RgjW6q+tEViTUd5Dn5ofZ5SbNRtGOlfVNb+
	 lCxl7Q1fmvYV3CK+25EaacgG295J7CxHVgp+a1CxCPSL3lphT3DNImtDggwoiJKgz9
	 NeFWjzkXodCWYlQrhljKrBOsyUsEKbweWQF9t8sdfdFUiKO9Q5Dey0g+hPkR3jOaU0
	 NWivRJXJcQtfdLBbWj4KRP+4a0rNJMnKoPxA9gqm2cGvq+Vk3dnBKnxoSGMgeLwK4t
	 knQusqVvStwkQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: socinfo: Add support to retrieve APPSBL build details
Date: Wed, 16 Jul 2025 23:30:59 -0500
Message-ID: <175272667132.130869.6973347061395378853.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250711-appsbl_crm_version-v1-1-48b49b1dfdcf@oss.qualcomm.com>
References: <20250711-appsbl_crm_version-v1-1-48b49b1dfdcf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 11 Jul 2025 16:33:06 +0530, Kathiravan Thirumoorthy wrote:
> Add support to retrieve APPS (Application Processor Subsystem) Bootloader
> image details from SMEM.
> 
> 

Applied, thanks!

[1/1] soc: qcom: socinfo: Add support to retrieve APPSBL build details
      commit: 955a41218d2bd2ffadd0406b14a4b4efb67b056c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

