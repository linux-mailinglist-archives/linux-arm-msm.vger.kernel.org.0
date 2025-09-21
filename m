Return-Path: <linux-arm-msm+bounces-74348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7D9B8DC92
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 15:42:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 042583ACE9A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 13:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD4682D838A;
	Sun, 21 Sep 2025 13:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DQMmXiwy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46327282EB
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 13:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758462166; cv=none; b=RPPN1SBcQm1xI3jAh/BUC3mhk9TBxRdFvDtZfQrj1oB41uSst84PkfqtyTNt7Klg2HdP0QioHvwgOGA3gi+vyk0/64MZiJ0Chwr3GPXbrDmm+X6ZfsLGKciFrQkK+cZI68a6mPIXmNMEJC84K7N0H25NN70dXvrMQdp/EaqgOWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758462166; c=relaxed/simple;
	bh=H6pGhEhT4oR9iVYSy6gV+v2KRH+Ert41re6H60vwxz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qzLAQO5lpb0w80V4vs/sPwtV5vy3Lqwt4Ef+PDZeymhTEH8kQK5Ea3E36nLRZyRcL4IdJWNb1ruKwVdgAp1zZVr6NEfx68Vq9h83nR4HhLOBsJ30FxcO1ogqWKoHk8CmkpOt+uQwkqETcv0kOKm4v+ExiP1PAFpJKybYnd6Pe7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DQMmXiwy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58LAdL4Z011015
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 13:42:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=41GBfb+Fc3UcRhw/qydO8Bys
	CX0wolmp7w7aZ1a7kNM=; b=DQMmXiwyrLveKBRQc6LwPjww5zdOW8yvzc9R0qIl
	owhE3ofRqCf/OzzfW+p7q3d2jfTswf9ZevD5ld7qd5K59k22RjDqT6Nx1zGHRKXO
	c7jqNNsdrBaRC7z4fbg3Mi/m4qnp0kINtiw22DVG8eR+Jl5NUMQksNXvnHl89EPE
	RKs0BinJtrRrMLiS3m49rHE7MqsYY1ENsKs0Yt1s9wFS+Zb0FQlzAHOR7SsUOoHW
	CiE62soSklyVbcRcG3wWzoxThO/8GXtNJ09rFd8w9gd1vf/mJ9Nrt9nyius2s0Dp
	m0R4Mf2Q4aldYzfECOa9AUnXJMNUdp4v1zMkRhjMhiO8Vg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499mn7a7gy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 13:42:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ca8c6ec82eso4104131cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 06:42:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758462163; x=1759066963;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41GBfb+Fc3UcRhw/qydO8BysCX0wolmp7w7aZ1a7kNM=;
        b=qSvAiMtxshPyY/KLNtzrTqt8YSURXerblDcLIZX8VHg2bWOONuaUfDyV1soZuiF6vA
         8e75YZcHZ4ZnMVv4KRU6FWXW9LncvMaWQxeftt4tOZDv4VO6fjv/sICVxsMc3QDVMLpu
         oayXKBcaH9xoD+YIVJOmV5/t64O2imjnC0FiGcxTGKPy40F60RRdY0pWaxvtbLDH36bg
         2HV+UBEHKY2w8Wex+Cq18pyUCfPWhOKuj/3qinC1Sn0pbm/JY5TlMZfoDx9mVyRAYk5Z
         lXsfljEltSHcEBy1zJSqjSZtajDEA6L3dQ5VJ4cXOA+jZdmp9JNdfTxIGWsNNrIJxPGM
         O+Ew==
X-Forwarded-Encrypted: i=1; AJvYcCWfNaLvpzscE/UZr9D2gvhC6DVQ4oFuBrovg1ul41xTh6UYRb+ndUp4v7jv/UV0+Sdz6jN5GK5VlqZviO9r@vger.kernel.org
X-Gm-Message-State: AOJu0YwLNK/sfw/6VPj12x12WNZsKroXngelEWow57eOUb4CVrQmVlYK
	OICEZiUnDtMh8c0QuaPzwNPLrlgRBQ5Cv8xVOUJOw5mWWLyDhfojea0fnscNjVCXmh+ylFz9ueM
	BSTPlSHT0cIXvDeMS9UXEd3NBLoQwU7sS2NAeYwYG5tmS2L/LVyj6UeAvJe97bwmoK9Z+FENOC9
	Qo
