Return-Path: <linux-arm-msm+bounces-67260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C38B174F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 18:29:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 719141C2519F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 16:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E1D623B63A;
	Thu, 31 Jul 2025 16:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ot1mp1qY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526D123644F;
	Thu, 31 Jul 2025 16:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753979374; cv=none; b=ZDZZPKnk6fjhmHSFtJ1dE5UcmuHXr0XL/IryiEL2kW5HCK9efuSQ9EIRBPbFqUD2LxqUEM1+f2Z2XYkgkPQ26WLapgG9c4pgJg6JUF4oCjMNIvLOceuFobQcuiL95Fiqif3KEtuvpSf3H/sAfiwJwmfpgBM5z1hdEJ8B8AkEgSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753979374; c=relaxed/simple;
	bh=vKL5U2DuIlQbjy/hCD5SpVP6L/eRe5/QM71h52CL5cg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=a8DW/lpXYVJkW0kocm+asV7qrfu0oHUOn5bAY0FnHJmBIbX+vAzHULH9ScA9ZaBl4eecQ4Ckq+Z3/vUjJpLZyqAkvZf3a6NuNxisyVC8wCOBb5ods65PDy2IGJcBf7A89ACA6Sx0kw1j4X9bugsjTQpU6agtR1c/fTAcYhkDW08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ot1mp1qY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56VDfBg7002656;
	Thu, 31 Jul 2025 16:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F7fSOC5NGRdm58lTQT+Jp6QnesT9vNuVe0m36cgxa3Y=; b=Ot1mp1qYIi9BNUbS
	saQ6g4l55UG9JObTjjfDutmy7MIIoewf2n0so+IGYfGtROH+yMdH8nc4ycL6tcF4
	DtdOCCpU6o5r7hStsLnoy3MGMLvslkZR2fHDSxnw5Xu9v1WU2WDbXvJn1WvtZqjs
	mgpc2Se71WzC/WlTxc9GmHm/l2g/h775GUrvzOuVZ9CaWZaasqC878+b1CUKrtS5
	w6eHJmibn7d3+lQ1M1wx8ZBxlE57zphU1ww3OHxeZDU0ViJKVytcnWxIzKQRRsLm
	udazDMkuTN1X70pZ4veLtVQzL01tfWmUvr76ABCKm/cIlL/LxnHmlnABn1tmURRD
	A7Uylg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbm8b4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Jul 2025 16:29:18 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56VGTHmI013822
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Jul 2025 16:29:17 GMT
Received: from [10.218.4.141] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 31 Jul
 2025 09:29:06 -0700
Message-ID: <728cde88-1601-4c36-976a-3c934a64be35@quicinc.com>
Date: Thu, 31 Jul 2025 21:58:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ufs: ufs-qcom: Add support for DT-based gear and rate
 limiting
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <mani@kernel.org>, <alim.akhtar@samsung.com>, <avri.altman@wdc.com>,
        <bvanassche@acm.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <James.Bottomley@hansenpartnership.com>,
        <martin.petersen@oracle.com>, <agross@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250722161103.3938-1-quic_rdwivedi@quicinc.com>
 <20250722161103.3938-2-quic_rdwivedi@quicinc.com>
 <2ihbf52nryduic5vzlqdldzgx2fe4zidt4hzcugurqsuosiawq@qs66zxptpmqf>
 <f61ac7b6-5e63-49cb-b051-a749037e0c8b@quicinc.com>
 <CAO9ioeWLLW1UgJfByBAXp9-v81AqmRV9Acs5Eae9k4Gkr1U0MA@mail.gmail.com>
Content-Language: en-US
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <CAO9ioeWLLW1UgJfByBAXp9-v81AqmRV9Acs5Eae9k4Gkr1U0MA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=688b99de cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=qQr2RFovwkE9AH--SVwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDExMyBTYWx0ZWRfXy6ub6NIzriiC
 cHvBF6NJHUsdkDiRQAMqt1aARNkSLVbyJBgcxL2TFx++NcmubagFjly6WM5pqCSE0VNAlGGU/ex
 dzC79Lh2j26rPFcOnhZ67JGIWA1jlFoIecK26+xKEodZEQn73c51HYmd3NFGLgIO7nayopvqkWj
 F3hV+ICcPUT05T8ZLuhX6pLqpnuDyMJjV9rNpT2GD2bqYTsEOaHi0xyaeWwogLFIZPpscxMsan4
 7DJshW1+P60xRQINHSnmv8n5tAXYs4K7WSUtkOtt7+C3eEsbjLg7Oy4gaH3Lmquy/+FQFZYQsl9
 +ffWguX9NK0olvjWCghR1eaotJyT9w2Um+v+qnnYCClzd9WfdLjEUtAdcOlDoVdd3/fOYo/SQc6
 SKBhUCxTdVCRVBqJJU26/7gtu5z/r/ooOEk19zHGL6Rqfl0jo++WjRaZFe9UpwyZnDIZ4YXK
X-Proofpoint-ORIG-GUID: m6XdNrw0RQVI-QyB-C5IcaKH8HoCfByD
X-Proofpoint-GUID: m6XdNrw0RQVI-QyB-C5IcaKH8HoCfByD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_03,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507310113



