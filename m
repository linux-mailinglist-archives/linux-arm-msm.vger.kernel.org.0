Return-Path: <linux-arm-msm+bounces-61640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDA5ADDDFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 23:32:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC254189E124
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 21:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E412F30D2;
	Tue, 17 Jun 2025 21:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iyvd1JPQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D472F30CC;
	Tue, 17 Jun 2025 21:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750195897; cv=none; b=gn3pdVAKHDmwTDMRBa2SXKpPd0kHAOcgn/5EocMur54q27J30blek13/ZweiHCHELRukOK97qWRSgH5J+CwLJkbfHEt0pcIkYWSoHnmBmPOokSvwPvuQ9Kp8l9jc7w71+5RmpvkGKIYZpNwB6hr6QgivzVuktTU1qL9emN+vgBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750195897; c=relaxed/simple;
	bh=hqHDQUHx7j1ctacGNasuQxJppiraPtGcwTLkCsHBJrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d6SrPM/d4ofZYWEjeq/UVbA/PDpzEvDiDYgBhloejk8PPJCxgL8MvqAdhtlABAc9jek2EPoAJks4iyMedACBPEiTEjNFKw9HW6AoORinaB7q2YzA7cHXR1BDMsoE9dZhNTlo7VqJj3O7YRTVO4daFyGpMFqameA9COSTnfJNa9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iyvd1JPQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2961C4CEF0;
	Tue, 17 Jun 2025 21:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750195896;
	bh=hqHDQUHx7j1ctacGNasuQxJppiraPtGcwTLkCsHBJrs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iyvd1JPQunX5jgKZwAjI+HfOgz/+zvjif94avLrfnpmYW+way9ZPkcjohwvuVyhib
	 f4KTE3KF4UJ+hqQHcgB+kyq4SEZ3Hp9HXCGpSzlWUiKmJDhkXWbc30WrJGvWJ3qZCB
	 LrzDrgWsUZ15YIGiOWKaXBs3g1qusfFZvVC8HSZLreLbb6McqZDZzzPYM9/+RyvRsO
	 fUKcGtpZLVgFtMOYR56I/ygYF4m0JpKWcN99YF/9KMBCZBg0nEigE1MrlDDgK7N/UO
	 nyLfKR/HsAkfAMII1K3aTGEaXJq5aM3lavx8kC/ZnTseIW6d3Qd+5NogmJ5r1+yor1
	 DPLO40mKTHQDA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Doug Anderson <dianders@chromium.org>,
	stable@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] soc: qcom: mdt_loader: Validation and cleanup fixes
Date: Tue, 17 Jun 2025 16:31:25 -0500
Message-ID: <175019588857.714929.4560979483965120623.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610-mdt-loader-validation-and-fixes-v2-0-f7073e9ab899@oss.qualcomm.com>
References: <20250610-mdt-loader-validation-and-fixes-v2-0-f7073e9ab899@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 10 Jun 2025 21:58:27 -0500, Bjorn Andersson wrote:
> 


Applied, thanks!

[1/3] soc: qcom: mdt_loader: Ensure we don't read past the ELF header
      commit: 9f9967fed9d066ed3dae9372b45ffa4f6fccfeef
[2/3] soc: qcom: mdt_loader: Rename mdt_phdr_valid()
      commit: cd840362b0a7b3da59740c1380b18ce0ccf8c264
[3/3] soc: qcom: mdt_loader: Actually use the e_phoff
      commit: 47e339cac89143709e84a3b71ba8bd9b2fdd2368

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

