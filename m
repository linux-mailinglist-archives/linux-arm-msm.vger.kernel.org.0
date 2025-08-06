Return-Path: <linux-arm-msm+bounces-67828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9136DB1BE92
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 04:04:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFC41165FAB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 02:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65F28A93D;
	Wed,  6 Aug 2025 02:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BVhk0sxl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF5043AA1
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 02:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754445889; cv=none; b=DhehogHw0iMVd6+kTHZAsGe7SxWjJ7P4wtCc4C9hnsAMLhQMgXo1vjsTCNVoQF2qjPoXwDJX/Byxc/Xr6umfFJmaWc8c4EVPe2TOVSZGSGrw2G6NkQUBbFG+eTHCv9nATkkw+UAAHeY0Z1v/jpYuaNiMxhQut2yjo/1MsW9DH/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754445889; c=relaxed/simple;
	bh=0cJicQ091J9OjMWSKDQJTGpw8UIKWd/RWbHq1EwTwPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U2GGP0wc7MLgyIuYyySUy6FiFgUT/FTjqLV6znDDHj31Y9VJTPSXNFpuPbvDH/TOag69bdEJe73yFBdZepsgiznKi685neDH7SqJsIPMAWUeOdrC+lXRG0cGz0+YFwK9feuO2AWpO9rni353oKNAorMJnN8UR/ag4wOi/sbmnd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BVhk0sxl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5761fGts024249
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 Aug 2025 02:04:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yXGg1mUHTujtbt8jVsUDVGPI6WRp9uB3EeCifdpRU6U=; b=BVhk0sxldBZH73/d
	C/y8O1w+pWkzETua99lW4xgP2j9hWJmg5HaR+NoCBlhYMZPYCTW/vuJiUjDcNx7n
	eHpkDV9wjJHHFVTMp7k8/0a2e8wExoGG8v/G6ZXFcjTLj0jp8TWUOkj54sGwWkJ8
	5CNaAM25V3aGE0xpceyiiL99vphyvpIJwin5sUMpowIQSSFnxxW67+nNUUvHD99O
	V2x3YeuUyGK4f4lG3C9XZRARtNBNgHNjnzzUUKaWVUFMuJJKb+T+3aB5kK5dgBOy
	UX5FUJs1mFoJFh9hLS5MU+nF4qvN+eYVisSQtMigocb7x6KCBKOMTXSvPmhQ1aG4
	jFvc2Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpya91xt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 02:04:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76c19d1e510so1580508b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 19:04:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754445886; x=1755050686;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yXGg1mUHTujtbt8jVsUDVGPI6WRp9uB3EeCifdpRU6U=;
        b=jtMWufKBiwEHQxxlfMles1lAzIZOKHPSsMYGuJCaRe3cYEZZtgIWTdqHNlJNRzxSGA
         p17YTMpcj7qTtIh6lxhmkVfiC6d7j75aZEdl5gCbk2kNOz9Pnhz3KO64RtJLX6cWR4BC
         2A5QESqIBOIGCKaZnbYW7LpyGGIn2BzA4DhddmfUyOmXYP1//Tb2AEvpY2NmlMpQRxwK
         bqjuMuRNWTZNsVFDdcSb9qPen20Px36hWHj5JFX9f1XHzv3mWiidvWb3oG+IeQszYd4n
         8C0C2RS+np6ZFDK5Fj7qVEI/IY0q3CSnrkVofWBbTxAq+ncMbCuEm8tE07FPA3MmPFpY
         8FEA==
X-Gm-Message-State: AOJu0YxpytV4yyX5/GY62bQeyqUSZm8SwZu9KHsMW+2wdenjlOdCM4/d
	/8fADKeRRg9maQkTsxi8Ux2bNULbiyym6QrBQNYpWZvcOCaOc+gYFXPHJzDsOUh5MN/5f/APjal
	IPnQ6mE9onf/bnJTFw9Wf5WfL2LSBs6dFlCEg+KHAf1Pb3dPYoMIa+VVPL2aq4G5XSq0e
X-Gm-Gg: ASbGncvfTjSfnDjTxrkUOFnatkKzJXz9Xh4yXCM2cxWbKJAoCpUemSEUVyfACUkneEL
	mXOlzmw5UJlmmdgi66M6zbrbzLWLB0E0n8SPN588kdUi4HOLghnNPPe2u2sF/HgkTxzGRJsmhgW
	rX8saqdnEZOsWKnMHuVJucwjIt/2bm6qt2W9uR7dEm2ZRpk8orvFRN/OyxRCCZHl6REM6acqerz
	26ayBr9gyNV+PsraRkNhrAbIvxkB1YdZ1tPpg34U0gfKIqIvl7LZ2/E17dTE+ccv57Mu78aZEtz
	VRb5qV0ApiEg8ZE8wtYmMPfJ74Zmz0HCP7dsqHBy44Jj1WkHpDJ/+BmyKMqChe8G0vBkCkH0l5F
	Vu/Xgk2askN9kT/xHXt4QkYh3KGd1HHA=
