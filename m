Return-Path: <linux-arm-msm+bounces-63931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D58AFB476
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 15:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9AD867AA7A1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 13:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D89BC293C7C;
	Mon,  7 Jul 2025 13:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UQCbAwFr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100A128934D;
	Mon,  7 Jul 2025 13:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751894681; cv=none; b=FBzgzRfICgwRHV651WTOKAz0DeYiFYEaSWWijpHFM+vedAjE1ptASJLwE4V0B/NNEcD+pS5sJAGcInp1ADva+cpmdRpjKMEwrueCaP8Yj+HGajHkHpX9wAeT1R9pvV8GQO4vvjQKU/lcjOEmh6p+IUoxoKcxQMMlVya1Hmwo/4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751894681; c=relaxed/simple;
	bh=HQ8ugpKvFicWAFnFH6pCynQtxCYEUf91MRmd69HRp1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Sgy0TWM4P/FSEpxOyKU96jHY4DsM8AGaw4ojJ5/VthFiIBOW7ailQVxATlDfY4qnjN78u1vL6Pqvb5z4YY06nPt2gtbvMC1rIgEdw+MxkcgSEJkb5bl+NBnJjo5E/0Kff+pGIWeiStwnLgXXtpfypNcm0SHV1yn4eDzORvBohfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UQCbAwFr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56798hkr023655;
	Mon, 7 Jul 2025 13:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sua7USQNBjanjipk7bMSQOIKdbetUUl77PdhQGmFdZs=; b=UQCbAwFrUYvJa9lx
	yy9slGKxK3EJqejQtO2h94psf0cOvBwXtrbGBQJ4p2QCi18Mwwt0NoPa857S1be4
	x0+TKASm9cY1P9lTiqcFTk8qb+dDS7dF+F4ejR/TWMXI2/pxaPdvTZhe2p3db8Js
	HE5037IbBnSYWJKr4fK+RHDNdvWrqB+zz8+NnUVdgedqU1IC/2093bal1KZ104Dh
	pBdm6lSYIOfS63BK8TS9j/KuK7zKXYBo1yOcVMpJhmRQSHP+Y3h48sUefuZKLReq
	XBSAXha5XGT2+Rlpvo4ttHy8HVF49CaQgqZjWWwBsOdgLaXU5gAhNI4CXpWHElQ8
	TwWXgQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu0w5cxv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 13:24:30 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 567DOT3Z014871
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Jul 2025 13:24:29 GMT
Received: from [10.218.7.247] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 7 Jul
 2025 06:24:26 -0700
Message-ID: <6980c961-9f95-4471-9f8e-658f5c7f1648@quicinc.com>
Date: Mon, 7 Jul 2025 18:54:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qcom-qmp-ufs: Fix HS-G4 PHY init table for sc7280
To: Xilin Wu <sophon@radxa.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Manish Pandey <quic_mapa@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250613-sc7280-ufsphy-g4-fix-v1-1-1bf60744f5ac@radxa.com>
 <o2chuy22dls3y3bsjke34z7pnyzap6m4m34tjxswueshulii4d@d5lbcragrbjb>
 <9588D2722C1F010D+51f41c36-856d-4dda-9f30-226c2f772f2c@radxa.com>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <9588D2722C1F010D+51f41c36-856d-4dda-9f30-226c2f772f2c@radxa.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SmUYIJv14QmIff6cJmkl0QlZ6jnrqTxc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA3OCBTYWx0ZWRfX7ceLMJ0dSRLM
 TuZvOf+W7HKKpeCUj0GkiJBaZNXjQnqL7ISsGXF6hqLoGKosf4jUnnzpgRaraZSnjlq0SVFDzZ6
 QZ1WVxqFzF4PYiL0LTZ0QpRtwIF81hdzuWALRl+6I4dJqWcvMz/3hHQpTypjh8yfmfKFID1pY+S
 Li9QPBmDx/g8WWxxfx7BKhQltBtKKn+6TW8SgtQZddiFAlyOHsNgaI3Qzm3BSWjm0TY2spEDXKy
 hMNmoOfHLVHGYpV/Q37kPk3CBVIl4G5VypIe7EfjXaEAiIgqzrL14g55DyKGds8e6TZ+QXl3Afq
 JJzq43QcP3Zg3pfW8cz0Cqv05W0cvA16ogqLU2yRRFYbJqm7G/kRZ/e6FIkQI7296DuL6iSMxUV
 KeYaS0DWs+n2P9gwXw5s1iyowO7PrQdIjELsgoVB0NKCRjxP7pbwAAghYs41a4s+6eqv0sO/
