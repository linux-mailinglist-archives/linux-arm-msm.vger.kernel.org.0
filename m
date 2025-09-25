Return-Path: <linux-arm-msm+bounces-75047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4291EB9E7B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 11:47:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7AEA3A3D4F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 09:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B52251A9FB4;
	Thu, 25 Sep 2025 09:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O9OToqBr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4980C1805E
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758793619; cv=none; b=r1WNpXp0Qnox+ZCO44x56ZpOLXywCihz/q80/x6aa/ar1ysXs863e3YNaeqX9LNYY/1BNAvlJBTvZlZK2I++LXZLKjjBprAu26O8LryJR1qNOnWogjwn5Xxl7OkHCB2pov3hWtP5QcfIezBniKaZs0O2wlg4Tr8bHHD7BskKxdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758793619; c=relaxed/simple;
	bh=vKCOhHuy6TQ6kFtJSKKwqi86Q88qrb8jlKLi6GehGjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V1WqmwdpbCnwwxf0ACVQjwFdLCSfuMYYxsgropeepMvAsNeoFnobqBvzbuz5af1UxUMMWP8g+nGFppb6Qy0u0/UQZzGt2ndHXKx2dRsuo/k8JZeQBRUP3yWqUGQU8gzaasPxIEk4gxkJ0laCLidD2RSGvOIYClS3rQIOkEq/+8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O9OToqBr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P1RxWc019931
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JmHxfa71BrXt3BKcwJJc0tD11WKweUFsuFqsRUHNN94=; b=O9OToqBrXkQELy/9
	ImYchcD/a51+Yx2YVyZpMDQpHTqrGDPzCXTjVQOfrMffRCsKft5mF7q7YStgiit1
	3kPzalTid1tltptkaLZG0iRSnKnRK/k7NehCJ2KH3OTaZajPGOTHDk5kcAwpy0kG
	qT6aaNs5QglqOeU2q1haAoj8h7N4A6sK4hbB0+uNwnEKiIzAAcTWuzLkw4mcdyTX
	aQ4a+569R5ZGSZHSCNETPDH5P5GoefMpmaLzNcEk3OQOuSY1YlSJ4VjIhIzSamWn
	Mhwb6nROuFuMJqing0oqXjl7/ytmuSYW+V7ku+zuXoaU3s5KLK++vOhOFR72Zno3
	OrLUHA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpe0uvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:46:57 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7f4bca2f925so1870106d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:46:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758793616; x=1759398416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JmHxfa71BrXt3BKcwJJc0tD11WKweUFsuFqsRUHNN94=;
        b=O6n7Uot8GVbA4Qv34JRLIRG9KZTLwrT44+1/AhAISv79xZ1JEn8lRFebNSNER9ppFF
         21oA7j6M6s4EyPvPsxZSqkFHvI0C3o9FFB+SH0Pluj/wvAupBzpExEaGUmyvEZ+FO10/
         0P+UMiuUcdpODSPYblrEfS2agMQ2pqcczzpwkTWKCfoyjfNjZnE9/vXupBN+qlDSabWc
         xYo1ejOA85mjZlYs0ryb4QmG5xZU/9DayLrioDPSRvLcgzhAnJdZWrTigioBDf8f/99v
         VRJ/3mJIBzEzpbB0YOjwhgjzuS870QFvf7cc3VPUhtEvR/EUGeaUWM3Tymu6LjQPOcuT
         S/jQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDMgc73Z/ZrRppMr3HPyI24szJVA2Nxi7v/8bAird/BImBDxbJcVi9uGVizJaYM5ygiUGx5+Z+fhtANMA8@vger.kernel.org
X-Gm-Message-State: AOJu0YxNsABLoU9FGISuUiF8PyoaQ1cJ9ImUBxrZ2IHbRRcqjAMd3Ctv
	LGjU8onl2b6QLaU7ovJYhs6m23JlHehboHtOt1VUNChTVM3PLw0ufZSfZ/Fnwh3/DvEu0e5kBp/
	9nMyW8YXMICYNk2P7lR+iVtInjfrKR24P3wieMzItLnZe27aWtIoSoh+Czn/lO4nCUbzg
