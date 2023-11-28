Return-Path: <linux-arm-msm+bounces-2257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B73C7FB8CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 12:01:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE83DB20B90
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 11:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29C474642C;
	Tue, 28 Nov 2023 11:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kRn0Fv3U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00E41197;
	Tue, 28 Nov 2023 03:01:46 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AS8uV6g020587;
	Tue, 28 Nov 2023 11:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ZoIcCr3YhoIQ9fBILDnBJ5MRnwlrkEqy5IKc1f/hqUs=;
 b=kRn0Fv3Ut5fv9onx3HROOxd26nEP1irFq1Nk8ZPON+dhIXWMw1lIXzdK/EyDnoABoQqM
 Ki4l2D3akm96wx0k8hNEHS1X4IR8GfHJmb4O1gL6lCfg5zgRMMBF7fnscYlgf1V8PPcw
 pYwwusPVdtN/ObzQXAd/yjYCrjnPnfjGQzuuHJrDr/LuAkHEQICEdERVtjMHvUX+bZPx
 YBuBVv3elw2gIF6nMevW9hrqYHRQ+7MObBIPJauY8lg0oPCp++ODUN5p+Gy1563dzCVD
 R0hWfdzx4164+x0Au/NwCiiU/dbB0sO1abJFHu5g76RXqO5MWuhBsCwW6GPqDIbXK4kK ZQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3un1athsa8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 11:01:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ASB1WBE005998
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 11:01:32 GMT
Received: from [10.253.11.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 28 Nov
 2023 03:01:29 -0800
Message-ID: <19e8a264-dc9f-4303-b5b4-f781b9fd0125@quicinc.com>
Date: Tue, 28 Nov 2023 19:01:27 +0800
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
 <d198f09b-6b5f-42de-9331-30c6d2a12b67@quicinc.com>
 <20231128105902.GP3088@thinkpad>
From: Can Guo <quic_cang@quicinc.com>
In-Reply-To: <20231128105902.GP3088@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UeDho6HUV6BbVhuUSSDT-NdBzjeU-IXC
X-Proofpoint-ORIG-GUID: UeDho6HUV6BbVhuUSSDT-NdBzjeU-IXC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_10,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311280087



On 11/28/2023 6:59 PM, Manivannan Sadhasivam wrote:
> On Tue, Nov 28, 2023 at 03:58:42PM +0800, Can Guo wrote:
>> Hi Mani,
>>
>> On 11/28/2023 2:00 PM, Manivannan Sadhasivam wrote:
>>> On Thu, Nov 23, 2023 at 12:46:27AM -0800, Can Guo wrote:
>>>> Set the initial PHY gear to max HS gear for hosts with HW ver 5 and newer.
>>>>
>>>
>>> MAX_GEAR will be used for hosts with hw_ver.major >= 4
>>
>> I put it > 5 because I am not intent to touch any old targets which has
>> proven working fine with starting with PHY gear HS_G2. If I put it >= 4,
>> there would be many targets impacted by this change. I need to go back and
>> test those platforms (HW ver == 4).
>>
> 
> This assumption will make the code hard to maintain. I think if you happen to
> test it on atleast a couple of old targets it should be good since I do not see
> how others can fail.

Point taken. I will put it >= 4 in next version and test it on platforms 
like SM8350 and SM8450.

Thanks,
Can Guo.

> 
> - Mani
> 
>> Thanks,
>> Can Guo.
>>
>>>
>>>> This patch is not changing any functionalities or logic but only a
>>>> preparation patch for the next patch in this series.
>>>>
>>>> Signed-off-by: Can Guo <quic_cang@quicinc.com>
>>>> ---
>>>>    drivers/ufs/host/ufs-qcom.c | 21 +++++++++++++++------
>>>>    1 file changed, 15 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>>>> index 6756f8d..7bbccf4 100644
>>>> --- a/drivers/ufs/host/ufs-qcom.c
>>>> +++ b/drivers/ufs/host/ufs-qcom.c
>>>> @@ -1067,6 +1067,20 @@ static void ufs_qcom_advertise_quirks(struct ufs_hba *hba)
>>>>    		hba->quirks |= UFSHCD_QUIRK_REINIT_AFTER_MAX_GEAR_SWITCH;
>>>>    }
>>>> +static void ufs_qcom_set_phy_gear(struct ufs_qcom_host *host)
>>>> +{
>>>> +	struct ufs_host_params *host_params = &host->host_params;
>>>> +
>>>> +	host->phy_gear = host_params->hs_tx_gear;
>>>> +
>>>> +	/*
>>>> +	 * Power up the PHY using the minimum supported gear (UFS_HS_G2).
>>>> +	 * Switching to max gear will be performed during reinit if supported.
>>>
>>> You need to reword this comment too.
>>>
>>>> +	 */
>>>> +	if (host->hw_ver.major < 0x5)
>>>
>>> As I mentioned above, MAX_GEAR will be used if hw_ver.major is >=4 in
>>> ufs_qcom_get_hs_gear(). So this check should be (< 0x4).
>>>
>>> - Mani
>>>
>>>> +		host->phy_gear = UFS_HS_G2;
>>>> +}
>>>> +
>>>>    static void ufs_qcom_set_host_params(struct ufs_hba *hba)
>>>>    {
>>>>    	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>>>> @@ -1303,6 +1317,7 @@ static int ufs_qcom_init(struct ufs_hba *hba)
>>>>    	ufs_qcom_set_caps(hba);
>>>>    	ufs_qcom_advertise_quirks(hba);
>>>>    	ufs_qcom_set_host_params(hba);
>>>> +	ufs_qcom_set_phy_gear(host);
>>>>    	err = ufs_qcom_ice_init(host);
>>>>    	if (err)
>>>> @@ -1320,12 +1335,6 @@ static int ufs_qcom_init(struct ufs_hba *hba)
>>>>    		dev_warn(dev, "%s: failed to configure the testbus %d\n",
>>>>    				__func__, err);
>>>> -	/*
>>>> -	 * Power up the PHY using the minimum supported gear (UFS_HS_G2).
>>>> -	 * Switching to max gear will be performed during reinit if supported.
>>>> -	 */
>>>> -	host->phy_gear = UFS_HS_G2;
>>>> -
>>>>    	return 0;
>>>>    out_variant_clear:
>>>> -- 
>>>> 2.7.4
>>>>
>>>
> 

