Return-Path: <linux-arm-msm+bounces-32685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1213098886E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 17:39:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6DDF282431
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 15:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F4781C0DFA;
	Fri, 27 Sep 2024 15:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Y1uuoFRw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A615F1C1739;
	Fri, 27 Sep 2024 15:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727451579; cv=none; b=I7EiN2xtyPAPmGaVIuO6dy4TI9kwlEBXFwcb2ns5+iKdUknmMX/WytiEMuLU9Mqr0fFN+akRExpYb41iE9Ou2maiEl7PlSWrfZKOcrL45LIf06X0j52QiJzLkx8VjRuiEJFyqLxUDMNi9PTDKLbuOYKaUJZheS/JPTaffI8BEwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727451579; c=relaxed/simple;
	bh=gRye5OJE7BHk+gMgmOhe1X2Nd+uPBhWjv4BS+ryFKlY=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=SSZTAyu0bupRwy1O8GGoVe2WEtxfDdpu8JvaAbPOabSgwx5XQ2EjlXOwn8h08wNtfMyxoiaEyQ1Xlhypcf+zkVG3U0/NIbQaOXqhcsRuJa2ByJRkoooH7jsJXs8GKJ4jH1ewOpCkpIOm4iE/10dc8A605nFdXL9u6TMysbw/+L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Y1uuoFRw; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from localhost (docker-mailserver-web-1.docker-mailserver_default [172.22.0.5])
	by mail.mainlining.org (Postfix) with ESMTPSA id 66C4EE450F;
	Fri, 27 Sep 2024 15:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1727451568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BdEq1nmyBirZ1u+r5vJIwC5w86C2EE9Wgg+eN+ipB2s=;
	b=Y1uuoFRwBOqnkdhWjVSK5/UV7QyTzidAYK2+MGlh7qMDqkNf94HbC4xeMmbXCpMkVxocHZ
	j9e5D5yDHN8h0/5qV1bwQlGdF17/0dWfi1+08kyU2HLDLxF2U8qz5fiAb4oR9AHzyXyZEg
	UlwvRnb65/Gsx2bvGrveK0GZv+cqpN1D50bxcP0Te0hl35yMv6E/CJ123prx0t9Ma5e2SM
	k7tDpCdb3EpC34vrVkRmhWgPtJf+mV6nQ8kuEUmGH/evqofwOSdDHlrviE5ylHD5nLzMf9
	bJtA6TqrLJZOJTaNyVMjtW3/s04ZOvfiAQQcysLH4SaJKV/X2vs294e2oQM7ZA==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 27 Sep 2024 17:39:28 +0200
From: barnabas.czeman@mainlining.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Konrad Dybcio
 <konrad.dybcio@somainline.org>
Subject: Re: [PATCH 0/2] Add MSM8996/MSM8953 dpu catalog
In-Reply-To: <zeek3j7skstysho5bduxn23xipz3fpqsfwggue66dlyozhepnn@4wnnd7q6xf22>
References: <20240628-dpu-msm8953-msm8996-v1-0-a31c77248db7@mainlining.org>
 <zeek3j7skstysho5bduxn23xipz3fpqsfwggue66dlyozhepnn@4wnnd7q6xf22>
Message-ID: <05c1f93940c38087e8d245d2b6bf90e0@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2024-08-01 21:25, Dmitry Baryshkov wrote:
> On Fri, Jun 28, 2024 at 04:39:38PM GMT, Barnabás Czémán wrote:
>> This patch series add dpu support for MSM8996/MSM8953 devices.
>> 
>> Note, by default these platforms are still handled by the MDP5 driver
>> unless the `msm.prefer_mdp5=false' parameter is provided.
> 
> Could you please provide a summary of features actually tested with the
> DPU driver? Have you tested YUV output? Have you tested RGB planes?
I have checked all planes they are working fine.

> Which LMs have you tested?
I have done some more testing and msm8953 LMs are fine but i have found 
out
on msmm8996 LM_3 and LM_4 is not working as i see in downstream sde code
they are not exists.
This kind of messages i got for LM_3 and LM_4
[   34.751091] [drm:_dpu_rm_make_reservation] [dpu error]unable to find 
appropriate mixers
[   34.751112] [drm:dpu_rm_reserve] [dpu error]failed to reserve hw 
resources: -119

> 
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
>> Dmitry Baryshkov (1):
>>       drm/msm/dpu: add support for MSM8953
>> 
>> Konrad Dybcio (1):
>>       drm/msm/dpu: Add MSM8996 support
>> 
>>  .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   | 218 
>> +++++++++++++
>>  .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    | 348 
>> +++++++++++++++++++++
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 106 +++++++
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   2 +
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   2 +
>>  drivers/gpu/drm/msm/msm_drv.c                      |   2 +
>>  6 files changed, 678 insertions(+)
>> ---
>> base-commit: df9574a57d02b265322e77fb8628d4d33641dda9
>> change-id: 20240528-dpu-msm8953-msm8996-5d0fb7e387b8
>> 
>> Best regards,
>> --
>> Barnabás Czémán <barnabas.czeman@mainlining.org>
>> 

