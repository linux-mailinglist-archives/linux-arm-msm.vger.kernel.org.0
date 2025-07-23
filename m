Return-Path: <linux-arm-msm+bounces-66228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B15EBB0EFC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 12:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0A4B1C27591
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 10:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A6328137C;
	Wed, 23 Jul 2025 10:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JdeZnmv5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1FC2749E9
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753266464; cv=none; b=fBQmMzRJuhxIVx+HGtjAXAH7FkDCoqRJpTbY3irjT+xTXpLgoGzUVLyZE5sTP0wztmZJZinZkPzefdp9B/iiAxtdR51bOleJ+G7VPLrcUI/JBiD1S9ffz+UK1vTla8W7cu+6A7u4Eaol21hWr7tXnviq1LqWXgk7aPyMXtp/b08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753266464; c=relaxed/simple;
	bh=92/HpnvzHRv6YdBFuz4zwvFu/3h/vM8wbCKiLV0rCxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rZWWaae+arFpbUDyOCEnIcic2gXt86qLN45Jst8AKlT8z8zAOAI3xfoY29HStpWyMYpxjbSnhHCB3xezBfBx+wQny5bZgXOv54QT1ZOjy/LtE0hVTH61OzLR1iZEuYe7SBEMUn9mJCcpAtnexfcE3BhDwpGCswtWZAXQFc8w7rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JdeZnmv5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9eHvQ010916
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ADPEX257lqLR7aZspkqZLx5E5CPI+QZpWMnfs3fbuRI=; b=JdeZnmv59F6s3ybT
	mj/FzWcRtRL7AR38Xeel4YhTE3aoxfIBO6yRr1VYw+jXs1Wetl0N/h/2xqSRMx5l
	xUDssShPLP8Waqh7FtemfFjAzkM7JbswAqU3YX+/EsXJDOaeqw9Mp2FVPxp5f+1Y
	FWIQkJhI5FoIkhu/dGGAwDKiX4+z2jRrf/Omt9tXVYX48zzZufwZfJdWqNIoA0EX
	aimVtxzmKM0qixrZcxLzbY2MmRylj58rj2kqzBV2POpuQ5nC/ObOImkKiF0qDt2T
	JNm/Zw7dvxZ4dSi5o9bmXO0C4PrqHTusGZY0bFZSBMyAyddofVkW9l4N+9rTnZOY
	/WNkQw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t1c3w0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:27:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6facde431b2so20724906d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 03:27:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753266450; x=1753871250;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ADPEX257lqLR7aZspkqZLx5E5CPI+QZpWMnfs3fbuRI=;
        b=vdTPELrg/KSWws1AVWqEmaZX2MX810u/SRUzKIvc1tw5fzUGk7BYzxitUPClyBezct
         c7mnoUc3LLxIWcN0dofVuXudMxOZGYBDMI4HjlkTZXo6nBtpuUbeAqK7CjZ5rOP09S02
         U3nCsCarsjzdGnimJAq6Vv8p+SYLYrnpzx6CTiq37OU53o7HzIBw+AO0GGy/tdzEYSjd
         Cy1xrYC3B6lxbG+eDeAb71PABjD1rdcjnXZyVjBUAANWxYk2N6Nxtc3Lf0z5viGFWqjR
         zm5uRgGxGsLfe1sHZ9vej3z64AyvjO+kmLZPn/r+VJpFB5mYbQ34ZFHx3+aHFFZGB7hl
         Tw6w==
X-Forwarded-Encrypted: i=1; AJvYcCW4PJINiPSvuNEak7lBcBqVANhLzXgDI9TC9Gi9nnk5kX3IUgTHkpDWIYlsvCVtl7Qu8h6OAffLgAuyKkFf@vger.kernel.org
X-Gm-Message-State: AOJu0YyAINAf1pxXXl2S0NLnXwo4SXRFVoNo0eREkknFabRBcKUo0f59
	pnEZVyZyOCXzjy/ej0Z8c/l7QooExQhT6582DfVy7UlRA6UCwrcIrHrmDTILuN4vwjTYv0TRgmO
	GIuZsPw5JbLSP3OCzuDZAsV6+AlzU/X3V+DHendqZYtEbEQFd/Dbrumh4g1LA01AuF7nQAySC9J
	VT
