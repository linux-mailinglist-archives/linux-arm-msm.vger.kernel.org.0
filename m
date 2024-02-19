Return-Path: <linux-arm-msm+bounces-11743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C38485AD1F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 21:26:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBA2E285A9A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 20:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264A13D38C;
	Mon, 19 Feb 2024 20:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="3X7YNmey"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A19F374DD
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 20:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708374371; cv=none; b=ggg4LnUuhKiwAXWTdqC7Ytp+FzbMEoK4ab2onLsKTRxxH+6vpwCynQvlbul/C3acznX/RiSEQK+GDGuNRoim7B3qMdepelbSYFIbcT75P1zelWgCVAUgYHoBbKkA27gA+1z/bYwIsorUzzux/h2yHzbRsBVOh2l6YQi0Nu8zk9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708374371; c=relaxed/simple;
	bh=kyosV47JTi0wpAR/5w3/fTsHOGbVDVvLMTUT+Swn/aw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HGX0CjGf26kfr3tKZ6wNG/pERvFo71XuzzMiQOchPaZeqYUumrXVyd4oKQpyLgFzEOaqW5XCmbFRQzUYegxODMgCik7n2NWNGk6qfkA0kIGgUMcOjoWIyKfmaQQJT71DWVJ3mF8bbllG/oNRxbdmAz88emoJuRbjQWiBwZ5D9gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=3X7YNmey; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708374368;
	bh=kyosV47JTi0wpAR/5w3/fTsHOGbVDVvLMTUT+Swn/aw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=3X7YNmeyROwNimof/BElkf0c+nJpnJjggiSaIIFSCvocEYKcrjk0uASQ95xB0vewx
	 iYjXONra2WeZNOR4o3y9OGZgcOLXxk7tslPYlAM20GrophOahnTvO+8kxAOCOKsONy
	 5t9OdrRHx/Atpl8iwhairHw7CmGHJWDa2Cayufax9HieUI/o3s0iAfQUC4Qekzbe2a
	 U3NlH6pEcot62kCiUIB7fOuYGkdzqV96wpORMie8FNl2nmdjXcBzXzdcPx/sH74rna
	 8SaHTVeO1KbTM/buxDIM7mHQMDABq5ngBSVJpKGNAwpnnVhW/4rvldwyHfzbmUiecy
	 H96I128MvS36w==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: koike)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3A8A63782081;
	Mon, 19 Feb 2024 20:26:03 +0000 (UTC)
Message-ID: <d62d3507-20ee-4230-ba2e-c530ea5a9a60@collabora.com>
Date: Mon, 19 Feb 2024 17:26:03 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/ci: update msm-apq8096-fails list
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20240218041204.2522828-1-dmitry.baryshkov@linaro.org>
 <20240218041204.2522828-2-dmitry.baryshkov@linaro.org>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20240218041204.2522828-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 18/02/2024 01:12, Dmitry Baryshkov wrote:
> Mark two tests as passing on the APQ8096 / db820c platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
>   drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
> index 2cd49e8ee47f..88a1fc0a3b0d 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
> @@ -1,4 +1,2 @@
>   kms_3d,Fail
>   kms_addfb_basic@addfb25-bad-modifier,Fail
> -kms_force_connector_basic@force-edid,Fail
> -kms_hdmi_inject@inject-4k,Fail

