Return-Path: <linux-arm-msm+bounces-2655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CFE7FE9EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 08:49:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF5C71C20860
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 07:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D10520DC2;
	Thu, 30 Nov 2023 07:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GEsXeYep"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B71851A3;
	Wed, 29 Nov 2023 23:49:47 -0800 (PST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AU5xK0R001015;
	Thu, 30 Nov 2023 07:49:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=yvqvx5ZXXmbPnljimpZq97cMptAIaEhfTTf8X22A5pg=;
 b=GEsXeYepRTbmwpkBhMFGn+VgdPZl+wE0EZhkJpBH1AWEuvnOfJhrJj0FyOjV0Pgq33xB
 A00IVNSOObjV/X16ZN847ePk/Hv73C8f8uHMUCn4C5aCBrX/e4H1+qafzMuyzT4UDa/Y
 mvQ1cpjMUU4vEFYMCWJPxzlREYWb93ZxBM5pBouOwxqYzcxtHy++f2acEoQSK5lFqkeV
 TKgnlXO+Miizjdd788q6sNONooejyNhn8TPl+TNovf1ajyDYxAjXTSopaVsYP8M22U8u
 HbflKwVC7E4O5J5LrTxDMdlxqwJGZc+FgBp05vONXLw7R9BP7TcxgBjUJLXoLCYgJLSw JQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3up4cfaqpa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 07:49:10 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AU7n8Fs000544
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 07:49:08 GMT
Received: from [10.253.11.15] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 29 Nov
 2023 23:49:05 -0800
Message-ID: <22a49deb-001d-4fa2-83e1-0fe6c7fe2a2e@quicinc.com>
Date: Thu, 30 Nov 2023 15:49:03 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/10] scsi: ufs: ufs-qcom: Set initial PHY gear to max
 HS gear for HW ver 4 and newer
Content-Language: en-US
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <bvanassche@acm.org>, <adrian.hunter@intel.com>, <cmd4@qualcomm.com>,
        <beanhuo@micron.com>, <avri.altman@wdc.com>,
        <junwoo80.lee@samsung.com>, <martin.petersen@oracle.com>,
        <linux-scsi@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn
 Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        open list
	<linux-kernel@vger.kernel.org>
References: <1701246516-11626-1-git-send-email-quic_cang@quicinc.com>
 <1701246516-11626-7-git-send-email-quic_cang@quicinc.com>
 <20231130064757.GF3043@thinkpad>
From: Can Guo <quic_cang@quicinc.com>
In-Reply-To: <20231130064757.GF3043@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NFwkfCEgPSvr7K-s6BB-UAXSrKYY2Mt9
X-Proofpoint-ORIG-GUID: NFwkfCEgPSvr7K-s6BB-UAXSrKYY2Mt9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-30_05,2023-11-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311300056



On 11/30/2023 2:47 PM, Manivannan Sadhasivam wrote:
> On Wed, Nov 29, 2023 at 12:28:31AM -0800, Can Guo wrote:
>> Since HW ver 4, max HS gear can be get from UFS host controller's register,
>> use the max HS gear as the initial PHY gear instead of UFS_HS_G2, so that
>> we don't need to update the hard code for newer targets in future.
>>
>> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> 
> One comment below. With that addressed,
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
>> ---
>>   drivers/ufs/host/ufs-qcom.c | 21 +++++++++++++++------
>>   1 file changed, 15 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>> index aca6199..30f4ca6 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -1060,6 +1060,20 @@ static void ufs_qcom_advertise_quirks(struct ufs_hba *hba)
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
> As I mentioned in v5, you need to reword this comment to make it clear we are
> setting G2 only for platforms < v4. Something like below:
> 
> "For controllers whose major version is < 4, power up the PHY using minimum
> supported gear (UFS_HS_G2). Switching to max gear will be performed during
> reinit if supported. For newer controllers (>= 4), PHY will be powered up using
> max supported gear."

Sorry that I missed this one, will add in next version.

Thanks,
Can Guo.

> 
> - Mani
> 
>> +	 */
>> +	if (host->hw_ver.major < 0x4)
>> +		host->phy_gear = UFS_HS_G2;
>> +}
>> +
>>   static void ufs_qcom_set_host_params(struct ufs_hba *hba)
>>   {
>>   	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>> @@ -1296,6 +1310,7 @@ static int ufs_qcom_init(struct ufs_hba *hba)
>>   	ufs_qcom_set_caps(hba);
>>   	ufs_qcom_advertise_quirks(hba);
>>   	ufs_qcom_set_host_params(hba);
>> +	ufs_qcom_set_phy_gear(host);
>>   
>>   	err = ufs_qcom_ice_init(host);
>>   	if (err)
>> @@ -1313,12 +1328,6 @@ static int ufs_qcom_init(struct ufs_hba *hba)
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
>>
> 

