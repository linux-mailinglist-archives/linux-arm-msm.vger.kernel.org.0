Return-Path: <linux-arm-msm+bounces-63662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB406AF8B76
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 10:28:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B286A766157
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 08:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D5D303DF1;
	Fri,  4 Jul 2025 08:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fnKlNPOh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88720303DF3;
	Fri,  4 Jul 2025 08:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751616478; cv=none; b=PeSl6DmLw8Qx2V4GnW7v/uWzQSHeQl3pZ5unew0qcjesQ50XPnAPeq5RA/K/dLSJGPHSm42x7j+CL6J2mEK4eZ26Zwn7bN5JA3kt0mZwIh5ebFk+abXiAUrtM9MJnSVhkzz7uZG8dX8T9ghQ4WubzRa1mCsVcB8w0WeggdWzd7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751616478; c=relaxed/simple;
	bh=NWr1oOIG+41ZWyh5ZDCOfjmmHizA+97eiorRh/eZj6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EzxLZynjtR71IZxPdZ+dpoFiBQYW2GL8+UF/sDfi130hLewv+EaU3xOVv6byjp0r0fcHYL1slrja7wADOsFnQipYwtdFYr4FBExwm9PiAxWcYjT+abThJz7xnNHQXkM6Zi6xsabzmr6qGMtI6ArOF70z9iDn28AJPYaKHQpHquY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fnKlNPOh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5644MbAV001970;
	Fri, 4 Jul 2025 08:07:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IHePxi9vUgRc/04Q5+R0OQJFUO8sltPI8rxPgNFqrDU=; b=fnKlNPOhc4B2a/qz
	13ujXnCZ+qpIVJcGZbvDCnrR5O0FoWaxxiMwxYTYOh2d314dGkZTcxT91Zd0W3tU
	0moQTEOzvuiEglP0nXR/A++OPuHWVdydwZT1c3R2QHrLNHAty5OOoFH4VVFxc9M9
	a1b05h6FzcxOEHr7F+D9SPbJ6aAgGScJ6OtWLHhIKFyIqYgv7UvwlwMRF4XeK1gx
	axQW9X0ZKeEED2Ycq9hCt6w0blY42g6iZPKngGATCHxCrVz9h9Jaw2m1BJ34P+do
	NzjN6n7Pp6nWahdeyf311jsCyZ5DJaOzuLfcvFzOGTwCTa6ZwONT+O+vzKgHq2FF
	dAFWPg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47p7ut0juu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 08:07:48 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56487lfx005607
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 08:07:47 GMT
Received: from [10.133.33.146] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 4 Jul
 2025 01:07:43 -0700
Message-ID: <2e8366b3-c060-4bb8-9704-0a8f41901706@quicinc.com>
Date: Fri, 4 Jul 2025 16:07:41 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Enable CTCU device for QCS8300
To: Krzysztof Kozlowski <krzk@kernel.org>, Jie Gan <jie.gan@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250624095905.7609-1-jie.gan@oss.qualcomm.com>
 <338a9ee1-10aa-4bd2-9b0a-5006ed571bb9@quicinc.com>
 <3551dba1-0c5f-4000-8b95-6a04cd81a027@kernel.org>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <3551dba1-0c5f-4000-8b95-6a04cd81a027@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2MiBTYWx0ZWRfX/BF+3Yf5B6Ky
 t6lIJezPNv2BfcK2HcK7ulHzV9dNaDhoMfmPXtIT8wXQdJfrFlewvak7mK5wihDXMYUvsdmqaWO
 BU2r8yRZT+T3O0gZIXMsbpCbX4uWnrqC6MEqZB0/As626zhb+CccTyXH5XybzStMT/PaSK33HA1
 DC7Yq7Ys83hALPAYINmFJ3rtDcdMtP26MocVwKYwDkA3ai2pirewJXvGc7303s3zmpzWNHb/aXE
 T309NTHkU1gmmV8zhEv9NUm8g48ZdbAt3OeOZzNJ8R92VOyiV6CbxqGSBapR1A+HGL/IzeO5uyr
 712PF6foY2rH4AIXpciUg6pWSKVcA7fQxwKfU5oY1iVUfQM3abP77phvO9h8DyPa91DNtZdH9t9
 iMg/DmnEwrbU911fii5GSxZqRnlz+PFHWrexkyGMbZbTRdWWR5rlivpln6bWpHZc+lHucPGL
X-Proofpoint-GUID: DypzU7L9t0IRLgODT16pVnzWX4HHEO0_
X-Authority-Analysis: v=2.4 cv=Ncfm13D4 c=1 sm=1 tr=0 ts=68678bd4 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=6PWQcI-LByP-Dk_4TF8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: DypzU7L9t0IRLgODT16pVnzWX4HHEO0_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0 malwarescore=0
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040062



On 7/4/2025 3:54 PM, Krzysztof Kozlowski wrote:
> On 25/06/2025 02:59, Jie Gan wrote:
>>
>>
>> On 6/24/2025 5:59 PM, Jie Gan wrote:
>>> Enable CTCU device for QCS8300 platform. Add a fallback mechnasim in binding to utilize
>>> the compitable of the SA8775p platform becuase the CTCU for QCS8300 shares same
>>> configurations as SA8775p platform.
>>
>> Hi dear maintainers,
>>
>> I just realized it would be more efficient to introduce a common
>> compatible string for SoCs that include two TMC ETR devices.
>>
>> Most of these SoCs share the same CTCU data configuration, such as the
> 
> "Most" basically disqualifies your idea.

Okay, it's not a proper expression.
SoCs included two ETR devices shared same configuration. So I think use 
a common compatible for these SoCs is make sense for me and dont need to 
update the dt-binding again and again...

I will send a new patch to address this idea if it's acceptable.

> 
>> offsets for the ATID and IRQ registers, because they integrate the same
>> version of the CTCU hardware.
>>
>> So I propose introducing a common compatible string,
>> "coresight-ctcu-v2", to simplify the device tree configuration for these
>> platforms.
> 
> This is explained in writing bindings.

Yeah, explained in the code lines..

Thanks,
Jie

> 
> Best regards,
> Krzysztof


