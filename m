Return-Path: <linux-arm-msm+bounces-53627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9542FA82317
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 13:07:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA6D3445B53
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 11:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D804A25D21B;
	Wed,  9 Apr 2025 11:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=usama.anjum@collabora.com header.b="lD0Mqw2M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA84F4E2;
	Wed,  9 Apr 2025 11:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744196837; cv=pass; b=XN1zSkoPTOKOY21pVUwYUrHz2GgtquwSgwM8n6BSwfpwQmy3OUgyJUfuxxnuWDieuaPHerQ35yQ4VymNGlEHehCZ8Z3wb0UYgTpROVBaF9dXhf3f8XtQJr7sEbUXPEK4BaUe5F1u6zopB6b8OH1JtvUej5R8Bpp7xspZuayaMOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744196837; c=relaxed/simple;
	bh=2kVs8LDqqakchwzmyNag2tzPPlIh9j76cycJyxtacPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WW48vwp0KZuH9q4oyniKwuZUmdhx+DONpuHR1H1Tm1zcos2KNvzIWyyNOabGDomIMHFFt4z2ofDPSBeRJlxwGIYAI1vysKxYYYSA9VjjG2d5D9LzdFKVI1JZDqcmCKrE+OX6lVsYCIN77Lv6OoP6arotElmJs0hggQeD4oR5CZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=usama.anjum@collabora.com header.b=lD0Mqw2M; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1744196811; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Gtc+4LD8RTfe0yWyp7bqxkis/LbteYRGIAXs05ukcIR321fh1FFzJwhUzWZEGLnpYsZ07h2hxpX4mp7NOSe2STSRMnxAzjaoy+QIdVQhXkrzEY6nGBuQXTFpU51Z2vQZHatkwsTbgWBC0XSB1e/Yu3OGbZEb99ZpzWyOx7r6Hho=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744196811; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zG30n2f/aRteVWgqjxF1osyq1V5F5L32v16dl9hXPTk=; 
	b=C60x3XSqtlLDM1/hzCaZMpWQ+1DCTxPhC6TBttCvqiQpnDaBIuyw2Aii2ewZHKSWsfJMf+sxb51GYYnyC2w+FfnNGY0eIDi2mDHq2PSMLgoo9sg0/7cTWKUm8Pqe7YWKaKAGBjye6gDYQN2M0Xm4gNTjfSCAjpCjPp+xYFVD5Ug=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744196811;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=zG30n2f/aRteVWgqjxF1osyq1V5F5L32v16dl9hXPTk=;
	b=lD0Mqw2M2QnDu5pxa88W/n3q7kF5e/RTOTbO2yWMgf9Fe5+wg9L83xPtWizh065r
	/v41XTBmgYEHVc+Cb/JpKuioKCp/JWcl1kFDXWM5PLCbiyWQxeSBPi9oWzL+zMzhHUn
	Qn/88lS0u3ofjgCLW2qWE+l3JoxLBUKMx/LoexQo=
Received: by mx.zohomail.com with SMTPS id 1744196809321647.8101420390714;
	Wed, 9 Apr 2025 04:06:49 -0700 (PDT)
Message-ID: <bda7ee48-70db-4ee4-9f90-e267e48ba2c3@collabora.com>
Date: Wed, 9 Apr 2025 16:06:41 +0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] bus: mhi: host: don't free bhie tables during power
 off
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Youssef Samir <quic_yabdulra@quicinc.com>,
 Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
 Qiang Yu <quic_qianyu@quicinc.com>, Kunwu Chan <chentao@kylinos.cn>,
 Carl Vanderlip <quic_carlv@quicinc.com>, Sumit Garg <sumit.garg@kernel.org>,
 mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250409082444.582295-1-usama.anjum@collabora.com>
 <2025040918-preflight-elliptic-7046@gregkh>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <2025040918-preflight-elliptic-7046@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Greg,

Hope you are doing well.

On 4/9/25 3:43 PM, Greg Kroah-Hartman wrote:
> On Wed, Apr 09, 2025 at 01:24:26PM +0500, Muhammad Usama Anjum wrote:
>> Tested-on: QCNFA765 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
> 
> This is not a valid tag in the kernel, please remove.
I'd added this tag as previous ath11k patches had such tag [1]:

I'll move the tag to description in v2. Probably that would be the
correct approach.
> 
> thanks,
> 
> greg k-h

[1]
https://lore.kernel.org/all/20250328-ath11k-bring-hibernation-back-v3-4-23405ae23431@quicinc.com


-- 
Regards,
Usama

