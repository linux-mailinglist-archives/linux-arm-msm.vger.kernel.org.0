Return-Path: <linux-arm-msm+bounces-76401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCACBC4E0B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 14:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CE3014E6CB0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 12:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89CE024E4B4;
	Wed,  8 Oct 2025 12:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hBd04cJg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F74724BD0C
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 12:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759927244; cv=none; b=pIU6klNLL+8v6XJk9HqWcEJpz9hd/dItBCEedh/lI3HT0VvKMsrOP42kYfOs58BMfBbZq9R687boygffwamCDEY+evw+YxJN4NBk3jstFkH4DeqxXFS4NMOlGLIgqYn9kTyZzRI4LidLAj81ZX5XQp59OMReRdQk1daXw48o5jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759927244; c=relaxed/simple;
	bh=lUTrOhjHPJyQD1MhnOgcyFKqj4kxP0ZYD9sQND0DSt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qteryIQDCBkh1Fai0PofIWkIiUM3wEAQ225XpXmWjj6pqYhcNtATh/H43gUwxIz70rWbge9Dswe4CIWsKGIgQBWZU1TOkTfD9VM66pMGQhoB+QtzeHHV+cMB8Wk22pmMT2+d53wB8mjNbgzZQJ+0A4OgAWwkMo2fooagXR88zT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hBd04cJg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890Sxs028975
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 12:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M4OPP5rGtbcoGt2hmvhc+u4aKUyzxDw05x/alaaMMrU=; b=hBd04cJgCs6FMEwT
	SLJv6hQIebpXckG7rSWR5WFqC0HAU3YzOqpBfUqFEbgMvU3Xc06MuQzjHrLsqdwt
	h8Ne8CmeNfpDQcCFgxPdgr9088KLmQcUJ6WknNvlJeMX/WPbctqMXCS4uJPYAI55
	2sta4654l/LibwERamb75M6AUI26ZJgtDStfAFLJF52818MNZxQIpzcnGlK0ye7T
	4UDigkvXMMEymCQfW8bOWuyTcJ0nExA3Vj3Q2l1d74UpiSK5uBihcP/VVfRrfmRD
	gq4Ky1onVbv6UtGwEYtK9uFvTQzRF24dfgGA+07skz++WYq/NeKviK0zVWpgy3Es
	QNDw5A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49js9e2per-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 12:40:42 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-879826c55c8so15384296d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 05:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759927241; x=1760532041;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M4OPP5rGtbcoGt2hmvhc+u4aKUyzxDw05x/alaaMMrU=;
        b=p72XVjuJ1eyKtJN7ECRxzxIhkJ1sS8It1XJD58tuBiXFLT7DbSxAa10NtzeduRChse
         QXYDvz2zLFNUKhRaz9GWyYNAXvXuwn6jD4hTAH45GPTqmGPHvfWa/zv5N21+4RtCmb7u
         QSKw4x62/I9Y2qAQa/Hdb4SmZUzKYZU9nJm2+DnCKa5LB1rFx8WGT8gOoVn46TykFR2c
         VUmV2HBeYvry7uMCI6T8nJtk9hd9ef94ZoZY9zxsf1zo1XrksG3yQt8HCSt3ABqCM1Sg
         163wQ0e1tLEGmL/0651+aApt2rdP390mEnl5M3S0XVhWdbj2iWfbFbqsJ8oeaao6xfJ6
         LvRA==
X-Gm-Message-State: AOJu0Yy7b6ntz2cAKQGFXF5tQh9PgkQoHFMPFIjx9s0LigLBadZvMP+l
	4pKhifRfzLzvPLPQySjWHc3EgvXm9Iw7PHNq3zIfIOzusZY21RQUcS3VUTsB9DZo97f48kV2Dv+
	FGR2j+YwJco2ndDwsZow9c0es5216AKSYGHFIH2LQUI6RfCtCWrPWntUoUtC8tAcQb4bK
X-Gm-Gg: ASbGncutVUX4/8cVWwp0bobCA88hXo/g2MYma2EFSTMWOJ4P7f/RldRumK+jkh8u3XZ
	D0/tTwRM2N+F4HHUBj95eCHjbrZf524kXjFSEqm4FmcbDbY55FSJv4N6WNewjL+VAwOt7/dV0LU
	nsl4jkQZJetC5MgH0qpOvKRcDEomnHXzKhJAZNCCg+hKzvK4FQsNe2Y+HbHW/tlUAXdYhBiQJPQ
	mQp+HDttFcnYCVQKznJRlOVWXCPFKn/VG+CnmKRIzAIHV90+/Cq6i3cTs+cA7nW7ZrDepQ34ACu
	kIpxNMxDDhYyc1ra1490rEY/EjNN6ZfXdPF+RH3Qo4K7Ds1CSwrexYYl7JMXN78jREh81pkxitw
	v9ElpY73gjaTkirUSg/gc0H83BwE=
