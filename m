Return-Path: <linux-arm-msm+bounces-35588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DC49AC7E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 12:26:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63B701C22A0E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 10:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC011A2C29;
	Wed, 23 Oct 2024 10:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ekSFhSG1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4188170853;
	Wed, 23 Oct 2024 10:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729679165; cv=none; b=nUwPsv8qPzAnjog3z/Q44xclA779mb19JuKfCLiGDusaQnSDHDbhVBSdjmdqVKf7Hy5s3EKjqT7TFbbV061vc9sI4OTWSS/SA9Tt97zq237OCVzIZm/4fURJ2dt/0FaPQP1cnLDReYjDAwTDmm1e7uSQf4OGoQ7YHmHIkGNXd58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729679165; c=relaxed/simple;
	bh=BJ0tCQjq1oIb72GQneO7C/f99FxEh7+nOcq6K6183E4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=e7wwZBF4t5G7iI0Y3dXYiY6QDJBJ59Tdz3/WX0VAnjygz1bRygIm80MFfVAnNaW9mJVWAH4iWZ57SKAkei4418orLHQvc/V+2sch/qV+ShoeW2cyfM+dGrslrZUR0ceUUi2gBlwEl10vh5VUwxNW8jPz1jbicsY4OHJYxvNPsMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ekSFhSG1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49N9SR8E003677;
	Wed, 23 Oct 2024 10:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	12KZJTL2ARj7i6yZiCc93RSyClFHMX0XS5D6cGesZGA=; b=ekSFhSG1wdXCKlny
	eLZ28wti7PLf4099DtSL5xKmNl0nS6ZB0PX8E/24Bltek/U21vJPII9cJIfmD0nR
	tVz/JLY3cNaUz7ZGMYj1rpyYuHSRINBHKq9VLp2Ye6WKOV/CCtvGWYMMS8rIZHkF
	q8SRlBu2CBNH6H6siAIc9YQCfwCYPfLP+gke3KmVmz8sHUYhZDYxcF2g9KSBhIW0
	NdciW68ycNt2xUDw9eNfu44bBBABOHALUWOGRqrOMJGl1CGKi7k3pv7Jz7D1ZxYa
	ub19nObHpk3i3W1He5X2Y0QNzMgGSR6Q5+IQoK0dAi7lsOji2DEPQLLX32kvvajI
	2DrtQw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em681spk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 10:25:59 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49NAPf16010323
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 10:25:41 GMT
Received: from [10.231.207.28] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Oct
 2024 03:25:36 -0700
Message-ID: <6a73c0d3-879a-412b-9345-e4d5ccb52e78@quicinc.com>
Date: Wed, 23 Oct 2024 18:25:33 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs615: Adds SPMI bus, PMIC and
 peripherals
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <quic_fenglinw@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <kernel@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241014-adds-spmi-pmic-peripherals-for-qcs615-v1-1-8a3c67d894d8@quicinc.com>
 <p7fw7jjfawbnk2vb7zdtr2dp3ni4g2uuiwvt6o4qva53zyrpvd@kokibgaidfzb>
 <5c23a6bd-e233-4b02-86cf-902d2c57c382@quicinc.com>
 <CAA8EJppdQsGe-R5JKRJ9LJs9xGTdhkCGYc5NyzVSLA1bWvvUwQ@mail.gmail.com>
Content-Language: en-US
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
In-Reply-To: <CAA8EJppdQsGe-R5JKRJ9LJs9xGTdhkCGYc5NyzVSLA1bWvvUwQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: O6afJWukmUqlan5HtxSrSNP5hkYfWcsI
X-Proofpoint-GUID: O6afJWukmUqlan5HtxSrSNP5hkYfWcsI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230064



On 10/22/2024 5:38 PM, Dmitry Baryshkov wrote:
> On Tue, 22 Oct 2024 at 11:26, Tingguo Cheng <quic_tingguoc@quicinc.com> wrote:
>>
>>
>>
>> On 10/14/2024 6:53 PM, Dmitry Baryshkov wrote:
>>> On Mon, Oct 14, 2024 at 06:08:17PM +0800, Tingguo Cheng wrote:
>>>> Create a new file qcs615-pmic.dtsi to add on-board PMIC and peripher-
>>>> als in the PMIC that controlled by SPMI bus. The peripherals include
>>>> GPIO, RTC, PON, power key and resin-key for QCS615 platform. The power
>>>> key and volume down key are controlled by PMIC PON hardware on QCS615.
>>>
>>> Why do you need a separate file? Unless there is a good reason such
>>> configuration should be split between the pmic.dtsi and the board file.
>>>
>> One reason is that I use upstream as
>> template(x1ee80100,sc8180x,sa8775p...), they all have
>> platform-pmics.dtsi alongside.
>>
>> On the other hand, qcs615-pmic.dtsi contains only the PMIC's
>> peripherals, creating a new file can eliminate duplicate code if there
>> are any other new boards with pmm6155au as their PMIC(similar to
>> x1e80100-lenovo-xxx/x1e80100-microsoft-xxxx, where "x1e80100-pmics.dtsi"
>> has been included).
> 
> And this is pretty unique  to those platforms and it exists mostly to
> facilitate the case when a platform has several instances of the same
> PMIC. In all other cases (mobile, IoT) usually there is just one
> instance of the particular PMIC. In such a case pmic definitions go to
> "pmABCDEF.dtsi" to be reused by the platform and then board DT can
> include that file and wire it up according to the platform needs.
> 
Yes, in this case, there is only one PMIC. So making a new file does not 
make sense except the PMIC is totally a new design.
>>> BTW, what is the PMIC id for pmm6155au? Is it a real PMIC or a version
>>> of some other PMIC?
>>>
>> pmm6155au is the PMIC id(Silk scree). It's a real PMIC for qcs615.Maybe
>> I should use the name qcs615-pmics.dtsi instead of qcs6150-pmic.dtsi to
>> align with other platforms.
> 
> Is it the same thing as PM6150? Or is it a combo of PM6150 and PM6150L?
> 
I got your point, I did some more research, it's a variant of pm8150. In 
this case, I will upload a new version that makes DT to be changed after 
it includes pm8150.dtsi.
>>>> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
> 

-- 
Thank you & BRs
Tingguo


