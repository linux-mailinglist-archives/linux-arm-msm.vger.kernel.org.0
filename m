Return-Path: <linux-arm-msm+bounces-77923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D34BEE8CA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 17:39:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F89E18987EA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 15:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3DF82D46D6;
	Sun, 19 Oct 2025 15:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="JxuCNPQx";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="/cs5GlbE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8FA1C6FE1;
	Sun, 19 Oct 2025 15:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760888353; cv=none; b=CDNkmKs0b+H5BURODs8IQu0i8GDnuSq2R3nw4rUdEJ/bCTi0UnhtnRF0TIbsTD77gZVv3L/AO8azPb0M0LJ4F9Xkwt91iRThgTAZ3OlU0n1arritDHtbaGC4AsyzLq3Q/2B6H8AzB0CvekPc8uoPS3L7gBnhkcrDvkQ3sYB4gZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760888353; c=relaxed/simple;
	bh=9s9zbazzYIOQb1NKJDOoZTQ5H/Ge10iyd2vgYVzPbGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WxSuCL7stlauAwuVl5lNciJS+CmH4BXDWGqhESngXrgnR4hgJG6KXO7DNMAAoDAKAcp7w0ZBvVKDP53zcPmClh+jgb51Ql4hvWoQkE1+tN9z84NGDcSKB+UhcjELNtCH0zS3LK5W9y2xLPJVDXSQ59gF1I3mBxLcy2fG3V3rwQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=JxuCNPQx; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=/cs5GlbE; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1760888282; bh=kEjO5ovOuDId60UKjzDalyS
	+PFXBdDKZLvKH2ODqit8=; b=JxuCNPQxxRpB3/isW5QlOKNa04UOqieyNdaDfWZN4EC+aZpRgt
	14FE7MYUC5OI4gkoZSM49NUlhydMYQdEQnW7OiAoHb0Xyqu9YlfxXLf8VsPS0Kj3slK03cVREL/
	0pA71DNaHbzH9yzKO56ZkmtApKis7gs9EzOPeTs0T5wtIDuAzS9ML6jU8B/IvE1AjWx2sIOo6T3
	DV3bYJBJYSEA4AXimiOM5GDoTgiCJMJReclH85RCB6F/qnRFQ+NREkGAu7iW9BDzDsEdq4HxRJd
	+xAPZCfa+W82+/0ReXZb4O6MFerj4btO+5lfXUyS96op8bCG8oSJL92buaoH7jNqFLg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1760888282; bh=kEjO5ovOuDId60UKjzDalyS
	+PFXBdDKZLvKH2ODqit8=; b=/cs5GlbEA34k4xHTqZF0Vvzz316umQl2CrCYtWax/eB2vZ2eHb
	1JzalZWeQwIVFKKqV/RapB+tso8k9uMAqCDg==;
Message-ID: <596771dc-1564-4f46-ac07-ac0e9c6c80ab@mainlining.org>
Date: Sun, 19 Oct 2025 18:38:01 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] remoteproc: qcom: pas: Add support for SDM660 CDSP
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org
References: <20251019-qcom-sdm660-cdsp-v2-0-0d3bcb468de0@mainlining.org>
 <20251019-qcom-sdm660-cdsp-v2-3-0d3bcb468de0@mainlining.org>
 <sasjgm6pua77syu5qjbr5zxl37jorvhs4dx75lbiqlisr5aq4h@zjxu4k2wcfye>
Content-Language: ru-RU, en-US
From: Nickolay Goppen <setotau@mainlining.org>
In-Reply-To: <sasjgm6pua77syu5qjbr5zxl37jorvhs4dx75lbiqlisr5aq4h@zjxu4k2wcfye>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


19.10.2025 18:37, Dmitry Baryshkov пишет:
> On Sun, Oct 19, 2025 at 05:20:21PM +0300, Nickolay Goppen wrote:
>> Compute DSP in SDM660 is compatible with generic cdsp_resource_init
>> descriptor.
>>
>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>> ---
>>   drivers/remoteproc/qcom_q6v5_pas.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # ifc6560
>
> Please send DT patches too.
I can send them separately

-- 
Best regards,
Nickolay


