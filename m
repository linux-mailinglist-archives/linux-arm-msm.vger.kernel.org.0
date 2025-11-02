Return-Path: <linux-arm-msm+bounces-80045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D44B3C29644
	for <lists+linux-arm-msm@lfdr.de>; Sun, 02 Nov 2025 21:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4F1FD4E1ADB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Nov 2025 20:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FCD51DD543;
	Sun,  2 Nov 2025 20:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UXik7WxN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f+3Mihow"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0E2AD4B
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Nov 2025 20:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762115109; cv=none; b=mh+9jnRHGl9sBurIXW3paqnqUfcer5x5QZMZLdBC0IH9aENnSvFdK5oXrqIvuTOc++D/LWSPzBKCfBn+ZY6Fob7gs9SCRXVfoTnz4AJt1iQ95EfsHXF9ty/DZAg7YPggmJU9r6Gee2g9X7VsiBk6yoNIWN+XH+QD02ocaTSN+Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762115109; c=relaxed/simple;
	bh=N6H5/yrrglS9GGUXXu0UIjTadrjxIjFbU48PaLb1FkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qn+oxlAJYLLSGJgv8zlsKONHOn1GISvGgSKn0vl8BKXvX7SYbZmb9gknO74OawajnzF0bZ6M799EPoGZf5x/m4/W8azNXB1gQR+3RCBDn2HGEngJsTG6lF/12NfIEEx7Lk6H2VolF21VZEtEYY/MOLV2LwQQr0zjmFs7rsEGoUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UXik7WxN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f+3Mihow; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A2IT34p1021726
	for <linux-arm-msm@vger.kernel.org>; Sun, 2 Nov 2025 20:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EEG2Iz1LJudMnHX5OCqnescY
	0Xbxi9uQYfIsRBJgGgY=; b=UXik7WxNrfMiGXzZb2sGx3fburzl4nHJ4Es5i1cX
	segTefYjXNeT+NrMbsVgIikACSS/kBnZW+EDi4r7qeBg4cjwmzbbCHgv5nIp/f7S
	ZbADih9mvKIn4IthNIcuF3WvV7Wk69dlLxXX9S0I8PIAXnb7lDVi3IeURdwjmsRv
	64lSZJ8+9avgDXj5IMq0kFemYgeEYZiXZXn6YSODSquMZI1SxjDYodfE1xzvAKG4
	nRTVo5tYWZybkumPV2RBmfhMUhqv++Bk7nLjbI9ygWtBZIejCgCEOjFtZrkuG45Y
	3THcL9E2iWefyC1jpct4IwBVzmLhp5a/jlRHwx2YCMa+Kg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5977aq1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 02 Nov 2025 20:25:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4eba90c163cso78050741cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Nov 2025 12:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762115106; x=1762719906; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EEG2Iz1LJudMnHX5OCqnescY0Xbxi9uQYfIsRBJgGgY=;
        b=f+3MihowWjiKDL2Q+7Zk91B3ocUU51IHW0bOh/DDe1aP4RvF9SSXyMeXQWa8Z/UkHt
         0BhgHKfPxIn1B5kvHR09FKIQVnr2uezUsFyw9mjlu74z/oyMV8OLBvbUVIvinSiIb6PQ
         lcdaNRWRBcOGeY7419p3u+bNQbJmFW1pMOKNjHOVpZlheso+bthbL5nkfVSJWtRNyjT2
         sI8pBgsEjqUkSDnXYC3ha2mApM4qYlEHVX2UXubBGDPU/oVRN9etw4h29VEVWV0BjLJn
         a9gLE0WeLqLBHgHuucPunYZJuyxZdACSZT2295FalmIo73DvJH+6feMeY8qu+VR71SJ0
         QZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762115106; x=1762719906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEG2Iz1LJudMnHX5OCqnescY0Xbxi9uQYfIsRBJgGgY=;
        b=NF+a2M0b1L8ss7arM645zb6tWATJ9V/E8lHov2HkaUPHt02wbPiVPjOxe4c8ZQsWSC
         +1AmQi3ODguj2wNCYe+8C6Vh4gLhd6A5TFp6Sv05gSrQta/RFeIgTfSLczbHsu1JLB0H
         ttU2rtvhTbqKFUrfkVaxjWOXfYOJe/xiiQasTp67VVZUWanc2HGGwBGgJ69RjSnqfIxl
         6RjCo3rEowfCErGaLLwtgjH0IdQ5cCoch4XqbeOoYCv86UvrdOYDLEi8qUUltK3vQZP8
         sUY2HhfwYvxOAHLxr2ZCRbDFtQ4J0h7BGD9P9sTP1yD9CiUUQ38POOT0emvnsL7p8bU8
         eyCw==
