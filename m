Return-Path: <linux-arm-msm+bounces-2188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF347FB144
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 06:32:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D47BB20F52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 05:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D4E2EACF;
	Tue, 28 Nov 2023 05:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NxsIPCYo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F95F1B8;
	Mon, 27 Nov 2023 21:32:29 -0800 (PST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AS5DsIV028615;
	Tue, 28 Nov 2023 05:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=4KtQCCKK58dFVDswWJpKZLffA0J7W0Qj8kUzlL5PIxw=;
 b=NxsIPCYoHXSVS9a2kLsgGTgHCfW+T09emuCCu9770Z/wArEIU4hEdG3zK2fuUo+M1Um7
 QKxZnyropEBPlyT+bFjOiAN9PtclsSJlDDGOB9DULGBc1b3p8uT+3/1jqR0cmhCbuMcK
 Qsx9PVPbhzz0si1kxLvFiOwl6bVn5KhbKWkGL4uEN6BZG1WME8KuxL1799Po2Xuu+o07
 G/mxSzCl+6h7zAwL+C2nWfbC8C9zmTYgjgYbaHcyFbxzMBVlsWSF3GAE5j0kgzyhhQvN
 iUk6aX/8W/HIRlelCrHwKHjjp9ihbCliCvpSE51jDduam4i6D0jHE9jJ3NOcbN7mR2ZE Rw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3un586rj4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 05:31:48 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AS5VHni018948
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 05:31:17 GMT
Received: from [10.50.30.106] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 27 Nov
 2023 21:31:07 -0800
Message-ID: <d614a89f-0c46-7920-7d09-3db15498bf86@quicinc.com>
Date: Tue, 28 Nov 2023 11:01:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v5 01/10] scsi: ufs: host: Rename structure ufs_dev_params
 to ufs_host_params
Content-Language: en-US
To: Can Guo <quic_cang@quicinc.com>, <bvanassche@acm.org>, <mani@kernel.org>,
        <adrian.hunter@intel.com>, <beanhuo@micron.com>, <avri.altman@wdc.com>,
        <junwoo80.lee@samsung.com>, <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Alim Akhtar
	<alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stanley Chu
	<stanley.chu@mediatek.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Matthias
 Brugger" <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Andrew Halaney
	<ahalaney@redhat.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
	<u.kleine-koenig@pengutronix.de>,
        Brian Masney <bmasney@redhat.com>,
        "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
	<linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/SAMSUNG S3C, S5P AND
 EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>,
        open list
	<linux-kernel@vger.kernel.org>,
        "moderated list:UNIVERSAL FLASH STORAGE HOST
 CONTROLLER DRIVER..." <linux-mediatek@lists.infradead.org>
References: <1700729190-17268-1-git-send-email-quic_cang@quicinc.com>
 <1700729190-17268-2-git-send-email-quic_cang@quicinc.com>
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <1700729190-17268-2-git-send-email-quic_cang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VmG-THo9cajFnBcIN7nZsEe424L6Cu-3
X-Proofpoint-GUID: VmG-THo9cajFnBcIN7nZsEe424L6Cu-3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_04,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 impostorscore=0
 adultscore=0 mlxscore=0 phishscore=0 suspectscore=0 clxscore=1011
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311280041



