Return-Path: <linux-arm-msm+bounces-37920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BBD9C8DE0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 16:25:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88ACC286C1F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 15:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84BA21487CD;
	Thu, 14 Nov 2024 15:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R7dZLa0b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1288F770FE
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 15:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731597934; cv=none; b=XslMGUzOuasJhHlPsQReDfMHFxhim2SXPDnHXYJ2H8dC7BJyPel0syFAuGq2+2SObdwhws7yUN9I8dviOE9jmPywCDlcrR4OLD6LSX1BHH92Md+OY1lWph80qSu/5z/OM7rmwsq7zbV8MGBbvTrYOQ8JNw5kGEdWfB3+ExBL/v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731597934; c=relaxed/simple;
	bh=yCNfpNDzwbET0LEuXl0osl4EyrXHRcoLor+RqoNIT9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lkjnWl5LFM50+q4e1JEKk2DNZeq05BSkIJas5Ny5/C3kTy6DRSQVK0t1KxXk3cMfO+lhi6gdBBuHKFA3spWtEywMe7pkTlKRh9tLkpMCA+Jd+NwqwOg+yMnkE4RC159pKbG97W8tNaBbVUMeHa4CAnMZxEOqVKn34444fTu2WWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R7dZLa0b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AEEfhi3001123
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 15:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	77Uxb2WKa15F5RlNtYFFhLRjfJru9BUZrxBhSgyxq1Y=; b=R7dZLa0bxgFu8heQ
	hYjjlXMBKY6UuVf7g7G/pBjXtCgqHWhO4/EjJuViaogxOKU7+qb+dmFlbA/3rkY6
	hmD6yVU55eLplKiOr4u3MCTslUkcOItfLEwO4Wlus6/XsKN0z52Ymd3sx0duef+h
	ZpMxNDMW+vdYi2oluKCYW/GSiJE44wVKe76rku89JCZC5ck5VHq4OBSZDk/a5yTm
	Tpiirxm/RjJCBbosbOMSMmfZTk1bjfkip9sX4YuzsQDB4NbaCizDt4aUPxv852c2
	bSB9s8n+dwDEZGoEOfFI8H9KnBJXPp51v3IqGderpIqpRZIxtv8OsnLVnPGypB0B
	vqcFRw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42vqbm5unn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 15:25:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-460f924d8bcso1322561cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 07:25:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731597931; x=1732202731;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=77Uxb2WKa15F5RlNtYFFhLRjfJru9BUZrxBhSgyxq1Y=;
        b=S8zeP1tjACsHF/1aE/YTW5eutJs4gnJm1XXbtqCNuT+BKyUlUkFXxGY/Cx2ceSS4D/
         No6EuNq4HEUzrC3M+4/k8p8LpgLBODZxASVx2yDUFN1CXhB4eaVM8CQ+57IkEDIWomil
         Hv7hDld+/BYB/kJ+tnQvjjH9r3QryNby75cl59vQTBaiYTK8MgP3S7P2++DfBBFiCiV2
         oD4q7rPNHEgrgmqmFJgN8h48aPxiZf2xTWm+lS99IDAgWc6psQAiKjq46onuCuaycS6E
         Etj3L8IiBDpf4/ZccHbwhOrgqwl/zLQDEYqBhWEJKocKPHkd45rEhMjRTYL/HJYPrdv9
         a7wQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqC2QTLasi0d18HL5RFroy0KsKFC5I+b29QM3Lw4np9TWoINpWUwn8lCGO+5MvcnUMExTvWGPpmYDAFcB3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3mPbA9pT6KPsuNVHuckQXg/hAnTLv24jUKrPaClovjtOezT6o
	oFMJMZAGu+sZH0hu7ktaVEYXu2g9YvZp+EWYgsunOC1aWtvQmksnFVH7krmQ/NFELQERNunD0rd
	RWtgfCOAAcyyhw8sdCa2J7ip3xzn5HwaBb32t8FwEjb17aTgJPb6XpEzKrIDp5S0k
X-Gm-Gg: ASbGncvOe3RIrZeBR6hfqEFiiEoq51o4okR7/J1WyaobVIQQKrNIxHv/QIxfuEbHByO
	WP3rQFCupg1JP+BIwKtK9zIlRS+pIO5tzvaAEbfYTjuexDJEchSouMJl2UheAQUepp5Mc/sMUXJ
	KOmt6vxFNUx19KqP14wuiwT8UNkTeehc5qgKcSBLurDshTtSqaQbuf42ZGsMmA+fW9OKIatUz99
	u1R3fvWSckwIuzOaW7opXsuWhYe+WYdsqmAwnuJljC00Q3wGJL8TAilhdnmRS20C7e0HmlPT4Ak
	k417VSvp2CuILW1PnM+5koh0vK+YFCw=
