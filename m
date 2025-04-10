Return-Path: <linux-arm-msm+bounces-53755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC9AA8375C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 05:52:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2943C17CC42
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 03:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA6511EF080;
	Thu, 10 Apr 2025 03:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YYpSxRfj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607001E9B3C
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 03:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744257119; cv=none; b=TLcGh8F0Lo4VxqaLKDa6n5wqz+GbsCrobPAnMOLCJKvadZ9EYi/T43/t7783TOHO8AcKrniTyUAMzPMMG/ywk3tHkeXTyyvVlLcCDvm1cV9+80jPae/Cr1/RZdVIWn8wvtJ3o6nv4ovB8TTjwhQSfhyS5WzqsphO6VBNVJELKmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744257119; c=relaxed/simple;
	bh=G40xwuuhEalaAtAG84j+mCKLB9Fl0PM0jvfPEOlJ9G0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XNy+ntR/ck0yKk3uGxLHM9TF2aPiM2gN/ryT63fLRV4Wf6CtdpfJNWd+fRE1KQaZ8FIBy6rLXHzvuyfZHBsQubHo1ABKNN4hiz7SG3TsZ88L+Bi37i4tl5Is5gRjB99SUFZnIZgcXTOeMpbbbQcv3upYIM6RK24plUlPeefntew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YYpSxRfj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539NwTB0003964
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 03:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZIvhTGg/PtZD55HriLCLdOKV
	idFTqZ52LaSgqOaJPpA=; b=YYpSxRfjdZYDuUzVK+T24pH9t0rIRm/Jh1Nf9ElF
	fTwLhRVXnOt0bH4Ub8Shil2RRBgkWCCIuuMX6zX+/fEaxcOTb98azuNalY71oDHL
	dZzwjeItJiCk1BKH2xaW/d1cRJNFhD9mC42PDddVXOWRRb4Q47CoieIekb92D9eo
	eGIIrdZP4orb1VBcHDDfBw7lsTuntxR9CsuZkqx4vKf5kiteBc2Q0m7/u6kL4qOa
	dscyT3I34VLfnRyPU8XBWQbI8MPxjPEJ5PPyLAtzBWoz9GtNu1EMAXvKNxAK1q0z
	G/TI0R6bAIfBS+yp5rGbn1rUKHXLvBYzc7zy7jn5q34FDw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftnbud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 03:51:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c760637fe5so93747785a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 20:51:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744257116; x=1744861916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZIvhTGg/PtZD55HriLCLdOKVidFTqZ52LaSgqOaJPpA=;
        b=u2YCRUKx84s0ef+7FMnY4B5kJlCkGcoyGgm+ctcSREmg01a6kPZed815uSKZ5tiR+r
         Xi93mO/QclNiKuKAu9hbnZ/Up0nMU78Z+xFmIcbgeYvJZ4I3fYcN23ZFAkv38IWi6MD6
         Q4VsgycShbsR3XKyBdOuVqAkw8a27FrP8Ob1WC9aqnlKhRFetH0F5rhpSnVGoIO9V00f
         FbfSskmQvBAutmJJ7DXYErc/ZRDxVbq2dFK/jB0m4d56NtO9YTafP5epZO/+ktGeyRHA
         nQnMbtwo71tlxlYEYMexJRX51ZwVGn1SR2A0WlQ7X8ofR+xTzzfm5/3Pmx4dtf+nTW8c
         5XNg==
X-Forwarded-Encrypted: i=1; AJvYcCUkBujUNy9TD/LbvSgvcFoRwFZaFfRtwZSqQpVLd4idozVIVAZaBf1HcwVMU7FaJxrPGuYOpXW+sAeheZ8U@vger.kernel.org
X-Gm-Message-State: AOJu0YyxULVzBL4LGiKVXr1t9vSoE6bjejxG+ZrfLhzepTKZjwfk+R6u
	vh3QL7ReY3wVeNqI0suKt39Bj7j/Q+cEiTVuo7onFjxzRNMgzfYQsFm8hQYLH7YXORVve03YOjQ
	QK5tNcRY0/ASj4yjrv2jrgFqRVnUs1lEeknreGqjCMOPr52lQrtkDmzStIx4qTQDt
X-Gm-Gg: ASbGncuOzwPAjW/iurt6fiCbA+FFEU6FGBQS1eoS04JupPP+1evaON966Bmq7ltQ5D8
	uHhI4a+RpSJspp4Gtqm9vt6hwMFUwh55BaKgtsTcToNP+Lnns3uZeq+nn4RSohMc5VeYEWnGJKl
	B13ROPouTFfdJdqyj+TwwfvjLTkTVjDGTPoA4Xt2av7eD2d24FZjJb5l1Arbp2y8OIPo/L9itt7
	sEOzJ7LxuoFqsgtWQoy1CYmt1WVppYYU2iGNIRcddFa1DZDi/vNq4q10ZAxGuO++UYOr67+6Dcu
	VJ12zFWCk7d/Qp0azDhsyZnw85ouoDrc2dWC3vONruOGMmrBqak9hqNdmPwRZmIFauvcBOGLPqM
	=
X-Received: by 2002:a05:620a:430c:b0:7c5:562d:ccf8 with SMTP id af79cd13be357-7c7a7654791mr194627785a.8.1744257116364;
        Wed, 09 Apr 2025 20:51:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjUtZgiODqub0LOS4XW9ZoeqBCnVVTAHVxIcf7QAzzKM2/fq/RcPifjbgDnTwXsLNvS/I/cA==
X-Received: by 2002:a05:620a:430c:b0:7c5:562d:ccf8 with SMTP id af79cd13be357-7c7a7654791mr194626285a.8.1744257116020;
        Wed, 09 Apr 2025 20:51:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d510b73sm28262e87.185.2025.04.09.20.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 20:51:55 -0700 (PDT)
Date: Thu, 10 Apr 2025 06:51:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stone Zhang <quic_stonez@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_miaoqing@quicinc.com, quic_zhichen@quicinc.com,
        quic_yuzha@quicinc.com
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: qcs8300: add a PCIe port for
 WLAN
Message-ID: <47sed4fhrqqtjfa25hp2nenlcw5jn3s5ejcb4mw35agfmpol7y@cncy7tipi323>
References: <20250325075331.1662306-1-quic_stonez@quicinc.com>
 <20250325075331.1662306-2-quic_stonez@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325075331.1662306-2-quic_stonez@quicinc.com>
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f7405d cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=TBYT5JYlgfXD-NVwRcIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 2RXlAi4ekyCrlyvtiU3BpI3RHIJU5o1M
X-Proofpoint-ORIG-GUID: 2RXlAi4ekyCrlyvtiU3BpI3RHIJU5o1M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=932
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100027

On Tue, Mar 25, 2025 at 03:53:30PM +0800, Stone Zhang wrote:
> Add an original PCIe port for WLAN. This port will be
> referenced and supplemented by specific WLAN devices.
> 
> Signed-off-by: Stone Zhang <quic_stonez@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

