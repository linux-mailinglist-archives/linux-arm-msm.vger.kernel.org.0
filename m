Return-Path: <linux-arm-msm+bounces-61731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 627FDADEE03
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 15:39:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 042C217EFBB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 13:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD3122E9732;
	Wed, 18 Jun 2025 13:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TS6A3eEa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5F62E9743
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 13:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750253963; cv=none; b=EhT0Mu89x1aLGhJOm09jZBenf4ff4zfQYh+GmuY2z69/2hWd8oQl/2jPbieAdyiF15YeqCV9fotLqag9Tl+5h9CwR/5En0S9VzriCdbCqwzZ3hEV0/gfOF8rlMoREHwJqKTnq/8jJFaKe4pRVKZYhushN0RSNrmLmX0JbZtJTv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750253963; c=relaxed/simple;
	bh=R7do5X/dzbKFhPd80Rrbvxwt9EOrSDZ0d7dEdzQbftU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bF5QhjUaQ0MXNzq2PkVBOkPxo7KScPFeN0/vHrGjwQVMMx4/49+F8TwCfihl/dIua/kfgLzH1XglAmYKKvxuSSA4l0HhcvStHahTlNWl3LM1DRdUezKrnEGO8M5dmy5QnmRuxvP5Mcu+tdzmbnIc8eBWWRmpGfTLFu0q3BkeNFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TS6A3eEa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I9oD6V014411
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 13:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4EXdgzWBp0rRNaJUQrduuFz9dcLZtkU3b7btYf+fyks=; b=TS6A3eEavcszJ+4u
	utlHuBbP5Ro/XSrrrJk7631nSwT83ZoPwxnrnc3T95lXnS21LJ3HAliIeThWwOux
	3yogDz/mEZ8S8gxtTUNJxEUEQJ55zjtwyOfXC0DAYbyjx8CCQWYcE3AVwm9eqzN1
	pjRwAtBU+dWaUniwTTACHZVdQqCaf3xvwWK2eSO315X8J7TWs9EjH6CPejF3xvXz
	uuz0AhLUkvtIpBApzpQnlj4IqM55SftmQ5/SVM6kBOv7tA5GK9daWgtk547skQPD
	lApVocx52v4RYdsBqesRcTC97+OZTs5DC00hDXaIZoezSTGDXixvsPyKCRBFs67h
	/hvdIQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791crv3k8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 13:39:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5bb68b386so2184201685a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 06:39:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750253959; x=1750858759;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4EXdgzWBp0rRNaJUQrduuFz9dcLZtkU3b7btYf+fyks=;
        b=OYb85tOblCmzv6NJOrlf2VZCKeMGC7FrN9x4enCDkBwA3HlXWgoTGnvsm5QcmCzRi+
         jpC2WHT2nk1DhZNHtXbARW8FF7gzS+v7J99qd2DPWtAx+gneNixBbisS2RdQwPoAkSro
         4p6s78/xZJtHPh+BydmapTrO3a1/8pUWlrXwHgxBDLgMQNjQlpp5mjImHc/QI/nvQLRh
         sPCMY1a0PnrxgTaWZqrrJGp8SNuFYg2FOF7jWXBYrp4mKA5WUSCM+Ukd32FxfdJhyG+I
         tnT9U5oty/kTUHVrKhOOWfjNopu8gQQIIt7KFAO0Nl/x2PgCQqDIhmoA/mdFJXFKR/Qr
         VDlw==
X-Forwarded-Encrypted: i=1; AJvYcCU5fmHc7RUaznQpFS9MlXZvP98kocY++42jjqr9BhTwj2efpxejpKy39Jv6a9sus5ye0WrXS7AUVMLDHh2D@vger.kernel.org
X-Gm-Message-State: AOJu0YwbmzHfGM8nstMfRfWPZ5m9ZWiUBMYqoltwPQpKgBClbA2vt8Mz
	wRatCoJWF3N6tWpDaWu0uov9wQ1OpHcGpFhFterTZbYEKgjBR7Q9mVkp+gef0OD1eNfTkUVT+vf
	IlOGJnyR1ATsIeS44XRseivo6q6QtZpFkKADUHz/h5V1bJYg06+lminiTZmLSBEvf9DVT
