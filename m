Return-Path: <linux-arm-msm+bounces-75941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B11DDBB7FD6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 21:37:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 32DD834800D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 19:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24CF8225788;
	Fri,  3 Oct 2025 19:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bq6WpBaF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FEB221269
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 19:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759520266; cv=none; b=EBHgBmxn3zTmkyeYpr/g+s7zK/iOqwKyRVQuZuBfhKe/BqAq20BAN+vdWcqlbjD1iI62bZT5HGqYyGxy14YHN5OIWrQ6D0Cc5sex8z+jejl5REc6HLQVgx6GQJb0XT9s/6cHYko/P5PXMzzTpvxasiDChmEVhLrFqflm0OFop/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759520266; c=relaxed/simple;
	bh=L6p/x9voTECqLfOdeh8AIPH6YGnYNQuYZvz+8csEnOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I4vVWhPTFrU5/y1Cf8uEpfzB4AIPe5sjPdCEU7EMdu4Sr11ip7Nr+YHNKW7IoiLVXz206RmNKC7J1GpjnHPxr3BKT4VWnEZ1yLqfN6K1kdvt14JifrhXQ1K+r5Bz86j+WbdSunIzpqH8w6AgLXFpUud0zWGrCP1m6yRn8qZs2hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bq6WpBaF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593IKc2a007926
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Oct 2025 19:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OFUrlQLsepMyX0Jz/227i1kP
	IOkJPXkGhpbqceCOZDM=; b=bq6WpBaFk+06wBJwEH0qnWtIXDM7XynAj2EhI00p
	0F0yQKrOjKuG2uD9IJDjX3fBHiA/AaKQV+r8JNIpbKckfk8TYGxHkbyXxHFD1TQQ
	w+hr0slZQ0fTTFBO+3SkLT43KmmQKQFz2paiI0SRuA6ap1+BGolkskmA4+IjF/3M
	R6pzz/sdzb4rcHEmX3yjh6TK2T3RH4kNuVQLCp4qzO9qa6HbKYatKVTiieMWl2HA
	X0vwvwlKecuiNMH7e2u1y+3lScRfaLlQ/4Bm0+/OihQTqQ/J3L9Elig2wr1mH7Fw
	6q310s/SQgoSlUVmROT43PxGwKt/UW2Cejt1kDRi00ksbQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49hkhh4yxp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 19:37:43 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-792f273fd58so47838766d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 12:37:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759520262; x=1760125062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFUrlQLsepMyX0Jz/227i1kPIOkJPXkGhpbqceCOZDM=;
        b=tk8TnhiXJMIVG10hoDUWXGbGrgaSRZeKggFXkGO0a+xdPG/PxSxypnJ7FBiFd2/jlP
         +Qpp+MNsaFH5ImYKBOvkO1KiiDeE+rDkLCfwQZJtKhVodfjzShKV3GtOoLnspUIlOUgM
         finefINBARCQSJJ7Z/mqjVfiA5C1xiy2vPnlha7alkdq96+jGhZMHqpwqwAJhvX//A+x
         W8c8lZlmjyIBAYEQFgQmcLGnt5B7IWN5mJg5tsi6UDzCm323v7IYdyEpzng+26RsDkg9
         gAuJD+DHvh47iHmONL1eVBQoA/GdEXHjS/m9+n+oAzwPRTkjfy1HkfQIqSyyLFkwEmU0
         jAvw==
X-Forwarded-Encrypted: i=1; AJvYcCUKxKaGEEvYM1PbcnKvK/tjsrbDfuKgAv872OXnJRbRJ7u+pLww04/uzUPY5ePa+76Tu7Eif/I9rxWMMKSK@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhcd6aFwPDA4oSK6BfX/1APCXQYdtHgvgSjXo44QMqFehhkq5g
	7uK2eaR12JiF3ymg2um1iuc1KVLpeVGE4iKhxEZQLdZygdYKaR0rbN+khtxeWvu/hY/8usb53C7
	wN97nQuyOMjsENAn7j/s7MN90MuEj8QXjy1bd/9nXhzYwqEDIAo9m87zQen2eUfCXuJ0a
