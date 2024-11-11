Return-Path: <linux-arm-msm+bounces-37494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A732C9C448C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 19:08:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BCC71F20D48
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 18:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57ED31A7066;
	Mon, 11 Nov 2024 18:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KZ8ZConb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D464C66;
	Mon, 11 Nov 2024 18:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731348514; cv=none; b=AT7FB2O8cUXd7Y/55xrn/7+NQmH0K6hMzir1F80JTsO3e9kx5ldqTOA1xtQEw2/k03aHs4lR1fVWvyszHdDWYUoCyjHO3sF/wkEmHeEuSi+uW4gMSPBO58OcQybFXefWqhLC65Wmi0pUttyonLdj1PCDb6sGghmaBqyBtp+SHxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731348514; c=relaxed/simple;
	bh=AEvF+lxs/+5g7LFaaobL1cTI1sRUJ97tB8YlBhuVWfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tLfevYuLag+4ww9YQShBd+XEOOVdhZqKUP0SO7S7qcSWqKBDWEOIn0Er4vWZafgMQ8is9FBYrjpmr3KKYG/QGOE+5bGolTdiYMbwLmKFiqMrp9XxtH8iwbjvMocT+KVtZjCmjusUGhS0gU7HTOwl1oOlXKCD/CsuDR0r0dtlYCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KZ8ZConb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC05C4CECF;
	Mon, 11 Nov 2024 18:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731348514;
	bh=AEvF+lxs/+5g7LFaaobL1cTI1sRUJ97tB8YlBhuVWfg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KZ8ZConbsjyDJcVw6oxZ+ctk2irCZm2M8eq6B88tVhGYr1AabBhfilstVivond0wU
	 zOJssRhGu/jQ/MtALIE4SZ+4Mj/Av6tc+Ozz5lYY+jcDKcBzysgN52dEXZCfO2Ss+z
	 VpqvpT4SqEwAkzimaNDQV+75qtlUgbVxVuLHx39fs83eMObPj8RDdt4kdBIxqvaAdl
	 bD26t3H79LIdJ2KuE2Zyk7EEzqCY5Hw3LFSB3GwYJJ3BVkEv4bsVmZ8GdyDelqy7W0
	 NQwwFjlwWimiqvEINDyW092S++cw3enZ39km4PUoecwFW/Z6c33/T9uauTBMuBpelv
	 k2UMAfkuGWkpw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 0/2] drm/msm/adreno: Setup SMMU aparture
Date: Mon, 11 Nov 2024 12:08:31 -0600
Message-ID: <173134850914.212509.17711783777299070949.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241110-adreno-smmu-aparture-v2-0-9b1fb2ee41d4@oss.qualcomm.com>
References: <20241110-adreno-smmu-aparture-v2-0-9b1fb2ee41d4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 10 Nov 2024 09:33:39 -0800, Bjorn Andersson wrote:
> Support for per-page tables requires the SMMU aparture to be setup, on
> some targets this is done statically in firmware, on others it's
> expected to be requested in runtime by the driver, through a SCM call.
> 
> Marking the series as RFT, as this has been tested on a few different
> modern platforms, but only with Qualcomm presence in EL2.
> 
> [...]

Applied, thanks!

[1/2] firmware: qcom: scm: Introduce CP_SMMU_APERTURE_ID
      commit: 1af75b2ad08bd5977c51c2d0fc11741a4c0a48d9
[2/2] drm/msm/adreno: Setup SMMU aparture for per-process page table
      commit: 98e5b7f98356cef2f13b54862ca9ac016b71ff06

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

