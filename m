Return-Path: <linux-arm-msm+bounces-99408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEGlLfmxwWnlUgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 22:34:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C25C22FDC67
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 22:34:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5113A3013C7E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4D337CD55;
	Mon, 23 Mar 2026 21:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="onFnQJqd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UycaQM7v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6647A37F8BC
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 21:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774301668; cv=none; b=MLkSqdwLk2ZkYvm9J/IL2almNTgN/2vLavURuyKlL5UUrmZQ5ddzHlsrNhVUSvlEoucwtG2B9WGDl/KPmbFPsJFjAE8Wlf2I5aCn9CjE+vW1GYd/llCP9gxHoUfKavpL9hdSDD1MLZ2AHdBzCKaFnbpM/pU9Z9iDdKZm52lFlFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774301668; c=relaxed/simple;
	bh=wZnyTC1cxmFnDFRhNyKK32ZOkfQPMZymv9huKfcg/C4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kH6o1LhVO7nxvNqtUcA/fTyUSoSD+WPg5wt7alcHeTpHiNE1w18ED/dCmcDQelLL7aUoMBfIuII/mw234I10iUPHzJPJvHCWaW1XrL+FGSC+UjvEcKuigXhD/QyyOLeOcNjf5h1hXgDJqS/b9sAN2KUqSl5oEJDCZH7aj19ufUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=onFnQJqd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UycaQM7v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqXOV3817469
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 21:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YEv3TpmBWdZCzDldOTrF3vertS4FiegdmYw0vOk6kko=; b=onFnQJqd4fEKGdeN
	86+hxSTsWm3ZZbxdfHeJGIDmBJhRGb2A4J8MyrZIZ5qGh171GXNP0cotGgXeNYAB
	Nh6euS1M39v3ez4lE5prge6HP2zTAz/wEZU7mInocGYk5jYJkmqg1RaRUdnYAM3z
	bi8M/tK+8j5GuxWFJyTlCsj3l6tCmk5LHYhM+0UQs9Yt/bq6gewcBB0UEwC4BcIU
	NxeZ2/Au7SkZ0hMvcekoASfc1hrceG1zdPFN1craBCytHoFGMlotJ/3GpbhTEPUy
	thPa4JkYqUpTJKkPo5foDYSLoMYBKzhU17SE1tfFPO/N+3kCrxhF7P7T/OgitBv1
	3+E1Ag==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d355w1wv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 21:34:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b05a3c2421so7486525ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 14:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774301655; x=1774906455; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YEv3TpmBWdZCzDldOTrF3vertS4FiegdmYw0vOk6kko=;
        b=UycaQM7v0p4RcsB+UmNYf5s0OBvNdS0s3eCAruSK4MT2uU1TaqkrFrGbYFwpJu++yf
         L/0OqH4oDzSc900Djj4Bx8Vg979qeiuq2XROuaCOO4jq+ZXXIFm36CeHvh9mHvqFzQqS
         sEv+kthJQje074pdQB+FrAVwf4xGqAcnR0CQRPk352MfxsskQMIk871fdI7ZSzjwpMV2
         rcweecL+b8OGHcu1kE4GT2gbtXfsTvU3fWkq30XUSACHD89uFlXCT+yymR22AwhNd064
         5o4rOs3xmONzftysTKEPIB23EUheOR0n6NJ8KQgmfNDUui5qkzHeOo3RBkxi1Ky0RwXE
         1Odw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774301655; x=1774906455;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YEv3TpmBWdZCzDldOTrF3vertS4FiegdmYw0vOk6kko=;
        b=HgvHde5MMPVMUaNdxZJEU+j24WM2egS7C4BCogkOdUWJfntch4NZvZToue54zXKiKk
         g4HO245eSv02JyOIOjHsG0GAASWNnWUFznAVjHQ4Dgp/KNe3aNIOS1AVceU1G27+1Bo6
         IDvO9uS6XR/8lZHb0Lud2d3xdZQMTgpqzJ8yc03ePGZPm3IkxCii42qZG110agPXDGfG
         jfkROc4B6Z5WdrHZX7EAQEyrp2O6cvvq6R694cmOeShDP3sZhssJC4LDxRn4YWPmJDTb
         1WA7PzUVfGdWH+HSBcdbGeHDh0F1Np3YHNgBxDrx+7kwnRbLO9fosS53UGEw4g+YyjTz
         LMkA==
X-Forwarded-Encrypted: i=1; AJvYcCX7rfjSjG9Nic6fGYv5TNzY+JqODsFM3kbx9/wHklE3QRFrgwx7z7Xh/tjy0x0pTPCgJrSFbAX+hIQdmEGC@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8+kKC4xvajKMCb9pQrRkMwihvdvBBjmGiPURgADwqSgp01tH/
	xqtua3A7mb9Tx6iiJLHtDw5HPGvVc9dkfeeDZPx8/L5wsLF5FhGdqihk67gEVAmeuL1Eb/aEuNv
	e2FAHWCfXoENwcwmNqQMq+AaW2N2NXRqFiuDS/hyRTfaTZfjmesczK2P9RnK03oAcHPSV
