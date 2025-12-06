Return-Path: <linux-arm-msm+bounces-84572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 933ADCAA594
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 12:45:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F164C3047957
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 11:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D84F2E0916;
	Sat,  6 Dec 2025 11:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a6v7ADCx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jUjRfuzX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BCC2EA749
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Dec 2025 11:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765021498; cv=none; b=u//OyK832FcggUrLN2eQi2OGS5313++QDsjEaocnNJGuzlks2hnGVeHORtvddoSL2lgjfMTF96g3c6qu2WbLXq1g8szLeFV811PnLpX/ma+FOxVDJJFeJ0T1/WWiwU7dIILXDn+2n358M05JV4NLZ2zHJSQHuHDhVuKf3ZvEcCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765021498; c=relaxed/simple;
	bh=9OMHApkzIG49dRkSfAQFME71Alpd2HcvfbAgDoWtiRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kc+jnf4mBaz1DlAtcfGDZINhmV9Aindstyt9hLHfLqcOAcpIMKIRFIL4e9xY+rY3B32sHfiID4l3wFU2/pPSyUNzdirBT0in/OfPaVJTHDJblKlKcRXvnM6TJFCk+YEzUst0zyA14g+gBJgF62wcy+HhOQG87cUJcxW33rVtcPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a6v7ADCx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jUjRfuzX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B65YxVJ3103614
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Dec 2025 11:44:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P5rGsK5QqxRVUAaqI0WDgQNV
	059B7nGmE4iibyNRAgk=; b=a6v7ADCxCPPsj8T+Y2YMBbv3SpWdUkU1H+f6fQYZ
	I65AUc3Sn3rMINRu/92pE+GRVVUq5o8zM/VfWIzkhnLvvc7UkWow3AXFW6W2q3P5
	8Kc20rDPydU0MILPD6AiXW0wrN5c8+HocQiRkGCFWKi6ugw2lLUNGDp1rmCSwp44
	c0iOkcXtNxubTRgGcK/sCsldvacdBTL9m+oZUpKojKKtQ3o/3FdZoG0YwxXrVmnp
	iy5kO2YylDqeOxGAccRVJSazxz3k5emGprtGNLq+ObH4/DR4Fykb4pHDzYnnbF6Q
	v4RVWpNvmUS5/j7P3Zza22qKm1gVnoIy1u4jxObyBZH9Dw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avbga0rm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 11:44:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-882381f2092so58573566d6.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 03:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765021495; x=1765626295; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P5rGsK5QqxRVUAaqI0WDgQNV059B7nGmE4iibyNRAgk=;
        b=jUjRfuzXEKvrYeQOrIkTuWp+Cht0eUpPf3F7T12qriPO8NA19p8QTifM3EOkA7VgM/
         nOW9RgszC/c2TYNeY71XuBFIUIcO0M7Z7HnSL59i4PkZVivXzvyH3S/9wUR52thCGVDL
         Ad8mjRlkoBTMqHkL755/q5ayGDsOMH68mSDpNJOAdiEf2g/jQ7bcO+xx1TUNs55CbEAH
         jYINExaBwgUCP/odhlw8Ht5Uh10Nqv+If2uBxgSH5bsDNftAG9PAJN45kM/0wiz8PR8t
         oZjHOVtYn8wPZ3DTsK0ddAitJBSqxgN4krBorb4BDLSCX5OwO5p08rODblbih3IBxX8p
         jzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765021495; x=1765626295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P5rGsK5QqxRVUAaqI0WDgQNV059B7nGmE4iibyNRAgk=;
        b=ceIDw9xpm4elbZwYZNB7AKJsAjeWmLbvtUHwLP16MBLYHY8EVBemlaBFVy/L1k2bql
         upYE9hEHlz6KY4dOoin3Sko3lAmv0P3S+BVL9gKxIttxkjtzwzh1nlil/qegkl5kLWTN
         9XTmMrSY9/D7Ylo1CJcgXLNdxJ+4hLPCBn2RE/fIgM9egFRuyX2AVAW4FR4RvSGbeSAx
         CWdhZxFdF4guo1Iy/mDlSDOPoOnoEqoYsc784TLYrPULKSI7XeG1Z/xBHXY/B3tDsyfp
         04vmS0CzMv6opxivxt0+mf7vDwgDqHfoiUtM+EkdduD1e/tqvxUkB8tSdfx4lIJJEoIQ
         sYvA==
X-Forwarded-Encrypted: i=1; AJvYcCXN2CYk6+rEmThaH0t7y9W3yx7VYQ/uMbKp74N8t/8K7ZAt6luwQrUH9CG7YIiPLngBw26y7Y575AFBFUQX@vger.kernel.org
X-Gm-Message-State: AOJu0YzSI47TAHmp8eO18OGIY0NW4anIiky8uuUgAQbDIvzIyigl4hZM
	rw4m0hzNyjha77rcl5I/zOENRa2WQ9fCof1ICeIRERy1HQTMp7LeVev9DYTzaGBgT3hGj8fNbEm
	XoYHu3LAre0TXqpCosmj8vxv9FJ2vobH9lvdR15GWHLulJTuQypN330fpd3Nytji8va+i
