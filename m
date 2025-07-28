Return-Path: <linux-arm-msm+bounces-66825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D8DB137A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 11:40:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CED163BB22A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 09:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F351C2528E1;
	Mon, 28 Jul 2025 09:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T5V8P7It"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C302367A9
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 09:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753695605; cv=none; b=ilBri7gcmN7vnEDLG9OgrvC2fsyOgFFj2JImXN8cH4rTLh9nioEHf553m932aWq+p6hLskZ/pn8EKtWmPe9/k6A4Duj0JnWt3qFKNTeSw5sN3JVfzAkJGQFlfN70AsP89vYyaj5ylA3TDf8q2/eavygrhSOq0aNJBSccVY5uALU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753695605; c=relaxed/simple;
	bh=QiOeBrAIdjrellCMOaNYCha7F5wS46M1LiivABH2puc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eE9nhrXDDpCPWB8EwZNbHYU/eGVGY16PdXnZceuT5IwDcDph8AduDgB/5Wxt6bPir1YaZgpwxIMwoQGT/15Mz/+5zWET5QMzST9HfSR76ymGUP6JF2fjzbwAT7kQINFUoYmSSsxfAGwn0hyzYipNW6j+hMUQ3bzA/W9e9iBQaNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T5V8P7It; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56S4rQRE014386
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 09:40:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oFB3vG6oMDSksw+IqlEzE+5W
	vTvnqjVwd3/y/mOq5Y4=; b=T5V8P7It8OhjF0CIKXRDa6KThqdnW/9ojBQXNTKg
	w55P/G0u/d6gHVqyWSpcirmZyfECTukbdy6anyJecWkpIjq0cS09/b8hIzXcq+FD
	mKG4hWT2gyZVTHavL+UPeQi0UunHhIMvYcuEYfrvIXxid8v8ePZv7/npSq9pxVYP
	OWduBbOYfpHLh1VUIRT51TMIPM/1ZNLCRPmNe+LUQTw1/of0x4WF4OH3n2iV8UUu
	LZ56X43pLPiv0sd8fEGIMKIsZZ20xws++qwU3NHGSyKxLKuVB/SC5ATuE/tKh0lh
	/4gx8s7V07QX1r1MmBtdhq68S53D4ck4mV7KHi0a+xCnTg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484p1ac288-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 09:40:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e33d32c501so1107460985a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 02:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695602; x=1754300402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oFB3vG6oMDSksw+IqlEzE+5WvTvnqjVwd3/y/mOq5Y4=;
        b=gYmsgmNPIWM34K6OzEJkA7BDnntviJSb+QumTcJCibu4KbTGGeBabUIgz1f47vlqnc
         N6oeViOLSjnMju+M24BUFNLAFd6CtBrJ8zYDawataWUYGjyt/tpjnwcw3AdXil0vrUYm
         TUB5aMEDzIXVZOmjp+5mn1Kivt/mi6ob40dJ7SS78wR2mxC9K3hTvzmtFbsDp3K+EL6x
         /1QcfCY9ZZHxfT5rPoDAJcS5p3jMZC0ByuInnnOY/s1IcUkw+0QEM2+ZgZ+lkXcYh/T/
         6O0g6N2S+4EYhFlEbzYfSt1jsKlPNGGWxPbR4v4Z7fF2WPrzia0BwO/qfPmrPT9XTWll
         fqgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWu8NCJflO83u4Yvlmvhew2dOhm+KIn8Pas0o4GiwHugiLvR31tzZNbGEIO83gmzMsCpCLjtkeTNW31vMlD@vger.kernel.org
X-Gm-Message-State: AOJu0YzHXimvWxahYuyxaoq8TXymTsgyxQ/ZiEnL+G7zEAubfYJ+Z6bp
	EzofoIx1AHb5cN30lGo9e2djpx47U3IFLov1w3gVLzOasXxpzFOktWB4IfLZ5zsDBAvHWYCPZTQ
	AVnYo/LdF+1+JcASF7ZZ1tZAQCP8kXvg5lmorC61R2DAXiiKY2WS9AqQ6yjZCc4AfUo2S
