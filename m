Return-Path: <linux-arm-msm+bounces-71230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7170B3B591
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 10:10:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91AFF563787
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 08:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0DC129AB1A;
	Fri, 29 Aug 2025 08:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bcMPcHi0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2798B286402
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 08:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756455001; cv=none; b=UArLROdYXR3ihPuvfck/VJ4masHY2DEz+J3BTmw/XdKinkuxpwIKNdl9gOlrOCV3Ij8gzFKLiZ3FA0P+dJtmaTXB/q71oy7Ng1bNEG/mYFPe7PKaHmRhqLw4WWblxFpjeyai+9qY2PGfrpJqJE62rUzJvA8sQzTMc8xKEWS/h1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756455001; c=relaxed/simple;
	bh=z1h03GLNdXLleb5z+38xr8uADY1LeMbzAyZCQ9BdpzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y/V/cJ74IYhOaTa5Qnmt3Kx92GJ1czEqQI4p7Ax8vb4jN9QPwBtwuarbbHzlBtNwoHreYYcmmqZ5SzyJLAlghaBxVPpyo852x/tDIplIo5DZ9t4S3WTS9DdsPJYp6bAl7tQ9PEb+X/N/y/J8EEIoyTENC2F05bDBNBqorBd0Zr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bcMPcHi0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T85VOk029817
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 08:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bsv6NnJRTxJOMkJMe1wyAAiF
	Gmai0uCSvzMJL+nXi6A=; b=bcMPcHi0eahG31DYTlJndkJKxsFmOJaQJjCfgPiw
	oRy7USpQH2G0MGhGU5YZKKaaVJ3vfXA3fqqofwPhwmx1U9Df4O4vt00xR8DXLYEL
	yCWAy9+fqOVRJ9jMjExYyBuq8Ng3f6sg7GNb6O9xLFlX88EUJk5bzbzyh45Ex4cB
	xyZV0IeywDMFfdqGfrM+VeHp+YXvKBPzuiLNlUarVK8gU1M6BRHD8vjRhRhDdVes
	npFNYg+cu9tBlNRqsMZMDW6IQ36xlGk6nQYjPI3/7trdnNA1wK18V8kiuhlo+MPi
	xMOht9UkYecWW5Nx/gPIkP8Rc5MkAo5C8P5Sq6cGCzLmEA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5weaxt8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 08:09:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b109be525eso39740851cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 01:09:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756454997; x=1757059797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bsv6NnJRTxJOMkJMe1wyAAiFGmai0uCSvzMJL+nXi6A=;
        b=kNUYVYXBTALUFbJ7Lwa+0EDmE6SiNGGBIPT4M++w1Jw62p6HGG362SseIxqTZBYUiD
         jimfpnJ4JMgpvJBHqqpVNe+Yb3/4ZL5wTKMeATPEtIBo5gyURaB0QlPR8iFFazIVz1hv
         Rg7qWwpE44aHYd7BlTCTnoe+RAzihPOQEP2dgDgkvgIlM/tX/UCToCKkZLnreo/pTJCm
         boEC0H/6NXwem2BLIVfk/KX4+crnMCQw2o8+bWFbrTWjyBbEkg2KQzchuW3vNs3Rnmdt
         3NA0B866Z5NqW2pRtZBMILU4hGhm6FhcfyjOSFy5ylLsKlyykHPzASQepBEm7ilxVEoR
         lQKg==
X-Forwarded-Encrypted: i=1; AJvYcCUUoZo+r3z4icB6TucedtJJT7GtcDMPQbLDk+UyM3utzpb28HCeECztlKjNRSwIkF7JTmMfX1elllNzqTON@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbo3ZZHH3iW7Q+TOGyADo6h6SOdmovgE+B+xYD8BCXFb4c/ykY
	f0W9MRujWKUcQggXc4T9I+rfl/Kc5Q8whXju4ZiRAJh/xciUB5ERTE1M3ePujXgY7bb7siWxWV8
	eRReShdI+x9gdBg6PkNDkuLJFZi9lqL4Rn8kiBnx2nkAPZlsMxkTLaSnfhM4BHmHvg0LH
X-Gm-Gg: ASbGncsL5Cyp4sUVACL1r7Ke1/D8iGI83ulAtzFOmvTUn8l3MsXyqjqhchMDhHfZAQ9
	88ymbjVLNkJVSIxaqG4OJ2C8eZeGuHn41ZWmm2RwCtSZ/KykrrU2M55G6zC1o7C0uTXBNNRHZoO
	TK4tH9Jvnse83eG9LTKZVSlVrPSwouf1e/FaWuwAmw3gIpRrH/NYR59oFsmwfOxKSt4P7Csk85E
	o7wrac1iczpoCAU/NNWPwkV4FY4Wk9piIAFxdpfU6VGN2oBANifWtonXgJ2lkDytBQsqIDGv9/L
	Qa2b0C5aZ0xzyGdfd6H7mw95vRDZ9Hpt8v2RJJfNU8t3jXZuyWEPAs/ERw9rs4llbmBGdIJDn4r
	YjpccdJDX4wknOv1CzFKe9zrkCDZyU7fSmLhP+HGoplbC7bQPz5xw
X-Received: by 2002:a05:622a:249:b0:4b2:e151:a1e3 with SMTP id d75a77b69052e-4b2ea694690mr119134191cf.36.1756454997049;
        Fri, 29 Aug 2025 01:09:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQwcGrf8Uq6ErZTLA64qML9AZfcxsKmHVxxEtfjH1059x26sGs3RoBSkASHz9bNHu8//dSdQ==
