Return-Path: <linux-arm-msm+bounces-74868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9102FB9D210
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 04:22:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A12961B26D16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E0620FAAB;
	Thu, 25 Sep 2025 02:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NPBG/+dF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3859720298D
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758766934; cv=none; b=Typ5Q3cLYEPKVLdOAzb8E0YrtUUFuIRPVuE1Xk9RVKWVc5OIa/PMV4hFtSX8B0kOM2xTj7p9UuQS4BviwfwoCmGqS1mL9Lso/1IBTcOuo39Qhz/GpT1dRgVD/5/xgJ5Iw9h+5hL8sOPBUaK2Qw+jYRf+myZ5AN5grkbzwicIqPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758766934; c=relaxed/simple;
	bh=SAIzaDdMUAJ2rdHG/AL+FmlpaSt9Uj9wjE7RUoqyGf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QxW7IIOd3nW5V0T1t6JFALFz3i2RI+Uq/doRPpvqvMQv0HizRX6Bhm0+3pSNXa948+ViK2Bkq+8f4Q6+7phoukAkYSvAVyoIDRKH31ZDOzg2GyEjltTk/EINtHkaq1HZE3TwsEcyvBWQGMRcPQBq+IPvR05Tbg0s4Z4Z7paFhdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NPBG/+dF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P12CqN019934
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dQYPg3HhOquErMj0zn5jCR2P
	8Pl8Yt8r6+LWmbHs99w=; b=NPBG/+dFYB119H9dlqihCt0+3kwEGd98EYVnJVKs
	uLyeXaGmFyDgi1l0qSRS06KZ9R3tWlxqEERD+vZdblMx9t2kB8D+iFvotGX29Eto
	Ow1Xh+vvPi8+PfSzlQ3es/HfxoDsRKNEQlW1zLm+pPTRhpwgS0qJ77TRuCpnmEim
	htn1k8BbeAaKZC9PLzO/hIxAzN921VYnAqh5e5EViF/mE+9Y/oRac2GHZ035ryrf
	I6YlUjJkPMdRCD0BnE81wFU4r5xOqhCk1QRLAqMlWTmw0oNJ5lxiEXsxC78xaXtC
	13TxMy79hCmKcXjdOaoLxUNehk0VswTM2oazY0zEu5DAig==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdyn1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:22:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b5ee6cd9a3so14993301cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:22:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758766931; x=1759371731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQYPg3HhOquErMj0zn5jCR2P8Pl8Yt8r6+LWmbHs99w=;
        b=JQNVviYdzsYJxbTVafpnE0uqwfZOsg36PREe2BhwpDtvqMLQeggNjije4ikMEAj1gG
         GMvMu5/Vkp2xeeqnKtBrxGwqQPXm+DS6eGDFc7B80BTYuDr+hLo9eQGnb1o98ke7bAnW
         9ACSXAtijUrUvj1G5M/qJezW34zlTXbKaY/0NmC8C5iLwYevLGzlcHgBW9ru7xKmPf2T
         FOyGjFsLzPssEwBMuszBlSGNqHV+2rFfVi4JuzQEnEGepMY62JM3RM8eQlx8AYSbDBVK
         7ZpmHJvRsRszY0xl4Ef4xSpJht5qvGWy8/esgxT83zCZkl0u3C2kk48VAmUlY7XV6J+G
         3gPg==
X-Forwarded-Encrypted: i=1; AJvYcCWmZbu7otG0r2bgBd2Bf/64fY1GkoOHN2xh4MIXBd/4nzWrWGbMmvrphJOMihgS3AEKhpstZK5C9tUnoOU2@vger.kernel.org
X-Gm-Message-State: AOJu0YzCYRE6Vy4BNWXsAEjicfXutYdhkbkSWzASa/5Ygrd68lVkJZ6r
	F1a2optIGIcs1z0BJZA4yvSbmXB6cO486ZSWFW3ait+Uhab3DNjrtOOrnBNXBGb+ce2TMZQZODx
	RjJ5TZA6ZrVQVdAmTdGva9Ie+axsmfOTCIYb5ETfBUphvgegvkFh51zLDxm1ir/1w4bNU
