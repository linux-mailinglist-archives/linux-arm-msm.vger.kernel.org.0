Return-Path: <linux-arm-msm+bounces-56800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7822EAA9536
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 16:15:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC9B03B05E4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 14:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3E925A2BF;
	Mon,  5 May 2025 14:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ND390zxj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97AD258CDA
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 May 2025 14:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746454496; cv=none; b=RimZmrSq7X6fDvjQEvALnhAXYWBOeDpbF59ycpPnX4R+uzTLYOniTWnM0fC5/egWQ9T+PaA3iutbIZARnwm6guux32FX5Khj7ZKikDoxSNpfydbw3k28ax4NZNrCihh3qQkaYwAquFyt5o56rlw+gPdoJUNWOIytfnpVuT4T0Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746454496; c=relaxed/simple;
	bh=g0rIMfPYox6tTNqVeb0ZnxMcXS3eJl9r0KihR8f0GYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fdggBMYwOoCMdF2lPIpJwN0waPtl5kkxr/3HTHAPWztZrjh+PcLnZyPFapoWUthLTaQwFkGRGwCrxd1IwFyTERM77TDdO2iJebNUh024XbQH4B8uN1yqDHq+84slHDyKQdpPYPQvcX//RVSOwVAollloiyczcJvA0GP1gCL01eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ND390zxj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545BkrCD028724
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 May 2025 14:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N4sMPDgul+5aEBpACagOkB2ejQOvDaMfk9F++ofP/og=; b=ND390zxjLditdSh9
	kiFSZFnTqnxOxxGjuzKTkdXrBLm7fTfzneNq/E3ltm5M6SYwWueTLPTMBKFhtATE
	dKwrB0vksp4iEuvR7wG+pQ1Z+hT5ZFw/bAsy36tAIad2JLVUPSaj52ElDhKq88G8
	8JvwImFXBm+Ex2hGLjcyNvStD5SFg0qzBYn9X8i3V/id0XYcH+LBgFIE/ebVsPI8
	d7JL5hVjMt+Gg/7gxfV/v3CLfnnhJCo2+pQWobOYtDAwMxqw4OzTWN4MTine0DcA
	nBEVRWI9fOldTEbcyPEYwDlm3rQOvNiISPfvdXviaT/id2xQgdwFaD10wOOSkGiZ
	L9du1w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbh7c96y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 14:14:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c790dc38b4so790439385a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 07:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746454491; x=1747059291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N4sMPDgul+5aEBpACagOkB2ejQOvDaMfk9F++ofP/og=;
        b=gK8jR0Md7ykQ9iVYVyAHcUwtOYem6JJ/UrngoVvCE8JwJaXm/z9hjelDX4/3WYDb9J
         +06hcIaQz25KqS31+FY4w5zRTKWRlVN0E+BoR6TtDexmiB6L7ZAkc/2JrDnhmPs51UO6
         J2R5sAYZBrRTGM5wNLwLW0isvpq0u8j9vgbYHbLLJK//dn6fvz1VzNog0yVfmx8UTRfg
         2IIcarBrWus8KvZ2twCwOn15bN3v4x76erTxu92h8w3iSySb2MKoTKg+5u+h54lohdba
         Sjyhi8mtFcsVxziiGDRDbhraMFPvNwhD5duzbEwycmDEz19Hhryc2TVnvbkT5YOQiM44
         e6Ww==
X-Forwarded-Encrypted: i=1; AJvYcCU21bD3kxzC9lEvQLd5nPC3qE7WmpO9S6eN1ZxOrPa4PTyYzm+GpDVgIZjKlvLMvtZfGrdBzc0GjBt10Khe@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo7SRAn9Qh+e3C2HRDx26P8F5YiqGahdOvOspetTX3fxAhsdMX
	EuzRWrrDbt2IHBW8nKoQKF6HAMIEyS1DwXsmHCopBs/U6R93YfWJ2mN8hg2WVI5bzMEWr1/ZvLm
	DjO4uKkbaBpuWXPmRVZ/qYrTgFzB1pcWyjkVmgE7q+vLxSLYRhiijn+Aw5a14Sry3
X-Gm-Gg: ASbGnctdMEJ6jCiL3xrpePBad+tXSLujEp5XXkyBDrd1oJcmnHB02SGCG7Byk77h0aZ
	S+AkekV23irPOHQkmEhQhDdRpRvLF5OfqABlRwpyeAXMNMd433CXLL9eOBh/chwt1IZw2UVtlP9
	y114SDcX2egLtm2CvdLm0B3mP+8V6+jOigXJLaN+4iNxkC3Rd5RZ16aAAdiXpGISBJXSEO7xlCh
	iczysCJckCxvYuYrW0Zz7sTcncXC5ayD77MbSN03sZN0kzD8f2GYhovJ4sMqjZif34TQwp2uR8O
	QScXvaTm64hEKLSxuj9K+1OSHjo4/k//ba/zf5bU3wTdfTEdC5CwnkDN6JTu6Y4M9DySacrwSnQ
	qsfomKORxLI4zpKf4+ahp6Q5jfNF8OTJW4wWf1bEuUVq8M0I1ZDN/2aUIwJGqaQMFJLAN
