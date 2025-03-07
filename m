Return-Path: <linux-arm-msm+bounces-50592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C8142A55F9F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 05:56:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7DB97AA4D9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 04:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1D2B18DF60;
	Fri,  7 Mar 2025 04:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X5VDSJvy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818434642D;
	Fri,  7 Mar 2025 04:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741323357; cv=none; b=E64Ax2ORot5CyJxhuuifc3n+riGJw3YwwoLtB9bLW5ccjRvXDX2r+ynWa1GxUpjrrGjG/Tl4CaJEsTbvKxCJYCfw3tno0hSrzXYGUe8Nps2MH32QVcPEi+g3uzs4324X87878n7AsegKpmgrt+K+USgQt8AStnJGpPAmnA9wJjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741323357; c=relaxed/simple;
	bh=E1tGqBG4q3WyXmXJFf4A7lz3Msd3by1RgkwFKwYO8z0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xj2o12nQpfcPFx4ZX199Ht2GeSJ4DWveC1yuBM6Pe35oldDh2s8y73eyK0HOG93zx9X8LaOwaBcRPyyybMXWPugitT3d56cyTsiaE0/mnJcoxKuB/fYBYt14h5ALxTFUszgPZUYgl5Q0YyLScQFWFAHOq5Vx9qFUhJyqk0tuz0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X5VDSJvy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B88E1C4CED1;
	Fri,  7 Mar 2025 04:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741323356;
	bh=E1tGqBG4q3WyXmXJFf4A7lz3Msd3by1RgkwFKwYO8z0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X5VDSJvynweTliVM/mhd/EafcBxkNXlRSUkGExLFKCrd/35utULDpAU2pMWcX16pU
	 O3vU9J3CFkj4cvc6wOAujv1SWfuDzxCk2P8AmqJGfdMyMfMNa4+0PiYIFCVW2lO/qQ
	 0tHSBWCyFwQUvJs9kGRLa0nOLurZe00hVGC0A8mQBcp0T15xRe7+ke2edvG8GefcyR
	 cediCSXU1FFfC4NI453QkMEI8Osvokwv1bd5Wpr92v+YFJVUqMa7FVcdrSAWOcGuaz
	 9FFYUbgFDmkLgVJ58sgxK+RVHZe0NYqlfRmJkGu2t8uN0KB5YlVmS2240TnverfS7d
	 KZk36pUJowqwg==
From: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/msm/dpu: fix error pointer dereference in msm_kms_init_aspace()
Date: Fri,  7 Mar 2025 06:55:45 +0200
Message-Id: <174132271320.1132259.4482083694406886110.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <3221e88c-3351-42e6-aeb1-69f4f014b509@stanley.mountain>
References: <3221e88c-3351-42e6-aeb1-69f4f014b509@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


On Tue, 25 Feb 2025 10:30:26 +0300, Dan Carpenter wrote:
> If msm_gem_address_space_create() fails, then return right away.
> Otherwise it leads to a Oops when we dereference "aspace" on the next
> line.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: fix error pointer dereference in msm_kms_init_aspace()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f9d1b528219b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

