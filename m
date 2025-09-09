Return-Path: <linux-arm-msm+bounces-72821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C779B5006F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 16:59:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00A257A83A0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 14:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D40E3350822;
	Tue,  9 Sep 2025 14:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L7eij+so"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD762D12EF;
	Tue,  9 Sep 2025 14:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757429940; cv=none; b=GZlwEfI4iQRGu/ukpzDZbY05T1+3cuSfMLSsebAdLAq+0eXAVzFxckG9tSZ7AE0A9LGMHYRg5d7ysiAdhLiPEeE/pSvbvguGOeUYl6KhOslWY/mEaJp/Atdv6E9DloDkaR9MbCEG1djIyakdXNAJ76WEfO1oZmmhyzGmPQN/VkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757429940; c=relaxed/simple;
	bh=cjdn7VbZxOpdQpAZR63R9vFc/Xn9IYqx8CPE3BnXKHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=E4yhYiD6m8KKHRuuFDIu2VqICHYQr12GVzKsAgJ4vgD8HNECPrJUNj3tygIR+SC+tC84eTKVCCtycHqUZ9AxbzPuhfc0qWIGDqS6cHaEZPmD3vkQj1Ze0L67FzBIDJikDmLX+gUqKKlM+vCicz2okrMcNowqOwpJmjS40M00ZOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L7eij+so; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LetS030639;
	Tue, 9 Sep 2025 14:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	geacO2rPMEn/m7/+s5Y2GL28fQ02JCyDJCoYffayuu4=; b=L7eij+soiWlAsj0L
	HvIOvAhux894xkFmVBXtMVbIxGvS+qzwOXbZ+vZOdGd+cusSGH11Eb2QAXRuJD2a
	KF7K/1PFcs/E8YDttU1F5OhHaAG3wmx1HAGguUaFl1PVeISlatETUSlRcGD8VLq7
	wJkarSTlg9yVCM1G7++9GGfGA7hKhgtNyoMCPkSvLWsJichyv4rdR2Hg3xzpOXOJ
	tZc1jK+UPObsdwncx7OnirwVYmfhSH72qtcpexoiOKfiKc2zozv5X7gKFI1uOfN6
	u9BWaVxu7PTrdN+AcIwv13wnjeTmMR06XTrvS/NF27y+mcnCt8i1quNTMKaVubCA
	X6giig==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9j8p73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 14:58:47 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 589EwkFc021976
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Sep 2025 14:58:46 GMT
Received: from [10.218.4.141] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Tue, 9 Sep
 2025 07:58:41 -0700
Message-ID: <2360f9f8-470d-46dc-be9e-660bb1580428@quicinc.com>
Date: Tue, 9 Sep 2025 20:28:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 1/4] ufs: dt-bindings: Document gear and rate limit
 properties
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mani@kernel.org>, <James.Bottomley@hansenpartnership.com>,
        <martin.petersen@oracle.com>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20250902164900.21685-1-quic_rdwivedi@quicinc.com>
 <20250902164900.21685-2-quic_rdwivedi@quicinc.com>
 <20250903-sincere-brass-rhino-19f61a@kuoka>
Content-Language: en-US
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <20250903-sincere-brass-rhino-19f61a@kuoka>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfX4hP+jPTA37Jz
 WODU7frHFtzpgHtBYZqabRhz0mDI77w8Z7aBKoSu801PisT74N2/FIqrUVgPPcJU14jIn3FitJR
 blabdiiD/J/APcwtll/HktrW9jpov8IEwink7iCX86m/MT3GHeF+5Op0+jh0rThv5lYWsnD/Lvz
 IQKgBlQwKn3ntMZYqCOl8WMaeCEaV4xwf8oCiDc4pXx6Cu58z+bkgv1gnupwalphvwwuZy/x/FI
 yYpazHwOV0/MaErZyMRDulFvgTqFebtroghBkINkhIUmj8EcOFpnGwYPm9PJlhlMN/DowvqHAsM
 iacC4zrFAqyQ+83b2SDYC1PQ7wJ+9v+QCwILsnAscCyzU1G77LNyrSyHDj30BeK4bRI9tV5pucb
 T6J2BeAX
X-Proofpoint-ORIG-GUID: zhUyxCYwt_RT7yLPirI7rWbfXMwv5TaD
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68c040a7 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=hsxNhXGD_D1a_R53JcAA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: zhUyxCYwt_RT7yLPirI7rWbfXMwv5TaD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022



On 03-Sep-25 12:14 PM, Krzysztof Kozlowski wrote:
> On Tue, Sep 02, 2025 at 10:18:57PM +0530, Ram Kumar Dwivedi wrote:
>> Add optional "limit-hs-gear" and "limit-rate" properties to the
>> UFS controller common binding. These properties allow limiting
>> the maximum HS gear and rate.
>>
>> This is useful in cases where the customer board may have signal
>> integrity, clock configuration or layout issues that prevent reliable
>> operation at higher gears. Such limitations are especially critical in
>> those platforms, where stability is prioritized over peak performance.
>>
>> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>> ---
>>  .../devicetree/bindings/ufs/ufs-common.yaml      | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

Alim has recommended renaming the "limit-rate" property to "limit-gear-rate".
Please let me know if you have any concerns.

Also, may I retain your "Reviewed-by" tag in the next patchset?

Thanks,
Ram.> 
> Best regards,
> Krzysztof
> 


