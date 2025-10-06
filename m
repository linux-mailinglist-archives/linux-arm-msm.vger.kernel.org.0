Return-Path: <linux-arm-msm+bounces-76008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE05BBD5AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 10:30:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E6A3A349BF8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 08:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B72426158C;
	Mon,  6 Oct 2025 08:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DDhVqSS9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2035B33993
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 08:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759739429; cv=none; b=b5mMsUd1/q2BIzC9S6QylNUA7fu+L+H8FSfI3OBIy2FRALBpFDjtY95MgJgbxS/XzPD+l0Az8jNq3pH/yEMzxwO2L1Qv77WMFjeVCcG14FW+uYN70MEQu1isWxpS8CRwaJvnVYRki+Zt9s589R7Kw4PBjQIMLrfLl49lpYotWuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759739429; c=relaxed/simple;
	bh=h8CwgLFpO+TicqkeCoMFZK/tgdp9XzNO2dE1KL03W3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vBR7/oDrcNTsDPExBtf3La0e+NrVlwaYTGLOQPp+fW9BWjJJftc+CSQogbZElU8tSMCWvHkGZjr2EWOUvIcny0jVDCHrRJNmtweB08Kv6cYx9E6Gy/UEb7ibySB3cFqFHSaBdHemWBX/WreqPTcuHWP4lcmQbXTY1Viku9wU+6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DDhVqSS9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595NLP0n026488
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 08:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/L1grXilGVTKm+qKpyor+cgwpOJFQIDTL8Rar0TzJG4=; b=DDhVqSS9JcY0Jc8m
	jyQMB9h0yP96EP61LBGxnmgdUpsPoKyoV/Kv7Y0jVT8kQFsJVQUiQL0T3UqexWIi
	8hcWnW9yLrrxT5N6Qj1DqJ/QoMxSpLY9li+95Y4SiEf0fKT9TyfoV52glcV84Xdn
	YDwrZ5aMDoZWF+58kc5pNGsZyO0xJiUS3pysN844F30fZzwI92r4EIAo7Ke9it2G
	ewtmvhHcR5fHU3AJG6KiJbKt+UT30aHPT8+qDgYa4w+LIE9aGpgOj/+v6y37hg4p
	QJepv0vO+vzlDXpEEdiaudL/XHqGQaBuEHVgJH3yU+4xG1e0Z074q7ShDZBV7ws+
	ufq+ng==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1k99t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 08:30:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-865c7dee192so100652085a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 01:30:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759739426; x=1760344226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/L1grXilGVTKm+qKpyor+cgwpOJFQIDTL8Rar0TzJG4=;
        b=kdPqSHZrQuJro5D3Y/XTmiHeQI2I3Zy4ifOTNMMuat63iqrnBo5VubIynuhCk4KLpP
         GOVvxBa9dJ1VwLyYuHyvRvi+aevYvkcAF45ZSnPSFsDmo6yeLovd8S/0eULHVSXQ3X77
         kJ4ebXNTO0BN/gqkNo0gmjFulqyMA3Jx1iQQT+dsoIKmYG7Sz1VkVGWJSyaJdH38zv5r
         JDv6Zako4oQFD82u0jmak6f3kI6QEcVqwZRB4CfN1L3lh5qkg48dngSBWDWfIgzSpeqY
         jkOKkqXWWm04q3bkhBIrILsIeDF6JdkfsN9cm5hS02OzUoPIfOIsAPJw8oNGphyZKqYU
         7RQw==
X-Forwarded-Encrypted: i=1; AJvYcCXOFzlL3NHSjVoqVwYE9y0KaddYq5W2l1aFKA4AXINDiu5GWuSMHqQrWr8b+RI0VPXVkBnBBGZVbuHpOflP@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr0l9CgOfsTt2TR8EWKnNBcnaldliHwBllu1TRzpxKCCS30F5o
	+pBZ6JuoaVIkfLHHZxeeFS8OrhYSELw6fgzH6uWwV0kbu4W95lppfCijfpCBBLGgXmKQZ9huFDe
	Ga8jMY0Ju0flhqszaUX7092Owtq31KIwqr8EKWuUfG0AMRVlTNbHqMNL3t29phtXbqqTi
