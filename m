Return-Path: <linux-arm-msm+bounces-64025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C55DAFC9AC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 13:32:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9758D1BC4D2D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 11:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A7E2DC326;
	Tue,  8 Jul 2025 11:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gwwrNEEy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1DB2DAFCA
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 11:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751974308; cv=none; b=rHR18EjX5dqsjtORSP7uzRytrSEx2rsuV9HTOtXjpLlVbhu4Ig1twa9kmfL5NbtT1glHqrAtpglRgC9WpBFwiMN6UoKLOW6yGXd1SIdbIk1e7001nvls9QVe0i4Mwb56NkI7ewdG0PMKqW9dS8Sy5t6udeIGoASoTFG3HLsNbvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751974308; c=relaxed/simple;
	bh=P+pxE6WaqJCtlIPhTde25jg4Wk2SpGFNRRq9qAcfinM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qmr5UMRobHwpKM/JS9yuNeA6WjcHtwOLSdz7Xwe3SVkVoyCrJY4n1RzW72cSxogPGkL6ui5t1l4yol8d3My/ZUh5C/eobUk1y8bKXWlt96mSIAfXQomqMb2BM2hVJC0uvCPHIjFh2nxW+L8ULdTYBwec5JNnJpeGqJu8JzaDiaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gwwrNEEy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAOpZ030322
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 11:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tUm412BRbW/zHRuNnheSl3siSXwcdOp9rqnr499LK+U=; b=gwwrNEEydC/VFkSE
	C9qBwaEMdqlXYh4rJWV0wz/+oWpfv9sNEJXK9zzL0X4Hczchu7ChsdPyUZIUdR/W
	jcs4TMcTD/El9/mQrM6qtxA1/WeBEy+TWFBdf0/ghZ+SEzBkfojs/sB6MT1KKwy0
	JatNFxdvM5HNWmhD188G0QK1d0/KkpPRWA5+rvZAPrQWLvZ4KxuOviRze5OsYhdO
	aySsDEJYrWiEnxkc3jp4Qp4b85kkLURUgwdXyeG1qx/uFPJYRsicHT2/8vlx/bRu
	FXKNoDjMpYYYPCaoZh54WoO48OV4YBZSxt4QjZmvaY+YjeBCYfxiHZ3rJ/HMa3dv
	knAAxQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b0ta8w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 11:31:46 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6facde431b2so14992696d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 04:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751974302; x=1752579102;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tUm412BRbW/zHRuNnheSl3siSXwcdOp9rqnr499LK+U=;
        b=QgdNbvWvIQn20zkBoIYvtVWPP9R6ytdJm2NCwPJPFzOAXAcZIA2LjME5uT6KWVIJ9i
         ZByEz1e3AKEPipawJieWmxtwlY2KpWgFzpvJpIdQQ3LrZ3EMoBvl+DRXpNlQ7UZuwb2e
         i6vSLSQBfUu4r1hHu/O10rB05xjd+hvHRfM+wJR9q6yJ8bTI801EmVK8tJz7Jqry8Jyn
         IMBr1bZfpGKs5yQMOqyGaNhOjOEfvygwWL/x585K3nA+6IvJXfQ5WO2ax0G7U8jA6RoY
         /RDGy+M13M9F5i96Q3u31CLqHroYceAsRgxuT0auUJkr0Ek6XjY4wq5d5nVZbyVHDKc3
         tyOg==
X-Forwarded-Encrypted: i=1; AJvYcCVdQEvBvKi4fgI7qAB2cJOCdM2eTNaRkFPtEC4dqGDmMljOthsE5DMmUm5FcK9iSdZtVQlqiEg5FXIxkhes@vger.kernel.org
X-Gm-Message-State: AOJu0YxM+i2M2SWyR+GIs6IPUgUjfLxE0MjuFiB1gbGEvbpwrRvLexFq
	BSaBboeHIw5T/b18NdslQsZ7+XdRULsoEX8ji/MX4z2CFt+mahXrDGbtma8/xBzrEUjtS/YgD64
	w6VmauVwmMK1jZTG1amm3sMNn7yeoV2J6s2H2OSse9uczF8KSi7cqrINA2aVrpdTPMLFs
X-Gm-Gg: ASbGncsYL2StRjIcup7lw8IfDINBVDdg6DSp5tNQQKRrLljx23LQuoVS1182qS5BV8S
	IHS0Bz0tI+orJudyvlepGGqDFWRSz3nCa55torYlv4qNJuMUhYQzLABHa52PcVch7z34MdKM5My
	tFf5IaJcFFRLwYmPI7w2d2U/876NODjDORVSuowBGo7Gzz0tzLA5aoHMzJ2VqnyUMR5m7sazclU
	6DnyGrXbemcaNxQiiL0EYPOvmrF6t0e7AOOAklFTmrXRiB9bUtqei8naC0aHLWJWszoJbXbNXCj
	ysvIuXoXqfnFUVb+EKUkQhn+72DnLA2E3Yr2kgWlnf+EBkKqWXAFbDYXFzYTVcmiG7lhUeAuBVT
	xI5M=
X-Received: by 2002:a05:622a:34b:b0:4a9:8e6a:92c3 with SMTP id d75a77b69052e-4a9bd3c3284mr46378571cf.11.1751974301890;
        Tue, 08 Jul 2025 04:31:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXS7HsMKzGHLe7mgZx4hB+HHWETmL2VAFfFIACPNdmtmlGbyoflOmhdiXYt3hmPsI2vMpoEg==
