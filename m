Return-Path: <linux-arm-msm+bounces-80074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E59ADC2ADE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 10:53:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2496818926CE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 09:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 848F82F9DBB;
	Mon,  3 Nov 2025 09:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gqvSiMFj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WqT89aiv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07002F9DAB
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 09:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762163617; cv=none; b=MEgmCCyo1PU3f5pUjF3kZDdDUftGhbubp0qDyGQSKV5UxY2tGAQ2xxfhZplM9lQQdwqrowkyY3/NKT6WRABUu2ENWGxynp81Kv5F04500djjjhqV4+w3+0qVGbDrr3twAAfovAEy6ggz3+4VvrS3rQZ7mSs7QBKW7O8sHjBjm5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762163617; c=relaxed/simple;
	bh=QiXdWdOFVk0UNI+iS1e9rGTlkwTDKfuhkBJCR/MtXbc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r2dPg1EHIdjZxWu55DoS0Ai0Pm80ZmmWazvrhTXuA2p4frEG8XV+Cy48tjuMX71kHSNZ4+HxUeqwzLt4R1EdEb4MMPlQY6sryJMwVgOTB3Qjc8ouiyWlqdvpigc9/VcowAACjg9IOLm5u+lrOShXharcu9BLc+qPShwD6axyIcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gqvSiMFj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WqT89aiv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A38ol7a2730309
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 09:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e+bc/kwQmC9Ufu0+zVgimIzCzDDf4tsUyHk/1mPjqqQ=; b=gqvSiMFjzPi+MEqR
	cWaC/c5/xKp4Es4wGRrY7ozek7bhv8OVYwJxAazFq3RvouzCRcQBWcO8EgLg6+Vv
	p0U9C6Xg4J+Fvj64nzwV1MAGM2T32iZeKHI9De5VCCQOdbBLEKa5HcRoxkSbQ02m
	S0jp+EXV/KtdMSbe6VQiVuTMkm8TJa1mNHrakP/Z65ip3FdyMWCjoYyYx5pH1+6D
	qUpERfZX+qKSSdU1dHkE//kdqrdVBIbzAeg+cG5MEi8smSghVVAEuI/4AsnBGFYY
	hWvdeyp/8+mEOcGd5nJxZer3UpL2zOajDy2o8GWPD31cczZ2y+JWfu4mpnNlDBIP
	b8HfBQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6s86g66m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 09:53:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-295952a4dd6so13161075ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 01:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762163613; x=1762768413; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e+bc/kwQmC9Ufu0+zVgimIzCzDDf4tsUyHk/1mPjqqQ=;
        b=WqT89aiv8FveITrhNjE0zC1OxUMzkpkQkJi2Bsn7Socwj52wl+a8tD94Vb8cTaNeYs
         3p4oo8m7ElzworohRB+bEQUv5LcPVUpRD0NcBSsPx+VTNhHZTdtWfQXWzImlb5IbPu7n
         204kXq67JvN3AxPbE6jpz03jMJ9rX+0T4CSmKJMVzkwr2gO10uyUy86mbsu9Khffm/ci
         nCsVZCtfxwA47xp+cFcH3g+6L7+9qwrnZOKrJ3Z3DXx7Q5B5oK4/ZvnYXCxasLo/3FGd
         vkQQ6uRIYx1xxQo0cpDiyF0C2CgPdrVzbgIlfU6ySUqe0hKz0T5mIc0T22Zpvz/k2430
         5CIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762163613; x=1762768413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e+bc/kwQmC9Ufu0+zVgimIzCzDDf4tsUyHk/1mPjqqQ=;
        b=IJZMPDsH5lQxUYmRrxT7J8ZS/2j2NMLIT4IU375iKsX9tkeIPFChohUssesfYAEtmi
         okPAy9wGv1CaoHva5NMDS8s8/lDyFtgO7S2rP2a1qgTLF6yKAUlqE07bbcKRGTSsfD8q
         +cM3drLkqxt2g+W5IvWBJiEarx0YRpTjN/nmsGd7iphrlapz/6FHKmN49D2y+8jlAT2p
         sqfrN3Zb6hhQauxHe6YBXg2h4ungEErKcVBG5LC3BX1rWlwVB4zgwgubIkUQzlMlRorH
         mrQXgjGjx9aTJ/H5ADG/o5c+fQvJE1/6XLPk0BC7S/GYGJMJFwQgfG5wBBvIRO/EtZXB
         ocKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUj1Gnyszkz+LjFk3iNR4wEmTlf8v1TVRPwfYYfyjhHEaULt3lcDDs68Og/YqUmhl4f6EVFfJ6gjSaN3TXf@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqpeg/hSEmJeSbGcti9UsJ/9eg/FHoO2aG7KnzIbepMYUrCV93
	0sqfyC3SBRxDu/C9cUZQ+OjbfGIL6P6uW9CQZHsUaskV16fkxYZEEjr4mUK7d1vTdm2cE7vVB3M
	8jEjcajQlxegWn8FbmraHcZuEyaUs3xGUQimHey8O2L5mxrXOG06tThbdVqLeCtgj0Rh9
