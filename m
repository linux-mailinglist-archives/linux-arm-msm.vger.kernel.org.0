Return-Path: <linux-arm-msm+bounces-86538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C39DECDBD9E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:45:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D461B3029235
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 09:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BCB4330311;
	Wed, 24 Dec 2025 09:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SU3UnNA7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZaPTLQAh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874FE329E62
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766569505; cv=none; b=p2G/bU1+bQaez4HUCskl+clxjHrWoD6cDPCAptttluTe1aMPscSFsOXAZnYFimG3AmAANXybu73IHJ2DZA9fDFQHAAt3EpCyyVoObsh6rss9WpGKRJDQPxIVvsigDJHY7VHKIwMRTL/4AZdzbqTPQwM5W63O+y/C2S3qBEIhBa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766569505; c=relaxed/simple;
	bh=4wS058BPy2evYer1UvZVXUouRV5db+2SeCQIQtT8JkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WYPZ6lFx/PdTaLsepeAmkEi5/dRJk49Diwa1I07t2xW9aiRdcLzdJrC51x6v8uJtBgRjUOePN9GIWumnGeWVBXkc0V8TYEp+GlzQmBwUbhPhwUTiw1KmwTLsvFeoPZvqmdQQR8nNVi3RceZMBOL6zr2tVO2hJsbcsw4HKD7AM5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SU3UnNA7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZaPTLQAh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO3wcsI3797042
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fdlmSo8unzQ0LH7XfPtFoYw0bJxDfvGZywFK5n4l0+M=; b=SU3UnNA7PtbNEyV2
	rBnQfra8wbc1krjpEC6kR3gk/P6JW4PsrWOVAQd1wV5Gkq1ltqFtXy+JZ5ke8i1U
	4FZpy+RBqpanZXCpifIp7NpH/twbA9n+QjudbpSUBTyRpwzxiju/k2ZjpDkRzvz2
	6norx5qJb4BgGnou9kLg9uEt2l5SgitiP1e8YFr0we9/aDyAQRfmZPaXcBAJVxAK
	u2zb8Cy2m8QAa4XLZpdzs5fw9uxDsgx0+750QfVxIzAvn945er/2XTMUYbBSvVTb
	BdinJvtbd7fOgtN4ZsKeW2fBZ8fv3Qg+OqcSOgfIgNmpvVJzihxT49Irj2qdI3Bv
	44r5MA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b88r68td7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:45:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c93f0849dso5777961a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766569502; x=1767174302; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fdlmSo8unzQ0LH7XfPtFoYw0bJxDfvGZywFK5n4l0+M=;
        b=ZaPTLQAhvEr9uUXG58gqXn1VzXXSCEQ82cTCTUqgD1TwXaVAmJYoxlVolp/X9c/U9n
         JZeovxWdCIYtXMYvguDhl2/8Bgjnfk+AJ90nKXbWIShNaBIe0dLofO+8oFT5EWJgvaHU
         Pgc0QDifPR9U9iAH362K/L7LZBe5zElqcyLDxnd1AzrS5gV/c+hP83dn36OidhyFfB+w
         b1uAm83Zk3kpLeXZDHpcQG81NgZKqCOMsaEVBflaoEFWNbMXATxaGJVh27uUKMZwCxFp
         czvPSQ1+kYFPVsYd8CLoDJLyyIu8fqD4gRD794pNNBb4XLU/+DHFha77p/s/k/6cEu8i
         k0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766569502; x=1767174302;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fdlmSo8unzQ0LH7XfPtFoYw0bJxDfvGZywFK5n4l0+M=;
        b=L7wrQ+LbXqa84K0vcuKTZ7jTt7+uhbWtFKcOf1iAFiJHH+6JgUsZh2Bilj7D2q7b+8
         YggzLh1oxls4JeQE8nkUKT/ehehQhRIpdvve4lO8JKLko7SUegnVMr5Cu0mXUGuHKGkB
         cCaQ7DySXzI3WV8gzq+eL5Zmbx87tgUrGSyIlOGCVlFSqwIbNk1nmBRaxzbkFS/BtcUF
         HZhJ4sGaGIrm0F0Xl9weP4YBsdN8YiSYjdufpmXFPsgU9D3pi/VM176d3400YOt6ok66
         bnT4PnCWipGfifZyva+txn3qwrJqgDizk96/Ag9+xp/N5ZyXWR4C2/P7OkbN+pfcSywH
         H7Qw==
X-Forwarded-Encrypted: i=1; AJvYcCXJEElC1KQVLS77k0CrvoxZYOQobxTJeOSlovTe44huqm+Uy5wshJdQVenygKkGHgqEIu3VWEBtVNeKUBP8@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt5rRR1hIWJL8HJRbjgphPXLZRtMcSTkJvmpSWWsOEzM9RupYg
	df2GyOvixsGXB5oq5zimA9cWAXBuuLsTIWYa0kwC0xLULAGcA2rLNguqj5fJOQn0dgJsKJMopl1
	wVkUDELPTZmYwyvU76GyOX2I8SHOAdnHdITSyG7X0QLzPk67b1IHHIJlyqRIFvy1wDpIF
X-Gm-Gg: AY/fxX7Ng1DayBB8uMZn+jX7qseOd1uuk0Y6b8jTmhh2HjGUrA6APQZGtkWikbh5shQ
	HqTs3Cjq4wMH6INVJtPiVa3212knK0oN6jmKIILsG7plFMUUwwLO76TCCylypuooGLiekWk6cUg
	oIdjJRVAuPjS6iLiG/y6scOjn+ISSqpsMDrGKDNOKNbvrEfI4XCauc7qqKu1am5fydLjCMoVTNu
	0ClRj7L45Mi3GqOETGLhoMjzjAZGbKMFD5CEipa8FqziGrNPGrOT0idXc9QsD1gJjOd29Xufm7k
	V8IDLIvsmaSVJK+F5Kitxb8jAD392Bl+6jFHpDRY8b0iX+MI3E8jxKbtDOZNPHGvG6wJPi2P9xu
	YPreuXQP6BK38EtFZ4Or0KSqJefhOAaBTCrkZaysDf0sO52iw
X-Received: by 2002:a17:90a:d00c:b0:34a:c671:50df with SMTP id 98e67ed59e1d1-34e71e60b02mr17348555a91.17.1766569502004;
        Wed, 24 Dec 2025 01:45:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3nPYDDC7/QGW+BCIE7gGdiyOzbsAR09DDTyj+8eJmtq4GCEBciyxjvSH2c9jgbm2msvzrjQ==
X-Received: by 2002:a17:90a:d00c:b0:34a:c671:50df with SMTP id 98e67ed59e1d1-34e71e60b02mr17348526a91.17.1766569501460;
        Wed, 24 Dec 2025 01:45:01 -0800 (PST)
Received: from [10.151.36.141] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e92228b64sm15313488a91.10.2025.12.24.01.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Dec 2025 01:45:01 -0800 (PST)
Message-ID: <41616f5e-68a6-4354-8520-4321e747efc9@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 15:14:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] remoteproc: qcom_q6v5_wcss: support IPQ9574
To: "Alex G." <mr.nuke.me@gmail.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org
Cc: krzk+dt@kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20251219043425.888585-1-mr.nuke.me@gmail.com>
 <20251219043425.888585-6-mr.nuke.me@gmail.com>
 <a14e40b7-b70b-4658-9dee-7e5e6265ad5f@oss.qualcomm.com>
 <12223416.nUPlyArG6x@nukework.gtech>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <12223416.nUPlyArG6x@nukework.gtech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4CRReagJ5cJYAQ7AF2QB1bNgrJEtCeYu
X-Proofpoint-ORIG-GUID: 4CRReagJ5cJYAQ7AF2QB1bNgrJEtCeYu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA4MiBTYWx0ZWRfX5nOrwtQ62sSa
 Y7keTkxf3ew9I3EqHxY+XC+wRi9i43C0YyRsfk6aNQLdCkuNcRIfUNvkpeMAjOiM3i5I/edPQnD
 wxLLVAktKwJPyafEWPJBOhsuoQ5mU4YI4kTrlRIuCsVsquS5/lzjRB1N/OaE2PIpgc8zaq8Tp1v
 /FN5Z/n47UjJvu0GmzR0sm6NTtm0tj6Ej5Z2HTeMVJnXDm1vQWwqzvDA9cdUvpZ+iPyaEq7tXvO
 YBu/Zq8VT4WTDYboLc/Ra9GIEqFjArAdF7C4wcD1lIPU4445C4Lg8OKqJDEvNofTG6AL1aMdxrx
 mhwLt0gMXaSI4wmDzl2RlDHhoDOuwzi6VaxhWU8/ewLQhusrzlB30SCOjoj/YSpFrLKcZUJvmQG
 V70PI7uW5nTBMBwtuMlzNVylhMrUxacU0jypLlyWr4XrAQRwqEJEx7p041ooL0narzOZA6ucb4V
 +lHiipiw0u/N/979Ghw==
