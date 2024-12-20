Return-Path: <linux-arm-msm+bounces-42953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 378589F8F47
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 10:48:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87ADF164F4A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 09:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76ADD1B043C;
	Fri, 20 Dec 2024 09:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TnXttQgS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3F91AB6E2
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 09:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734688127; cv=none; b=cDiitRV54dh79RduLO7DpnIrUFlx7A1fwYbdqGbEKbePxGU2rCoJV/YMCGg/6cQWel6I65tGDTvj/5GH53m8MY7tp2fBFU1e2BqVSLXywzZ+XUdRbRkaCmzpoUdZHH/ruBKmrs9VrNSk7PYgQXft4ZgKt0Nes6WOIUDKOvIQ3yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734688127; c=relaxed/simple;
	bh=/u9h2u8VCyh8Wn9919kX8kdRK2eFwLLsCmZITUi20AY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c/v8MRZuH/4zOvgCHAaG3c+PuUcSJTvwmnPdT5iWEGPgsgZ2ltbWJlIiZqUs3rqzeWC3NILpmdKTGObd1kAtPT06At5cbUFXwRSSHwVpZnb4NfxrNVQm6LIA1KTxQwpTMR3pNPDKxL7dwuu4j/QJL5pP+M9cT7DJwkMI6zRHgg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TnXttQgS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK7LhrO029431
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 09:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rVUKpvjNKYGH0d1LGTP6M2rnV3QaECUxpVoVBYXGfy8=; b=TnXttQgSCor7rJoe
	ZTBEftsaaXQeMsPvYEG6HAS4ZywCAggRUc0fj9YqhkUyaAK5MEE17GJItr7P8s+m
	oS95fkfGpPDhHflfjcPq+3lvpJVQL15DY3U/8YlscKeqKiGpdeDOOcL19dCOADRM
	cx+y4aw6AqTuRW0jdE7Mb715dmGANGaBDFjB6mOq8gJnXDMHsNDjJCMJAGR6gcF2
	bKtVe6IdhtdgVIlGrz2CdQoOT2Gtn//PsNZW2LHNQuCadDIpDXf8qcJtYezBSZhA
	a6lGQMpiSAvwu2AoEVzyIIs7KtTdwa/Y5FdTkz+Gq8+APwEacS7Q6xmKafS/U3pN
	fLjmMA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n44fgdwn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 09:48:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7b71321b993so21697585a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 01:48:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734688124; x=1735292924;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rVUKpvjNKYGH0d1LGTP6M2rnV3QaECUxpVoVBYXGfy8=;
        b=kCTEBCu/TyPusnn9t1Koy3L/a8cxY0BvOitVZac9ddfONNVFPtZGPGQ/BCZ3jK1IUh
         iJ4aMeD7CLv18T8zKGoMj1qjCABHfLmkdEK3IOSLb105qcxencgZWzMi7ujRv/E49VJe
         00gC/0AtryPVbWDFCFr4v0u9J1UyBJdiLQo8z+hbrUi2xFvk9mpKIj3DV9rYZUICNduB
         994JKxkmeWd8rhIgTpxRPI0Cm8zP/ADsRngjw/5l+rnh8GuR5XAGY3hMInRiHj/DPza8
         bLawx6LGxhYd272QTrMUT83fGfNlkxB92ZZjSO6V1kfE0R3u4+TUUC0mMCAnwiMK/ZtP
         xuIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVE+bnLNSAqwaCU+96NBwCbr8SKFzc4QHSiHkFUeTpgNbc0ZbhXibuCBhltkjelFT5H6S+E9OQmHAx42cH4@vger.kernel.org
X-Gm-Message-State: AOJu0YyuOC8IryE+ttkbTApkdL48XtOejIyRuwYmu7tZ30IkQJpKrr9/
	zRsI0zVgSk5rBEMAKSCdyU02SkChx3xT/8JV/62Mj23NcMMb4J4kEuQxpeKIaKn4dT5H0aydeXu
	LT2uohSgUyR8U2R+JsHdjD32uF9yznMd11DLkFGQDIi6ZaROXVK7fNgUI9DgRbIpE