X-Gm-Gg: ASbGncugj/wYM5UtpsUZqKKzavgHGmkK/st6bAyEEPj/l5DaVLIgkNd7f72Al1Fi0bk
	ioHpNzVZGsjfA9TzGBbdI8er4xCZtxpoGLvtRrpY8JsrL25wXtyHT+7GQMU0rGDGi4vamc88rRM
	4w2CKQGCRXLXLdvb2xettiYuRqMHhS0opc9k+dXLvgPsBRl4BJsChat2HYcG2r0FUk815MGgapw
	qGcpQ5ok1gylciCSOCv2jY8Ph2bfYR2rcbfwNhxf1gU1waAKfj8fTj5e7bmJyGmMKjCA4AL1iPa
	qgqXxmBdj1sTnpgRe3tt9JDd2CNdAYDcwPIK7o/V+P+uNzha/Wn+rtOq+UI9y/FOlB32GyU0UzU
	VOxxGkaQ2wxco5WJBQhJGrH6AUciIc3PTNqmdHDHkQAqiF29YhA/PXQVrGsxnBDPFgWJ24HBIqD
	cAfTlzp/JvFA5IPuRwmSM+ZbY=
X-Received: by 2002:ad4:4eab:0:b0:887:438f:c40a with SMTP id 6a1803df08f44-8883dc28d50mr36658346d6.32.1765021495039;
        Sat, 06 Dec 2025 03:44:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpxcMtM6xcqRYA7JSNpznEFhk4xBjRDm3jrSMoUpDSyNOJHg1uxxVfLvEP5+cD8A6FmTiQSg==
X-Received: by 2002:ad4:4eab:0:b0:887:438f:c40a with SMTP id 6a1803df08f44-8883dc28d50mr36658066d6.32.1765021494668;
        Sat, 06 Dec 2025 03:44:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c2e2a8sm2380406e87.90.2025.12.06.03.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 03:44:53 -0800 (PST)
Date: Sat, 6 Dec 2025 13:44:51 +0200
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
Subject: Re: [PATCH v9 03/11] dmaengine: qcom: bam_dma: implement support for
 BAM locking
Message-ID: <d7dvcakczg5rugn2jnpx7kaqsbqhgpicbbzmtxdviha2qdnm6p@n52lxjzomu3v>
References: <20251128-qcom-qce-cmd-descr-v9-0-9a5f72b89722@linaro.org>
 <20251128-qcom-qce-cmd-descr-v9-3-9a5f72b89722@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128-qcom-qce-cmd-descr-v9-3-9a5f72b89722@linaro.org>
X-Authority-Analysis: v=2.4 cv=d4z4CBjE c=1 sm=1 tr=0 ts=69341737 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=u0ZkndI9OmTMsI82GJsA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: B3h4PnLgCok8xtQ3EONQnKgVRkkDz1Kz
X-Proofpoint-ORIG-GUID: B3h4PnLgCok8xtQ3EONQnKgVRkkDz1Kz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDA5NCBTYWx0ZWRfX9NWWzwwQWv+M
 D9Z7+ArJmpEjdQRlwBLo3fka6qnVSEH0IHnItWry1wPOM92gtuct0C3m/Ptoi99JNc/nzUoeIXz
 yHz8Zg54F+kUvzWPl33MIWzPKm7eXxnzEam5F/cJGSFw99axNoBdE25D/b7hciIyMunteksn/o0
 iAzmPceRV0K5GsKFLAi0dX34EfNcdmhQQp7LUz9DAc65GXEIPajnFh97uOLE1Cu5Nzb4hXIxTl5
 1bSye8vAzLJu/ZzF5EJTqfhJ48sC9VnkLKYoStwkjIIQZK7q+AUrLJAOlTT3Yj/ZMsktWjGNdzP
 to7uSfreKip97DXCnNc7mLZFc0wDYWdgGP3aYh9T5phX1Cn7UuMMYUurQTjMxPb2BQtOAZhLNqV
 3fUbMM6sO9RVs572YFpVDlePB6DOTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512060094

On Fri, Nov 28, 2025 at 12:44:01PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Use metadata operations in DMA descriptors to allow BAM users to pass
> additional information to the engine. To that end: define a new
> structure - struct bam_desc_metadata - as a medium and define two new
> commands: for locking and unlocking the BAM respectively. Handle the
> locking in the .attach() callback.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/dma/qcom/bam_dma.c       | 59 +++++++++++++++++++++++++++++++++++++++-
>  include/linux/dma/qcom_bam_dma.h | 12 ++++++++
>  2 files changed, 70 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

