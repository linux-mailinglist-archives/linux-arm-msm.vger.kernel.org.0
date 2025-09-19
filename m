Return-Path: <linux-arm-msm+bounces-74227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C04B8AA28
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 18:47:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAFB317EBC9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 16:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB5326F28A;
	Fri, 19 Sep 2025 16:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K+xaXDXh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890D025FA0F
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 16:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758300420; cv=none; b=WLfxqebcSCI2dPTubRjvu416DUQuFFYdxgRqebOtfb5Nzw8D9/HcK6dF9MCQ7pWWf1fXu//soI670K7Z540hYe3aGBfzU832FPFXpG6kNo9Nf8RAJG1TSKdnfEeafP+t3SXXt6buB4j3b8GW0FjAWPXmh39KvCzDEuRWdTeMpEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758300420; c=relaxed/simple;
	bh=ICtRGgVbCGG9PUkDbHrB6xZ+UsvaoeBqwrVPiRFbC24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MEoNbYYFCzjW1NAgtGXpOqDXgkwM9r2R804WJ0lUiHj9CwdGoD+C+5H9IVeVcZ7gxyEQGVDEZ416vcfYnvbHSCfRwTpvnkuQaSnkS54TdDeQSh2dUsA8rlZUXfUR87P9b+0nZ4/xSamW2ywJE1qo0rHMOpF4iyFs3tqoMAlCOVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K+xaXDXh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JDkRel009015
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 16:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Um9tx/y2LwR08t9HZZiDTcTu
	T9zUc9djMRm/CbZ+X1A=; b=K+xaXDXh+okpJGZMNks2h/fbPmM1It3/CUsPmBKo
	/ABpAwdjxm57Q5qXX0C6YdG7Shebb22WpRZVdpi7DZr2iYAnHxLRjnrUFDbE16qr
	wFJucqIb3lGuQS4VfzJ7E+RTzCPWZTFYcNissZeif3uisAwVateOyW7AOqkn05WT
	PF3o401V2KKewh7kCA8Naz8NoeD9D1B8QRUkgy7he6fNAbWk4YhNnQCTU8OuRtPG
	wWyx3oX10GhZI0/wHo72nGQ+ykuoj/jni8FT3zttzwWHR7rYkw9HvAuAEwyhh9bu
	GK0aW48pMOde1CF1FYc4POvpMriWTEOgIW2DGaITLgGuDg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 498q9dbk7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 16:46:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5f6eeb20eso73176511cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 09:46:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758300416; x=1758905216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Um9tx/y2LwR08t9HZZiDTcTuT9zUc9djMRm/CbZ+X1A=;
        b=p4UfGayzPRuKGCkkTRtI8qD2odwsPN99qUl0l7Te2Y1fWCTChdAnuIesEes8PXp2i0
         qzaBf/S7e69/k8xPrj5JmHZNGNOFaXEnwUbai/nQcexkryL2xIRYCSBoth69XLaJMgqy
         f/9G2dNqPObYSKd40QZ3CcuPc/GY1Fg8LfvKwKM3Rabjw8qI8A4+MNin1F9OnTtaS5yM
         Hfb7N/+EyTevCeG78gnxmFIhpgeERogj6dPtqGQ1ES5QSLmeEO+ENJgpuKNMy+DM1EpF
         Y7Pw31QVH08UucRQwtI6GAxfUG+QSxNAhY9Ox9MOPRHwRemtwpc6Z2tQN57o2ep3Ufh0
         s82g==
X-Forwarded-Encrypted: i=1; AJvYcCW1MUuRtO2AdQdf24n/s9i22bGTKcMGJ/P98egHcvXwc47duQXg/jtuo8XanexckJKx6pfXQHqIwSsQz/6M@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1Pnf9wXfShyTMpmPDIgYB+K167eBYlAO3XtfclhXcbaDBY13w
	8QTUE2eT0jrVomWIo8lJb+Q6GdgKdOKd4F7wnRJdfVLDPRMZsD6/PCOXF/7gBCpciB7DjObypvu
	OZVyiVQSBzRu/zTWoWu2CiFTvaWRZPhrgt66JWCm91OHTslNIcrhlR2jcSVCsG5vfvoxH