X-Received: by 2002:a05:620a:2697:b0:7c3:ca29:c87e with SMTP id af79cd13be357-7cacea24688mr2331708485a.21.1746454491515;
        Mon, 05 May 2025 07:14:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/vBvLz2xsMDmp49gK5gm96O/Tw7T3JFctVTVSeo6t9VZN8IC+KDCL2/JJC8O+HXJyk28oEw==
X-Received: by 2002:a05:620a:2697:b0:7c3:ca29:c87e with SMTP id af79cd13be357-7cacea24688mr2331704185a.21.1746454491141;
        Mon, 05 May 2025 07:14:51 -0700 (PDT)
Received: from ?IPV6:2001:14bb:671:42db:147e:6740:cd7c:7688? (2001-14bb-671-42db-147e-6740-cd7c-7688.rev.dnainternet.fi. [2001:14bb:671:42db:147e:6740:cd7c:7688])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f6613sm1721233e87.217.2025.05.05.07.14.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 07:14:50 -0700 (PDT)
Message-ID: <f56c19a0-18d7-438d-8d05-98ae7a842959@oss.qualcomm.com>
Date: Mon, 5 May 2025 17:14:48 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/24] drm/msm/dsi/phy: Define PHY_CMN_CTRL_0 bitfields
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-15-8cab30c3e4df@linaro.org>
 <j47udhqq3ldsza3cr6a6rd5dq7uxjgpolbmdhmpzvzt7glpuva@v5tgkydlywag>
 <97e49dc5-9cca-4c85-b0b0-18c472d0ec0d@linaro.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <97e49dc5-9cca-4c85-b0b0-18c472d0ec0d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fMY53Yae c=1 sm=1 tr=0 ts=6818c7dc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=F9VSnBJ7OdIsbtMwzSAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: lROIRtOk1B7WN1KNqdrgEbAh5CquBQ32
X-Proofpoint-ORIG-GUID: lROIRtOk1B7WN1KNqdrgEbAh5CquBQ32
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDEzNyBTYWx0ZWRfX/SZXsjYkex0T
 +lXDtHz/i7ipLTq5OQbRcQZ1M3G1HjNNENiaKIZLCVZs4K86rxnzheTDc/mcnFcrytfo5eeMiW2
 x8uUmQcgSs1VR085z7XOU0zizlEBDfB9AYqyOUTZGznTttdPnR9EY61iIcozKmCd+E1G/bI+CX8
 KzMDI6VMqeHrqeJ0i2+aic6G4CL9SKs90v6C4nHKjMX1qV8eJQKRSL6VapUI+/k84LkEkZbUnes
 4Mpf2/7A5g1dVvNZCWsCp7L6Chm9Kc1GA8sIzc3RzqhPjGZQ5QS0fQxAFNmaSigQQLxJGOmgtnz
 J4g1lC2HRCnRCra0ORy7Z9zmC62GyvodFSFYjmiSP+nTZtdVP4YnT0akg4W7Qc4mRWFTBcoV5qp
 H1VGCQ+q1nXXDO6/l/s0DbS+dJqmtLhI+2q8mWktL5pcpFC/ubcA2rTrKNvusZpdLGCRkQuW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 mlxlogscore=982 malwarescore=0 spamscore=0 mlxscore=0
 adultscore=0 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050137

On 05/05/2025 09:17, Krzysztof Kozlowski wrote:
> On 03/05/2025 00:44, Dmitry Baryshkov wrote:
>> On Wed, Apr 30, 2025 at 03:00:45PM +0200, Krzysztof Kozlowski wrote:
>>> Add bitfields for PHY_CMN_CTRL_0 registers to avoid hard-coding bit
>>> masks and shifts and make the code a bit more readable.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> ---
>>>
>>> Changes in v5:
>>> 1. New patch
>>> ---
>>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             |  9 ++++++---
>>>   drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml | 11 ++++++++++-
>>>   2 files changed, 16 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>> index ca1a120f630a3650bf6d9f9d426cccea88c22e7f..7ef0aa7ff41b7d10d2630405c3d2f541957f19ea 100644
>>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>> @@ -362,17 +362,19 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
>>>   static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
>>>   {
>>>   	u32 data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>
>> This (and several following functions) should be triggering a warning
>> regarding empty line after variable declaration block.
> 
> You mean --strict or what? It is common to have the &= immediately after
> assignment, so that's why I chosen that syntax. It is just more
> readable, but I understand your comment that you want --strict
> compliancen even if it hurts readability, so I'll change it.

I'd probably prefer to split variable declaration and readl invocation. 
Then the code will be logical with &= comining on the line adjacent to 
readl().

> 
> 
> 
> Best regards,
> Krzysztof


-- 
With best wishes
Dmitry

