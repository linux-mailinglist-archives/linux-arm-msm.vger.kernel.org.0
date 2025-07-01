Return-Path: <linux-arm-msm+bounces-63239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F713AEFDFD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 17:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F01A618877A6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 15:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3230926FDA4;
	Tue,  1 Jul 2025 15:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EOlQilcL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08D523504D
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 15:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751383166; cv=none; b=Rp0eYRfeR1F6GWPHwijB6GA00q7bxrbqhI5B9//RkjLB5aulpiMmr7JP/aLDeNxyMa0r2XygA0IYpBgbs3Yu2RGYtxsRf3+3LL8fLhy50BhVGGudTq9SGRxqdL7Tskk58UowPqzAb7fWVKfeNEw6gu8fYUfCMh0AnKxNumZ5JIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751383166; c=relaxed/simple;
	bh=t97TyzkipZFoGjqd9kPhcCuknyC/oH3E7SMZc9QKQZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CEy0D/2UbTYUSZUp4GX2uRJOBIihuyVOscJSoHsQjFVSRjC2+nu4ri+BZ5LLl0bM6ID6C3m7E1QyXSIMMWvV4fuf1HJvf5p7eydL+bi9UbxF0MR0VK4U4HT4CtClBb01BHgCQ52SBLHlz2p1KnvBnVaHnK1syUoH7gd8gMyX4WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EOlQilcL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619pS7Q028440
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Jul 2025 15:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cpr6mXrXqDKBVG3OQMvCgpkcRwa8yNEUsy9+Tt8IbAk=; b=EOlQilcL+QTJVHsK
	ZvO2fhkuUGlUAm9iDjBT6cp7XWiVkXb8X23LHTWc3sPYwKA/aiujbYP30rmKEQEn
	y+bApBXD1XW6f8S6/IQEQhZ0ZyttH1/DV4W2dePKT8txVqXlZMYr3f6Zkv+aVe6+
	HtaZkmaTyYqjiUn9Kb80X9FKSbV5vVqxdufnOcVTdSei9g13YWgqIHpBDXRgbEZr
	mc4oKVKsBDmWpPQ8KSUWzFUYurpaLErYCj5ZyxmnVCGTyVCmADXYCR/lqNYN9c7N
	adxDIoGUhfJ0qoZVNcbYYsWGb/hTBihELp5kJJ51H1+gQO58u4HIuvpiLNVhqwnj
	SF/lgg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvsbgd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 15:19:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d094e04aa4so174760685a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 08:19:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751383162; x=1751987962;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cpr6mXrXqDKBVG3OQMvCgpkcRwa8yNEUsy9+Tt8IbAk=;
        b=H+WSwxP9cFLdEUrc6mpJs++rD5HOrXuaRYigLpahAkecrPlke7gayhZRcWkTQAV7aE
         lWhOfoQJMgY+/4EZgD1wPGT4dCCHFRIwqVtHzEab/+YlsXprkG++tNQer+GaObZCMCOC
         HKrZQPXx5MvJZTX3qT/T91GZk3zcSsgimayCSk90r591des7o0e01rlzhIEMsXPzDH0d
         7af5hK/2tf0Nlqze4P6gBSYSfJm/OkEHQ4Vci0zDzmrPwZCuIm/IDbk+21rbLSEw7N+O
         OheLzKzBVg/X6z2eZh0FyivpDOSKI/xRkk5eRWVnYvrHzSroC8b7VZhNxoMSZMB2iiya
         utpw==
X-Forwarded-Encrypted: i=1; AJvYcCX57Ah7rHm21HbPW41aUMOs01ESJ9baoO2dCVXtycwWnk3jxcGoES3yO/DgoWEyoENBlHRIaHdYmgONuc0R@vger.kernel.org
X-Gm-Message-State: AOJu0YxSCjBX85eectdwj0mGlTbehZb6rcvAn/VNY3DZnwzZiZ67j5dJ
	IO3Hi14INEfKhbChSyLqgKrziYESYXWIQy7rgY2v6ruhMyBUEzR5K6sSuFkZRY/k+U8PQV5wJl3
	Jn14nD0CwXeUpeno5fbHZFvKiVSWUxqVCBHYjTDNYJBZiQwPUx52DyFj/to5DHx51Lrbo