X-Gm-Gg: ASbGncvaStlZV9NLJEeqvTnKpz/KbbLhubZGy0BEuiXDcMZeq08TLnUe1NOfUeqiNli
	pDEPQtSURvsIlDRDmWzfStYHRmaeHnAwYPj3u2BLYtTjHmDZKdPZjfxbMQtn98fG3JP24iakTAR
	TtNB82EdCg6P5Yj4JQr7nI0uSs1DY1Aeoz2UTX1udz3zB0PLaKxRFzvulmqjff6cp4HTpCtMORO
	4PqmOy/1ugbcU3+wMJB/mn7+lH2tvVq7bt4PHyGoPTAzMc9PfP+F+JG8P+SN+/LWb67t06r3rPH
	G6fXMp8XGeoCned/wKF/X0ulyyOl7u6SYtMZ5ShBrkgsPr7qi0KwFu1GUeSMrkuEcNnkJ01CD77
	w6G2jb6ZwC0Xpi2OYpg==
X-Received: by 2002:a05:620a:9157:b0:7e3:31c2:2808 with SMTP id af79cd13be357-7e62a1635c2mr84740085a.5.1753266449879;
        Wed, 23 Jul 2025 03:27:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlbBqrpR3KQ18lK2XKRLKljilp74CSPk27LxST7ZbUN/lfUZkp9SSjf53wAC8c/dVC+rHKMw==
X-Received: by 2002:a05:620a:9157:b0:7e3:31c2:2808 with SMTP id af79cd13be357-7e62a1635c2mr84739285a.5.1753266449263;
        Wed, 23 Jul 2025 03:27:29 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c907759bsm8191624a12.54.2025.07.23.03.27.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 03:27:28 -0700 (PDT)
Message-ID: <5471754b-5dec-4107-96d6-a6075328d824@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 12:27:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/17] drm/msm: Add support for IFPC
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-11-9347aa5bcbd6@oss.qualcomm.com>
 <k653qq6a4xkvwadeum5kbr7cheje773vobehpzq33ec44vyxjj@vi3ekv4jwext>
 <6472bc1a-9546-4cb1-85b9-d826f76ba9f4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6472bc1a-9546-4cb1-85b9-d826f76ba9f4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1e3OtaDsNJVF0AYlJa0WNcGesX-M3geV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4OCBTYWx0ZWRfX3GdQDsIt+r3K
 KcPKkDzfquWZpKx1613tMtdTJLJnLAdJGl+ITm1DMdMIigm/i++h8K1haKwVTakmjWqX8yZuNd/
 IVy92cMpqIscSxwIKXHgoo96HmGZABQlgGrNKEBlbmbHgxDn+v0ogxBau6MMWsceNWjQ9kOYWfM
 wpkXuLM+OXl0kxBAEurKQe8aOhU0LVA3yYAgMGI6awTkAMh6w3HeFK1OKofSTU0RKDrtlRrkFv9
 i+eYhT7KkXfot0/KwL6/TyZhBPai1ewWoeiETSNXTfZfI8rhx39Dw9j7O9SGGdqR8dUVFe2rpMW
 Ns+MYbRYZKMR6aGOY1VI7HPnNkYygUR5s7Or3N9QRmwjUZMZEphl2PpA/W6QAPFVVnSU5ug/0QB
 IAeCAqPJfKfMpSFEylOnoPGlBSEn2jxyn7fmt7QybtXLcpp5OQnF+ZiK1CebHEZY7cAH1VLs
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=6880b91c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=JXpgR7ONGPNzM5tbrfUA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 1e3OtaDsNJVF0AYlJa0WNcGesX-M3geV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230088

On 7/22/25 11:27 PM, Akhil P Oommen wrote:
> On 7/22/2025 7:19 PM, Dmitry Baryshkov wrote:
>> On Sun, Jul 20, 2025 at 05:46:12PM +0530, Akhil P Oommen wrote:
>>> Add a new quirk to denote IFPC (Inter-Frame Power Collapse) support
>>> for a gpu. Based on this flag send the feature ctrl hfi message to
>>> GMU to enable IFPC support.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---

[...]

>>> +static int a6xx_hfi_enable_ifpc(struct a6xx_gmu *gmu)
>>> +{
>>> +	if (gmu->idle_level != GMU_IDLE_STATE_IFPC)
>>> +		return 0;
>>> +
>>> +	return a6xx_hfi_feature_ctrl_msg(gmu, HFI_FEATURE_IFPC, 1, 0x1680);
>>
>> magic number?
>>
> 
> Let me check.

techpack-graphics/adreno_a6xx_gmu.c:
537:#define A6X_GMU_LONG_IFPC_HYST      FIELD_PREP(GENMASK(15, 0), 0x1680)
541:#define A6X_GMU_LONG_IFPC_HYST_FLOOR        FIELD_PREP(GENMASK(15, 0), 0x0F00)

(same value for a7/a8)

0x0f00 is 3840, which smells oddly like the XO clock rate (possibly mul/div2)

(38.4 MHz or 19.2) / 3840 is (1000 or 500) (ms? us? cycles?) and the other one is
(333 or 667) - without any further information I'd estimate this is some sort of
scheduler tuning

Konrad

