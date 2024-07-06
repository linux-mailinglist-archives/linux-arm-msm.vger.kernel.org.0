Return-Path: <linux-arm-msm+bounces-25427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FAE929575
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jul 2024 00:02:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C84C6B21631
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 22:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E953046450;
	Sat,  6 Jul 2024 22:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VimjbTyZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1ECE45C16;
	Sat,  6 Jul 2024 22:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720303295; cv=none; b=HIgpcIjlo9mfL3LTlQe9TnTaNt1x3kMKZRmBkgLg4esaYw3IbyOZc+w0QSDqp3POhNvWx6yzFqhKS/wtwKsniLZdzRbqS2RATgG5zwSJzLBI0UyOcvIAE5JlRherX3LY9SN1s8BzTh5crpaC+my2udDrnC+86EMiOJS5aAl5cys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720303295; c=relaxed/simple;
	bh=Z8bTOWSartrxDOyMDCKZy36HiLogR5YH5Sq606Ol0FM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R1pmoWRL3xu07ZS/pnJQtWsJLd6QoSBz8RXd29VyZgktGfvIn4GSZsEfE+HyfQsAmRXzUDLEbR0x/9GaF+a3qOrd12brvCwR5KTAJjq8UV9LyOaV/vmlIcQeSEn4NIUQVo4KQlSLQsr7s6YU2yxEbBcczMR7Z8173uoWwHda7v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VimjbTyZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8404EC4AF0A;
	Sat,  6 Jul 2024 22:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720303295;
	bh=Z8bTOWSartrxDOyMDCKZy36HiLogR5YH5Sq606Ol0FM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VimjbTyZJ/IUHKxPy9bUzEr4kSjYDx0vJ/7v3d5Lp5EA2SZffBT0oaFmnVbc1y9d5
	 +IeOcFfeIhtUP2TWMExOB6flIriigcIg2s+M9rG387EToXnVQnH9F1rvG6hsTZqI0u
	 dnu4C1gJbOQoJvBGvMdRyRFC+tcetODTS3oWrxjKDEufMm0WjFeYNDct2bFwvMRDGw
	 /4vv+IwS/uBuKBgcHRfpXrxfFQA+YqEkL1h4tQisugVxmTKhJ19dM8mKgGSeVP3uwM
	 dIg+j5jcLJYAJm8u/O0zNI6vTanZJN3L9bQT37oM0xaqvs25vsGKHws3P55rctFdjf
	 CnJQp0R3mWTlg==
From: Bjorn Andersson <andersson@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] firmware: qcom: tzmem: blacklist more platforms for SHM Bridge
Date: Sat,  6 Jul 2024 17:01:18 -0500
Message-ID: <172030328805.28909.16387072006047492124.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240704-shmbridge-blacklist-v1-1-14b027b3b2dc@linaro.org>
References: <20240704-shmbridge-blacklist-v1-1-14b027b3b2dc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 04 Jul 2024 14:12:46 +0300, Dmitry Baryshkov wrote:
> The SHM bridge makes the Qualcomm RB3 and SM8150-HDK reset while probing
> the RMTFS (in qcom_scm_assign_mem()). Blacklist the SHM Bridge on
> corresponding platforms using SoC-level compat string. If later it's
> found that the bad behaviour is limited just to the particular boards
> rather than SoC, the compat strings can be adjusted.
> 
> 
> [...]

Applied, thanks!

[1/1] firmware: qcom: tzmem: blacklist more platforms for SHM Bridge
      commit: 55751d3e9e96d5d64dc6ebb5bbdf70f45098f279

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

