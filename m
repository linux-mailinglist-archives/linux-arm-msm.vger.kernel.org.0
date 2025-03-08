Return-Path: <linux-arm-msm+bounces-50691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCDCA578B2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 06:44:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 820331899F3F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 05:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0E5218FC74;
	Sat,  8 Mar 2025 05:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M+S43vSJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889CD18C933;
	Sat,  8 Mar 2025 05:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741412615; cv=none; b=aDpPoPTjQEyqLTeUKczW9PCxdtVMGJRD5hI92ZhlI7OpOEd+zpnqJqPzAn5TRu++yF+l94FkxR/al5xpJpLX4+Kwq4fkUxDgnt00hom4bsrPk8qB5/5mGBkFW7brYXvSJBxPxBMSXTriUUAZ055TS/xK0XHaUuxZPt04qYRqlGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741412615; c=relaxed/simple;
	bh=DQb89z/nE0fxb6tMyYAAm0zPP7SNExW1V/on/pfCtoQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JlTv1cH8PjnfZ0YDn3d4jUKNqSge1651OJ5jFUegkFXCUgSTEpmg5mXPl46ztEHFToZLLOmbbw/wNqM8REy35KkfssXnOf81+exjtIiINycM/rqqJsGjn7cYA1BpKpK51HkilqGIUKmIYUjbVfN9vUz9+O7osQ9ybDHEJ1S4i04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M+S43vSJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD3EC4CEE0;
	Sat,  8 Mar 2025 05:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741412615;
	bh=DQb89z/nE0fxb6tMyYAAm0zPP7SNExW1V/on/pfCtoQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M+S43vSJNdcC9Z1R62zb4K03hXsqOzBjdVryjy/98O0tBXVSw+L1sE7V/xe3JqvjC
	 tAWCi8p7miqA/wCk5M0TRJ876UMESTE0oGN99Rw5/ceSol/iAYkw94YUukjGvF80a4
	 TzOAn0OsyvTCjeFqVbeIbbkH8a16F5Jra8Z3OuimQ4EAiG6ByUSNB0gGaqZ4AHHXvA
	 SzSmfkz8bk3HTT8N5+vM8Zn9Lt7lXgz3EdZGmo1ioQV/iuoCPNB4R+tc5VmWuqEVVP
	 OZdlQImVRNrsnCZk0cEJDxUlKWbshR/EtKzuVzDXC36aQfR7byj+8BPFuqKIgsb4e1
	 UpOEg/717qe9g==
From: Dmitry Baryshkov <lumag@kernel.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Adjust CDM_MUX to support CWB PINGPONG
Date: Sat,  8 Mar 2025 07:43:15 +0200
Message-Id: <174141256286.1924437.6620369069852592646.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250305-cdm-cwb-mux-fix-v1-1-16148ca6e4d2@quicinc.com>
References: <20250305-cdm-cwb-mux-fix-v1-1-16148ca6e4d2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


On Wed, 05 Mar 2025 19:16:51 -0800, Jessica Zhang wrote:
> Similar to WB_MUX, CDM_MUX also needs to be adjusted to support
> dedicated CWB PINGPONGs
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: Adjust CDM_MUX to support CWB PINGPONG
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1cf5cd92a20b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