X-Received: by 2002:a05:622a:249:b0:4b2:e151:a1e3 with SMTP id d75a77b69052e-4b2ea694690mr119133841cf.36.1756454996508;
        Fri, 29 Aug 2025 01:09:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f676dc52esm451242e87.8.2025.08.29.01.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 01:09:55 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:09:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, jic23@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        agross@kernel.org, andersson@kernel.org, lumag@kernel.org,
        konradybcio@kernel.org, daniel.lezcano@linaro.org, sboyd@kernel.org,
        amitk@kernel.org, thara.gopinath@gmail.com, lee@kernel.org,
        rafael@kernel.org, subbaraman.narayanamurthy@oss.qualcomm.com,
        david.collins@oss.qualcomm.com, anjelique.melendez@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com, rui.zhang@intel.com,
        lukasz.luba@arm.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        cros-qcom-dts-watchers@chromium.org, quic_kotarake@quicinc.com,
        neil.armstrong@linaro.org, stephan.gerhold@linaro.org
Subject: Re: [PATCH V7 0/5] Add support for QCOM SPMI PMIC5 Gen3 ADC
Message-ID: <zgm2k2osmasdal6anba66pw24a7fiypgwlf3c36kvteshz7uef@wee4had7x54u>
References: <20250826083657.4005727-1-jishnu.prakash@oss.qualcomm.com>
 <20250829-demonic-soft-guppy-512c13@kuoka>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829-demonic-soft-guppy-512c13@kuoka>
X-Proofpoint-GUID: JWOZAlxXhjUlnhRLMLn0mhuyyjYWB_M4
X-Proofpoint-ORIG-GUID: JWOZAlxXhjUlnhRLMLn0mhuyyjYWB_M4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXxSqrJPF4oUvR
 fFRy+rUPU1erDfHz/08XlA6mAF+IbY+zU6+YW6zvZZNQVaNMEknT+1w4J/tksFDS5tVrlFXdQ3O
 2PrGh1f8uYiIjbkJfT8t+Uzh8nqRwkJ4C9AYvTlRN8tXcdLBHtjVuBlbCkR4rkJo84EmnFdpLsn
 VlMSzO3lJl3/WzkQO/YejBdXLsYbwYQARRMAEcMRojF4o//7HEiFgguysuIzzfC7TwSo9WFjH8X
 yksFtoJDMMkz6eRM6u/HOPGK3qBmVetWFi3N0U8lc3Gm1UDXRFDcPKDPkNDl6otEvvOdqerIh9E
 hHX4xtjsjmm9kqSPv98ZNHT6MgpNPeRMFltL/N/RJMoY8Uz4J/mD+C9fK43YwDESRAVS8pKJ+re
 ggt5gDDb
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68b16056 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nrI73Fic2Yz_lu5inCMA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033

On Fri, Aug 29, 2025 at 09:12:59AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Aug 26, 2025 at 02:06:52PM +0530, Jishnu Prakash wrote:
> >  create mode 100644 drivers/iio/adc/qcom-spmi-adc5-gen3.c
> >  create mode 100644 drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c
> >  create mode 100644 include/dt-bindings/iio/adc/qcom,pm8550-adc5-gen3.h
> >  create mode 100644 include/dt-bindings/iio/adc/qcom,pm8550b-adc5-gen3.h
> >  create mode 100644 include/dt-bindings/iio/adc/qcom,pm8550vx-adc5-gen3.h
> >  create mode 100644 include/dt-bindings/iio/adc/qcom,pmk8550-adc5-gen3.h
> >  rename include/dt-bindings/iio/{ => adc}/qcom,spmi-adc7-pm7325.h (98%)
> >  rename include/dt-bindings/iio/{ => adc}/qcom,spmi-adc7-pm8350.h (98%)
> >  rename include/dt-bindings/iio/{ => adc}/qcom,spmi-adc7-pm8350b.h (99%)
> >  rename include/dt-bindings/iio/{ => adc}/qcom,spmi-adc7-pmk8350.h (97%)
> >  rename include/dt-bindings/iio/{ => adc}/qcom,spmi-adc7-pmr735a.h (95%)
> >  rename include/dt-bindings/iio/{ => adc}/qcom,spmi-adc7-pmr735b.h (95%)
> >  rename include/dt-bindings/iio/{ => adc}/qcom,spmi-adc7-smb139x.h (93%)
> >  rename include/dt-bindings/iio/{ => adc}/qcom,spmi-vadc.h (78%)
> >  create mode 100644 include/linux/iio/adc/qcom-adc5-gen3-common.h
> > 
> > 
> > base-commit: 0f4c93f7eb861acab537dbe94441817a270537bf
> 
> What's the base commit?
> 
> git show 0f4c93f7eb861acab537dbe94441817a270537bf
> fatal: bad object 0f4c93f7eb861acab537dbe94441817a270537bf

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20250822&id=0f4c93f7eb861acab537dbe94441817a270537bf

> 
> 
> b4 diff fails here, so you are not making this process easier for us.
> 
> b4 diff '20250826083657.4005727-1-jishnu.prakash@oss.qualcomm.com'
> Grabbing thread from lore.kernel.org/all/20250826083657.4005727-1-jishnu.prakash@oss.qualcomm.com/t.mbox.gz
> Checking for older revisions
> Grabbing search results from lore.kernel.org
>   Added from v6: 6 patches
> ---
> Analyzing 53 messages in the thread
> Preparing fake-am for v6: dt-bindings: iio/adc: Move QCOM ADC bindings to iio/adc folder
> ERROR: Could not fake-am version v6
> ---
> Could not create fake-am range for lower series v6
> 
> > 

-- 
With best wishes
Dmitry

