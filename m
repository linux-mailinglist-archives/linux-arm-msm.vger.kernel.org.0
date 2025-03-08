Return-Path: <linux-arm-msm+bounces-50690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A536AA578AF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 06:44:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59A56174F89
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 05:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5547E19E968;
	Sat,  8 Mar 2025 05:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dnk74kIv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED1218C933;
	Sat,  8 Mar 2025 05:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741412612; cv=none; b=mQgVwtVX+rkvk9zMk2wm+h+2x3bBFcD2B7M0HkLg3f/phzYgFVgDlaidv4KnBnxq5mGzgq90rsjTQhUyojelz1fbEg+DnlnzZnkUPBrvzs93KzVwvwW44mq74SijFZEy4lHKRnoDKtAEPs0MgrsD4C/ccPFGuKdCikmjeaoxVYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741412612; c=relaxed/simple;
	bh=79ix3lRVUR26d4f4Usz1pnoJzcSREjOoUHNJ+xQ10ro=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EpEq41f/b5XFavPqdm31AySlQaIUPksEfkA4iNQ1J+TecupK94Nh//I7qw0j2GEhI2QjTWb7+iHs6v9cWIBkJ2/cmgaPkXgFjWm6MBNnUHRE04AnANLAXvQWwF+RhSpUUL0nI6LmRCprKIpYLB4/m1YhL009zBMSWMQt1wyTSz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dnk74kIv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5542DC4CEE4;
	Sat,  8 Mar 2025 05:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741412612;
	bh=79ix3lRVUR26d4f4Usz1pnoJzcSREjOoUHNJ+xQ10ro=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dnk74kIvv6YoTf6PJNA9cz+71d5+a3X7GksQkIYCJ4zPuQSasxX34a3O9nRRh3YI7
	 5N89BHJO15b4Wm62SYoFhfH6AwNfF153IwAAdTQiBFsR23C0je9UaIFNSHSlsxzQaV
	 93J28GUJmCmNRUJSjXLetP841tHxrj60URRhmoPqVE6HnHKYFhJoCuoEI0N9dintvb
	 sTFw0yYKupY2rAJiUonUjqoVrILaCdklatvQW6+zHpaB9NLk+TDzttqvz+zC5z9t5+
	 8IKmdW8nqDYcnJDLoVNt8ouvu6CxmtEFbTGJlYjOyX1Eq1b4x6zhQrjv+Vm7c0wF77
	 r3OYJODHFiKkA==
From: Dmitry Baryshkov <lumag@kernel.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] drm/msm/dpu: two fixes for kerneldocs
Date: Sat,  8 Mar 2025 07:43:14 +0200
Message-Id: <174141256286.1924437.10541694717666004820.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250306-dpu-fix-docs-v1-0-e51b71e8ad84@kernel.org>
References: <20250306-dpu-fix-docs-v1-0-e51b71e8ad84@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


On Thu, 06 Mar 2025 10:22:28 +0200, Dmitry Baryshkov wrote:
> 


Applied, thanks!

[1/2] drm/msm/dpu: correct dpu_crtc_check_mode_changed docs
      https://gitlab.freedesktop.org/lumag/msm/-/commit/096775c3dcf3
[2/2] drm/msm/dpu: correct struct dpu_encoder_virt docs
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2ee664833000

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

