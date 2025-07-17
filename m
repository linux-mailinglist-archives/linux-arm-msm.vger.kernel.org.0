Return-Path: <linux-arm-msm+bounces-65551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62651B095F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 22:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57C8B4A8422
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 20:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25993235063;
	Thu, 17 Jul 2025 20:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZODzgaVF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8B522A4FE
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 20:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752785348; cv=none; b=KCfzlpOJO3dHCP0wdwzFy8C8g/mYLWG+dCNC3HKxxI2KvC7MD3sqaPIrlBpsa/68aHH3JDgwIyps8HAa2TmgxIG+gsT/Tk3L/UaUns5GCOjtxHrXDaE8HhPrPTTLO+tefCK2pqzufTt4WDYS0L05755i0ed044IUVO6IA2f1hl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752785348; c=relaxed/simple;
	bh=Lv5I/l69wbo8RENfJ/KSckfR2rUPD9dYes5xZ4X8ePk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l48nZCDS8kVRzoUcsriL8b57v7zgPmp8Bc4n6QxsJ2RWdNK4/fste+OfZzbZXFKCrIiKIjbG7mVCG9/0F2D3yb5fmbNShNweWbMutMDFZb2jUEmBDye5hEPW9BwZ8aBqSSy5aO9+WJwNLC8BB+NOe8Z8qOqCsTrmZgBvX5OAfCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZODzgaVF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCakWX016545
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 20:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9CmYaonQmugq/A4aPpsk6Yn5qRo2GpUcf9NGF+0jewo=; b=ZODzgaVFXqDSAbAX
	LfKxIzB6QdXDsZi4ImF0dwBp2TXCcsNhS6UED+aEZlPRNhtTx+6tQZOxmHlyQ0XJ
	86tClR2BvCALhvt9pu9tfPDf3zwmNgqvytEHRMKqmtgbWbLKHgVyoi2Vpq7U+Uzc
	mMcXIyQELPGgPM+V2jCUNQZVrluAeHsfIiJNfjNTr2Jkm9POmL2IatCpUImukDlO
	HQLhVpF0OAt0a5m42K7IRUhwjQCovePyH79Gg3MNkGsA05XbOIK8EwIjBqCyOHSh
	O2twmTg5nwKnFD6KIFiElguhTQtujDJFqbZbDtx/ylp2NW+CywH9U4iLLEe68oPp
	Mpg+1g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dyv4fu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 20:49:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ab716c33cdso5567421cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 13:49:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752785344; x=1753390144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9CmYaonQmugq/A4aPpsk6Yn5qRo2GpUcf9NGF+0jewo=;
        b=xVfeY7n/tm8EsOFXVwBX6UogsUelmGz9WDtnIJuPRB+3naKcQC55pEYyz6u5L+9QD4
         Ni02LBj39N7tDz4QetBchsZ0aw/cDrcxyP33H233mY+MQ8LWcDTTCyQ/sanm2e0fY719
         ovMoRw7v11OKMHGK1jI5kaKk1tIUYQefwT+FGHpBPZ/k7Ux8srDnSbr6LfOlKZcZWZsU
         1B1VfcECQypJCEB4kd9rhSpiWcwFytpE9il6jVJVo9BlgzwZNAfSauQ8W+Hbfhzj7Jp/
         SUDouM8IwhEKxpjRHHSG0EQF12Zu7HR/GhRYYN/VIMzCFYa4enmTshAOrEuiz8gv3lEx
         FC+A==
X-Gm-Message-State: AOJu0Yy3a53YCxzWDZxeVIEE/wUjmmJv2XNfuCqum35wyQMbK8gcjfpx
	qILtrB3kx1odf93avvPU+GfFtDmTJtbDg7dQNojZ50KlqnRmXS3b2LBDNbl/j0s/iWkdCfZzjM7
	pQ2XW7s+Nt1dcz9aPfjB3NMdkVuPniGDkF8WDXdkYGLh7+HhfHvcKHBytelVZ5alSObEK
X-Gm-Gg: ASbGncvNk5Zz81o80jJvU04w9g/+fbNJog2mFyU9Ji2iyeHtEPAKcgG8fN9SAdPEcv9
	/Yf0FHFbW0/Vbp/azraLLr12I7bIhAxpvErcutSNgTWgPiV2wzzVXTtGgDY7HodR4O847f36SRk
	CRetORQOwuO6Bu3sp2MBRqgmT/KKhXBuCG53KdQd2EP41hlXsc5umiRajVhGkdWoiQirU3rVa3v
	yfiSqoJhpw4q3mBH+LhqPp4e67Zc60aQ2M92gRAPkUUcBufhU89N+CLvh5A1zrSx2/gYsUvKoCW
	Lt64Ysg7+ILhg/0tx+5MyvpK1I6UwcATmScyUfQTIAjGrcDH+IcyubpU+OVuusCdonN0o6nnSfg
	zr6uXb5wRpe304bkfrLrI
