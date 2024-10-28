Return-Path: <linux-arm-msm+bounces-36168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F31219B315A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 14:09:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 218311C21219
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 13:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8967E1DA631;
	Mon, 28 Oct 2024 13:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZsmyfgYB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813421DB37A
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 13:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730120991; cv=none; b=mJpIWdnHvO94EtFhpjvTZpWa0diRNtewS9slh8eN1cGeGLX2FszfPjF2oCsD74+qSS78FmsyvfZEFnejSjJO/K7AReEeCJQpT5xDHhX4uzmMr4UeJ6FcM4BEDlZ1TWh0SH+v6hd+voENZWmafIkzucMILQG8b6zRFwwTIQAWkDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730120991; c=relaxed/simple;
	bh=vzi2Ro5Jaf3pF3Rv3AuVKCP0qgxEAOSmHXRkW495ph8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n4v3W/FKWSst3sQ5cK8m6pGjyEbJafKMvRzYO1Djtcgvyzw7/Nd4lIT5KjsnlOPtmzjQDmu29FSnQVjQ6l+i90oy7QXlnBCTs8Ieq8cfJC59dqEDMzP6ts4suzFLST8xTp7SLtS3Ij01TzMhQTeffXrlpz95tTOiLog1lrKYtIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZsmyfgYB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SBJcSt013245
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 13:09:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a8Aorj2sqV1pPtNTQ06SRHwviYl+wkWrzaAiIej+K3w=; b=ZsmyfgYB2qxibtoo
	Pb0mAJvPEwnorUj3+1E0577OajXqlC74+z/M0v4uZebsU15zZIMaeKRbyVAGSYrZ
	1xVvsAmrfHO3b0L3UplKU78L++WdREquUJ2NhF9We3iLXl6XRLW/FDv9+jtg96ac
	fyVRNZnGf8borgb3WFEx8C0N6Cnum23STTpit32HpCPMV0DySVhgCdCiazi5I6jx
	2hHx+hvpQFN+zRMtfLad6+NsDLjJl68eVZp0COdWbvQy5wHN6bF+oHWi6Epzt1jM
	QKFa6rp/h/HyEsTZobTKGz9zcPXbYDOGePkt9d0RcKfFPRcikC9DuyODCtD+nMto
	ZozgPQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gnsmn6t8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 13:09:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6cbe40565feso13500066d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 06:09:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730120987; x=1730725787;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a8Aorj2sqV1pPtNTQ06SRHwviYl+wkWrzaAiIej+K3w=;
        b=VtSV+dilyiR+bKh8IKwTc07CYUOYzZJxtBGar7YQJbklzuxEN2d49dNJVjpUa9tWn9
         D6VXjLW6C4zoQOrBpxpgdCQOUopPOCjK8arjzZ2JCKZUqdK1w8eBOUdo7KoKMPiKKhrk
         BmHG/b0qIYxVoodcdiXoSVVydV59mdc0wQnvSQ9fvE8/WQjsepe0To2w9b+tjKA1hrgp
         pXfI+xWVZeixTLqHKFkQFqs7100oLXR6ynYWi+r6T2ESdkQLb3aev/bvI4jFRs3A3Wf1
         ZfJZ24bTmekGL/hk6C2QHgrsz1e3J3UVofCj/5kTGBrTh3lkjypblZQxhybAWka5rIQC
         bBaw==
X-Forwarded-Encrypted: i=1; AJvYcCVOB+KsJ9yyUatERDXZlHn05VsuNAvwcq7rciCtpK0UrqepVi0+g98y+W3p3UJJpj/SaB85UChcobK/9C/g@vger.kernel.org
X-Gm-Message-State: AOJu0YxfL6Ezi3JvKnluUiTvBgmvrApI/GP1mSWxo8JL/+v/ttxPzuBm
	+3mYzaLvUSQlGOGkFDZn7TyPz0b0QrHg70G/EqSr+tfCn/JFhhBtxhI6ODkRIeJJuB10NbIbgQy
	ahUdkSrddTr1d2i424NYv3skLd7Mp1VuzKwdkr1H3R0rPSovlovoYrSblwMf2yP8w
