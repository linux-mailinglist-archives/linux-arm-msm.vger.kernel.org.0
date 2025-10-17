Return-Path: <linux-arm-msm+bounces-77837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB57BEBC4A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 22:55:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B38C584725
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 20:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0441283FD8;
	Fri, 17 Oct 2025 20:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jHTgols0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12413280335
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 20:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760734539; cv=none; b=EW5RD3gjhsWzR96DzBTvk05togOczsxb8+xSeWALmLnZ6idDEYUEFFQMSKX3OboBoR2DODL+sWvpLye+R196v4vlg/4W2PepIBjjxSqTk2pUJpt+upYazhIal72CsCDD+JCy8jaYESDqLBi4x0bE3u0DVhWR0POFXb9OshbHEnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760734539; c=relaxed/simple;
	bh=bgJ8YiYE8qKTRMOZcsa9HNfpRfaTpETkh8zEcph5TEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FwwJ+/SHi7Z4gXieNbDXKlf8dxwrLGRUfYsjhm7RBIhvSf1Y7FZ3abzfSLWuxxwakjvvcffqhs0idzuBlaA2zvUlykoaECDa9wDss8RZoGvrg45D0sbbQSBGuBsNeRMz4KgNogmo/Aa8XYxQLNEVma+8Q8zsnwtOYSGxou39F5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jHTgols0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HJGRfM016989
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 20:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tBUBJv7YgdO5vYO/psTXoU3h
	cD8pEsOW1XkvnkBW7ww=; b=jHTgols0xXkD6A0AgZxtB+JghLy7pFoXfy/jSFFI
	XWl1v3vCgq6f6Xz0a/RulCIyirvF2UxjtB1ehociEHTu6hp2g5KgJxmmrss7pgp1
	ag2yz1fTFfIoZB9sFFKiVNN4KxOMDz3aiCnp/kDjZ+wy+cPOkeZGrPCWFMic7fzR
	3m0cufGnl1uz4I+WsOU351f4/SVzsN3Z/M1UfRU+RUFkcLaxn9Vf4/Ry4WxNvej+
	sZSKb97Vsf9YVulhZMYtMavWbW3xsuXLg/bo8o1i5DtmRoKBN9QCWLxze5woMbh0
	4eK69us1fMv9mNYPGe3PGyuIO1eH394YUVpJnyBvHZ6Tng==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdknnk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 20:55:36 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-87c2085ff29so70263826d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 13:55:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760734536; x=1761339336;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tBUBJv7YgdO5vYO/psTXoU3hcD8pEsOW1XkvnkBW7ww=;
        b=CtXRrytxMfCy8Ei8LazilommwUwbY9y4Nkf6m/1ZXOB6f0n4xUPrwCy1Zrgbm5ZBFD
         ZF7Ry+HS6l+ryh5XTVRVaFRG/6KMOkAWLvZXm3eDT0IXju3dS/3LNWa4AcbAk/lywu/b
         Uf26p8dUbj5GZHOo91bw7+yW4fcNtaXyeMZ6B3gq2l9UL/yzwIK0kWRj/KYD/G8uQykm
         IikGKIlwTaf90UYb94ECZ2pfnN7IY09rsyxKUGSpn4KqPclMoyTeIMZf+j5rsERqTn66
         jJI2PKoKXSJyfiGSivrTczUD0C0aLNhnrxEJHo5fz0oYzl34wX2K38MWGXjz1gR9/GjX
         WDvw==
X-Forwarded-Encrypted: i=1; AJvYcCUVqPa9mNAZ6vAyUbcnSt20GKvlTXKgzfUZlfLPuOwCZcpJl8gxzyCwyt/2JbrKzUhR7WuWWxBufzXzDEkI@vger.kernel.org
X-Gm-Message-State: AOJu0YzAMrStsx1dfQtt0pMYX87e1nH0LCcN01kNs94Q1gotaMhZnKuS
	190S2Y89XPr/N/fxy2riA2TjoyqBZpHaDbKILfsJvE+slEHlMg2AGI7rHyZjts8lyVxuI7S1H65
	QXFVa6JoV54oNr0Q0Vs4zUoWtbp0RcJwckp9ZZretA1K20R79S2HEvyrsOyCpJIUdJF9c