X-Gm-Gg: ASbGncuCWy3JvJhhEuyQ+O4kw7nhxvIsrgLnS4gPQJwvaRRSVBQm5SIV7hAa/FUDMDo
	8pZ1b2UShPSqbSOlNbjA40wue87fZh8K/nu1t8bRCjNh8solrdrUzlQ87z1oi2q64PpSulZvuZE
	XzrRALb9y1BaacNs+uOHtdEF+FEqV1TS8FEf8exuD4/nA8lAPvgtHOSn9tdnYN61OQUqvkZgm+d
	hphdwugSmC6BDvvTBqStFJex3j5tFYWAawh9Pw6PouHrfZ1rGjbsOTcZBch/De55a1ECUsPpjci
	AUmCDNkNppd2b201MVZvLTwKqLp4wKPCL7VdEhSqJg==
X-Received: by 2002:a05:620a:4512:b0:7d0:9ee6:e7ac with SMTP id af79cd13be357-7d3c6c16571mr2603784585a.21.1750253959488;
        Wed, 18 Jun 2025 06:39:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUVtqsx2MV4WTV8JMc+1EJgnKxxG3YeGolNRkNZNGXdIZpmLSYPMNcqI7vB8yIshy4whg95A==
X-Received: by 2002:a05:620a:4512:b0:7d0:9ee6:e7ac with SMTP id af79cd13be357-7d3c6c16571mr2603780285a.21.1750253959040;
        Wed, 18 Jun 2025 06:39:19 -0700 (PDT)
Received: from [10.92.240.160] ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adfa7435a1dsm906932066b.110.2025.06.18.06.39.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 06:39:18 -0700 (PDT)
Message-ID: <fa8d4af9-e822-4dec-a8dc-f3bbf5dd0100@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 16:39:15 +0300
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
 <738a889d-9bd5-40c3-a8f5-f76fcde512f4@oss.qualcomm.com>
 <8a986ebb-5c25-46d9-8a2f-7c0ad7702c15@linaro.org>
 <24xkss4bw6ww43x2gbjchcm4gtmqhdecncmxopnnhf7y2tblc2@iibgqhuix5rm>
 <f2654844-091f-46bf-88c6-6f6d4edc5533@linaro.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <f2654844-091f-46bf-88c6-6f6d4edc5533@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mGV8UPreUt0Z2MYvZPk_l-JKAeqabbhg
X-Authority-Analysis: v=2.4 cv=BoedwZX5 c=1 sm=1 tr=0 ts=6852c188 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=BTWw6KF8kvBcRQRl-U4A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: mGV8UPreUt0Z2MYvZPk_l-JKAeqabbhg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDExNSBTYWx0ZWRfXxzoJQovJNAri
 GGIpiZqODhkRMKWt0qsGVMuST2ZJgk/3NL19plF5z2xoNnCt1qeSX3PasIFBslRNqtkKbsbCLpz
 3uHsLPmoP+4EXJJz7eoz/jFoRLeGjP6Zygy7Lmk3stAw8cRUTcM3rggvMKAzXMdKH2NHZupOm9L
 yWkIru/YYhbL0q8zMyOxFKWvYX3wSHCLS1VNVEbt603f/7EFF96gzyRjrEZ9WIiL36b3T0lE3CF
 pA9WW3SMvPivsoo4IA6Zyyb7BhN9VZ4nQmyKpS/seFzWWDzyW7HH5CDGUtbyrQOcGNklPQEAMhZ
 mwkrAyq+lEOPKujgv1dd6EI6UB4UX1cvj/6R56fN5r0SliMXt9WxVaxpOEQ1UT/WLvzyTtTeBfA
 Y7FpXIEHdM/slXH/u8MiEHUyWS/77GHht4668dneS+5pKC/e80hIRHxPuMIulTzbR6LMqbaO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=666 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180115

