Return-Path: <linux-arm-msm+bounces-50594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65289A55FB1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 05:56:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDCD7189628A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 04:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53B63199E94;
	Fri,  7 Mar 2025 04:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sYxPicWK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8B31993B1;
	Fri,  7 Mar 2025 04:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741323365; cv=none; b=pD8KrcLFFQB61cbYaqnH+uGOpt/EleHvvJB4zsfRKyZg6FLGMxmkHyIG4x4LhB788yRx/7ODXnp0AvMpaUU8NKt3Vifuf47107YC8+mpjmtFAyV03P/XlRSg928lhbqA9ceE5HcuseshpY0BPWWJDHZM2sQnouwi9FqK975fmco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741323365; c=relaxed/simple;
	bh=2ZLuRs05EFLs3RD0f9DnbMQSSO8CqlO7N/wzQjxQSIw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e+ucvlC80A9N3KYWFQORumjwDH7WfcJS1T1KVY2mugv6OvYmb/d5qdjVAPDPsOWMXtS+53dk746gInJkSjWR7Pi1EdmjJyMMuD2RfKm0Cw/XgYe7KB1NTaWQW4glrZrbRRfhWxDvCjpESYfl6Tv5u9lN+9rZPXIa+kD49Fupcvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sYxPicWK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 795DFC4CEE3;
	Fri,  7 Mar 2025 04:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741323365;
	bh=2ZLuRs05EFLs3RD0f9DnbMQSSO8CqlO7N/wzQjxQSIw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sYxPicWKpJ28EHWTe/nUB/X51Mr3we/2sf7V7Hy8tKUdZJuGkzg17k1xkGs0D7BDp
	 vqt+ZNvrWsMaSEcfV7bsWJchXzGVTs/5/DVTbuDJDitbQ+sSXJZ/QVTj5fTn392nCg
	 SQsNw4ouGECX1in1qm/jfOseY46h3BHW4X25SGPy2Zo4ilbElD092GEcJROy9laJSf
	 VzwNG9W3nPHcJS1hazQtnCS0lNpIT9BTWT/Zr2PcQcEiRWWc7Uoy4LtiuxZWA9cttP
	 LEwgLIVJt2XlfhgtybScKaM0TlMr2cdW65owYyRl2ciez9US9WnPeHbq6mtRIODupL
	 xlU+2QJ8J1uLg==
From: Dmitry Baryshkov <lumag@kernel.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] drm/msm/dpu: enable CDM for all supported platforms
Date: Fri,  7 Mar 2025 06:55:47 +0200
Message-Id: <174132327773.1133698.16972736017988736297.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250220-dpu-add-cdm-v2-0-77f5f0df3d9a@linaro.org>
References: <20250220-dpu-add-cdm-v2-0-77f5f0df3d9a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


On Thu, 20 Feb 2025 05:59:21 +0200, Dmitry Baryshkov wrote:
> Enable CDM block on all the platforms where it is supposed to be
> present. Notably, from the platforms being supported by the DPU driver
> it is not enabled for SM6115 (DPU 6.3), QCM2290 (DPU 6.5) and SM6375
> (DPU 6.9)
> 
> 

Applied, thanks!

[1/5] drm/msm/dpu: rename CDM block definition
      https://gitlab.freedesktop.org/lumag/msm/-/commit/51bc064005c5
[2/5] drm/msm/dpu: enable CDM_0 for DPUs 5.x+
      https://gitlab.freedesktop.org/lumag/msm/-/commit/15f2825defeb
[3/5] drm/msm/dpu: enable CDM_0 for DPUs 1.x - 4.x
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d5c1e00ea2de
[4/5] drm/msm/dpu: enable CDM_0 for SC8280XP platform
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b5bbf4fab0a9
[5/5] drm/msm/dpu: enable CDM_0 for X Elite platform
      https://gitlab.freedesktop.org/lumag/msm/-/commit/989a24211eaf

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

