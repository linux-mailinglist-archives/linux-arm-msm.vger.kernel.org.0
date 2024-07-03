Return-Path: <linux-arm-msm+bounces-24960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2D0924FBB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 05:39:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B01428B96D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 03:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BD7D3A1DA;
	Wed,  3 Jul 2024 03:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mtI9SEOV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4F93CF73;
	Wed,  3 Jul 2024 03:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719977863; cv=none; b=gS85c0nOpigNpawki1z5tN36g6Do9BMbzh2L2xsvRWt51QWrCP/MG3iAxJ6bZVe35tzWzVDd6a4zbQtBdq2TeiyLv9gOVSWuDSKRUPZNpP3pa9/C+L2l6gAQom54Vt+X8iAo/AJd8jDsjAam1sOUWYE706CFiK3KGgmbzENNNn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719977863; c=relaxed/simple;
	bh=IQKmGLGA4Sltc/YzMkzZrkzhPn+PBbSEtBAa1q25RHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dP6vri9rfdYWIL5U3GzLniPL3lwq+Q5FUDkxk2kbA61+G3NmEm2q8ongparwsEffQnsVYZz9ivy30boPN8v8j51M0tJFF0Md4JW6tveYtXpHmeeXfXVTIUvYers0+yPuOfY0eIG08SuRkWIN+Es9L/baN0fNv4rdLtrQ+m575AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mtI9SEOV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E543C4AF13;
	Wed,  3 Jul 2024 03:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719977862;
	bh=IQKmGLGA4Sltc/YzMkzZrkzhPn+PBbSEtBAa1q25RHA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mtI9SEOV0LE6Nh+22vHdJPw7DYBu/cenTbyowxiDnIGdqDUG7Y94Y6Fns+crLf0S2
	 dkiaQpgkwOZKx3Xvt6E7I9LcQ68yVKkOlaU7p4FuzIaxbOuyYDGApSc8ObfRNVkvLz
	 aPt3Na0CYLBdOiB74+4JXn+eaIpg2kiORQ/CPlgQiOyBP4CahtT/FolB1jqmGsM2zr
	 qDzpgRgsiwoaZlbRI0BOeQBFc922hwI6wSkEuhlpJFYko+KI/BX4ZYkpkNQ0rozZ6u
	 1e/WeZrgICqcDyhD56Y48A7edZniLyI2Fd7ufhO8E4CM8QMw8x+dcTJ6TiJwt14yBC
	 h8VTnNx7P+zzA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Chris Lew <quic_clew@quicinc.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Mark Brown <broonie@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] qcom: fix missing dependencies for the QCOM_PD_MAPPER
Date: Tue,  2 Jul 2024 22:37:25 -0500
Message-ID: <171997785345.348959.9767564474353680940.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240626-qcom-pd-mapper-fix-deps-v1-0-644678dc4663@linaro.org>
References: <20240626-qcom-pd-mapper-fix-deps-v1-0-644678dc4663@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 26 Jun 2024 22:12:36 +0300, Dmitry Baryshkov wrote:
> While refactoring pd-mapper to use auxiliary bus for the PD mapper
> instantiation I forgot to select the bus in Kconfig entries. Fix it now.
> 
> 

Applied, thanks!

[1/2] soc: qcom: add missing pd-mapper dependencies
      commit: b89c5bc72102469a87f0c6ec0ee7112ef2eba01f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