X-Gm-Gg: ATEYQzzkPLKKORipnBnAHr1PO275EgxppdlloLMGUzcJ+diuMvUoXDaAyrTr4ifkZ6V
	FiCUSzLkzgZDufwbV2ixxFVqQu+nBsT83wTm5UG8A2CNHchur70giwVfjnD3wdohSizZrFRzlXz
	IDvL109fuN6lkeMVDLTqHH7q+kU0Q9fuIGVeozQqg8JdJ/z9NC2AOU9M4TyctoX2zIdGMY4E7Fo
	IHysE77CGY3gD6PuQTn6Bj88TStzjsqFeujuvyHSz6Rxku7WugYk9L84cxUnbhtvqDdFeP8pcrt
	+Ri1y20p3UzJfhQ0qXQ4n8Yag0gXenr662VO1iVBc1Ga2t9u5+KhsFWrjqSLi3gcc8Vk5TXGsI1
	jKzb+CuDNb9Jq5U8E4OOSgaFVS9KDHfWtG6D2xRhVL8sqvrU=
X-Received: by 2002:a17:902:d582:b0:2b0:708f:4dc7 with SMTP id d9443c01a7336-2b08278afb0mr124510685ad.29.1774301655220;
        Mon, 23 Mar 2026 14:34:15 -0700 (PDT)
X-Received: by 2002:a17:902:d582:b0:2b0:708f:4dc7 with SMTP id d9443c01a7336-2b08278afb0mr124510355ad.29.1774301654732;
        Mon, 23 Mar 2026 14:34:14 -0700 (PDT)
Received: from [192.168.1.12] ([106.222.230.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516189sm127038525ad.16.2026.03.23.14.34.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 14:34:14 -0700 (PDT)
Message-ID: <6249ba79-e223-439d-8606-69df24758c95@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 03:04:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/16] drm/msm/a6xx: Add SKU detection support for X2-85
To: rob.clark@oss.qualcomm.com
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
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
 <CACSVV03ciF890bDpqcqVhhHeLv0hx1whNgq0RUUKTyAfVopOWA@mail.gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CACSVV03ciF890bDpqcqVhhHeLv0hx1whNgq0RUUKTyAfVopOWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fq7RpV4f c=1 sm=1 tr=0 ts=69c1b1d8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=WRfdsTvTEh9BIu3+I5rxZw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=7GsrDj-skTPUI7dcwhIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: X80D5mwL7_0bB7Ltp-p3GLoC_HBfOzqr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2MCBTYWx0ZWRfX32EUvXpx3voa
 m2ti9DJ5zXsvCXNQ+meE81JPLhDxf3lo1caauOUrec4PQWxtOhC0GkNPaecoM5TJYa5LCMS95cP
 K+LVgDNHc3x8nptCGKaIIvLAFKKQerbtJ++IXsyBiCwBKZ+bKu7lYikNsAjSqpOKLdJrzFX10qe
 Xxf5InNV5rmaRe84kMIyr0GAmXLURFm2YT2LS+06WEaDWWhNK2zCZtdF5Tue1XKnrLiHzd/uCNY
 mfbIEXe2Pc6sXczR30oYBuNvMoSXr0crvksaSo6/HGkY++5rWv9Co+oaJBi2iy2YCPPBtEKEuTi
 7+DQzA8JQnrA8UZHdxsZJV6dJAZDB0K3j+jiPCWyyytVBfEDbtSrL1873wfkTq231CWjZ10uWzl
 uTEt8m8TC1x0YN0aQ5FEkE5vcHHr+qjUyuJASx0apji/h0UT08wZ6pAz0ukOg0Erruor/Krhu+y
 ONcNuSc+oQ4NlJie+MQ==
X-Proofpoint-GUID: X80D5mwL7_0bB7Ltp-p3GLoC_HBfOzqr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_05,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230160
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99408-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C25C22FDC67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/2026 2:07 AM, Rob Clark wrote:
> On Mon, Mar 23, 2026 at 1:13 PM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>
>> Adreno X2-85 series present in Glymur chipset supports a new mechanism
>> for SKU detection. A new CX_MISC register exposes the combined (or
>> final) speedbin value from both HW fuse register and the Soft Fuse
>> register.
>>
>> Implement this new SKU detection along with a new quirk to identify the
>> GPUs that has SOFT SKU support. Also, enable this quirk for Adreno X2-85
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
>> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>> index 79a441e91fa1..d7ed3225f635 100644
>> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>> @@ -1731,6 +1731,7 @@ static struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>>         struct adreno_gpu *adreno_gpu;
>>         struct msm_gpu *gpu;
>>         unsigned int nr_rings;
>> +       u32 speedbin;
>>         int ret;
>>
>>         a5xx_gpu = kzalloc(sizeof(*a5xx_gpu), GFP_KERNEL);
>> @@ -1757,6 +1758,11 @@ static struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>>                 return ERR_PTR(ret);
>>         }
>>
>> +       /* Set the speedbin value that is passed to userspace */
>> +       if (adreno_read_speedbin(&pdev->dev, &speedbin) || !speedbin)
>> +               speedbin = 0xffff;
>> +       adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
>> +
> 
> I will confess to not expecting to see a5xx changes in a patch adding
> x2-85 sku detection :-)
> 
> Maybe split the code-motion out of adreno_gpu_init() into it's own commit?
> 

I forgot to mention the refactor part in the commit message. Ack. Will
split this patch.

-Akhil

> BR,
> -R
> 