X-Received: by 2002:a05:6a00:2e94:b0:74c:3547:7f0c with SMTP id d2e1a72fcca58-76c2a2813bbmr1482708b3a.3.1754445886535;
        Tue, 05 Aug 2025 19:04:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqDV5H8Jprm7TFGMMrpbU5LGfL2JFi875JtBI0da+l/0ajF1L/WkClXKDwmz9eIB2FWpjkoQ==
X-Received: by 2002:a05:6a00:2e94:b0:74c:3547:7f0c with SMTP id d2e1a72fcca58-76c2a2813bbmr1482674b3a.3.1754445886088;
        Tue, 05 Aug 2025 19:04:46 -0700 (PDT)
Received: from [10.249.10.160] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfbd174sm14118221b3a.63.2025.08.05.19.04.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 19:04:45 -0700 (PDT)
Message-ID: <784d4807-9137-4160-a8f4-832831b5f751@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 10:04:40 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] arm64: dts: qcom: Add display support for QCS615
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Li Liu <quic_lliu6@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>
References: <20250718-add-display-support-for-qcs615-platform-v5-0-8579788ea195@oss.qualcomm.com>
 <20250718-add-display-support-for-qcs615-platform-v5-1-8579788ea195@oss.qualcomm.com>
 <1f6fc7ce-5826-4f59-89d7-ac691a3ae785@oss.qualcomm.com>
 <7e4d9dfe-428f-4374-9be7-97123cf36e5a@oss.qualcomm.com>
 <c93ab714-93e0-4b4b-b059-c48d4c689c1d@oss.qualcomm.com>
Content-Language: en-US
From: Fange Zhang <fange.zhang@oss.qualcomm.com>
In-Reply-To: <c93ab714-93e0-4b4b-b059-c48d4c689c1d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lWcxJtesRmC45Bb3URXuQerdcSvAtRVw
X-Authority-Analysis: v=2.4 cv=MrlS63ae c=1 sm=1 tr=0 ts=6892b83f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=uzlMTK-j72Ye4Gqdn10A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX7w+EwlT0GfIG
 S59dKk4tKf9xVl+jilLkK0ZzcE0kl+Qmi6TTff+Y+lmbcOZiQy6hkVIPzYVIpGIce6+yH4ll+Ec
 nZhWOLDrER8eHRAdsQI6KC6vqYfEU3kGGPLRutrR1UwvSrHUTWBxogcdY7T+OXSB6E1lSsHjas1
 eHZNUPWybPGoFoYEE+wBrb29HhxSeRaGb6HvbeJwsbFHahnVzPku8nn6eQmtm0vqWVTsndhJf6k
 /qVwSTKSK7+YvzeupP9H+lqbiqtJeKBNghiNvjA45DTHRSZdUccpPWc7IMwY3m+ByaMxsl71jKi
 O/DoE6W5QdWfRcr4nYl9oFlbKCW9oWMSsqmwgoD4+KA4qnQDF1HEuUxbkGmGSnGlnm0J/HK5OOj
 I6ZNp66V
X-Proofpoint-GUID: lWcxJtesRmC45Bb3URXuQerdcSvAtRVw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009



On 8/5/2025 8:26 PM, Konrad Dybcio wrote:
> On 8/5/25 2:24 PM, Fange Zhang wrote:
>>
>>
>> On 7/29/2025 7:17 PM, Konrad Dybcio wrote:
>>> On 7/18/25 2:56 PM, Fange Zhang wrote:
>>>> From: Li Liu <quic_lliu6@quicinc.com>
>>>>
>>>> Add display MDSS and DSI configuration for QCS615 platform.
>>>> QCS615 has a DP port, and DP support will be added in a later patch.
>>>>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
>>>> Signed-off-by: Fange Zhang <fange.zhang@oss.qualcomm.com>
>>>> ---
>>>
>>> [...]
>>>
>>>> +
>>>> +            mdss_mdp: display-controller@ae01000 {
>>>> +                compatible = "qcom,sm6150-dpu";
>>>> +                reg = <0x0 0x0ae01000 0x0 0x8f000>,
>>>> +                      <0x0 0x0aeb0000 0x0 0x2008>;
>>>> +                reg-names = "mdp", "vbif";
>>>> +
>>>> +                clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>>>> +                     <&gcc GCC_DISP_HF_AXI_CLK>,
>>>> +                     <&dispcc DISP_CC_MDSS_MDP_CLK>,
>>>> +                     <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
>>>> +                clock-names = "iface", "bus", "core", "vsync";
>>>
>>> 1 per line please, everywhere> +
>> Got it will fix it in next patch>> +                assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
>>>> +                assigned-clock-rates = <19200000>;
>>>
>>> Is this necessary?
>> test pass without this, so will remove them in next patch>
> 
> You need to leave a \n before you start typing your reply, otherwise
> the email text gets messed up (like above)

Got it, sorry for the mess>
> Konrad