X-Received: by 2002:a05:622a:34b:b0:4a9:8e6a:92c3 with SMTP id d75a77b69052e-4a9bd3c3284mr46378351cf.11.1751974301243;
        Tue, 08 Jul 2025 04:31:41 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b600ddsm877212066b.158.2025.07.08.04.31.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 04:31:40 -0700 (PDT)
Message-ID: <97074fed-7b63-47fe-90be-4161a4c7a297@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 13:31:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] interconnect: qcom: Add SM7635 interconnect provider
 driver
To: Luca Weiss <luca.weiss@fairphone.com>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250625-sm7635-icc-v1-0-8b49200416b0@fairphone.com>
 <20250625-sm7635-icc-v1-2-8b49200416b0@fairphone.com>
 <3f8bcecb-4c5e-48b1-98be-96f3c0c8329e@oss.qualcomm.com>
 <DB6LPBOU5TDL.13B4A6U4NQQZQ@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DB6LPBOU5TDL.13B4A6U4NQQZQ@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=686d01a2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=qFGWVYr3AIIjfRM7rNMA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA5NSBTYWx0ZWRfX1TOWySMhCylN
 wzjckfPq2mbdX/arrJNy3+JZPmaGJqdJpINPEGwcnkOhlmOsepWvCUeYiVKACh2nxNpbLOqbNrL
 hgHd9w4eVAG04ip3s1Yemjr6tGN40jqG2R9zssHP8hMhBFZTe1W13I3mzFrO/oLJrIeMw428YA2
 bbl9OgYly4fd8PmH09sqkSTeM2c+UD/DV5STOyj6fVBwtxDLbSrVrCoudYPDBB41Wo0xPH1z61u
 E9z+uOx+qCr6t6h0NamQB825rWHrfO4iXd+C/qnc6S15WxgeCKOTCBtJ2StCLiEV3nNS16G2/9m
 1cor3FDkPjOzgoqUofrIv1S+E/EBqmMpL4Ej+PXaQmK470smTUdXZMxq8NY2koucAwzFpaefGwi
 mafyIL2fqbUwLOakl5dqT55cmPvzY+boHpcGNddVd9GbHaWEnORCTAuaySMBPrEKqnS4K8Md
X-Proofpoint-GUID: pDZ4pZCqg3wzyUqAPxGYUfa_o0x6JhhA
X-Proofpoint-ORIG-GUID: pDZ4pZCqg3wzyUqAPxGYUfa_o0x6JhhA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080095

On 7/8/25 12:28 PM, Luca Weiss wrote:
> Hi Konrad,
> 
> On Fri Jun 27, 2025 at 2:48 PM CEST, Konrad Dybcio wrote:
>> On 6/25/25 11:13 AM, Luca Weiss wrote:
>>> Add driver for the Qualcomm interconnect buses found in SM7635 based
>>> platforms. The topology consists of several NoCs that are controlled by
>>> a remote processor that collects the aggregated bandwidth for each
>>> master-slave pairs.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>
>> [...]
>>
>>> +static const struct of_device_id qnoc_of_match[] = {
>>> +	{ .compatible = "qcom,sm7635-aggre1-noc",
>>> +	  .data = &sm7635_aggre1_noc},
>>> +	{ .compatible = "qcom,sm7635-aggre2-noc",
>>> +	  .data = &sm7635_aggre2_noc},
>>> +	{ .compatible = "qcom,sm7635-clk-virt",
>>> +	  .data = &sm7635_clk_virt},
>>> +	{ .compatible = "qcom,sm7635-cnoc-cfg",
>>> +	  .data = &sm7635_cnoc_cfg},
>>> +	{ .compatible = "qcom,sm7635-cnoc-main",
>>> +	  .data = &sm7635_cnoc_main},
>>> +	{ .compatible = "qcom,sm7635-gem-noc",
>>> +	  .data = &sm7635_gem_noc},
>>> +	{ .compatible = "qcom,sm7635-lpass-ag-noc",
>>> +	  .data = &sm7635_lpass_ag_noc},
>>> +	{ .compatible = "qcom,sm7635-mc-virt",
>>> +	  .data = &sm7635_mc_virt},
>>> +	{ .compatible = "qcom,sm7635-mmss-noc",
>>> +	  .data = &sm7635_mmss_noc},
>>> +	{ .compatible = "qcom,sm7635-nsp-noc",
>>> +	  .data = &sm7635_nsp_noc},
>>> +	{ .compatible = "qcom,sm7635-pcie-anoc",
>>> +	  .data = &sm7635_pcie_anoc},
>>> +	{ .compatible = "qcom,sm7635-system-noc",
>>> +	  .data = &sm7635_system_noc},
>>
>> One line per entry, please
>>
>> In addition to what Dmitry asked for, please also look into porting
>> QoS settings - those will require additional clock references in the ICC
>> nodes and as such, the bindings will be altered (which we'd prefer to get
>> right from the getgo).
> 
> I've forgotten to do this for v2, which I've just sent.
> 
> But we already have the clock references in the bindings, so the
> bindings should be final, also when QoS is added, so just a driver patch
> then.
> 
> I will put this on my todo list for a future patch to enable this, if
> that's fine with you.

Well I'd rather see that be done from the get-go, just in case there's any
surprises (e.g. downstream may not describe all the necessary clocks, as
some were enabled by luck or so).. that bit me in the past on some other
platform

Konrad

