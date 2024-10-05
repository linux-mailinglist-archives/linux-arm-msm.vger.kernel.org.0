Return-Path: <linux-arm-msm+bounces-33196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 584779919CA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 21:03:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA2351F21559
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 19:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C167487A5;
	Sat,  5 Oct 2024 19:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="S2EbghyK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C35A31;
	Sat,  5 Oct 2024 19:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728155016; cv=none; b=REmbX6qfkKO6KFXZ5GVficG62xjzS8lzvoT5FBgYL5VFzyuUIpmjfyTeAT1iFT3hqTwOtp66/37z/yWdQqKeZQZJ1x8tslJsF+KHkr+0rDV0Ac2OtofvdRQJgr8iPw8l+RcFi5hu67Nto77YlA4E108/lzI6+cATAv9HE3WSvrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728155016; c=relaxed/simple;
	bh=CNVNuSsIh2Kbt3pDRZ0QFRp0Eu5FFk6wOszatdQBQCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=S48+Q+agtOASCkib++EY8ydRWIYURQrs8IMvplPseJpQP4OHNixFw+E4qvKxgBywYZ/xe6O1lUgVD0GK6DHxFVKDmHfgX6MZCvJFJLCQq5lqQklEHlEvEBRgcylR/IJ2w6NFZTEeyx8h21fvlwbtZzFweB4f+fPxeN1ujatyFf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=S2EbghyK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 495INppA010540;
	Sat, 5 Oct 2024 19:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QrlBV1qUNTftQ+Ty9Twc4xJf/CC2jxWBbSGCyD2twvM=; b=S2EbghyKkalY+Fk6
	Vw9FNcv73uL3HxVhgeppYvv4ckvwjh9YrlZNtK1XTlWO3NAF1ZxTHs7y+hhJG0Wz
	yzYqdRpZeh7KP6fDuMWTSm+fYyghR2thaWGk8tRyBMXvB49vqjX0+sH50CZ3EciT
	40W+Rp8zKaMns102PHrPavINX6WzU3NVuWcsMYljSQdgrzjl/Sz3T+7CxRGfOWPK
	/g7M0+XYSICJCYfc5/z58EtGTtFA7mCXsdToY24OsmSdW2e9zG1MxckMkbojQ4tb
	aJVyGSjPEoRfBk4KLVd/+0HiUQzZNS0hCeJcu46gCBYASUgafW5o621bhkJH7A9Q
	H6GzMg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xu68y7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 05 Oct 2024 19:03:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 495J3SZR015835
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 5 Oct 2024 19:03:28 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 5 Oct 2024
 12:03:25 -0700
Message-ID: <b1d982c1-f800-97eb-1be3-e77e04a8e81d@quicinc.com>
Date: Sun, 6 Oct 2024 00:33:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add X1E001DE Snapdragon Devkit for
 Windows
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>, <konradybcio@kernel.org>,
        <krzk+dt@kernel.org>, <robh+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <conor+dt@kernel.org>,
        <abel.vesa@linaro.org>, <srinivas.kandagatla@linaro.org>
References: <20240911073337.90577-1-quic_sibis@quicinc.com>
 <20240911073337.90577-3-quic_sibis@quicinc.com>
 <pt4wtycddqhcvw2iblaojmzsdggmlafft4vu6lg5j2vstbhbqj@acenyi5k3yeq>
 <eqy4yicgeqlgaytgzybnitvbrdr7jmjjk5k2swmadad6scwk77@ubaf7a2kgmdm>
 <1BBC34CC-92D9-4F6E-8DFA-1F2DA36D545A@linaro.org>
 <20241001085105.iglzp3art5ysli2d@thinkpad>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <20241001085105.iglzp3art5ysli2d@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9fRQomChkLsetueAKKOj9T69QLure_cX
X-Proofpoint-ORIG-GUID: 9fRQomChkLsetueAKKOj9T69QLure_cX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 spamscore=0 mlxscore=0 malwarescore=0 suspectscore=0 mlxlogscore=917
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410050139



On 10/1/24 14:21, Manivannan Sadhasivam wrote:
> On Tue, Oct 01, 2024 at 09:56:30AM +0300, Dmitry Baryshkov wrote:
>> On October 1, 2024 5:42:35 AM GMT+03:00, Bjorn Andersson <andersson@kernel.org> wrote:
>>> On Wed, Sep 11, 2024 at 10:55:05AM GMT, Dmitry Baryshkov wrote:
>>>> On Wed, Sep 11, 2024 at 01:03:37PM GMT, Sibi Sankar wrote:
>>> [..]
>>>>> diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
>>> [..]
>>>>> +
>>>>> +&pcie5 {
>>>>> +	perst-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
>>>>> +	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
>>>>> +
>>>>> +	vddpe-3v3-supply = <&vreg_wwan>;
>>>>
>>>> Please use pwrseq instead.
>>>>
>>>
>>> What benefit is there to wrap a single 3.3V regulator in pwrseq driver?
>>
>> First of all, is it really just a 3.3V? Second, is it actually powering up the host controller (as expressed in the device tree? Is it a power supply to the slot (in this case, I think, it should be expressed differently)? Or is it a power supply to the card itself?
>>
> 
> Yeah, we should get into the details here. We were not paying attention till
> now, but with the advent of pwrseq, we should describe the power supply properly
> in DT.
> 
> Here I believe the supply is to the PCIe Mini Card connector where a modem is
> connected. In that case, 3.3v supply should be connected to 3.3Vaux of the
> connector and we should have a generic pwrseq driver for the mini cards.
> 

Hey Mani, Dmitry,

The schematics are identical to that of the X1E CRD with
the exception of the pcie daughter card having the rtl8125g
on it. Yes, the 3.3V supply is connected to the card as well.

Doesn't this mean all other x1e boards out there needs to be
updated with pwrseq as well? Anway will get that addressed in
v3.

-Sibi

> Sibi, please verify the above in schematics.
> 
> - Mani