X-Received: by 2002:ad4:5c8a:0:b0:6c3:662f:8e09 with SMTP id 6a1803df08f44-6d185817c9cmr60647636d6.9.1730120987603;
        Mon, 28 Oct 2024 06:09:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVATv5v/JAhSmOdaFp8hymdUsIiSUu55HwXXNP8Yxts1Yr2m1zYJy/HdWBKZZqM/GSzi1iKA==
X-Received: by 2002:ad4:5c8a:0:b0:6c3:662f:8e09 with SMTP id 6a1803df08f44-6d185817c9cmr60647386d6.9.1730120987227;
        Mon, 28 Oct 2024 06:09:47 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f029890sm377563266b.56.2024.10.28.06.09.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 06:09:46 -0700 (PDT)
Message-ID: <ad9c7e47-8a7b-4aee-8d88-cabf42ec3298@oss.qualcomm.com>
Date: Mon, 28 Oct 2024 14:09:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs615-ride: Enable PMIC
 peripherals
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tingguo Cheng <quic_tingguoc@quicinc.com>
Cc: quic_fenglinw@quicinc.com, quic_tingweiz@quicinc.com, kernel@quicinc.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241028-adds-spmi-pmic-peripherals-for-qcs615-v3-0-f0778572ee41@quicinc.com>
 <20241028-adds-spmi-pmic-peripherals-for-qcs615-v3-2-f0778572ee41@quicinc.com>
 <j4ggfrynyoriseef5r5x6uwgo6cespll2np7uitc64yagoa6pz@r3ro2cpqrrry>
 <38cceae8-5203-4057-bd8b-f20fe3656474@quicinc.com>
 <CAA8EJprYHjYVM58e7i7Sxj64DSth4hhW_cUZ3hGqX7u0ecZFQg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAA8EJprYHjYVM58e7i7Sxj64DSth4hhW_cUZ3hGqX7u0ecZFQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sUT2Dq7kq2WUD3QEcQogyxX6XJOePvRn
X-Proofpoint-GUID: sUT2Dq7kq2WUD3QEcQogyxX6XJOePvRn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280106

On 28.10.2024 10:41 AM, Dmitry Baryshkov wrote:
> On Mon, 28 Oct 2024 at 10:40, Tingguo Cheng <quic_tingguoc@quicinc.com> wrote:
>>
>>
>>
>> On 10/28/2024 4:23 PM, Dmitry Baryshkov wrote:
>>> On Mon, Oct 28, 2024 at 04:03:25PM +0800, Tingguo Cheng wrote:
>>>> Enable PMIC and PMIC peripherals for qcs615-ride board.
>>>>
>>>> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 15 +++++++++++++++
>>>>   1 file changed, 15 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>>> index ee6cab3924a6d71f29934a8debba3a832882abdd..37358f080827bbe4484c14c5f159e813810c2119 100644
>>>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>>> @@ -6,6 +6,7 @@
>>>>
>>>>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>>>   #include "qcs615.dtsi"
>>>> +#include "pm8150.dtsi"
>>>>   / {
>>>>      model = "Qualcomm Technologies, Inc. QCS615 Ride";
>>>>      compatible = "qcom,qcs615-ride", "qcom,qcs615";
>>>> @@ -210,6 +211,20 @@ &rpmhcc {
>>>>      clocks = <&xo_board_clk>;
>>>>   };
>>>>
>>>> +&pon {
>>>> +    /delete-property/ mode-bootloader;
>>>> +    /delete-property/ mode-recovery;
>>>
>>> Why?
>> Because boot modes will be supported on PSCI module from another patch,
>> reboot-modes are required to remove from PMIC side.

Do we know whether the PSCI call does the same thing under the hood?

Konrad

