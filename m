Return-Path: <linux-arm-msm+bounces-60901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F07AD495A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 05:30:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AB0E189EAD4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 03:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED7C427456;
	Wed, 11 Jun 2025 03:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EcnpUvxx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FF2186A;
	Wed, 11 Jun 2025 03:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749612618; cv=none; b=DBUKlTfp1uiaxmlQSLzje+4Nx0LlLah2U1ZBi9kMNyZ98EYb0UM9zFIauZbSaX8mFPU5J9x0eDro6g+RN1A1mx1gzKCwdrDFc7nTXTb1Acm148DketK65rlspDSYW2CkUSz6LIrVW2ZBCXsIPMyZVWmWR0qNDh7HPBL8kzZQJR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749612618; c=relaxed/simple;
	bh=CE/NJW3uU2GBM5RrrhUyzCFrsEhnYqHwEX9CrlwYLHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i9RJtjyxgdcMd4ElduPAs8k5AaSn5g9ZBuhNTdRe4qOrB0fPnR17tSbNywNvF9GeRMGlXNGpE2yF2RDd44UBSbr+wqZ/3BqDyAsayIQaP1NFtSxjlHX2gmb1pkX4bUMDGrknXnZPgU11JWfWMO1pXNHSnsVsaWSThNq9BkFAZIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EcnpUvxx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF385C4CEEE;
	Wed, 11 Jun 2025 03:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749612617;
	bh=CE/NJW3uU2GBM5RrrhUyzCFrsEhnYqHwEX9CrlwYLHM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EcnpUvxxpkm5jGIhYQl4Ij3K/delgoDF4OL/TRODMCDVZRH4U8VB+2aErYqgMLJbR
	 74DcAqnYY5hoBFIlciMzP+om3lhv/Sh4P8rokXE2jxqg53ycFoXYcMdbwFlKz1JcyM
	 wFqAGX9rb6RiCJAqCbjBLu3x0V0T6VtdEut9rQxNF6nc+U7RsYbXRjXEsyh/GFZRDZ
	 vb3b5pKi0AFghuWEFiA3neatYqcQGvqChKO1nVrLPtOTFNH1FgAQpObloEV5lwTNyx
	 JcbyRttaa/EBxP/P5OZD+3t9vyZnzDk9fPbABfiIC1lzj/2van7BRCa5IqPJOoPmCU
	 M11Z+FDJwr2FA==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: qcom: pas: Conclude the rename from adsp
Date: Tue, 10 Jun 2025 22:30:14 -0500
Message-ID: <174961261106.456609.17025240875461484637.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605-pas-rename-v2-1-f1c89e49e691@oss.qualcomm.com>
References: <20250605-pas-rename-v2-1-f1c89e49e691@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 05 Jun 2025 17:17:47 -0500, Bjorn Andersson wrote:
> The change that renamed the driver from "adsp" to "pas" didn't change
> any of the implementation. The result is an aesthetic eyesore, and
> confusing to many.
> 
> Conclude the rename of the driver, by updating function, structures and
> variable names to match what the driver actually is. The "Hexagon v5" is
> also dropped from the name and Kconfig, as this isn't correct either.
> 
> [...]

Applied, thanks!

[1/1] remoteproc: qcom: pas: Conclude the rename from adsp
      commit: 2c0c883f895f16fd9d367ec2e64bccab907d8d87

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

