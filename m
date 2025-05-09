Return-Path: <linux-arm-msm+bounces-57420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 150D0AB1249
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 13:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77CB150832C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 11:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B587028C2BE;
	Fri,  9 May 2025 11:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aAD2UEUj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D060222A81D
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 May 2025 11:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746790560; cv=none; b=E1xL2nusvbFoh+CPWhQ+a1xGEwBDab05wtT05JIEWhwNke9bNvW4HQjKvF5yPOght8/6YJo5vl+o8Fa2yZKKxJXM/GsnnTg23Hyflu+X+BmWkVdKgK3yBTdekFOcjR+6GhPSNXZVGEdPwgVCo7fAs4CMqJpFFg5WLu5yuIfboJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746790560; c=relaxed/simple;
	bh=b/ocDn60AZKD7DkQrGARHz1m4s5oOy4i/S4RjymqpjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jd2QL8GNuIzJx2uU0qqEgjPB4t4Pmn9K499m3+Q9RyUck6FdI4sUMkslD1FFykPwcfbIhuA6wKfL0DIwe2LBt6B90XI8THpVYoGZqRAybkBGneZh4t3yO/OZLhquG4lMfJmupyzoWo9Hw1yoFzKd8xBpfKflDA+t8T5LOsrhkKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aAD2UEUj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5493WX51022333
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 May 2025 11:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	clpGEQdwMWcHuVX1s2S+PQJLA4E0hBPTvMUFRssmFE4=; b=aAD2UEUjR0E5eUUc
	NtEkzdPATHCH3c90bsbbi4K5NgQftUd9kPGnopjSYTILXe1flpgQ/v0ieg7FHqZf
	G0cn7icUQiV8Jy6TzEM3nCs5aUz6AWV3wNXgit1O8deAK1dmq9c78Mu1SI/8zsNW
	p3aZEj2MwS8J5UDWtOVlC5nh38OEgFLMVwmevV9AEu/v0oVHJtLvhgQjc77439Xx
	l3Xq9SK/taKrJw8P8sFaVm20C9HKK/oThsATHMoe1o9uKQ3NT1dd93pJcKbaeshR
	Xq5lVFJ2CcXQr0GG3rFAK5v6906GY7UHzUxWyMZE+vPNtanuY8MACiiTtwk3CwCB
	B1Y1qQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp4mhek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 11:35:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-49452798bd4so1595381cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 04:35:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746790556; x=1747395356;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=clpGEQdwMWcHuVX1s2S+PQJLA4E0hBPTvMUFRssmFE4=;
        b=APeUlFyOevuL79X8PRNyeWdKF8wLkhyhIPpMxdhZ2J1Mc1ZkeokevggLmTkRY5bT4c
         +0q0jAFk9eCOO7yQcfMAfH64zs9mOT2kXBzb7Y/wcZJGW8eE0jb/Zx8ZkvlyK5EM+L/m
         uAaDqFPd+uWuWH9IlcsnKusk2fsckUG4co6a51R6AtY9IEo++hQPR81VB6Y74O6e32mB
         C7v7cDp7NsSbdNI2RA81X3Y37XryKUEHtYTcuCRJEUr0JN8JLKChAOJojGt2VBkJvnZn
         NR5D6YNNgNk6aEZkJGaGBcmR53/o1vIffMaFRcpawtM9yYUyTZSKUIPsPlAq/iqQyjn8
         gAlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkm3B9Ka6/JDDnpv0PJdp8yQUtpP2nOO22fSv401l7RdCBWO8wU1xTBR+aOE61AGVFZuLU0ypXk3FTUsiI@vger.kernel.org
X-Gm-Message-State: AOJu0YxeeyBUUEyFXF4M0muO/GXi23ZmsQH9tQqIDPHzfSvVAyrjNLJZ
	AgMCN0V4I91S5EfNJLc2qmKw3Zhgs5qEDg5zYDvDfaqP4ePH4vjdaW1d7ZZ4CliS/Hy/p+lJNB4
	HQ+HHpxc4uMlrlZjWB6KTbKUEFljFRaEIHKrivusQ46KlJ9GaovRzySGrnMEYbSHE
