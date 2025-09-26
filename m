Return-Path: <linux-arm-msm+bounces-75286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E78AABA318B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 11:17:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D3A64A7793
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 09:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 975AB21ADA7;
	Fri, 26 Sep 2025 09:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iNgeqdL3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3A01A2C11
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 09:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758878257; cv=none; b=a9sj1jbV3KiVn5tF9Ok6bFTL/L5rE6kgHCZWsE8yAgssmGoE23HzwBwI+E9v/bUq+Wnmyl5b7JZ+/Iz6Xnul6nSERAZz+bEpbBdSf2cuCvA0glLGGmwq2z1zVgWnodkfhdMtTXH1ge4cojwLgL8LoRnmjBMqaAR2t7+Bm1emsFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758878257; c=relaxed/simple;
	bh=IhVIkSlvFGuoBf7MEntBolNq3AVtioyVBXbE7vV4D9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jvla7tWalmX+LCJx/rpUVzhAzqnLFSzpxZEl807YsI5K8vWLTXERR0fH/JfCf64x88CzApkMrZ/+SJK3jvjXu7WzsPmElIvUt+cHGI5EAu1S9lrKGU8D/EyhspPkClErpxYN/xZKJpaAM9yPTsgJfU4C4NsHGWbzobGnpedatdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iNgeqdL3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vfYd027570
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 09:17:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wm50d4xWWfh0HW+Cx0UYIE/gdY+1+ZE80v14qcFJHbs=; b=iNgeqdL33AfJQY6m
	HpHam5rvSwaARcJA7ySFTVKvMYWlanoK9djxVoIKbMRS6YBp8BfEXygnGooY1q8d
	JdpXhjzIOToLc24yg6gk4nLtERVgvbh5F7SXeU4pvQunUseVMbwOznWtEQdWgiAp
	YHsXmsLdiXNrd5F4vcNE+4uNmlx72h5VxOoYf3X/4iRMebGFcRAqJ+81lMhpsGax
	ElQyInrmMcKgUrhEEMCOWk6tuGQmBL2JYHw31ecuVxKpvZO+UWVj0/2LuGKe9ft3
	ux896clB67Ko8NqiKK+ukpXVosFTyoymg99OW/t8PUVtBpBD1ehwj57tgZmn683i
	CJnQpg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qt8as-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 09:17:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-267fa90a2fbso31106955ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 02:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758878254; x=1759483054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wm50d4xWWfh0HW+Cx0UYIE/gdY+1+ZE80v14qcFJHbs=;
        b=WbmGonVBSkXT7051gCraXl7TKypQvUdQQfTo3WKoKqyXWuDZO3XloeJ1PliuhuIaZp
         HecYfLQhV6kJcx8iX2f0HDI65M5yynHP1Bo0R7xs6XAW9HSQH0sO1zTi2gleDRe8LpbY
         q/B1Y/gWUU/srijgIL84icKwGp77KvaGfOejNtmuHvA1x5n3NHdJVzC7Ikp/ko7bz/Ck
         DJUN5Xq/08FGMs0/dEGJX15NkjjbnhbIbSlI22l15oZ3pAnmg9XxKKBidLbZ/9lilBWe
         0k7EAgA3XYBPlfnwK2FgM/bjZW1jsXWsYctSiBmTSJSHr147hTPpDyU+BB3HidSp9WNx
         PXRw==
X-Forwarded-Encrypted: i=1; AJvYcCWO+N+BwfTLKq5N7pCYrv4shpSHGrRgbP8zbeeT4hNc2gkHbJd1rsyUj474shCKnNUrBK4UUL2Cxmsv6+SN@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/zeJ6QN+TowtBgqn3YDz/qPB8NMw75R3kbTIBTXlr6LS45C/t
	C1quRZeebW4CV1WaWIx2bv194JT/LNiIeNDafMElYiIt+kha/jKR9XxZZ2qrz7OD1GKDIqK4kBA
	hcc9/mJFCMR7c3Do9JQDQ2snisY9GHugKnjPfAlj3qb88pGWFSGdrap9+kn3fsSB18LgqvoCKfc
	KK
X-Gm-Gg: ASbGncugvp95B/+7hek/GeiaVikRb4bPsU2XghbnPcjJrg9hknsZI6XjEPST6WyO5eE
	+oqJkjL0srLZpGcqISzyMLoKgEVYeKYJgxm/XMMNJEbhjiALqHtOktFOgZROw6WolrMq06+LFvy
	noJu79fSR/IfyKEz2C+Gr2QfSsou2yKZBmSkT2IMb4764cB0tHwlDY1ZhT6Fc19pX9X8Iy9lPNd
	kRsH6aD5Y+DGw0DjV2uTA7+s8YghSzF6YGQ0qbrSMzb68QI4BWQVN+0mFiL5im5zJ0s38iskMFH
	ICaymhHkAFHWJx+sXrE41xfQl6rYjziUIQm70Vrq0EyOeyzVQw5lRhmgQ7FaOGoqfFWeDWaSK/2
	6clMa1T3rXrP97ChTiiZvsK12srZdfh6LG75q
