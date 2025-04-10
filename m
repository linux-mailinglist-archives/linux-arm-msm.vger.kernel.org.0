Return-Path: <linux-arm-msm+bounces-53917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 729F4A84DE9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 22:09:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B0E81B86E7F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 20:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4181828C5CE;
	Thu, 10 Apr 2025 20:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GOxUIxeC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D36204844
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 20:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744315763; cv=none; b=Y1fL7msM0AnW2ZxY+7UwqVADPIYJSvTeglnNzYifutyqktQYQRBJeEcAGiKrFtuaiHGI6W+OEZ9IxO27DU3uuTJkxK0GJrRFLU5/6xVlNrQJHY1ulSHYLsqY+/fsEeEJyVuSK9d08eHxXVf22uiHwqaRBRtOJ+ZPtZhl+4Ie3g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744315763; c=relaxed/simple;
	bh=768uy86Qlyfv4yQIcxTVg6okW0F9hy6AK6vdWrc6x3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QI2XJ1IFoECPZKW+/WNo8DUA7ipzQ8zj5LAnI+mRXc9umRkCc+gyX39HV+/OhpIcTlF485Omk0ODDEU9j3AXtAAVoj6cjHH4Y5rrl/LlfG2OEHNHLXTwBRNsHu3rIRJqBdDz5YgAACMbYMXuDvYgDA1uqDpINQEOTGclsyTe6og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GOxUIxeC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AFrgWa028839
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 20:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cCEd/9oYHxkcPEhimIejZIIz
	IOlQjiZILHCRW9pgvQ8=; b=GOxUIxeCP78CiPRcfisEbENewWDuMHZq6XcltgHA
	d1kAL7kZh3/qIKpTTd+Og7m9+1GQwUA8COfStq+eEOuOSJVzWxqiwMRYi7/NPSP9
	bay2buJge4u3LX/4G8DotnrSiWHfCwT4jkz8WIGeiXLC7RsmAiNm+7ra+BfjKIrF
	edRyGPmHBvrc5mD4mEg0wIx+TbCewNLZ6U6a+6oKPn2L4xWSOSPifP4y/59Whjds
	x1ZJNwecA/qG5SyWDN2Kmz2hIJ3RfL/fmC6H3IVz8TxldL56FSHUNo1SjmXA3zqj
	pcYEwDRFhhvoYQZQzKiotMSU9T2Px4DWUZJLDVvMkEJ/zw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbur7w0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 20:09:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c53e316734so218315085a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 13:09:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744315760; x=1744920560;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCEd/9oYHxkcPEhimIejZIIzIOlQjiZILHCRW9pgvQ8=;
        b=cA540DEHU8d9nGC+EK3Cl2xnQpvi312EiOFWT5Qy2hqCRsls/pe/YVWTPubnGDXtnF
         +F1otuW/+zcgHmrUrM+um2n7H4X/4pLuHwpq+pMzOk2OxCbE2ZfforVQMaeasbHN+84e
         k0qCyVGL9oHY1Yqd4/gAkSQliiFBgGbeVATm2K5kJAtcfSZv2q4EoP/yDSQhZjqABG5p
         6t9zgv5rloVfBs5NVKIRLyYQXueyoSnAUeFhTVSlcTeSj/sj9AM1KmMovq19urZaV1DF
         IcdMqcv7fuwGJWOLZ05YZFW7dM9bNrzYC3TcwziItEOBEnBhmWuDUEoJiJtZtquI7nGA
         2lzA==
X-Forwarded-Encrypted: i=1; AJvYcCXFjSx6STR4CIzccr0gBNfCVQ6nO9rmW81RMMPSXYo8lR1bZiGam0cyUw/RDHd36+oH4PXzdXY3Tf27yMwa@vger.kernel.org
X-Gm-Message-State: AOJu0YyxsUkjLVe/5I2MN1dseoB0wFAfnkoF1t4rWoPUt4iCSYzHLSfo
	wa2G4qM41qQ8nfAvpuLC9eu0oaEyEVLS1WwqGlzlLFDrJ7/sz1JqzS8DMOgZU34HfjUmT2pvacS
	oJA7gp5GOVYcv6HKOWm8TujnylxgWGIASXKeJjaK0dWtXUaIuYUHrMq/wwPVuFOJi