X-Received: by 2002:ad4:596a:0:b0:784:4f84:22f9 with SMTP id 6a1803df08f44-87b2ef94002mr25131296d6.7.1759927240915;
        Wed, 08 Oct 2025 05:40:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3QYIdes0zzXDXLbtN1GZArLUcJtOk9G7EMYv269Ezp7bFtd3e0tnh7OnfT4Sdj7S94CaghQ==
X-Received: by 2002:ad4:596a:0:b0:784:4f84:22f9 with SMTP id 6a1803df08f44-87b2ef94002mr25130856d6.7.1759927240350;
        Wed, 08 Oct 2025 05:40:40 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6378810112bsm14570055a12.26.2025.10.08.05.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 05:40:39 -0700 (PDT)
Message-ID: <e3400ab5-c4ea-455a-b8ea-d4fba2ece85d@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 14:40:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: lemans: add mdss1 displayPort
 device nodes
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
        swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
        sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
        alex.vinarskis@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicnic.com, quic_amitsi@quicnic.com
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-3-quic_mkuntuma@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250926085956.2346179-3-quic_mkuntuma@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Hrl72kTS c=1 sm=1 tr=0 ts=68e65bca cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=5YqVK4ek60l4VI_saP8A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: c4YIaNobw7VIT7L-_tWNEKFwNyzcxM9I
X-Proofpoint-ORIG-GUID: c4YIaNobw7VIT7L-_tWNEKFwNyzcxM9I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwNCBTYWx0ZWRfX/PzV1Q+zW/Fl
 L0HRO//3JRhzP4JLn/kT1lexN9040jmBjAFthLnHufEQiK6sUVOab47vbVvqrfF0eDCrLkdCd/1
 TGuQu8Q8+Mang4Lxw5ggu9xQVnQV/XEsNofgbUpsjxbYJO+BvQuY94saGAeJRz1AQuzb/cfGHKP
 Yxc9KKohjADCaWw94/60ifBEh1kIaDZSkHLYImsZtMXvHTFyXdONNByl0lOWvx2+rf6f+BEEadZ
 xLc8O7lXc/afdQAoqO+iC1meDoPssuKIBL2wxlUq+4H3Q9l3aceujJ9nwtya7Q9+Quzp2W9qUzz
 haBK/3XE2DtSnY8xwojFu8xjCn4VMKk4DzfQf8NKgW4QTJAgd+5Ji1vz+tuslM3AXtAtk1nOY46
 QWpFIzqQG2ykvtodrK2l852X0fNWPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040004

On 9/26/25 10:59 AM, Mani Chandana Ballary Kuntumalla wrote:
> Add device tree nodes for the mdss1 DPTX0 and DPTX1 controllers
> with their corresponding PHYs.
> 
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---

[...]

> +			mdss1_dp0: displayport-controller@22154000 {
> +				compatible = "qcom,sa8775p-dp";
> +
> +				reg = <0x0 0x22154000 0x0 0x104>,

sz = 0x200

> +				      <0x0 0x22154200 0x0 0x0c0>,

sz = 0x200

> +				      <0x0 0x22155000 0x0 0x770>,

sz = 0xc00> +				      <0x0 0x22156000 0x0 0x09c>,
> +				      <0x0 0x22157000 0x0 0x09c>,
> +				      <0x0 0x22158000 0x0 0x09c>,
> +				      <0x0 0x22159000 0x0 0x09c>,

sz = 0x400 for all 0x9c

> +				      <0x0 0x2215a000 0x0 0x23c>,
> +				      <0x0 0x2215b000 0x0 0x23c>;

0x23c -> 0x600

[...]


> +			mdss1_dp1: displayport-controller@2215c000 {
> +				compatible = "qcom,sa8775p-dp";
> +
> +				reg = <0x0 0x2215c000 0x0 0x104>,
> +				      <0x0 0x2215c200 0x0 0x0c0>,
> +				      <0x0 0x2215d000 0x0 0x770>,
> +				      <0x0 0x2215e000 0x0 0x09c>,
> +				      <0x0 0x2215f000 0x0 0x09c>,
> +				      <0x0 0x22160000 0x0 0x09c>,
> +				      <0x0 0x22161000 0x0 0x09c>,
> +				      <0x0 0x22162000 0x0 0x23c>,
> +				      <0x0 0x22163000 0x0 0x23c>;

0x2216_2000 and _3000 don't exist, there's no MST2/3

sizes should be changed similarly 

[...]

>  		dispcc1: clock-controller@22100000 {
> @@ -6872,6 +7115,8 @@ dispcc1: clock-controller@22100000 {
>  				 <&rpmhcc RPMH_CXO_CLK>,
>  				 <&rpmhcc RPMH_CXO_CLK_A>,
>  				 <&sleep_clk>,
> +				 <&mdss1_dp0_phy 0>, <&mdss1_dp0_phy 1>,
> +				 <&mdss1_dp1_phy 0>, <&mdss1_dp1_phy 1>,
>  				 <0>, <0>, <0>, <0>,

You need to remove the same amount of zeroes that you added

Konrad

>  				 <0>, <0>, <0>, <0>;
>  			power-domains = <&rpmhpd SA8775P_MMCX>;

