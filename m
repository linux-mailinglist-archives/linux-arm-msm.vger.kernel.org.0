Return-Path: <linux-arm-msm+bounces-100156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8B5ZC/GHxWlc+wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 20:24:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF2C33AE3C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 20:24:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4FE4303EC05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 19:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4296835DA4C;
	Thu, 26 Mar 2026 19:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CFHNKyqk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S1s6YMUY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47B33859E8
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 19:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774552431; cv=none; b=GdF7UkHY3I/IUtGPzWs3568ruoAutxJJw17UOcdNeybcSwmaB/I3goH/sIfeQfE9Ev1DAL/6tLR074dOknYd60iP/a+T6Vj2A1ED8UAl0HY54TG6Ld40rNGGiSIVTv51DOVlUwiCZXi5F9eeqMUzPDQeTSUnvN7oqvwa0a25NjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774552431; c=relaxed/simple;
	bh=ai3IL45eDAREfWMLbapF1EfVDBFtdYRDwQHSvADc7tw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MXgl0s6xaF81dZy9hS/xMyGV6ffjQdacmxXEP7VkTgTjZ/R2RXZmMZJ0jSPrQGUSgDIIATDuDVGHjfNHaPXE+90Ua9XmizeTNuf8cj4FQ5zVXcQt7JIxbHD7Lzn2BsupvR6rL1mBj9m/A2Puw/Dm8HOx6wFOIT0e+CG9IQg1AuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CFHNKyqk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S1s6YMUY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QI57Go1476111
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 19:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I8pRdQFOK7i3p0sQMgJhiV+GCt2MC+4BNvCTFNypBOI=; b=CFHNKyqkP/dNZD0J
	g50OFbVBMt06oP5e//g9SbH6Vfo22br8uvtblaB/5B2w0bd9VVekMJVWCv7N77r4
	dKUkY0bCdCb0zBLaAMgo8tIv+dCgukMe+Je8px6HWxakvTOEhb4spkJnAxCC/FkE
	LJG05GorAHChuNiKWzpW+9AwpFVna6WprFnwhLj4sDRfGrxTAb5mzc2vU9R24EJe
	y1l7ImFgY+aTPdgoyVTtDYxEyU/391qnfF1XLEpBE0dG0zt38r1loX8x3FleQGkB
	X4N8yvd04sJo2z9wVVMmmV1DrtNg7zWxwO5wpaL2SxnJZ7ECCObJ25Xwk2NAjkex
	5hikMg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59s407rw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 19:13:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b08025f240so16214835ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 12:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774552428; x=1775157228; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I8pRdQFOK7i3p0sQMgJhiV+GCt2MC+4BNvCTFNypBOI=;
        b=S1s6YMUYAUPus92PaeiWoGWhuak4sGlIZiXaFK1gKrtJ+vye53MYP7wOOhiLNINRrz
         U1izVoOwjKnw8EZcWandvccvXiK9ZdeNIDXuMv+T4j8cDY+gCh0D4cQ8ei8SOmllt7x4
         G2msoA+xTMVEAHUfhUBi93BR0oiGI45/zvHv5gIaCoGiuRyyZxuFe/VIwqewWl5bDM54
         rL9azzBpK2rmb/WAkoEQwOt0qD5HnOxgVUmmqbnu+6Cpkxif+ANBp2YfwkXMTH474wgC
         KbMmMjVfzKarQIb/YYOx2Kz7EUIkikbDtFaP8VV4kYAMXZJ7EM96k1aYQtZSOvvXHCoP
         3QRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774552428; x=1775157228;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I8pRdQFOK7i3p0sQMgJhiV+GCt2MC+4BNvCTFNypBOI=;
        b=iNb4fK2r+RBkSzPWavd/5uJ0gkxglqq4KRCDZcpAsT2CLDQ9QUk6KwWBMyCyWtUT4A
         naFVTSy6IV7QBqQGQca2QbpGVzxRlHKiyhNkSC3jUXto4JWEBRk+xRkOWOKym7qu95V0
         xCUJgA2wSb6wOjhTTRMY2RreDqxyRsQkLJhcCdD8J80PNT+VFTYjx8Qqwse6Cxb8rgTZ
         OfYkvqc/BMK+f4N/wi4/uSq6B0N4ccyEFWMSpjRQS4vJ7tNJ/2GMyMKrZB7xF7fALYeV
         sp9/MIqmRfMhPDmrGCcWOoHv6X/mcHT5gnc5T4I/+AU4gPM9x2UFnWAq3S3nZzpdo54B
         tQfw==
X-Forwarded-Encrypted: i=1; AJvYcCU/7A3gfiWvNzR4U3/Jd7wj9PcdRfpyTRI+0M6d+pAcWe8H+kQq4VDsrBWOpYAZOj/Lgj44TU+uRrjNSA1h@vger.kernel.org
X-Gm-Message-State: AOJu0YzXmABFXWVUMn7eXNo3p2Aq6UaZsdkYKNxGOu1MllbGrjJbNEUg
	XrhHzoFqUoVLLRVuQ/0BpS8YACNhmut7m39R8RCqBSXg4Py/QTohuv+4C2tqIQwbpsiy2RuW9HY
	8RsxV9jFYdxciQoiHmxNYGiCGz985tGUkZRdJ/Yn/m9xrMSRqrNC6Q3zpkJ5gyqjNJ1Ug
