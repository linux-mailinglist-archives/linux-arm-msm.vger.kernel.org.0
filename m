Return-Path: <linux-arm-msm+bounces-46885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28796A277B5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 17:59:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CCDB1886B56
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 16:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78DE621638F;
	Tue,  4 Feb 2025 16:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eS3FzSmK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBED1215F4A
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Feb 2025 16:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738688351; cv=none; b=grQBCbgX/x2sFg6nrm+Vq84YRrWEwrOlQaNrDXXCE3BXJvP+ioTGuJ0PqGSspGdZdPXGaXBr5XdLx6fSn80z9PQL6Vpt8Eou066rwNePEDmBQ9+XtTdSzmx1rD+ygZ06S64Mjkn2/+bfJzTTIZs0fmsNBDYrBJc0bXfhwCiKX3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738688351; c=relaxed/simple;
	bh=uUlsyrwQtEi9EmBI6kvrD0Is8hdHDEkOb7cDA6JK7ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QI4t9MKAqlxnYjeNAE8fpynbyiBju+yIt728+Nn/HOYIEza19yz4F3iUy2DJEDervJ5To6fo1aWugIEHRV1z1YNYtyGz9Jbm2/ImiQCRwRc9jrjA1ty1D1MiHuLm58RBgQmUvj0DMZmwhzGk2bh3QN+vBHZY2lzVHbjL/N/k3tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eS3FzSmK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5149rZgQ016722
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Feb 2025 16:59:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m5xRbtahHf67+tT1W5aG/S00
	eDCUMSTm6m7RtxHaP/c=; b=eS3FzSmK+eLeu76zF+IOpimhJmTgjGvNuLUYqwEF
	ev8h8O+CipW5T4gdNkOCfNY5DPTo+t+6GTCZueOyoDZ2zmCUPhs5fKqBN9u0+g4n
	yOyt3ygKYB1qCZgG7wCgjTYxDF/nyOHCQZMAWpP/z++kPd5NilJIZ1D0dK0+RFNK
	0X5FWoJMPM7Aiq5WgVW1FoBuhJ9kCfFTQhNY95sDCgciCSKNH0QO5G6/zNFfVTFG
	kWlM8c/XaIU9QHIlcU8SQgo+4+7qVcNOC1Pcz1+SDBz23sa+sS672k8nAZQvbg5j
	5w8Ix/y+oKTGK8JnRMy5nDcxRwOuEGPf2DMY6B3vhmIa8g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kgnp91jd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2025 16:59:08 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2f9c34c0048so2675857a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2025 08:59:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738688347; x=1739293147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m5xRbtahHf67+tT1W5aG/S00eDCUMSTm6m7RtxHaP/c=;
        b=O35QmYiSKsPwZJ/5yV+WFLnWLXMlMIhsRLHZMiDNNzCKjGMB03Xu1AlK8p0WaDIxtC
         Nnvo11jH2swcA+kGc6wjMLfAjAqZ22lAT3cUNP+JhmE+xiRKx8OScK5l82nJzk1CzD4z
         eDo/axf0kW9xkQRZ5n1WYzoRCEhhCKbkyqWody122WhaA3pVqxvnc7iQtrf5SE4jS00+
         2AbHZPRPlYmVayOHhEAcE9/PKvtRiUVDCgrPuDLc9ns6YBrJZUyhuRRey2OtqsKqwfxt
         qPxTY6alOoZ8Pgx8+xLVids3GoTlrrSjibAri18izcGQJaBfPW4Vu1IU0BVzoihYhwua
         uPLw==
X-Forwarded-Encrypted: i=1; AJvYcCUPP7YG0LkyUcpxLLEDOh/Y0nXEC1y8Bm1U30E3CWGPEnz0zu42UNfGGVyf2Qf7kGaYW5M9Hm/CZW5JxP2M@vger.kernel.org
X-Gm-Message-State: AOJu0YxGboQSI4HWRLKhCKi4XcfnFcL01yT01TRIM1ZyFJz/HP0o212I
	uKBPgYqjeayZTxZKoD+SP2QChbWv8iE1WrfTNAAI9mNw3WIQgABGhQtits60ikOTWbIiSG1SyWn
	jQFitjiY3JW4CxhqabG6sLjE6XMUFNwRv11r6wEvGp6El/Be01RkYdd4AOoAVljFs
