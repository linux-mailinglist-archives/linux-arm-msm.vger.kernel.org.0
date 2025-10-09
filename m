Return-Path: <linux-arm-msm+bounces-76695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDD3BC9980
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 16:45:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3B293A6442
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 14:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CC6A2EA736;
	Thu,  9 Oct 2025 14:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dFl+dQt7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C8A2E7178
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 14:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760021027; cv=none; b=K7dQaIcChQsizkAkIiETyH43c80U/BrgVkNM7KrEPFfGzrtoTk3k6mo17UuIaxJ61q0IE0EF5FkueWtRmj4z84cIMGvueE7OiQhEOSWp5Z2ibiVt8X4A3M0rVA7P7UjElHe40PYxVDSjrfUbKv0J1gGxzhqyRtIdf2gXDro1OV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760021027; c=relaxed/simple;
	bh=YPRTmJAiC9PVnBhnzgVMwPCuYI3/xLbW6iu/nD0qQM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L/B/zjs937GE0zsvNk+sDxLir+k7DXZtwD2zm5LE9YW9OFPprgI/R3JjqRTHVGKxNQz4d4D/Gb3Hmwd4FRbnVb24wDsixn7lXv7Y3RVa5tMsX2OkF3YBZVHy89WvCJMxpXZSMowQLHV/cTP8IBAQD04u1Rvu90d2LwppgEX5bCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dFl+dQt7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599Edkmq023406
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 14:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RAZH4VC4YYHQ6vhW18teDI4p
	FX/oOp/YSqgiS6ax0y4=; b=dFl+dQt7KQmjjst4Rj1u/l1+XUsbjL6mzSC7XGCy
	qH5Lt7HCf3kKnGoq/cpjA9m/7/ZxMFClL4iQ19w01YNYVjdc5Om1p9nWRa8wq3O1
	vZEmPOyKVze4NDs0L+Ej1KcsUdzW5Nj8T5yvdKXhE1fgCc2tbgtu6HA3PyUyyLfw
	nxHBUmGQmqwIy8wtKmzhXQDE/ot8IOLHZ+VR4n23Wot5ofcjBUwRg1yolNS+Kbsn
	Ntk+eUrTIlvTHNNpV8bD1fqpeSwkDKwnOWq0YTxVt1eLqbF2UZQ1XlRQiYfMbnml
	iBBYkSqgtW97vjU23EHKW9wEqNjccxy7w44pwbRVLi4SsQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4m3886-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 14:43:45 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-78e30eaca8eso50332726d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 07:43:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760021024; x=1760625824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAZH4VC4YYHQ6vhW18teDI4pFX/oOp/YSqgiS6ax0y4=;
        b=YsNH4VnDDShypNakhQAr3+yD11uLVEnJVMg7y8JR+PQ0CE1UzoczphsKrS7DZirCTt
         CaHgvhStcHHMDeGVvz+hV7aJOA0OKdJY8JA0pUH2he+XgJBcCYVVuJYXqU/y1rA/M7Hh
         /+obhprloyRU1JUCOYe0eGPZMPfiUnHZQvkQ/1/0Jb64Cwlev4S/Kro60CqP6stc2zBK
         770+Rlrod2F7WmSEy0ee7lW1+cTBxzmuQkuUIlboYCseXXKzsqKT4KKXZ6wGqTZMijng
         kasbhHZAToOAPub2ez2+2Oimoz4oVeZWtb/7MsRbVTqpL4UL/D2ABuAdfNHibxjHS2nD
         yCJA==
X-Forwarded-Encrypted: i=1; AJvYcCXtXt/kd1IMz/cVYGkYlpFKoZ+lZOX6bdY2W4r6E4iQCE2PyCKaWz5lZz4dHu78qUOT+MA0ahZpoFZ8HQYL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6jIAIjBW54KRO2GBcIjfqvROAFE7svnPbgXR3hKHG4lDjAQ4G
	oGelRhxbFAtAvBe8IMYwX2FPFKGlVJM+EZHLu2EQ3w5XC6eC5UCO1b8SF72hotxHR57B3I9EG0Z
	URwrTqvrnysb29JUOE1GuSW/XHFWbpMsDIixiloeqWLHxSFooWD/eJEyiY7BpSOjgQ2Fi
