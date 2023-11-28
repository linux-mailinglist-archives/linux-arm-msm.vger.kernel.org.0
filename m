Return-Path: <linux-arm-msm+bounces-2181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 216E27FB110
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 06:07:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 422F81C20A4B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 05:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C1EDD29A;
	Tue, 28 Nov 2023 05:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lRh1I0xz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 892371A1;
	Mon, 27 Nov 2023 21:07:27 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AS4ogaO009256;
	Tue, 28 Nov 2023 05:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=rTorXwx9wRIzEf1bgNEltR5+EBcNvvu6cixspUhxeag=;
 b=lRh1I0xzh3NAK7FwisgpY9IlHGhUWkboGtHMSGJ+qdSfrNoRpLLppAYTOQL+GNyMPCtF
 6HD5VTG344sM4XDD45vEd2j/vPrnAnhbBK6MZ36lHLU+iXVo4HdGzCps48y7AOt8nN54
 +iLBXjbeEPW6PESdXKlALGvLoqo6p+8cXEHW4CXOHfmE8hB3X7VVU8igS+kGGHDtCY+q
 eMeDZ8INka6wkKl/0heVL8fXyBWG9TxfmIvKrBnBOdPVE9MgCgBtVsxcvkVjOLkPpNdL
 cv01v7dL6vghRf/sR9Nr/GD0Oh9Y7GXGJTpC3ydBBW4XYNb5IlHFYuLaJ4A8c24MWUZe Hg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3umqxh2mek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 05:07:07 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AS576RL023527
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 05:07:06 GMT
Received: from [10.50.30.106] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 27 Nov
 2023 21:07:00 -0800
Message-ID: <47bf5549-56fc-0e00-6095-0b699691658e@quicinc.com>
Date: Tue, 28 Nov 2023 10:36:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v5 03/10] scsi: ufs: ufs-qcom: Setup host power mode
 during init
Content-Language: en-US
To: Can Guo <quic_cang@quicinc.com>, <bvanassche@acm.org>, <mani@kernel.org>,
        <adrian.hunter@intel.com>, <beanhuo@micron.com>, <avri.altman@wdc.com>,
        <junwoo80.lee@samsung.com>, <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        "Bao D .
 Nguyen" <quic_nguyenb@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        open list
	<linux-kernel@vger.kernel.org>
References: <1700729190-17268-1-git-send-email-quic_cang@quicinc.com>
 <1700729190-17268-4-git-send-email-quic_cang@quicinc.com>
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <1700729190-17268-4-git-send-email-quic_cang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: i7wWER3cnYTLMLtMf1bTWYaU_8O7qjUw
X-Proofpoint-ORIG-GUID: i7wWER3cnYTLMLtMf1bTWYaU_8O7qjUw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_03,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 clxscore=1011 phishscore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311280038



On 11/23/2023 2:16 PM, Can Guo wrote:
> Setup host power mode and its limitations during UFS host driver init to
> avoid repetitive work during every power mode change.
> 
> Acked-by: Andrew Halaney <ahalaney@redhat.com>
> Co-developed-by: Bao D. Nguyen <quic_nguyenb@quicinc.com>
> Signed-off-by: Bao D. Nguyen <quic_nguyenb@quicinc.com>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> ---
>   drivers/ufs/host/ufs-qcom.c | 21 ++++++++++++++-------
>   drivers/ufs/host/ufs-qcom.h |  1 +
>   2 files changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index cc30ad9..cc0eb37 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -898,7 +898,7 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
>   				struct ufs_pa_layer_attr *dev_req_params)
>   {
>   	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> -	struct ufs_host_params host_params;
> +	struct ufs_host_params *host_params = &host->host_params;
>   	int ret = 0;
>   
>   	if (!dev_req_params) {
> @@ -908,12 +908,7 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
>   
>   	switch (status) {
>   	case PRE_CHANGE:
> -		ufshcd_init_host_param(&host_params);
> -
> -		/* This driver only supports symmetic gear setting i.e., hs_tx_gear == hs_rx_gear */
> -		host_params.hs_tx_gear = host_params.hs_rx_gear = ufs_qcom_get_hs_gear(hba);
> -
> -		ret = ufshcd_negotiate_pwr_param(&host_params, dev_max_params, dev_req_params);
> +		ret = ufshcd_negotiate_pwr_param(host_params, dev_max_params, dev_req_params);
>   		if (ret) {
>   			dev_err(hba->dev, "%s: failed to determine capabilities\n",
>   					__func__);
> @@ -1048,6 +1043,17 @@ static void ufs_qcom_advertise_quirks(struct ufs_hba *hba)
>   		hba->quirks |= UFSHCD_QUIRK_REINIT_AFTER_MAX_GEAR_SWITCH;
>   }
>   
> +static void ufs_qcom_set_host_params(struct ufs_hba *hba)
> +{
> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> +	struct ufs_host_params *host_params = &host->host_params;
> +
> +	ufshcd_init_host_param(host_params);
> +
> +	/* This driver only supports symmetic gear setting i.e., hs_tx_gear == hs_rx_gear */
> +	host_params->hs_tx_gear = host_params->hs_rx_gear = ufs_qcom_get_hs_gear(hba);
> +}
> +
>   static void ufs_qcom_set_caps(struct ufs_hba *hba)
>   {
>   	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> @@ -1272,6 +1278,7 @@ static int ufs_qcom_init(struct ufs_hba *hba)
>   
>   	ufs_qcom_set_caps(hba);
>   	ufs_qcom_advertise_quirks(hba);
> +	ufs_qcom_set_host_params(hba);
>   
>   	err = ufs_qcom_ice_init(host);
>   	if (err)
> diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
> index 82cd143..11419eb 100644
> --- a/drivers/ufs/host/ufs-qcom.h
> +++ b/drivers/ufs/host/ufs-qcom.h
> @@ -238,6 +238,7 @@ struct ufs_qcom_host {
>   
>   	struct gpio_desc *device_reset;
>   
> +	struct ufs_host_params host_params;
>   	u32 phy_gear;
>   
>   	bool esi_enabled;

Reviewed-by: Nitin Rawat <quic_nitirawa@quicinc.com>