X-Gm-Gg: ASbGnctvlF9TAGb59TsrasAv2f3fBDvlxKy+H6JhKGz30q60WnjOygcWxpQDxGHKwDE
	xnDJGBgXuLhosN6EfxMh4tAaHPzFIMwQiJ8+C/Sf2E4sTATGiFFCXY/N065pENZ91jztbHNVnDx
	m1kJoJYFsmLKXkxT1q/55dw0h+rxM1GYC96eBZthdG1OK6YVZga0AUl+dgJOPqz8e5dzmImfRxj
	/WrO98sndnkdNWYZG8oTrLH46w6Duq140zKYreKrQ/0qjo83rtEzwW2WmBFNQkedVdjW6f9+gyu
	4BRIWl1dy/mwOxkemxLCsDje7pfoE4rTqs1rcS/Vigl0iF9vqt0PXd/psGBjYlKA4x/X2NB80xx
	5KsAyBahWQUz6gwzem85TlU3org9FTkXFqX9wMa4O6sa2HvmEMThO
X-Received: by 2002:a05:622a:259b:b0:4ca:bde6:cc8e with SMTP id d75a77b69052e-4cabde6d94dmr6608501cf.25.1758462163203;
        Sun, 21 Sep 2025 06:42:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFswrcTGOhaSgk/wSyNd13eYZMRtIi7CH1fbBIBuWJI/FFQV4PYBBaf+PW90z6AV2BM7gp+Eg==
X-Received: by 2002:a05:622a:259b:b0:4ca:bde6:cc8e with SMTP id d75a77b69052e-4cabde6d94dmr6608161cf.25.1758462162670;
        Sun, 21 Sep 2025 06:42:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a957396esm2546067e87.107.2025.09.21.06.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 06:42:41 -0700 (PDT)
Date: Sun, 21 Sep 2025 16:42:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Heidelberg <david@ixit.cz>, Max Shevchenko <wctrl@proton.me>,
        Rudraksha Gupta <guptarud@gmail.com>, Shinjo Park <peremen@gmail.com>
Subject: Re: [PATCH v2 5/5] ARM: dts: qcom: msm8960: rename msmgpio node to
 tlmm
Message-ID: <kfqv3prsr5q2ulbsir5ndw3baixoldt2qwhdj5spidgok7y7ad@pmwczkealior>
References: <20250921-msm8960-reorder-v2-0-26c478366d21@smankusors.com>
 <20250921-msm8960-reorder-v2-5-26c478366d21@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250921-msm8960-reorder-v2-5-26c478366d21@smankusors.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMyBTYWx0ZWRfX67eLa9rG73Hs
 +UEBXqW2yJrm3so6NxhWaJN2EHv3P7PP0vQWm4QT5/nGIZ4Kdwn4DlbxTmuGehcblLos+5yuumd
 iSZbabzk5CyXwIM+xni2Hgpxfp6gmcvG5emFP/iKgwD4PxzlfmAM3NghiTG/NP3F7bN10andIPI
 D1hBNR4Mf8W/ab8EuNdxBcpFIIWuZ76zpJo6/8XXpG4GCSrmpV26W7G23xFBCtSBtVSzeKyLvlh
 CDdtiGFvEe1TlMHD9Feei0kfHgLDXWWxyc+XpyHouP65TgS4FWwnwwVOfYjCw0rKlrWVGE6aam4
 ztVT6RotTDhVc8pnxi4g/MTIiuyThzRAUZyJPrqDepOfuhWsbXcQGAGuuOENk3re17sQx3EIOnG
 YCRKKHw7
X-Proofpoint-GUID: mWuEQ8d9TdSxqp3IMG2A3IiOMPatnveO
X-Proofpoint-ORIG-GUID: mWuEQ8d9TdSxqp3IMG2A3IiOMPatnveO
X-Authority-Analysis: v=2.4 cv=EZrIQOmC c=1 sm=1 tr=0 ts=68d000d4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=wxLWbCv9AAAA:8 a=EUspDBNiAAAA:8
 a=WfKvcdoTxDYLXQoqPjMA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_04,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200033

On Sun, Sep 21, 2025 at 03:08:15AM +0000, Antony Kurniawan Soemardi wrote:
> Rename the GPIO controller node from "msmgpio" to "tlmm" to match the
> convention used by other Qualcomm SoCs.
> 
> Suggested-by: Shinjo Park <peremen@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts                | 10 +++++-----
>  arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts | 12 ++++++------
>  arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts       |  2 +-
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi                   |  6 +++---
>  4 files changed, 15 insertions(+), 15 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