X-Gm-Gg: ASbGnct5TmLDFTA2gq4gmIjS5UP9nXlLQRQJK6gw2lwA1BKNeSZJ1blR5YLmjtkVNN1
	NMhrHl6fnlKExNmhASAX8bdQ5NGcoqJKrAI1dlntcGj89PG6Vepw8JskJbjexDg2esXG92mVKrU
	rhKA1VlGXk9MXJXFP348BMuAVjkVvufOQjIfhOPVk36Ji4Sbx3Qp1pwtELj97plq0Faj/e0ExQi
	R8PPObn3tujJFGwkwPY187vKrHJ6mvyvb+Daj08AV2bpKv2gFXP3vNX45qLPh5aR6fmL/M2umvh
	Cak4YufjY8UGly8CdBj99QiRYEiuN0vofOiJwiHjaJ0cuQlXL5UUVEojU+h9OLGLSL491GXXWto
	=
X-Received: by 2002:a05:620a:25c8:b0:7c5:48bc:8c77 with SMTP id af79cd13be357-7c7af0f7486mr42168485a.12.1744315759702;
        Thu, 10 Apr 2025 13:09:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFF5PL1gguzYgueXqfskPS3BDB/9kZoEF+bGl5gtL5TFWlHZx9cNMm6owbgOWc0ZWNJJpiKOw==
X-Received: by 2002:a05:620a:25c8:b0:7c5:48bc:8c77 with SMTP id af79cd13be357-7c7af0f7486mr42165785a.12.1744315759322;
        Thu, 10 Apr 2025 13:09:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d238b8bsm233238e87.88.2025.04.10.13.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 13:09:18 -0700 (PDT)
Date: Thu, 10 Apr 2025 23:09:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, bjorande@quicinc.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH V3 5/9] phy: qcom-qmp-ufs: Remove qmp_ufs_com_init()
Message-ID: <zvc3gf7mek7u46wlcrjak3j2hihj4vfgdwpdzjhvnxxowuyvsr@hlra5bmz5ign>
References: <20250410090102.20781-1-quic_nitirawa@quicinc.com>
 <20250410090102.20781-6-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410090102.20781-6-quic_nitirawa@quicinc.com>
X-Proofpoint-GUID: Lh2vFtfqZWUY6RQSavUzHKSE3uujB4FV
X-Proofpoint-ORIG-GUID: Lh2vFtfqZWUY6RQSavUzHKSE3uujB4FV
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f82571 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=U4jezyStByDUBB0whBUA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504100146

On Thu, Apr 10, 2025 at 02:30:58PM +0530, Nitin Rawat wrote:
> Simplify the qcom ufs phy driver by inlining qmp_ufs_com_init() into
> qmp_ufs_power_on(). This change removes unnecessary function calls and
> ensures that the initialization logic is directly within the power-on
> routine, maintaining the same functionality.

Which problem is this patch trying to solve?

> 
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 44 ++++++++++---------------
>  1 file changed, 18 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> index 12dad28cc1bd..2cc819089d71 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> @@ -1757,31 +1757,6 @@ static void qmp_ufs_init_registers(struct qmp_ufs *qmp, const struct qmp_phy_cfg
>  	qmp_ufs_init_all(qmp, &cfg->tbls_hs_b);
>  }
> 
> -static int qmp_ufs_com_init(struct qmp_ufs *qmp)
> -{
> -	const struct qmp_phy_cfg *cfg = qmp->cfg;
> -	void __iomem *pcs = qmp->pcs;
> -	int ret;
> -
> -	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
> -	if (ret) {
> -		dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
> -		return ret;
> -	}
> -
> -	ret = clk_bulk_prepare_enable(qmp->num_clks, qmp->clks);
> -	if (ret)
> -		goto err_disable_regulators;
> -
> -	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
> -
> -	return 0;
> -
> -err_disable_regulators:
> -	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
> -
> -	return ret;
> -}
> 
>  static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
>  {
> @@ -1799,10 +1774,27 @@ static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
>  static int qmp_ufs_power_on(struct phy *phy)
>  {
>  	struct qmp_ufs *qmp = phy_get_drvdata(phy);
> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
> +	void __iomem *pcs = qmp->pcs;
>  	int ret;
> +
>  	dev_vdbg(qmp->dev, "Initializing QMP phy\n");
> 
> -	ret = qmp_ufs_com_init(qmp);
> +	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
> +	if (ret) {
> +		dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = clk_bulk_prepare_enable(qmp->num_clks, qmp->clks);
> +	if (ret)
> +		goto err_disable_regulators;
> +
> +	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
> +	return 0;
> +
> +err_disable_regulators:
> +	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
>  	return ret;
>  }
> 
> --
> 2.48.1
> 

-- 
With best wishes
Dmitry

