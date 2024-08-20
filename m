Return-Path: <linux-arm-msm+bounces-29091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D779583EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 12:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B8A61F25AFC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 10:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED86218C356;
	Tue, 20 Aug 2024 10:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E+tIGeo0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43FF158DC4;
	Tue, 20 Aug 2024 10:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724148997; cv=none; b=ar34sAMUycoDaQJY47JX2j2ERM3r09hc/tIt5AzVC7bOgNQ5K8vMBWHNAcPB8HB6oF5e9Ds5+tqq5mMkVHW05yaFbJve1B+rKU5n9uQYwiYfOu01WY9ddfnzn7NH/2ddjLfQ5D3VowqX4vIzQLsrgyLaO9F74cwCBPuZ2SyC0kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724148997; c=relaxed/simple;
	bh=VYFz7I5L5KLTqazknj1Zai/JP5hjQosrywDopQoE93k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lNmQifGsVUME+SGidnC8VdObTyYB9xWvFnVYA+B1OYK6vL5EOqw/pbLdm+zMM++9Obb1gh26uAhElhYgtZYLEgAIuS5qW+d3xHodywQWk/od/GASs7Ff0YsH7AqUIRMH275UqDEwz7s6ZEn8jBJ6W9urLvq8gNcXP/eWJavkggk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E+tIGeo0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01800C4AF0F;
	Tue, 20 Aug 2024 10:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724148997;
	bh=VYFz7I5L5KLTqazknj1Zai/JP5hjQosrywDopQoE93k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E+tIGeo0iURl25RExTGs5pQOg/7Ne4riA3599Qn9laJuUNeG3rju/UfWcobEr/rLL
	 KY7MLVjBDGeoi3oL7FgCRTHqHNuR8i3S9Hi2fQUmGXqtSd9SxA8G6B5L9kqBj7Fs5c
	 +DzDBl5T6bZCHW920X1yynZR93DPjy1vmGz770lm5zGnhzpb3ct8NiKhjk82t8ZMgU
	 iTnk4cN0gPsGM5lcEJFnIqhqsNHElxLR11uJ9cjA1CUJyTPks1Kd4NKBuu+cSCZNCB
	 TSVSuoVi7IYqIcVFoE63ydnI8jbqv7ho9hdcaVWvtfgyMlY4S9VASN8qCRf3m4foev
	 Sz2OTq8v1/abA==
Message-ID: <af10c83a-4a7f-46fa-8287-d57b73532986@kernel.org>
Date: Tue, 20 Aug 2024 12:16:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] drm/msm/A6XX: Add a flag to allow preemption to
 submitqueue_create
To: Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
 <20240815-preemption-a750-t-v1-6-7bda26c34037@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240815-preemption-a750-t-v1-6-7bda26c34037@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.08.2024 8:26 PM, Antonino Maniscalco wrote:
> Some userspace changes are necessary so add a flag for userspace to
> advertise support for preemption.
> 
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> ---

Squash this into the "add preemption" patch, or add the flag earlier
(probably the latter, as that one is already big enough)

As it stands, just applying patches 1..5 will break GPU IIUC.. and
that's no bueno for running git bisect

Konrad

