Return-Path: <linux-arm-msm+bounces-3467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 880C6805A02
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 17:33:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 475A51F2175D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 16:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98149675D6;
	Tue,  5 Dec 2023 16:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NSBm1zuO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78EF4194;
	Tue,  5 Dec 2023 08:33:52 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B5Esvo1012355;
	Tue, 5 Dec 2023 16:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=bektZohZZ1JiKi/f+qNYt+kGxWD44tNbUlJmqoXgg44=;
 b=NSBm1zuOWrM+tGTnAPsPZDi8Pr/mCGBFSXqXuAFtduOZC1oznGmOZUrxpcvb65jxi/LL
 CQIqatleRIOA20muRBKIZ5sDZpHgfo7bjwsV215divEczAb1DEA1lW7wgE+6YTEaetL6
 84X17MOzV9lZaGNKY50dm+ouIYbDmeQC9+WMODKdrkOwGBBoXjxbjDeJfAtzsWuZIRYu
 Ai98Q0KHU01RE/uh3kunRCkj11GIfMum3YV7EyL/fERfXH4TsxB5YMpD7j6BM6wHVPUf
 Ky1HpwUSPfp3ngySZTBsfhhLYHv6K7wgYBkK8iSX/ng0zpa8nPXldgIRj9bdJ1PQxX+y AA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3usmw02axs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Dec 2023 16:33:44 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B5GXhKD014137
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Dec 2023 16:33:43 GMT
Received: from [10.50.1.19] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 5 Dec
 2023 08:33:35 -0800
Message-ID: <ad241353-e6ad-d57f-6c71-888a484ba721@quicinc.com>
Date: Tue, 5 Dec 2023 22:03:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 13/13] scsi: ufs: qcom: Initialize cycles_in_1us variable
 in ufs_qcom_set_core_clk_ctrl()
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        <martin.petersen@oracle.com>, <jejb@linux.ibm.com>
CC: <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_cang@quicinc.com>
References: <20231201151417.65500-1-manivannan.sadhasivam@linaro.org>
 <20231201151417.65500-14-manivannan.sadhasivam@linaro.org>
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <20231201151417.65500-14-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6yzes2jpIIah30QhFlUTiiJR9Z25wCxM
X-Proofpoint-GUID: 6yzes2jpIIah30QhFlUTiiJR9Z25wCxM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-05_11,2023-12-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 mlxscore=0 mlxlogscore=999 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2312050130



On 12/1/2023 8:44 PM, Manivannan Sadhasivam wrote:
> In case the "core_clk_unipro" clock is not provided, "cycles_in_1us"
> variable will be used as uninitialized. So initialize it with 0.
> 
> Issue reported by Smatch tool:
> 
> drivers/ufs/host/ufs-qcom.c:1336 ufs_qcom_set_core_clk_ctrl() error: uninitialized symbol 'cycles_in_1us'.
> drivers/ufs/host/ufs-qcom.c:1341 ufs_qcom_set_core_clk_ctrl() error: uninitialized symbol 'cycles_in_1us'.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>   drivers/ufs/host/ufs-qcom.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 590a2c67cf7d..208543a62d43 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -1296,7 +1296,7 @@ static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, bool is_scale_up)
>   	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>   	struct list_head *head = &hba->clk_list_head;
>   	struct ufs_clk_info *clki;
> -	u32 cycles_in_1us;
> +	u32 cycles_in_1us = 0;
>   	u32 core_clk_ctrl_reg;
>   	int err;
>   

Reviewed-by: Nitin Rawat <quic_nitirawa@quicinc.com>

