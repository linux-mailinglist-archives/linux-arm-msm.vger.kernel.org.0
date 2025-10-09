Return-Path: <linux-arm-msm+bounces-76692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B2516BC993E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 16:42:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 288354FC7C6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 14:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EAC32EBB85;
	Thu,  9 Oct 2025 14:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ExdeOdGT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637762EB85C
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 14:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760020889; cv=none; b=MTEVWtoC/TOVoXq5V5BNdD62v4rnNhwzF3wyGBCgY09/PICcLo7rvWEaMPCXw6FRbAlGKyTdOBPnTfWYZ7dZFnojjtMJBYDVu369rQe46kzOxZByG5RtD8sg2uMkhBDYl0PYf4rbCegi5OkhgeAUXtPUXBySBsBp8JkTuOmsFrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760020889; c=relaxed/simple;
	bh=hMAlIl8gIK8LztwW9HVQfeQYtg5hZj6rasv0Brdvkx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBuKD9HXAjExIF3d4cGNU6LLFNOhH4B5AQJY61khYHfJ/8JX45vw+qu7aTmscasmEHPpYkFgddvACh60EblY0nMvG+Syxheua5wTYlz+jXRL95GxOU211eJ0DsqXgtrsXpTC2KICX88l6XrxLaAA0DygbMnwp1UQrhteeU9KjJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ExdeOdGT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EPJH005152
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 14:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FPQiX2366I2f8Av1zpm9cGRd
	bl2lIGNgfsiAginJlD0=; b=ExdeOdGTwivkH3fbQt9LUnWGOabIJ8LV0nM8sVFS
	0U9BNq8O77c6HfHPfyVJCUaciOFWFlvH/JdSAVS2Ch29beH4O/pLHyDk/x9k3wPD
	EcSAZr6EhSX9vTJZ+/zoCa0c4R8d0rnqZkq2XXKYiVKSfSJK8f3WgjgF6cprOQvB
	M+90L3XbLWixakVTrv7KeUvmiHzgNyc2cTLj7HjL0eH2cc5zWLlxvcoDbPE6j2B0
	ivdo3cSFqrZqDMBtsvKWh3TNdbhlYl1DC07e4ajBmrSZTPmWzkkpFmg8VEci6iHm
	SMuBdnzwqZ+wcar/OXiqKjw4MDQ2qI+X1mwTlU2tPO51nQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4u37h7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 14:41:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4de5fe839aeso38077281cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 07:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760020886; x=1760625686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPQiX2366I2f8Av1zpm9cGRdbl2lIGNgfsiAginJlD0=;
        b=b/KtB+9xsnUJUDndtxwg9C9I7Mg1oyopsNHlW57BMojPc+CYtQRYsm9Y6wCDweDAHo
         v27U3H6bQT/kM7F1HEqmVyF6R/LaBQpficJ3/Oej+xP/+QV6rCFnszUoBviXvP8g1MLO
         c69vBpRrRP6t6CO/1lOly+1GHfZVBSU33gRJ5og8FkApJxQctVWQDPMXHsaYvknkRU5a
         FfFZv5QHCRFQcWu8b1Yq9sdj0MTFD9PhWQlvFdLfh7QyhVmqhMZDLUyftcQaFgrdUyN2
         dvHjruejD2H7s52YcYdtjQqa3G9roPrPu7LhpH4b1GTSs5MKiqQWo0RnFZKo92vDc09d
         4ueA==
X-Forwarded-Encrypted: i=1; AJvYcCVxtzIRO8GUTNZQJp6uRJBkY/gUrQOlfxjkV1+gjr6G3GaJSGQvKSn/RqZq7KTwpMZoN+CYeSPw6jP78B1g@vger.kernel.org
X-Gm-Message-State: AOJu0YzBDoMznQmQomwwuTZc3fOAlDiwX2UbjOGVU0TsiPg/vR7E+lwd
	9cXohc249Jsb9fdwR0okf+LuyN6NvMelg7sUNE8DxjDI+028QxmIeBeyDE6dhcnjx1NN0nZhAN5
	qulCVidEjt2J414dIcQD1QzF1iNd5xE1kS9/cylF9lDK76DvytquG4ZvW2qzx5NQjZEhD
