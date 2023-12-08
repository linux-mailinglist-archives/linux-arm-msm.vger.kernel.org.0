Return-Path: <linux-arm-msm+bounces-3958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EDF80A475
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 14:30:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B24BD1F20F9A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 13:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 215AB1CFA0;
	Fri,  8 Dec 2023 13:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KNXJ9Y6M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D62D41995;
	Fri,  8 Dec 2023 05:29:59 -0800 (PST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B8DJNuk010647;
	Fri, 8 Dec 2023 13:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=rFJI3qF/NgEhvJfkmzJzmrVHiqFmZ136XnEiunUsD4I=;
 b=KNXJ9Y6MDYyF0Mfxq3ms+DOj7AGYmD0ktkVrb9lWDPi54vW+IDy54XR4sJr1OapmhVzH
 LMnif64d6g7cBQ5OT/139EHXaRmDzf7PpilATEjJMnBW28a0k86RdWI4lfMtYCto5MJV
 pvyASmxgSIYyc8fIGEtEFRyXK/Iw38/prs0QfWgNCUg0weVo9DX5V3fyMFxqO5UCvSOm
 23plicWpgN4cOw/0bGpS84ae86RVFcAHwxRjMzg/4aYJLJ5j6xqkVQbq+YZkF2Y2S2/c
 3unzy/hqW6/GUI4dWvrjz/Y1pOC1gLNQhmKvNeAv/v5jN2UWnKg44fGUbOcCgoIipW1t fg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uux198nma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 13:29:51 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B8DTorx026027
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Dec 2023 13:29:50 GMT
Received: from [10.50.44.194] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 8 Dec
 2023 05:29:46 -0800
Message-ID: <190651ad-6aeb-69eb-89c5-ed18221b5a7a@quicinc.com>
Date: Fri, 8 Dec 2023 18:59:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 05/17] scsi: ufs: qcom: Remove the warning message when
 core_reset is not available
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <martin.petersen@oracle.com>, <jejb@linux.ibm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_cang@quicinc.com>, <ahalaney@redhat.com>
References: <20231208065902.11006-1-manivannan.sadhasivam@linaro.org>
 <20231208065902.11006-6-manivannan.sadhasivam@linaro.org>
 <7472fe73-e7a0-5c8c-6e85-655db028a5c3@quicinc.com>
 <20231208102832.GA3008@thinkpad>
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <20231208102832.GA3008@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lf0VLyR-i4eM3lHs9nlh1Q6enrc3WsVw
X-Proofpoint-ORIG-GUID: lf0VLyR-i4eM3lHs9nlh1Q6enrc3WsVw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_07,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312080112



On 12/8/2023 3:58 PM, Manivannan Sadhasivam wrote:
> On Fri, Dec 08, 2023 at 02:55:21PM +0530, Nitin Rawat wrote:
>>
>>
>> On 12/8/2023 12:28 PM, Manivannan Sadhasivam wrote:
>>> core_reset is optional, so there is no need to warn the user if it is not
>>> available.
>>>
>>> Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
>>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>> ---
>>>    drivers/ufs/host/ufs-qcom.c | 4 +---
>>>    1 file changed, 1 insertion(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>>> index dc93b1c5ca74..d474de0739e4 100644
>>> --- a/drivers/ufs/host/ufs-qcom.c
>>> +++ b/drivers/ufs/host/ufs-qcom.c
>>> @@ -296,10 +296,8 @@ static int ufs_qcom_host_reset(struct ufs_hba *hba)
>>>    	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>>>    	bool reenable_intr;
>>> -	if (!host->core_reset) {
>>> -		dev_warn(hba->dev, "%s: reset control not set\n", __func__);
>>> +	if (!host->core_reset)
>>>    		return 0;
>>> -	}
>>>    	reenable_intr = hba->is_irq_enabled;
>>>    	disable_irq(hba->irq);
>>
>>
>> Hi Mani,
>>
>> I think core reset is not frequent. It happen during only probe ,error
>> handler.
>>
>> core reset is needed in kernel to cleanup UFS phy and controller
>> configuration before UFS HLOS operation starts as per HPG.
>>
> 
> This sounds like core reset is not an optional property but a required one. I
> just checked the upstream DT files for all SoCs, and looks like pretty much all
> of them support core reset.
> 
> Only MSM8996 doesn't have the reset property, but the reset is available in GCC.
> So we should be able to use it in dtsi.
> 
> I also skimmed through the HPG and looks like core reset is not optional. Please
> confirm.
> 
> - Mani


Hi Mani,

Yes Core_reset is part of HPG sequence and is needed.

Regards,
Nitin


> 
>> Having existing warn print can be used to to debug or atleast know
>> core_reset is missed in device tree to give indication complete reset hasn't
>> been done and we could still be operating in bootloader configuration.
>>
>>
>> Regards,
>> Nitin
>>
> 

