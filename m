Return-Path: <linux-arm-msm+bounces-88544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C59D12311
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 12:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 343A530BC979
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 11:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5844A355815;
	Mon, 12 Jan 2026 11:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fJQHfpSe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bg/SOhbP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202F529D28A
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768216101; cv=none; b=JIba4ysR6ecIhQXbVDq6oCMeDvX/OfqjhfJF8vW+MNKbDqT5QRmBTy286DaibIxIZMxofyzbrM1wR9ObYb4UUxhBpJUTl+QOoolXxH10L53O/UD73o6OU+PbzGI18swUn879lKEaHT/lDMf9YV4yLWuYGaUyu7MpLZGjcwGhUm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768216101; c=relaxed/simple;
	bh=iUASacHpIkllyuDdafnv4uOGpug6041+SXdNyxM1PcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oFHkwmYOFGkoQyy9CtvQa/xV7nk0agAJcJaADOONP3OAnn/3hum9HJlWNEGjR+JCJknWHzdQh1tsi5CiJ3a0QGWOQMExiin1TErbnE4sUdvJsib+ryD0kVj6LHQwVW5L/8DRDjlnCMByUP4gSDZa7viNWgfe3/fMVx2ptzPMTDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fJQHfpSe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bg/SOhbP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C846U0165707
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SpjQ3UXs8yQYCWMwewPG2bxBVEtUl6oOH+rM/TylefY=; b=fJQHfpSeuBqfKrpE
	+U76b0Y/C5CNDcOEO16jhYn7gsUWw5M5SyfoeD7RZz83e2GbkjBk5j9Z5HHNJq0o
	7SXY8gqctzhAjSqBIX1uxwTB1VkRfZVwnqkO/49Flw64eDiqYtgjK0BFoyrw+qU5
	uLhgS4+F58sOUhrT4B6gWwAUgjPQirB14Ky5Xo5Q3oc2udvaQ4YPgML0KFm1gbkV
	6ayXwkjzQjRphjlfI1zAc4ipzUfNMy0sSLvZtMj6AUB4FA1eOhiM6+cxP1KpLBaw
	wvFnFv/Mnde00HLfaZbenRF9mj66huix+rlXmnufKcypQY72FWCE0ME/1xGpPWVN
	CjQp0w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bm8kytqm7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:08:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b5ff26d6a9so133128885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768216097; x=1768820897; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SpjQ3UXs8yQYCWMwewPG2bxBVEtUl6oOH+rM/TylefY=;
        b=bg/SOhbPX/tbukMxuX+MEePJTGuV6WVlvYt5tsxEyBzT0TEhqearkoYAgGJi09+KCR
         kx3nd7/P5D3l/FIcjdT7+jHSW/p4+jy3WTLbZbhmIjd+GP/rzUAKlWCoybDtnOTMyThd
         Rcinc3fxVeZM28+hzci4KA2NsAIsEay/n6YlD2ZngvyMhbLEdKpnnY+IShOlzoWhkmFP
         j56xztLhm2PcsI26xPSn+2sTX5n+OdBQUxXonxdcF8nmv3US+KZRmNBNj4Bg0+EzB2MB
         IGvBpTLZXyCDBxr4b+d2PNrvCLYj+d7tthXe+1nuj6VTLUs1z/RxUfcd3nDqrAKDYjmR
         GjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768216097; x=1768820897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SpjQ3UXs8yQYCWMwewPG2bxBVEtUl6oOH+rM/TylefY=;
        b=MrRj4QX9eR5D3Y7VAtmRRq3YObV7jMdrg4qNSPTY5o42FjQtoAfMzeIvdUhf0pA+9u
         pWUjKQkAfdmKqbgcqzkiF7yp7oS4z8KUtM2SbF516MG1m3R0ZPN8yS+e3lPcvc2+nQfR
         j4mBBnxLKmHhjFmsr9WeFs0Eyp2ASDi0vkNJ+2wb4n3eVJ+Mk26VWMMST413+gq7jq7D
         qhZpP4AtpAAxOkjpfGktv3B94lwilvWuT1k8dSkaoJi6oUoj1f7N307FroGss1i0iQcD
         6Nh1jQXcKiLVwUb1ro1QOsuvIuKcBNpE8Dk+R6L6B1E4zFMNSilgqmyERWany/thEjw+
         olrg==
