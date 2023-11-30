Return-Path: <linux-arm-msm+bounces-2660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A927C7FEA58
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 09:20:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D57191C209FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 08:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA5C21E517;
	Thu, 30 Nov 2023 08:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DckYJDVE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96706D50;
	Thu, 30 Nov 2023 00:20:17 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AU608HW006448;
	Thu, 30 Nov 2023 08:19:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=CFr8q8JGPSUgsIAWzotT9fOS873jpyhDs4xuFKlAlqg=;
 b=DckYJDVEgmqMptZxKw8WQ2BqD+g+Ki+JLPF+GcBG/drU9F7fU5byqaIA5kzRUdYAKKTn
 CpoLqMup3oYthEtjNVlSOs0sNc+KLSBXACF83ONEGlRc58OwstRtLu0DQumzhpnVvvyY
 P83VpFNVqfRpeQ6yst0LZB9vELIgcGdXsLwkU/bPVZutD0IxGrXHnRBNLv5c8Dh2ov+1
 k6LfkGwHD2p9xu+PfCXALYk6O2BvQHCizwIMvfnZSrskd4fWAhWy/3DvxiGJAz/MCeGJ
 N2GE0ngmdbYUNNraGJYCPdbvD35BPXdoX7b+ydfOpFyMAkkFHP/YwZhW2nE1iCdYiFGG eA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3upjsqrnwb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 08:19:58 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AU8Jvgi011676
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 08:19:57 GMT
Received: from [10.253.11.15] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 30 Nov
 2023 00:19:54 -0800
Message-ID: <0124c9da-3179-476a-9a92-71f85a62fd17@quicinc.com>
Date: Thu, 30 Nov 2023 16:19:52 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/10] scsi: ufs: ufs-qcom: Check return value of
 phy_set_mode_ext()
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
 <1701246516-11626-10-git-send-email-quic_cang@quicinc.com>
 <20231130071617.GH3043@thinkpad>
From: Can Guo <quic_cang@quicinc.com>
In-Reply-To: <20231130071617.GH3043@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jZd8v2KZZOkkB7v_qQ1KILXqpP1pgwYF
X-Proofpoint-ORIG-GUID: jZd8v2KZZOkkB7v_qQ1KILXqpP1pgwYF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-30_06,2023-11-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311300061



On 11/30/2023 3:16 PM, Manivannan Sadhasivam wrote:
> On Wed, Nov 29, 2023 at 12:28:34AM -0800, Can Guo wrote:
>> In ufs_qcom_power_up_sequence(), check return value of phy_set_mode_ext()
>> and stop proceeding if phy_set_mode_ext() fails.
>>
>> Signed-off-by: Can Guo <quic_cang@quicinc.com>
>> ---
>>   drivers/ufs/host/ufs-qcom.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>> index 30f4ca6..9c0ebbc 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -475,7 +475,12 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
>>   		return ret;
>>   	}
>>   
>> -	phy_set_mode_ext(phy, mode, host->phy_gear);
>> +	ret = phy_set_mode_ext(phy, mode, host->phy_gear);
>> +	if (ret) {
>> +		dev_err(hba->dev, "%s: phy set mode failed, ret = %d\n",
>> +			__func__, ret);
> 
> No need to print the error message here as it is already done in the PHY driver.
> 
> Also, this patch should come before the PHY patch returning error.

Sure.

Thanks,
Can Guo.

> 
> - Mani
> 
>> +		goto out_disable_phy;
>> +	}
>>   
>>   	/* power on phy - start serdes and phy's power and clocks */
>>   	ret = phy_power_on(phy);
>> -- 
>> 2.7.4
>>
>>
> 

