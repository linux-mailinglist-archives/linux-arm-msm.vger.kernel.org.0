Return-Path: <linux-arm-msm+bounces-59970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA90AC9E10
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Jun 2025 09:45:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1801B17661A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Jun 2025 07:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFC501885B8;
	Sun,  1 Jun 2025 07:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dUDcgD1C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0931A288
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Jun 2025 07:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748763943; cv=none; b=A/k9OK4WEprxrXdRYdAq4pSmsUoxwiEp/JYgdR2VXVp1B1LWb2fZZUPN9GDofcVWfjp5m82/btNB3lyUIq9cSfJfbTBue3LvkMUqQrf2e6Ddt5EUoEokXWhIDusj1W/DFR5mBP6Vz6MnYnW1PvzKy1tMbbyibIDtmsDboWU2ZPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748763943; c=relaxed/simple;
	bh=7g+oDk4Wks/KTMArt+CpUCkKqkXLJZVJzi2niXajCW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=psZgj4Yccm9b/wN1Z5plI5s0vQM65EwWJ4CYK4nJVy0gcloP7s/WO2u+JK/DIbxxFQeaE7w+bj2JtVWiBtFcA2ixsFYXpFMwQwmUFzOqWy9gFi8zOhnYiYNtMT2NbpyS8ItzqpSM2sQgce3XoNUmaVqFiCgMFt0np8MHuG1+CS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dUDcgD1C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5515V3wU000948
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Jun 2025 07:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=T86iakunY/F/6fKCE2e1z1vF
	9U7fPaimiMQLKmQqo7Q=; b=dUDcgD1CoU5G2ZfoXEjRO/wI0auU1aPV0uWQ8a5r
	T+YVt30EiN+iuSPH+RH1DmzpKc+UalA2m0xmnIPB9AfGnAdwFF1BZ0R7X1WOVWn/
	5AFXXRIbPgJvP2BBmFjtQQdSMqVfYA3QWsR3/oQ6Y0/JRRHHRRhjc8u8z5dqIspM
	ugRgT9oAohj/zu7iygepJShe5fwBcLDUb6X31yWoXycqEGGp2fOtAhL9h96dlAm+
	IdlFyj4au8c+jJhoFnqdkU1yO4JpYYJokSGvumuS9UeRF8f8K4lwu1eGM3eduVXY
	araxnBREjFhAAAW3C/qnG5qcn39Dgv6x2IKX7v+c/zIYcA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytkw21kx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Jun 2025 07:45:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c95e424b62so694547585a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Jun 2025 00:45:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748763940; x=1749368740;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T86iakunY/F/6fKCE2e1z1vF9U7fPaimiMQLKmQqo7Q=;
        b=b/kIwxD6QySF8oDIYjjtx9t2jjLXJM8X753VN/73OjX5syOwhkbk4zvGGGFkOV+jsy
         CoB/FD8kH5siWbH49oVzQX1hXn6Y1bEb/BMFk0h4cAMxWKyZ/446DsTHp91C5o+hD1v+
         BGSyk9C23EdZMEHp7APfxV07Np7w39JyOZQewSH1KgiVHY/dEhoQ5ZgOnNW3zmckvoaU
         G+5GSSyFYuxSFuOUK08b+P8d3rZT3aUEid89GTPkJbmjP6ZI1Am8yLkNC+U9I3rROhzn
         /7qyrJVPCd2HVtfH3tGm8iDz5ItAHoGPbc4PK9aobcZGZtCtYeKL+o29gODm+wkIY3CV
         z8Mg==
X-Forwarded-Encrypted: i=1; AJvYcCWJDN98uWdrAANqvh9ECA+f31CEjT726IORZFqwYZqtY11ltgT+9R0WpWletxlqVAKuRXrHbAENLNI8V0An@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh6wNUk2KHsfsRicmYcJIF3f2JffxXm72FzaYNkJHln7IlNXTV
	1z3lkXqTRrZDzCcWZ0M/lHX8vpAyjg555F1BCaR70imZ4wsAe++sBrIhnMcQjw348eNKXtb6RaF
	F0jDeVz5ocxaKACC/UGBLbAjh2jfCyaEXICBT1P/hm+8y0BsF19LNxlUgfSwgMdE+Slu0