X-Gm-Message-State: AOJu0YxS4EUmp/3wdlyQi4Xl8Txw1dlrH6+JSigm65jQRh60HE1cZVrk
	hh7s+QPeHXFkDJB1nzdubr6msaXckkT86dySJmulL5YyMrilf65tVQaONp9Mx1uaLI5+nHax+k/
	2EFARtdOidyaxG27jhYhKPyRrz0iQpnDtqoLVISlmKd5rqbtD6ezrDZnuJ040thqrRlOa
X-Gm-Gg: AY/fxX7OM1YU4GP2BJ8FYlS/3zsteWNDpfvLbdxNmkzfiUoqvj6qFqHntLdf2e2t15j
	H4lmlBL6ScEQkEmhsTPLDDBsYx4iOL7SqTuYCU0UiAlEoMvVbHJrwF+yzKRbdRLKv3S3V55mVDf
	jYC06ayXlDB1AVacrz4OQpMehOlHfScmda4U1NG6yBo+akgrukbDgtFVhbgGkxSC2VoOfem5fMU
	NYSFKmf2uO4KP7tOtC/V4gt4r3DUtpXsdyJkLVkyFJomA+W9yD6WzYsmk9fXNH5B+a5gNkmpuqr
	ISF6rNpA0UvxEAWMRycF0OxBwVtRE4TGFYgilpKDCnVM4ZPcFOhexqnwzoW+ApvVizVsvgIsIHQ
	aBd4P6LhUIT7c1wqLJt2bPGZca4SmiZqQxcgXHc7Sc/CWY+cuNWPHT3maBiaSx/XMfpo=
X-Received: by 2002:a05:620a:1901:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8c3893fd199mr1758456585a.9.1768216097425;
        Mon, 12 Jan 2026 03:08:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBH4pb5/3BYG/cAuJcv/xavCclwNEZZzBJQcWjCGzKwsMo2DvYPIaRbeYOzCTWmrWy3hc+mw==
X-Received: by 2002:a05:620a:1901:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8c3893fd199mr1758453385a.9.1768216096987;
        Mon, 12 Jan 2026 03:08:16 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8724197145sm173031466b.11.2026.01.12.03.08.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 03:08:16 -0800 (PST)
Message-ID: <5594210c-ce25-40ac-9b5c-69c97eb0bd72@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 12:08:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] soc: qcom: ubwc: add helper to get min_acc length
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <20260110-iris-ubwc-v1-2-dd70494dcd7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-2-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jG5n7XMZGaSJHfonBDVNGLKVojPO9ArK
X-Authority-Analysis: v=2.4 cv=ZuDg6t7G c=1 sm=1 tr=0 ts=6964d622 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_A-17BlWpzFJNOduaeEA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: jG5n7XMZGaSJHfonBDVNGLKVojPO9ArK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4OCBTYWx0ZWRfXyRtBa0N4cXRP
 1ydNXNOQ9qCtHemils9wrBk9cii6sbneWZJ+f+ixOJcXfU5kLWSc3tyVm3EZM2wXdnHZ4x3sCir
 gCvNetaeOG/Lqf0PAIgmtOfkk8jXjonghPKbinmTVMB/j5Yj36LvjR7SM5Obj8OvuYhpWS3Ilwq
 XJ6zKoBi+QR77YneK2zAkbs6mxDowMfsTZrC0LhuGBl4+4eGvnkwgfUxuwebH6fSjmFnkAVsdxq
 gLs2/I6n6I7dOWocG+7CAce50sUwVArPEKzF7OK/0x5BCaD0NiokgpnvkD/r7hTt4wlQDWyEtbI
 Pbloo6cMycKLatsvr0gG7gyrouzvODrQZOZ1Cy7uoKS5D5hC+/Xu7cyJuO14WdhZddumuHG3HVm
 eZuE6+UwNIy7gTz0QEe62KZ+/lU9Z73vttczFA705dI7TaJEMeh2PTwK+5Cf77RlkGiK3u70lZI
 RfD6cH5Eje1fEk6fXWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120088

On 1/10/26 8:37 PM, Dmitry Baryshkov wrote:
> MDSS and GPU drivers use different approaches to get min_acc length.
> Add helper function that can be used by all the drivers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  include/linux/soc/qcom/ubwc.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> index f052e241736c..50d891493ac8 100644
> --- a/include/linux/soc/qcom/ubwc.h
> +++ b/include/linux/soc/qcom/ubwc.h
> @@ -74,4 +74,11 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
>  	return ret;
>  }
>  
> +static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
> +{
> +	return cfg->ubwc_enc_version == UBWC_1_0 &&
> +		(cfg->ubwc_dec_version == UBWC_2_0 ||
> +		 cfg->ubwc_dec_version == UBWC_3_0);

Are you sure this is a correct heuristic?

Konrad

