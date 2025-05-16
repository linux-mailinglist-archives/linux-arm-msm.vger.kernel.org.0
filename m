Return-Path: <linux-arm-msm+bounces-58248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 226B3ABA5CA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 00:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 075163BADA7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 22:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85B5122E3FF;
	Fri, 16 May 2025 22:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jnJN7jpz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E92B22FF4E
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 22:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747433504; cv=none; b=OjgU6kY43PhvmjFlQTp3XKJSViSHqTps/Q9DgQehLWmmTfv4PlqeLMLqtrUJvyr+0J17WigCGRUyom4WBH89pm699smVQ6yOrGKRRAUm7mbwMi4of4OYUrb2PE2pEX0oAZ888bIe9YlNhjXxInitF4qVuHNa+aeFhy03OjIuRPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747433504; c=relaxed/simple;
	bh=sx/nZ8ANqCHg1XZRS+aNuOi9Z1CoaOzMIuQZpulm7w8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GCcSwFAihguNPlAkj8vmHrs+ANKKwggTHaUKILaKvPovnuSPHOsm1pgeInX37CHqqjbXOEftrvZGGICvVyLRSkPKnXOq6E+un3Tcq4twjl/3KYfIu+Ig85fNDwDov+jQIkoMrArND23g1OX650q+WkzCX+3K4TczTT0JQFSgHVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jnJN7jpz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GBajdp024320
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 22:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Nm/4NfT8gFS0Xa8OiBIX3tBr
	yuDvlEcD31Ih0TOw8JA=; b=jnJN7jpzu2HKvMfZ2SyV7OSu0TK5p9GKW7wh3xYm
	y0jH4ZNjc19cSoKZCXiogTyJ/IckYnbGwAhZumYnGNcfAkF6xaPI8XKUce3Mfp1C
	PUozfldrHfQVo72HZemGPjssD3owpczCUjy6jJooY0u4mm1stjDvYzZSEAFzfuHq
	AyHQl8uROQ77/t3aYEorFnGMOZddldV6ioeQUTOQizqI6GiOfJ1uCib4paxYGNrV
	K1qSzvr0gOVSaFAPrAaeOivbP690kPGUdk0JKol878+vXGRCOEf9gG7F5/egVOrV
	RklBJeYD5wvZ8tZZSzPYpwoMfoKNoSvhiYLkHwG+WaHQGA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcn3f6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 22:11:42 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f2b0a75decso61814326d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 15:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747433485; x=1748038285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nm/4NfT8gFS0Xa8OiBIX3tBryuDvlEcD31Ih0TOw8JA=;
        b=uE8zBmHvanPwAP77AhPBcuuk8TdW39YjmWrAf5Y4zPe7nqrZPvVeocarOmoPW2/2i7
         37Xs/ErVHtJYD0bqj9o3e2xmfqBzCmZamqef6z99XpqOeXfjZMjoPehp+GIye/WHeQcW
         9YS6D50+0J5t+k6oq7oVsJvmdhgtuMU0YPXdBqZsv770aI7Wdaa4M/lh3fzReA/Z2BmY
         Webr3ugC8WjIgrkdgjZ2jHpIBZWhqIGlxKR5zXOCewfUVVI1lfIn0q7qIDujR7wl4UkD
         5H+S+oH6u3tswF80lRCNSWEhoWgnDOZqsjeGxfay5e2RE/JjHG2N26XI3USkmhh2tPsg
         RWKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD1uXRI8tmWxCWFlF0ZpgHTKeV4KheX3UzNzekiA3gQ3/REt3nLaDJRgcbxKRS7YAYYCflw4F8O6ah8YK4@vger.kernel.org
X-Gm-Message-State: AOJu0YxMg2rifUFEU4FdK5dg3PwONwgpran+INHgMVZ4yzCwIYAfszCf
	o8Uk7Vp4ZIa6SNG6dNBdzutlKtu5vpcoH1ZZXpZr6aXPqczUNh5S706U1Tq/Du9V3CxiYifjugA
	1u1KGjFytg0M0OjGke80CESRcSGlarsQRz+JCdIUDEYWDgLRSoihFcV0J3lZtHFuMPpDi