X-Gm-Gg: ASbGncsd15YcekDNo97KkAjnBThGw+4zyK40oAT+vOG2SGvRH4KWJWC6nyUKlmJysX+
	LDSPpcW87ZLR1tmlGRZpXGEIRKlstgyCxRy1LWiO6muGHWKo04Sx4JxnRwWV+/EVyPZBtmQG3WA
	xuQeE3SVcIwK52SWarELYRE1UmKSxzodBsNMhyjzUemv9JGlF8Onyk7G5KunKQ3If83t3mtno0n
	47Xh5XqqdjrSY8Ab1RybRmGMpgHz7AS2BFBKg/XXJacakH/cXTwUrfbIcebQVnvlPhQJpHeTPvg
	MYGbwpzFwi6Fdi/+qbFY6WoMMQ3wUElC9MBhRykPCamhXbRgd22WtkcoqdKW5AuOmbVuJWiYy4I
	=
X-Received: by 2002:a05:620a:2402:b0:7cf:431:29c3 with SMTP id af79cd13be357-7d0987e83f7mr1847367485a.26.1748763940615;
        Sun, 01 Jun 2025 00:45:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOfErjfbHAj1jIbvFArhyUzXQUHwq2N3C6oiKrjh0slYknIaa361KZI/FocX4MDDscvYYd6A==
X-Received: by 2002:a05:620a:2402:b0:7cf:431:29c3 with SMTP id af79cd13be357-7d0987e83f7mr1847365085a.26.1748763940253;
        Sun, 01 Jun 2025 00:45:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55337937969sm1210468e87.250.2025.06.01.00.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 00:45:39 -0700 (PDT)
Date: Sun, 1 Jun 2025 10:45:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/5] arm64: dts: qcom: msm8998: Add Venus OPP table
Message-ID: <jtog7ly6v7ahxdc6rybgnn7mhxv66c4swx7j4oqg2tsndeqvmu@oi22kb7quw5l>
References: <20250531-topic-venus_opp_arm64-v1-0-54c6c417839f@oss.qualcomm.com>
 <20250531-topic-venus_opp_arm64-v1-3-54c6c417839f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531-topic-venus_opp_arm64-v1-3-54c6c417839f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: yUW1rGzCdPMX7jAUudKDsrgcUv_FuGZG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAxMDA2MiBTYWx0ZWRfXzdsOS68WZFql
 /Sgw21PcvI14MJVhwGavPI9Ts8WpDsPenC/HGLQVPrHla54fWLR3PkNlGS6dRXLylzH0K/batPN
 piyMn5VBy/t9Tp72o/6lbFgC+h3bxQMOan422qvvtzwie/WKMrz2wnwb5XqKdNLaShE7P+Aos80
 QakPDeURpeWLuU9OO22k13G78xeHFMi7FwX9mBQE5DTCJuZtdox1CDYZYu/EuE0+ffzF0KIn33B
 teLQ9lnFDXjuvMnbNUkl6qRXWIi5OJnT4jFLwpWOSPX1vtx65Z61/yhgAQb9HXfpvgafAcbRytE
 02Jjl+UckuvB4Ly2RKpgYMrOpOYK60Zzx0rxyDdJPJYIAbcWtqN0hbS9g1PXiex+Ab2a15Zl15U
 kgl/JkNE+8ed/ZV7KftsOIDqI2WZGt/YgaCwCbHkbbO0oSGMBrzfZrqZL7X9i9JMzAP2pvhf
X-Authority-Analysis: v=2.4 cv=WI1/XmsR c=1 sm=1 tr=0 ts=683c0525 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=bnwqEipTlhqVJVXZ2T8A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: yUW1rGzCdPMX7jAUudKDsrgcUv_FuGZG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-01_03,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 mlxlogscore=807 bulkscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2506010062

On Sat, May 31, 2025 at 02:27:21PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Describe the DVFS levels explicitly.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