On 18/06/2025 16:34, Krzysztof Kozlowski wrote:
> On 18/06/2025 15:07, Dmitry Baryshkov wrote:
>> On Wed, Jun 18, 2025 at 10:28:10AM +0200, Krzysztof Kozlowski wrote:
>>> On 13/06/2025 16:04, Dmitry Baryshkov wrote:
>>>> On 13/06/2025 17:02, Krzysztof Kozlowski wrote:
>>>>> On 13/06/2025 15:55, Dmitry Baryshkov wrote:
>>>>>>>    
>>>>>>> @@ -361,24 +373,47 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
>>>>>>>    
>>>>>>>    static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
>>>>>>>    {
>>>>>>> +	unsigned long flags;
>>>>>>>    	u32 data;
>>>>>>>    
>>>>>>> +	spin_lock_irqsave(&pll->pll_enable_lock, flags);
>>>>>>> +	--pll->pll_enable_cnt;
>>>>>>> +	if (pll->pll_enable_cnt < 0) {
>>>>>>> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>>>>>> +		DRM_DEV_ERROR_RATELIMITED(&pll->phy->pdev->dev,
>>>>>>> +					  "bug: imbalance in disabling PLL bias\n");
>>>>>>> +		return;
>>>>>>> +	} else if (pll->pll_enable_cnt > 0) {
>>>>>>> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>>>>>> +		return;
>>>>>>> +	} /* else: == 0 */
>>>>>>> +
>>>>>>>    	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>>>>>>    	data &= ~DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
>>>>>>>    	writel(0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
>>>>>>>    	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>>>>>> +	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>>>>>>    	ndelay(250);
>>>>>>
>>>>>> What is this ndelay protecting? Is is to let the hardware to wind down
>>>>>> correctly? I'm worried about dsi_pll_disable_pll_bias() beng followed up
>>>>>> by dsi_pll_enable_pll_bias() in another thread, which would mean that
>>>>>> corresponding writes to the REG_DSI_7nm_PHY_CMN_CTRL_0 can come up
>>>>>> without any delay between them.
>>>>>>
>>>>>
>>>>> Great question, but why do you ask me? The code was there already and
>>>>> MSM DRM drivers are not something I know and could provide context about.
>>>>
>>>> Because it's you who are changing the code as you've faced the issue
>>>> with recalc_rate.
>>>>
>>> Heh, the answer is then: I don't know. I think authors of the code could
>>> know.
>>
>> The 10nm HPG documents a 250ns interval between enabling PLL bias and
>> and enabling the PLL via the CMN_PLL_CNTRL register. There is no extra
>> delay between disabling the PLL, disabling FIFO and remobing PLL bias.
>> Please adjust the code for 7nm and 10nm PHYs accordingly.
>>
>>
> 
> I can drop this 250 ns here, if that's what you ask me. But fixing
> anything in 10nm is not relevant to this patchset. You were already
> asking me for different fixes for some different things and I find it
> not acceptable anymore. Stop blocking this patchset with every little
> existing issue.

I think that it is a common practice to ask to fix the issue in relevant 
pieces. For example, we frequently ask to fix all the DT files if there 
was an issue / workaround reported against a selected set of those.

In this case you can send a fix for 10nm separately, but please post a 
fix for that platform too.

> 
> Or merge this code without this patch if a fix for reading PLL as zero
> anyhow is questionable for you.

I think I've asked it at some point, to split the generic code parts and 
the DSI enablement into two different patch series, so that they could 
be picked up separately.

No, the fix is not questionable. The patch causes questions though.



> 
> Best regards,
> Krzysztof


-- 
With best wishes
Dmitry

