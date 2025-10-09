Return-Path: <linux-arm-msm+bounces-76691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4441BC994A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 16:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29B393B7E5B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 14:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3FA82EAD13;
	Thu,  9 Oct 2025 14:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YkoKfHHz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049752EAB82
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 14:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760020866; cv=none; b=lVjbl7oz6bpThcx4ppBVQckWTJ1tMTcCOyyigMwjNte1vA7KMoq1bQI/YNCYLExQY4HeoX0kruA2THMycgGIrkQxS6G0q+CBUoxEkqafkcnpuIQPHW8Phj+zJcOYQaJs9+BIfDyv5Cm3S70yIFLZ5vk+igCUiNAHQzVENz/HU6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760020866; c=relaxed/simple;
	bh=gJD4F/VUtyf9cPnOh0/z6nqdkyZqGE2442d7pVCtk5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y7g0Z9ZGZfugUFgTmusMHGIukXwB80YnOSzgE+9DMjJpnlTQD3+WTWsxvbdTDRd9s5Kk5Bzy4LAGB6rhsl093kQkvje0MPoniHWFw736Ex649Y2FVN9irtmoMcsq3MUUTJedPLlXcp2hVRsCci/uNb6FNPAVj+Yft9NyAKDIZvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YkoKfHHz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599EbVaC030514
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 14:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cE4ZbHCvUDpmT8UVULSVyNyY
	hgMn1RLMHyhsCsq4I2o=; b=YkoKfHHzQPmes5X5Lu7uBUVqJ539HybUmEdJTtNs
	mYRfymI5GNrRBZovHKlnalSNkYlMHKSjqwnoTeJO/1qKHtL27T5x9HHrJZmgiI5e
	M22xHnZS7z3NNq4D8F2wzNqTi5Z5QK0k4ggwg+4tC+j5+2wUtU2OthJvqKUjbNXa
	pFzTLQSFqTahf0gRoxPQgpHQalzx5K5clJ26++Arwh1Lo4yaS/t5/7FBdDE0BWFU
	atFEI2TtmTaL5plnap4dtdza/xhMR1m5MvItzmyoVeOy5pQiEGfvDob11DS4/8oq
	VB89Mc4Th3E2JqlfR96ntjKNXtiE+9qX3UyVwEBipgB0Jg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4nk73s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 14:41:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4deb67c61caso41976211cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 07:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760020863; x=1760625663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cE4ZbHCvUDpmT8UVULSVyNyYhgMn1RLMHyhsCsq4I2o=;
        b=WazBjkcvJSHh3K54kl24ZWKpF7wahvVm+blkoXA3EhCYcal/50XOIF2PVmcJjFX1+P
         3gHYlqvVp2cP/LehLE25St4OLlfrqy1XnLOO/WrUVTApBkDzbZf7TPms+BMImWOkrbZv
         xkoDFCfKVBHzsxF137qDtPqBWSLhOKT/ZhsnNv6PEvAK3gYP3KUb8Hh84sp8XFUI/sjz
         gqrURNYnnH3g5yKkJm286yCVFVZOo827HUzBt4QOZZKC8SfedouHNcALi6kqw1VVMtEq
         5UTgCMfCXw/ufVl9tejKyc2P2E7KaJ/2GW8TX+MkpdCkOng0iPU0HFRSVnn0ku9FiVZ7
         r8aw==
X-Forwarded-Encrypted: i=1; AJvYcCUYykavgFPH/TqaLcQCGZRTjBTbQZGq/RFioX2Dhcw/A0BtNRLfMd518cyqoHEu5o/CGtmYwo3zMmKVaQUw@vger.kernel.org
X-Gm-Message-State: AOJu0YyVPqp3Nw7VuH3xl/7GyKvSuhMa3WjxemJMVt8rv/uLFeChiCyo
	XZOzf+4zAFquE+j3ul93n9w1LOcYLVpQMxhrQvk+/ir6UZ/hnWwUre0ozYip4zRdVhV3N/Llc3+
	SKCxP4qYwJdO6pusCYhqG56ZUsQqYML81OGnvbGqunGRxShxnfmETzdcVom/uyKc9Tc67
