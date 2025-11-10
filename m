Return-Path: <linux-arm-msm+bounces-81058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D91C47C6E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 17:08:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 705FD4F2728
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 15:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8B4D2749CF;
	Mon, 10 Nov 2025 15:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZpE82+7y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PHJT7SIo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1591A266B67
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 15:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762790335; cv=none; b=L6LLCNAdIAb1tn39pHW2YHl6zN2+Ij0FFTGlKkGREhUv3D8jAo7kN+nZm1HgWSQsArHBMsGuTrkAYeG3LTRZrRRS9g8zFfuEAv1ZRvuQNzE2OkyI9hJnvU3Kyt2+VXpxRTFaphRUpuIf6fPG9SeAOLiDc0qJh8iqF+5IazSWrUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762790335; c=relaxed/simple;
	bh=QDDX2DA6fHm4ELtkSv88cWLg+c3haBcu7aRJJAPg5+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YoI0wrUnU/6vORVms6zkTZUqTFE3TwiSkdfjDvK5fqHSTKIynQjFxkkW5JX7M6s+1UbXFMM8txP0RDuRKYS8Rqiaq5MtzPorYrJ+Ro/pBu7D7Cx0onjifqqjz3Mehbba1weMbA4XZ2wxW2gmkL9bY4endqubo+vbY7x8aJiDZmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZpE82+7y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PHJT7SIo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAFR41X4073883
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 15:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vLXvSvdzIuLRXS7nXEZVCb3O
	YqcNIx8WojewEu7d1PA=; b=ZpE82+7yefLfNP2tTB+GFaWzfkHt+pbzN0SzT+kA
	43wtNUyZgBhyPB6DMdexUUkrTLuReqOvo6LP4+qXLO+GbHtEyS4GOS/mrbRY7HlD
	NCycR/wPxeL8pPwM4VPlE9vg00Cnk/fLFVNE2kNDJ3auAPOjPIO5Mfd6mpuE8QYJ
	biSvi0sn1tnXl7mYsipsPklT7+MPLogSleDCZA1Zci48qLMhdTSsAe2nd8R4MVh7
	fMRhWyddmfE2h6Rc8uAyZHYmZEAr4wombQ6/RcGHlsij+QUQ0ZhfgutnCY3y6ebI
	iFYDZIZqNwnnK7J96d2oWsul7fiEtv00ii6J11LY3Mge1Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abjpgr3v4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 15:58:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edb3eeae67so52616191cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 07:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762790331; x=1763395131; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vLXvSvdzIuLRXS7nXEZVCb3OYqcNIx8WojewEu7d1PA=;
        b=PHJT7SIoKa2f//8n+1SHJ2xrb1kUc2P+XnZBn4dmrGPxhBAdKJltbaboCflRyI6M63
         j+u0ivPd5tCXL+Uy4HlYiZapZTR3U7+AJpxXP8Q9Q3ZyZaxXlw2u7lns/FKl1dpM46tB
         I3Lk6Pn4b7+85jVt/CCRPZfKROPn0GMovdX5fI/1oiePYAAlaZ/kVQdwn4wAucQdwZNA
         vKYxHpR4kNq25heJFMF0dTS2Hxo5+6zGhoe/WuDcJ6U0pCFV14MTZa4iTpdizLCHZvhc
         Bj+kmXFTw01pd9qAdDyS8p/3l8NUz1x5WfYvVbKbx6AnrFh2iWptg8Db2WX33IlDuHEA
         ovQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762790331; x=1763395131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vLXvSvdzIuLRXS7nXEZVCb3OYqcNIx8WojewEu7d1PA=;
        b=Kq0YQqEzyQPZZLEk+QqD4TyB5EltS+ZJTruU+7oJh339Ua4mAMKGFFg6BHR8YNBDfe
         FgSDc3OkBEF7sOdiyIp8nXArOv8N/KWkxsOeLVZcUuqaAuJPqQppXyKwI2LAwyl2XyJ7
         kN+zK+qtbAjgBhzJd0Tq7bAWb7U3CmDAFfrvcyTfhrvdjI1WI/zKtO/KKx6UJP1zhH5+
         wpXyTMb4nXIIbSMH6Qk5gfEWJlIMnziOIiZJF2NhUQRTO4Kz3QWNQGJ9Uh+fi/kcwekY
         BsOBrmFxRtx5rp9q6ZhA1pyleRtLrNIf4ITKv9y6Ym5B8Faz58rZqskpxm1p2r0PRnDt
         A7uw==
X-Forwarded-Encrypted: i=1; AJvYcCV0XzOU4Nh6qG9oBbBpqekY1nTIAkDG9l3B+RdoZ7fXs8mwGB8PF31klm7ERLzwHX9jenxiX2/GvaR8rAmf@vger.kernel.org
X-Gm-Message-State: AOJu0YymaWdvA/OPsCEghK5ZwZG1mYNEMtTOnw0+xuGLrKmVjYhEh5UA
	Nfuw4IE+Bxl9YSscX9F3IJTrGZQOVz2z3HUzXQCiEF9hW4KKpeERvxntPzisL1waPV5HgB/IF9O
	TkMdm0EB9CNrawE0fdDygMwUPH9PwbXmGGQPjyZV7l+3h3ivms66b457czYfSZqDd8zl8
