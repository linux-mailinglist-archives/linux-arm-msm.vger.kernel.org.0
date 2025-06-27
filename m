Return-Path: <linux-arm-msm+bounces-62794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E06C9AEB87D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 15:08:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D46A0644965
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 13:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96E8F2D97A7;
	Fri, 27 Jun 2025 13:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QYEXqRg9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F05A2D979E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 13:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751029672; cv=none; b=KHPZq37QekJuqLq92DjTPGd5I+1blTLQTUqVXSqSKsResZx017Mik/53sQeFYVwTM6j1r6qUPuJev0E0qPT01hH16fnTwsFoXHwVavDBZpMZBUOx/K0LBsaZTSs1KShR+nDWxJADjaXwMnBHXgOVUEWvypHVRxJm8dtNbiArk/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751029672; c=relaxed/simple;
	bh=1HjGPrePx9BzLMqlBHVXd9mgOpoGcPi8zMxkRoCatQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oMry5xkfoXaw2yjX2FWbHhMy6bFloZZLFunOnlCPxh0uiTAhVFEwUbdLOwXKTkHEMCw086URQy02srGkBXhh7VZgCYjvBbZD6GEcnUPy7f2KIee8W+KBJfe8iU1PVIuaSLFCWkPyVBqtMjgSXoGUJNRy1Wyo10gEKNOhYTX5Xw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QYEXqRg9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCq5dI008776
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 13:07:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7B1mI43rlLj5MdjG05K+u9+5onCyxbic4JTto3iPdEs=; b=QYEXqRg927Z++bbO
	xOCZk4H+CYaAZfC1X5xqjlQBv9UQcCADerV5UxGLUsiceRYSggfkg1oqN2qqFpyt
	VhvuW9uy//eGFducA8i9ay091SDCyMibcRcli9g1RWkCkdEdUc9R/w92t2OnihzQ
	x3bBe1T+oCzakmBASiwvuTOjCZQW/WYKomBVs9tmv5gIn1afwjCwgCtPTzzYdP3b
	IzppQ4jdnnQNIWj50/yZ31JK0qi4tMIATnnTZy0zl7PZ7McnAmzXSpNVCWX4qT6/
	dFfXnG5r0LM2EaOfZprDvb4uJq2J1ovAFFnrZQ9/eRNlZt6dLXVoHNH9IoOWH70V
	PUFnMg==
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqw9s2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 13:07:49 +0000 (GMT)
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-86cf89ff625so199347039f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 06:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751029668; x=1751634468;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7B1mI43rlLj5MdjG05K+u9+5onCyxbic4JTto3iPdEs=;
        b=g40cCujiBiqB2/Pa9N+fJNXyaPk0nOAcMZRosL1s8HGPrihpGGhHcbA0s7ebEHmZd+
         634xU1RPaS6GuWPfvL2T+dKQHc1H9WEopQSZhzCqPHSx7wIo2xQ7kCHdOHf6CGpq8vLk
         7v5LtE/Adn7e+dUs1WT47XxVnOmaeZhwtupUIOZq/B19lBjxDlDOKweODXKu6RLNM1ye
         PvZt2LeARHBnVuYoRFmCm+52FKNL6BzQcsJfWjRwjHbU0M5Qr3kPdYPEi0ObOTX+yjS0
         jW/SfhcTiy7iSa90jBkfA10itrSVDPKuW97jea0OX6h06p0hwj/EeYOKZT5Rk26s2Zbm
         SaXg==
X-Forwarded-Encrypted: i=1; AJvYcCVs60INbYw3xAIU9d9UWwLgFMnzp5xTKE+YC9rWhrnvfCCo7pgrS7D7cQAnEAvoxnr/JqseNqQ32ANb47gB@vger.kernel.org
X-Gm-Message-State: AOJu0YxKIlt1ntkVfkmZO+h9aIX5pvvxu0L6gPyrMP+gqvzAMK++MG6d
	Qi/Jw5E85pqmfvDsNNE5of0ELqXky/dU7dWCX0p4S4xKfqolE9QLxAHV9IZecUxTveT8BTgyPar
	Nq7IxyHQnJ2GDnRlzSsdKky5qba6R1nQN8JXaTcqPKewYUcBU0XS4Ehn0ELaQU+eXtYC4
X-Gm-Gg: ASbGncvRvqFqzJDfAM/0borPkvNGrzw4DAmhqoxFrdqr+EBAExSGO5TA5KV7amxPltg
	KPcT+42o1L5EO9ea9MkxmrVZ+i/LjbAbctpuSVUwYR9nhM31Nfo87YamZ7TZsK/aUBgbMxU4YCH
	w7+dCBHhGzQsyMUOiFPzFQElfJL7Irpqd3aCyoMB4/QyWdaJJCiyaQL8daXfqVVyNUpfDcSrWKk
	cckC9EqEKaRJ/tQO8NkyOAIRfBnN57G8x/OG0bZYwhxcYjjVSY1lhEl0VlDafLBPPuTijQqob4g
	aYapBKV6RkJnFWQVFoViozxI8nr1JGPvH6AwR6MLdKixU6akET5bowc1lIYQNMO6iOB9FnWdaYp
	y/WxRBvXzLISa4jqHw1yVn1J8ZLUeim1f+4Y=
X-Received: by 2002:a05:6e02:1c23:b0:3dd:ceb0:f603 with SMTP id e9e14a558f8ab-3df4ab6aa68mr36335095ab.2.1751029668103;
        Fri, 27 Jun 2025 06:07:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1Fcg6f7qKMNrYzUxfeKnTHHm5N3qcjPX4yV/7MeF8kJhFcrBQH1magZpQ6jw8N55D4Fh7hw==