On 11/23/2023 2:16 PM, Can Guo wrote:
> Structure ufs_dev_params is actually used in UFS host vendor drivers to
> declare host specific power mode parameters, like ufs_<vendor>_params or
> host_cap, which makes the code not very straightforward to read. Rename the
> structure ufs_dev_params to ufs_host_params and unify the declarations in
> all vendor drivers to host_params.
> 
> In addition, rename the two functions ufshcd_init_pwr_dev_param() and
> ufshcd_get_pwr_dev_param() which work based on the ufs_host_params to
> ufshcd_init_host_param() and ufshcd_negotiate_pwr_param() respectively to
> avoid confusions.
> 
> This change does not change any functionalities or logic.
> 
> Acked-by: Andrew Halaney <ahalaney@redhat.com>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> ---
>   drivers/ufs/host/ufs-exynos.c    |  7 ++--
>   drivers/ufs/host/ufs-hisi.c      | 11 +++----
>   drivers/ufs/host/ufs-mediatek.c  | 12 +++----
>   drivers/ufs/host/ufs-qcom.c      | 12 +++----
>   drivers/ufs/host/ufshcd-pltfrm.c | 69 ++++++++++++++++++++--------------------
>   drivers/ufs/host/ufshcd-pltfrm.h | 10 +++---
>   6 files changed, 57 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
> index 71bd6db..674f2f4 100644
> --- a/drivers/ufs/host/ufs-exynos.c
> +++ b/drivers/ufs/host/ufs-exynos.c
> @@ -765,7 +765,7 @@ static int exynos_ufs_pre_pwr_mode(struct ufs_hba *hba,
>   {
>   	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
>   	struct phy *generic_phy = ufs->phy;
> -	struct ufs_dev_params ufs_exynos_cap;
> +	struct ufs_host_params host_params;
>   	int ret;
>   
>   	if (!dev_req_params) {
> @@ -774,10 +774,9 @@ static int exynos_ufs_pre_pwr_mode(struct ufs_hba *hba,
>   		goto out;
>   	}
>   
> -	ufshcd_init_pwr_dev_param(&ufs_exynos_cap);
> +	ufshcd_init_host_param(&host_params);
>   
> -	ret = ufshcd_get_pwr_dev_param(&ufs_exynos_cap,
> -				       dev_max_params, dev_req_params);
> +	ret = ufshcd_negotiate_pwr_param(&host_params, dev_max_params, dev_req_params);
>   	if (ret) {
>   		pr_err("%s: failed to determine capabilities\n", __func__);
>   		goto out;
> diff --git a/drivers/ufs/host/ufs-hisi.c b/drivers/ufs/host/ufs-hisi.c
> index 0229ac0..bb0c9a7 100644
> --- a/drivers/ufs/host/ufs-hisi.c
> +++ b/drivers/ufs/host/ufs-hisi.c
> @@ -293,9 +293,9 @@ static int ufs_hisi_link_startup_notify(struct ufs_hba *hba,
>   	return err;
>   }
>   
> -static void ufs_hisi_set_dev_cap(struct ufs_dev_params *hisi_param)
> +static void ufs_hisi_set_dev_cap(struct ufs_host_params *host_params)
>   {
> -	ufshcd_init_pwr_dev_param(hisi_param);
> +	ufshcd_init_host_param(host_params);
>   }
>   
>   static void ufs_hisi_pwr_change_pre_change(struct ufs_hba *hba)
> @@ -365,7 +365,7 @@ static int ufs_hisi_pwr_change_notify(struct ufs_hba *hba,
>   				       struct ufs_pa_layer_attr *dev_max_params,
>   				       struct ufs_pa_layer_attr *dev_req_params)
>   {
> -	struct ufs_dev_params ufs_hisi_cap;
> +	struct ufs_host_params host_params;
>   	int ret = 0;
>   
>   	if (!dev_req_params) {
> @@ -377,9 +377,8 @@ static int ufs_hisi_pwr_change_notify(struct ufs_hba *hba,
>   
>   	switch (status) {
>   	case PRE_CHANGE:
> -		ufs_hisi_set_dev_cap(&ufs_hisi_cap);
> -		ret = ufshcd_get_pwr_dev_param(&ufs_hisi_cap,
> -					       dev_max_params, dev_req_params);
> +		ufs_hisi_set_dev_cap(&host_params);
> +		ret = ufshcd_negotiate_pwr_param(&host_params, dev_max_params, dev_req_params);
>   		if (ret) {
>   			dev_err(hba->dev,
>   			    "%s: failed to determine capabilities\n", __func__);
> diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
> index fc61790..016067d 100644
> --- a/drivers/ufs/host/ufs-mediatek.c
> +++ b/drivers/ufs/host/ufs-mediatek.c
> @@ -996,16 +996,14 @@ static int ufs_mtk_pre_pwr_change(struct ufs_hba *hba,
>   				  struct ufs_pa_layer_attr *dev_req_params)
>   {
>   	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
> -	struct ufs_dev_params host_cap;
> +	struct ufs_host_params host_params;
>   	int ret;
>   
> -	ufshcd_init_pwr_dev_param(&host_cap);
> -	host_cap.hs_rx_gear = UFS_HS_G5;
> -	host_cap.hs_tx_gear = UFS_HS_G5;
> +	ufshcd_init_host_param(&host_params);
> +	host_params.hs_rx_gear = UFS_HS_G5;
> +	host_params.hs_tx_gear = UFS_HS_G5;
>   
> -	ret = ufshcd_get_pwr_dev_param(&host_cap,
> -				       dev_max_params,
> -				       dev_req_params);
> +	ret = ufshcd_negotiate_pwr_param(&host_params, dev_max_params, dev_req_params);
>   	if (ret) {
>   		pr_info("%s: failed to determine capabilities\n",
>   			__func__);
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 96cb8b5..aee66a3 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -898,7 +898,7 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
>   				struct ufs_pa_layer_attr *dev_req_params)
>   {
>   	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> -	struct ufs_dev_params ufs_qcom_cap;
> +	struct ufs_host_params host_params;
>   	int ret = 0;
>   
>   	if (!dev_req_params) {
> @@ -908,15 +908,13 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
>   
>   	switch (status) {
>   	case PRE_CHANGE:
> -		ufshcd_init_pwr_dev_param(&ufs_qcom_cap);
> -		ufs_qcom_cap.hs_rate = UFS_QCOM_LIMIT_HS_RATE;
> +		ufshcd_init_host_param(&host_params);
> +		host_params.hs_rate = UFS_QCOM_LIMIT_HS_RATE;
>   
>   		/* This driver only supports symmetic gear setting i.e., hs_tx_gear == hs_rx_gear */
> -		ufs_qcom_cap.hs_tx_gear = ufs_qcom_cap.hs_rx_gear = ufs_qcom_get_hs_gear(hba);
> +		host_params.hs_tx_gear = host_params.hs_rx_gear = ufs_qcom_get_hs_gear(hba);
>   
> -		ret = ufshcd_get_pwr_dev_param(&ufs_qcom_cap,
> -					       dev_max_params,
> -					       dev_req_params);
> +		ret = ufshcd_negotiate_pwr_param(&host_params, dev_max_params, dev_req_params);
>   		if (ret) {
>   			dev_err(hba->dev, "%s: failed to determine capabilities\n",
>   					__func__);
> diff --git a/drivers/ufs/host/ufshcd-pltfrm.c b/drivers/ufs/host/ufshcd-pltfrm.c
> index da2558e..9ec11b9 100644
> --- a/drivers/ufs/host/ufshcd-pltfrm.c
> +++ b/drivers/ufs/host/ufshcd-pltfrm.c
> @@ -285,61 +285,60 @@ static int ufshcd_parse_operating_points(struct ufs_hba *hba)
>   }
>   
>   /**
> - * ufshcd_get_pwr_dev_param - get finally agreed attributes for
> - *                            power mode change
> - * @pltfrm_param: pointer to platform parameters
> + * ufshcd_negotiate_pwr_param - find power mode settings that are supported by
> +				both the controller and the device
> + * @host_param: pointer to host parameters
>    * @dev_max: pointer to device attributes
>    * @agreed_pwr: returned agreed attributes
>    *
>    * Return: 0 on success, non-zero value on failure.
>    */
> -int ufshcd_get_pwr_dev_param(const struct ufs_dev_params *pltfrm_param,
> -			     const struct ufs_pa_layer_attr *dev_max,
> -			     struct ufs_pa_layer_attr *agreed_pwr)
> +int ufshcd_negotiate_pwr_param(const struct ufs_host_params *host_param,
> +			       const struct ufs_pa_layer_attr *dev_max,
> +			       struct ufs_pa_layer_attr *agreed_pwr)
>   {
> -	int min_pltfrm_gear;
> +	int min_host_gear;
>   	int min_dev_gear;
>   	bool is_dev_sup_hs = false;
> -	bool is_pltfrm_max_hs = false;
> +	bool is_host_max_hs = false;
>   
>   	if (dev_max->pwr_rx == FAST_MODE)
>   		is_dev_sup_hs = true;
>   
> -	if (pltfrm_param->desired_working_mode == UFS_HS_MODE) {
> -		is_pltfrm_max_hs = true;
> -		min_pltfrm_gear = min_t(u32, pltfrm_param->hs_rx_gear,
> -					pltfrm_param->hs_tx_gear);
> +	if (host_param->desired_working_mode == UFS_HS_MODE) {
> +		is_host_max_hs = true;
> +		min_host_gear = min_t(u32, host_param->hs_rx_gear,
> +					host_param->hs_tx_gear);
>   	} else {
> -		min_pltfrm_gear = min_t(u32, pltfrm_param->pwm_rx_gear,
> -					pltfrm_param->pwm_tx_gear);
> +		min_host_gear = min_t(u32, host_param->pwm_rx_gear,
> +					host_param->pwm_tx_gear);
>   	}
>   
>   	/*
> -	 * device doesn't support HS but
> -	 * pltfrm_param->desired_working_mode is HS,
> -	 * thus device and pltfrm_param don't agree
> +	 * device doesn't support HS but host_param->desired_working_mode is HS,
> +	 * thus device and host_param don't agree
>   	 */
> -	if (!is_dev_sup_hs && is_pltfrm_max_hs) {
> +	if (!is_dev_sup_hs && is_host_max_hs) {
>   		pr_info("%s: device doesn't support HS\n",
>   			__func__);
>   		return -ENOTSUPP;
> -	} else if (is_dev_sup_hs && is_pltfrm_max_hs) {
> +	} else if (is_dev_sup_hs && is_host_max_hs) {
>   		/*
>   		 * since device supports HS, it supports FAST_MODE.
> -		 * since pltfrm_param->desired_working_mode is also HS
> +		 * since host_param->desired_working_mode is also HS
>   		 * then final decision (FAST/FASTAUTO) is done according
>   		 * to pltfrm_params as it is the restricting factor
>   		 */
> -		agreed_pwr->pwr_rx = pltfrm_param->rx_pwr_hs;
> +		agreed_pwr->pwr_rx = host_param->rx_pwr_hs;
>   		agreed_pwr->pwr_tx = agreed_pwr->pwr_rx;
>   	} else {
>   		/*
> -		 * here pltfrm_param->desired_working_mode is PWM.
> +		 * here host_param->desired_working_mode is PWM.
>   		 * it doesn't matter whether device supports HS or PWM,
> -		 * in both cases pltfrm_param->desired_working_mode will
> +		 * in both cases host_param->desired_working_mode will
>   		 * determine the mode
>   		 */
> -		agreed_pwr->pwr_rx = pltfrm_param->rx_pwr_pwm;
> +		agreed_pwr->pwr_rx = host_param->rx_pwr_pwm;
>   		agreed_pwr->pwr_tx = agreed_pwr->pwr_rx;
>   	}
>   
> @@ -349,9 +348,9 @@ int ufshcd_get_pwr_dev_param(const struct ufs_dev_params *pltfrm_param,
>   	 * the same decision will be made for rx
>   	 */
>   	agreed_pwr->lane_tx = min_t(u32, dev_max->lane_tx,
> -				    pltfrm_param->tx_lanes);
> +				    host_param->tx_lanes);
>   	agreed_pwr->lane_rx = min_t(u32, dev_max->lane_rx,
> -				    pltfrm_param->rx_lanes);
> +				    host_param->rx_lanes);
>   
>   	/* device maximum gear is the minimum between device rx and tx gears */
>   	min_dev_gear = min_t(u32, dev_max->gear_rx, dev_max->gear_tx);
> @@ -364,26 +363,26 @@ int ufshcd_get_pwr_dev_param(const struct ufs_dev_params *pltfrm_param,
>   	 * what is the gear, as it is the one that also decided previously what
>   	 * pwr the device will be configured to.
>   	 */
> -	if ((is_dev_sup_hs && is_pltfrm_max_hs) ||
> -	    (!is_dev_sup_hs && !is_pltfrm_max_hs)) {
> +	if ((is_dev_sup_hs && is_host_max_hs) ||
> +	    (!is_dev_sup_hs && !is_host_max_hs)) {
>   		agreed_pwr->gear_rx =
> -			min_t(u32, min_dev_gear, min_pltfrm_gear);
> +			min_t(u32, min_dev_gear, min_host_gear);
>   	} else if (!is_dev_sup_hs) {
>   		agreed_pwr->gear_rx = min_dev_gear;
>   	} else {
> -		agreed_pwr->gear_rx = min_pltfrm_gear;
> +		agreed_pwr->gear_rx = min_host_gear;
>   	}
>   	agreed_pwr->gear_tx = agreed_pwr->gear_rx;
>   
> -	agreed_pwr->hs_rate = pltfrm_param->hs_rate;
> +	agreed_pwr->hs_rate = host_param->hs_rate;
>   
>   	return 0;
>   }
> -EXPORT_SYMBOL_GPL(ufshcd_get_pwr_dev_param);
> +EXPORT_SYMBOL_GPL(ufshcd_negotiate_pwr_param);
>   
> -void ufshcd_init_pwr_dev_param(struct ufs_dev_params *dev_param)
> +void ufshcd_init_host_param(struct ufs_host_params *host_param)
>   {
> -	*dev_param = (struct ufs_dev_params){
> +	*host_param = (struct ufs_host_params){
>   		.tx_lanes = UFS_LANE_2,
>   		.rx_lanes = UFS_LANE_2,
>   		.hs_rx_gear = UFS_HS_G3,
> @@ -398,7 +397,7 @@ void ufshcd_init_pwr_dev_param(struct ufs_dev_params *dev_param)
>   		.desired_working_mode = UFS_HS_MODE,
>   	};
>   }
> -EXPORT_SYMBOL_GPL(ufshcd_init_pwr_dev_param);
> +EXPORT_SYMBOL_GPL(ufshcd_init_host_param);
>   
>   /**
>    * ufshcd_pltfrm_init - probe routine of the driver
> diff --git a/drivers/ufs/host/ufshcd-pltfrm.h b/drivers/ufs/host/ufshcd-pltfrm.h
> index a86a3ad..2d4d047 100644
> --- a/drivers/ufs/host/ufshcd-pltfrm.h
> +++ b/drivers/ufs/host/ufshcd-pltfrm.h
> @@ -10,7 +10,7 @@
>   #define UFS_PWM_MODE 1
>   #define UFS_HS_MODE  2
>   
> -struct ufs_dev_params {
> +struct ufs_host_params {
>   	u32 pwm_rx_gear;        /* pwm rx gear to work in */
>   	u32 pwm_tx_gear;        /* pwm tx gear to work in */
>   	u32 hs_rx_gear;         /* hs rx gear to work in */
> @@ -25,10 +25,10 @@ struct ufs_dev_params {
>   	u32 desired_working_mode;
>   };
>   
> -int ufshcd_get_pwr_dev_param(const struct ufs_dev_params *dev_param,
> -			     const struct ufs_pa_layer_attr *dev_max,
> -			     struct ufs_pa_layer_attr *agreed_pwr);
> -void ufshcd_init_pwr_dev_param(struct ufs_dev_params *dev_param);
> +int ufshcd_negotiate_pwr_param(const struct ufs_host_params *host_param,
> +			       const struct ufs_pa_layer_attr *dev_max,
> +			       struct ufs_pa_layer_attr *agreed_pwr);
> +void ufshcd_init_host_param(struct ufs_host_params *host_param);
>   int ufshcd_pltfrm_init(struct platform_device *pdev,
>   		       const struct ufs_hba_variant_ops *vops);
>   int ufshcd_populate_vreg(struct device *dev, const char *name,

Reviewed-by: Nitin Rawat <quic_nitirawa@quicinc.com>

