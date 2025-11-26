Return-Path: <linux-arm-msm+bounces-83359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A11D6C87F8A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 04:38:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5C316352A8B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 03:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FDA21A256E;
	Wed, 26 Nov 2025 03:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N7KY8YDw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FuliftW0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACF62236FA
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 03:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764128313; cv=none; b=YmdXxXgKp8Wtp0vV5Y7nETSOfzkYQRznnuWXS4p0xOfzOYtD2gnXZf5pu/PGG0ad8g6DyMw1AsQtI93VlQNIumFyuERJGwvfWO2ZQSrp+OnGrKRpx7EidTbN3xVdPj+UxoKgwvBBom0j6jejSqCZZtO+65Z06HAuJ6lcmsIKulc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764128313; c=relaxed/simple;
	bh=UHLKn3LNAlGu9IKhXgxUcb2CmS+t3Ga3426hspRXFI0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=AXUSG52f8PwlMgvjGG3WpEMYzdfFKIpF3bI9rM1xgODzM95l1zvYVqf4Ejy2uM22tLYXsiozq3zVCfhfmNhZi+9yeAozFrQY/y2ISjZn43QGfNkf+TZsU/eCzmg64R2PkXVDj94y8eytJJ4Bs1yYXifM97xxvbGz7G1b/5QdJH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N7KY8YDw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FuliftW0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APH2wFt3738440
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 03:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	agDGgzRr5TSP9r6ApCG+csfzr79eR2JTLEqjVq7+3mA=; b=N7KY8YDwtjzD/UFH
	IJROtuCni8d/hH3xIr/oAq2EbKamSvJrT/78Bu23z5mr6Nteg+4qRHepivPTIWbO
	LQyjIL8XPG+Fpvs7eN4rPfnqzbextZm/Aj5tVNP5keF68wxF+tu7gxoL5tvArjN2
	8+fIatH+I8374KbRcreucqqPleINny0ehcT42VgWI5mwAhR7K03EDHwjkBvD2lob
	tr8S8yetzqJxweUPyxvpeFWrC3UBtjGyBpmlJv3oAPwWyAEZ3R2oOZXlcgoca5Pb
	iZaYo+5dF1W3AM35yc9gyNvgx12LGRLYEe1YqzOX8WEp9ycyVCtEWF1t1ybX4IS7
	Ey9kSw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anggyhdfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 03:38:30 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7a9fb6fcc78so4821217b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 19:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764128309; x=1764733109; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=agDGgzRr5TSP9r6ApCG+csfzr79eR2JTLEqjVq7+3mA=;
        b=FuliftW08WoCzRbQq6RQ5ZSSD3u68Akfg9Jd+zeisNqxPDLPU0tUAj+JoGi8R1oN5k
         +sSELtpbQQGUFtFrrj4NFMyMaFoEXztajHanHIwEL8gyQOi3FWIa7UOwrIYl7j9sOQYA
         c5iHGDji4tFVoz1LpNag3e4uTWd3kgpW0LXGa7HsJWrHuF+z6VoWzyHiYHMrifqsHqko
         DHGJgEw+hAGneUbBIrf2/ZkglGfwAP09IVKxhWQvwcHi6WuLUlcBo6QSr1box5iVDqE0
         UDNmaCWkiczC1hhmyRlRSvu0QD3h7Yn9+q7zClJ+pmlFfqjRutHWTKICX6ublxcIulsI
         kqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764128309; x=1764733109;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=agDGgzRr5TSP9r6ApCG+csfzr79eR2JTLEqjVq7+3mA=;
        b=aMlbO++xS1nYXEeUT20OBbA+2BgKUFPQLBsNIIU835coTvmfgrielUE0Vwb11K2kMP
         FiUdeLJi5WJTM0u1yvDB3dWuIxS9sH82vz4/kPlG3yZBv3MS8zG4bVHXSDY6UQr51sZK
         FyAXUugX4HvYZZJK7EDcmQzhJTnN8DGbQZVOZmtecWduI0cDu0/vTq73xSpVRV0YCjvV
         /yoQmPcpHQRITFC29NukIz7DbW1uENtlZOVQh5gyU5nJCXGK3lRl6dr/NqaejB+CFU6V
         QejU4H0IPIlz8/uzS7TDEcjdwbd5ACZRifsXJOISywoNc5wBe2PYCZp3IK7ugcqaOvkN
         T0uQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1crieJS3Cbc0uIanY+Orj0hHJfVM34exYPZL8SF+mhN3TTq/J0ilHJpyHgsLxVz/AT989bamVeACBdOD0@vger.kernel.org
X-Gm-Message-State: AOJu0YwKCvg++yTEybagvX7HFJly2+ICeUzqt/l1SvFTQnz04BvDN3Kp
	pk8RDW98jiXG/wLdyJ/7I+wnZuAZfjPCKDWjIRc7CyHxvXrliwV5uwo/W/lfSTgabt861KFibgb
	fuT1FH3ajkZS7zxx4sS0uJ6qe3EmdTl4hmuo1rgcnRo9iPi9FEcpGvV2DFIi+OHjeylwt
X-Gm-Gg: ASbGnct7BPS5O/mjSuqRQHdipy07TdUo+j0RJOpUk2Yr3QE8jv5EAI1pIUC8IQwhnRp
	3eXMW6JNmnjMKZgP7mSbHjPDL2hmyH9v00pOyMnlr9X29JYtfjPoLDipm1owCXgKZZqmcKd8hEZ
	7gcdD+eFsIUiyiB3/UqG0JNoks4a22he5/PkBKQ1j3DVPrsR+p7aojypBAspIvpYd1fECvIK8Jz
	mIvgTPTh7WjVjvOV7NJD2Fk+vHp0DiujJhZyaNilXjiDdUB6itgTZiMlZBX+JOqph9F8HeLE4VQ
	AQq2F6s4HKCeOoamIxYbp5g03d53EfnyI2iA/EP+vMkbsoPNXC94yYmYIXXRT729lwpiOvUYXIO
	vuVCGq4tB+RCQGSS6ypiPQjW+CqXKpWiMvP9S53tQR9KqzlYdzrVeAXUoNQsfluj7rkccKw==