X-Received: by 2002:a05:6e02:1c23:b0:3dd:ceb0:f603 with SMTP id e9e14a558f8ab-3df4ab6aa68mr36334625ab.2.1751029667636;
        Fri, 27 Jun 2025 06:07:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2ecf63fsm5663921fa.74.2025.06.27.06.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 06:07:46 -0700 (PDT)
Date: Fri, 27 Jun 2025 16:07:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add PMXR2230 PMIC
Message-ID: <x6jo5xpvqlehij3rybcq26xehmeuzju2mgarnp3panag5hy3ao@fmtu7tgc3p4n>
References: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
 <20250625-sm7635-pmxr2230-v1-3-25aa94305f31@fairphone.com>
 <bced42f0-bc9a-47e6-bbdf-c49657d2e18b@oss.qualcomm.com>
 <DAXBXDDJAXDE.2V71E3E8F3GIH@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DAXBXDDJAXDE.2V71E3E8F3GIH@fairphone.com>
X-Proofpoint-ORIG-GUID: F9h5kPo-TOT2DDpTzVQii1Ykfj8PCS84
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685e97a5 cx=c_pps
 a=x6q9Wowz3da5qcMoR2tSzg==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=h56Vx8HxoSJ7g-UfYxsA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=TsFzuV67ciA61D7d30EA:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: F9h5kPo-TOT2DDpTzVQii1Ykfj8PCS84
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwOCBTYWx0ZWRfX+/kqd1f3sMys
 2xYx2/jDNBpdRErMJ7T3irY85/DBvhS4jZWZOt+AGHhZxlhiv68LeZkwUREmPggaHo/8l8KUkET
 5fJkf699698jKr3OjEdWgwn4DXJWKxL6I5dHpx+oisEzCEE4ILvsXiM7+tPdj9607snOBzNeR+k
 FziWn1rc2BACZl5Hf5zUquwcKiHJf+btuHnwLxbxpQebYiX5Yz+lPLFQMellFxCitiLqUcbApO8
 BXqsKvsjWP3toTZJDme6LDxZo4U3RxdjQcrI2IVdjCLg/ZrjDezEV62siPwsfvv50CxU7GOZyHB
 9uoAbChHzXNJX/TaHxxBBskmX1gleS3xdB8JF/efdxOFXubHvP+WtxIPHHwHB5WuhpFL96EIrs6
 o6itcbzAZH2wwXARklPAlUijCc0Fn5wmUCbB+y3YD1q+dke95f0L+XXTT4byCYerLqxBf02q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270108

On Fri, Jun 27, 2025 at 02:54:20PM +0200, Luca Weiss wrote:
> On Wed Jun 25, 2025 at 3:20 PM CEST, Konrad Dybcio wrote:
> > On 6/25/25 11:18 AM, Luca Weiss wrote:
> >> Add a dts for the PMIC used e.g. with SM7635 devices.
> >> 
> >> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/pmxr2230.dtsi | 63 ++++++++++++++++++++++++++++++++++
> >>  1 file changed, 63 insertions(+)
> >> 
> >> diff --git a/arch/arm64/boot/dts/qcom/pmxr2230.dtsi b/arch/arm64/boot/dts/qcom/pmxr2230.dtsi
> >> new file mode 100644
> >> index 0000000000000000000000000000000000000000..a7650f3230c01422b76ef78e897e5e7ae2f20cc6
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/qcom/pmxr2230.dtsi
> >> @@ -0,0 +1,63 @@
> >> +// SPDX-License-Identifier: BSD-3-Clause
> >> +/*
> >> + * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
> >> + */
> >> +
> >> +#include <dt-bindings/interrupt-controller/irq.h>
> >> +#include <dt-bindings/spmi/spmi.h>
> >> +
> >> +/ {
> >> +	thermal-zones {
> >> +		pmxr2230_thermal: pmxr2230-thermal {
> >> +			polling-delay-passive = <100>;
> >> +
> >> +			thermal-sensors = <&pmxr2230_temp_alarm>;
> >> +
> >> +			trips {
> >> +				pmxr2230_trip0: trip0 {
> >> +					temperature = <95000>;
> >> +					hysteresis = <0>;
> >> +					type = "passive";
> >> +				};
> >> +
> >> +				pmxr2230_crit: pmxr2230-crit {
> >
> > This name is "meh", please change to tripN
> >
> >> +					temperature = <115000>;
> >
> > Unless there's some actual electrical/physical SKU differences,
> > downstream lists 145C as critical for a PMIC carrying the same
> > name
> 
> [    0.085990] spmi-temp-alarm c400000.spmi:pmic@1:temp-alarm@a00: No ADC is configured and critical temperature 145000 mC is above the maximum stage 2 threshold of 125000 mC! Configuring stage 2 shutdown at 125000 mC.
> 
> Same for the PMIV0104:
> 
> [    0.086556] spmi-temp-alarm c400000.spmi:pmic@7:temp-alarm@a00: No ADC is configured and critical temperature 145000 mC is above the maximum stage 2 threshold of 125000 mC! Configuring stage 2 shutdown at 125000 mC.
> 
> What shall I do?

I'd say, use 125°C or 124°C.

> 
> Regards
> Luca
> 
> 
> >
> > with that:
> >
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >
> > Konrad
> 

-- 
With best wishes
Dmitry