X-Gm-Gg: ATEYQzzDG4t0SOUCrTX39mFvixaXohWziofSAUE7uY92a/NCuR2yun+o4rsVTjkQk4G
	JerbLFiRm1mY+Wfzo5tjuN5ZfmEMMUYjL2rRIH69PNPPrsxd0w3DP9BuysDz1qBDAISiZB/8VZw
	zmKlkgY6OFuQQyf397d4C64dQHrq5F+nRbcRg2GqsdYV07dzX3TsxHjtZbwRmMuwHvjFC420T3Z
	JKbB+iY+6xVL0YA73Xqjeig+aSZHweJV4UQ8ojfobvBtpZ5s1dhmdPtyLxnD1LEAyg0DnNEl1Cy
	Qa1lDKpsA6pUbougpJeoPsDVuMP/En9AZyAYbDpazhwQg5KEJm7FBxmbcQyaxWogTVECTbo73Y/
	XeO9rQEfUMBck4iQcgHtfgiZFjfrWOTVxz8QAHRTDrgRS
X-Received: by 2002:a17:902:e94c:b0:2b0:5a4c:726f with SMTP id d9443c01a7336-2b0c48e9a76mr28339805ad.15.1774552427552;
        Thu, 26 Mar 2026 12:13:47 -0700 (PDT)
X-Received: by 2002:a17:902:e94c:b0:2b0:5a4c:726f with SMTP id d9443c01a7336-2b0c48e9a76mr28339615ad.15.1774552427007;
        Thu, 26 Mar 2026 12:13:47 -0700 (PDT)
Received: from [10.91.121.222] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc8f3b98sm34857235ad.70.2026.03.26.12.13.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 12:13:46 -0700 (PDT)
Message-ID: <281e5ea3-ae44-4939-b800-face97ac2d6e@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 00:43:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/16] drm/msm/a6xx: Add SKU detection support for X2-85
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
 <20260324-a8xx-gpu-batch2-v1-12-fc95b8d9c017@oss.qualcomm.com>
 <x6b2miikgofuhfnrgnuf47mrrcbz2fkvht25dilo33teafcsax@v5f5j2g2wuxp>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <x6b2miikgofuhfnrgnuf47mrrcbz2fkvht25dilo33teafcsax@v5f5j2g2wuxp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xJbL7kltT_J_Xd_hPuDMkDyVekKItDzu
X-Proofpoint-GUID: xJbL7kltT_J_Xd_hPuDMkDyVekKItDzu
X-Authority-Analysis: v=2.4 cv=CoGys34D c=1 sm=1 tr=0 ts=69c5856c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pFeaMtMCVmKtNNfMW7wA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDEzOCBTYWx0ZWRfX1P/ceTNZku9j
 iJ8wFETH8+YqqsM93aX5TGvBOnyEDR2OvlGg01dInRqk+NNBbItQRK6yXISazAIFKOXqKnXPskP
 Q/DL2A9r6ZI8NaSQQVgK5o/aYl0R9QwKuJbuW9FLr5zK95YzwPbn4keCoTKrOk2LJ+IBbXPve+v
 Pk/sGTAVBaslYzUCauFFDB/5jeCN5UVYch0ZsouLCAV/IJVxlUS1jqU1CPjpeqUwMJyoGASJvXC
 Zr54er5FaSD8kSDpHrUp2VMhk9TOW1VqZw0jjbvb8fm1jhBy4UJj9sXkOzpgCFHp/BWPkiRyz54
 bzAl0DsOvwGSzGHjVhq1fGzjzA08QO4rfPdq1fTziythpc4++gHwnwc37Ga3jpTd54n1v33mOUi
 O3ziQXZBdz3DhtgrOWmsQUnor64tXVFODo44djWYdq3pv7SY8JrU1HBEwTp79W70Lt48EuyL8HR
 axsPSKsP/bF+DO0yHyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603260138
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100156-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7FF2C33AE3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/2026 3:04 AM, Dmitry Baryshkov wrote:
> On Tue, Mar 24, 2026 at 01:42:24AM +0530, Akhil P Oommen wrote:
>> Adreno X2-85 series present in Glymur chipset supports a new mechanism
>> for SKU detection. A new CX_MISC register exposes the combined (or
>> final) speedbin value from both HW fuse register and the Soft Fuse
>> register.
>>
>> Implement this new SKU detection along with a new quirk to identify the
>> GPUs that has SOFT SKU support. Also, enable this quirk for Adreno X2-85
> 
> SOFT SKU -> Soft fuse?
> 
>> and add its SKU table to the catalog.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |  6 ++++
>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c     |  9 +++++-
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 41 ++++++++++++++++++++++-----
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  5 ----
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h       |  1 +
>>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml |  4 +++
>>  6 files changed, 53 insertions(+), 13 deletions(-)
>>
>> @@ -1213,10 +1212,6 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>  			devm_pm_opp_set_clkname(dev, "core");
>>  	}
>>  
>> -	if (adreno_read_speedbin(dev, &speedbin) || !speedbin)
>> -		speedbin = 0xffff;
>> -	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
>> -
> 
> You have removed this from the generic code and then added it to a5xx
> and a6xx+. Wouldn't this cause a change on a2xx - a4xx?

In the the devicetree, only a5x and a6x chipsets are users of the
speed_bin cells. Also, I believe Mesa handles speedbin=0 correctly for
A4x and older chipsets. So we can ignore those.

-Akhil.

> 
>>  	gpu_name = devm_kasprintf(dev, GFP_KERNEL, "%"ADRENO_CHIPID_FMT,
>>  			ADRENO_CHIPID_ARGS(config->chip_id));
>>  	if (!gpu_name)
> 


