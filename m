Return-Path: <linux-arm-msm+bounces-64725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E63FAB03264
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Jul 2025 19:47:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 033E018902E3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Jul 2025 17:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B976A282F5;
	Sun, 13 Jul 2025 17:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="4A0XbSPZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE3B367;
	Sun, 13 Jul 2025 17:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752428831; cv=none; b=IgEScNwZyxKV9bu9JMGjsPPxE1ymaM2J5HCzqgzX6yxQWMmX1rdCjzqwkk5ijIstXQEPQO3GAN2hyYOkK4xLkffjgFiVZj6JbCwZOulQOwNMon6HaAkLoWXRs/24itSWdMW8zdbZGe8CT7e0xEt8We0inRGOiIHTKzeduDKsI00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752428831; c=relaxed/simple;
	bh=Z1a5FlUug/Xgzjp2Qa39rouNlZUs+k6rFiAgpiKspXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cG8y7q/2dDeuIWO5UwVYNQ1rhzpoZGeSWNOKVsDa6y2JPK85mGb+clX3Xlo2iaqC1yrfUHTjWPGG9uLUNN/ZF+86G69lWGef3xCPUpGS6DEnl4nbem58wCd4ux2kGlqKGBayXauSBWlaiiqO5lt9okaRWYy0Tsu1SEj1Kjdpl1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=4A0XbSPZ; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=dxjIbJLbW660urFtjoPpw/CIrbYdNJjnXkmZ8rGQGbI=; b=4A0XbSPZBFCkpa16G3THW2vfRw
	SQuw2dGWqHVBTTCG1QBjjPoFkrZNZyYK7LnNaS4uo4KNoRHef84DmbpAhUzE3A9JhsR0IIch+AeWJ
	74H1ZnkoFiHJB1E9Vkzz7Orm5aVNow+i5J+6EueBwfTRMe0pJlusYW1Q1XPk9w4lITOxy1rrqtmN2
	SEoIvJo+tkVgLc/Y5UXZzpxcZnRC+RBxSLein6w2FuUp9B5TE61Cg5RyJE/3WYbVdzrWohjozca8h
	7G7cRc62eubkwU0Q+owLUYAURnCNQ71odj+Lc1QxG1kqt2/LC8y6AtI6LYgG6X5HSxXxFb44TzNsp
	9fbGYzow==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub0n5-00000000SWN-3ZHM;
	Sun, 13 Jul 2025 17:47:07 +0000
Message-ID: <e761aadd-ac2c-4c77-84bd-104acec70747@infradead.org>
Date: Sun, 13 Jul 2025 10:47:07 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jul 11 (drivers/gpu/drm/msm/msm_gem.c)
To: rob.clark@oss.qualcomm.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 linux-arm-msm@vger.kernel.org
References: <20250711191014.12a64210@canb.auug.org.au>
 <e744987a-2fed-4780-a9c6-fd1175698da8@infradead.org>
 <CACSVV011qEHt5Srx4QdP5=L9WqxTg9yjY63rTUGwbXawq899gQ@mail.gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CACSVV011qEHt5Srx4QdP5=L9WqxTg9yjY63rTUGwbXawq899gQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/13/25 6:16 AM, Rob Clark wrote:
> On Sat, Jul 12, 2025 at 11:49 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>>
>>
>> On 7/11/25 2:10 AM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20250710:
>>
>> on i386, when:
>>
>> CONFIG_DRM_MSM=y
>> CONFIG_DRM_MSM_GPU_STATE=y
>> CONFIG_DRM_MSM_GPU_SUDO=y
>> # CONFIG_DRM_MSM_VALIDATE_XML is not set
>> # CONFIG_DRM_MSM_MDP4 is not set
>> # CONFIG_DRM_MSM_MDP5 is not set
>> # CONFIG_DRM_MSM_DPU is not set
>>
>> so DRM_MSM_KMS is also not set:
>>
>> ../drivers/gpu/drm/msm/msm_gem.c: In function ‘msm_gem_vma_put’:
>> ../drivers/gpu/drm/msm/msm_gem.c:106:54: error: invalid use of undefined type ‘struct msm_kms’
>>   106 |         msm_gem_lock_vm_and_obj(&exec, obj, priv->kms->vm);
>>       |                                                      ^~
>> ../drivers/gpu/drm/msm/msm_gem.c:107:39: error: invalid use of undefined type ‘struct msm_kms’
>>   107 |         put_iova_spaces(obj, priv->kms->vm, true, "vma_put");
>>       |                                       ^~
>> ../drivers/gpu/drm/msm/msm_gem.c: In function ‘is_kms_vm’:
>> ../drivers/gpu/drm/msm/msm_gem.c:668:39: error: invalid use of undefined type ‘struct msm_kms’
>>   668 |         return priv->kms && (priv->kms->vm == vm);
>>       |                                       ^~
>>
>> --
>> ~Randy
>>
> 
> fixed by https://lore.kernel.org/all/20250709140838.144599-1-robin.clark@oss.qualcomm.com/

Sorry I missed that patch.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

-- 
~Randy