X-Received: by 2002:a17:902:f78d:b0:266:3f63:3500 with SMTP id d9443c01a7336-27ed6ce6bd6mr59847945ad.12.1758878254229;
        Fri, 26 Sep 2025 02:17:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbhY2xko/xj3ahYbA0EHEhHusHZw6XP4XJMWBT/7X9Ki73zPM3HqiR38u2BGTHutIJSleAWQ==
X-Received: by 2002:a17:902:f78d:b0:266:3f63:3500 with SMTP id d9443c01a7336-27ed6ce6bd6mr59847515ad.12.1758878253715;
        Fri, 26 Sep 2025 02:17:33 -0700 (PDT)
Received: from [10.133.33.162] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66cf181sm48314975ad.28.2025.09.26.02.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 02:17:33 -0700 (PDT)
Message-ID: <ff178417-5903-43d5-8f4a-7666df9ff85b@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 17:17:25 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/5] dt-bindings: display/msm: Document MDSS on
 QCS8300
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com>
 <20250911-qcs8300_mdss-v12-3-5f7d076e2b81@oss.qualcomm.com>
 <20250918-spectral-seahorse-of-witchcraft-69553c@kuoka>
 <b745c515-2264-42aa-8d92-663efc7f6276@oss.qualcomm.com>
 <6c195b42-d994-4d24-9c40-48d8069304e3@kernel.org>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <6c195b42-d994-4d24-9c40-48d8069304e3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: y3Q6q6FToFcAShBRfYEhXmKuENJXYYF3
X-Authority-Analysis: v=2.4 cv=bJ0b4f+Z c=1 sm=1 tr=0 ts=68d65a2f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=LHWNMJjZwAtaeQ_MGxQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=d3PnA9EDa4IxuAV0gXij:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX8yGEzjHggjDd
 pev2SQehLdAhf4/XNM2K1ThX+fn06oc7RxrmPzDae3Exbytjv2ftUN7pnvkZKM1LYBxBiy2qNTR
 DCuNCXMNPkA2ktjtJkHbgOZEJPQsoPEzVoJuPtxUJg3Ag2zVGTQnPxr9s9Hlxjs+jZr17CpKZf1
 lO0wP8/O37xDq6VcCCyQGjHxvhEbEBq62+SJp24lONiJzhB7HQ1IHex7XXGrArWpRz2ipvhID0h
 5zkzmwykrkiuvOCc0Vt3VokVTZoXwQG5TF/2k/Kqi9j9ZAfv8Uq5IcT23/hb8jQcA1sWn0H89Lj
 bFVtljmSpkjr0tACEexAXJj7Gt/1J6N4xUiRf+yqdS6iCw0rEKlMtlmqmv76HqFNkjyCyYqOiS8
 DtVaKNKMfOErAwIKKAnakT2VT6Ap4A==
X-Proofpoint-GUID: y3Q6q6FToFcAShBRfYEhXmKuENJXYYF3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171



On 9/19/2025 12:34 PM, Krzysztof Kozlowski wrote:
> On 18/09/2025 13:14, Yongxing Mou wrote:
>>
>>
>> On 9/18/2025 9:01 AM, Krzysztof Kozlowski wrote:
>>> On Thu, Sep 11, 2025 at 07:24:03PM +0800, Yongxing Mou wrote:
>>>> Document the MDSS hardware found on the Qualcomm QCS8300 platform.
>>>>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>
>>> Patch v11 and still basic issues. I am very dissapointed.
>>>
>>> <form letter>
>>> This is a friendly reminder during the review process.
>>>
>>> It looks like you received a tag and forgot to add it.
>>>
>>> If you do not know the process, here is a short explanation:
>>> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
>>> versions of patchset, under or above your Signed-off-by tag, unless
>>> patch changed significantly (e.g. new properties added to the DT
>>> bindings). Tag is "received", when provided in a message replied to you
>>> on the mailing list. Tools like b4 can help here. However, there's no
>>> need to repost patches *only* to add the tags. The upstream maintainer
>>> will do that for tags received on the version they apply.
>>>
>>> Please read:
>>> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
>>>
>>> If a tag was not added on purpose, please state why and what changed.
>>> </form letter>
>>>
>>> Best regards,
>>> Krzysztof
>>>
>> Hi,
>> Sorry for the confusion. I did intend to remove the Reviewed-by tag, and
>> I mentioned this in the cover letter, but maybe explanation in
>> cover-letter was probe not clear at all.
>>
>> This patch includes three changes:
>>
>> 1.In the displayport-controller compatible property, "items" was changed
>> to "contains".
>> 2.Use "qcom,sa8775p-dp" as fallback.
>>
>> These changes might not be considered significant. So I’ll be more
>> careful next time. Thanks~
> 
> 
> I really do not expect v12 to receive so significant changes in the
> first place. If you keep sending us buggy code, which then you keep
> changing after review, I will just not do the review. It's easier for me
> to wait for v20...
> 
> 
> Best regards,
> Krzysztof
Hi, this is the final version and i will be careful going forward.. Thanks~~

