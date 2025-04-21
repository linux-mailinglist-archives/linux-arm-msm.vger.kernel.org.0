Return-Path: <linux-arm-msm+bounces-54881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA1AA956EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 21:53:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8C7B3AD0FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 19:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 178851EFFA3;
	Mon, 21 Apr 2025 19:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OrwFg0e1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2D61E9B1A
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 19:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745265201; cv=none; b=rXYxy+EPzLzmCyafQ+Xl7uTTXcx7LRt/0xgR0qj/GafeypEwIwSjOCpcqL09SW4Ha1nEl5qEgrhlZUvSdxg6Y4JfCPSAgiIhL1IlMM5MDeDcOwzf1waWOuKsMh3o3T6vgz4gDMUZFvXdl/wfLP3mF5Qlb27iWG2HIem/1o6/30A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745265201; c=relaxed/simple;
	bh=OU7Gd0jDNBLAcjP/j8tR7B/qAzAvH39PrywOYUx9vXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TF240ZmSm7IH6bIDj1jwoqcdhX2SXH0eDadqUXAv0XIComWu82HfoYa1yiGh5slzaP52buF6Ow6gEGOupH0ydkWsiDN/iXpXqSMjsLiOhma6mnNju5GSkfdg0qqTVOL/RsLCgCcmiLaMwiQws9TEUjhRNCV/nZRIW02gsSN4MN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OrwFg0e1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LIgGM7014431
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 19:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZnQHdwxDrAE/khhJ7QSLyL7t
	J4Af691zv3dtuvcnSwo=; b=OrwFg0e1cqFCn6ygDEx2y4j8wpudvfSW/yCDeLxJ
	YI+WVxdhe4QtaaaOc3Yu9n3xqsqet/K7xFGvTIqWxYviInOeMW1Jp049RRqVBhWY
	an1Ki2EI/KdZiz53ND8PQ4YnZ30NVo+HSL75VXNXdcL9Me0xM2Sf94lAeqzOuqQF
	wzD2FMmoDm5LaOTfFlrzpcGkxmudwogPsn0Uux51IlJTJa1Xsc7Co5MAq6K4Utgn
	4/DbtW7wVXApHUDXUwyr2Y2G+XemI32kAb6L5/ILukiyzLd5VuweyN5BFHdSoFnZ
	FIggkyD2kwr160n8+5zNNcM/5oWWHskr+YIQk6A8z8YWbA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4643wwn7m4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 19:53:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54e9f6e00so802914885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 12:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745265196; x=1745869996;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnQHdwxDrAE/khhJ7QSLyL7tJ4Af691zv3dtuvcnSwo=;
        b=Q8m/9VIFhb1EYeLDZLpSNKw2RWbcztfrGn8vLfBIAaPlcLol9WTvnZLwlgkmfcPu3r
         5CnGCIRbfW+BXsJV/XYiZL2uyiPxkoMey7RW+blBBmWK91u3vwZbO9vqsRgofDacy43i
         M2cxSBXOJjS2WNVabM1iwHagQPzDZBu1xyh1/PAc0ucmUdeJ56ozyzvMy+3tgeRY0u5d
         9KUSF5gGxoPKv9vgH9WnAomLt4zHhX+BUqN0xbOiRNxccB42sBApPg+mv0zguRwJ0Nyv
         9urGSBEseKRhU+/1RB50cyhRiv9uY1tAzWvWbQ80OMNX0BdNBvR2+eh/0dYdNuLJZWvR
         q74A==
X-Forwarded-Encrypted: i=1; AJvYcCULKBaZpBIqCluJLPKQFscolQA/T5NaottO7qzgT1ON3UYiWQg9+tScShlvjoT/bd13jD9BStswQzGS1wZQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzSeHTxThlPctoPGGIGOb8xtuEzeOCRJAxwxgJhXUP2KKVrH/nv
	IbIEPVI9HY7C1wpmZPFm3l/EwjF46NtbsE3ywn9KL6NAQtfk/Pt180tJdHHmqEpgZI7sflh7sq4
	ER/jEpSB6ghBccFWpiVpMtG6TgFFvhzIus8cNE62h7JxQHSGEhpV9QGjnXx89yFpp
X-Gm-Gg: ASbGncsGXLO/T72Sq/h29FcT4OLbsb6eDq3La9CHgWY+8V9U3+vUMfkgVyQiiAwXrOB
	/6/G6+ZUOY8VF7E7w8GHv7gYrKpe1YR5U2/u9So8TlvPZEmfowrL3HJ8LC3iyT9zGHtoCiys1mI
	dlv4e6YvIodWM15rl1RhnXu0+lXY7/sDI3N7510agcetSeP+xJHNU+dTrH68YuPPHxV96NJIFug
	FBWy2AG7YW60QWpj8bqPdLthApaHqmCtlqUbaQQo/5rsJj9HA02h1Krce9boK990pAZSiLE0VRY
	/00zsFhS+Qa+4n9sAIN19ncEnsIyAcr7/4Ebk6Nc08dbW0VIzerIqEmS2i9q/ZZTDrJQgLXufws
	=
X-Received: by 2002:a05:620a:450c:b0:7c5:3b8d:9f2f with SMTP id af79cd13be357-7c92575f97bmr2361734285a.17.1745265196288;
        Mon, 21 Apr 2025 12:53:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSKwkTFJPLVGZroJhqvUxxew3udNXbpWiYRQo2p8soWzPbcuaepKjeZEAoQXu3ztfdDN2Bog==
X-Received: by 2002:a05:620a:450c:b0:7c5:3b8d:9f2f with SMTP id af79cd13be357-7c92575f97bmr2361731185a.17.1745265195965;
        Mon, 21 Apr 2025 12:53:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540eccsm1024666e87.74.2025.04.21.12.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 12:53:15 -0700 (PDT)
Date: Mon, 21 Apr 2025 22:53:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kevin Widjaja <kevin.widjaja21@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ARM: dts: qcom: sony-xperia-rhine: Move camera
 buttons to amami & honami
Message-ID: <7wbrnry5xzl7mno3sqtd4gpgf2riihzubkdzpu4xp47hlzmg53@ezksk4qofosi>
References: <20250419-togari-v1-0-45840c677364@lucaweiss.eu>
 <20250419-togari-v1-2-45840c677364@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419-togari-v1-2-45840c677364@lucaweiss.eu>
X-Authority-Analysis: v=2.4 cv=IpEecK/g c=1 sm=1 tr=0 ts=6806a22d cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8 a=-UYqrYhTHp0prKDFsBoA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-GUID: EvBxBq5iE4w4gSXccCTczBGdl45m9zo5
X-Proofpoint-ORIG-GUID: EvBxBq5iE4w4gSXccCTczBGdl45m9zo5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_09,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=962
 impostorscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504210154

On Sat, Apr 19, 2025 at 11:00:39AM +0200, Luca Weiss wrote:
> From: Kevin Widjaja <kevin.widjaja21@gmail.com>
> 
> An upcoming board in the sony-xperia-rhine family (sony-togari) does not
> have dedicated camera buttons, so move those from common rhine dtsi to
> amami and honami dts files.
> 
> Signed-off-by: Kevin Widjaja <kevin.widjaja21@gmail.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  .../dts/qcom/qcom-msm8974-sony-xperia-rhine-amami.dts    | 16 ++++++++++++++++
>  .../dts/qcom/qcom-msm8974-sony-xperia-rhine-honami.dts   | 16 ++++++++++++++++
>  .../boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi    | 14 --------------
>  3 files changed, 32 insertions(+), 14 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