X-Gm-Gg: ASbGncsJqlIO7mE2R2DZntwI3DR4wDUwWNlv8mM3VkWEbXarpI/pRccOEePY33L9+6i
	QnvWGZ7gNxtylpVm8b1kF6/TFrk6Ft7aof79odThReBWLnGNI8gyB1hpNRUQFUGRvoPHr3D1O3Q
	sJiNeepnEYRHViFEtHtuADL07RDk8mKpTkZBTQEZo4tDvSiX4JcYrzEKnOMXI/tgHHMgLf0zAmu
	7GcyqZKf5yCiPbxVVFgvCjbUBpH+piZUiMEe2mO2E5fxrSjG6lc3MnJdvPDYiDshqbCnQGv0Z4h
	y6gOWQ7WrBoOwX0Cbu+OTAFFQ4TVeNQVj9x4Fw4GEBA0TeT3+94CVjwq7yYDFN92Znqznkrjb2D
	yHn+2Yw2gMJph7j6KGLpT0WajYBpux0FHS8xYavwSGnoGnP7HDensNhpYBOpbSmP+1ciaZRGPHq
	Of8C9PGgNBW+FSyTL3axi/EQ==
X-Received: by 2002:a17:902:d2c5:b0:295:55fc:67a0 with SMTP id d9443c01a7336-29555fc6b77mr77376605ad.2.1762163613309;
        Mon, 03 Nov 2025 01:53:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEoTGYBeKUah6jDo3wMiAEXeCGSXTu9lbrJNR6GODRbD0jwvT0knofuKnPEVNWTYDIrALEjfg==
X-Received: by 2002:a17:902:d2c5:b0:295:55fc:67a0 with SMTP id d9443c01a7336-29555fc6b77mr77376355ad.2.1762163612832;
        Mon, 03 Nov 2025 01:53:32 -0800 (PST)
Received: from [10.190.211.199] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34159fc0e19sm391835a91.4.2025.11.03.01.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 01:53:32 -0800 (PST)
Message-ID: <931eaa75-52f8-4790-9103-02e97b820c7f@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 15:23:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] soc: qcom: smem: Register gunyah watchdog device
To: Bjorn Andersson <andersson@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pavan Kondeti
 <pavan.kondeti@oss.qualcomm.com>,
        Neil Armstrong
 <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251031-gunyah_watchdog-v4-0-7abb1ee11315@oss.qualcomm.com>
 <20251031-gunyah_watchdog-v4-1-7abb1ee11315@oss.qualcomm.com>
 <9421ff80-bd86-4b29-baca-c86da90c91aa@roeck-us.net>
 <wxdglhtsss4it6gfm3d7nngi6aezcvpcs44oa5mlmdwe34d5o2@qlkri6oknnpe>
Content-Language: en-US
From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
In-Reply-To: <wxdglhtsss4it6gfm3d7nngi6aezcvpcs44oa5mlmdwe34d5o2@qlkri6oknnpe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDA5MCBTYWx0ZWRfX5EwKYH5OjYCR
 h0yiAr+dm6JVl9kQwt/tg6VvKtA2w9/pZ9jvBQ9/rhrcxJ85G91fqR0glFA4p8FerEwaDDNgoOa
 OaDa5hIYoFceAkWk7TXZkPCEa9oNLj23Ml9L6WvHlwdn9gnnxQrzo73lWslvhnwNd3g3wiv/4mx
 n3/p1i1KNok42Yb9P64B9yiYkv4S80autfSccxWlvnv5IsjWF5lczX3GYdVNy+1DJkgOhWcOjhp
 TKOW/SeuBV+QHSmdYCxbit2s/fa9RShoRZGB8OHn+lcl5CXPPG0+a9ctQymmVFj/bmaFHRw0BLk
 z5I0aLj1oaSSgpHrQNr48B3FnU1cUUVvBUVmtiFmocGEBsreE4lhoUNMgLVQApGzkvmSY/RZUul
 Lb5ZMsLYOleU44d7AxY+7MON5wqUWg==
