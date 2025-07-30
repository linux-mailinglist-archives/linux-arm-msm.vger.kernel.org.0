Return-Path: <linux-arm-msm+bounces-67109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED77B15DEC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 12:16:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7378542274
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 10:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1687275867;
	Wed, 30 Jul 2025 10:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kw5bmzUS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB131FFC49
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 10:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753870589; cv=none; b=Cf44Tb+Iq6tGb3YhYmQ9xQUNWGuwSuHivtV8T6UG+585DwNBQjgyh3jJOAwSaNagVfUwa4zA/H5LWjF2x4uMgRge5H2igZpkD2URD4mCFZG+HhJ9lcF9sDZ4evovhYG+7fe5JZ6DuehDAQkjU6hLbNfwUGazvjfYR7h74O+zrjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753870589; c=relaxed/simple;
	bh=uut0TxsQwYWw9IdoyR5yFTrLz137/PO55syezkU2RTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mrmhG2ecE0qnpd7YoyDD5LLgMqWOlWkdYhuncnrWn/U5tZjvpiPnX+XDy5uqvskwvVhPJJ/iIAkg9pH0hwNkdm0eHCuXkGP4OjezjeEWf6hI2zjmeCUqDG+9kL7tEUi+Ot2RGZIwbd4fOcikhNBWLYfkFiJ0z+/EyluJtG9GHko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kw5bmzUS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U7xdbW016145
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 10:16:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e74WcFwkTr6qVr34ZJAvZTfeytAh6aWlboCX6N91C3A=; b=Kw5bmzUSHx4PROsj
	WFRjmhqaxrVUj/5aGffpMHtJaySYHJKSY7gbM1742maN0xiQAkLy+hHEDb16UgwV
	UcCLWhxRDLqFv0M9FGqOkSyQ1ZKRGtjf9oMWfzonCyS3lDfQiUB1BcDvfr+pFMxo
	VwxGQnokbaF/DeCxN77CsEGOxmsgDTf3R+ESA05MvX0gz8NP5ChOjHHPc2XvTY1H
	1q5nKz4sc9Pq15owH390aNtsUt49yr1gi8mlvVk0Sel9m47bjjzBF8WzRT46vXTL
	LGAAR+XsE3RKLJLEf+5/r1K2AaSbKsskxYf/KlJNRTp9AnDg2AmK7coCk1eh2a3n
	ngFqwA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 486v6y3rrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 10:16:26 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70737a93008so2687276d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 03:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753870585; x=1754475385;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e74WcFwkTr6qVr34ZJAvZTfeytAh6aWlboCX6N91C3A=;
        b=GQiMIpXglrSg58jHe2JWS9x8mDVfW2/16lPAgMqf/1k+u5zUlgbmljGSeU57gkxPkA
         XCZeiHwp5hWpl4a6YqoE0p9qGLyStj6n6LSxxUqTGBAF6u7CPkZlb0mXO9rNwHGb8CVm
         8URW7OhF4tqa4Toe31j6k8T7vS6XSeklRcAt8J633GBsySAxdmfxzqyJrj+i29UwLMIp
         swNmIghcpEsbx7pzKcZ3wzI0L3WZHlXDb4Rs7vi5mRd8bWZ7qepQNNgsWZqisMyLwlpV
         pGhVPd+QJ5cv7feh59WcG2iQjqSxR/LfMclPpKFl3Wxi/KBdC+XO6LiBeEHNgrdq3ELN
         WjnQ==
X-Gm-Message-State: AOJu0YxazYhXqhgPxzSedDufrCg/a+4en5D6f2yuvCdv1qhz84MWzeaG
	M+p32pU/vbGqUy5wdOkebGaZ8LQyMV0a6NmlGAliiFQVbMkS7Jq3jEnbQWs4h98zyc1OS30y7LQ
	kCtxudqGMmFhZ0k7DtwzrsU0+SLD+pkTyVFFUNHiIz3L1+tU63IvyhQKpUGA2w68gOEZc
X-Gm-Gg: ASbGncu0IyFqIftG2RUIZJbBdLATEqASpbHUi/l1RflzZjrz8Ty7+QkIYWsbeZXhaPu
	uI9MPUormm7ZDDvGl/nrmljowIDRQlzYexjHWyHtpGA3FZvb9hF3N2yIhJzJ83ted709Gx/vCDt
	rh08Z9CItVzYwDU6vzFBpXIDRwMqIjtEsDLUCNV7fE4Pms7yVDc6lCCaF9DuwCGFZLs4+CNfOYU
	NEJSlP1rlbXvvVjb4y1KL32E74qC1turIQG4WoLswkgOaBOFRQQxgvkDYPmItceQD/xqz7SlqMu
	H1xrK6Il6tgg0Z1aArIFa2iwXLUDDu256iHKtdJ5rnNVxmEYBXx+LkzRYC7e8HbcdAbjK+386rS
	MuLE06u8L2RSKwXzm8A==
