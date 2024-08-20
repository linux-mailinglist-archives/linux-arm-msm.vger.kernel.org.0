Return-Path: <linux-arm-msm+bounces-29090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2C69583B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 12:11:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 469071C23850
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 10:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751F818A957;
	Tue, 20 Aug 2024 10:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hU4Bk/3A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0CE18E34B;
	Tue, 20 Aug 2024 10:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724148666; cv=none; b=BN1trzZR5KK6mAvWcVMppZaDquFrR7DbK9gHcG6xtiKbxKG4YMK9cOuyVEVd6t9m3kQktEWQcyMBohClKQSyUkmoqbL2dz4OwHL4UXPiNZsVtsIQDyomDf7f8earT1NLloyuvW92eaO0pgcw+JB2EGz/TwcPujHGyaUpsZmkML8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724148666; c=relaxed/simple;
	bh=BpADP/Ry+du5JlYmwxVH1NvzPhRm4MYW1RLFt/IojHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e7+4t+xTYUxw5NACLm/3hgFtJe1qdzT6xeW/Jbuy57q1SaJJkvzHQAZ0jIWhUZHgi5Vpb50m+8Z/7RTixfUeLcmY/i2Q0QQKSIZ+dVrVBxANXDrE6d2YB2VutgbbDLoPWDQlatV1wQNWocPWQh/P7a/plJmc23kmyQpTfJBwgjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hU4Bk/3A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94FF0C4AF10;
	Tue, 20 Aug 2024 10:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724148665;
	bh=BpADP/Ry+du5JlYmwxVH1NvzPhRm4MYW1RLFt/IojHs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hU4Bk/3Aal4bz2q6+NryubNg5s2KrRiris1kQSXYzNWeJo8w81o05sa/jaxEiveso
	 4o2a4Z/TKZ0vhO31JWaqeYYxt9qGa/An72iwLhHNgsrgGWSRedRW0oUxfcjxwBdczI
	 ltNirI+kDcvaGYxEPHhYnRb08FqvcZzd1YZRD1expivNJ0TNtjG6ztpN0Fi/UClkZq
	 3nFF11w08x5crm5xFJcB//7tjpQHH6U8qo+FyP1bo2Qq1dCMJZOGOLNQET4vdRbte3
	 ujVhXZfemrDLVw/KoMSMx00QBh6JRetEDxjcEUNR2elgSfYt/k66S8k8fltSR1qttK
	 XGYcaVtiYLWhQ==
Message-ID: <613c79a6-c32c-4c3f-b648-673529004e49@kernel.org>
Date: Tue, 20 Aug 2024 12:10:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] drm/msm: Add submitqueue setup and close
To: Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
 <20240815-preemption-a750-t-v1-2-7bda26c34037@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240815-preemption-a750-t-v1-2-7bda26c34037@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.08.2024 8:26 PM, Antonino Maniscalco wrote:
> This patch adds a bit of infrastructure to give the different Adreno
> targets the flexibility to setup the submitqueues per their needs.
> 
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---

This email doesn't exist anymore and doesn't match yours

Konrad

