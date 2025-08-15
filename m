Return-Path: <linux-arm-msm+bounces-69412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FDEB287FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 23:50:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3CB9BA0E30
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 21:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA7A2253E1;
	Fri, 15 Aug 2025 21:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqeXlKVL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5062F21D3EA
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 21:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755294621; cv=none; b=CgXba4vqaVh9uZOeVLHXUUl/nroRw5SZffH/HjA5k453IS1y8gu+m4bWUNbAa0mcjMwCF2t51gJdJMPwKov49a7e8kcRne9IrFWrMNITYsRYa32KrPWmRq4Vub/UxBgPnAW8o3pGj8QDpe/Ic+EBfWUAk4sVDsAWaf+dJ1N4rV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755294621; c=relaxed/simple;
	bh=ac6REAN/JqiiNucTg9v1LZRbSCQNXBlBx3v+c0Pm+HU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HOmkOIIi0qiB8HUut87ANhnH67SM0ANoxH4TEQSRIJZaMyL4ZizJ4q27zV5jnD9bziW+OT66YuFfS1f52CAd/62OOsvdfNUU/nj/qYjbr9dVi1H+4+eA0sq3vni8KNJhVmyYujFmDcKvlOJMWWYx9ZWOOh7Ro7Lpby70EyiXfKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iqeXlKVL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEJ5pW002261
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 21:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=l6biuOa3UQqrG/aG5ZQm2Xkt
	ryFNEMSGQa2bcvMVOWY=; b=iqeXlKVLj5lNIrOGE4KCW2NwLU7/kf2pl12Y0enR
	subly3hox08avcKdk6iuBsTBj8BJxnSmIqYrkTWSVA1FB2FqcnOgNYvchiJ1eudj
	vPj5JsRTz0XcOCaYke8ILhL7AljiyO+JuWpYN5Miri/Ai6Hj2zEyWi1jyRGveLwJ
	/zXHSsq/nqimf+PVZGi26WBY7nx2XTIomrXO0Eh2THEa1tpcuwxM39XG58zCMThg
	yoL3TfauXfqyNNLojj4GInTkt/107M0ayxIAbnQNGcVkdZq731l9eMegol3JFf9D
	6GgqR14VL25TV5Y6tHvY7hk2PgGftkMw5DrU9iLRo9ZyQA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdvc97s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 21:50:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a88d99c1cso47528926d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 14:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755294618; x=1755899418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6biuOa3UQqrG/aG5ZQm2XktryFNEMSGQa2bcvMVOWY=;
        b=p0RWTPf+DifUDxz/MXW0a0VuhSEfLtu2WncmT0TDeX5TnQ9sD/UBvwErRIVUVB/NGW
         FOGWL5dj0EHmhggIgPbo2ReYo1JNneXRSn9c0XZZUGwVUC5L9ctTB0sTRoANiFX7wHRP
         EDgYNmdKGVOKKQ2w/NinZGLgqesejeDuuW6an8RkLF6YzzQ0NJF+YeaYURM3q42X9ypU
         X2sKMMroneD7mOFzXj+gkFrzQoSrMGJEeROURUKqLIiY20jAl8TVxSCxb2wIyDEd6SDv
         kNor0CUNyxr2+fFrBHH7w7yIKNYRwgtjz93OtOToS158HpqwienoM3tdGubJf2rVYGDS
         YnRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXReRTSBL7fssDsWc3a+z6NU0j/9vsopQUJEQgnfwvzoUybuxm8beZjFK1IKqClcRPyvjH4NJGi7uiqbzc8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9SHMqk0er2FGCG+Z4zIjjs+bhXaVfg0HJ/+NJfGpQcsVXk0zu
	Aa9h1ih0Z4AJHL8tAgcyhXDhAChwXVJgyO+2pNbgoMix1h7eZiEv84B700mbauhHAE5tNeCE+PF
	A+Er1rcvngPcnrZw95VSLGxu1/dZvzGI31GIfIk7L7xTEpblEsMIHiaWcQAke8Znb+V3h