X-Gm-Gg: ASbGncuPiTRqe3ektzEtql5evwe08DLMNtVAsMm62cW8upKM6vQDztbHLqRtA1lqnu8
	AUe1poGNKO0+E2XALI0TdQ/TPg7wNwLYyqwOdxPyzRfBjzNrSbPWbn9FYXn1euRqw71aexYX2Yg
	RcGgBph8A5NO+X1ONRFuZG3H8Q0NnWKdU3cWX1xwcZrieRDeYi449Eu5PBDptPXLHgC8rbK3BWQ
	OA7ethTvxg47am2Z8rcdecdGjkhYEdYTVuzbok797FxQqJ93HDMpyfWFPi8u9zVYqsoo7aKea3B
	c+44T1JymURn6iPbl/HD3aOICIbj5qIT+PsDiL03pzX0PQmWBokO59fh4WSKYwVtbbjbYOjKkAA
	=
X-Received: by 2002:a05:6214:da5:b0:6f5:e0c:b203 with SMTP id 6a1803df08f44-6f8b2c59b60mr67813986d6.11.1747433485495;
        Fri, 16 May 2025 15:11:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEU6DgtmcjBL2iVwjhEQQMnBzBgU/+jxc+isjl2mVSHAPdsCVtuT0yhaLNg+VN9yVOb9Q7+Zg==
X-Received: by 2002:a05:6214:da5:b0:6f5:e0c:b203 with SMTP id 6a1803df08f44-6f8b2c59b60mr67813646d6.11.1747433485155;
        Fri, 16 May 2025 15:11:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e9cb4d69sm502623e87.21.2025.05.16.15.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 15:11:24 -0700 (PDT)
Date: Sat, 17 May 2025 01:11:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, kernel@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: qcs615: add ADSP and CDSP nodes
Message-ID: <thtk5vv2hpbnoapmt6j7nlgrcyedjzjbi3ntlyb3ll7atks46n@bp4isaoert67>
References: <20250516-add_qcs615_remoteproc_support-v3-0-ad12ceeafdd0@quicinc.com>
 <20250516-add_qcs615_remoteproc_support-v3-5-ad12ceeafdd0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516-add_qcs615_remoteproc_support-v3-5-ad12ceeafdd0@quicinc.com>
X-Proofpoint-ORIG-GUID: MMvQuGcJt28nb_vCckAc_0IFd9So8JrA
X-Authority-Analysis: v=2.4 cv=HZ4UTjE8 c=1 sm=1 tr=0 ts=6827b81e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=jONUQADHCp84k9KtN9AA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: MMvQuGcJt28nb_vCckAc_0IFd9So8JrA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDIxNyBTYWx0ZWRfX+YRmb2WGfpJZ
 j5Yhp8iBi2rqjA75UCYmf40PdZKj8995KTOHa/7m2jfyP/Iw17/c9R2KoDPNDKrj4we3Xz0UJxH
 2EY6dJG0/dqoGuoJwxRHF1vOKypmgMBOt+gxTFHOzj5g2IdxpePyh1OWkNZDr+pBDGCumcnoi/W
 JtdvuEFfLgvGqLcrI2rQYRqCuIGwgBCo8Exa71HZSpzYN/ze2PeM4xdJ1sgTbNfyhSAsh0vJx5t
 i0Gr7fn/DWegl98tyaPLomOQUVKMHR0DQYiQZLHd0dqnpZ4+6ragGy1TZTt6y6u9iQNr0TeJV02
 sqs9QI0JRT1o7VOU8ObUuTLElLeY+hkGpvtwMZxKidjzOP1WDVCXx9gDbWVyPgAGtb8jCKQOHHl
 z+6LpSfaG/+je9VHMeRBW5mLm6hNjTDOMOypED94pgowEORCbplun8dUT79O+OGqf70kvDBG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=584 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160217

On Fri, May 16, 2025 at 11:27:06AM +0800, Lijuan Gao wrote:
> Add nodes for remoteprocs: ADSP and CDSP for QCS615 SoC to enable proper
> remoteproc functionality.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 86 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)

Is the MPSS not present on the QCS615? It was a part of the SM6150
design.

-- 
With best wishes
Dmitry

