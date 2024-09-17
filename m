Return-Path: <linux-arm-msm+bounces-31916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A939B97B0F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 15:47:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC4011C23431
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 13:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03B1416BE39;
	Tue, 17 Sep 2024 13:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MqMdtRRZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8A54C66;
	Tue, 17 Sep 2024 13:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726580835; cv=none; b=UkmM+/Kkodq5MCWlFXwjhhDCLtdpAX0zf5bLXjLRTmVSnccLc/p7EaOksJD+hnXwGUeu8C+D0i6Lra72QNDjf8w5vyHyKUrgEr8IyqX4VO0QS/3IhS/eYU1pkKXhRd73Diqk01G09OahatKXIkVZ7yiRMGRWVtvL+DmLK0fLb98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726580835; c=relaxed/simple;
	bh=7y6lHUpzj4ENEmnHvaebsCoZS+iyBAZnVBKU3B6lWDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pozSE0EBC6EBiBJpwiuPYlRHq+Y3pW1rqqQObL3pMo8v4VI/FPsmF44fS8nSlAOGA9lhibX9kCDH6dfiXqKXGwLrtf4t2uTI7HH/lUqYffWMG7OVUaH6rnpVNxD/idOgCrP/bmxByCOS47cD5DCgYOrg9HdFM7GTiZ95BhbUeCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MqMdtRRZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15AF5C4CEC5;
	Tue, 17 Sep 2024 13:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726580835;
	bh=7y6lHUpzj4ENEmnHvaebsCoZS+iyBAZnVBKU3B6lWDc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MqMdtRRZV63AnQHWPtxOTGhHtWlxc1KhYE0chiME/JxAPNt0dL+J9PwCVMjLgITC3
	 JwVuprAk32FrR4PtfFncK/8RNYTSI0uIfqyQAk7IVrs9IR9bQd8qhyK4ACpNUxFble
	 NCw4Joz4goylRplx33CNtvyZYwIoOq8hOWQyoiymF/EZ+7BDM00AoX/cLpNdu4zItA
	 I01I0V5yKd21Z5yXy7+kjAN2rLwGopNRzEPF5DFB5XqzviNUBL6iktN/zqzifAqJlK
	 r5B0tptlap2UpngcqoqQ1eluLD6uV/xZjZ+fMg+oR+T4HeVmd5b/fZQI/KaHS+fN65
	 i6BsaaAGgMpjA==
Message-ID: <e6991910-5058-4ef0-bfdf-6d33953535dd@kernel.org>
Date: Tue, 17 Sep 2024 15:47:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx+: Insert a fence wait before SMMU table
 update
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20240913195132.8282-1-robdclark@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240913195132.8282-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.09.2024 9:51 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The CP_SMMU_TABLE_UPDATE _should_ be waiting for idle, but on some
> devices (x1-85, possibly others), it seems to pass that barrier while
> there are still things in the event completion FIFO waiting to be
> written back to memory.

Can we try to force-fault around here on other GPUs and perhaps
limit this workaround?

Akhil, do we have any insight on this?

Konrad

