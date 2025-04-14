Return-Path: <linux-arm-msm+bounces-54199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F10FA87C50
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 11:50:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 927241893864
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 09:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87BD3262801;
	Mon, 14 Apr 2025 09:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h1evmA5s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C043626656B
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 09:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744624196; cv=none; b=RrdUfyARCKQE/WR4VeB/Xnn4j83SXmPdNiz2ORgybSfeq7K/3vDEbR3Pjfug7D4RYnLujJfESXDD1UF/ZPZUygwzng7z6AMwCVGcUPIrZH21VeSClqFV//Z42xeiagDufB80zHQc9get1EZpEuSlSJ5yd+oKEcJG6Zv8JlUUNxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744624196; c=relaxed/simple;
	bh=UpCWjbJlvqX+lZRx1GWi09bIQhROQ34WhK48kOtNG4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gmoUtDimVqzMIQ3y79afba3n3XLRt0kzsuVL89Cu1Yd1hK2rR9wJSvGhuWeL81biwlCbZjYIj4MbNaFvw8BsVAy9AjleU+NzvM8y1ONsJQH/bZSWjyh4SQqJ4H0O3DImYRIPYTxmM31l2Ub+8iKYDgCW/tKlpt37bmkgTF5T09E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h1evmA5s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99nei029037
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 09:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	otwibO+B1RJWMfT84nQrsXKdELhQ7z3K4EdM/HQ4kbU=; b=h1evmA5sLBCjOty0
	enCqC7PLiGv+sARxC9HV4xxZs5BSkX4K+HSbG5FmS+BtUv67m58dEvzC7Nfplz4r
	P4Dw11xn7RQyIbleTY+Ywlpyul5RjNwiLRIZSb+lctLPN8xEqETpxNFnOU5VDELN
	jXDEy1JyCkN+tJBZ5sMj+Z5ue4O6E7lXBfiuwACT0KZiCyW/DWEbiE7t841RSiUk
	K+Y0vT4S6XkjOr3na2CM7nj4J6EhxuIUYqSzTtjyVKHwQOoTBe4Nz9wyCzFMC4sx
	yRhkfveEd1oGUMSD7qzLOIF3b4ysZa4zuYq+4oqHCHz/dBtLIRcDxrnKxnkt1Ba1
	hRXK8Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs144pb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 09:49:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c53d5f85c9so103225785a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 02:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744624192; x=1745228992;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=otwibO+B1RJWMfT84nQrsXKdELhQ7z3K4EdM/HQ4kbU=;
        b=T2XUd3yxLHUN/MoQydzI38IqWaHQEi+cQcGMcg26PtiwfjHtAMy7VQx0xYLDFNbn0a
         7qS4Qz3DfzUsvcqOE1tV/IMfdD1ErCZkXvot71AeqXpXKepVgrtCEt23lEN4ZGpHajJK
         AYWzXjkvT0V+GRozPqsqv+zwsQmVWpSh50IY3jSxyYPZEaLaVt3gBfBrezdGO4WSkMWo
         40GzpYViO7t9aQMsybN/mckk0W2LuLq6TY0A3vUbmQbpvyGb5E3smfPcosgtX0/QqALE
         5dtILtP0j6YjZX6wiKnnEvJsr1drrg4ql0XYjEwTeE9K/52Zn/vV0JwDwtqzdRCexO9W
         V2ng==
X-Gm-Message-State: AOJu0YyyJXDcb3us3WQme0V3wpA0/TXKejRvFeaNBV4jxKfE+v6Yitgx
	L5HZwO/55mFkJHwzeTMLhanwcJIoJnqeQYNmFWJf7UDfC/DxBhDduox4dq5apbZsGZywYywSTm+
	n3d68Bt6Pdy1hqoQX2Xz76+kFh67PgulbCoIQO598h5rkfwwAeeExmRgsjP+RRImZ
X-Gm-Gg: ASbGncvrOd33hwknXqOHscd4LJCaNpQz1R3ErbiCv0BSV82rOpF9DZICGLMQBO3RUyu
	G9KikybeiOMH2PgGOBZRsC34IZUZfmXomgeZI+EUocJ8wLPyxyR97nygBTFxPTsbyHNycPuu8hS
	8PzXxU5chkVIYTD0/Ig9QYTk8Q1zKfdVHl1f1a+PpdsViniwFXayvWtuG3tSzhUs/K2lYE7/VB0
	urZ13X6eVHsey+90DeFqmSjVjs5ZndmMqkyKALJ+ctIsGnbTI96x4MtMN6CabpcJ+v/JSxpd8Qt
	HRB4/klNmGA2LuFqou3bJkpjvLuwbtvwewk6JyEWtw7NQhNnplYOQNkZV9gdXH5eDQ==
X-Received: by 2002:a05:620a:2489:b0:7c3:c814:591d with SMTP id af79cd13be357-7c7af0f0403mr648276085a.1.1744624192547;
        Mon, 14 Apr 2025 02:49:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF00odbGqpr+NrwU6tII/IQJplxH+w+y1CYdgLC0L7P41kv1mE5rKymC9sH3HYVqso2Q/R8NQ==
X-Received: by 2002:a05:620a:2489:b0:7c3:c814:591d with SMTP id af79cd13be357-7c7af0f0403mr648275285a.1.1744624192033;
        Mon, 14 Apr 2025 02:49:52 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bea593sm892427066b.62.2025.04.14.02.49.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 02:49:51 -0700 (PDT)
Message-ID: <69fbfe29-f5ff-4a24-b270-289b2f160f38@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 11:49:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8953: Add uart_5
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Felix Kaechele <felix@kaechele.ca>
References: <20250406-msm8953-uart_5-v1-1-7e4841674137@lucaweiss.eu>
 <e87220f1-bf8e-4014-834f-ae99c0b032ca@oss.qualcomm.com>
 <cc84ef26-6c33-42d0-a11f-4d6b31d8beee@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cc84ef26-6c33-42d0-a11f-4d6b31d8beee@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=67fcda41 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=TyM6OeZ_AAAA:8 a=dlmhaOwlAAAA:8 a=O41bOD_wkTG2M6k6xrUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=RxdkCTCKa-xTImXFM8fo:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-GUID: NZpwBKaaCecCbCT7kfeYqwppSMLNUmLg
X-Proofpoint-ORIG-GUID: NZpwBKaaCecCbCT7kfeYqwppSMLNUmLg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140070

On 4/12/25 10:34 AM, Luca Weiss wrote:
> On 4/10/25 6:45 PM, Konrad Dybcio wrote:
>> On 4/6/25 3:52 PM, Luca Weiss wrote:
>>> From: Felix Kaechele <felix@kaechele.ca>
>>>
>>> Add the node and pinctrl for uart_5 found on the MSM8953 SoC.
>>>
>>> Signed-off-by: Felix Kaechele <felix@kaechele.ca>
>>> [luca: Prepare patch for upstream submission]
>>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>>> ---

[...]

>>
>> It's more usual to send these together with a user, but I don't mind
> 
> This seems to be used with the out-of-tree dts
> apq8053-lenovo-cd-18781y.dts
> 
> I'm just sometimes trying to reduce the out-of-tree diff of the
> msm8953-mailine tree on GitHub

Sure that's fine

Konrad