X-Gm-Gg: ASbGnctsHbOUDy/vg+xrAWvZYFVa84cnPT5a5ZQsMUg/SjPi9J2Vo94eCxv7f9uSFlo
	Z03wY8P/VwNEvmsQ0BosxbiHuov+PSocNUqsNC7IUaOnfwy8lpD3n2OTxaGrkmJyIZhMaTMydiB
	tuiHNDdbHRPDSFr3s7fK6Pw1H7/qFnbyJkqtABd52HlFxyEuF7HAcd8dsO8jn0saHIGKGO21bhd
	nFLkvqzGGg7Dnog4aXYFt12VFFdaRkCFhSyixAIQaDONU2yDA5iD9niTecG2NeuL8NjRLGepy2H
	h9WPlTEIBw6mKIawp/QHKnATKfHRKUmK8GT4g3MTtwnnnFQb6LGw1zVWQqLJ2YI/HrchmXX2YL1
	WRreKIFGeZOewYjL8alKNGYr4kBY=
X-Received: by 2002:a05:620a:254e:b0:7e8:c4f:614b with SMTP id af79cd13be357-87a35ce66b3mr915923385a.7.1759739425789;
        Mon, 06 Oct 2025 01:30:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXUjSORB8/gdVaqQhY61pOzDiPB5IX7IjdJsn8jA+4eHYgbYcSssD5tm9/R6DxLCyU1tYgZw==
X-Received: by 2002:a05:620a:254e:b0:7e8:c4f:614b with SMTP id af79cd13be357-87a35ce66b3mr915921685a.7.1759739425283;
        Mon, 06 Oct 2025 01:30:25 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b422sm1100481366b.54.2025.10.06.01.30.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 01:30:24 -0700 (PDT)
Message-ID: <9320c599-c7e3-427c-a096-230037d5db43@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 10:30:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] drm/msm/dsi: add DSI PHY configuration on QCS8300
To: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com
References: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
 <20251006013924.1114833-5-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251006013924.1114833-5-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6BUC0AUZSp0npbLq4Ia7UGlONKnHJbVU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfX7FBtSWvs+DmC
 DoPETDf0PQuXI83om7TBGDbUJwf/16poLYAiAJQnFnqvldr6IVtNNtQW/WcEUgnTuBfsrxiRFju
 /IU11ahGH76bnlAdRX2txcZRst4xsR2VFH0/K8myAhsdSodVxZP7gFQ4kjWnfhOGeKvJxtwxEqz
 oT1DZ1mcercEndqTPYrnKIUKe9A0EYdtNNKlcISnC79py+FZMtA2C+Y8tan43x7hHxr5uQ5RPh7
 4lStY2DVd+G7quZU63XyDIE4TUG9GgOwaNmBBcOrEA9cDyUrjlgCa6ps/GGKlXbGqO50+J4L50v
 z3qyaTjuM34+6JTgBf0jA/YurH1qKTqhe6Yd0pfta2/eZlTNW5vAnfVnp6+l+VSQa2A87jgyycD
 g1VrgQ16nQ1bSesQ5WU96LTjwVIA4g==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e37e23 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=pHedSVXj9zt6Nr3hYnwA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 6BUC0AUZSp0npbLq4Ia7UGlONKnHJbVU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027

On 10/6/25 3:39 AM, Ayushi Makhija wrote:
> The QCS8300 SoC uses the 5nm (v4.2) DSI PHY driver.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---

[...]

> +const struct msm_dsi_phy_cfg dsi_phy_5nm_8300_cfgs = {
> +	.has_phy_lane = true,
> +	.regulator_data = dsi_phy_7nm_48000uA_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_phy_7nm_48000uA_regulators),
> +	.ops = {
> +		.enable = dsi_7nm_phy_enable,
> +		.disable = dsi_7nm_phy_disable,
> +		.pll_init = dsi_pll_7nm_init,
> +		.save_pll_state = dsi_7nm_pll_save_state,
> +		.restore_pll_state = dsi_7nm_pll_restore_state,
> +		.set_continuous_clock = dsi_7nm_set_continuous_clock,
> +		},
> +	.min_pll_rate = 600000000UL,
> +#ifdef CONFIG_64BIT
> +	.max_pll_rate = 5000000000UL,
> +#else
> +	.max_pll_rate = ULONG_MAX,
> +#endif
> +	.io_start = { 0xae94400 },
> +	.num_dsi_phy = 1,
> +	.quirks = DSI_PHY_7NM_QUIRK_V4_2,
> +};

Again, this is not necessary, since the lookup code looks like this:

for (i = 0; i < cfg->num_dsi_phy; i++) {
        if (cfg->io_start[i] == res->start)
                return i;
}

Konrad