X-Authority-Analysis: v=2.4 cv=Tq/rRTXh c=1 sm=1 tr=0 ts=69087b9e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=rzB8HjGg_Mo3OrOr0-EA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ED3nrSnmBhzrPeDJYl2VybpCllruzRzU
X-Proofpoint-ORIG-GUID: ED3nrSnmBhzrPeDJYl2VybpCllruzRzU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030090


On 11/2/2025 12:20 AM, Bjorn Andersson wrote:
> On Fri, Oct 31, 2025 at 08:24:44AM -0700, Guenter Roeck wrote:
>> On 10/31/25 03:18, Hrishabh Rajput via B4 Relay wrote:
>>> From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
>>>
>>> To restrict gunyah watchdog initialization to Qualcomm platforms,
>>> register the watchdog device in the SMEM driver.
>>>
>>> When Gunyah is not present or Gunyah emulates MMIO-based
>>> watchdog, we expect Qualcomm watchdog or ARM SBSA watchdog device to be
>>> present in the devicetree. If none of these device nodes are detected,
>>> we register the SMC-based Gunyah watchdog device.
>>>
>> There should also be an explanation why there is no "qcom,gunyah-wdt"
>> devicetree node, both here and in the file.
>>
>>> Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
>>> ---
>>>    drivers/soc/qcom/smem.c | 37 +++++++++++++++++++++++++++++++++++++
>>>    1 file changed, 37 insertions(+)
>>>
>>> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
>>> index cf425930539e..40e4749fab02 100644
>>> --- a/drivers/soc/qcom/smem.c
>>> +++ b/drivers/soc/qcom/smem.c
>>> @@ -1118,6 +1118,34 @@ static int qcom_smem_resolve_mem(struct qcom_smem *smem, const char *name,
>>>    	return 0;
>>>    }
>>> +static int register_gunyah_wdt_device(void)
>>> +{
>>> +	struct platform_device *gunyah_wdt_dev;
>>> +	struct device_node *np;
>>> +
>>> +	/*
>>> +	 * When Gunyah is not present or Gunyah is emulating a memory-mapped
>>> +	 * watchdog, either of Qualcomm watchdog or ARM SBSA watchdog will be
>>> +	 * present. Skip initialization of SMC-based Gunyah watchdog if that is
>>> +	 * the case.
>>> +	 */
>>> +	np = of_find_compatible_node(NULL, NULL, "qcom,kpss-wdt");
>>> +	if (np) {
>>> +		of_node_put(np);
>>> +		return 0;
>>> +	}
>>> +
>>> +	np = of_find_compatible_node(NULL, NULL, "arm,sbsa-gwdt");
>>> +	if (np) {
>>> +		of_node_put(np);
>>> +		return 0;
>>> +	}
>>> +
>>> +	gunyah_wdt_dev = platform_device_register_simple("gunyah-wdt", -1,
>>> +							 NULL, 0);
>>> +	return PTR_ERR_OR_ZERO(gunyah_wdt_dev);
>>> +}
>>> +
>>>    static int qcom_smem_probe(struct platform_device *pdev)
>>>    {
>>>    	struct smem_header *header;
>>> @@ -1236,11 +1264,20 @@ static int qcom_smem_probe(struct platform_device *pdev)
>>>    	if (IS_ERR(smem->socinfo))
>>>    		dev_dbg(&pdev->dev, "failed to register socinfo device\n");
>>> +	ret = register_gunyah_wdt_device();
>>> +	if (ret)
>>> +		dev_dbg(&pdev->dev, "failed to register watchdog device\n");
>>> +
>>>    	return 0;
>>>    }
>>>    static void qcom_smem_remove(struct platform_device *pdev)
>>>    {
>>> +	/*
>>> +	 * Gunyah watchdog is intended to be a persistent module. Hence, the
>>> +	 * watchdog device is not unregistered.
>>> +	 */
>>> +
>> Odd explanation.
>> I would assume that the smem device is supposed to be
>> persistent as well.
> Yes, but it's perfectly possible to run a modern Qualcomm device without
> SMEM, with a fair amount of functionality. So, the reevaluation of this
> decision is grinding in the back of my mind...

One option can be the SCM driver which was suggested by Neil in v3 [1].

Let us know if you have any suggestions where we can register the 
watchdog device?

[1]: 
https://lore.kernel.org/lkml/321f5289-64c0-48f1-91b5-c45e82396ca9@linaro.org/

Thanks,

Hrishabh