X-Gm-Gg: ASbGnctjzjKo9gHxB0uR2JZNZ8hNvT/bEqcOf6Xpt+V/dEk37IcNtUSPjLg067CwazZ
	G57UVk/oOKDkSCElMuwGzGzUnt0MTHPOgSP16ye7q2kJqccuS24UIheNdrrPp8mdOAckntBq8e0
	N8o2lumBU0jvrccNQ/A4hPjV34lcBiCDAkEqRbpy+b+LhUxEY5/fTU0we7sFbJk++ygi7s2tcci
	L/NEdVoHFBLXPWZTnySrFcgqCcVJRhITfTUZaDHtj7+5C59UsGcHclSTLnTQTJS/NXqkUeY5J4i
	vkEyL1sjmTnmU2YBQyKPrn52cvwA0rwBAcy3p41WkG3H56D3DC01FNaZrmRr6nrOhKI=
X-Received: by 2002:ac8:5f49:0:b0:474:e213:7480 with SMTP id d75a77b69052e-494527f40dcmr13254081cf.15.1746790555654;
        Fri, 09 May 2025 04:35:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQrKt5+ENDzVyZIaPC6bM/I1w4UI11+gCCI1inxl4cHyjOu66kgARpVBcFs8jbdIp2WkVnDQ==
X-Received: by 2002:ac8:5f49:0:b0:474:e213:7480 with SMTP id d75a77b69052e-494527f40dcmr13253771cf.15.1746790555168;
        Fri, 09 May 2025 04:35:55 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21947b26bsm137062266b.86.2025.05.09.04.35.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 04:35:54 -0700 (PDT)
Message-ID: <780d84ca-4004-41ef-a9ae-17532053f8a5@oss.qualcomm.com>
Date: Fri, 9 May 2025 13:35:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 09/11] scsi: ufs: qcom : Refactor phy_power_on/off
 calls
To: Nitin Rawat <quic_nitirawa@quicinc.com>, vkoul@kernel.org,
        kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org
Cc: quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
References: <20250503162440.2954-1-quic_nitirawa@quicinc.com>
 <20250503162440.2954-10-quic_nitirawa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250503162440.2954-10-quic_nitirawa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8N-Q3arECvFu2NBMna66HeuaSxWvga_b
X-Authority-Analysis: v=2.4 cv=E5XNpbdl c=1 sm=1 tr=0 ts=681de89c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=ItZO8zVqQjmK9ylnveIA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDExMSBTYWx0ZWRfXxz/VQWAotJhY
 phRL8hPNdFEAwESlBrYIPw18kQZXanxtpHUcJEdxZ4Fy1wKXt8lvu2FmuFkeKc8xI6+5KxCbXXK
 oKekC69JqCCqgQjaIjPTuD0KEcPQpL4crTKus6Wb5c4iVOxgkvv3z2gY40fzESVzXNWVL7a2yke
 wTPJOiBre236d639KPiCEFI5xNYXSObuoXKd+DEiklx9U6KGxJguwAZ0tKIK6WmZW8ANqDwxEw7
 WIsA8IkxxAzNICN83hkfLLgdqN540VkC+e4mBFk7TWBvmcA4J0QcV1XGvD2EUHNIgDWLTftHR3j
 YmSpPJ1VqAYdWnDbAwQ0IkqDciOTdG8SpzGzrRayJvxSQb1k2EQC44mUTQoX1I9vHWSvktTuRRo
 e8WpL69SSTVZ9abmB7BsHZoqxdaDT7OFH/Z8blN8Q08P5jkDXFUvzudje+7lJh7SCbeAKuze
X-Proofpoint-ORIG-GUID: 8N-Q3arECvFu2NBMna66HeuaSxWvga_b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_04,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090111