X-Gm-Gg: ASbGncuc5P5LZKiLzIi6EwsUcGgcpoQFKjZfzssgXenIKjbIGA35olgaFpMibQ6RmdR
	QAqm2gFfN19mylF69m0QbqGb9YIinoGmfFeKdmcqETrypWfzFdAQrOZ6pFkYQX/m9bTQy/yGZG6
	PhVIZLNCDPLIe26/3ftVrLcn5e5M1TXgPLsOcqwlF9yvewZa0uv3XUzUBjSS6KVAScpp7Eqi0NT
	/AhU9pLqA/a0O3pv+JxviAy6Z4u0WUw4Jj+4FmzyiI50KU7BXG/uj+pUDjs+9+lUjTmY1MOE0xH
	J0J+i2PiwFsfvsA/qKI726M5fBbqtpQukSfBFdvURsPRO34s7fC1jic5x9v+nDDW7Oi3VgVb8uT
	d2oD4m2smbOVFRf752/awceQBx/czRH0zYwoSS/s9dMyyXd8galau
X-Received: by 2002:ac8:590c:0:b0:4da:207:f0ee with SMTP id d75a77b69052e-4da48b8f2c0mr24381491cf.32.1758766931067;
        Wed, 24 Sep 2025 19:22:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoOC/fEzI4rceoqPp5oihtG2BcGKgFCO8hZQHirGiAevUv0zoMqSlWcGxq7wq4yqj1AzFK0g==
X-Received: by 2002:ac8:590c:0:b0:4da:207:f0ee with SMTP id d75a77b69052e-4da48b8f2c0mr24381281cf.32.1758766930642;
        Wed, 24 Sep 2025 19:22:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316656989sm241066e87.90.2025.09.24.19.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:22:09 -0700 (PDT)
Date: Thu, 25 Sep 2025 05:22:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: pd-mapper: Add Kaanapali compatible
Message-ID: <vyto6pxsld2h4vhzzmxvnyu34vil7fgefnzauz4adjipkpjbde@ejszs2z4hlsy>
References: <20250924-knp-pdmapper-v1-1-fcf44bae377a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-pdmapper-v1-1-fcf44bae377a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: _Ljj4F1f0hoy-7y6xniymbL3h0TUmfPp
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d4a754 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=97l5mCijwCuAxZHkA_EA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: _Ljj4F1f0hoy-7y6xniymbL3h0TUmfPp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfXwpGBFqK7qQjE
 cqlwQTUxYJ4ytYQlGddoYbhBtzyoy6E/TCoASmb2jaOeVMVYatmmw2Gzw6zlHH52CFDUE9/iyQA
 5RMZLQfWNGguOGzSD7e4BDblJXB9s186XvNiK1vsHTMnlP2gLhK7QPNe6qUtYfjjCOfKa1aw7HP
 MlZ0KUDJcIlxOYzvE4XX9sTmNn88Vpz4+OJmX8j7pT1/I06IDg2+k45WkL+Xv5sFslDfAF4x7eQ
 9ihdHL0DbjAoewYTlcjt7DCyGqVHnhEEyYIPM6e4WuxWwmfQU5mwF51Fuq6DdoAP/vIn74BAYBQ
 N8MGWDm8rqTcNI/Fi+y3T7Z13MsjV0b4b6bVAlAco9O5B/bi4UQwVTHFtcHNDO+bdWa5m0Jksmc
 xg80FGtt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

On Wed, Sep 24, 2025 at 04:58:09PM -0700, Jingyi Wang wrote:
> From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> 
> Add support for the Qualcomm Kaanapali SoC to the protection
> domain mapper. Kaanapali shares the same protection domain
> configuration as SM8550, so reuse the existing SM8550 domain data.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/qcom_pd_mapper.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