X-Gm-Gg: ASbGncvJ8+lPGDG+s+9wpu9r5Z15gCwTrtsgVzBEK4WwKoXztkAox+vEgoNsY+/qemp
	1spAL8FEV8x9UadELrj+Uc2buVJYJrSfxnnteYssfNZ+80aQQOKaqrZEAmhCqU82kTgHJOxdhKQ
	dQm/8i5S9FD4k/CdelQUu1QmuFUCjfxjbWn3VI4erVnfT/Qo39NXqW3OHTP38GxRFey29TgWY6/
	TNC6UvvOs+wafq0RBGmUb7wYdpIbvDFfJ5IZUMMF8zNVx5G4FlHG6PcwMvUYuvIdck2qLo4WfXF
	+4md1Sg6P/+lIzV4+9I+QSUjrzpo+VIbrprAl84c0GNp1ou1Zbtw/clI+rMZ+D9jIUCNEh1fc2n
	9lKdFsUE+MgJm6DAh8AM+WkR9ZE2IvFJtjJxcuAzJefP7ZpGMkoffE7yDv+nZTVpPUdk5W1BYs3
	qBAjV/bxd5fe0=
X-Received: by 2002:ac8:5f91:0:b0:4e8:91bb:2636 with SMTP id d75a77b69052e-4e89d3712cfmr69650081cf.52.1760734536013;
        Fri, 17 Oct 2025 13:55:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWIYr4LhZulc9IbG/CVqJdzUA3qxE7l19KYbIdEcG//A7H2l6zjHkzk29nEiAzo0m1WKreKg==
X-Received: by 2002:ac8:5f91:0:b0:4e8:91bb:2636 with SMTP id d75a77b69052e-4e89d3712cfmr69649761cf.52.1760734535547;
        Fri, 17 Oct 2025 13:55:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a966e379sm1750451fa.55.2025.10.17.13.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:55:34 -0700 (PDT)
Date: Fri, 17 Oct 2025 23:55:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom: qmp-combo: Add polarity inversion support for
 SAR2130P
Message-ID: <ywovlyojskgv7hbkr5tjtmsiwkf7tmgzw4puy7zb54kvmt3mzw@zq5etee6pjwf>
References: <20251017203438.744197-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017203438.744197-1-krishna.kurapati@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: pna1QHIBHEXt-zKD6Dty2nK4Sr1J2R9k
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68f2ad48 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=gZxxQWLh4rD7iasbu2EA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: pna1QHIBHEXt-zKD6Dty2nK4Sr1J2R9k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX1IXeMY2jsK8u
 jNvMaJCXNUO6TZWNzxhD67uMxYTQvXkpnN6HH07kQqcVrpeAXcpJHvRknJo6Nh6xrMiyIMXMGYf
 68a15ZY/2AHbyL0N37AvdmGX1sLsDUwdQA4BrJL5pX+yCLRn2qm2bDy9sgVt3vYiwns7eO41Vv9
 ASvahUQeLPKXLn/T1SbaWoCRMCJWgalajQhXpYd7HChUHH4O24vA4b6VWLXKDasbtvxl1faSocR
 p3sLliAngHTH/8uA1ReJIzBesExT+UDiJZncLPA1XPGyPhWebi1fSwgJc5pqfk2P5hB+rCnNI0m
 ojQZtzq5F3iBlZjhBT2R6AhZSmBbBEnWFsm588l2QYQDYycB7WmA1/Zdj7As05AcP6ckuJZILXC
 HH1i/22w7RAyCSTdNl+bbcgoJWireQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On Sat, Oct 18, 2025 at 02:04:38AM +0530, Krishna Kurapati wrote:
> On SAR2130P QXR Platform, the CC Lines are inverted and the lane
> programming is to be done reverse compared to other targets.
> 
> As per the HW specifics, Bit-2 of TYPEC_CTRL register indicates
> port select polarity. This bit is to be set for SAR2130P.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

I wasn't able to test USB 3 while I had the device, but this seems to be
correct.

-- 
With best wishes
Dmitry

