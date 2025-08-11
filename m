Return-Path: <linux-arm-msm+bounces-68328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 211B3B205E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 12:42:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBA3C423C81
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC7023B632;
	Mon, 11 Aug 2025 10:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CbqRhEV2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C65239E9A
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908972; cv=none; b=MjXJ8JmT0rKs6rb7nBuds0J8j4VNCQJTwjoLMmHF/mP732hlfUNSBG2cv+Z96oIYCk3imt9CHhXeUomfZfKNAFLhxdwgVRNKABJPckFQxvn4OoWhudos+bEF3HQMKJPLVzKdtYu1NxHFNboW55VA8QLHbhmvrRQtMrLIb5OxZcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908972; c=relaxed/simple;
	bh=mOqDDZoMPgZc/q2InubECuGkg+D4J7jCU/bx+daf1oM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SqVLUJrYFErKd/G3kQyybMKuUqM3Kq9JcvSnojqOvZz7wAQieMmPX/oS/f6Gg1VAhGnQOmSIFMXpF+B8ZgKVEhzjNshcia4STJWj/34QkFn/v4tgrrIGZPm7pYyWUHwo6Rvv7Pb3dA1NWDcVi23tFRDiOgMvVMfmDyxZqPgzXMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CbqRhEV2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dlpS021649
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Pb7PNgxyX6af/pkPAfBKFKXl
	YtK2ycRVMe0bVzsJyyw=; b=CbqRhEV2s2G6zCU8ZygCmMY3mtRh20yFerIav3WD
	fn7XdFh7JP40C6JZvVG+w2gR+FF7zDRESbjE0VYchl4Ux+UZCItLU80TY6GjeOyn
	44vHuvmqyamxOcic4b+Odul41hqRMd7pV0Dc5A6S/PD6hp3NY5XcdO8FlNwROWAM
	7c0wE18Bm76cN/iHwSfV7rwesq9o5/mNDxL8b5W/yYmA8sfydE7AmxUWwSWmCgk/
	zgXz5bEDhH5oFjh6UewbgLJPwvOnuzsYwDHlDsq5Y4KXPRYR7NwNZP0XlYmOvW/O
	7yTO5EHbL26pcvvUaJaaOuo9GBeutoUwam135Paq0zN0/A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxduv1aj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:42:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b08d73cc8cso119879371cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 03:42:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908968; x=1755513768;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pb7PNgxyX6af/pkPAfBKFKXlYtK2ycRVMe0bVzsJyyw=;
        b=QOshw6lJDhf79s4d4mpbROLAecnggnz2iFUaMoiA6sBSUcEuHUH2hp+5lro4jGhB89
         t5s+wWJKm4hehF3LCKAnjJA5ABMKHVNiRUisoYQqXq67tskACG4itKAu3eq556RyMpwS
         hUaFEZpDB66noq2wF2mR9UiukYpT7pxI8QnayA33ehdS6AAcWumjB86nsFGogb4luquj
         vyd1ZJi+B2rXzwZ+vn7Ire84Scro8egCO5DtyPbQknGb0VhCCzvEZEuQzgO9hO66lfu9
         uf14jg/2wXbVVs8VqOudxENRIWFzKjp9yfycbmKvIJO6dBmvXQRdLoN7R5r4LWccd9pd
         iVVg==
X-Forwarded-Encrypted: i=1; AJvYcCVK0yeCrfr9hWyjaCk05ivHMwtC+fCZiljq7t5uBXUiAcOXaVLqFnaba0XKnSW078iYFb3MPjeJlqtW/PYs@vger.kernel.org
X-Gm-Message-State: AOJu0YyMyOJhfxlTPDUB1hEte3AdMcaTViWDBUkkVbnMLGEo8oVWq5F1
	x9SwAQMLqE+8SMbL/YMaCf21fq5mfbTflrt1eN9p9ByRd8sBOw2qa7/4N8EctwFrjph6qxpAUPM
	s/MZkllc2xk9+Qad848sJNNYhiL7kWULb9QAZ8FQl+qPL5tu51kXb7OlrQbOEa9CCHK99
