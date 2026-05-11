Return-Path: <linux-arm-msm+bounces-107005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GmWHgxDAmrVpgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 22:58:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 872855160DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 22:58:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AE32330095C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 20:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 251043B6C01;
	Mon, 11 May 2026 20:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V1u1rJGz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UccRG3Jh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB013B6346
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 20:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778533127; cv=none; b=YUhVOy/sUTcai0FPjYqiICy6OtGXmlDAeOT+xytNxQByu3YKIn/Z//GMq0C4/wZdeUrXUmlLmU5aNu468CgvF39XAcufmkFNQW3T9mYNDFDTd7j3ZcV09NYsUopoLalxNnN8zhDa4aSNE1hLkWR6CJlkqGZB+bp+iL7CqwCh3vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778533127; c=relaxed/simple;
	bh=IC9p+yFW23kXHm6BAxrUgukG4Y6HX3/Ta/4t5+nKG+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JRoH+6JOmQw+4/mYujI5+AuEB6n+Ji4K+IUr3eX6CpIVzISI28/6FCxuTgbY/3Eyju2Nc+e96iEzySAOxLpOgBh8qzKdwUzjb0QLXWmc+EA1rCjYFsLtN6szE+43HTFEvd3lqE84wv5APGCEMvorcdCJKTAmuWMiBq3EkRAE/CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V1u1rJGz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UccRG3Jh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6jSL3384770
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 20:58:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9/p9ARwLXTJwRe2U4yqJFSD8BOX1Dr2lRgTY9kR08Xw=; b=V1u1rJGzXkpOMKlD
	cOfPNOc3SI+WgeiL6w8LZEK88483Jj6Y436ZC2KgVgtRP5eSCGuYYYa4hCRNot++
	a7Dn38LfNGYNHcm6ceOch8+oALHmCil0JIcW/FYUrnFtdobxMhLbI9eB4N/u0Z+t
	BRMKglshERHgMZXlJrBsCSd4wzu92v1T2CwGpOpVPpsUi1tPNBhrpj1E+14NG8wt
	enlitUK9Ni8A0Lj7HdLxEkBlchsv6LUV0w07uWySIACTJfLreQABjhN9EuBIeoZj
	Q56/sIFi7RkgDDM5iVecXvgc8NKWT5BC4bn3I0YbMNPur7eGv9K5tRn5CBC96V+U
	4qwa0Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv4g784-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 20:58:43 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-835423c69ffso2829490b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778533123; x=1779137923; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9/p9ARwLXTJwRe2U4yqJFSD8BOX1Dr2lRgTY9kR08Xw=;
        b=UccRG3JhNRSOZX7QuIS/F7vupKa+kQLswqqPi+4L6c/X21PxBf/UY5SWydAUGOac1R
         KEaUZ3oNMiplyAxmqGDAR2bvCso9/RAhtyVazEF1VG+x8ft73NEOCFaAzsgtnrveik/T
         CLjXum+yP7TXQ5KNdQA6A6104lm+qmGl7Sh32HDCTbc3zKQiQOxECTW0gwoTed9o7Rs/
         ddCctcY7qtWj7upbj2HPBqPFkNFJlwa+aYxe7PhYPg2r7/ZUZSfMZ8yJoeU9y50psaDs
         xSB4UrdWEt3JsFChIp5lrqCJL/ajNt2OkO5ovqUCoWnfhHy61+P/EKC5GOyVUGK+QoU0
         v7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778533123; x=1779137923;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/p9ARwLXTJwRe2U4yqJFSD8BOX1Dr2lRgTY9kR08Xw=;
        b=qvS/V1KXBhL97g1+QI+i5U5ZE+tULXGKtEujeMZzopEdN5E/jTnGT8WnOdbpbtUv+p
         wkRyyRBcVIVIXqOx4XnuYKHdzsqdMvuZBmeoKiJt8FVTscnrODX9xFCXnfHmbuECNrrN
         SBEMbyrfO7iUnWBZU/CeTQWGMAHeTv/oQVD1u1wSa8cwxHVTJDu39cQBdJ3E4+VZox8k
         OtOL68LR7M7eSiV7HMw+HJxm8Ilo2MjVEeWq8Hw4aL1M/F2AW6qMVe0I/XQrW+w5fcaF
         qLLsnSUnPHmjSNfNpaqIaPXPKeuo/Jp8KeOZhr+3jByd4CwXKpJpPbWHpv3s1wKREjiL
         uWJw==
X-Gm-Message-State: AOJu0YyQB83hgJjtHZsmYvdB14pHDHZQb8V6xVN3yqccOga3BF7aSf6S
	NbvHW0hyha82VtennGPdF8sVI3xSnm3Qi+IARZWWjvnWTZXKMK83JtOY4p4zEqiECYHgtsLxPCJ
	y4Aq6mJQaP5jwZTBLr0lAJVuqMBS20NOcKxj8cLWfkT0hKi2QmIyZ8rB1ZgR9sFsmUmuL
