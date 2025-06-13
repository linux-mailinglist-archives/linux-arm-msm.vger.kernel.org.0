Return-Path: <linux-arm-msm+bounces-61236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6590AAD8EFA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 16:14:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FB283B36F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 14:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06D6522688C;
	Fri, 13 Jun 2025 14:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DihtPqmI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603EF2DA765
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 14:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823507; cv=none; b=NVJWUIrgdkYsTMq8BHbsanXGN9N9lcgehcrmc7QTJoA8Ka3BgwnSS2051A4DMSGBGfytW9zzokbOMygBnwSQc/bynlOdksoSW6XLqHymIbwbKRsk03ezBXQn5wQWgzkgtPEVexhuaJ51F2zA21r47vODVRY1cguVm8TZ6COOpNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823507; c=relaxed/simple;
	bh=WiPNgNnihh2S+/7TTHFaJMjiKhGGv6OSW5UWdjeBRiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HByEAG96Ab846OV9FyJJA0kPc+CPQYkRaFp9Byr9Nx1riTNHo2habFUFvHIQfjkBztWRvct8ULZgltD30JOXq4U9ij4ar31xEJtWaWaRKg2HG2M/qxX3OaX5sb0QfIm9yeGw6uCDaD9Xlc3ncQi3wjXL4Xmx+iUB8DO5k89PR88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DihtPqmI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DBjfYx002515
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 14:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SXbFVS3HagPAIGb4Q6j9L8gN9T65FtuJmw8eE95m7Hc=; b=DihtPqmIpiFvuGhA
	StkWJqw1wzFY7E9AxU9jY/rNqYKAa/Q710ybRmEMn0gOAE2A0DfLnM480/j6KwYs
	kR4prcYBOTBKM7Py2RvPZFszqlcxpnHUS55o4pvSsW3zJttlPB1OseSN/e8tGLCd
	7Q85dAKVtqzsWgDsW3dzjKTH6pK0ZijRB5/75VcKnu8tunbXXK+HDg3tY/NJbwcH
	lVuzpMUm+4zo6/vljkgAgWKlaPk0N1g/Og+AO3xsohl9DWNjg34loiE0jjl5VtI1
	623rG3pHXJXqsxYFkWUPhP6lQwT92Szg6SW1lY9iV6bSvwntZrbOuMSUdUbZ1mKG
	LQjtsg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 477jbpn5dn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 14:05:05 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-4e7b32abfd7so1680233137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 07:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749823504; x=1750428304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SXbFVS3HagPAIGb4Q6j9L8gN9T65FtuJmw8eE95m7Hc=;
        b=DY7lZxTtDVmFrR0SRygF8P8/I93AXRgdNlyZVSEJuEqXNj30KvzThXf9uV8Q1M9+5S
         1s+07ZH1ZJw9Q80vK89yIU3LpYSJ2PbB+iZi/HoXTvWIBtPmWir3KIu1yo/qelXUwzgy
         wrpeOwMELMB86Lm5a8TmYRNaAGChPpaTpiFRNXHwrmv4YH2qCdtwCqiuZKVHbAS4/CSu
         R6fBMRr8jLFtyVjU6u6+vpxI98HDRGlpUiuSjcXkmHt44YmYKQhT2KkbHxuhbesGGb6S
         c8uNrUD8GujIrK5CaeqlKS28lNPc/fKuCD2P5g6KufFrusDdhjpxycd3ynVBd3jSn0vY
         0oFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMHjyIh3Wi3OBzmsxBlDZqVWTij0nxQls3uqArr/LKBJFElm3HZXRL3KOh4bqCvtz9PwlPYfTNMG2gOBCO@vger.kernel.org
X-Gm-Message-State: AOJu0YzUGxDo5hMlqupfwd6WueXRwIJJ5DgyeZH9nqR1rt9rwHSh8gfY
	4vgXds/WvEr24s39v2nAoBTF30nZHPEX/3qmyrFWIs4a3XLyfHpXVKMmsgVnYeQgEURWhpDCaf7
	T9D63k7GBMcFmdW29j1BTY0UoRZnXyzkhKv+R/scimvhTLq3Yn1Hx+PeE5v7aClob6ZtXgd8uFP
	Iv
X-Gm-Gg: ASbGnctn33DIfCGa57NXnAc4V+RmBmMq1hRgHKWPgbnirD2kjJ6OAZnx5CC37DoT43+
	fzZtci8Vdp7SZ1WVaU6dVc2n7qRDrN16mkgkG28BYta1F6XciVi1Qs5cevFzrNjcz/froK5k94r
	DYQ6b9V4Xumk1l5ayEa6D6mwqvm+pqKtNmskXArQebm02LjJSkI1gh8dRBYpshm4AkQtIWwGRJa
	ER2qj8TwHnVE86PrbckXSiyWdgpur0GChRM1K5gcgs3cNZlOywswEnRyGSqvpuI1Sa9uZ0bV4Sh
	hj/c5YekbicZtZ7AAMLj8Sv+0hb/AgG85b/iBA9uauM3KVyFd8avg38LaDxuDyd+h++Wsz0=