X-Gm-Gg: ASbGncvHI0z4jutaJhqhX1MtP7KEJjmNZWHHJ+G0qk/1E/N0yDhLAK5hfDttDNQVQ7k
	8oXsmEhaO7pPDwgzcBbDq5GVTKEO6hpov/JCoWQqXLcOhcjKc6wQSSqgEY68lBnmNsi5uyg3Y0F
	laFF714778aMZBQx3GKeRCsbN6wvl1BMsWbyEB0e6gSaVU+7v4EwfqjF52z/2YkzhXi75Y4GvhG
	PMVzVr0lPefIwC8bwuI9jdsgS/NlqS65iD2fzgsbNM6u3KIpoNG2inCbBsL6LOjgspRMLVQem/3
	5ZrsoJMyplFcrvQEtsdBnCUbJEmjOHEzSg0MuHeULQt4k5FjPNSjJBoIoVF/ad2piszOY6j0b0R
	+gw6aYFcM+mRMSKt29ucf0/GKgKDRtLY+6yjjqxMI4EK4Ci+wduJz
X-Received: by 2002:a05:620a:d87:b0:7e0:2c05:6b9f with SMTP id af79cd13be357-7e63bf84f20mr1494156785a.16.1753695602089;
        Mon, 28 Jul 2025 02:40:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFh9YvZXA5UIvwUmMAvvJ/c4paHn9tAvNskBJAWiyrfPCKv85m6T5ST1rY+bjPyFBgbZApBiw==
X-Received: by 2002:a05:620a:d87:b0:7e0:2c05:6b9f with SMTP id af79cd13be357-7e63bf84f20mr1494154585a.16.1753695601548;
        Mon, 28 Jul 2025 02:40:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-331f4278c27sm10815401fa.76.2025.07.28.02.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:40:00 -0700 (PDT)
Date: Mon, 28 Jul 2025 12:39:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        bryan.odonoghue@linaro.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        mchehab@kernel.org, andersson@kernel.org, conor+dt@kernel.org,
        amit.kucheria@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 5/7] media: venus: core: Add qcm2290 DT compatible and
 resource data
Message-ID: <gr63jb6yoovm52l6a3h53scnhgkg7xoda6lond26dduy6seg3o@knyd7qavg7yj>
References: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
 <20250715204749.2189875-6-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715204749.2189875-6-jorge.ramirez@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: I5NuXNMwaJytP4gx7tQDLbBbWmGfqfk6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDA2NyBTYWx0ZWRfX/y1k8HRE8Bgn
 PEPk3FrbQMh/ZJbnkoh4SiWrdIcYsjz0FOfMlTzOfBE82SAYg4szKehZhycJKvsUYT7OEuLnjy6
 qWuo4l9MUCMi2l8YpfAHXtcvaJRdCxIP3YxkAbJYrvFVBcheXhF8d9PCPHt22gD6009MsXVBkMY
 D57RMRBA5ue1hEZE+7PPQZVVh7yb72AmO25g2e2Buj7K9IwXCTtDpnCsTXBfHGouiUvahmJjPls
 MHA6oc1oc2jOuschiytFmjAcQy3kTxVEsvAm7h7DpbheV/seB7K6SDnsMhjcKBEI+sRT9PqLAeD
 S3+kS2zrkcUlWwcUVkjraR0um2tqj6yGpndglJI+ZOvTI6uQMdTJxC/ZeuesxmBAe4Y6HjLiGQP
 QS6zOTd9p1E8x4sJ8xoH2W6tEbe4PVqW+xm/dc6BtF4NW7bWIV3LYkErz/gAiF3oFn2jAgiL
X-Proofpoint-GUID: I5NuXNMwaJytP4gx7tQDLbBbWmGfqfk6
X-Authority-Analysis: v=2.4 cv=KtNN2XWN c=1 sm=1 tr=0 ts=68874572 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=fNMmvbdrdlD2suN_VgQA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507280067

On Tue, Jul 15, 2025 at 10:47:47PM +0200, Jorge Ramirez-Ortiz wrote:
> Add a qcm2290 compatible binding to the Cenus core.

Nit: Venus.

> 
> The maximum concurrency is video decode at 1920x1080 (FullHD) with video
> encode at 1280x720 (HD).
> 
> The encoder is not available to firmware versions below 6.0.54 due to an
> internal requirement for secure buffers.
> 
> The bandwidth tables incorporate a conservative safety margin to ensure
> stability under peak DDR and interconnect load conditions.
> 
> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/core.c | 51 ++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)

-- 
With best wishes
Dmitry

