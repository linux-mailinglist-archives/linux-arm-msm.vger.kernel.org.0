Return-Path: <linux-arm-msm+bounces-76404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B47EBC4FAB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 14:51:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B345E3527B0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 12:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8715720C023;
	Wed,  8 Oct 2025 12:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FYpw7sr5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DBB251795
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 12:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759927855; cv=none; b=e+ILDK13Gz5FETP4H39i8Q+ZK86cTAtsb3Nn7VavpHS2Z06KeTnPvuSEm1SM6p9FzykLMhDHN/WkKhmP1hJbigwhutT4szolWHYru3M2OZpUCQaKKdUKeUqpzQasc00D6N2SGYwGV+XdlA6RsoKDM5Le4NTFfJQ7CHtcSdhzUQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759927855; c=relaxed/simple;
	bh=0b2N98FdQpH0Wdd6mea5Yi+O7il5kziKC3shD0jRcLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OkHQpRe1Kw+QQ8a5+Em22JVd1ZzAQ3FyRRCQrKzEAT4fLBhPk1qBBvV0lBhBJucO8ZyfiCiRfDZZKKw6FGeP8K2h+7JlXY5hFU2jkEdY7z/q4x8xiUYv/zX9LpO3ooxPF39bqqTCwjtztaAyWWZgDSaj5PaaM5ps35p97URSCso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FYpw7sr5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890RId028965
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 12:50:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HjXA54200/MazhziXIpKEeI9K5n9Bf0pQfwu9EvIxC4=; b=FYpw7sr5rxcDfAem
	UzAZ/lwkxo2ODXO5AvoIyUUBbP5OAwJFOM1WVVHFO6hIXDd2cJaZp2Z7x+hbOXTF
	aBF+Cj6OWwrP+fC73ZljkOYMxTwmzXa1nxTonQK4N4nxl8IQ+U6kuJOISiPAAhCP
	sVYY2rheAg30xW39mxiHfR/b+SZBLU2pEX1Ji/pnVXKL8RpAbzFcQzb+De4U4AL7
	As3sKNXCezKByJ8MaovHjo8mRCRMqDK8aRnyI77oo9t85gwrJnjimzpanMf3K+wK
	NO+dPXdbUahdeXC4ngpTg5OUpWD+OuruBY5X/xSXSGcTx0587E0ioz0hUb7UEwCP
	gZ70kQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49js9e2qq5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 12:50:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ddf2a2d95fso26302811cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 05:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759927852; x=1760532652;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HjXA54200/MazhziXIpKEeI9K5n9Bf0pQfwu9EvIxC4=;
        b=lv5u0W1Bk7pp+wLR/QTqyppO+mgGf9r6eVBlTGpd4DepVzg3lBEnhr4ma+EEJEEpft
         lZYCmn2HagoJUKvREovHHxpzSSCGJ+3n+wHI/i4hNDmtH1837KV0yxafXF+ZXzm7gRnm
         NNHYRBa1qENGS3fDj3iobmh5+mtuj8J7hN1F+0Ol8855gLMbRxtCFUtdRziWYEr9Cg2U
         UR0JkoTfyUnyWteRWfLt/OkgXNMkSqm65NM4NlyYa0MS79k0x+1HBMfgunaGG6K2kdMP
         PxKC1+/lRtzpaCji8xOBnlgNW65/H/fXZC44Uu80xf13NVwSpEZteXNXo9FSCSw3uEYF
         CYvw==
X-Forwarded-Encrypted: i=1; AJvYcCUWCHCORV1pcrzG7WoaRRRUXCqYGMnT7VAucatNJX79758ZPmYiJt0qz+sOA6GsWW7iQq5UMNdUJWUonLwW@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo9ufPKq7i7CRS9DpKWcULGdwzsl4HxN3Y+BCRc9X83wmB6e4L
	fsIgWnyX+wy2sl5nA4J0aDpH1KZwHx8rKW2ICFY+LoDA7jG3TFd1hLo7hd37nuN0BvjT2lD/tQC
	qBV5YclMXBV0XGMH5o0SsfMRzs2u8XqVXQgndE2nxuP1SLIhHSZe/o/AXQsIsB10+VswC
X-Gm-Gg: ASbGncsgKxGZgiRUhOtBKK9EKDzdyiYzaQqZvmQF0XMj0DR5exGVWo3z7a60ew4GChU
	gqDSl8hqqO1TeWCt7PFdshJlgBopObUQsBCiHFcRq7Z0u2sMb9O5jzs33M4akv+yhGSoBNiwMib
	Bkh5jgvN55+lgMUX9Gb/j+AIYWOzeu28+Nz+7vyXSXrMpzi3ycVu45plh4s3j58QH19eXoQL1E/
	cDVvFnecm4F/M3gNroUBZ2eq3po/qz6ABySCdyRNzYnlONSKHGLLwlJk9ocRwHkN9CcFqMwwpyB
	AQdQ0LyI+TNG14Ii8jBqk/DPvjEwKsJEoocBWg83yc+hnM/KPlWIh06eK5YjLManOz0ImNagU6K
	DqVCRzXSBAr48//ayNYLqIUmhQME=