On 24-Jul-25 2:11 PM, Dmitry Baryshkov wrote:
> On Thu, 24 Jul 2025 at 10:35, Ram Kumar Dwivedi
> <quic_rdwivedi@quicinc.com> wrote:
>>
>>
>>
>> On 23-Jul-25 12:24 AM, Dmitry Baryshkov wrote:
>>> On Tue, Jul 22, 2025 at 09:41:01PM +0530, Ram Kumar Dwivedi wrote:
>>>> Add optional device tree properties to limit Tx/Rx gear and rate during UFS
>>>> initialization. Parse these properties in ufs_qcom_init() and apply them to
>>>> host->host_params to enforce platform-specific constraints.
>>>>
>>>> Use this mechanism to cap the maximum gear or rate on platforms with
>>>> hardware limitations, such as those required by some automotive customers
>>>> using SA8155. Preserve the default behavior if the properties are not
>>>> specified in the device tree.
>>>>
>>>> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>>>> ---
>>>>  drivers/ufs/host/ufs-qcom.c | 28 ++++++++++++++++++++++------
>>>>  1 file changed, 22 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>>>> index 4bbe4de1679b..5e7fd3257aca 100644
>>>> --- a/drivers/ufs/host/ufs-qcom.c
>>>> +++ b/drivers/ufs/host/ufs-qcom.c
>>>> @@ -494,12 +494,8 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
>>>>       * If the HS-G5 PHY gear is used, update host_params->hs_rate to Rate-A,
>>>>       * so that the subsequent power mode change shall stick to Rate-A.
>>>>       */
>>>> -    if (host->hw_ver.major == 0x5) {
>>>> -            if (host->phy_gear == UFS_HS_G5)
>>>> -                    host_params->hs_rate = PA_HS_MODE_A;
>>>> -            else
>>>> -                    host_params->hs_rate = PA_HS_MODE_B;
>>>> -    }
>>>> +    if (host->hw_ver.major == 0x5 && host->phy_gear == UFS_HS_G5)
>>>> +            host_params->hs_rate = PA_HS_MODE_A;
>>>
>>> Why? This doesn't seem related.
>>
>> Hi Dmitry,
>>
>> I have refactored the patch to put this part in a separate patch in latest patchset.
>>
>> Thanks,
>> Ram.
>>
>>>
>>>>
>>>>      mode = host_params->hs_rate == PA_HS_MODE_B ? PHY_MODE_UFS_HS_B : PHY_MODE_UFS_HS_A;
>>>>
>>>> @@ -1096,6 +1092,25 @@ static void ufs_qcom_set_phy_gear(struct ufs_qcom_host *host)
>>>>      }
>>>>  }
>>>>
>>>> +static void ufs_qcom_parse_limits(struct ufs_qcom_host *host)
>>>> +{
>>>> +    struct ufs_host_params *host_params = &host->host_params;
>>>> +    struct device_node *np = host->hba->dev->of_node;
>>>> +    u32 hs_gear, hs_rate = 0;
>>>> +
>>>> +    if (!np)
>>>> +            return;
>>>> +
>>>> +    if (!of_property_read_u32(np, "limit-hs-gear", &hs_gear)) {
>>>
>>> These are generic properties, so they need to be handled in a generic
>>> code path.
>>
>> Hi Dmitry,
>>
>>
>> Below is the probe path for the UFS-QCOM platform driver:
>>
>> ufs_qcom_probe
>>   └─ ufshcd_platform_init
>>        └─ ufshcd_init
>>             └─ ufs_qcom_init
>>                  └─ ufs_qcom_set_host_params
>>                       └─ ufshcd_init_host_params (initialized with default values)
>>                            └─ ufs_qcom_get_hs_gear (overrides gear based on controller capability)
>>                                 └─ ufs_qcom_set_phy_gear (further overrides based on controller limitations)
>>
>>
>> The reason I added the logic in ufs-qcom.c is that even if it's placed in ufshcd-platform.c, the values get overridden in ufs-qcom.c.
>> If you prefer, I can move the parsing logic API to ufshcd-platform.c but still it needs to be called from ufs-qcom.c.
> 
> I was thinking about ufshcd_init() or similar function.
Hi Dmitry,

It appears we can't move the logic to ufshcd.c because the PHY is initialized in ufs-qcom.c, and the gear must be set during that initialization.

Limiting the gear and lane in ufshcd.c won’t be effective, as qcom_init sets the PHY to the maximum supported gear by default. As a result, the PHY would still initialize with the max gear, defeating the purpose of the limits.

To ensure the PHY is initialized with the intended gear, the limits needs to be applied directly in ufs_qcom.c

Please let me know if you have any concerns.

Thanks,
Ram.


> 
>>
>> Thanks,
>> Ram.
>>
>>
>>>
>>> Also, the patch with bindings should preceed driver and DT changes.
>>
>> Hi Dmitry,
>>
>> I have reordered the patch series to place the DT binding change as the first patch in latest patchset.
>>
>> Thanks,
>> Ram.
>>
>>
>>>
>>>> +            host_params->hs_tx_gear = hs_gear;
>>>> +            host_params->hs_rx_gear = hs_gear;
>>>> +            host->phy_gear = hs_gear;
>>>> +    }
>>>> +
>>>> +    if (!of_property_read_u32(np, "limit-rate", &hs_rate))
>>>> +            host_params->hs_rate = hs_rate;
>>>> +}
>>>> +
>>>>  static void ufs_qcom_set_host_params(struct ufs_hba *hba)
>>>>  {
>>>>      struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>>>> @@ -1337,6 +1352,7 @@ static int ufs_qcom_init(struct ufs_hba *hba)
>>>>      ufs_qcom_advertise_quirks(hba);
>>>>      ufs_qcom_set_host_params(hba);
>>>>      ufs_qcom_set_phy_gear(host);
>>>> +    ufs_qcom_parse_limits(host);
>>>>
>>>>      err = ufs_qcom_ice_init(host);
>>>>      if (err)
>>>> --
>>>> 2.50.1
>>>>
>>>
>>
> 
> 