X-Authority-Analysis: v=2.4 cv=Qahrf8bv c=1 sm=1 tr=0 ts=694bb61e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=grDl-rbhXOFJrx4JUtAA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 lowpriorityscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240082



On 12/24/2025 1:51 AM, Alex G. wrote:
> On Friday, December 19, 2025 7:20:04 AM CST Konrad Dybcio wrote:
>> On 12/19/25 5:34 AM, Alexandru Gagniuc wrote:
>>> Q6 based firmware loading is also present on IPQ9574, when coupled
>>> with a wifi-6 device, such as QCN5024. Populate driver data for
>>> IPQ9574 with values from the downstream 5.4 kerrnel.
>>>
>>> Add the new sequences for the WCSS reset and stop. The downstream
>>> 5.4 kernel calls these "Q6V7", so keep the name. This is still worth
>>> using with the "q6v5" driver because all other parts of the driver
>>> can be seamlessly reused.
>>>
>>> The IPQ9574 uses two sets of clocks. the first, dubbed "q6_clocks"
>>> must be enabled before the Q6 is started by writing the Q6SS_RST_EVB
>>> register. The second set of clocks, "clks" should only be enabled
>>> after the Q6 is placed out of reset. Otherwise, the host CPU core that
>>> tries to start the remoteproc will hang.
>>>
>>> The downstream kernel had a funny comment, "Pray god and wait for
>>> reset to complete", which I decided to keep for entertainment value.
>>>
>>> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
>>> ---
>>
>> [...]
>>
>>> @@ -128,6 +137,12 @@ struct q6v5_wcss {
>>>
>>>  	struct clk *qdsp6ss_xo_cbcr;
>>>  	struct clk *qdsp6ss_core_gfmux;
>>>  	struct clk *lcc_bcr_sleep;
>>>
>>> +	struct clk_bulk_data *clks;
>>> +	/* clocks that must be started before the Q6 is booted */
>>> +	struct clk_bulk_data *q6_clks;
>>
>> "pre_boot_clks" or something along those lines?
> 
> I like "pre_boot_clocks".
> 
>> In general i'm not super stoked to see another platform where manual and
>> through-TZ bringup of remoteprocs is supposed to be supported in parallel..
>>
>> Are you sure your firmware doesn't allow you to just do a simple
>> qcom_scm_pas_auth_and_reset() like in the multipd series?
> 
> I am approaching this from the perspective of an aftermarket OS, like OpenWRT. 
> I don't know if the firmware will do the right thing. I can mitigate this for 
> OS-loaded firmware, like ath11k 16/m3 firmware, because I can test the driver 
> and firmware together. I can't do that for bootloader-loaded firmware, so I try 
> to depend on it as little as possible. I hope that native remoterproc loading 
> for IPQ9574 will be allowed.

Hi Alex,

Does this rproc start sequence work on IPQ9574 without using the 
qcom_scm_pas_auth_and_reset ?

Thanks,
Vignesh

> 
>>> +	int num_clks;
>>> +	int num_q6_clks;
>>> +
>>>
>>>  	struct regulator *cx_supply;
>>>  	struct qcom_sysmon *sysmon;
>>>
>>> @@ -236,6 +251,87 @@ static int q6v5_wcss_reset(struct q6v5_wcss *wcss)
>>>
>>>  	return 0;
>>>  
>>>  }
>>>
>>> +static int q6v7_wcss_reset(struct q6v5_wcss *wcss, struct rproc *rproc)
>>> +{
>>> +	int ret;
>>> +	u32 val;
>>> +
>>> +	/*1. Set TCSR GLOBAL CFG1*/
>>
>> Please add a space between the comment markers and the contents
>>
>>> +	ret = regmap_update_bits(wcss->halt_map,
>>> +				 wcss->halt_nc + 
> TCSR_GLOBAL_CFG1,
>>> +				 0xff00, 0x1100);
>>
>> GENMASK(15, 8), BIT(8) | BIT(12)
>  
> I find GENMASK() and or'ed BIT()s harder to read than plain hex constants. 
> Maybe we should use macros, but what should be the names of these two 
> constants?
> 
>>> +	if (ret) {
>>> +		dev_err(wcss->dev, "TCSE_GLOBAL_CFG1 failed\n");
>>
>> I don't think we should count on regmap to ever fail
> 
> I was following q6v5_wcss_start(), which also handles regmap failures. Do you 
> want me to ignore regmap return codes in the code that is added, at the cost 
> of some  inconsistency??
> 
>>> +		return ret;
>>> +	}
>>> +
>>> +	/* Enable Q6 clocks */
>>
>> Right, this naming gets even more confusing
> 
> I'll name it "pre_boot_clocks" and drop the comment in the interest of self-
> documenting code.
> 
>>> +	ret = clk_bulk_prepare_enable(wcss->num_q6_clks, wcss->q6_clks);
>>> +	if (ret) {
>>> +		dev_err(wcss->dev, "failed to enable clocks, err=%d\n", 
> ret);
>>> +		return ret;
>>> +	};
>>> +
>>> +	/* Write bootaddr to EVB so that Q6WCSS will jump there after 
> reset */
>>
>> That's what a boot address is generally for, no? ;)
> 
> I used the same comment from q6v5_wcss_start(). I will shorten the comment.
> 
>>> +	writel(rproc->bootaddr >> 4, wcss->reg_base + Q6SS_RST_EVB);
>>> +
>>> +	/*2. Deassert AON Reset */
>>> +	ret = reset_control_deassert(wcss->wcss_aon_reset);
>>> +	if (ret) {
>>> +		dev_err(wcss->dev, "wcss_aon_reset failed\n");
>>> +		clk_bulk_disable_unprepare(wcss->num_clks, wcss->clks);
>>> +		return ret;
>>> +	}
>>> +
>>> +	/*8. Set mpm configs*/
>>
>> "MPM"
>>
>> Why are the indices of your comments not in numerical order?
>  
> I started with the spaghetti sequence from the downstream kernel. I unravelled 
> it, and was so happy the code worked, that I forgot to check the numbering. 
> I'll remove the numbers, as they don't add much value..
> 
>>> +	/*set CFG[18:15]=1*/
>>> +	val = readl(wcss->rmb_base + SSCAON_CONFIG);
>>> +	val &= ~SSCAON_MASK;
>>> +	val |= SSCAON_BUS_EN;
>>> +	writel(val, wcss->rmb_base + SSCAON_CONFIG);
>>> +
>>> +	/*9. Wait for SSCAON_STATUS */
>>> +	ret = readl_poll_timeout(wcss->rmb_base + SSCAON_STATUS,
>>> +				 val, (val & 0xffff) == 0x10, 1000,
>>> +				 Q6SS_TIMEOUT_US * 1000);
>>> +	if (ret) {
>>> +		dev_err(wcss->dev, " Boot Error, SSCAON=0x%08X\n", 
> val);
>>> +		return ret;
>>
>> You left the clocks on in this path
> 
> Good catch! I will use "goto" centralized exiting to turn off resources on 
> failure.
> 
>>> +	}
>>> +
>>> +	/*3. BHS require xo cbcr to be enabled */
>>> +	val = readl(wcss->reg_base + Q6SS_XO_CBCR);
>>> +	val |= 0x1;
>>
>> That's BIT(0)
>>
>> In qcom_q6v5_mss.c you'll notice this is defined as Q6SS_CBCR_CLKEN
>>
>> If you dig a little deeper, you'll also notice a similar name in
>> drivers/clk/qcom/clk-branch.[ch].. I suppose they just reused the same
>> kind of HW on the remoteproc side
> 
> I'll use the macro name as suggested. Thank you!
> 
>>> +	writel(val, wcss->reg_base + Q6SS_XO_CBCR);
>>> +
>>> +	/*4. Enable core cbcr*/
>>> +	val = readl(wcss->reg_base + Q6SS_CORE_CBCR);
>>> +	val |= 0x1;
>>> +	writel(val, wcss->reg_base + Q6SS_CORE_CBCR);
>>> +
>>> +	/*5. Enable sleep cbcr*/
>>> +	val = readl(wcss->reg_base + Q6SS_SLEEP_CBCR);
>>> +	val |= 0x1;
>>> +	writel(val, wcss->reg_base + Q6SS_SLEEP_CBCR);
>>> +
>>> +	/*6. Boot core start */
>>> +	writel(0x1, wcss->reg_base + Q6SS_BOOT_CORE_START);
>>> +	writel(0x1, wcss->reg_base + Q6SS_BOOT_CMD);
>>> +
>>> +	/*7. Pray god and wait for reset to complete*/
>>
>> "ora et labora" - you've done your work, so I'd assume we can
>> expect success now
>>
>>> +	ret = readl_poll_timeout(wcss->reg_base + Q6SS_BOOT_STATUS, val,
>>> +				 (val & 0x01), 20000, 1000);
>>
>> The timeout is smaller than the retry delay value, this will only spin
>> once
>>
>> 0x01 is also BIT(0)
>>
>> But since you never check whether that timeout has actually been
>> reached, I assume you really stand by the comment!
>>
>> (you need this hunk):
>> if (ret) {
>> 	dev_err(wcss->dev, "WCSS boot timed out\n");
>> 	// cleanup
>> 	return -ETIMEDOUT;
>> }
> 
> Good catches! Yes, I definitely meant 20 millisecond timeout (not 1 ms). I will 
> also add the error checking.
> 
>>> +
>>> +	/* Enable non-Q6 clocks */
>>> +	ret = clk_bulk_prepare_enable(wcss->num_clks, wcss->clks);
>>> +	if (ret) {
>>> +		dev_err(wcss->dev, "failed to enable clocks, err=%d\n", 
> ret);
>>
>> the previous set of clocks will be left enabled in this case too
>>
>>> +		return ret;
>>> +	};
>>> +
>>> +	return 0;
>>
>> If you return ret here, you can drop the return in the above scope
> 
> This part will get changed a bit by the centralized exiting. It will be a 
> "goto" (on error) followed by "return 0" (on success).
> 
>>> +}
>>> +
>>>
>>>  static int q6v5_wcss_start(struct rproc *rproc)
>>>  {
>>>  
>>>  	struct q6v5_wcss *wcss = rproc->priv;
>>>
>>> @@ -270,10 +366,20 @@ static int q6v5_wcss_start(struct rproc *rproc)
>>>
>>>  	if (ret)
>>>  	
>>>  		goto wcss_q6_reset;
>>>
>>> -	/* Write bootaddr to EVB so that Q6WCSS will jump there after 
> reset */
>>> -	writel(rproc->bootaddr >> 4, wcss->reg_base + Q6SS_RST_EVB);
>>> +	switch (wcss->version) {
>>> +	case WCSS_QCS404:
>>> +	case WCSS_IPQ8074:
>>> +		/* Write bootaddr to EVB so that Q6WCSS will jump there 
> after
>>> +		 * reset.
>>> +		 */
>>
>> /* foo */?
> 
> I was trying to keep it at 80 characters, but since I will shorten this 
> comment on the new code paths, I will shorten it here too.
> 
>> [...]
>>
>>> +static void q6v7_q6_powerdown(struct q6v5_wcss *wcss)
>>> +{
>>> +	uint32_t val;
>>
>> "u32"
> 
> Okay.
> 
>>> +
>>> +	q6v5_wcss_halt_axi_port(wcss, wcss->halt_map, wcss->halt_q6);
>>> +
>>> +	/* Disable Q6 Core clock -- we don't know what bit 0 means */
>>
>> I would assume clearing it muxes the clocksource to XO
>>
>> [...]
>>
>>> +static int ipq9574_init_clocks(struct q6v5_wcss *wcss)
>>> +{
>>> +	static const char *const q6_clks[] = {
>>> +		"anoc_wcss_axi_m", "q6_ahb", "q6_ahb_s", "q6_axim", 
> "q6ss_boot",
>>> +		"mem_noc_q6_axi", "sys_noc_wcss_ahb", "wcss_acmt", 
> "wcss_ecahb",
>>> +		"wcss_q6_tbu" };
>>> +	static const char *const clks[] = {
>>> +		"q6_axim2", "wcss_ahb_s", "wcss_axi_m" };
>>
>> static local variables that we point to? eeeeeeh
> 
> I wanted "const char *clks[]" originally. I changed it to this in order to 
> appease checkpatch. Should I use my original "const char * []" instead?
> 
> [...]
> 
> Alex
> 
> 
> 
> 