X-Gm-Gg: Acq92OF7Z0RxIk2o69+nGQNJbeJTmLxt/sgxmXitzRpTvU3mk23zVzzlqUUsHN6oFbr
	f0q0SMTn6gmicxP7ePaQ8QbScyBQFSckyK+kQf2xA4R+DjQmLzYY5jmlGT11Uv5m7t1w7K/GM7p
	MkoEt83bCA2CjVr44uhyq0x8Mm/jJnQXaDwdAy9rC/bkXzcKI5hur+nbr4kKli+VJFwrOaYVCBy
	Zh5wcQR1nq/IHMTkHtQlEWaOGVf7u7oD3YpZ/jetjtMCKMVSu85p1jQtMkk/gxKdvnJ3Z38S9nd
	Ei6xDsB4DX1PcW0ehoEiWrQUMquIcUuQB+YPi0AL7kuN4nz+MY6T35RhmnTjHcY8ygEPXY5b3IL
	P+SAzagNBiiWDaKIraAoH5hFYs75q+EsoF6tbMesPYLwD
X-Received: by 2002:a05:6a00:428a:b0:83d:b11f:7979 with SMTP id d2e1a72fcca58-83eebbf4d69mr76919b3a.29.1778533123245;
        Mon, 11 May 2026 13:58:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:428a:b0:83d:b11f:7979 with SMTP id d2e1a72fcca58-83eebbf4d69mr76903b3a.29.1778533122756;
        Mon, 11 May 2026 13:58:42 -0700 (PDT)
Received: from [192.168.1.3] ([106.222.228.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f049sm24664326b3a.7.2026.05.11.13.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 13:58:42 -0700 (PDT)
Message-ID: <b0a99bbf-d916-4990-8ef9-2db428192e94@oss.qualcomm.com>
Date: Tue, 12 May 2026 02:28:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] drm/msm/a8xx: Fix RSCC offset
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260512-glymur-gpu-dt-v3-0-84232dc21c03@oss.qualcomm.com>
 <20260512-glymur-gpu-dt-v3-1-84232dc21c03@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260512-glymur-gpu-dt-v3-1-84232dc21c03@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZrTd7d7G c=1 sm=1 tr=0 ts=6a024303 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=1UGwFfo7D6NxPCeOlddrGg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=-ol3qSTvAihUzIL2rFMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIyMiBTYWx0ZWRfX1QRtBjdkUe61
 4TUUHeP4z+Ma8gh8BV2UDAZSB7JnfHxRohUF005ambpYOyh7+mvohh5OZ0zn4nVvAjLpJCxeuQz
 IA+Wylac41MvEiY9ifg392OT4+7T0KsxBCqLV0uaektApIp2XHTKE9o35a0GqK1N6PrUw0LFCJ1
 am+EG5c2qR9bnxKD1CLGbpSUlvHKRgAL9mA1BSo9u/pYZ7qvJjXz9sxLnL0w7TKwNNzNJeZz6cz
 butEmvoESnNLZHqGGTAAuFxrt524E+ckawPUmOg3JLGBAOO3m23c/lCWRuIU4uUO3I89gAe0jPW
 UqEpAZ8oBemskXYafmBQPUsk3yYi8AP+Zg+l+Y9cqxORU0NtJW4T6kHJWsQV0HMaGtqN/psa0zJ
 7XD7M5+oi9FdXtNp7Tv2xhKkpbf2BCraSBpSb62apZU5PdDc1RDdYAwHCo7dtqiBlcRAqV26Z1H
 cCxBNDbOUEKfgiGU1RA==
X-Proofpoint-ORIG-GUID: 0_KwMq4frrmRhtVeRfsju4XEOb2VY5jX
X-Proofpoint-GUID: 0_KwMq4frrmRhtVeRfsju4XEOb2VY5jX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605110222
X-Rspamd-Queue-Id: 872855160DA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107005-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/12/2026 1:36 AM, Akhil P Oommen wrote:
> In A8xx, the RSCC block is part of GPU's register space. Update the
> virtual base address of rscc to point to the correct address.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Missed the Fixes tag:

Fixes: 50e8a557d8d3 ("drm/msm/a8xx: Add support for A8x GMU")

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 1b44b9e21ad8..cab4c46c6cf2 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -2357,7 +2357,12 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  			goto err_mmio;
>  		}
>  	} else if (adreno_is_a8xx(adreno_gpu)) {
> -		gmu->rscc = gmu->mmio + 0x19000;
> +		/*
> +		 * On a8xx , RSCC lives at GPU base + 0x50000, which falls
> +		 * inside the GPU's kgsl_3d0_reg_memory range rather than the
> +		 * GMU's.
> +		 */
> +		gmu->rscc = gpu->mmio + 0x50000;
>  	} else {
>  		gmu->rscc = gmu->mmio + 0x23000;
>  	}
> 