X-Received: by 2002:a05:6a00:a1e:b0:7ba:153f:5a40 with SMTP id d2e1a72fcca58-7ca879e956cmr5403798b3a.9.1764128309086;
        Tue, 25 Nov 2025 19:38:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTiG66hdYeGYiaCl9f/OqCieCXEYUJQxdu0p5mNi7NxXuiHye2hU5fq6jbx44J0e52G9P8Vw==
X-Received: by 2002:a05:6a00:a1e:b0:7ba:153f:5a40 with SMTP id d2e1a72fcca58-7ca879e956cmr5403774b3a.9.1764128308544;
        Tue, 25 Nov 2025 19:38:28 -0800 (PST)
Received: from [10.133.33.250] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0243b3csm19469225b3a.36.2025.11.25.19.38.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 19:38:28 -0800 (PST)
Message-ID: <586c0ab5-ead1-4387-9f7a-d1943dffc7df@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 11:38:22 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/msm/dp: fix the intf_type of MST interfaces
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20251125-mdss_catalog-v4-1-df651fba2702@oss.qualcomm.com>
 <3cnujrkkcui34wg3jrfoezradc5itm2paw5mgkii2d2snlac2a@lerj4ldbvf4l>
 <9515e743-b8bd-426c-9827-7d5a170445e0@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <9515e743-b8bd-426c-9827-7d5a170445e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JoNseTif7ez6vkREXMdnvT5lNrxqw7nS
X-Proofpoint-ORIG-GUID: JoNseTif7ez6vkREXMdnvT5lNrxqw7nS
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=69267636 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=GrdrOO9Tebfov7ezxyYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAyNiBTYWx0ZWRfX4Mb0RmmFxltd
 JiGxpRIC8JA+Z5ODqWU8F9fWhxDBMYlBHgqxL5W36UbHjZHmXMePvMvBtW4d6oE7zh1dlLKzeBy
 5V6AjpoIxUj0KqcZYCX2vAF8bcZibvirdJkENn/lrla7063frQnvSMCJx5nuDfDnWDY4rWwwaz2
 1uTZtb1ElcQb9LpUa5lcolalJ8VlFXVoYb/b2cfpV3+sBvD3XJkJ0ow5nUyYSm0nds4eAp785/p
 XYRKqX2PR2yPQKjtTCTmlal6mNOC8FxFD+OV6FOO+e94LNGp9mgxP/cIGkl9lJ7vtcJ9boTzJW9
 OYP0dQPbqDecvQIUBCeJDlL7VQz+s1C8S2HI6JX9X3g8c0IBvxHzGRMSd0Y1nYHG8VFuCvZhd6H
 eleec+Fz4YLG6y0xkX1JXd2EoPqsvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260026



On 11/26/2025 10:50 AM, Yongxing Mou wrote:
> 
> 
> On 11/26/2025 8:36 AM, Dmitry Baryshkov wrote:
>> On Tue, Nov 25, 2025 at 04:22:12PM +0800, Yongxing Mou wrote:
>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>
>>> Interface type of MST interfaces is currently INTF_NONE. Update this to
>>> INTF_DP. And correct the intf_6 intr_underrun/intr_vsync index for
>>> dpu_8_4_sa8775p.
>>>
>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>> This patch was split out from the MST V3 patch series:
>>> https://lore.kernel.org/all/20250825-msm-dp-mst- 
>>> v3-0-01faacfcdedd@oss.qualcomm.com/
>>> ---
>>> Changes in v4:
>>> - Splite chagne out from the MST V3 series.
>>
>> Why?
>>
> i just want to spelieete
Sorry, please ignore this message and move to the other reply.>> - Link 
to v3: https://lore.kernel.org/
> all/20250825-msm-dp-mst-v3-37-01faacfcdedd@oss.qualcomm.com/
>>>
>>> Changes in v3:
>>> - Fix through the whole catalog
>>> - Link to v2: https://lore.kernel.org/all/20250609-msm-dp-mst-v2-37- 
>>> a54d8902a23d@quicinc.com/
>>>
>>> Changes in v2:
>>> - Change the patch order in the series.
>>> - Link to v1: https://lore.kernel.org/all/20241205-dp_mst-v1-3- 
>>> f8618d42a99a@quicinc.com/
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  6 +++---
>>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 12 +++++ 
>>> +------
>>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  6 +++---
>>>   3 files changed, 12 insertions(+), 12 deletions(-)
>>>
>>> @@ -363,15 +363,15 @@ static const struct dpu_intf_cfg sa8775p_intf[] 
>>> = {
>>>       }, {
>>>           .name = "intf_6", .id = INTF_6,
>>>           .base = 0x3A000, .len = 0x280,
>>> -        .type = INTF_NONE,
>>> +        .type = INTF_DP,
>>>           .controller_id = MSM_DP_CONTROLLER_0,    /* pair with 
>>> intf_0 for DP MST */
>>>           .prog_fetch_lines_worst_case = 24,
>>> -        .intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
>>> -        .intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
>>> +        .intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
>>> +        .intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
>>
>> This is a separate fix, it should be a separate patch.
>>
> 