X-Authority-Analysis: v=2.4 cv=Rd2QC0tv c=1 sm=1 tr=0 ts=686bca8e cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=ksxQWNrZAAAA:8 a=oqyW6cpqeoKVbJuktMwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: SmUYIJv14QmIff6cJmkl0QlZ6jnrqTxc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070078



On 7/5/2025 6:56 PM, Xilin Wu wrote:
> On 2025/7/5 21:06:56, Dmitry Baryshkov wrote:
>> On Fri, Jun 13, 2025 at 10:41:48PM +0800, Xilin Wu wrote:
>>> The PHY is limited to operating in HS-G3 mode during the initial PCS
>>> registers initialization. Extra PHY init sequence is required to allow
>>> HS-G4 mode to work when needed.
>>
>> I can't find corresponding settings in either of HPGs.
>>
> 
> I believe there was a mistake when initially adding support for sc7280 
> UFS PHY based on downstream code. In downstream [1] the 
> HSGEAR_CAPABILITY registers are programmed to 0x3 **only** when Gear 4 
> is not needed, while the current upstream driver always writes to this 
> register regardless of the UFS Gear. [2]


Hi Xilin, Dmitry

The SC7280 is based on the SM8150 for gear 3 and the SM8250 for gear 4. 
The sm8150_ufsphy_hs_g4_pcs table is identical for both the SM8250 and 
SM8150, and is used for gear 4 settings for sc7180, SM8250 and SM8150.

Additionally, the current code applies tbls table by default for all 
gears. We need a separate overlay table for gear3 similar to overlay 
tables 0 and 1 for gear 4 and gear 5, respectively.

For settings specific to gear 3, such as 
QPHY_V4_PCS_UFS_TX_PWM_GEAR_BAND and 
QPHY_V4_PCS_UFS_RX_HSGEAR_CAPABILITY, we can include them in the overlay 
table for gear 3.





> 
> I don't have access to the HPGs. The Gear4 specific init sequence is 
> found in the Qualcomm proprietary UEFI driver code.
> 
> [1]:https://github.com/NothingOSS/android_kernel_msm-5.4_nothing_sm7325/ 
> blob/sm7325/s/drivers/phy/qualcomm/phy-qcom-ufs-qmp-v4-yupik.h#L355
> 
> [2]: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux- 
> next.git/tree/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c#n215
> 
>>>
>>> Fixes: 8abe9792d1ff ("phy: qcom-qmp-ufs: Add Phy Configuration 
>>> support for SC7280")
>>> Signed-off-by: Xilin Wu <sophon@radxa.com>
>>> ---
>>> This might need testing on sm8150, sm8250 and sc8180x as well.
>>> ---
>>>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/ 
>>> qualcomm/phy-qcom-qmp-ufs.c
>>> index 
>>> b33e2e2b5014d3ca8f19b623ba080887f53e616d..7797be329d75f95c80863e05351d0cf55fdf38c2 100644
>>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>>> @@ -570,6 +570,13 @@ static const struct qmp_phy_init_tbl 
>>> sm8150_ufsphy_pcs[] = {
>>>   static const struct qmp_phy_init_tbl sm8150_ufsphy_hs_g4_pcs[] = {
>>>       QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TX_LARGE_AMP_DRV_LVL, 0x10),
>>> +    QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_PLL_CNTL, 0x0b),
>>> +    QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TIMER_20US_CORECLK_STEPS_MSB, 
>>> 0x2d),
>>> +    QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TIMER_20US_CORECLK_STEPS_LSB, 
>>> 0xb0),
>>> +    QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TX_PWM_GEAR_BAND, 0xff),
>>> +    QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TX_HS_GEAR_BAND, 0x1b),
>>> +    QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TX_HSGEAR_CAPABILITY, 0x04),
>>> +    QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_RX_HSGEAR_CAPABILITY, 0x04),
>>>       QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_BIST_FIXED_PAT_CTRL, 0x0a),

There setting are not mention in UFS PHY HPG.

Regards,
Nitin

>>>   };
>>>
>>> ---
>>> base-commit: bc6e0ba6c9bafa6241b05524b9829808056ac4ad
>>> change-id: 20250613-sc7280-ufsphy-g4-fix-024542f31fac
>>>
>>> Best regards,
>>> -- 
>>> Xilin Wu <sophon@radxa.com>
>>>
>>
> 
> 


