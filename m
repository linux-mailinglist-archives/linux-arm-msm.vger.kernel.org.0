Return-Path: <linux-arm-msm+bounces-64687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AED9AB02EFC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Jul 2025 08:49:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDBC5189EFE1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Jul 2025 06:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6C921A2545;
	Sun, 13 Jul 2025 06:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Y0LNISne"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0FA2D023;
	Sun, 13 Jul 2025 06:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752389377; cv=none; b=fAWnVVWZCJMWWN/JJfpdeLC7pxymuplL4c5lNtzLiyzqUa4ClDcB3oCmqITbcc2I81MFi3CIZPmOaUgGXZ0rIm6LHzMITVR3Q+5N8TzB0N8yZPhuw45Y3vci3bmQmjzTjKjvmkxrmnBZTedbB85xCreWj4LDH25Ledr3/cQV+Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752389377; c=relaxed/simple;
	bh=ZTPEBF9Pdxm50M1QA4KJLVouLA9LbXt6HNmT9cC7PYI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GM2TRapnONtwNARGVkEpIj6CAVM9mtVpBiOIR1wYtL4I+CHjx/A2joJrnK1Srt/sB/TD2yKNlx9rWIkQ1H7xE5HkS4ezeujNZLAHMp1Y6srdbmiz1IPQlESgIOrnTbhYbUrouPYYOgIvky8QE+OP7NkP/75M3H25SBIDxqopm28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Y0LNISne; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=sLbiq/0nfCsd9v6VJPO9Ovu9FstS4u9XiQgcgz6zoEo=; b=Y0LNISne1pd2goWJ2ms/VjfQ3v
	LI1oCZzY66HjcZ0VEEeBgp9yI0uHMk5SAYamAV1UkvbNbjLKra9z+O9+iTj7kMyXUBy5pK52ran/w
	ODlaGL947uWAVanUNIUbf3CKbSoKrRbOTlarKT/EbavmVrONm9XSoCzu65LgC53NlNS8b/qLGV+XD
	CYCYZOW9N/3Q+gDjI8ye/k8Q3y8d7Fcc9XDwNh5pxrgTMs5Ww9+km3Wncn7H3weHUZQdmLWmTeCZd
	V/t0XuJwoasEm73YtwsNEctm0eD1Zl8M1zByKIrSIJNtblFsPJXt1Tbnc0yuOkTRdh2MEop42kZr5
	IZUVNG4g==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaqWk-0000000HPnB-2NSK;
	Sun, 13 Jul 2025 06:49:34 +0000
Message-ID: <e744987a-2fed-4780-a9c6-fd1175698da8@infradead.org>
Date: Sat, 12 Jul 2025 23:49:34 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jul 11 (drivers/gpu/drm/msm/msm_gem.c)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 linux-arm-msm@vger.kernel.org
References: <20250711191014.12a64210@canb.auug.org.au>
Content-Language: en-US
In-Reply-To: <20250711191014.12a64210@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/11/25 2:10 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20250710:

on i386, when:

CONFIG_DRM_MSM=y
CONFIG_DRM_MSM_GPU_STATE=y
CONFIG_DRM_MSM_GPU_SUDO=y
# CONFIG_DRM_MSM_VALIDATE_XML is not set
# CONFIG_DRM_MSM_MDP4 is not set
# CONFIG_DRM_MSM_MDP5 is not set
# CONFIG_DRM_MSM_DPU is not set

so DRM_MSM_KMS is also not set:

../drivers/gpu/drm/msm/msm_gem.c: In function ‘msm_gem_vma_put’:
../drivers/gpu/drm/msm/msm_gem.c:106:54: error: invalid use of undefined type ‘struct msm_kms’
  106 |         msm_gem_lock_vm_and_obj(&exec, obj, priv->kms->vm);
      |                                                      ^~
../drivers/gpu/drm/msm/msm_gem.c:107:39: error: invalid use of undefined type ‘struct msm_kms’
  107 |         put_iova_spaces(obj, priv->kms->vm, true, "vma_put");
      |                                       ^~
../drivers/gpu/drm/msm/msm_gem.c: In function ‘is_kms_vm’:
../drivers/gpu/drm/msm/msm_gem.c:668:39: error: invalid use of undefined type ‘struct msm_kms’
  668 |         return priv->kms && (priv->kms->vm == vm);
      |                                       ^~

-- 
~Randy