X-Gm-Gg: ASbGnculFzLBUw3jtFcZNGdoO7Vq5/zJy5nAeBAVqOmVK5vl8AJ7R4CFJBGx5D0e8WH
	YASjKnBD1YMBiSUrXqA19y8k8NVTWVgE0Z52a0sfPFmwTwu2HY6dlMAMV5UNg5Q5bSTxGYZT/3u
	ZoJVUgJzhNuQFLwFHHg7jf+GERhU04r8myqbjBO310eVes+gU/fVQAJ0q/iSm5J7e2Ms2L17Ha7
	ITeVAmTGO7jP0PzQ2bbK9z1Uei3175exhuJGW0INi8kLL8XpG6U2hyElfbw6o785XP3/lY3nT36
	BhR5FDjossCnZUNzExCCCC+R80fu56XtR8PmAU3LHBd1HNp7jpDO1/JU5qjP13Ii
X-Received: by 2002:a17:90b:51c2:b0:2ea:bf1c:1e3a with SMTP id 98e67ed59e1d1-2f83abdefc1mr46999339a91.12.1738688347102;
        Tue, 04 Feb 2025 08:59:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTcH4wyAt7q7aTLpPh5THV7kuWDRCPr1YuScJ23G9Z+DsK08914h9Qwkm3YHDVTWmSOOVVgw==
X-Received: by 2002:a17:90b:51c2:b0:2ea:bf1c:1e3a with SMTP id 98e67ed59e1d1-2f83abdefc1mr46999303a91.12.1738688346786;
        Tue, 04 Feb 2025 08:59:06 -0800 (PST)
Received: from hu-bjorande-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31f7927sm98992365ad.99.2025.02.04.08.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 08:59:06 -0800 (PST)
Date: Tue, 4 Feb 2025 08:59:04 -0800
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-firmware@kernel.org, ath11k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: ath11k: add device-specific firmware for QCM6490 boards
Message-ID: <Z6JHWMJFPB8mJfdw@hu-bjorande-lv.qualcomm.com>
References: <20250201162052.3858294-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250201162052.3858294-1-dmitry.baryshkov@linaro.org>
X-Proofpoint-GUID: FH2Zz_zj8-GSqZQQ6xx0vu8WMOYXkyle
X-Proofpoint-ORIG-GUID: FH2Zz_zj8-GSqZQQ6xx0vu8WMOYXkyle
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_08,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 mlxlogscore=795 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040130

On Sat, Feb 01, 2025 at 06:20:52PM +0200, Dmitry Baryshkov wrote:
> Josh, please give a couple of days to let ath11k and MSM maintainers to ACK or
> NAK this.
> 

Acked-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

> Compatibility links are added to follow the names in the existing DTs for the
> QCM6490-IDP and Qualcomm RB3 Gen2. If platform maintainers think that breaking
> those is fine, I can drop those link.
> 

I'd prefer to keep those, as these paths are referenced from the kernel
packages in Debian, Ubuntu etc.

Regards,
Bjorn

> The following changes since commit 722d0d1271dce547df152e5d6db84c139b9f83a7:
> 
>   Merge branch 'robot/pr-0-1738348854' into 'main' (2025-01-31 20:18:00 +0000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/lumag/linux-firmware rb3gen2-wpss
> 
> for you to fetch changes up to f0e750f347227cb1e0008715a27b2020399b5efc:
> 
>   ath11k: add device-specific firmware for QCM6490 boards (2025-02-01 18:10:11 +0200)
> 
> ----------------------------------------------------------------
> Dmitry Baryshkov (1):
>       ath11k: add device-specific firmware for QCM6490 boards
> 
>  WHENCE                                |   7 +++++++
>  ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn | Bin 0 -> 7734064 bytes
>  2 files changed, 7 insertions(+)
>  create mode 100644 ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn
> 

