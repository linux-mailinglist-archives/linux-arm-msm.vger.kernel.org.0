Return-Path: <linux-arm-msm+bounces-52442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD475A6EEA6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 12:06:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B10F168819
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 11:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D4C1255E2E;
	Tue, 25 Mar 2025 11:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BDM6SVMI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39388254AE7;
	Tue, 25 Mar 2025 11:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742900799; cv=none; b=qFkVJmnZQP2Zq97/Ms8SArS7dTt3u1BVElXcE1a8i65dnAkCJyGg0rVH69F+MV/EHYNuqlioCjcNrehiLQ6m0MQFavHOVtDSLqjIKj+cBYglc+VS2ECW+3L2d2sZXmC1L+xGRNOcO9r5pQ4+vnZkG7hjX95nHpiTrdIOoe4vqSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742900799; c=relaxed/simple;
	bh=D0N/mgLzCXi4oZJoUT9/lMZngBeCJnMRqCEe8RPVzCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gQ05cZxF/aJ2jTEX85ApRfHrCX/P0AlCeLcoouX6swHoEIVMYFHgc2BNepvlWNBNFwmyt2gxqSloVscQAfb5D/s/VAQ1aoIJixbfFOQXqFcuEwe9o4D3UMKhXgfo6z6XcuFEIUyWwKb9jskxt7i5BpC7BXdFXdAg75txaRGUWms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BDM6SVMI; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742900795;
	bh=D0N/mgLzCXi4oZJoUT9/lMZngBeCJnMRqCEe8RPVzCw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BDM6SVMILwPq70pCVbl5bItk8GC0tcw9Yf/34rYFw6mCnsN+0yUhfJ/hjiEeDmn72
	 U/rtTB5SmTcJGgmK3BZgMDjTc0hOnJaukjn/UNzwgBnVk7brn9q0PkuiUIBfUuZDFV
	 /zv/Zxa8KTIPQG2taIBBWZ5p/GXotmZq93q8rvpyMR3QhlH9TaqL4UWMJLUDFeiJav
	 oaWEJjL7EdSh00MXLBQG9R/fO5qaK1ES5NL0feETn5ewOfDXhGrOCpSZC+OTwfLJOL
	 KAzWvgqVBrQpvPHyVOUJI/5otjdYifxjbuAroFyqWGttAulvH7kZxZ+7Cd/mLVZAPr
	 QrTihiq9olnjw==
Received: from [192.168.50.250] (unknown [171.76.87.92])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8ED1117E09D6;
	Tue, 25 Mar 2025 12:06:30 +0100 (CET)
Message-ID: <c71855d0-2638-4f06-9b75-cdbd137837bb@collabora.com>
Date: Tue, 25 Mar 2025 16:36:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] drm/ci: uprev mesa
To: Daniel Stone <daniel@fooishbar.org>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
 robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
 lumag@kernel.org, quic_abhinavk@quicinc.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250314085858.39328-1-vignesh.raman@collabora.com>
 <20250314085858.39328-2-vignesh.raman@collabora.com>
 <CAPj87rMjF84yyPqBshuGu=8qx6Xhq9Z-HgEnQe=tRtbu3E8OtQ@mail.gmail.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <CAPj87rMjF84yyPqBshuGu=8qx6Xhq9Z-HgEnQe=tRtbu3E8OtQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 21/03/25 15:56, Daniel Stone wrote:
> Hi Vignesh,
> 
> On Fri, 14 Mar 2025 at 08:59, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>> LAVA was recently patched [1] with a fix on how parameters are parsed in
>> `lava-test-case`, so we don't need to repeat quotes to send the
>> arguments properly to it. Uprev mesa to fix this issue.
> 
> Thanks a lot; the series is:
> Acked-by: Daniel Stone <daniels@collabora.com>

Applied to drm-misc-next.

Regards,
Vignesh

> 
> Cheers,
> Daniel
> 


