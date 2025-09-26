Return-Path: <linux-arm-msm+bounces-75320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FD9BA3F05
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 15:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D5081C0439C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 13:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10F4156236;
	Fri, 26 Sep 2025 13:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BqhSdEwP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC7972605
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 13:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758894524; cv=none; b=CIFwxzu9o1k+gHmIDH8gDb/eAutO1YSuZBQebJRrps8gJIR3VzVT2VSTB3iCFAWy0h9cA3h9dlNpksjCw5zRSwcl/kxCX5P4tV8twDZJbAraveKAqvP6AOJTCUSxzjjN4BAlCEtiPKqKvV018seW19hc/S4iOQrTcvBXlWgLTlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758894524; c=relaxed/simple;
	bh=Aarm2UM5jytnaVhQwMjukWEv9YRVwIRMFnv161NzwC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jkZAl7Qfnxsntcd7FPOZ3dBae19z0Y0dUeal90hn1w0B83AbrTIgbAr8c4l1BWOc9NfpA8QQ8NeS95J55UpMNgQJmMP4oK0NmsmMe4mCTlke5L2/3NaKfKibKD8/ZZjJNJxxv7+3L2fYCurMOx70gOwGs38OHoGsg5KPqd9eFRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BqhSdEwP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8ve8M002689
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 13:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wWKAboNxmC/SVuUy6iZnuitUhacsSjdsbUrvric+Plw=; b=BqhSdEwPlmBAHBUL
	4s9CBwdEMGkCimFDq+9p5T9HiVz+zOqzTLVHi8aoDFx1gLTHcCdwd+h1vkffV4AM
	RYwdSNccD6TTSUjax1oR5XUiXoTOiDq46bkzDlzcctLsIxWDKLjBn9aGiKsYx3RU
	vim8NNK8PYQEkJbHOSVu1uGuEuiRjCKqyz0O8Lz0UhMPorS1GU0gvBxzBdUuMU3s
	s0o8Ap6zB4lj35Ay6KPeZryfkv3A5GC1CKcbhGXQB1kUquMXrxKJkX4nzNwzGFrZ
	Iy7/Xp3pVdyDO91tbxO1E1IKsqLqFqnbjLK7mRLATRsNL+RdITR1Sy2gecfyYY3j
	rFruOQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u312t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 13:48:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4dd729008d7so343221cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 06:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758894520; x=1759499320;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wWKAboNxmC/SVuUy6iZnuitUhacsSjdsbUrvric+Plw=;
        b=bcEpj+uKQFJUyt8/jS1Uqsm8iEkDqrElADeo07GBOuuSNyTaY6l9+pLWjC5VWjvP2w
         3FgtjRjSL7hJu0E5JdWgBE8FzpxVoMNhP02eLxF5E3ZvnN+65nChyzKv5uR3LMFpSanz
         Qwfk3FehvgirVc1HLv8ARCEYs3DxuqXASwsMNNaDVWdKMLTxyBf5m8ixnodSCAG3dIpX
         HxzwUp+bLdgCsWTRhwGYF8z9ngM0DoZJL8I+eFhWVEOrAvmlOEMKTvU8m2TJpJK/vrWb
         mG0/L3BZviUUwuIYsJb4zhax88eeEX11zgvcML0zJKk+acrf5NU2eaBcCzIXkGc/gsbH
         LSog==
X-Forwarded-Encrypted: i=1; AJvYcCUcKupJuSKKVN7ZK2e7T3vsT5jKJayQTLX6XX7/W/6jJCNnA8TSJt+QpAYzcPo30G9LdSE+KfcOQ7LDFuqX@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq8bKU2C0mPps3z0cSW3v769DhGXwXQvwS0yozPnxPBCM4Kqd6
	vPpVWr4gnRjxlqiZMKSL/R+iuqHkC0lW5E4n3NLpVk1RaeHmeuY1MeGI85e3TqAKTd5c2/u3/4J
	GbDti/fpEpYdLuehHggwX4NqSBJOY+7mkceIyvc8adaY6o43T0MS6EVtQnioxXFKVwZ4C
X-Gm-Gg: ASbGncsYVcVZ2CBbwzePRhJAXNt7JrTHuiZZRkEl0zXloVQI698i2rInOQMrT/v3UPh
	u2Vq2up3ze2l4G5fX+FqXPA1XeNAehjl2AQyZnHAWPv6MD28m43qdxzBuiOmrVbj014ZJC7BRCZ
	nCaa/rmQh4nvNFDVdlOYk8ew6d0czejNiUTaTLQyb8cD/iY4FbgPOpOaltvRsY9HljhAysyPAZt
	7WCtdu+LFL8iAK3qkm2xLAfw/+Gb9g0VuF+P1wch9I28Zz2QHqcSvbCfpb84EHQ8ljNtqAI6fa6
	xtLttQ0MTzvAAa5OtzMgx9wiWkAiR6/jGbfh1D75IlIZJBK+0m+mV3ozGvMzMHVHvgs+kFfAS/A
	+wf0R6X6YFg4SnPw0UKGIqQ==
