Return-Path: <linux-arm-msm+bounces-66150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69783B0E3BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 20:54:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 205341AA65CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 18:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D568280329;
	Tue, 22 Jul 2025 18:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OJ+uu7gn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A44921516E
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 18:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753210465; cv=none; b=sY6tys00bbRjdGR2CJ7W7/rYmapBzMxgiuQ3dI9tjFEdqK4wRBA7JhRrcvChAJSiKjuURIdAy6jGmsAV/cIKptTrA6ZqCC/4NXU4Nr7bWI4kt5IKnOEBuNNM4ex5MtuZpYUGQuBb/MxG9mPeIsQKqvcXG51/6JUuT5SqkqNBM5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753210465; c=relaxed/simple;
	bh=96xfn4tCHea2gia7bvnVjslaPkgqvIGZbOhlkhi2lqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9+6lqp7Sk+ZMp054/nRxLg4R8xWaywaHDTBZd8+Et5dmr4UyskY6ie5aUlZs/PDfIKWEBzPMANgLKiXSL7wcaZLfjnflQxQPWBuVZHqVt75IqKhfSOUPM8ZTRz8h7sRMZGsSZiBA28we0MWMKC8GQhxLDhHDR9mHqakewF4+bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OJ+uu7gn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MEqxf3011581
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 18:54:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/4kWT0NOLTYGI8Jw3DZJpmHB
	CM5z1oJo6kgrF1DYaDw=; b=OJ+uu7gn9b6y+gkHNreX6ur2vMNsWU7RvG4zlI4D
	yUMSXtk6rWUBZiC4Lgr1TOdWW/x7MCIcu/FwC7R2kq9i6C5W6SK1bpYfH08zoWgA
	uPVLwBVIeTjuMFSkH3hsLljeQzydCoxvqJmZoXhbHzED2PxbNMtuv7VV82BGD8W+
	kI91abkXerfSYdJKjZnM51yZApXWp42vhHuD9qAfuKWIFIi3CYxterOcR96SV6Fq
	JwzE5N2h+7RiXdCGiHshDzd50iDXpfLjGhz8duQqsOKW1g13jxMwAMN5q4jf4DeE
	PqDKNvATfS3URU0mvvHr3YjjQAHVjPjC8JpiU6/McEFbYQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481t6w3qan-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 18:54:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ab5d2f4f29so104636401cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 11:54:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753210462; x=1753815262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4kWT0NOLTYGI8Jw3DZJpmHBCM5z1oJo6kgrF1DYaDw=;
        b=TjlwMkSclrv02hlkieMN9yMObqHXM1o261wvEH8O0aTM2UKbyENpDOxdEX6xiuUeLo
         MQ+zQLfB968vnQsRoNx4CJJnfZgwxAh8775zEGCNnDapMVosmRN+CiUGj5qOv3l8AWVz
         8EXbANiqcXY0OMsH2i26GREJTk1QwojZmGeSCm8cR3MIrJPv+GO7cU2SKBFeAH6oHlpp
         93YFua1f4N2D4/C4EqR52RUDOwSMQ1QPRd9Jt6vArP7GVWGej3PlMIuZzBbmLE2oDYoo
         IjYZyloqQ0E4SVeNfplBdjOryQWfuRaNcVBi5tSMW+Ts4EtAqsn/wDQHxxj0VaQrMOiz
         ZSLg==
X-Forwarded-Encrypted: i=1; AJvYcCWaR7FkDwhlFOxX4f16iMdEO4Jcjm3whte99i1xnMnl4NsURLCUxIXf2+cUeU8Ph6Lqk+b3drFfsVyRoo37@vger.kernel.org
X-Gm-Message-State: AOJu0YxZD7PmVj9GkQoUKss09sJi2moJzK7cDQPsWG9OofEqgCPa9yba
	UXvQfFyXQ0XfO/eqVFfzmGJh8Bex63cO0a6X+0YDNs1zRTmitthaR4CUGKyyK1WSBULJhoDySeZ
	VQFNdw9MtgLvuurGrUjtqtsXb4gvhZQSPZ1zI76jYE8s7JSxH/MntaiJlKskT/0OTq4xm
X-Gm-Gg: ASbGncvLfLvsLklRCHvTqBqXNUDH/GAUG0X7O+sbjBSSIEHP7O2TD63T2rillfDrfxX
	wrG4k0zKUxzCKP0x5megBrgrkHd/TMiu3CdTvLVJM56O8Vs+nYGCnVMauxkvR69aBqmUyh11yT/
	I8ks95+58cEhaivQMPvhxtH7LFHw55nHSZcFhW6nTulg2s/cGKF6N2EfpsqHF6t/R/cI+UW8Q5E
	LVcgE+91m4AwplouB4PWICOJsSrJ2kbq5I45wHscnDq+n/lpI65vKR9F6hUCsiREQVSqoQrtJT0
	hQt0b8nY4dyi8e9xHqrD1XSLLlPmeYyskEt/vTP5XSWWgAGjy7aMuQSy5FZmOT/xWgH9z9U9OnA
	rXTtg9v9YedGeJOJkfwu7mFtMAIfI7qPyf77vGIjuqSMfDF1X+cJj
X-Received: by 2002:a05:622a:144d:b0:4ab:377c:b6be with SMTP id d75a77b69052e-4ae6de98f09mr1912281cf.22.1753210461909;
        Tue, 22 Jul 2025 11:54:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhRnikguNGu1BrDZFDmisqE4jxon1gG+KvhvICXhN14dMxNM4hz1lupwOy1zhqjhe9hxqXqw==