X-Gm-Gg: ASbGncuoYgkodZvcOVKUa50ovrdxC+1t86w1bQ9XFx7AvyQjOI/Ms0lsdczMNB+3otj
	4kpuxHjbezkdUZJEByfs6eyCmaK7AyG3Ddwqb8mfGr/iMs1igSm9hQ5LtKyri3SdLzTxH8pHfkj
	KgBbMYZqFkf0EmxO9rSYNLEZ65wufXvNtcLJdvNJzjry1LEkl3FEanNrLW/YQDPpxhW7+ybeKjm
	9ZOLTwaF/vbuOrqtteNuyEOSP5WQkjlfoe00oK40Uu1uv9K++rUuwk8PFMmIDg0x5rNsnoR88gu
	ae63gU5Q42hReZ7VfpiqiG9+Xws/a35SP0xd4m6x/cnVgQwZn8E1dYvDNzPwStNkaaIFYAztOaC
	zRJafNKNB1R6N+3paHOuNJSkSOuRZTY6SimentU37AB6dmiwjsfKImYxUtg==
X-Received: by 2002:a05:622a:2617:b0:4db:5202:d4c with SMTP id d75a77b69052e-4e6eacd239cmr116681291cf.23.1760020886218;
        Thu, 09 Oct 2025 07:41:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQCT9fe6gb0r9Ti2FL4beKrwqnfcI7Jo0U085lbk3COrZ4Vvf6eZvpSGNwWHODrCy2DfPJ6w==
X-Received: by 2002:a05:622a:2617:b0:4db:5202:d4c with SMTP id d75a77b69052e-4e6eacd239cmr116680621cf.23.1760020885608;
        Thu, 09 Oct 2025 07:41:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f39fcafbsm29930991fa.26.2025.10.09.07.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 07:41:24 -0700 (PDT)
Date: Thu, 9 Oct 2025 17:41:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Alexander Martinz <amartinz@shiftphones.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: qcm6490-shift-otter: Add
 missing reserved-memory
Message-ID: <an5bytw5kee2a76ezpmw4w6n2tf2dv4gr7yblfyfluhxwk2jcu@t3dga5hvtoub>
References: <20251009-otter-further-bringup-v2-0-5bb2f4a02cea@fairphone.com>
 <20251009-otter-further-bringup-v2-3-5bb2f4a02cea@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009-otter-further-bringup-v2-3-5bb2f4a02cea@fairphone.com>
X-Authority-Analysis: v=2.4 cv=Vrcuwu2n c=1 sm=1 tr=0 ts=68e7c997 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=7Ovdx5uLAAAA:8 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8
 a=bVQzUrBaaxfiXJaSTkAA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=TQZWkJv5rNK5-PaLMsrg:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 71cX8mjtLMIImWMgTnjAl-66pzQ0I1NU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX/55jLCE7CN8m
 bxpgPTKjj83PYDcZizZPAbY3wBXbPiYVuWI+siafeb6ngvkhlmyGpkwdGMSYVhjyjhNVbnYMr4A
 67d2rccNEVjUEjCen2tf4WtjhZQU1Xt/pegHeLGCFL6zsU4/uPKLYOsdmfbT7P4jeIdKTmL9REq
 YDgpTM8TcNMvzubZ0XtpDQEi44fDrDXbohmd8kUEh48UZFkeu7dzPJkXhkLuDNB7oiaYbu0hkMy
 2lWZRBC8KJfdF8YIkos/50DNee4ISyvYsQz9a9nHJJCGOtuy7PXYTWZWeih8lHB1IR/MdXDf4e6
 Nh6FL4tdcrbu/N5KR5FgN4ptF3z22zi/ZBZWJheDYshRamNTOi8y00KzG29OORXCKN7013aUo8G
 z4qStqf2VIE79jAQAb+mKDsXNjXEkg==
X-Proofpoint-ORIG-GUID: 71cX8mjtLMIImWMgTnjAl-66pzQ0I1NU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Oct 09, 2025 at 11:06:33AM +0200, Luca Weiss wrote:
> From: Alexander Martinz <amartinz@shiftphones.com>
> 
> It seems we also need to reserve a region of 81 MiB called "removed_mem"
> otherwise we can easily hit memory errors with higher RAM usage.
> 
> Fixes: 249666e34c24 ("arm64: dts: qcom: add QCM6490 SHIFTphone 8")
> Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

