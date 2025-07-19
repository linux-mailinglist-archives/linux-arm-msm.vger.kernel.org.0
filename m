Return-Path: <linux-arm-msm+bounces-65724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 539D5B0AED3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 10:38:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E2E0169910
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 08:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCDFD2367C5;
	Sat, 19 Jul 2025 08:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iYluWSHX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1E822FE08
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 08:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752914332; cv=none; b=tAxDktaLu/LjldWCF385y6d2A+LPOJgsBNWJ5zmenLQsReRnu0XTdiYPEYCon59hpibbihmjkwhzDbg34jIgNa8tpfwinTj47bNBKpmrHiO0Ff07I0p5do/wS9y1Ypa4OFCyVAKWajGkGyc0rrVSItU5BbuTAKn6mr1ikeVs77E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752914332; c=relaxed/simple;
	bh=Ur4VPWnq3uw4FdWmt/9pK+hBwvb6OqyunFEN7NVZwmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jGxsDxGsEXWZNMsOvWEkIPfA117yVCMfG3dsQp8KjyYqEa7FPmYY+uabY8tY7m2HeJiGrO5u+yPTMd+3w3iq9YoiuYFIJLbOTPpm7JhrblQ9610x9qt2KiyLd+SIvZnDHRWH28XeKmuYwuR4gVLEiAPugGJ3QHK8UE/tIZuEfDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iYluWSHX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56J4EwBX016243
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 08:38:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=glsksHZF4qm47GLf5Dr0eBBk
	p9qudOP0OhFzI5tDeNg=; b=iYluWSHXdy60NCiKDZwACKpvFtNJB7W1ALMHW34Q
	KWZL1uZi2Xvln8LjANXoqFM14m4qzLWEtgZqHWl4mOiPL9B8PVnVEvV8J+QMHJoP
	sadZ44Zo8vACLx3zQt52G9RB3H+1VIa3/1n55zFrEoo4kWQuMGoeCNm72HD/RUKg
	Faod/Mi9FJcnp1VS3D2wTDtmmScXmZWwwbOwC8Ryk+3Z1tnJHcBE0BU3sCCpl9WS
	kCJMjeCa3CWM+H6bInMXhNGdCNualDhnbp/suXLC9OgdHTGFCDUXV0ysQP/KPIAj
	E3IQWdDFZU8E2hsOEDUyAVJaXAqte5NIgwn2248M8yIrow==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045h8byk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 08:38:49 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fb2910dd04so46646806d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 01:38:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752914329; x=1753519129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glsksHZF4qm47GLf5Dr0eBBkp9qudOP0OhFzI5tDeNg=;
        b=jZGtzmyS8zDf0jJqdy+6louITlqP9E7qg6aHIOViwknE/HOdI8Y5WqzQpRwTr47l5d
         YUPyTYJaOdP/h6BjjcvtoDfvgICqyNuuXr1HC0wjWnzgpvwipQWLDHp134E5rue66cqU
         qDFVwGdv3uHh0QhvL4GJgfncM4RVuM/c2gGuQ9FXJOVUfbtbCdK0O9/C1X1nt+mIg99a
         o+aP3OlMVuMFPCPuWFnry8PDCKEVd8dcE6kmxBGh5pll5pziLAdvs/+buzMuV9XS1Agj
         5ApIqXLnsXsBsaLbWHZjvxAjvBPvPmwNEzAGk2dnSuLCnZ3paduhrGNiL1NfG1ARX0BN
         XwCg==
X-Forwarded-Encrypted: i=1; AJvYcCWoGoKVbSf9rulHjHG5hDaHksnm811ND8q66vTvpqbWDdgQuT15JC7eOM0zlCN4dC4nEVzIoQXUJ6s7Hlw7@vger.kernel.org
X-Gm-Message-State: AOJu0YzokL8YzTKsB1VY6ULIrY0zXPhdCePxHFbv34WKKnSn5l0mrUCE
	vAZxRim4PFWrELgSz24+B8QLEGXs0yUAF2DvfxhCPkoOFBLDdA7BLc7RDdKoq90u6NFrm1iT220
	8U0vfA/kQPMcL2j1cKkzukf2YI5IgiSCt5bTjjG//+wE2VP0a0PRY9o/5jSMNMg/V6R0Z