X-Gm-Gg: ASbGncsNqXWPhlWt2d6XtPyWWrZ7b0xmxajiaHtiZb/mbXW5XXt0x9GnKadIy6Qh+bj
	ePs7NZxtmKWvvO95IRK7EbUD6JFWVdt1J0dQqGJBdr28xB3agrOMSm0LZux4L/nlpUJKjCDUO84
	oHOGLiWKF7x+lmsTe4aDOar/2aok+7quz6BXG0KcpX7rNZRG8nW/3OZ9mMw0NVsxeEHzJfeUsgi
	yG3X1u5XyQURIqd79h8Q5cT66MAkUSU1J1k/FeAY9yWEV+UfsrGT5fPrDwGrEQUSl/kCQZCoS94
	JUgIpCLrZw+BvDuM/1b0N7J4CT02zNpQ6gCytj5Y9nN7kzC9JrE7K/olNDi0WU1fbk0zf2Gf7Bl
	V4B8upYbEqyzuAFLhe/FwCSLSzMpGuuvuDYu9v7vGigzNLD5cbzztrVCbyHHjsp9BC99TaWCmBn
	pgj4IkKhyu24NO
X-Received: by 2002:a05:622a:1446:b0:4e8:a97a:475 with SMTP id d75a77b69052e-4eda4ff22cdmr113143091cf.79.1762790331279;
        Mon, 10 Nov 2025 07:58:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IERvz/5tzN3fzzFof150ow0CPkMngjJVvCc1HpPWCZ4P2NqMVrHjzZly5tI/ZePmcV7OvSq8g==
X-Received: by 2002:a05:622a:1446:b0:4e8:a97a:475 with SMTP id d75a77b69052e-4eda4ff22cdmr113142801cf.79.1762790330852;
        Mon, 10 Nov 2025 07:58:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a5a0d0asm4077997e87.111.2025.11.10.07.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 07:58:50 -0800 (PST)
Date: Mon, 10 Nov 2025 17:58:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Dylan Van Assche <me@dylanvanassche.be>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Add
 ath10k calibration variant
Message-ID: <bxuhdnfapc3nl5kmvvk2czwxhyrzaxunw2hmccvzoutk2xkj6d@sgfb5tgyxyy4>
References: <20251110-sdm845-calibration-variants-v1-0-2c536ada77c2@ixit.cz>
 <20251110-sdm845-calibration-variants-v1-2-2c536ada77c2@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110-sdm845-calibration-variants-v1-2-2c536ada77c2@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDEzNSBTYWx0ZWRfXz67vBph9Q6Ab
 FRrjZY0uMF725Q+CKS7J9/Msh4Y+Al5TkQ4Mz5InJPFf1xoQgtgUnfcZYNuloopcECmZbkuClhe
 VKULg9EkhzQL+tU2cZCng6yU+ywcVcbJe7iwPKpG/ullFnQBlzkKM2C8mgqEspr6xHPe75rY8xi
 Epk21ttvZW4JTVuQmE3Z/lpyA6yn514PHzYkF3dEKWvuRc1w5QL7uHJn+AAgB13pzr/WfD0bO7I
 GaTI9v0wvVV1/URyzISi5tGMpMD98Yoeg59kOnIlUOrzoAMHMHLMa5kd0UbRj4GRwhe5e3SlLtl
 Sp+O3F+z4j02yOtXb3pq9vzwng+AdAeapLcu+zJKmRuMabtiZJLiibJu/CXpqm9gtj1YohJfoF5
 yE4IU07ATxC0Dxsh8pw5QtoMNCdpAQ==
X-Authority-Analysis: v=2.4 cv=br5BxUai c=1 sm=1 tr=0 ts=69120bbb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VnAOb1fkWFh9DQKIKVgA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: s6VAojDSXNFNEJRY6_f3YM7OVQOp2AxR
X-Proofpoint-ORIG-GUID: s6VAojDSXNFNEJRY6_f3YM7OVQOp2AxR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_05,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100135

On Mon, Nov 10, 2025 at 04:37:47PM +0100, David Heidelberg via B4 Relay wrote:
> From: Dylan Van Assche <me@dylanvanassche.be>
> 
> SDM845-based Xiaomi POCOPHONE F1 has its own calibration files
> for the WCN3990 WiFi/Bluetooth radio with the ath10k driver.
> Add the calibration variant name to the DTS to reflect this to
> allow using the calibration files from linux-firmware.
> 
> [David] Adjust the compatible as ath10k-calibration-variant is deprecated
> Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