X-Gm-Gg: ASbGnctVvDUG/fA6C/wDYf0nRY4DYy41EpcJY8zGWkfSwBxe6MoGpD1koZ/Kad0MBWW
	0klKdPSX+RRKjqp56d4o4Om13DpMXDQnAFhtAvW9/1ZWt6NNt/C8DWR4gVDbNB8gwLOZMzZHBI+
	R/56jXh/ZXHORWNX5ojIXzO8WVh2NBn7Wb6RCmah9ky/vGt1zdBKOkQPe9YPCvEMZYch933XB9G
	Bt1n9T9E3D8+3raqsNcoC1ssMxmOai5jjUOVxMRAKUk2BF8HW1sjmUnkjEHcxlkYSRIT7/b/dKy
	4klKfXyxvBKHc6VlPYyNPuDj/q7PTKk6jWuSHFJg0h+XvuNEhOWCuhYTTe8h2HsLP0pTIrTpmWr
	Vw2MiTc/eQw/yFx0ANDDrBsfWLO/Rfcx0SVL+frDPHp4C+D52vN8y
X-Received: by 2002:ac8:5f8f:0:b0:4b7:9b61:e6c9 with SMTP id d75a77b69052e-4c06e3f84c7mr46464901cf.25.1758300416417;
        Fri, 19 Sep 2025 09:46:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDuHu+pCXreZlW6yMOlA1oYpTJZZVjarPXitMYqbWZSgljRDCeRfsjix8zFXY3l/JofzsvjQ==
X-Received: by 2002:ac8:5f8f:0:b0:4b7:9b61:e6c9 with SMTP id d75a77b69052e-4c06e3f84c7mr46464201cf.25.1758300415762;
        Fri, 19 Sep 2025 09:46:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3624319eb49sm12152421fa.50.2025.09.19.09.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 09:46:53 -0700 (PDT)
Date: Fri, 19 Sep 2025 19:46:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v5 06/14] phy: qcom: qmp-usbc: Add USB/DP switchable PHY
 clk register
Message-ID: <xtosrpz6rzdvtmpyq73gboeckl3c2x23iqehlxzbaszqmzugjd@ixhj25qujqxo>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-6-eae6681f4002@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-add-displayport-support-for-qcs615-platform-v5-6-eae6681f4002@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YsAPR5YX c=1 sm=1 tr=0 ts=68cd8901 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=LgMYyniohzYkqyhK0zYA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 3U7n86FfYk0ucWxdwsbGyXNky6O0EukA
X-Proofpoint-ORIG-GUID: 3U7n86FfYk0ucWxdwsbGyXNky6O0EukA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDE2MyBTYWx0ZWRfXzuk883r+cs+L
 /Av09WCVVpOR1qjVtV/pS0Nvyfa5hedUzIpiNnQL3o7NbyeGoFqtBn8daEW3mj2WvmbDEDlA876
 mlNZivxH3Qb7QzWn7WtSy/mCVKrbrJwLze41cFj5X0GjcKrRekwusfonestPaw2ruU82eRVMHat
 Xj+4esoJLiDddrQ6Jf97P1M9C+GYtaN4X5ACCFXVkHvonzUSBCjE3UnmgTf0pGon9jwOU/S0MdD
 B3CD5avHC+EKyHX3ZUwUCTvBn8JYvxXFNV5q30hhmPWr5aUZA2yqEC2f2RgfR1QdnLEBe4x1Mgm
 xK+YPOyr6rnQNhxfl5T9I9MBSm9zQ6YiS8W2jFdTsO8Pb8XHawfGlM5fkXKV5+TA+yo8cuNHHpj
 /+D4KEDD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509180163

On Fri, Sep 19, 2025 at 10:24:23PM +0800, Xiangxu Yin wrote:
> Add USB/DP switchable PHY clock registration and DT parsing for DP offsets.
> Extend qmp_usbc_register_clocks and clock provider logic to support both
> USB and DP instances.

Why?

> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 210 ++++++++++++++++++++++++++++++-
>  1 file changed, 204 insertions(+), 6 deletions(-)
> 

-- 
With best wishes
Dmitry