X-Gm-Gg: ASbGncttyuRwlcYaLJjIk2XI1NGMeXtR2cZ7gItdYmcz58H/0c5hCm60pjfsbhlJB3u
	8bqUo/5qA8jA59fcGdcx1j+xRJVhOMnmNeX8zqsU4Y8QCrrxFMaRNSQ4PgoN3/CXl6BLemSkBd3
	4w2WK20t4j7nHr471aXRqbfQmJ3IK41DdzZFzk3MfrtVJ/PmEn3+yWT/v2yVROxhIWwmQPBn2ui
	1hhdGPl7ly4/Pq7Q1mDfW422CO9yhI8K4qYlwb92r8eWZWBWK0CAx/j5HxDKhStYM0IXMwYJ/q5
	yR2K2SGpKziZmJhaa28sEnB/Cua0OGO1JSMmtvjMW0/HlmlelFnDqWnRIMFMplbQQofYOpnlfI1
	B5La03Qhw
X-Received: by 2002:a05:620a:29cf:b0:7d4:4a59:6e8f with SMTP id af79cd13be357-7d4677a1ef6mr168638285a.15.1751383161704;
        Tue, 01 Jul 2025 08:19:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVw9OkK18UsYMXtCQz0xp70vLQZThgvbIEpJsS6vmdbEaZ6WCWXVX9kJTqVkQwMWBZ3Tk8Fw==
X-Received: by 2002:a05:620a:29cf:b0:7d4:4a59:6e8f with SMTP id af79cd13be357-7d4677a1ef6mr168635985a.15.1751383160972;
        Tue, 01 Jul 2025 08:19:20 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353ca20f3sm903250666b.175.2025.07.01.08.19.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 08:19:20 -0700 (PDT)
Message-ID: <24e4241e-d8a1-41c7-b0f3-3ec01b4375ae@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 17:19:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] Add clock drivers for SM7635
To: Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250625-sm7635-clocks-v1-0-ca3120e3a80e@fairphone.com>
 <68056b4a-b1c3-401f-8720-8e0c3cda6249@oss.qualcomm.com>
 <DAXEWQ93VELV.3HJXPNWASYBT7@fairphone.com>
 <DAZPKV5DQ1EK.2D4TQE5MIH4K9@fairphone.com>
 <w4eujq72uqflqpsqshc7zhu6lkc7owufep2g2rjacvzgj44vmf@auonp4ugbgow>
 <DB0RG4PFFP4A.1BAZWWZU2TWJF@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DB0RG4PFFP4A.1BAZWWZU2TWJF@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Aw44oP1fmUQNqQQboTr3h3GfRtahvLul
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=6863fc7b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8
 a=IgS4KiuvraTEoa23li4A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: Aw44oP1fmUQNqQQboTr3h3GfRtahvLul
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEwMiBTYWx0ZWRfXzO2C66kh9e0T
 HELFC/GbJo7SPYK/hu3zQgRrjoPksXNVy5ev211hJ2RYlXgP7cc8OS4vT6DIDjznbEOazpUnYCU
 Ih0TZc4DgmlWoEvSH0Nm4OHN638eaejzXNX2lvuujj6gujZmfk8GidbrBqVDEwzvQuBK2LrpYx+
 eoCYB5+NUz4jff9BkBBbAzZik6JCZvQtnn/7pxvrGsw7yiz2AytRWPfQrq+iRYBtV6Y7Qv1BctJ
 ZGu4ZtRCwY38hb7YOFJI9NUqf6z8xsd/jHWFWC7AbU5Gr6f48cNGsWuv07JDk7U0ox2HitKpaJC
 MhOuYuflPId9/v9IFk/Zg9EaGwyhLRTFcIJAhIMlKX2fSgYt4Qo9SceEhjpfWd3oOW/LKN6GQLE
 HWobIaNLOqKms3WrPZss1+DOfXsgXLF5WZRXfhWAlqcAS2qXtNcK8NSsVpnfKs6QIBPj6wik
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=813 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010102