X-Gm-Gg: ASbGncvOxGyCua8WXNAujqqgJi7q4Py9vfUPTL+cUEqkbt7VPwsLv/d0y780Khzdi2k
	K+EUx1XTFnQ+YeuPEDoJ2KPbQXt0oifYN1KNvJqzG7TMU16tIE/JJiGc+/ybDabqc2zf6VbiPhc
	WTEsym/ZGnIZwu2k4FUUOx8tESUU+u+lHdLo61iOsmPro2/RmyD12BvmrFOk9XDPnQFhX2IlQda
	3fRqXDeF+U7de6qTVx8Sm/f4e1XYkKaKdLJjVogc/5btpo/84lqgPRKtVqGeCL7E86TNXkHlQ6U
	FC8MwENBeVcPuGBNGQYxJuAuYcWTDwapZIWA+4IfJBKKDqDgOzlq2RKVCEsOiUM6mltyDp1FzyG
	aFvySj4ZPcvNyy6DvqY0I5u+QmZ2DXMDKqTU7XO8bjNRKiefQhyDh
X-Received: by 2002:a05:622a:4c06:b0:4b0:9c0c:f62c with SMTP id d75a77b69052e-4b0aedd616emr175052641cf.31.1754908968585;
        Mon, 11 Aug 2025 03:42:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+m2ZgpaOJNB+Ce23VikAr12x1UWOFBCp/jDY7SVCnKs0r8fMG1zNm5IJWeaCGYSHLmvDLhQ==
X-Received: by 2002:a05:622a:4c06:b0:4b0:9c0c:f62c with SMTP id d75a77b69052e-4b0aedd616emr175052441cf.31.1754908968150;
        Mon, 11 Aug 2025 03:42:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88db2214sm4161713e87.177.2025.08.11.03.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:42:47 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:42:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_kuiw@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: sc7280: Add nsessions property
 for adsp
Message-ID: <nsdj4ytpdn55mn5l2gr23w4whpbt2ogxbaomimqoarvskz3uzs@5mbrq7jvxnp2>
References: <20250701084905.872519-1-quic_lxu5@quicinc.com>
 <20250701084905.872519-3-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701084905.872519-3-quic_lxu5@quicinc.com>
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=6899c929 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=y0QActD64cBbDUrEtRIA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ieoNBjOAKsz4-Vag8tbY0vRXbzGcrx3s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX/86j3YKaHoRA
 uag7yN9+zQjdKOjKj2tq16ufpt82WdqHZRVQuw82IQIxA3+TQE+j/KaSjas9iptpC/PZz2fqkwO
 cR6QwwYPU+Ef8Na0cFixwPjAwS/cRTLwWkJlS7ltBLHB9bfjxYd0KGegcPOH9Mz8USYP2mDLRe5
 WAyvc4l36XPu/mtkGKLQCM8py2gU+F9KXio34Aj81aA7o4uN/+lfjjESGxc5g5MTu5n69VY+xbx
 xsoeMnsK86k7AwktnASlMzncR7l6Mr2sxnpyDc2aWzW0zwcek6oJuYdvbPmni7KUgq8dmO133C+
 XJvaRfIkwWflEMXmDXClFvPN04moqvRXWqUDWkxXjfy9G6cVuLlhXIHpyOuOE+avAItlazN+9eR
 T4USk7OX
X-Proofpoint-GUID: ieoNBjOAKsz4-Vag8tbY0vRXbzGcrx3s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025

On Tue, Jul 01, 2025 at 02:19:05PM +0530, Ling Xu wrote:
> Add nsessions property for adsp context bank to make sessions
> available for ADSP offload.

- Describe the problem, describe _how_ the commit solves it.

> 
> Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index b1def5611764..5a1eacb6685e 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -3939,6 +3939,7 @@ compute-cb@5 {
>  						compatible = "qcom,fastrpc-compute-cb";
>  						reg = <5>;
>  						iommus = <&apps_smmu 0x1805 0x0>;
> +						qcom,nsessions = <5>;
>  						dma-coherent;
>  					};
>  				};
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