X-Gm-Gg: ASbGncsDdPrkH8l5CRcPOBhXRs+HjocZKcxYKSVheejyGv8RTTn5nukC9b5b3fc+8Pi
	QmxXnHQv228o1eJXqQT1LnY4GGVeVKeb9XH2IHMtfBVyAhYSdAtaicqdY/xdDdDx6F27WSb4yBz
	j0yHPJUcKfiyRZNcpkMP+Y/Yd8Joq+1Iuj2xGeU7OHXDsL7OFuIzBtpPkV7SCAhaZbnjHpgRxkN
	72k9UusdAznvC4SgeaviIXoAVCd96JOv/qMxIsU/lr7osZr6aK2LL9prOk+UveYKx4DIAOvMo+Q
	hF8GQEXiUKhXTG65lgpeBP9TfjxrDPz5SDfy17umXeQJptjX95NWYIw1nzbTSifxBEEGSdGIT8l
	aqX8XlqEqh7HuRcUDjcXGZfq3xSFhxUCLnZYiMNtd4I9FdHpuxELQB/LdUQ==
X-Received: by 2002:ac8:5fc4:0:b0:4da:207:f0f8 with SMTP id d75a77b69052e-4e576a418f6mr52319261cf.11.1759520262105;
        Fri, 03 Oct 2025 12:37:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJeAynDi2ixAidT7oxs33QpSn6Idl2n/OrcQ46tde8eNgyX5FczSTYJrNB/bEEPlCldm/kew==
X-Received: by 2002:ac8:5fc4:0:b0:4da:207:f0f8 with SMTP id d75a77b69052e-4e576a418f6mr52318751cf.11.1759520261512;
        Fri, 03 Oct 2025 12:37:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b01135a82sm2103189e87.39.2025.10.03.12.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 12:37:38 -0700 (PDT)
Date: Fri, 3 Oct 2025 22:37:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>
Subject: Re: [PATCH v2 2/3] clk: qcom: gcc-x1e80100: Add missing USB4
 clocks/resets
Message-ID: <rdmpmfvspa6kjmwedpouy2nndl6okdrb7q2eenvcvpnnk67wp5@56fxgwfc5t5w>
References: <20251003-topic-hamoa_gcc_usb4-v2-0-61d27a14ee65@oss.qualcomm.com>
 <20251003-topic-hamoa_gcc_usb4-v2-2-61d27a14ee65@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003-topic-hamoa_gcc_usb4-v2-2-61d27a14ee65@oss.qualcomm.com>
X-Proofpoint-GUID: FrxYtc6ytysg6pe3udQlU0a7oBPYbr4Y
X-Authority-Analysis: v=2.4 cv=cILtc1eN c=1 sm=1 tr=0 ts=68e02607 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=vYJjhQUXXu9twL9fmf8A:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDAyMDA0NyBTYWx0ZWRfX/DADHNUfOEBp
 gC+KwQM7g3/UtAcHBKXYspT9mWhvHbASvgIDJNM2oYRdXOMmc79W3NtcqUQcvBjqumTvnUFqAHP
 r+eyK4sqL89i62dlPQKSp6Ox+/+JaijBW1+wLEbEaTogB+FFk5CNpclamRhAApy4zvOQlmMe7Ev
 Mn3dXpLbrNX53rD8Km4wQPNrwnp00YoeEk5FlCpj9bLXYXKiAsJ5Ce2iVAUVvZBnm8KYHgi5KmW
 Ldeg+nYdoEzIBnp4jp4PVQvkyh5QmC1GIFV4jO09EKSt13WO2MZtQDLs5uSuKEflFj72/IAkqov
 DRV7AURZzrx/kmeM+OyczQ7sNwfCyjrL4CyqUS1/56EFNw1VarZ6fdCAI5X0i/jdkH+1i1ciwNU
 imONJ30Ex9/56lGa5Ht/gkWZPFL9nw==
X-Proofpoint-ORIG-GUID: FrxYtc6ytysg6pe3udQlU0a7oBPYbr4Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_06,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510020047

On Fri, Oct 03, 2025 at 08:14:39PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Currently, some of the USB4 clocks/resets are described, but not all
> of the back-end muxes are present. Configuring them properly is
> necessary for proper operation of the hardware.
> 
> Add all the resets & muxes and wire up any unaccounted USB4 clock paths.
> 
> Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-x1e80100.c | 698 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 681 insertions(+), 17 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