On 01-Jul-25 15:42, Luca Weiss wrote:
> On Tue Jul 1, 2025 at 1:16 PM CEST, Dmitry Baryshkov wrote:
>> On Mon, Jun 30, 2025 at 10:01:35AM +0200, Luca Weiss wrote:
>>> Hi Konrad,
>>>
>>> On Fri Jun 27, 2025 at 5:14 PM CEST, Luca Weiss wrote:
>>>> On Fri Jun 27, 2025 at 5:10 PM CEST, Konrad Dybcio wrote:
>>>>> On 6/25/25 11:12 AM, Luca Weiss wrote:
>>>>>> Document and add the clock drivers for GCC, CAMCC, DISPCC, GPUCC and
>>>>>> VIDEOCC on the SM7635 SoC.
>>>>>>
>>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>>> ---
>>>>>> Luca Weiss (10):
>>>>>>       dt-bindings: clock: qcom: document the SM7635 Global Clock Controller
>>>>>>       clk: qcom: Add Global Clock controller (GCC) driver for SM7635
>>>>>>       dt-bindings: clock: qcom: document the SM7635 Camera Clock Controller
>>>>>>       clk: qcom: Add Camera Clock controller (CAMCC) driver for SM7635
>>>>>>       dt-bindings: clock: qcom: document the SM7635 Display Clock Controller
>>>>>>       clk: qcom: Add Display Clock controller (DISPCC) driver for SM7635
>>>>>>       dt-bindings: clock: qcom: document the SM7635 GPU Clock Controller
>>>>>>       clk: qcom: Add Graphics Clock controller (GPUCC) driver for SM7635
>>>>>>       dt-bindings: clock: qcom: document the SM7635 Video Clock Controller
>>>>>>       clk: qcom: Add Video Clock controller (VIDEOCC) driver for SM7635
>>>>>
>>>>> We had a massive yak shaving patchset go in this season, please move
>>>>> the magic settings in .probe to qcom_cc_driver_data {}
>>>>
>>>> Okay cool, I found them
>>>> https://lore.kernel.org/linux-arm-msm/174970084192.547582.612305407582982706.b4-ty@kernel.org/
>>>
>>> For camcc, gpucc and videocc it seems quite simple to follow these
>>> changes.
>>>
>>> For dispcc I don't know what to do with this line.
>>>
>>> 	/* Enable clock gating for MDP clocks */
>>> 	regmap_update_bits(regmap, DISP_CC_MISC_CMD, 0x10, 0x10);
>>
>> Use clk_regs_configure() callback to set this bit.
> 
> Got it, found an example on the lists.
> 
>>
>>>
>>> Do I just keep the regmap references in this probe function and just
>>> move the clk_lucid_ole_pll_configure & qcom_branch_set_clk_en to the
>>> config struct?
>>>
>>> And similar for gcc, I can move the qcom_branch_set_clk_en calls there
>>> but the qcom_cc_register_rcg_dfs needs to be kept.
>>
>> Would you mind extnding struct qcom_cc_desc with args to call
>> qcom_cc_register_rcg_dfs() and call it from qcom_cc_really_probe()?
> 
> Something like this? Not quite sure when (in what order) this should be
> called, is that place fine?
> 
> I'd include a patch then in the v2 of this series.
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index b3838d885db2..d53f290c6121 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -390,6 +390,14 @@ int qcom_cc_really_probe(struct device *dev,
>  			goto put_rpm;
>  	}
>  
> +	if (desc->dfs_rcgs && desc->num_dfs_rcgs) {
> +		ret = qcom_cc_register_rcg_dfs(regmap,
> +					       desc->dfs_rcgs,
> +					       desc->num_dfs_rcgs);
> +		if (ret)
> +			goto put_rpm;
> +	}

These were previously registered a bit earlier, but this should
be good as well

Konrad

