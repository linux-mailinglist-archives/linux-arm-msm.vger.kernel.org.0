Return-Path: <linux-arm-msm+bounces-76062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C001BBE086
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 14:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CD6D3B78CD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 12:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73DBC27F19F;
	Mon,  6 Oct 2025 12:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LiJcCMmc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF49135898
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 12:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759753909; cv=none; b=ChriOZxpc+nnSTbGD+3nxrDeNAgevgo+wj920Twleax7xRZrA2QpBbmASvJ1FJZbfCoQCetd89+x0n1KnAuBMO7AA3Zc/MLTIN+5v1vrDz4T54u4EwafpHyaA+DXponu/fwky/mcjYf+IpKxA5SyyLIgTy1izoqPq5d5EXx1RPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759753909; c=relaxed/simple;
	bh=CJ/li2NjwE/vxWhoTWEa6diBIASq688SzguAh5XwGjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r7LqC35qnlpJgqfBt0d+9KtK1iHj/dwmrSuDsNG/p0d5GADJCswgTPoq6G9ajOCRNPDckwVIkIwaMri806O16tOtEVq5dL1mzRqvmKwVQyAncWM9wLqU8qlQZI5hstccbt7gQDg/OoPQFwcDP8d6BnfQuS3k/JCXhdvosHP7amM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LiJcCMmc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5960M8gS015546
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 12:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MJ03y25vxsCsNKFBtqgk2JlRNOCgTcb9CSsSI7FvbDM=; b=LiJcCMmclSa6bean
	Au3kbgijp3jXTYwbiVF8Qu8VlfptEcTiN45v+R1oKSGEYtUb3RgB/HYh8uuoh8mx
	JHWwhO2Dlj1LbzIk7QKY9nbDLOgU7XcC0lZ0kUdjtogEnMqfs168XZolt0wcIZ/t
	rYsFMbD8jfOLp3J7imNImgJYYoRGhlJyg0fwJe5AzouX3XKqoM+QtpMviF9BuOUr
	sl8IYiBUxYszVFxC+lfE1hXQx/q0xQUzTPo2fhHQzg+WhNquuRWRV2+wA2PgMWfB
	NX+9ttBz3yLQYdXanAULde2QeN+6+QIrNoa8P9X/Y1D5rIoJFf+ZPAGnSBj2wluE
	ngE/6g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49junu3uga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 12:31:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e231785cc3so20855041cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 05:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759753906; x=1760358706;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MJ03y25vxsCsNKFBtqgk2JlRNOCgTcb9CSsSI7FvbDM=;
        b=GHv5FnLSuU0Q1z4CaOd3I1OroQJn0IOBFfBcdmeaXvcxKKnYe8YG1Qr5Fu5hb3+vF9
         lZw2M4Xqrmrrdxh1e1eLEbDH9OCGgwBrMAYB8NUBmfjBqaRlNHOz+PNc4ZouhcHvRd6h
         dC92Sh8nkoDXHQO2dgS/UOTGaqAxaDG1IdSziafEJM0owZzegKr9zoJYYggB9mJpQMgc
         69I5IAGE1vernSXKkShEN2DZfix9lrJ58cWiR6vAyLM2XUY7itcVLXnvPBzFOASGD42y
         s6+D6sF5Ug+uE8+wUoUtlKyNh8UczQ9FOUy2JFy7uaMUIGVBDiMLT4t8WTCPefXoMfS8
         Zw/w==
X-Forwarded-Encrypted: i=1; AJvYcCWD6ECp1vhZ9KUlP2ddCPGjFmXppZhqJX5CStfEZmaxS7NeF/P7/HpT9OYmT7OuAoojD0PozlJOdLK8PHz1@vger.kernel.org
X-Gm-Message-State: AOJu0YxDmWKRV8uSYyOkml59FHrXF1JVKmd4NKEuXNv/bdacb8qMTeqf
	ArZaKhbg3kuIINOb8OLYR3Fz66nCjH8IG6Esornijd0xDJBHOZGWCZb7soZw8sX2MRru6cEKOih
	r71cXUvTZF5xOmu37ryOWPxCmiiYjgPH1CHRYFTVYC0ShCIOAjdqrH2yOKG2tEKweLQJ9
X-Gm-Gg: ASbGncv+nlhahQEB7yERMAzHoAircwJ9Cc+n0+P3UWapCcsaasIeOq/X6XQoVfpyOPy
	GbyQU5FCiaPI87UsZGNBgIVQXMzObc3IC6VPWMxwlQsbfmJsccdxZWEG1Jv5iRwOP70lXoIfduW
	JLWUckaH8Y1vTUfsEiCJrIBnrCQnXqKjwJrOO/3sEtPR22/49NYOwd81wNGx2a8d9rNBQAVV8RH
	ZbptL5cSM13iLr7VfCo8s2gx2smCqajWAIMTuSZpX/UFzsIa1ZjmkmSxJF/r2BMXJtZnGhevlJL
	UYRj3MFUSuFi65DeMFEorGliUoxx0hJSrGSjzvYWITAwP0A7gX7j61HvpFIawaSNjIs/ZY+kM90
	hpinE9uCk6uYSsGKD4BBuDZejvSI=
X-Received: by 2002:ac8:594d:0:b0:4b7:94ee:4fb2 with SMTP id d75a77b69052e-4e576a4b20bmr93180011cf.5.1759753905472;
        Mon, 06 Oct 2025 05:31:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2WqYRw9tJAwkCWVZULEkhWrsi+IGiAs6DfmjaXLOa0kXsbazcsb/WKotgM+3e30+bN9qdAA==
X-Received: by 2002:ac8:594d:0:b0:4b7:94ee:4fb2 with SMTP id d75a77b69052e-4e576a4b20bmr93179591cf.5.1759753904846;
        Mon, 06 Oct 2025 05:31:44 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa02asm1139837766b.8.2025.10.06.05.31.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 05:31:44 -0700 (PDT)
Message-ID: <c21a408b-ec4f-4de8-a9b6-ca25410ace6a@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 14:31:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: r0q: enable hardware clocks
To: =?UTF-8?Q?Eric_Gon=C3=A7alves?= <ghatto404@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250920014637.38175-1-ghatto404@gmail.com>
 <20250920014637.38175-5-ghatto404@gmail.com>
 <d16e8c07-6c10-4c91-9bbe-a260f0497d29@oss.qualcomm.com>
 <99D0B281-03A5-447E-A6BF-892C99829D0B@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <99D0B281-03A5-447E-A6BF-892C99829D0B@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: F27Fo3QKqGqrQCbY7CR7JDLFq9tjDi8G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMyBTYWx0ZWRfX881mzVClDO16
 oJStO7S7SWGIG9Usfq3jP6ZNF+WL7HPAiVFormKefP19pUv19hD7CWqyiTXSdNWsQYsyVmecmus
 UaTiovu6+nWYazR1yLd4CfG77E3V3hffnSEqF8Z7KNE9TRTex7j5SIyIZzv13qc/ildaUaNuPa9
 KD/5mzJpBTEUoqJBMk17/Pst0c77j1oaUUDv5z6eDj5eo+zmFyy51lEeCYn9y1a4cIVTYn7+Kxx
 n/GYQX1/wRLdLi7KSqMr7beq36D6xrdQbQw63QN5RgxWZ6x6UOpT9vIWn+5uivQCC30YEeqrD6V
 VRq24NhIeDtR5I8zBdtj9nvo/SYoDHbl6L7Ic0WSUpze0swvaEWYcPWNajFeUxfnXsiTYxkhCLi
 JiGMHnVaR9PCLog5Au8MJaWjBrygeQ==
X-Authority-Analysis: v=2.4 cv=CbIFJbrl c=1 sm=1 tr=0 ts=68e3b6b2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=J7BwVpqbZ6fScHfkYVcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: F27Fo3QKqGqrQCbY7CR7JDLFq9tjDi8G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_04,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040023

On 10/5/25 5:50 AM, Eric Gonçalves wrote:
> 
> 
> On September 25, 2025 10:09:48 AM GMT-03:00, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>> On 9/20/25 3:46 AM, Eric Gonçalves wrote:
>>> Enable the real-time clocks found in R0Q board.
>>>
>>> Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts | 15 +++++++++++++++
>>>  1 file changed, 15 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
>>> index c1b0b21c0ec5..c088f1acf6ea 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
>>> @@ -225,6 +225,21 @@ vol_up_n: vol-up-n-state {
>>>  	};
>>>  };
>>>  
>>> +&pmk8350_rtc {
>>> +	nvmem-cells = <&rtc_offset>;
>>> +	nvmem-cell-names = "offset";
>>> +
>>> +	status = "okay";
>>> +};
>>> +
>>> +&pmk8350_sdam_2 {
>>> +	status = "okay";
>>> +
>>> +	rtc_offset: rtc-offset@bc {
>>
>> Is this an offset you took from somewhere downstream?
>>
>> Generally you *really don't want to* poke at random SDAM cells,
>> as they contain a lot of important settings (incl. battery/charging)
> From another sm8450 device, I'm sure it's okay.

That as an argument alone doesn't sound convincing to me, since vendors
also sometimes repurpose unused-by-Qualcomm SDAM cells

I actually found a data source internally and this cell you're trying
to use is reserved for PBS (see drivers/soc/qcom/qcom-pbs.c), meaning
you already fell into this trap..

Konrad

