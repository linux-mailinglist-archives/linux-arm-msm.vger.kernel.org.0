Return-Path: <linux-arm-msm+bounces-47754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 480F7A325D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 13:25:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8C031689CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 12:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57A9E20766F;
	Wed, 12 Feb 2025 12:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bVDA3rhg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4472046BD
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 12:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739363131; cv=none; b=W7odvirXTSm0bPRnkWfmIuSYCqa5q/8Stn+u5yIdGJfvLdZXY2IZnoOuTagdIK9WiwFC8E0JgHOyzjbBPvJki2tvME85GinavV4bStBPeyvL3K57FlLT70wcbi1oiKWvW+uB6h2X4W07VQVqwWgUwl4aL5qNPUNMd+RmY7k5ImQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739363131; c=relaxed/simple;
	bh=qCMQuOd6127OUz9tT0IGxaxcl3ESx7d1IxhUqjaUUwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DyuSKWwX+KBnFofMfenzVhNmoFH56TSHDf9YOQPZ4DHkikC2X9AUey7MdbRoj6bFLxLw6r8I/8qyorBmrRqyYV9QB7l8/YNs+WygA3Qt3vafErjQDep/fV29/QUSip66JJpw0UpaNHQFuHyrQX7/UVzHSGvMDstn39H1/Rmhva8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bVDA3rhg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CBbBLa010515
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 12:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UbcB1AWz3QueJjVm+z7IaoPIVQtiBjJzu3fLF4T7x4s=; b=bVDA3rhgotBg2MhX
	iN6EBS3a/I4GstUfJek3K6nklCSWSkTex/3ZfZGhpbx1v1HOuZZ8wqY31YGLZZO1
	VFlDS04Z9u+uE0ulMciZfHksofKHJZgoJSCNhV8riPdFEbbGHuitxi1aUvNNkWSP
	iLHlIe7b45GnthBJEI+YVM6giO0Zm11Ubk/GG/tYw5qGyrU6x1GsfdKQlLvREscQ
	nqb6zW9gwfwcYaigfWnfkphSayxlObNDOppqqZ2MUDOeueO9vzGv6jYgfmsY6dCt
	bgkozTzd3ODKFioxCdMKCFtJTE05XZy4Ee6Lnqmy4mee+kfFv1y7R43s9yuJnouh
	RIjY6w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qcs5ftax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 12:25:28 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e249d117b7so9609016d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 04:25:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739363116; x=1739967916;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UbcB1AWz3QueJjVm+z7IaoPIVQtiBjJzu3fLF4T7x4s=;
        b=bjpzhWGRyYsRHmBtFvjWhnnrkt1RBnWHxXtS7SivMku3+FEWSUdASzLdtLOrkxp72e
         oGIO1g/upFPPZfEd9jbybWFHqD7Dtpts2EErUSMtOI1eJ78oIFT/R8tscSBmUJ2LhqVj
         v1rD9RlAKGtYkSpzHL1oI4Giw7zSyFO9oRiyp+bRSvBgF3ooMNTGrrRpBDv0ulMyXy3x
         eTldlnIz7CMwn0Ry7zT+j2qk8dAZMge7mA/5l9TkW+SOowZ7cETeEY5tbuWbO0pBC/E/
         SW5WaRLC4uO3X6vY75sfKN8gFqGWgP9O5FR0d0m+1DolMtxoRBqF7Y0zaXl1B6yi/Y0y
         w5jA==
X-Forwarded-Encrypted: i=1; AJvYcCU5/TJvxDI/TaJIwrhxFAtYs8mTPvR+pNYt08CSFHCC7Z7cSWiWSjlnvZwp2QNJ+J5csnIA7Gy5nIb0nsAV@vger.kernel.org
X-Gm-Message-State: AOJu0YwUsR2S2U3+bulDH4aPBeHjVvOmhCsAlFDRPJUGENIy/Ky4B+cO
	FtfsGyQscgEEnExNgTPvPPA5MKJ6hFzNw9F48N4pMTPeQVcqZJqkzIG1Gki8/kQ7qk3kGcNYQ1h
	DoMrcJuhDCl8Fpa+qsFU0ALo+CcLOp5N5I4Gx6la2fiZHB4m+Rkm9IoWoBLR5fzHN