X-Gm-Gg: ASbGncsEpKUZ7AbglVFrV4+FxF+mw+y+nNktY9du596vd4WNNCTPuXzNGQn1lbhEtXZ
	qA+J1syT7UN6yy53GCCJ1MEOnPg1DyvCdhWAp0zH0SzuAXGWpCQzw0QUR0q/0PEhg12yPdEDtTO
	JRIYjEUAIZOXQhOdnAYOab1vUV5+B28IhCLjU+A6xWtaZF+5YAucyGCmCJBS/iiOZ8f28OAoUFf
	aXF/zClURICeKmTvAjoLwplDetlUuzWkFrmmBLZi8lWElpzHKsSWxZG+M24h1v1f/5llX87h5B1
	xKYIy7jjT4Xn44FC7xBa82qQnYLDVPDs699uAGzLmOy03rloXjGKDknHTzReBjyktVXdA4YlMP1
	Sgv65qY1CRiWU+plPEhgFNyNmkn9mMRiJfRw9qOCFIKNfRbSwzZbZgUskew==
X-Received: by 2002:ac8:7f89:0:b0:4b5:fa2e:380f with SMTP id d75a77b69052e-4e6eacf39bamr101335561cf.27.1760021023806;
        Thu, 09 Oct 2025 07:43:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4VQzRJazCe5lQEKqHSB+Ox+znELuwpSDAoZB258VOx5j06Ir/+zHOtX7IKN48V2PCiISpAQ==
X-Received: by 2002:ac8:7f89:0:b0:4b5:fa2e:380f with SMTP id d75a77b69052e-4e6eacf39bamr101333161cf.27.1760021019850;
        Thu, 09 Oct 2025 07:43:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907ac00be6sm1099313e87.23.2025.10.09.07.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 07:43:39 -0700 (PDT)
Date: Thu, 9 Oct 2025 17:43:37 +0300
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
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: qcm6490-shift-otter: Enable
 venus node
Message-ID: <si5h3szt3msd7mcbrfdotbs7wxi4bh5cfgp3icoxuqprsz5tqr@tk42ox6okse4>
References: <20251009-otter-further-bringup-v2-0-5bb2f4a02cea@fairphone.com>
 <20251009-otter-further-bringup-v2-6-5bb2f4a02cea@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009-otter-further-bringup-v2-6-5bb2f4a02cea@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXyNNM2G0Xdyvu
 DpljFCZWgqmQOVNm1GPFwO9X/J+uKdRYR4tB9CntdWWfvJEYYMOpVvW+TW1NXa2Nf1e8/5BL2to
 NjSPWQV61m6dznsxFyofr0AhBZRpCVsvu5JIU3eU+h/ikImepdj3bT1rnKcML7IQuifjpm7a/he
 clbFK1HmIbTAv9SaXFaw7dquY0bYNQCsr2Ag5dUxJjmlwoh/N+zuDd2qXRiY37uwgBQMLOU20/y
 hcawJfXHn4Mm82N9biZtzWTmoD0stNiVqjIc8cI3LxXOYj8rsXC6LBPHs0oXXd4UhLVo5TIY/1i
 7r/5AtRnkZOhXtAcOOOghk34pK0ho8hLPEX63P1hEjHiVqO3R7XWPLPs8rv9aknECuhCllRgg+7
 PjysFkhGe5Iwe+BPw4YtUw7f40L1RQ==
X-Authority-Analysis: v=2.4 cv=B6G0EetM c=1 sm=1 tr=0 ts=68e7ca21 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=7Ovdx5uLAAAA:8 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8
 a=5-T4x24SdKi4UNUJpXUA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=TQZWkJv5rNK5-PaLMsrg:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: FEoeV6deR7ICE2_UhzgLmSlb_Ez4qLtD
X-Proofpoint-ORIG-GUID: FEoeV6deR7ICE2_UhzgLmSlb_Ez4qLtD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Oct 09, 2025 at 11:06:36AM +0200, Luca Weiss wrote:
> From: Alexander Martinz <amartinz@shiftphones.com>
> 
> Enable the venus node so that the video encoder/decoder will start
> working.
> 
> Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
> index af6f7b41201d..a3e6b6a96530 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
> @@ -981,6 +981,12 @@ &usb_dp_qmpphy_out {
>  	remote-endpoint = <&pmic_glink_ss_in>;
>  };
>  
> +&venus {
> +	firmware-name = "qcom/qcm6490/SHIFT/otter/venus.mbn";

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> +
> +	status = "okay";
> +};
> +
>  &wifi {
>  	qcom,calibration-variant = "SHIFTphone_8";
>  
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