X-Forwarded-Encrypted: i=1; AJvYcCXauLNRUTE1BNQ8og+PJ4JFQpVsyGSd9rCQ9lvQcC9C1i6y16XgL+youbJ4Djo3EnnysDd5S+cZVqrA8dNO@vger.kernel.org
X-Gm-Message-State: AOJu0YxiR9Ex5NeR4bsc0b/zfc6efUPUfayp6qrt/q1aT1VAYHwxoptj
	jXow34sfaBbx5NLnqMorSBMxupCfsWjFfdM4r04f+WhZawXhHuthsqjKgzuwm0CAFTm1+tRnRvf
	RTJNJ03n+4YuAC8tyN7ED10vOEBRWbqEbyqKgYTemjip7tXkruGz91xH8BEhq8C8f5CBp
X-Gm-Gg: ASbGncul2ImeZ6zqUs0qrEsqfsemMUuq5bjK/N9MJ0zLja0fY65VijbCoDENWvQT0hg
	6Lq5MgYx1JeQxg3v/Xil6xfWjB9icQz8wamgLL6KKDHqOr0/gU5yIP130wL5jyYbPmbLYwRYgQx
	cPL44OAssPAvmQTOH4O5zWdUjHyyn+PStGD5wvQU1YVY2YByZLhRxVqJcLTwZ9h9H5SvDtRgWeX
	CLF03LBsz2kICiuY4lnGM+TFAnDfSKSzVK9tKvDUvNKk7bHlTL+gGV/EYbKXj6tiCu8REdjcqB3
	jzgFR6Hove1tw0xxT/pfV4oLETehwfRjOg6VKSg2lmic6QXkdT4I/hTe9Nb1JMF4jPLriPU98MY
	RphtpWaBIHS2fwGeudw8FWWSulJNIUUHS8G7ENTtdVReGW2B+FHRyC8Z3br5HGzXi02eE/hMD0M
	zs01LNzM3udpDT
X-Received: by 2002:a05:622a:420b:b0:4eb:a1a1:7c0b with SMTP id d75a77b69052e-4ed310c5d61mr139573301cf.78.1762115106264;
        Sun, 02 Nov 2025 12:25:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFb5BWz3i5Ujnzs2gYdSamh2WbZV7R4N5QhulfUp+qcWnmLJlhrUeDTv8ibu172IgyTkjIZOQ==
X-Received: by 2002:a05:622a:420b:b0:4eb:a1a1:7c0b with SMTP id d75a77b69052e-4ed310c5d61mr139572941cf.78.1762115105713;
        Sun, 02 Nov 2025 12:25:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5941f39c0c3sm2249247e87.42.2025.11.02.12.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 12:25:04 -0800 (PST)
Date: Sun, 2 Nov 2025 22:25:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Rename vph-pwr
 regulator node
Message-ID: <nlqtcvxwszbi2bwpu23peualujip4d3bv2pehep7kwegf76lad@pxmiji36mw6d>
References: <20251102-rb3gen2-regulator-sort-v1-1-908879d240be@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251102-rb3gen2-regulator-sort-v1-1-908879d240be@oss.qualcomm.com>
X-Proofpoint-GUID: uuJ16PIW0WjSIldlAtkf9ym2WS_fPImI
X-Proofpoint-ORIG-GUID: uuJ16PIW0WjSIldlAtkf9ym2WS_fPImI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAyMDE4OCBTYWx0ZWRfX9gWMParTWW7x
 GJ2TIgRU5+MMyostNY4GavcIdwAgUfld3dxpwV4QfD1H4dfMsbbEkX3WVPvV8p5YFbNXkFw6BP2
 7ybvPQte6D+GM7PtmdaHIgvuPvvVjClw4h9NFVJc+GDEJVLXEcpw6OFex/kctkTInlNdUzqTvoY
 kC5XTZ0jcPivMWTEkcpT25ldvV5uuFL5YqfSzQZyyBVcVZ9Kyx2Kkvm/7ahobXNPPk5rqhukvk0
 Nuee7blQWyoE2FhzMf6HWayhljh1qcyQ8pBBQp3mfTG8Zi4fiS5gGg9GpTPoAdwGzQxX5403pTE
 5WoBhe+rVj3r9C3Fwu8530hZBQsvDiaHIBNd2OQDoIHThzOjC30c3xh6UeudHzpEBRhmJS/GLDl
 fP8xxWRVPbe7w3PKfusCTdYS+hvAXA==
X-Authority-Analysis: v=2.4 cv=WcABqkhX c=1 sm=1 tr=0 ts=6907be22 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=1lonT_InBH0CplU8HdIA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511020188

On Sun, Nov 02, 2025 at 11:22:20AM -0600, Bjorn Andersson wrote:
> When fixed regulators are not named with "regulator-" prefix, they can
> not be neatly grouped and sorted together.
> 
> Rename the vph-pwr-regulator, to facilitate the incoming addition of
> additional fixed regulators.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