X-Received: by 2002:a05:6102:80a8:b0:4e6:f86b:143c with SMTP id ada2fe7eead31-4e7e37e0d7emr2327414137.1.1749823503115;
        Fri, 13 Jun 2025 07:05:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAabxiuRoQe/YqtbK2biWXOJsRJMOrPMmyOlfhlU9BuJsNPdIIiFtgHaougk+e0AABz+4dYg==
X-Received: by 2002:a05:6102:3ed4:b0:4e7:b8ca:e3bc with SMTP id ada2fe7eead31-4e7e39d8cbamr2083763137.17.1749823491378;
        Fri, 13 Jun 2025 07:04:51 -0700 (PDT)
Received: from [10.161.140.61] (87-95-85-22.bb.dnainternet.fi. [87.95.85.22])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac120167sm456434e87.20.2025.06.13.07.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 07:04:50 -0700 (PDT)
Message-ID: <738a889d-9bd5-40c3-a8f5-f76fcde512f4@oss.qualcomm.com>
Date: Fri, 13 Jun 2025 17:04:47 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/17] drm/msm/dsi/phy: Fix reading zero as PLL rates
 when unprepared
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
        Dmitry Baryshkov <lumag@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
 <20250610-b4-sm8750-display-v6-8-ee633e3ddbff@linaro.org>
 <n5djafe2bm4cofoa3z4urfogchhfacybzou763nelttgfspo25@bywfd5febe6g>
 <dbcfcb3c-0cba-45f6-aaed-b79494d96cde@linaro.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <dbcfcb3c-0cba-45f6-aaed-b79494d96cde@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ykjcjzPGtUmiIrxUvNvolsAsqZxlza9d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwMyBTYWx0ZWRfX/qkofgM0u3HZ
 h33ay1uGRWjGpRBKi0U/WnSFnKj7EkBn/7Sb/+bxSOZ3AuHixuZeBzQWOOq7lp8DDIskfdZdc5w
 DqVsS+xaPuaS2ijASV8SJ0JTT5/aijAXDzOLe8D8eQGTudIY+HA6myj1AR4UvCs3tUQLD18mjRJ
 lfFUSWegZ559W4/jpN8E5wWCcEBowRGnHJ56AiHj0504rea9kLzFwfuCj8vfBV+pluYwS9s6Xcp
 0RpYgWKYsll/wkt0T5cKw7v6lrAOVKtGtjn7I6aZ+RHICs5E3W+g6LAB+XoXu4722Remr5HGInF
 QCtO8Ko3E4FoEgqXKtP0IAjqnOfGab37AwzC4gdI7Nsk0Ximm9N6FSEx6P6Y0VDQ2hWVbKmEpxp
 CH3Fgm/+4PGiMEamjQKayYgq8X4Jrf/COQJGjN8tHnnOkE812U3DrPVb9AezUZdtLDUCaoTm
X-Proofpoint-ORIG-GUID: ykjcjzPGtUmiIrxUvNvolsAsqZxlza9d
X-Authority-Analysis: v=2.4 cv=OLgn3TaB c=1 sm=1 tr=0 ts=684c3011 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=E+pfOR1jn8a0x6QusqFK4Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=0NLLj492lcDJW-k-HvMA:9
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 mlxlogscore=669 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506130103

On 13/06/2025 17:02, Krzysztof Kozlowski wrote:
> On 13/06/2025 15:55, Dmitry Baryshkov wrote:
>>>   
>>> @@ -361,24 +373,47 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
>>>   
>>>   static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
>>>   {
>>> +	unsigned long flags;
>>>   	u32 data;
>>>   
>>> +	spin_lock_irqsave(&pll->pll_enable_lock, flags);
>>> +	--pll->pll_enable_cnt;
>>> +	if (pll->pll_enable_cnt < 0) {
>>> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>> +		DRM_DEV_ERROR_RATELIMITED(&pll->phy->pdev->dev,
>>> +					  "bug: imbalance in disabling PLL bias\n");
>>> +		return;
>>> +	} else if (pll->pll_enable_cnt > 0) {
>>> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>> +		return;
>>> +	} /* else: == 0 */
>>> +
>>>   	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>>   	data &= ~DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
>>>   	writel(0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
>>>   	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>> +	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>>   	ndelay(250);
>>
>> What is this ndelay protecting? Is is to let the hardware to wind down
>> correctly? I'm worried about dsi_pll_disable_pll_bias() beng followed up
>> by dsi_pll_enable_pll_bias() in another thread, which would mean that
>> corresponding writes to the REG_DSI_7nm_PHY_CMN_CTRL_0 can come up
>> without any delay between them.
>>
> 
> Great question, but why do you ask me? The code was there already and
> MSM DRM drivers are not something I know and could provide context about.

Because it's you who are changing the code as you've faced the issue 
with recalc_rate.

> 
> 
> Best regards,
> Krzysztof


-- 
With best wishes
Dmitry

