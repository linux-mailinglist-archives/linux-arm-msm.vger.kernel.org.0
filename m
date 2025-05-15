Return-Path: <linux-arm-msm+bounces-58039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D718AB819A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 10:55:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 594543A595F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 08:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFF0728C873;
	Thu, 15 May 2025 08:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pvZyz1WA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A93128C852
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 08:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299174; cv=none; b=t0Jh1jK1vSfdaPfmyjSlxW/KHQDT/3jIlDjhmUB/ReHTE5hZy9yVkXzG2wwK6YfPOxFt/hK1GduXXQW1w/eMcMLKnH9nAsKRRzKPrcoP7u6JF5ZXGpf7SAeaJcejjfbNDOXHUqhq1W3Gi7ehLDqhwMGnSgtfG5BQY0uPnIeIQ/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299174; c=relaxed/simple;
	bh=FI7sGTrB08Zo/oscENddwqf8I3VuN6qo18yWXr+NkPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxcbaq+hgWeIJjghK/jMpi+cB7iPcbAMjTU2adSPVhsVAlih2z/gyKEVukwbPtj00fEEkedCzN9iZuvA9fBUM/YAMru+XWNJ/WW0jqNWRz3Yvs3Q+Dp6uiYrRK23feVOvmY1PTsXxiK8x7foZCvxi91/in0XMhPef52tevAZn0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pvZyz1WA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EL6tp9003093
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 08:52:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hwaZDQYsVUdsi74SztNN08gE
	i0Qf+CiwpH9GUcd8v0w=; b=pvZyz1WABqrH3iWFcaH6vQ1u/BofwUf+zlSTmbca
	/dtZ75XMShxjLA7z3o2km1eX32eTFN3vj7WWo64gD97nTJc5Iq5VrS9M1fKNeqnV
	L6aaBdTaCEvItdmB3GwXe2Ko9erqm3IasMhQOE+BBz6v9GC+TCRcYSs1OFL22qfx
	sEIXlO/YIHA27Zrt/wlS0uRU011F2tM8BKF9AvgnG30bRL2s2pbM15YYTP/dajJQ
	ekTECu0A/5rS8GyIb8H5UrnAVWTkdx9V5j9i/64Uls0XU8Fysev5EBPC+k6F+6Rn
	IC7iaOxArCCBDLRUCsQ46y2SOYLHldXTjTK1MZS0/eJr9w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcrdf26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 08:52:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c95556f824so69804585a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 01:52:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747299171; x=1747903971;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hwaZDQYsVUdsi74SztNN08gEi0Qf+CiwpH9GUcd8v0w=;
        b=XbkUJdPXC0e7Yvw8DDMz7ghl7ccuiE+94+y9ai2OTP5+VX6gMZMm2h57AkUMqjsq3W
         Lxu7GVvyzGAUSMoBEYIY4xq560hRqChpX+s4/OabSVgXPyDUJ1kndsBXE/1JQr9O95oT
         e96GtqzqaIfCLHhktWn0A18Ln00phH+JfyNxvyhtJaEctB4c5Id9jvGGut5JJkUIrH30
         oZzZPSVsPU/yfHGUe4/2ZikUcvUfcg8UQ7Ub+3DlH0rhQq+bOA6nKxGQX2JSeFx15MV5
         fPSxPdIA/nSvloG8kEP7Wl4seQtzOjEXo9LzVAXYN9ihuG0e1vHKTeztZE9hPXcGzVgd
         bbDA==
X-Forwarded-Encrypted: i=1; AJvYcCXWM+UfCOo2bz3vl0czamvm2uqLmYkysnGd290YRw3meC+neTTjhZF2fl9Hqu5wbZD8MNEW+yJX3pdyMwA6@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyr2/ceefjUt8t+v6Nv0ImOInPO2ptu0ZHJM2m6PjxLqxCKxiy
	wEXnN8UMSH4QKygpaxxvkYQ3rMfajnUpce6TZInuGMYKHvVtyOTW5PGbKwy80A3E77H1mxrhdCE
	wjdkVm+jz1eif5RC8o8X+4efHbkBMxC8k6paDx3LJTpMTk798mex5ijvBW0/umsB5
X-Gm-Gg: ASbGncvK+YLxwP0Q12H1/9+7aQK0V1QkTNsU2V54bWPLGrR2OPhfy+E2+cd55vO3DEH
	RGQeflwSG2lZErkInAOBRjitVTAew0doILEm2XIswR2XpoZXrVNyLap7sdXb0/dIn9gwMSlKn/w
	ZAQ8JaLX/jBG1/AuVIIKxZqOYwTILAwCW87qM88yGZfvhKabmcM5fsBPyyPgPGL5oBbNr5ayzWK
	UMLoOBoSu83t8wKm/sUSy3Jvvfa1dOY7OcLTa2Xp4IgybgY1MEyawhyprHkUHHnzIv56f7ur0U1
	xmWn9uVSdVuUsV4Xwtzo2BCIwcKjVFLGrnQlQWSqAvdfWHWmwPgPpQp8UHmUh4rj3zEG8oiC9vQ
	=
