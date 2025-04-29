Return-Path: <linux-arm-msm+bounces-55992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A405A9FE0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 02:03:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99F10189C102
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 00:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C88D217E0;
	Tue, 29 Apr 2025 00:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g357zBq8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DD1258A;
	Tue, 29 Apr 2025 00:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745885032; cv=none; b=MX1GKrKRBwbh4XTT7MjtHTyOIcCMELRsyDsDc9EnlcJBWZi5T7dBWqA1zUBoQTcxZ4McV0tkGOnoPdXphWqP7W8y7bjQG0hvlJqF8o+jfF+NTS0JnIhKGNOKk6QstPrxxJrsaQ6CAoYYnI8sN/FZI+fKUPKtPjihlsiXYgjTOgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745885032; c=relaxed/simple;
	bh=ACq4RUEo53WHjQxds0peY6NFLDT/gF8Ze8+QrpOchvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QkhfRQtvmeQDnX+twBXOyfausdS+7mi114ri4cI+BxgROjD2REgFnYgR8J1nXLeCvWRLpK9rEBzqtgGpkeJYkHjbEylBH84pRGMuKTxP0D6TrerFR23TfQ9m209Lk6E1HZ/5B3GuY6iFns9LBEz3HPpjXJFClGp7jIyGOLT/0CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g357zBq8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNqxT0013632;
	Tue, 29 Apr 2025 00:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5yQq99vkLsa1w0G1Lg+vZYB2vDdvIHE/Uu0S+iTulGg=; b=g357zBq8xrEHzKQu
	s0FVT6Gl3ko6VuljJuRXh5tnPsRuT1fGc9bJhk7b6srbvnLMn3U3Cx6NoDZETpos
	mI+O7ZNn5q9/nTDWv1vHmIDYc4qQXKQ57MbJnPwaYulpSGqor+/kCdGZx+TiBK9z
	qvbRY0xbuhPK0VUl4h/4Cav4L32n7nTvowuhHM/kKLCOgyWx2x3koJ11tatwwF3C
	r/i4VNJ2t+1BCsxNuj89TVL+Bev6MDBINyHqYLOk3SU1tOLwN8Xhb30jkUt/T+FS
	lG5QGZid2fPxqmeICxNE2+sIbdNs4HBa1fxkk9sUorZxt1lMdqikCydhC1b381Ka
	TjEqTQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rnn1m54-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 00:03:19 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53T03JfI009026
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 00:03:19 GMT
Received: from [10.134.71.99] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Apr
 2025 17:03:18 -0700
Message-ID: <ef0b0a0b-ad08-4716-8eba-8745aced8981@quicinc.com>
Date: Mon, 28 Apr 2025 17:03:17 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/10] drm/msm/mdss: add SAR2130P device configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark
	<robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Dmitry
 Baryshkov" <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan
	<quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy
	<robin.murphy@arm.com>,
        "Joerg Roedel" <joro@8bytes.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
References: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
 <20250418-sar2130p-display-v5-6-442c905cb3a4@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250418-sar2130p-display-v5-6-442c905cb3a4@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ZNRjRlcfew--F-L5Dko5CQ0VhzFk2FfT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE5MSBTYWx0ZWRfX4gyRfNrTYC4g 18L9qJvZpbTQ7Dydx4KdgwqKGDSBrQUZ+gDZkUZ38ScCr7hiD4c4+jM9skafDTzAyU2gEXjpYk8 TY3KsKCVMn7OktrSTS/bo+DClFhlRKucIOrRpFNrH6Q2xJZzVOLRPy6+nlvVFvQjQQdPwIfg8MV
 SQLL9R5pSzgt6+QzaZy6XFNgPZSiVfNTK63l5zI21KtEhLH29Z3CUXOeQ9E+MlbPaYtMlZ3B5A3 nK93IlsyiYIb5qPmhikt2gC5DOTO9oNFrFo7qyKmi81r4BlXVvWxRGZFI62XyFJoLFNZkHKuUf0 aiWHOX+QUtC9RpZQ5OK15MZroTj7TIFLVGxlBRYe0qrQtjpE4s+CKFn4BaNW8JJnWM/xCjOkSg2
 n6G8g9PcyN1e7DlWQBv04kuz+0rvlDwpRd7CzDD+rJd7M/Kpur+OmuPhtdfOdFDlncEQR71X
X-Proofpoint-GUID: ZNRjRlcfew--F-L5Dko5CQ0VhzFk2FfT
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=68101748 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=oemococDzsnvMBNZoewA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1011 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280191



On 4/18/2025 12:50 AM, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Add compatible and device configuration for the Qualcomm SAR2130P
> platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/msm_mdss.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index dcb49fd30402b80edd2cb5971f95a78eaad6081f..f706e44231a9c360ac4abe26e4050e416d8c3940 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -592,6 +592,16 @@ static const struct msm_mdss_data sa8775p_data = {
>   	.reg_bus_bw = 74000,
>   };
>   
> +static const struct msm_mdss_data sar2130p_data = {
> +	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
> +	.ubwc_dec_version = UBWC_4_3,
> +	.ubwc_swizzle = 6,
> +	.ubwc_bank_spread = true,
> +	.highest_bank_bit = 0,
> +	.macrotile_mode = 1,
> +	.reg_bus_bw = 74000,
> +};
> +
>   static const struct msm_mdss_data sc7180_data = {
>   	.ubwc_enc_version = UBWC_2_0,
>   	.ubwc_dec_version = UBWC_2_0,
> @@ -738,6 +748,7 @@ static const struct of_device_id mdss_dt_match[] = {
>   	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
>   	{ .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
>   	{ .compatible = "qcom,sa8775p-mdss", .data = &sa8775p_data },
> +	{ .compatible = "qcom,sar2130p-mdss", .data = &sar2130p_data },
>   	{ .compatible = "qcom,sdm670-mdss", .data = &sdm670_data },
>   	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
>   	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },
> 