X-Gm-Gg: ASbGncuub49BJVDsckH5khgXh4vYKsyGq8ya7YB3EykICyDAV8NB3MLD3fbhcVYM6pb
	KTOjUkYoRfKLizzCE+2GfDB9oIUHEno04X+2iFUAgDiIFrp95D9q00LROUpYqDz6dOuYrHg/Wom
	EvG+L3EI7BpXlAXVxf0KFgVtG1iSfeGVeBrh1pJw7JIt1h3bUmbXVIjnGOlhXHMvw9AaXRgjksz
	jYSkHT2LAeoGmA2UOY4dYKGhOuooeSLAqd2mqVE9cebrzRnbevtjgtuZsoQjbSH4C/VIDjAiR+E
	iNvsaDGoZc8BBCkDaLnfUoaRhpgq3CoDWFLis8FSzUbZs3oxCVo0jIYzzlc1jQfJSQH35WEv7XB
	BEOmMxkcQpSZR8nnTEsZOg5AGHoQsWD6V4GnQUk0Znfq/AODsMvgP
X-Received: by 2002:a05:6214:21ea:b0:6fa:a4ed:cce5 with SMTP id 6a1803df08f44-70ba7c64341mr46773106d6.44.1755294618273;
        Fri, 15 Aug 2025 14:50:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoBDgThzHLi7aS/ngV2P6hg7JYNx9cDvk0VaYMWTVe/02CHjMjhOZeKmEk9YV638GzF6fEww==
X-Received: by 2002:a05:6214:21ea:b0:6fa:a4ed:cce5 with SMTP id 6a1803df08f44-70ba7c64341mr46772876d6.44.1755294617753;
        Fri, 15 Aug 2025 14:50:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3514cdsm503149e87.14.2025.08.15.14.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 14:50:16 -0700 (PDT)
Date: Sat, 16 Aug 2025 00:50:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <quic_shuaz@quicinc.com>
Cc: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_bt@quicinc.com
Subject: Re: [PATCH v4 2/4] driver: bluetooth: hci_qca: fix host IBS state
 after SSR
Message-ID: <ndgufkvb7gkqeco45xlru2x5ai335s3vhx6wso7pksqcyfdjll@azfjjboa7bc4>
References: <20250814124704.2531811-1-quic_shuaz@quicinc.com>
 <20250814124704.2531811-3-quic_shuaz@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814124704.2531811-3-quic_shuaz@quicinc.com>
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689fab9b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=MNOoASI8n59Jp-IQCpEA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: eIUhkEJ1g9L0J88eMWRUPWUcJzIjZMe-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX4o/N2i2AMJYP
 a15kD/OYPT1X2Aus70++OyJBLghvRFlYU9GTf2N4VYAp37Jj5a+N//npF8W04naFavdfkg19z5H
 6grso4TkbnLHO8ti+4rJEj1ZPVHqA341zmkcU//Z8DphFz678xaJwftY6V6QX0pI2cTN11X6N1g
 3y9vhZAJhKBeX/K6y43BLXF6QR8ALJk66vvf9BklANrb0tgfdmBugpgtUScO7sRMmNMWbFk1LjP
 Zwzrq/p7rBhvJnDMzwnz4wTNTPwjEDAQxqKcWQ46y4EQP6+v0dWDjeAJRCiCPmJl0Rwc30P4Hby
 V52LWZmxKnZMGHpS+NLcWvhTWJJmLPtkA9Ph9bdumyU1FpiOYpa+bv8zol166Ad3p09O/9sCvLt
 MxB+ayHS
X-Proofpoint-GUID: eIUhkEJ1g9L0J88eMWRUPWUcJzIjZMe-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_08,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025

On Thu, Aug 14, 2025 at 08:47:02PM +0800, Shuai Zhang wrote:
> After SSR, host will not download the firmware, causing
> controller to remain in the IBS_WAKE state. Host needs
> to synchronize with the controller to maintain proper operation.

It totally feels like all these patches fix the same issue and should be
squashed together. Please also add a sensible Fixes: tag. Possibly
add cc:stable too.

> 
> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
> ---
>  drivers/bluetooth/hci_qca.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 91009c6a7..d37cd2368 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1660,10 +1660,14 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
>  	 * QCA_IBS_DISABLED flags cannot be cleared, which leads to a reset
>  	 * command timeout.
>  	 * Add an msleep delay to ensure controller completes the SSR process.
> +	 *
> +	 * Host will not download the firmware after SSR, controller to remain
> +	 * in the IBS_WAKE state, and the host needs to synchronize with it
>  	 */
>  	if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
>  		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
>  		clear_bit(QCA_IBS_DISABLED, &qca->flags);
> +		qca->tx_ibs_state = HCI_IBS_TX_AWAKE;
>  		msleep(50);
>  	}
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