X-Received: by 2002:ac8:5e4e:0:b0:463:5517:ffdf with SMTP id d75a77b69052e-46355180066mr29516241cf.16.1731597931058;
        Thu, 14 Nov 2024 07:25:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhRByPw5EKbcCygzJSeTHFTucdQZ7slWUPQDlZW+UZ6sjz9iRDzTlgGCHFVd6ZGQW1YCrwpw==
X-Received: by 2002:ac8:5e4e:0:b0:463:5517:ffdf with SMTP id d75a77b69052e-46355180066mr29515961cf.16.1731597930690;
        Thu, 14 Nov 2024 07:25:30 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf79a44a9dsm700093a12.0.2024.11.14.07.25.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 07:25:30 -0800 (PST)
Message-ID: <abf5b78f-95d6-44e6-93f6-616178ad328d@oss.qualcomm.com>
Date: Thu, 14 Nov 2024 16:25:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/5] arm64: dts: qcom: x1e80100: Add support for PCIe3
 on x1e80100
To: Qiang Yu <quic_qianyu@quicinc.com>, Johan Hovold <johan@kernel.org>
Cc: manivannan.sadhasivam@linaro.org, vkoul@kernel.org, kishon@kernel.org,
        robh@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, abel.vesa@linaro.org, quic_msarkar@quicinc.com,
        quic_devipriy@quicinc.com, dmitry.baryshkov@linaro.org, kw@linux.com,
        lpieralisi@kernel.org, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        johan+linaro@kernel.org
References: <20241101030902.579789-1-quic_qianyu@quicinc.com>
 <20241101030902.579789-6-quic_qianyu@quicinc.com>
 <ZyjbrLEn8oSJjaZN@hovoldconsulting.com>
 <de5f40ab-90b7-4c75-b981-dd5824650660@quicinc.com>
 <c558f9eb-d190-4b77-b5a3-7af6b7de68d8@quicinc.com>
 <ZzOQi0PpRZYts-B0@hovoldconsulting.com>
 <ef37236d-8856-4981-82fa-c0194d7b3dfc@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ef37236d-8856-4981-82fa-c0194d7b3dfc@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0Uw8BGiyd4mOpOEQac2XArdwfAxTO9T9
X-Proofpoint-GUID: 0Uw8BGiyd4mOpOEQac2XArdwfAxTO9T9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=931
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411140120

On 13.11.2024 4:15 AM, Qiang Yu wrote:
> 
> On 11/13/2024 1:29 AM, Johan Hovold wrote:
>> On Mon, Nov 11, 2024 at 11:44:17AM +0800, Qiang Yu wrote:
>>> On 11/5/2024 1:28 PM, Qiang Yu wrote:
>>>> On 11/4/2024 10:35 PM, Johan Hovold wrote:
>>>>> On Thu, Oct 31, 2024 at 08:09:02PM -0700, Qiang Yu wrote:
>>>>>> +            ranges = <0x01000000 0x0 0x00000000 0x0 0x78200000 0x0
>>>>>> 0x100000>,
>>>>>> +                 <0x02000000 0x0 0x78300000 0x0 0x78300000 0x0
>>>>>> 0x3d00000>,
>>>>> Can you double check the size here so that it is indeed correct and not
>>>>> just copied from the other nodes which initially got it wrong:
>>>>>
>>>>>      https://lore.kernel.org/lkml/20240710-topic-barman-v1-1-5f63fca8d0fc@linaro.org/
>>> BTW, regions of PCIe6a, PCIe4, PCIe5 are 64MB, 32MB, 32MB, respectively.
>>> Why range size is set to 0x1d00000 for PCIe6a, any issue is reported on
>>> PCIe6a?
>> Thanks for checking. It seems the patch linked to above was broken for
>> PCIe6a then.
>>
>> We did see PCIe5 probe breaking due to the overlap with PCIe4 but the
>> patch predates PCIe5 support being posted and merged so it was probably
>> just based on inspection.
>>
>> Could you send a fix for PCIe6a?
> Sure, will send the fix.

So the patch I posted made it match the DSDT/Windows state. I assumed
there must have been something wrong as docs suggested the value that you
did.

But both work. In case any issues pop up, we can revisit this.

Konrad