X-Received: by 2002:a05:622a:1886:b0:4d9:c572:f9b3 with SMTP id d75a77b69052e-4da4b6160bdmr65890601cf.9.1758894520031;
        Fri, 26 Sep 2025 06:48:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhNBBgSVDYXxW58rzQ0pj1r5lmIfPVm2D3r3xaPN1V0a9k1ZbVxd4jsMfTaN5cvjszpC5bFQ==
X-Received: by 2002:a05:622a:1886:b0:4d9:c572:f9b3 with SMTP id d75a77b69052e-4da4b6160bdmr65890251cf.9.1758894519407;
        Fri, 26 Sep 2025 06:48:39 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b35446f79a7sm366342666b.62.2025.09.26.06.48.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 06:48:38 -0700 (PDT)
Message-ID: <eea8feec-d097-415a-8b5a-c51edab2dc5b@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 15:48:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/14] arm64: dts: qcom: sm6350: add refgen regulator and
 use it for DSI
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Luca Weiss <luca.weiss@fairphone.com>,
        Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250921-refgen-v1-0-9d93e64133ea@oss.qualcomm.com>
 <20250921-refgen-v1-9-9d93e64133ea@oss.qualcomm.com>
 <DCZZV93PMWRZ.1J9IZBZYP5RGM@fairphone.com>
 <4d815ed8-18db-462b-80d9-9768b51a9788@oss.qualcomm.com>
 <mmtoashmdv6cwwwdg7rpbk3kkrjddej6khdzlcyo5qb47lfunm@osemmb3z4m55>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <mmtoashmdv6cwwwdg7rpbk3kkrjddej6khdzlcyo5qb47lfunm@osemmb3z4m55>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TNfUMJw8dHOQj8avyNBmlGKcJ8HF1Xc1
X-Authority-Analysis: v=2.4 cv=PYXyRyhd c=1 sm=1 tr=0 ts=68d699b9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=7uUkQgaaTnfZjgSPyt0A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXxao7/ZIicBjt
 rkTgNinX0GgXcm2VAZVfNW5WP/EKwPxqDmt1SfbkI4Gd/itCkjdZ1BiuTOLqPn1hoiLnTSBTw8w
 5/fSyWZqdN0KSIK4pNenV4aDxwu42xrMEbJCf7hsJPP8LI1h7VKaWQG4gwQDX0skk5/ub9MUQp1
 IP82RpXXEQAmShBjSDm4o8E3rodIgfPCkgIaT0VHYOmcXOvLWy5FXY1PY8r9qlQeewESYP3fk6u
 fzqsufKCyM9KZyE+xBLcdGnXuBYCmrh8mR59NzXbFLWVG0se1fYk1XOxoIu993mYL91opfIhQJc
 bKY44o83SWrqyicXMhjAtSrRUqFy0Z/D4foXgtA/kkWO3UyO7kTSrJ9DmIaSeuZRdvfRQ2mdv4p
 Bd6vF5Y7gi3LqCcXVKqI+ZkHmyjp3A==
X-Proofpoint-ORIG-GUID: TNfUMJw8dHOQj8avyNBmlGKcJ8HF1Xc1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On 9/26/25 3:44 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 26, 2025 at 03:27:24PM +0200, Konrad Dybcio wrote:
>> On 9/23/25 9:17 AM, Luca Weiss wrote:
>>> Hi Dmitry,
>>>
>>> On Sun Sep 21, 2025 at 9:09 AM CEST, Dmitry Baryshkov wrote:
>>>> Add the refgen regulator block and use it for the DSI controller.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 8 ++++++++
>>>>  1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>>> index 8459b27cacc72a4827a2e289e669163ad6250059..dd009569a6683a25f13b068e3e0bd8746b2ac501 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>>> @@ -1768,6 +1768,12 @@ usb_1_hsphy: phy@88e3000 {
>>>>  			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
>>>>  		};
>>>>  
>>>> +		refgen: regulator@88e7000 {
>>>> +			compatible = "qcom,sm6350-refgen-regulator",
>>>> +				     "qcom,sm8250-refgen-regulator";
>>>> +			reg = <0x0 0x088e7000 0x0 0x84>;
>>>
>>> Are you sure the size is 0x84? Downstream and hwio_bitra_V1.cmm would
>>> suggest size to be 0x60.
>>>
>>> For sc7280, hwio_kodiak_E5.0.cmm does say 0x84 for refgen.
>>
>> 0x60
>>
>> moreover, I see that there are two refgen regulators..
> 
> There are two refgens on each of the platforms, but I think the other
> one is used in the automatic way. The HPG only tells us about
> programming this one.

OK thanks for checking that

Konrad

