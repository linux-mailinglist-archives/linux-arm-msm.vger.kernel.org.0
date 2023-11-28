Return-Path: <linux-arm-msm+bounces-2197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE547FB367
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 08:59:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D15D1C20A69
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 07:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A804413FEA;
	Tue, 28 Nov 2023 07:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BDiPfUU2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7DEC98;
	Mon, 27 Nov 2023 23:59:11 -0800 (PST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AS6GqE8001089;
	Tue, 28 Nov 2023 07:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=iP4D1xc8qjOBWc18n0ipl4FCtPM7EFhZSPIDx8Ekxhk=;
 b=BDiPfUU2RMhctcIXaJbw5B2AMsTuGrtKM7+UiQz3hViKlg0ktB63NNVNVDGgn33ApBT2
 1fDEdK7mTUhEH4ImeVBFqgLLzraMRlHw6UT2TNX4JgfN+eY14SB3eEYYKThU/GwbgfNe
 50WVPCTw5U9OuDkeTGbJamnxc9siBc6BDIBjhqJodAs1/EGZJBKg8hYj5mptB0VelLLX
 jPU1/t75DS/ljMLwjc46d5d2YpR17PBrxW7i+KMO1nBHmWiKGPTri9qGxbrAddHEmjWV
 2OXAFjrq8noGCDXyoqceKcNk8xyHrZuOSDdlV7r2PShly/4be8i/QPtvjRcD4EoldG0z vw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3umt4qjrwr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 07:58:49 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AS7wmWH023979
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 07:58:48 GMT
Received: from [10.253.11.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 27 Nov
 2023 23:58:45 -0800
Message-ID: <d198f09b-6b5f-42de-9331-30c6d2a12b67@quicinc.com>
Date: Tue, 28 Nov 2023 15:58:42 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/10] scsi: ufs: ufs-qcom: Set initial PHY gear to max
 HS gear for HW ver 5 and newer
Content-Language: en-US
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <bvanassche@acm.org>, <adrian.hunter@intel.com>, <beanhuo@micron.com>,
        <avri.altman@wdc.com>, <junwoo80.lee@samsung.com>,
        <martin.petersen@oracle.com>, <linux-scsi@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn
 Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        open list
	<linux-kernel@vger.kernel.org>
References: <1700729190-17268-1-git-send-email-quic_cang@quicinc.com>
 <1700729190-17268-8-git-send-email-quic_cang@quicinc.com>
 <20231128060046.GH3088@thinkpad>
From: Can Guo <quic_cang@quicinc.com>
In-Reply-To: <20231128060046.GH3088@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9qe8RAQpKU5XAiM3wLaKj1tHqJi6QOzm
X-Proofpoint-GUID: 9qe8RAQpKU5XAiM3wLaKj1tHqJi6QOzm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_06,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311280061

Hi Mani,

On 11/28/2023 2:00 PM, Manivannan Sadhasivam wrote:
> On Thu, Nov 23, 2023 at 12:46:27AM -0800, Can Guo wrote:
>> Set the initial PHY gear to max HS gear for hosts with HW ver 5 and newer.
>>
> 
> MAX_GEAR will be used for hosts with hw_ver.major >= 4

I put it > 5 because I am not intent to touch any old targets which has 
proven working fine with starting with PHY gear HS_G2. If I put it >= 4, 
there would be many targets impacted by this change. I need to go back 
and test those platforms (HW ver == 4).

Thanks,
Can Guo.

> 
>> This patch is not changing any functionalities or logic but only a
>> preparation patch for the next patch in this series.
>>
>> Signed-off-by: Can Guo <quic_cang@quicinc.com>
>> ---
>>   drivers/ufs/host/ufs-qcom.c | 21 +++++++++++++++------
>>   1 file changed, 15 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>> index 6756f8d..7bbccf4 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -1067,6 +1067,20 @@ static void ufs_qcom_advertise_quirks(struct ufs_hba *hba)
>>   		hba->quirks |= UFSHCD_QUIRK_REINIT_AFTER_MAX_GEAR_SWITCH;
>>   }
>>   
>> +static void ufs_qcom_set_phy_gear(struct ufs_qcom_host *host)
>> +{
>> +	struct ufs_host_params *host_params = &host->host_params;
>> +
>> +	host->phy_gear = host_params->hs_tx_gear;
>> +
>> +	/*
>> +	 * Power up the PHY using the minimum supported gear (UFS_HS_G2).
>> +	 * Switching to max gear will be performed during reinit if supported.
> 
> You need to reword this comment too.
> 
>> +	 */
>> +	if (host->hw_ver.major < 0x5)
> 
> As I mentioned above, MAX_GEAR will be used if hw_ver.major is >=4 in
> ufs_qcom_get_hs_gear(). So this check should be (< 0x4).
> 
> - Mani
> 
>> +		host->phy_gear = UFS_HS_G2;
>> +}
>> +
>>   static void ufs_qcom_set_host_params(struct ufs_hba *hba)
>>   {
>>   	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>> @@ -1303,6 +1317,7 @@ static int ufs_qcom_init(struct ufs_hba *hba)
>>   	ufs_qcom_set_caps(hba);
>>   	ufs_qcom_advertise_quirks(hba);
>>   	ufs_qcom_set_host_params(hba);
>> +	ufs_qcom_set_phy_gear(host);
>>   
>>   	err = ufs_qcom_ice_init(host);
>>   	if (err)
>> @@ -1320,12 +1335,6 @@ static int ufs_qcom_init(struct ufs_hba *hba)
>>   		dev_warn(dev, "%s: failed to configure the testbus %d\n",
>>   				__func__, err);
>>   
>> -	/*
>> -	 * Power up the PHY using the minimum supported gear (UFS_HS_G2).
>> -	 * Switching to max gear will be performed during reinit if supported.
>> -	 */
>> -	host->phy_gear = UFS_HS_G2;
>> -
>>   	return 0;
>>   
>>   out_variant_clear:
>> -- 
>> 2.7.4
>>
> 

