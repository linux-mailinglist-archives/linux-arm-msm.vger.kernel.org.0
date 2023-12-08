Return-Path: <linux-arm-msm+bounces-3906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8472809F99
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 10:39:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 805A41F2159F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 09:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86C18125CE;
	Fri,  8 Dec 2023 09:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Qap8WeWJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A08828E;
	Fri,  8 Dec 2023 01:39:27 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B89SGhD002936;
	Fri, 8 Dec 2023 09:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=K+knPPXNQpzYP4zps31BoCsqwPGV2DcWwsw+dVvYV9E=;
 b=Qap8WeWJW6HAw131h7G0bTMPTAliu25ppr88Za9rkBKzyJfN+N0M3cAdr9zDs26irxaL
 JF8SQS8154koOgfrRhptkj4thvicy1j1rw/7OoUJUf0p+YUD4LPbGd5houfJ59jn4ONi
 GHrkB/d3TxBlaQojH3fHLnkccAOpKOrFsl6qFzafOKpkN1CwmeH70c1ZjS7UXUzPdGt3
 LK36JAPn9NZsnCyi8RJJQq9e0DFj29KhONzHyfQ6rexjPOwnVJiGzLqBIq1bhOFAFgIK
 J6kVk1T+QdKgXPvzz5Dk1ZaUGb29UtUldCbbXYGryuGtkOEbCK+KwXnNOUGnQ/Ae63Z6 lg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uu928kd67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 09:39:21 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B89dJLD016371
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Dec 2023 09:39:19 GMT
Received: from [10.50.44.194] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 8 Dec
 2023 01:39:15 -0800
Message-ID: <331d2288-382a-9abb-fd3a-d0973b8542af@quicinc.com>
Date: Fri, 8 Dec 2023 15:09:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 09/17] scsi: ufs: qcom: Remove redundant error print
 for devm_kzalloc() failure
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        <martin.petersen@oracle.com>, <jejb@linux.ibm.com>
CC: <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_cang@quicinc.com>,
        <ahalaney@redhat.com>
References: <20231208065902.11006-1-manivannan.sadhasivam@linaro.org>
 <20231208065902.11006-10-manivannan.sadhasivam@linaro.org>
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <20231208065902.11006-10-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: v0pp7oH1URjfLvc7qoHUaqL--_qr-otF
X-Proofpoint-GUID: v0pp7oH1URjfLvc7qoHUaqL--_qr-otF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_04,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312080078



On 12/8/2023 12:28 PM, Manivannan Sadhasivam wrote:
> devm_kzalloc() will itself print the error message on failure. So let's get
> rid of the redundant error message in ufs_qcom_init().
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>   drivers/ufs/host/ufs-qcom.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index b141dd2a9346..05a9a25bc34c 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -1109,10 +1109,8 @@ static int ufs_qcom_init(struct ufs_hba *hba)
>   	struct ufs_clk_info *clki;
>   
>   	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
> -	if (!host) {
> -		dev_err(dev, "%s: no memory for qcom ufs host\n", __func__);
> +	if (!host)
>   		return -ENOMEM;
> -	}
>   
>   	/* Make a two way bind between the qcom host and the hba */
>   	host->hba = hba;

Reviewed-by: Nitin Rawat <quic_nitirawa@quicinc.com>