X-Received: by 2002:ac8:5a50:0:b0:4a9:9695:64c0 with SMTP id d75a77b69052e-4ab90a8b01cmr59189831cf.8.1752785344080;
        Thu, 17 Jul 2025 13:49:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsdUOD63AuogKrskTaxBSHWwDEDfZBOoSuBlZWtt3hsMXZqbmo6AUjQ6EHFno6axLzFcjgbQ==
X-Received: by 2002:ac8:5a50:0:b0:4a9:9695:64c0 with SMTP id d75a77b69052e-4ab90a8b01cmr59189571cf.8.1752785343480;
        Thu, 17 Jul 2025 13:49:03 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c95246e2sm10463988a12.17.2025.07.17.13.49.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 13:49:02 -0700 (PDT)
Message-ID: <793434f9-7cdc-409f-b855-380be7a2b0db@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 22:48:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 10/14] net: ethernet: qualcomm: Initialize PPE
 RSS hash settings
To: Luo Jie <quic_luoj@quicinc.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com
References: <20250626-qcom_ipq_ppe-v5-0-95bdc6b8f6ff@quicinc.com>
 <20250626-qcom_ipq_ppe-v5-10-95bdc6b8f6ff@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250626-qcom_ipq_ppe-v5-10-95bdc6b8f6ff@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MTOI0pz0bSbPPL94zTGrEgXQWqXNUytG
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=687961c1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=afnzvhLNFvO1QOecfk8A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE4MyBTYWx0ZWRfX7WCbVqkksc84
 lexQPf6BhlCuzVrW8ovBtmNbXgZQ4YUBcGMoQZFkxlHGhnUUROZWT3V+CzUxhimEvzBaXcJDrrw
 0EEojJVSA1AO7wtq2bxkEj8l2ttqwnDq0qehViUYPF1bBoi1IARRRIQ0URq5ndO8qcsK0Zr7fdm
 2+cZn0QtszcXrEMtV11hp4ce0ykEsdV3DHAokCincZqQQGA00CHu74VnGZ0JnjXOs5FTRUxwdAM
 jlPwKptXbA7B71pV8exN2yFREM3r49O0RJQNcG5b/iXUbFniEj/MMip1fnFJxhMUFFH1yFaDzdE
 p/ksi65KQaoRI3TbjFsw4/UyDch1fFCwbxl/Itsyoc2pNKA4UGa0LPqgIGX33D5hmxS/vk+OHjb
 qj9x70UMpcYY/4+B4gglxZXLH2x4m5wGD+iGv53KZzgoCUcDNn99UhVmOdX6vLEzWc9+/8Zu
X-Proofpoint-GUID: MTOI0pz0bSbPPL94zTGrEgXQWqXNUytG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170183

On 6/26/25 4:31 PM, Luo Jie wrote:
> The PPE RSS hash is generated during PPE receive, based on the packet
> content (3 tuples or 5 tuples) and as per the configured RSS seed. The
> hash is then used to select the queue to transmit the packet to the
> ARM CPU.
> 
> This patch initializes the RSS hash settings that are used to generate
> the hash for the packet during PPE packet receive.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  drivers/net/ethernet/qualcomm/ppe/ppe_config.c | 194 ++++++++++++++++++++++++-
>  drivers/net/ethernet/qualcomm/ppe/ppe_config.h |  39 +++++
>  drivers/net/ethernet/qualcomm/ppe/ppe_regs.h   |  40 +++++
>  3 files changed, 272 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
> index dd7a4949f049..3b290eda7633 100644
> --- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
> +++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
> @@ -1216,6 +1216,143 @@ int ppe_counter_enable_set(struct ppe_device *ppe_dev, int port)
>  	return regmap_set_bits(ppe_dev->regmap, reg, PPE_PORT_EG_VLAN_TBL_TX_COUNTING_EN);
>  }
>  
> +static int ppe_rss_hash_ipv4_config(struct ppe_device *ppe_dev, int index,
> +				    struct ppe_rss_hash_cfg cfg)
> +{
> +	u32 reg, val;
> +
> +	switch (index) {
> +	case 0:
> +		val = FIELD_PREP(PPE_RSS_HASH_MIX_IPV4_VAL, cfg.hash_sip_mix[0]);
> +		break;
> +	case 1:
> +		val = FIELD_PREP(PPE_RSS_HASH_MIX_IPV4_VAL, cfg.hash_dip_mix[0]);
> +		break;
> +	case 2:
> +		val = FIELD_PREP(PPE_RSS_HASH_MIX_IPV4_VAL, cfg.hash_protocol_mix);
> +		break;
> +	case 3:
> +		val = FIELD_PREP(PPE_RSS_HASH_MIX_IPV4_VAL, cfg.hash_dport_mix);
> +		break;
> +	case 4:
> +		val = FIELD_PREP(PPE_RSS_HASH_MIX_IPV4_VAL, cfg.hash_sport_mix);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	reg = PPE_RSS_HASH_MIX_IPV4_ADDR + index * PPE_RSS_HASH_MIX_IPV4_INC;
> +
> +	return regmap_write(ppe_dev->regmap, reg, val);

FWIW you can assign the value in the switch statement and only FIELD_PREP
it in the regmap_write, since the bitfield is the same

Konrad