X-Gm-Gg: ASbGnctcVozE7kDeAC/ZVkRjNm3gpmEXvbeD7BnZkN1TMijgcpmjRWv9uUHOs46UHKB
	81PKp7i2bNIGNYFUAiEG/zDRXhbqSrOO1lPmLFS4niXQ2BpSDgcTb24KAtHTIE2GWjkkGjc3Ynk
	xKMVdDZXRYBTBZPMMfxPQg032JlzinuQY0lz82Eayux4UiVTnK4jzqaVHnUY8W/DNCbWDrqzqHE
	REUv5JamKJJ7rCbe5qw20xOP4v1+cI80ONiWihsFc7eot3Lcs7LMdPqxjbdC1hUWNRyCV0g55aM
	rOYzhVibhO2hhE6NU2OZVXY3Zy0jOvCy0adCqFXBGs0bqbpDzgSKaRcxeRhJWUJFJYVip3jebE3
	uKZXKDSSNULpVMqfcJj0JU12IuUyVuiux2+sWRCbVtewp/Pj/FoWeUIgtaw==
X-Received: by 2002:a05:622a:4d0f:b0:4df:45b1:1547 with SMTP id d75a77b69052e-4e6ead64873mr98220191cf.69.1760020862911;
        Thu, 09 Oct 2025 07:41:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEm/vMZ4n1+Cr8Xoyx5rH/NZmEs2uEEJqGMiK56k8l9LCNH4tFsaMchJrEpi+ttYXYEnglWzQ==
X-Received: by 2002:a05:622a:4d0f:b0:4df:45b1:1547 with SMTP id d75a77b69052e-4e6ead64873mr98219731cf.69.1760020862443;
        Thu, 09 Oct 2025 07:41:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907adb2607sm1093116e87.97.2025.10.09.07.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 07:41:01 -0700 (PDT)
Date: Thu, 9 Oct 2025 17:40:59 +0300
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
Subject: Re: [PATCH v2 1/6] arm64: dts: qcom: qcm6490-shift-otter: Fix
 sorting and indentation
Message-ID: <4zflplcqdjbkplu2pb3oy7pc24svrlo6id5kxr6g4ivvyrxh23@j3bfneurfaza>
References: <20251009-otter-further-bringup-v2-0-5bb2f4a02cea@fairphone.com>
 <20251009-otter-further-bringup-v2-1-5bb2f4a02cea@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009-otter-further-bringup-v2-1-5bb2f4a02cea@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXyMOvjaiV8b1b
 NCCSPd43t4rUn/I/41EFooq8IkLz3B++7uaR+9YsqD1YqQR2NjJZ1gXxlVkhTn7aZm+gRBMeGMV
 vtyXKhjXEPUDFX25JsWlyOWCrvPgrJ6CXfFDKHJsTWhYUpCZlIiA7ZV3+dRPfn3U9UDM2xzNKFI
 GQlTMcRjFPTYYkDCHIZVa/3llG+i/m6nADA+B7oxPwE9O7XWJwkH3e51po7qDF5oF3c30jskqPL
 G+TFF877CfPpBcpPsQB1v5X2nBWCWIOiOPMsBm7DV6uQ8CrB/3CAdLm5fO71YAqxLB2uePcdUwg
 tlWzi08yB9U0bg+wT+2iU8zaZjBBU7MrjEm052F93JCbSAS5lbxa+ZHxEb3UU8mOJkxQL8hr7Qu
 vn0ksmfcpirb7a9apqw6vOIa8xHifA==
X-Proofpoint-ORIG-GUID: AUfth2nvoQCbH5ECVu9CPJdW8118HwgD
X-Proofpoint-GUID: AUfth2nvoQCbH5ECVu9CPJdW8118HwgD
X-Authority-Analysis: v=2.4 cv=VK3QXtPX c=1 sm=1 tr=0 ts=68e7c97f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=7Ovdx5uLAAAA:8 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8
 a=0jPwT5uaXyJb8NjaZ-0A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=TQZWkJv5rNK5-PaLMsrg:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Oct 09, 2025 at 11:06:31AM +0200, Luca Weiss wrote:
> From: Alexander Martinz <amartinz@shiftphones.com>
> 
> Make sure the nodes are sorted correctly, and the indentation is
> correct.
> 
> Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