X-Gm-Gg: ASbGncsSlaHrD6RyO8U2tyogWzSfFQ9czKhGCuucMEFmDDbGtVbvGzg1CCPrjUBZyF4
	5r/o1DDG2lqVtBDOZsXPvyqazfODoj6hiZ2Fk/92uq3sNdh5csJMJUbuXF5RQe55yZhQcCblB+Q
	Dn1qaYH/Jfhc5rJtbDIuFCNAJYvkksF75x7R6uzw4hM0ZKf3ryOcbpK/LQ0kgRZUH6rvUkaYvs2
	2slwzX5T9cbXRdDqxTXXq78bjo0wtmYtXfyr4PDO5MkKLl55UtLBz4sK+FanGa+LGvJ35vDl6eF
	I0VtVmmy7IrpkPLedpPgaGJ9kkuR15GtHCc=
X-Received: by 2002:ac8:7c56:0:b0:467:6379:8d2f with SMTP id d75a77b69052e-46a4a9a3aa9mr14362491cf.15.1734688123786;
        Fri, 20 Dec 2024 01:48:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrggBl9ERFYcbqyZk1aIf/jeZFXwznISS8GkbxVKTIw+S69nHydV8TNBfU9FuwstBBRIOaUQ==
X-Received: by 2002:ac8:7c56:0:b0:467:6379:8d2f with SMTP id d75a77b69052e-46a4a9a3aa9mr14362341cf.15.1734688123444;
        Fri, 20 Dec 2024 01:48:43 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f011efdsm156471866b.134.2024.12.20.01.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 01:48:42 -0800 (PST)
Message-ID: <71d2135f-664a-465d-bc1f-051cc07c8537@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 10:48:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: ipq5424: Add PCIe PHYs and
 controller nodes
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, bhelgaas@google.com,
        lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        vkoul@kernel.org, kishon@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20241213134950.234946-1-quic_mmanikan@quicinc.com>
 <20241213134950.234946-4-quic_mmanikan@quicinc.com>
 <69dffe54-939d-47c3-b951-4a4dea11eae0@oss.qualcomm.com>
 <08fbde92-a827-4270-a143-cca56a274e6c@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <08fbde92-a827-4270-a143-cca56a274e6c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -MOn7wTZJWIFrF23MVhxocgpZMXKVDtV
X-Proofpoint-ORIG-GUID: -MOn7wTZJWIFrF23MVhxocgpZMXKVDtV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200080

On 20.12.2024 7:42 AM, Manikanta Mylavarapu wrote:
> 
> 
> On 12/13/2024 8:36 PM, Konrad Dybcio wrote:
>> On 13.12.2024 2:49 PM, Manikanta Mylavarapu wrote:
>>> Add PCIe0, PCIe1, PCIe2, PCIe3 (and corresponding PHY) devices
>>> found on IPQ5424 platform. The PCIe0 & PCIe1 are 1-lane Gen3
>>> host whereas PCIe2 & PCIe3 are 2-lane Gen3 host.
>>>
>>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>>> ---

[...]

>>>  		tlmm: pinctrl@1000000 {
>>>  			compatible = "qcom,ipq5424-tlmm";
>>> @@ -168,11 +261,11 @@ gcc: clock-controller@1800000 {
>>>  			reg = <0 0x01800000 0 0x40000>;
>>>  			clocks = <&xo_board>,
>>>  				 <&sleep_clk>,
>>> +				 <&pcie0_phy>,
>>> +				 <&pcie1_phy>,
>>>  				 <0>,
>>
>> This leftover zero needs to be removed too, currently the wrong
>> clocks are used as parents
>>
> 
> Hi Konrad,
> 
> The '<0>' entry is for "USB PCIE wrapper pipe clock source".
> And, will update the pcie entries as follows
> 	<&pcie0_phy GCC_PCIE0_PIPE_CLK>
> 	<&pcie1_phy GCC_PCIE1_PIPE_CLK>
> 	<&pcie2_phy GCC_PCIE2_PIPE_CLK>
> 	<&pcie3_phy GCC_PCIE3_PIPE_CLK>
> 
> Please correct me if i am wrong.

The order of these is fixed by the first enum in
drivers/clk/qcom/gcc-ipq5424.c. The <0> entry must be at the end of
the clocks list for it to do what you want it to.

Konrad

