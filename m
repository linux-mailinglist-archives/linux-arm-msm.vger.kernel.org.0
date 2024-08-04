Return-Path: <linux-arm-msm+bounces-27862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 988D8946DE9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Aug 2024 11:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55F21281269
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Aug 2024 09:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA140200AF;
	Sun,  4 Aug 2024 09:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="rSvMfWuQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9932224CC;
	Sun,  4 Aug 2024 09:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722763474; cv=none; b=ElVKw6ttFetP9gsynU6XvJYZGe1jn5q3OnOwT3rNKHiXeLNeK2c1Mj4RVeiJBXs6rYAfbDPA+cnYIYzDlMZwXTypDMxuMivNIT+e0oTM169Q7JZBNMsqTQSk77lIGHAAavnRQsQc0Q2tFZSY+JQ0M8KheHvLIJ1nKKicuBfl10o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722763474; c=relaxed/simple;
	bh=ZVi3UtmEl0+XyD/BENEZt8gqCnQ/rBHKD34J0+Bcs9E=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=E0dkPSGpx3EXXxaf4exDyBN5MwMMvonGKIunPsFS+X4MxsokwTenHAYDYLUHpKvId5lpNm5N0fcb5rbjEStt/MbrfSX0UF0Qwc5s6c689XoIeaJKd6O73cX2kp7VIvWrkpfXeCkWcWp8/LYhx0iYCOTGqwM/Ym9D/328ZqYt0uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=rSvMfWuQ; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from localhost (docker-mailserver-web-1.docker-mailserver_default [172.22.0.5])
	by mail.mainlining.org (Postfix) with ESMTPSA id 8180FE450D;
	Sun,  4 Aug 2024 09:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1722763464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JHrUfDJ8wOPMyYjj64os5C3jTH7IZahgW6h7gmn5AHg=;
	b=rSvMfWuQrV+Eh9PLNkIh0X6tMnh3DQ0gbYumXjuBD98e9JMoJO1Zt9CY11e+SQ1Kt60TpQ
	92gila1c6Q+dO2mdpfLPjiRWtehkex36K8jUKh0CLs2U5S4I5bur9gsMoz76Rskx26E6S5
	p264V9FHgMMuLr/wfO81DiwtgUmwwzDnVInG0frpJAyNhAbhRfMIht3I8wUh0PeGShjCPu
	Ah51N2qBEqkjNC1g/BmopVWRXNY+T45ROmsFit1N71uSm/eowSj4VJfgYUTQPngaaCfxZ+
	yk1bI5gB2rQ6/YgZtLo3ycP9iWqb2v2Bpp4T4kusqqqOD4ukQkasNON3uSTCCQ==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 04 Aug 2024 11:24:24 +0200
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
Message-ID: <202f4237b0019fda0cf860bf55e534e1@mainlining.org>
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
> 
It was tested in usage on multiple msm8953 (sdm450, msm8953, sdm632) 
devices like
- Samsung A6+ LTE (sdm450, cmd panel)
- Xiaomi Redmi 7 (sdm632, video panel)
- Xiaomi Redmi 5 (sdm450, video panel)
- Xiaomi Redmi 5 Plus (msm8953, video panel)
- Xiaomi Redmi Note 4 (msm8953, video panel)
- Xiaomi Mi A1 (msm8953, video panel)
- Xiaomi Mi A2 Lite/Redmi 6 Pro (msm8953, video panel)
- Xiaomi Redmi S2 (msm8953, video panel)
- Motorola G5 Plus (msm8953, video panel)
and couple of msm8996 devices like
- Xiaomi Mi Note 2 (video panel)
- Xiaomi Mi5s (cmd panel)
It was tested with glmark2 and with mobile shells like plasma-mobile 
(dpu fixes night light) and phosh.
If you can help how can I test specific features i will do it.
How can I find out which LM is in use?

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

