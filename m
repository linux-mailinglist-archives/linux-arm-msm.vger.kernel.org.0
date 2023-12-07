Return-Path: <linux-arm-msm+bounces-3620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 433028082FB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 09:28:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6147B21AD8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 08:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11C7A2E3E5;
	Thu,  7 Dec 2023 08:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="h1knb0uM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ED81C6;
	Thu,  7 Dec 2023 00:27:58 -0800 (PST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B74L0iX026050;
	Thu, 7 Dec 2023 08:27:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=OZttxZ0n9Ra2ayT7XfdvTE9o2dO1FxgotmSAwwngVlM=;
 b=h1knb0uMJ5QBmvZeeUq55JPDi0Sdvk95OyFlFcixqq2zENZfjpyb1YAaowZTI6ayeeXA
 O2hmhQXL6QfxLFvFVZd3v01JBYB0yNtNaoocXrZ0/yeKoJ6tLh+7yM8FFwhVh8BBobc+
 qSs1AB6ffuulVnNhQDE8h/KwoVP2L2IGh9ssOPCcIRrb9WI1SAvVcNHC9HmQJgKgEtfS
 QMN2jwuOJh1jTzVWuYLMNqA7XkFli//ijiw8buMrtA3rdS0Ztc/hhq8VVvvQBnno/tQX
 v72qqpyZ9AjUjDFvaMW+yN+u+vVXarBnZ1guJRNL6JmnG4n4w3Cy6DXdghSe4tQ1M2Jw HA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3utdebc728-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Dec 2023 08:27:52 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B78RpE1001291
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Dec 2023 08:27:51 GMT
Received: from [10.218.45.181] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 7 Dec
 2023 00:27:47 -0800
Message-ID: <518ad165-7250-4be5-cf1b-ced8aebfcd84@quicinc.com>
Date: Thu, 7 Dec 2023 13:57:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 08/13] scsi: ufs: qcom: Check the return value of
 ufs_qcom_power_up_sequence()
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        <martin.petersen@oracle.com>, <jejb@linux.ibm.com>
CC: <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_cang@quicinc.com>
References: <20231201151417.65500-1-manivannan.sadhasivam@linaro.org>
 <20231201151417.65500-9-manivannan.sadhasivam@linaro.org>
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <20231201151417.65500-9-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: w22p1FvjLBKHq6oDlUCgAk4CvXEKTEMF
X-Proofpoint-GUID: w22p1FvjLBKHq6oDlUCgAk4CvXEKTEMF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-07_06,2023-12-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 clxscore=1015 spamscore=0
 mlxlogscore=886 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312070067



On 12/1/2023 8:44 PM, Manivannan Sadhasivam wrote:
> If ufs_qcom_power_up_sequence() fails, then it makes no sense to enable
> the lane clocks and continue ufshcd_hba_enable(). So let's check the return
> value of ufs_qcom_power_up_sequence().
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>   drivers/ufs/host/ufs-qcom.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 4948dd732aae..e4dd3777a4d4 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -415,7 +415,10 @@ static int ufs_qcom_hce_enable_notify(struct ufs_hba *hba,
>   
>   	switch (status) {
>   	case PRE_CHANGE:
> -		ufs_qcom_power_up_sequence(hba);
> +		err = ufs_qcom_power_up_sequence(hba);
> +		if (err)
> +			return err;
> +
>   		/*
>   		 * The PHY PLL output is the source of tx/rx lane symbol
>   		 * clocks, hence, enable the lane clocks only after PHY


Reviewed-by: Nitin Rawat <quic_nitirawa@quicinc.com>

