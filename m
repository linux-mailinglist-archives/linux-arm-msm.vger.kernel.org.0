Return-Path: <linux-arm-msm+bounces-29092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFCA9583FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 12:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 537371C2103D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 10:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C53718C356;
	Tue, 20 Aug 2024 10:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c5meRtdK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163E918A6BA;
	Tue, 20 Aug 2024 10:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724149128; cv=none; b=i576LBwc2s1CDFMYohgMXrHVMz2nydhJVueyG9kO/qCer0GIehYMnXkpgq4/I0ri6iaDJRtMdrjusdWO0swZydXu+DqdD1dX5SxOjqnE10l/sTCd7JD3ywQoYXZRC44Sj3j4ho/Z/vhFEucXYSEuUyaQrhmqsZcfUNy7VyqTUcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724149128; c=relaxed/simple;
	bh=iLG40Q2AHLIVrku5jyBHXVAf9G9PJDBm/KoBNZ8yUwI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=QwMrDxaP2jHenyAmFhrslrvqursgrt6wbqKfGrj8bWR2dnJDbE7hFJPG6WznjJw2m41jM2c34yzszQiIEAkGQb1FpY/zttgyqY6zdfw4fq+5VjEmorJkG+iqjUekPQQu65jHmo4i03G7CoTinW4wZzK1wHm2pn8hP2nSdHF6lx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c5meRtdK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4DC8C4AF0B;
	Tue, 20 Aug 2024 10:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724149127;
	bh=iLG40Q2AHLIVrku5jyBHXVAf9G9PJDBm/KoBNZ8yUwI=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=c5meRtdKTdaxQiOUyFVtpQ7XmUaFJEsD2An6yi9uDidjxc3iBbNwo4UAMbMHXlWax
	 Mv7M4xcFPjIhs9pAxjaMIl8mhnZtyl7xXhyr/2LXVVKRPtXOl6jNc9lAgiwyUM5IzP
	 x5X0YIyycRsLgimSjwnHzOfRVPIesPpWh1A7uycpAW35SrG5i2SYEDbQSjuZKHB2tY
	 8XzvN5i10c2iGnFAaK5fvQqr/WhzAE1TCXQcT2nbk/hjdxvgOnLdEhHUPOGmFbkRD+
	 EisVak9k6q7QWLsJr9gxBKHCNb345cBsr3IzhpFn5+J2o686nlUZ9qIBn405HLP0fA
	 DazX7wTAKydHw==
Message-ID: <5e911abd-6681-4c44-8b97-2d263f4bb13a@kernel.org>
Date: Tue, 20 Aug 2024 12:18:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] drm/msm/A6XX: Add a flag to allow preemption to
 submitqueue_create
From: Konrad Dybcio <konradybcio@kernel.org>
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
 <af10c83a-4a7f-46fa-8287-d57b73532986@kernel.org>
Content-Language: en-US
In-Reply-To: <af10c83a-4a7f-46fa-8287-d57b73532986@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 20.08.2024 12:16 PM, Konrad Dybcio wrote:
> On 15.08.2024 8:26 PM, Antonino Maniscalco wrote:
>> Some userspace changes are necessary so add a flag for userspace to
>> advertise support for preemption.
>>
>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>> ---
> 
> Squash this into the "add preemption" patch, or add the flag earlier
> (probably the latter, as that one is already big enough)
> 
> As it stands, just applying patches 1..5 will break GPU IIUC.. and
> that's no bueno for running git bisect

Or not, since the ring number isn't increased until the next one..

Konrad