X-Gm-Gg: ASbGncvUF3l5F1DDRtE1tgR8nCWsu3z1aGMDzjwbbXZvubM0OrHVt1fMuIsGabd6xZ1
	Fdl4S3jPTI8cU7UgRgmCUXUJZ4oVtN8dbYLKtwdSSJlYuJvjLWK+5J7bStkTRWgLrhaF6hf8se6
	9ci8JVbt5TYoBenuGx9KXC1F7WjArQYuYOphGeWLcZsGbAF71db+k06F9PKWKEfl8uYHCstMUxx
	BdXoo177J89pFUc3j2NZRrM2GsnMMKi9WJWKlc4CHJEkNMf8Ws7JSjF7QiTVvRJU8+4rmmY+fc5
	UrDIPeZIPLi0lhN0HVLTqrP3rCQbFpSvCQJ8WWFLZkW6Nt0ywQeBHzTirYU=
X-Received: by 2002:ad4:5bee:0:b0:6e1:8300:54dd with SMTP id 6a1803df08f44-6e46ed7ed94mr19147806d6.3.1739363116104;
        Wed, 12 Feb 2025 04:25:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECkfJniEG1I6Ju5XhH0jZtnXEOb0hdwPP0TBFwXKQ/dTnxopH890xgz8LMEw9HIR+WBS3y/Q==
X-Received: by 2002:ad4:5bee:0:b0:6e1:8300:54dd with SMTP id 6a1803df08f44-6e46ed7ed94mr19147506d6.3.1739363115652;
        Wed, 12 Feb 2025 04:25:15 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772f497c9sm1253695466b.7.2025.02.12.04.25.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 04:25:15 -0800 (PST)
Message-ID: <cba7e429-a54c-41d1-a7cc-5083cac6be41@oss.qualcomm.com>
Date: Wed, 12 Feb 2025 13:25:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm7325-nothing-spacewar: Enable
 panel and GPU
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Danila Tikhonov <danila@jiaxyga.com>, neil.armstrong@linaro.org,
        quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        marijn.suijten@somainline.org, jonathan@marek.ca, jun.nie@linaro.org,
        fekz115@gmail.com, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux@mainlining.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250203181436.87785-1-danila@jiaxyga.com>
 <20250203181436.87785-5-danila@jiaxyga.com>
 <4a232b8e-f63e-4f89-aa4e-257165150549@oss.qualcomm.com>
 <no4yqmep3b6k2s4cnucbujso67iavv57d7vrlnq3qn4vfexfka@secyoh4eqjk4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <no4yqmep3b6k2s4cnucbujso67iavv57d7vrlnq3qn4vfexfka@secyoh4eqjk4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: w5_KHa0t_8jthk7PONYEgkVtRI-GpZ8z
X-Proofpoint-GUID: w5_KHa0t_8jthk7PONYEgkVtRI-GpZ8z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_04,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxlogscore=445 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502120096

On 12.02.2025 12:53 AM, Dmitry Baryshkov wrote:
> On Tue, Feb 11, 2025 at 02:31:14PM +0100, Konrad Dybcio wrote:
>> On 3.02.2025 7:14 PM, Danila Tikhonov wrote:
>>> From: Eugene Lepshy <fekz115@gmail.com>
>>>
>>> Enable the Adreno GPU and configure the Visionox RM692E5 panel.
>>>
>>> Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
>>> Co-developed-by: Danila Tikhonov <danila@jiaxyga.com>
>>> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
>>> ---

[...]

>>> +
>>>  &mdss_dsi {
>>>  	vdda-supply = <&vdd_a_dsi_0_1p2>;
>>> +	status = "okay";
>>>  
>>> -	/* Visionox RM692E5 panel */
>>> +	panel0: panel@0 {
>>
>> Is there going to be a panel1, too? ;)
>>
>> Please drop the 0
> 
> No, dsi-controller.yaml requires panel@[0-3] and a reg entry.

I meant the zero in the label

Konrad

