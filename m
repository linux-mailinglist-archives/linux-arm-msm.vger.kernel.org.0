Return-Path: <linux-arm-msm+bounces-32521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2B898684D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 23:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D28FFB21083
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 21:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66AC9147C79;
	Wed, 25 Sep 2024 21:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="HCA1FSVF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA391D5AD5;
	Wed, 25 Sep 2024 21:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727299703; cv=none; b=S3r7vJ7o4fhClSet0zws4cKsG53tV8Wdqc2QaeWnYZMoIqDLwcx/fg49XhvUzcAe/wAXh+gcPAownEDPbplrvjZTT6A4G3ekEuQcHCcQ/UuRhDpE27sK3/JJaHebnIGjZQIoZSjRB+xFEHWN5Myfoy11edgbzTczHd0zOwK1jhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727299703; c=relaxed/simple;
	bh=GUNwHM2yiFQvwZ6WkgnGF6m5+taxG2nCKU6HJ3+fNWE=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=qDZbZAX61WUMBP1LWnTTLn1O+dFdXrwq+QCgpjzyRBzupA9C8Q92Ag+hDN5pJzVS/4wKxdtLscjOEXh/CUwf1sHGr3n9L8wrUBwDb/RssGXQkgEODUt59XAifQivz4prThjTUnoh43B7Oet3CaVbt4bUQQWg5fhHOIgCn8tCg9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=HCA1FSVF; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from localhost (docker-mailserver-web-1.docker-mailserver_default [172.22.0.5])
	by mail.mainlining.org (Postfix) with ESMTPSA id CD7C3E450F;
	Wed, 25 Sep 2024 21:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1727299698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uZoAqNRo8n74r1nSrRilUrJGSUbgDdHa7HHFP+4Yh+c=;
	b=HCA1FSVFIix5UbxfQvh6ilRng62jmytqkONOUZAVKH45/7TtjCOZG8yuWbd+WBIMqLmzrY
	54wdNKeYqY7DZGIbyiawCa/ErYzDbFnsYxayXZlMwZhJBFeYhurHELYRv3eMZXDHL9lHxd
	R3TrsxPeHqDSQjzbfOooBgxj1RxK5p0+3AuFbS6p0OOFCsob2scutqJsOKv6bC691xL1o1
	IO+dvJHniTgmiq6HbnDcrR3jgawTByh5eWx1d1TrXLM+TqA2D+0bMw9p8Mb0IsW20eEHT0
	Dl7nSTw2mAGCQxMr38XNFtGmsfKgvzS4hsatjQCxTAxsnwi1IKeEY02oqEOo+A==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 25 Sep 2024 23:28:18 +0200
From: barnabas.czeman@mainlining.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH 0/2] Add MSM8996/MSM8953 dpu catalog
In-Reply-To: <zeek3j7skstysho5bduxn23xipz3fpqsfwggue66dlyozhepnn@4wnnd7q6xf22>
References: <20240628-dpu-msm8953-msm8996-v1-0-a31c77248db7@mainlining.org>
 <zeek3j7skstysho5bduxn23xipz3fpqsfwggue66dlyozhepnn@4wnnd7q6xf22>
Message-ID: <e69b07677ff786e35a5904cf1a455851@mainlining.org>
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
> Which LMs have you tested?

How can i check specific feature?
I have set echo 0x32 > /sys/module/drm/parameters/debug 
DRIVER+ATOMIC+VERBOSE ATOMIC log is pretty verbose and big this way.
For lm i have found this kind of message in log: [ 1027.577132] 
[drm:_dpu_crtc_blend_setup [msm]] lm 0, op_mode 0x2, ctl 0
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