X-Gm-Gg: ASbGncsWXi1NOHDId6d0fI0NqwIWEBzd0X+JsLbb0w35AM/as9/6mXDgeW+1XM211JA
	FCchHk/odDAnU7nffAWHsu39+UQwoUPtVDAdYVGwLIhNorwTOS+Umcun0qqxd8ZnbC2l6TLEN3k
	Pb0L7rGdV7PBkb0Z7Mk/XfmZoKzIin519EyvFoM6xTeVWOQbVuJZVAQW8OpELoBpVox4BHNIgu9
	O0jbQaBeex3qo5VXqd0AZbtLJySozi7PgFi/TL75pF253vdX6YgwAPNWXEkcEUvTBRUxt73Yf+9
	TqBL9BpWUJgxomU4acnq715ai8LgT7zs4UioLA8uuPs3Yx3waZD9qmphIxNp+6wUae+T8X00Zri
	1xwD0WhlE+fwbq+PnQkkbrdV/xdHTZu+h/k/3H8EBuAE8osKru+2V
X-Received: by 2002:a05:6214:5090:b0:704:8f24:f03d with SMTP id 6a1803df08f44-704f4825428mr238950186d6.16.1752914329062;
        Sat, 19 Jul 2025 01:38:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQsvNQe0y0XkePnP7jlgYK0y9weg7ronQqAfB9AOD0zuVM4AIPd7Z2x/hqwuEfSMzAV+Y4bQ==
X-Received: by 2002:a05:6214:5090:b0:704:8f24:f03d with SMTP id 6a1803df08f44-704f4825428mr238949776d6.16.1752914328437;
        Sat, 19 Jul 2025 01:38:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a911b775sm5216151fa.45.2025.07.19.01.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 01:38:47 -0700 (PDT)
Date: Sat, 19 Jul 2025 11:38:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        kernel@oss.qualcomm.com,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 7/9] arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
Message-ID: <iuojvg73siqfxq4ejv4g7o562k7i766bbpg36sxsljq7z7tqrs@ueqfdknfp5zw>
References: <20250715180050.3920019-1-quic_pkumpatl@quicinc.com>
 <20250715180050.3920019-8-quic_pkumpatl@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715180050.3920019-8-quic_pkumpatl@quicinc.com>
X-Authority-Analysis: v=2.4 cv=ZtDtK87G c=1 sm=1 tr=0 ts=687b5999 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=rRvH8sadIMNe52h8dg0A:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA4NCBTYWx0ZWRfXxpWf0JItt37A
 t4l34f2IC9tBRd64P2u6rwrlp9PjWyOjVEWUW65Eo33Zr8DvSHobm5eX0y9SBVxbdCVchfd1VvK
 Cvhg06REhmP1FoxaIcl4k3ugbDa0UgIc0Oyx0jkl/jKVUBVCOnQ7aA3IoYE7EqJAR9+y89FCONN
 roGlbztqKt6BetiQSRlskkUIHW5TNUnYSAaVmgThayDnbGAu6BKJrggHIOcQ9ZowAFYBEqBAHVd
 jKRwj5krrLIxB1MvPWSqfx/ETrwaO3w14eS2p4sFTv0VhtvXF0mgve9V9r8mDbvjVyXOxV702Ky
 oZ0YEbIWh0TKAt083d9VRO7MeRwemDvOHGPhq/1lP12wqp5ZLoxl7o4kzWXH19/0pNv0Fy3mjIU
 2pLWC1IYHngbfNpgr/bM4mU6H1OmFwNoeSlXwXd/wBsVA2HV5aHaxADdGPZuZaENux6oWcoN
X-Proofpoint-GUID: ZSoOeDklTAiTBy_JCrdw82yix54r4ydm
X-Proofpoint-ORIG-GUID: ZSoOeDklTAiTBy_JCrdw82yix54r4ydm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 suspectscore=0 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507190084

On Tue, Jul 15, 2025 at 11:30:48PM +0530, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Add the sound card node with tested playback over WSA8835 speakers
> and digital on-board mics.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 45 ++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 82aa69d715d9..4ec3501eecdc 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -1048,6 +1048,51 @@ &sdhc_2 {
>  	status = "okay";
>  };
>  
> +&sound {
> +	compatible = "qcom,qcs6490-rb3gen2-sndcard";
> +	model = "qcs6490-rb3gen2-snd-card";

This model name doesn't seem to match established practice. Please use
'QCS6490-RB3Gen2'.

> +

-- 
With best wishes
Dmitry