X-Received: by 2002:a05:620a:a907:b0:7e6:6f9d:4b06 with SMTP id af79cd13be357-7e66f9d4b93mr156063485a.0.1753870585398;
        Wed, 30 Jul 2025 03:16:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMVovcbr9AHNlT90gl+k15THWxhh7Sd7H8hPKD8T+t66JapkQsUuAU5RAVLiYqLUQ/JNBoxw==
X-Received: by 2002:a05:620a:a907:b0:7e6:6f9d:4b06 with SMTP id af79cd13be357-7e66f9d4b93mr156060585a.0.1753870584897;
        Wed, 30 Jul 2025 03:16:24 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635accc38sm715115266b.114.2025.07.30.03.16.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 03:16:24 -0700 (PDT)
Message-ID: <070915c8-4d7f-40d2-ba38-e20a801c9089@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 12:16:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] soc: qcom: ubwc: Add QCS8300 UBWC cfg
To: Yongxing Mou <quic_yongmou@quicinc.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com>
 <20250730-mdssdt_qcs8300-v5-5-bc8ea35bbed6@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250730-mdssdt_qcs8300-v5-5-bc8ea35bbed6@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA3MSBTYWx0ZWRfX9V0wFtdVlrSd
 sU2hrH14lTEWpC+IidOSgQ6vqDl9JOvYwP09hNv+CRtaF//ecPcFI2luIrNT+r9kMG2rz8R5KMZ
 +UXrJiCA4P47a31ZwRuUmF9nA83Q2qsUF5kowPJ7Sf3p7Fk8MOZCbkX4tipGHFldYuPXDeqWRmt
 56aEJXN4JH2TqyWQGqTBI42YYBZtBKNyvewHkFmseewlLbdsLTGv7dO2kfiWHlvvf0+fwAelS9C
 SUgvpxqO3WesRrVpqSzqdu/um/rbGmanoGKr1xgiGmlA3MJXp4jLrnw6LtECk8BL72jsX1QpRiF
 pyueOoP7NyPREgmnbhg+gkaYWX0/fpWjY20W/S7REF/GPVhNajstdXKlKQcXZapkB8ZBXrWfum7
 +IXiI9Iqlpo8i/IBbkuxAKSu5l0mwB8bYXeDRElx1iCNkrFFTT5aoulQnhGvFI/niJOJ8mde
X-Proofpoint-GUID: LraAAF5ndehwplvo2hKunE4EbE4qceR1
X-Proofpoint-ORIG-GUID: LraAAF5ndehwplvo2hKunE4EbE4qceR1
X-Authority-Analysis: v=2.4 cv=QYlmvtbv c=1 sm=1 tr=0 ts=6889f0fa cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=TI01094hTbTrXjSAet8A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300071

On 7/30/25 11:42 AM, Yongxing Mou wrote:
> The QCS8300 adopts UBWC 4.0, consistent with SA8775P, add 4 channels LP5
> configuration data according to the specification.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> index bd0a98aad9f3b222abcf0a7af85a318caffa9841..389fb871018b65987295db60571c063b4d984d70 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -35,6 +35,16 @@ static const struct qcom_ubwc_cfg_data qcm2290_data = {
>  	.highest_bank_bit = 15,
>  };
>  
> +static const struct qcom_ubwc_cfg_data qcs8300_data = {
> +	.ubwc_enc_version = UBWC_4_0,
> +	.ubwc_dec_version = UBWC_4_0,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> +			UBWC_SWIZZLE_ENABLE_LVL3,
> +	.ubwc_bank_spread = true,
> +	.highest_bank_bit = 16,
> +	.macrotile_mode = true,
> +};
> +
>  static const struct qcom_ubwc_cfg_data sa8775p_data = {
>  	.ubwc_enc_version = UBWC_4_0,
>  	.ubwc_dec_version = UBWC_4_0,
> @@ -225,6 +235,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
>  	{ .compatible = "qcom,msm8998", .data = &msm8998_data },
>  	{ .compatible = "qcom,qcm2290", .data = &qcm2290_data, },
>  	{ .compatible = "qcom,qcm6490", .data = &sc7280_data, },
> +	{ .compatible = "qcom,qcs8300", .data = &qcs8300_data, },

You can just pass &sc8280xp_data instead, they're equivalent

Konrad