X-Received: by 2002:a05:622a:144d:b0:4ab:377c:b6be with SMTP id d75a77b69052e-4ae6de98f09mr1911951cf.22.1753210461368;
        Tue, 22 Jul 2025 11:54:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31d912aasm2035430e87.155.2025.07.22.11.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 11:54:20 -0700 (PDT)
Date: Tue, 22 Jul 2025 21:54:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Cc: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] ufs: ufs-qcom: Add support for DT-based gear and
 rate limiting
Message-ID: <2ihbf52nryduic5vzlqdldzgx2fe4zidt4hzcugurqsuosiawq@qs66zxptpmqf>
References: <20250722161103.3938-1-quic_rdwivedi@quicinc.com>
 <20250722161103.3938-2-quic_rdwivedi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722161103.3938-2-quic_rdwivedi@quicinc.com>
X-Authority-Analysis: v=2.4 cv=SPpCVPvH c=1 sm=1 tr=0 ts=687fde5f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=neWBWJ4wSANu-z5_DMoA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE2MCBTYWx0ZWRfX37JX09l4bk3A
 nwF1m+hrRBzNdqfkwNk5RGmtxWrfQk5I936aCsCIbZY7ej++Zq89xx+U31MnjhXjeNXb31JIMKx
 BaGOWR2w9Zh24uwF83BBUTDYGvwaJZ4uqgAg3J+OaRx5gKSZktLSRhLm5S8QYg7Sb3TWlRw2yid
 p4j7xNMpg8Goh4Tk2zY8WIqxOG3ndwjBtjPejIBjDwz8+A/kTc1ii5ueZPtjxQeKL0M31FqHqbf
 KaxHQwaxIo257U6gGTJ+QsAWSHy0TceWPCdxr0nvBnMBbbqS0K0z1tzo5bUt1fyxfajdBg67Wp+
 ERSaoTVBTq5VQYCsxjtnNJekfQOsS3Csagb64+1SRoEVQ17/yyp2myUWu6qy/my1CcBgch9q6BV
 uY64bUnac3rie/vWaW+AE5iRBYoaOysPi1zMbEKssp87vX/p9wafw87uVGJosYYfT6ZL013I
X-Proofpoint-ORIG-GUID: uWtpLLq5UBzniNfW0cDQBhTl1ASpehTu
X-Proofpoint-GUID: uWtpLLq5UBzniNfW0cDQBhTl1ASpehTu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220160

On Tue, Jul 22, 2025 at 09:41:01PM +0530, Ram Kumar Dwivedi wrote:
> Add optional device tree properties to limit Tx/Rx gear and rate during UFS
> initialization. Parse these properties in ufs_qcom_init() and apply them to
> host->host_params to enforce platform-specific constraints.
> 
> Use this mechanism to cap the maximum gear or rate on platforms with
> hardware limitations, such as those required by some automotive customers
> using SA8155. Preserve the default behavior if the properties are not
> specified in the device tree.
> 
> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 28 ++++++++++++++++++++++------
>  1 file changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 4bbe4de1679b..5e7fd3257aca 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -494,12 +494,8 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
>  	 * If the HS-G5 PHY gear is used, update host_params->hs_rate to Rate-A,
>  	 * so that the subsequent power mode change shall stick to Rate-A.
>  	 */
> -	if (host->hw_ver.major == 0x5) {
> -		if (host->phy_gear == UFS_HS_G5)
> -			host_params->hs_rate = PA_HS_MODE_A;
> -		else
> -			host_params->hs_rate = PA_HS_MODE_B;
> -	}
> +	if (host->hw_ver.major == 0x5 && host->phy_gear == UFS_HS_G5)
> +		host_params->hs_rate = PA_HS_MODE_A;

Why? This doesn't seem related.

>  
>  	mode = host_params->hs_rate == PA_HS_MODE_B ? PHY_MODE_UFS_HS_B : PHY_MODE_UFS_HS_A;
>  
> @@ -1096,6 +1092,25 @@ static void ufs_qcom_set_phy_gear(struct ufs_qcom_host *host)
>  	}
>  }
>  
> +static void ufs_qcom_parse_limits(struct ufs_qcom_host *host)
> +{
> +	struct ufs_host_params *host_params = &host->host_params;
> +	struct device_node *np = host->hba->dev->of_node;
> +	u32 hs_gear, hs_rate = 0;
> +
> +	if (!np)
> +		return;
> +
> +	if (!of_property_read_u32(np, "limit-hs-gear", &hs_gear)) {

These are generic properties, so they need to be handled in a generic
code path.

Also, the patch with bindings should preceed driver and DT changes.

> +		host_params->hs_tx_gear = hs_gear;
> +		host_params->hs_rx_gear = hs_gear;
> +		host->phy_gear = hs_gear;
> +	}
> +
> +	if (!of_property_read_u32(np, "limit-rate", &hs_rate))
> +		host_params->hs_rate = hs_rate;
> +}
> +
>  static void ufs_qcom_set_host_params(struct ufs_hba *hba)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> @@ -1337,6 +1352,7 @@ static int ufs_qcom_init(struct ufs_hba *hba)
>  	ufs_qcom_advertise_quirks(hba);
>  	ufs_qcom_set_host_params(hba);
>  	ufs_qcom_set_phy_gear(host);
> +	ufs_qcom_parse_limits(host);
>  
>  	err = ufs_qcom_ice_init(host);
>  	if (err)
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry

