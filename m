Return-Path: <linux-arm-msm+bounces-84571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7800CAA582
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 12:42:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8C49300EDC2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 11:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 089E32DEA64;
	Sat,  6 Dec 2025 11:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UhAu0gMS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U2AxK5si"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2572D94A4
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Dec 2025 11:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765021365; cv=none; b=Zz83PqEk3CLKs5h1CGldWQ/W4svH22Oz2mzXxjn5ww0cgChnmG173QRuYAcmILZe1YgbhHIX39Bq38ElgRVZcWfAKOfhTk1Tb3QqiBZUXBN8Sh582NqOVTL+YiwTPPsaRdctTz7S19ew9nU++MSFu877gVur9dpc1k8KCfgZ6+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765021365; c=relaxed/simple;
	bh=uSnV1L/yoLoYSmvzP4okgFwrjeu+CCdIqOIDRC7h2d4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YL67hOAd86wfvnifSvKDlTf0EDMfu/mZnmeQ7V1sajtxLYm8VfPxeI4PlEVyx+1j13PQVOSpBxNvZ2344upbuqTNIxFtovKGysSgSWs8NDeiwk+eh1jCNjRcdAsOSSLU56BiNSaJb0XF0Zcbtsb80R1C5aBsZ9oxyDnWp1QirZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UhAu0gMS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U2AxK5si; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B6AXhnx3418709
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Dec 2025 11:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zsHIxuXaNGoM1O/Vkbmg3zxD
	3eb+BNwHk3XxGSWuP3U=; b=UhAu0gMSkWM5NggVwjfYksNUQzN5WR9fzVDds12a
	yqxAl/xh1OFZonc8DAV83/ZU+Ziv6ERvTwe0A2Giybr4v4J5wL4b/MLKxThssy1T
	sP7UWKE2qffLygUhODTv5RjFWUWF8bx7eQk2DOgW8FaI4YYDkqssxb+oS3+RC4tr
	ZMCexKb9r+9Sv+R4eTDk6SMx2woLwfM/ITjI+16gBlqdug1okQa6lUDH9lIYKuOL
	+GnOnt1W/0hAaKj1toTFzlpk3KEfYUxPNyldZHqqUZwFRkO54Oh92CQrQXB87Pfw
	RZ9zyJznlIDvGLqIrddHya/URgwPjWWT5hd84l6LmU3Gtw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4av9uprxs6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 11:42:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b4f267ba01so876564885a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 03:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765021362; x=1765626162; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zsHIxuXaNGoM1O/Vkbmg3zxD3eb+BNwHk3XxGSWuP3U=;
        b=U2AxK5sig5Jq2ibY9JTfLqmegf6rez9TUeTuTlAN0+ND5OcCL4EccJOs/Y+dfrcmtS
         snQIpJl0OcDxMT/QwYvqZkXnpYPYErvDdSGa/98rAk1NJE3UMJo/IgW3dUSg5JJSZx6y
         w3vIRsWSAWqbyi6SZP4Ef4E9WFk18w/mO2PguvqTdJ76Dy0g/vrUs1QMioFOSgmw9z3c
         RsbyA01lUN2JCXmgeNK0iR2L1vFxWEAUrTEAc5eoFbVKAdLJdCM6vBQ+MkrFnoFhheao
         nzTyhAudc6w+VInIfi7s5Kaul1dxOI6DlBMu6bOg4vA0HzTeMVR9RANuCjjtehW2iyIS
         OnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765021362; x=1765626162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zsHIxuXaNGoM1O/Vkbmg3zxD3eb+BNwHk3XxGSWuP3U=;
        b=eJEVKNIU578K6PKgmgKbLsQ75rovCIaehYnS278317B4g/akJEdBIIKD0AFkXdhwSi
         rHjtk/WeVGqGaVF0mOyKkvDPgCQs7KvbMHl6V8KOfnYb3FEDdhlNjQi0q/FKig3cwxUt
         qM1/xlD+hwxAVPcGIe9iKxo0ehecuUOEn89FUeObd8YUuRcZ1KKoPBThagLhpKkXR8lo
         K/aArFYHZ4N8mPGnEuETnEa1eatQH0a4gBsxMIZXKgY0lVJb5VUyUXk+50nMSTnIeBqX
         n1PAeCahH+OPUuH2hsuQyiqrFt2HBT+oCVltPV9xRUM9SndsAMPo7vMlvveIIy9iwn0d
         3G/g==
X-Forwarded-Encrypted: i=1; AJvYcCX46j3hvOyRf7voFBiwTKcBeHCKw1bt3Fun+ppYBi9eE47G/mDTQFiXUJsikemIjL1uuJ6WqoHW6FAcBtKS@vger.kernel.org
X-Gm-Message-State: AOJu0YzrOfDz2RhKkU2pO0G+i7BHZPEBfBql8Rj+2hWc4XaZJ6KETeVa
	BLtONxEOfhtel+Ckj+xDB9KgFu+7Mv/C+WokKsvsqUdfr58HQb68ODgCHL5DG9P2uNZRmb0enFl
	VGqjFrDcZHz2gaYE1aPiIe3dEBF2UA3dZ7eVt/sxMdRM5gzax6MnF86VDrLUyjZ4/hVyj
X-Gm-Gg: ASbGncuJ2FyOoHeoZfh3Nyxj61nbA73VdJavvMUAGzUJrLUq0qfpnP8zZULoVUQ+1Or
	KwLZbtopWYh4De7PlZDi0E8EAnmtB+2dwKRcwolOhmNhRck2rFWI4AOsEX0Qqle3CcQ7wyfc108
	LYXv+NLif5vyhu28teWN4IyYx4fSpgr0ORVqyf0+RnbamrdUoyCfTetJ3cDtVjmZtHMoCT+p66t
	DkV89/DXNY/MK0ygqPexJ73Z/mHlEd1PlKvAKY0qGJ8aQMGpPebq2NN1qMB0obZ1khzhFvOjnW7
	TfJNLS6iPOin9qQYTJIFQuixhEFfp74dTrP2Chyeh5IlGWKODBNEfxcYXgxY7zbPEW/xTBx0kgU
	nHc1XFKlRMUuirCdwGxhh1t4Jab8s84Tuyh8nLDF/qeYTCTlNGnCU/nTooc2rDp+2CBkl/jdeU0
	71c0qcu0yT/Hv9N6OPk9YTr/w=
X-Received: by 2002:a05:620a:4403:b0:828:faae:b444 with SMTP id af79cd13be357-8b6159b7a2dmr1361617185a.20.1765021362625;
        Sat, 06 Dec 2025 03:42:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcZrNL4Sc3FjzMtUYj6baDuC23m6S1Oe/SmVjHFc6/ndE7RqpxwssM9vRMCufWsbeqU/ljaw==
X-Received: by 2002:a05:620a:4403:b0:828:faae:b444 with SMTP id af79cd13be357-8b6159b7a2dmr1361615185a.20.1765021362169;
        Sat, 06 Dec 2025 03:42:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b2481fsm2338116e87.41.2025.12.06.03.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 03:42:40 -0800 (PST)
Date: Sat, 6 Dec 2025 13:42:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, dmaengine@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v9 02/11] dmaengine: qcom: bam_dma: Add bam_pipe_lock
 flag support
Message-ID: <bizsf4ubgudrzu6sa7p3s5aruitjssc5juhfsr4uq6p6igg2ak@m6k56syfcz6o>
References: <20251128-qcom-qce-cmd-descr-v9-0-9a5f72b89722@linaro.org>
 <20251128-qcom-qce-cmd-descr-v9-2-9a5f72b89722@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128-qcom-qce-cmd-descr-v9-2-9a5f72b89722@linaro.org>
X-Proofpoint-GUID: nxSbsPKLXQPE802dpVAM04rzYkdLDD6N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDA5NCBTYWx0ZWRfX7lO18TQwA0K3
 f4pQGk/s4zOsL5FwrbcNumYKLJEXLK8ZTTnVdYSBDG13vAm2l68xNqxmMjqdVZ6tS7PtFsk5qok
 MJBQab2BR5k91Mxg9s+i2OMc12ikHl8pZN+bgn2y8/7KKaOjSf2drWZk/V3RE9p85e9rQwIZbYH
 p1ZNyYvtRv3ke14g5azFRTePW/guXjtE54zYGbR5HBq4++crhDgAOEqO4b+Kq9j/hLqslf3pJct
 XeLJhuKUB43DXJHI7VGodO1ZMVZTANZj8ylo+b8SmfykisvkN1okPvbarvoado5/YtDYx4ATlF7
 Pm7OsemanHBMNkg5ea1slWpAh0Akr6l8nfyB0lfMx+EiZwm7BoQblqgZs4MqB7/hD9NHwKUJKKB
 rfQTLuY0U92t76/GohqN7ewztRZi7Q==
X-Proofpoint-ORIG-GUID: nxSbsPKLXQPE802dpVAM04rzYkdLDD6N
X-Authority-Analysis: v=2.4 cv=NsHcssdJ c=1 sm=1 tr=0 ts=693416b3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=8EdCfmeLOmFKhcBkMyAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512060094

On Fri, Nov 28, 2025 at 12:44:00PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Extend the device match data with a flag indicating whether the IP
> supports the BAM lock/unlock feature. Set it to true on BAM IP versions
> 1.4.0 and above.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/dma/qcom/bam_dma.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index 8861245314b1d13c1abb78f474fd0749fea52f06..c9ae1fffe44d79c5eb59b8bbf7f147a8fa3aa0bd 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -58,6 +58,8 @@ struct bam_desc_hw {
>  #define DESC_FLAG_EOB BIT(13)
>  #define DESC_FLAG_NWD BIT(12)
>  #define DESC_FLAG_CMD BIT(11)
> +#define DESC_FLAG_LOCK BIT(10)
> +#define DESC_FLAG_UNLOCK BIT(9)

If this patch gets resend, please move these two definitions to the next
patch. Otherwise:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


>  
>  struct bam_async_desc {
>  	struct virt_dma_desc vd;
> @@ -113,6 +115,7 @@ struct reg_offset_data {
>  
>  struct bam_device_data {
>  	const struct reg_offset_data *reg_info;
> +	bool bam_pipe_lock;
>  };
>  
>  static const struct reg_offset_data bam_v1_3_reg_info[] = {
> @@ -179,6 +182,7 @@ static const struct reg_offset_data bam_v1_4_reg_info[] = {
>  
>  static const struct bam_device_data bam_v1_4_data = {
>  	.reg_info = bam_v1_4_reg_info,
> +	.bam_pipe_lock = true,
>  };
>  
>  static const struct reg_offset_data bam_v1_7_reg_info[] = {
> @@ -212,6 +216,7 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
>  
>  static const struct bam_device_data bam_v1_7_data = {
>  	.reg_info = bam_v1_7_reg_info,
> +	.bam_pipe_lock = true,
>  };
>  
>  /* BAM CTRL */
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