X-Gm-Gg: ASbGnctBjrRZ47zNvTiLrbf7Djd71V9dtkWgSwAPrgZfyfnwjBl4cdpPrki2DN+QRek
	tg/86pU3IsUS8HHkB4qhLRu/NDSgkF+kyTZTbVch13GQCtRvCkB5TmedBmJjOw20AhV7gFYpXgV
	KxdbCI7bmFGiOCgp+n/KulofM4/vkb4FWJBb/elz3LYuCBBagZRxLWFVFQinnTg3B8tNEYmZM/d
	p3DgNeAwxMgmPvFqHdpckhybx+wmC5ag9K6/RWEjQPclRvlLimxPC7QX45U7qAJNwKcr/h84vXh
	8J4w0LzG1jtxVBKKS5YNMosu6BBM9JVJXPlsl/mDkvVy8qu1hSM62eSePpdQZJ8YWoY/Ykr2DAO
	k4YuHw/9ews8/9mNDB0JSyQ==
X-Received: by 2002:a05:6214:501d:b0:78f:baa:5712 with SMTP id 6a1803df08f44-7fc321f13dfmr26645936d6.1.1758793615935;
        Thu, 25 Sep 2025 02:46:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEs3+VT2cJTyfYqoNxfO7ts00JlQscp5eBOdWL6WQlDnJsf/ApueNr/534dZ9xDeLw6b4HkNg==
X-Received: by 2002:a05:6214:501d:b0:78f:baa:5712 with SMTP id 6a1803df08f44-7fc321f13dfmr26645606d6.1.1758793615306;
        Thu, 25 Sep 2025 02:46:55 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae2cd7sm950965a12.31.2025.09.25.02.46.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 02:46:54 -0700 (PDT)
Message-ID: <f7b46afd-eeaf-4647-a721-0bf092ab8e09@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:46:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/20] arm64: dts: qcom: kaanapali: Add USB support for
 Kaanapali SoC
To: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-6-3fdbc4b9e1b1@oss.qualcomm.com>
 <sn5a3dqnd4xz3tgtw4vbmjr4pdow4qlo3jjryp5c2sx3wzke4j@fnbexj3kch6d>
 <00594112-36ac-47f9-bf26-2270b7cc3266@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <00594112-36ac-47f9-bf26-2270b7cc3266@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ms6TWcLzGRIVYa4VicLq3ugejbrXkix0
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d50f91 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=uCnE5zM3HIJJKuD88EYA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: Ms6TWcLzGRIVYa4VicLq3ugejbrXkix0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX6NxN/xrfk5e+
 Yvw87PdFIWIOMKK2EQAiucM7dQqRZFINVoQvJWDif5vunklYDUT8JfbEs7Rv3zZAdwqMV2YgV9N
 0W09KtBzliyo1SldUCOb5bIRK0fOcAalXKYnhtV63QIC0yG8GEandLxZ1cfiWOKqj/dxDkHiZoS
 RzqkB47jkma4167DoP72ZlgH6nGV9AHv6h8ULnHNdWZ3yFH0uhOH3hIk6vuJ4Ei0CfEHSu19aA0
 Ccu1kkc9ZH3/zkAUbwMBH3DWai5becySIEUO70rC4s1k8t4JzdYf6oAANMLEahgwjXn9bhwg32p
 BQT0OvuqGIydx/A+oLjYK2CpoPL2Qa9nD6snMLg86rJbIW4YmaxDa3xJlOPgiAapy7PgtblRrha
 bcjSC7Ss
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

On 9/25/25 9:49 AM, Aiqun(Maria) Yu wrote:
> On 9/25/2025 11:20 AM, Dmitry Baryshkov wrote:
>> On Wed, Sep 24, 2025 at 05:17:23PM -0700, Jingyi Wang wrote:
>>> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>>>
>>> Add the base USB devicetree definitions for Kaanapali platform. The overall
>>> chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
>>> (rev. v8) and M31 eUSB2 PHY.
>>>
>>> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 155 ++++++++++++++++++++++++++++++++
>>>  1 file changed, 155 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>> index ae1721cfbffc..08ab267bf9a7 100644
>>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>> @@ -12,6 +12,7 @@
>>>  #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
>>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>  #include <dt-bindings/mailbox/qcom-ipcc.h>
>>> +#include <dt-bindings/phy/phy-qcom-qmp.h>
>>>  #include <dt-bindings/power/qcom-rpmpd.h>
>>>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>>> @@ -958,6 +959,160 @@ opp-202000000 {
>>>  			};
>>>  		};
>>>  
>>> +		usb_1_hsphy: phy@88e3000 {
>>
>> No update for GCC clocks?
>>
> 
> could you help to have more detailed comments here pls?
> For this driver phy-qcom-m31-eusb2, only ref clk is needed per my
> current information.

The QMPPHY acts as a clock provider, which we're expected to plug
it back into GCC (and DISP_CC), see e.g. sm8650.dtsi

Konrad