X-Received: by 2002:a05:622a:60c:b0:4d9:ac87:1bdc with SMTP id d75a77b69052e-4e6ead0aba7mr29848751cf.6.1759927851720;
        Wed, 08 Oct 2025 05:50:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGd3wvG1Ynm7djM218qT3jkj11ov7+KlyDnSw0DDL6cJyrMjJ5qDwiZKjNKdh5U87l7RnzuDg==
X-Received: by 2002:a05:622a:60c:b0:4d9:ac87:1bdc with SMTP id d75a77b69052e-4e6ead0aba7mr29848301cf.6.1759927851051;
        Wed, 08 Oct 2025 05:50:51 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869b4e49esm1648890166b.72.2025.10.08.05.50.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 05:50:50 -0700 (PDT)
Message-ID: <b14ca601-56d8-4ecc-8813-b9b642646a0c@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 14:50:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: lemans: add mdss1 displayPort
 device nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
        abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
        abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
        simona@ffwll.ch, alex.vinarskis@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicnic.com, quic_amitsi@quicnic.com
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-3-quic_mkuntuma@quicinc.com>
 <e3400ab5-c4ea-455a-b8ea-d4fba2ece85d@oss.qualcomm.com>
 <6uo2w4lscjlx5mtio2xw3xgyyu6kem6kavtdxtu7cbyix6kews@h2ou2awbppzy>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6uo2w4lscjlx5mtio2xw3xgyyu6kem6kavtdxtu7cbyix6kews@h2ou2awbppzy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Hrl72kTS c=1 sm=1 tr=0 ts=68e65e2d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=Nc9AMxU9nlP_Mo_kQ7EA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Lnyo7T_2kZUhZJEXH8YaLf5seS12EHPY
X-Proofpoint-ORIG-GUID: Lnyo7T_2kZUhZJEXH8YaLf5seS12EHPY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwNCBTYWx0ZWRfX1ynl8TupPcgp
 /TjYJyZXWNUdmcNctPD7BUpF3yu2/v3rwmSw16+zuEnb1/P0wuyyqjQq6nmGai+KQutZYgm93Eb
 ZlippbLXgVNo/dixna07TDotuGctaVDyK3Ha3/R1t7Rxl/Y94cNJnrJ/NX2FwInJFsDTHuQrqPb
 vUpYzsOugJceBihsmYsUx7FiuPE0pWmYqQKRjc//3SMlUGQ/U9OoU8yhYnqKJvL8miTZq3jqRhj
 4W3km/wKyWYC39wJKDXXQzQYSKgmHyTiT/RSvB7wdH+OkrY3lQBBhavmdbw/CYNd0KwACEkfHrt
 toHc6od0eLso2qNtwqTL+WkggL+jPu6nzeYOcuNjbaCGqECsqxfXc0TyY0wi3PQiaSavfKHaNlj
 6DmEwqcCUFhkd/IRZS3lmsvOSFUPqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040004

On 10/8/25 2:49 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 08, 2025 at 02:40:35PM +0200, Konrad Dybcio wrote:
>> On 9/26/25 10:59 AM, Mani Chandana Ballary Kuntumalla wrote:
>>> Add device tree nodes for the mdss1 DPTX0 and DPTX1 controllers
>>> with their corresponding PHYs.
>>>
>>> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
>>> ---
>>
>> [...]
>>
>>> +			mdss1_dp0: displayport-controller@22154000 {
>>> +				compatible = "qcom,sa8775p-dp";
>>> +
>>> +				reg = <0x0 0x22154000 0x0 0x104>,
>>
>> sz = 0x200
> 
> Hmm, why? I think the memory map specifies these sizes.

Yeah and I went in line with the allocated region size (not last register)

[...]

>>>  		dispcc1: clock-controller@22100000 {
>>> @@ -6872,6 +7115,8 @@ dispcc1: clock-controller@22100000 {
>>>  				 <&rpmhcc RPMH_CXO_CLK>,
>>>  				 <&rpmhcc RPMH_CXO_CLK_A>,
>>>  				 <&sleep_clk>,
>>> +				 <&mdss1_dp0_phy 0>, <&mdss1_dp0_phy 1>,
>>> +				 <&mdss1_dp1_phy 0>, <&mdss1_dp1_phy 1>,
>>>  				 <0>, <0>, <0>, <0>,
>>
>> You need to remove the same amount of zeroes that you added
> 
> Nice catch. Which means that somebody was sending untested patches.

It would work.. until someone tried to add DSI to the second row of zeroes
instead of the first one

Konrad> Nice.
> 