On 5/3/25 6:24 PM, Nitin Rawat wrote:
> Commit 3f6d1767b1a0 ("phy: ufs-qcom: Refactor all init steps into
> phy_poweron") removes the phy_power_on/off from ufs_qcom_setup_clocks
> to suspend/resume func.
> 
> To have a better power saving, remove the phy_power_on/off calls from
> resume/suspend path and put them back to ufs_qcom_setup_clocks, so that
> PHY regulators & clks can be turned on/off along with UFS's clocks.
> 
> Since phy phy_power_on is separated out from phy calibrate, make
> separate calls to phy_power_on and phy_calibrate calls from ufs qcom
> driver.
> 
> Co-developed-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 55 ++++++++++++++++---------------------
>  1 file changed, 23 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 2cd44ee522b8..ff35cd15c72f 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -639,26 +639,17 @@ static int ufs_qcom_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
>  	enum ufs_notify_change_status status)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> -	struct phy *phy = host->generic_phy;
>  
>  	if (status == PRE_CHANGE)
>  		return 0;
>  
> -	if (ufs_qcom_is_link_off(hba)) {
> -		/*
> -		 * Disable the tx/rx lane symbol clocks before PHY is
> -		 * powered down as the PLL source should be disabled
> -		 * after downstream clocks are disabled.
> -		 */
> +	if (!ufs_qcom_is_link_active(hba))

so is_link_off and !is_link_active are not the same thing - this also allows
for disabling the resources when in hibern8/broken states - is that intended?

>  		ufs_qcom_disable_lane_clks(host);
> -		phy_power_off(phy);
>  
> -		/* reset the connected UFS device during power down */
> -		ufs_qcom_device_reset_ctrl(hba, true);
>  
> -	} else if (!ufs_qcom_is_link_active(hba)) {
> -		ufs_qcom_disable_lane_clks(host);
> -	}
> +	/* reset the connected UFS device during power down */
> +	if (ufs_qcom_is_link_off(hba) && host->device_reset)
> +		ufs_qcom_device_reset_ctrl(hba, true);

similarly this will not be allowed in hibern8/broken states now

>  
>  	return ufs_qcom_ice_suspend(host);
>  }
> @@ -666,26 +657,11 @@ static int ufs_qcom_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
>  static int ufs_qcom_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> -	struct phy *phy = host->generic_phy;
>  	int err;
>  
> -	if (ufs_qcom_is_link_off(hba)) {
> -		err = phy_power_on(phy);
> -		if (err) {
> -			dev_err(hba->dev, "%s: failed PHY power on: %d\n",
> -				__func__, err);
> -			return err;
> -		}
> -
> -		err = ufs_qcom_enable_lane_clks(host);
> -		if (err)
> -			return err;
> -
> -	} else if (!ufs_qcom_is_link_active(hba)) {
> -		err = ufs_qcom_enable_lane_clks(host);
> -		if (err)
> -			return err;
> -	}
> +	err = ufs_qcom_enable_lane_clks(host);
> +	if (err)
> +		return err;
>  
>  	return ufs_qcom_ice_resume(host);
>  }
> @@ -1042,6 +1018,8 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
>  				 enum ufs_notify_change_status status)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> +	struct phy *phy = host->generic_phy;
> +	int err;
>  
>  	/*
>  	 * In case ufs_qcom_init() is not yet done, simply ignore.
> @@ -1060,10 +1038,22 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
>  				/* disable device ref_clk */
>  				ufs_qcom_dev_ref_clk_ctrl(host, false);
>  			}
> +			err = phy_power_off(phy);

a newline to separate the blocks would improve readability> +			if (err) {
> +				dev_err(hba->dev, "%s: phy power off failed, ret=%d\n",
> +					__func__, err);
> +					return err;

please indent the return statement a tab earlier so it doesn't look
like it's an argument to dev_err()

putting PHY calls in the function that promises to toggle clocks could
also use a comment, maybe extending the kerneldoc to say that certain
clocks come from the PHY so it needs to be managed together

Konrad