X-Received: by 2002:a05:620a:c52:b0:7c5:464b:6718 with SMTP id af79cd13be357-7cd2888faf1mr1253263685a.54.1747299170888;
        Thu, 15 May 2025 01:52:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQ+BiR4gB9vfsEDZ2lofj7FH/2yViqW+rJhsM6lLhCtfcarFZ22RLGIEcYHdLuh4PfJ1Riig==
X-Received: by 2002:a05:620a:c52:b0:7c5:464b:6718 with SMTP id af79cd13be357-7cd2888faf1mr1253260385a.54.1747299170523;
        Thu, 15 May 2025 01:52:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64504c1sm2555886e87.52.2025.05.15.01.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:52:49 -0700 (PDT)
Date: Thu, 15 May 2025 11:52:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sarthak Garg <quic_sartgarg@quicinc.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com
Subject: Re: [PATCH V2 1/2] mmc: core: Introduce new flag to force hardware
 reset
Message-ID: <rkmqeiyha2wldtm64ndcs7hssqvwsrqr66kwh6w3exbsyc6c6n@xhqdh65af7hx>
References: <20250514111155.10896-1-quic_sartgarg@quicinc.com>
 <20250514111155.10896-2-quic_sartgarg@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514111155.10896-2-quic_sartgarg@quicinc.com>
X-Proofpoint-ORIG-GUID: UM1ozTMg0Lxf89fqmVnusrl9fBy1l0Tf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDA4NiBTYWx0ZWRfXwtZkGPZf7yaY
 CIpi79eu/DBpdIWQm52NHc5nT9kZulZ9NcSZFwdmW591zht2uOaZvN4PIc3sT3HGpL+xrwcKb5g
 WOhL4CBCpQNlv54XeAnD1dhndF3xhJVdscAJwUBQJqOKJPKi530MATXqWugq5GXM+vbmoedFY8R
 8kwbedjFvSGYD550Rftq/5+49YZFujgWlHjHsrrf0GVKiS/kyXw6DrSKRyiZl2WVLZFQnfRkE+3
 Wg7vrIPqVPEFXsjv8CJw3tSY9sFxFfwcbsfd8xkeayO4Nuu1P92DtIoN5HMYBrk4MGJYQSqO+17
 q40svsx8HeUntIIJczOXi1skpXH6kyUN9Ox3odfvUeU5ci5yUSq4xYYjOtllEJAj1HqDt+P1ZgU
 SwXmaZUSZTzEykkToPzHf9a3HNWQhobGkt7k4Jy87Zix2F3Ya61bWv+X6G30EIx+UEjZzzSA
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=6825ab63 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=QyXUC8HyAAAA:8 a=Dw_yFD_fkBKW1skOv8gA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: UM1ozTMg0Lxf89fqmVnusrl9fBy1l0Tf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_03,2025-05-14_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150086

On Wed, May 14, 2025 at 04:41:54PM +0530, Sarthak Garg wrote:
> Introduce new flag cqe_recovery_reset_always to allow vendors to force
> hardware reset during cqe recovery.

Nit: CQE

> 
> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>  drivers/mmc/core/block.c | 2 +-
>  include/linux/mmc/host.h | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
> index 585c2b274d98..dce2fb762260 100644
> --- a/drivers/mmc/core/block.c
> +++ b/drivers/mmc/core/block.c
> @@ -1622,7 +1622,7 @@ void mmc_blk_cqe_recovery(struct mmc_queue *mq)
>  	pr_debug("%s: CQE recovery start\n", mmc_hostname(host));
>  
>  	err = mmc_cqe_recovery(host);
> -	if (err)
> +	if (err || host->cqe_recovery_reset_always)
>  		mmc_blk_reset(mq->blkdata, host, MMC_BLK_CQE_RECOVERY);
>  	mmc_blk_reset_success(mq->blkdata, MMC_BLK_CQE_RECOVERY);
>  
> diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
> index 68f09a955a90..d686adf75293 100644
> --- a/include/linux/mmc/host.h
> +++ b/include/linux/mmc/host.h
> @@ -554,6 +554,7 @@ struct mmc_host {
>  	int			cqe_qdepth;
>  	bool			cqe_enabled;
>  	bool			cqe_on;
> +	bool			cqe_recovery_reset_always;
>  
>  	/* Inline encryption support */
>  #ifdef CONFIG_MMC_CRYPTO
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry

