Return-Path: <linux-arm-msm+bounces-2182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAF07FB11A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 06:16:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DD87B20F18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 05:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0253748F;
	Tue, 28 Nov 2023 05:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b36F17bw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6FDC1AD;
	Mon, 27 Nov 2023 21:16:30 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AS4Ku2h010017;
	Tue, 28 Nov 2023 05:16:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=w44XPQJG8whRuOhW52t2ddCYVfQ6vovk0yt3lNVpZVk=;
 b=b36F17bwsSrA5xP4Mvjd5chliyfj3R/QXAwFqeSfKIr6SlD2krYJ9DW+Hv6iqvqBi7oe
 tP70sJaIwIKrasO+G8WWXl1lI+uAtOVp3xQ+G07CJMTSUpV0Gdl42Ih5j1qQxhhA6cRA
 BtWV3lc6edawK4atV1s8AQlWZJbIpp9mXVF7tVxsIfmzi6kaLYHSuDr/haecPAPu2bn6
 hARpOa22i4qBFUjmfKIAFvopFd3exLMUaDawBjfdq2OXmXGq4822SzRnC3jV0R1LHpuu
 +o7frgTxYOAlNm6tLjRJ3Mo1+CUNk9wmmfiP041vdYluN6nny8nvKBmFKjDky9G23CD1 Mg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3umrqq2j4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 05:16:00 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AS5FxvH030238
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 05:15:59 GMT
Received: from [10.50.30.106] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 27 Nov
 2023 21:15:53 -0800
Message-ID: <93319f31-56fc-9a2e-287e-db22286b4125@quicinc.com>
Date: Tue, 28 Nov 2023 10:45:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v5 06/10] scsi: ufs: ufs-qcom: Limit HS-G5 Rate-A to hosts
 with HW version 5
Content-Language: en-US
To: Can Guo <quic_cang@quicinc.com>, <bvanassche@acm.org>, <mani@kernel.org>,
        <adrian.hunter@intel.com>, <beanhuo@micron.com>, <avri.altman@wdc.com>,
        <junwoo80.lee@samsung.com>, <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Andy Gross
	<agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "open list" <linux-kernel@vger.kernel.org>
References: <1700729190-17268-1-git-send-email-quic_cang@quicinc.com>
 <1700729190-17268-7-git-send-email-quic_cang@quicinc.com>
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <1700729190-17268-7-git-send-email-quic_cang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: veZrweu3bBHu7n9IOchXX3FtZhglKBxr
X-Proofpoint-GUID: veZrweu3bBHu7n9IOchXX3FtZhglKBxr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_03,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 spamscore=0 mlxlogscore=976 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311280039



On 11/23/2023 2:16 PM, Can Guo wrote:
> Qcom UFS hosts, with HW ver 5, can only support up to HS-G5 Rate-A due to
> HW limitations. If the HS-G5 PHY gear is used, update host_params->hs_rate
> to Rate-A, so that the subsequent power mode changes shall stick to Rate-A.
> 
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> ---
>   drivers/ufs/host/ufs-qcom.c | 18 +++++++++++++++++-
>   1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 9613ad9..6756f8d 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -442,9 +442,25 @@ static u32 ufs_qcom_get_hs_gear(struct ufs_hba *hba)
>   static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
>   {
>   	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> +	struct ufs_host_params *host_params = &host->host_params;
>   	struct phy *phy = host->generic_phy;
> +	enum phy_mode mode;
>   	int ret;
>   
> +	/*
> +	 * HW ver 5 can only support up to HS-G5 Rate-A due to HW limitations.
> +	 * If the HS-G5 PHY gear is used, update host_params->hs_rate to Rate-A,
> +	 * so that the subsequent power mode change shall stick to Rate-A.
> +	 */
> +	if (host->hw_ver.major == 0x5) {
> +		if (host->phy_gear == UFS_HS_G5)
> +			host_params->hs_rate = PA_HS_MODE_A;
> +		else
> +			host_params->hs_rate = PA_HS_MODE_B;
> +	}
> +
> +	mode = host_params->hs_rate == PA_HS_MODE_B ? PHY_MODE_UFS_HS_B : PHY_MODE_UFS_HS_A;
> +
>   	/* Reset UFS Host Controller and PHY */
>   	ret = ufs_qcom_host_reset(hba);
>   	if (ret)
> @@ -459,7 +475,7 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
>   		return ret;
>   	}
>   
> -	phy_set_mode_ext(phy, PHY_MODE_UFS_HS_B, host->phy_gear);
> +	phy_set_mode_ext(phy, mode, host->phy_gear);
>   
>   	/* power on phy - start serdes and phy's power and clocks */
>   	ret = phy_power_on(phy);

Reviewed-by: Nitin Rawat <quic_nitirawa@quicinc.com>

