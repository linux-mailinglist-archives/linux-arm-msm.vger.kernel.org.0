Return-Path: <linux-arm-msm+bounces-91016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UD8JF4IDemlE1gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:39:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B46B5A15B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:39:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 00A523005584
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4DCB34F49A;
	Wed, 28 Jan 2026 12:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V5n28WXB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TaCdu7OK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D50E2F3C37
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769603967; cv=none; b=VS2ZafjoxBGlWJZhB/+tW1THTw3fEV+ImY9PY42PR4OjnVP1kQU3ZbbWPjzjf02yU1fsDrYroxPQapeDyjf5CiJCt9frXbhY76riOKq1UAJh6z1UXVTOhZ8EKC5JOjIgV0mYc9WyU43Oe2sIGOfZiiOG5w0uZH4Bf+9oqvg+c+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769603967; c=relaxed/simple;
	bh=rnSFYiKpipLYfYsB7I4jYi2KJwlBXa6QxCsWGp3+S5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=awuBwDcAe76CXMbsU7tEQIZuq7Fx4Rdg8CucV1yV9/erYDSJGbAgUN1aXGDjGgpRtng7GZ99kY/cyIi+EOQEm99cyj5KxrUhWCgi72r7wBlLxjqpkWeqHUoNGqbJeuN6G/0L5vFkB7aZwLey5I5ogjj9lP87/omDtu068pt93nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V5n28WXB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TaCdu7OK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S927fl3920922
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zuk0aNNm3PN/IEIs187jYGxFLJiqS4HGWXcW5xEcOl0=; b=V5n28WXBnCDbknJT
	GZh9mo6ev1aaCAVBfNhLRqHRJW7DpYWx0Uwqj4hN3uEu7OjjaH/WYtYoxc2B2fI9
	XCTIlejLqkHPHaKUj1gxW5+v/O2eo5ld8f1avzA8tNSrjC4O282nYG5n8t4wbhtN
	b4bSpKquj8bUQCD/rPR6wTZelPbHiIhHY6QzplBT+2mRKSVjL3zJ28OgIqFmZ8YJ
	EzM60LgzV3H/BQH+ZynWsHSB/ap04IjDiQjnGQF/VUyj8VvjE8d5FYaCJpZtHPtO
	83AUfVp3cvAVJclZ7+MSO2hlD6uDv0yQtbHbb9KT1+BssJS0a3Xy6LVMny21eYj0
	CKnJvw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by211bbrc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:39:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a49b46380so19679856d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 04:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769603964; x=1770208764; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zuk0aNNm3PN/IEIs187jYGxFLJiqS4HGWXcW5xEcOl0=;
        b=TaCdu7OKdmdbARyXkAit0j1LwYDMNeeJ8/7KdQvjswf9HH7qt5O7iFsIMN5VJK0ChJ
         /jpt4aO1ZjGR17a1hoCsPFGTMWyCh2CVZkSqV8iIseny+Bva6zok3x/+MDq8iQImXEQG
         coLeXSpgq/7TR9YgBianj7WvHastHkRsgvKEv3eGSOD6UHjSjSiM5Ta+rcxCHsXXrSrE
         t0PAXAldDYfFsNhNPOIO4ss1XDRawod/9neVgEntziNjUxnuRSRkbZhdleBqW3oX51Pr
         QwUuV1jP3Pr70C0QKzdoa/F7uJSChgmbdMIolVo78Vsht1M0FDQm4lae1Q3De338yRHO
         ZbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769603964; x=1770208764;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zuk0aNNm3PN/IEIs187jYGxFLJiqS4HGWXcW5xEcOl0=;
        b=j0LVMyBoBvGWqLIXraV97eu+X+wgy4MLr37875fg59VUmofiQuOH8iuzxRVIcZ/lZV
         gQ2xTDNb3Z1XhwvgajEzDBBrG+FQ94YkXH6h5vfgXbDz0PdVWCBdFti7gWkEXln5PZds
         vcR8F4MKyQlca+h89lRpficoLe3rBTHguCnNuDrm8mzcweG4te1XsevIRqqRSrZFVkT8
         gL32As5FdAmZSW+eyRg8j1ZeZpoyAvVTypvzqHqW0CgtaxmV0d7FnpNEzHUvWBlojzHk
         YxqAhRXsSVG6jwAa4Xa7StSgKrbPu/QFe7Y2Xh3YyFwRmNvOaDXYfOkCeXgNeKADROU9
         eOwg==
X-Forwarded-Encrypted: i=1; AJvYcCWMwlGxf95eOsS6207noqfc0tB+vrImfX4hXNXzDxNGZR72dxFn9Ib4K6kDupUISPeizZOFBvejmu3W5oBG@vger.kernel.org
X-Gm-Message-State: AOJu0YzVJMgkYLLiOzza/bBPhUis0YkW7qQB5bcvFQ1HOgzn26N2m3zU
	FjptTAdesVPxhslJ4VyZDWZ/fS5SoIbxuHOcCFewA/3SZl2ngs8HYl29JN77gwuhFvueNxroC4G
	umv/GVCH3KTyBXy98nZTLFVOQCVJSjooq5jEKTItYUNVlMDc7L/TOuaOoI8wzHN9F/adlvfC9r9
	KL
X-Gm-Gg: AZuq6aL7+Ete5oMX7smgP/Aeo/rDpqVri0wPgcKtiaMqIix+7ttx8UTp5FLqDJFpQ/E
	CJ2Dl5PT/S+EIidHe162DWvjPDQS8vwVgrz+BcZs5/M7amu9VA8eEn0EcVZUIxJwAYP7s5hU05B
	RXit3mNVNHcm1ix9SjzuVZZZnH8TOAa7efXgNk5NUr22bZNXzvNeYrnCzxDBxmn7MnASBTWEy3X
	99YgpEnxAln4gBTLsCEeYTYhI12Z6s6AnNX9KGn0nuNGtjwuauZflXjvR+EtIs0Fx9otlmRIzYY
	XpAwxX+Bb9otqUUlupW7YqUppK93Kta6Dt2jT8f5XR2VqJ2TVe9jKSOAZlb4ZAmZETCOl2y68YG
	QtJIsf6oQl2KSGaJb8+vjzln7viiBKsKSltl120M+PE6Kgd/v0YEv9slyUTY32LfuDwo=
X-Received: by 2002:a05:6214:5e03:b0:894:979a:bf7d with SMTP id 6a1803df08f44-894dccc1b03mr1054826d6.6.1769603964580;
        Wed, 28 Jan 2026 04:39:24 -0800 (PST)
X-Received: by 2002:a05:6214:5e03:b0:894:979a:bf7d with SMTP id 6a1803df08f44-894dccc1b03mr1054486d6.6.1769603964029;
        Wed, 28 Jan 2026 04:39:24 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4452e98sm1498904a12.12.2026.01.28.04.39.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 04:39:23 -0800 (PST)
Message-ID: <5fcbfcef-5fb4-4d95-b75a-1c425d1c4183@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 13:39:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] pinctrl: qcom: Add SM6350 LPASS LPI TLMM
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
 <20260128-sm6350-lpi-tlmm-v1-3-36583f2a2a2a@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260128-sm6350-lpi-tlmm-v1-3-36583f2a2a2a@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEwNCBTYWx0ZWRfX32/Wzv6SBvZ7
 kohxMC63zx3YNfR+H/rQxx9tYuDoObLsvkuMremEzswcYgdi7NOIrQVtgPm8P34jR4oeKNfp7VI
 S0NQjdfwDVMwWIeKbURlt6Sk+Qwk/UUKIwOeFtpks4RYltUTPObuu+7MlEweXJi9zgF688ROh4a
 ofGT1KZR2fgjcJTh2qaeFJmDu1xCLbxQrFQEhVmsZd4922y0RzdEZssQVH/Yg/FV8MlzxzNE7QN
 ualpz2WwSoax1rJJeJkaR3SCBQrV+/BpwxtH1uCo9tGt64TLfF6P91LST/rmHk6OpnrlmFgZHtb
 rSlDzYPSSY0krI+eFUF3X6WvwN8jJaEQDcdLWLBgAGk4nQ3KwWuCWP4KVCnCc+aEHmXIdIxidiP
 wPWXSdFEFtQZJEfLCRWyqMgXHWGTPBBSlX+fY2kl0tGMucH977ISf+cFPhOp3CgRJl7WTlDREZh
 wek4udxr16vMALR76og==
X-Authority-Analysis: v=2.4 cv=GuxPO01C c=1 sm=1 tr=0 ts=697a037d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=FKLYIeIi5cSbgHY3oWEA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: u25fIHBrVha3i9IMBZ_YGhvjEYW6qyEq
X-Proofpoint-ORIG-GUID: u25fIHBrVha3i9IMBZ_YGhvjEYW6qyEq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280104
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-91016-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,fairphone.com:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B46B5A15B2
X-Rspamd-Action: no action

On 1/28/26 1:26 PM, Luca Weiss wrote:
> Add support for the pin controller block on SM6350 Low Power Island.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

[...]

> +static const struct lpi_pingroup sm6350_groups[] = {
> +	LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),
> +	LPI_PINGROUP(1, 2, swr_tx_data, qua_mi2s_ws, _, _),
> +	LPI_PINGROUP(2, 4, swr_tx_data, qua_mi2s_data, _, _),
> +	LPI_PINGROUP(3, 8, swr_rx_clk, qua_mi2s_data, _, _),
> +	LPI_PINGROUP(4, 10, swr_rx_data, qua_mi2s_data, _, _),
> +	LPI_PINGROUP(5, 12, swr_rx_data, _, qua_mi2s_data, _),
> +	LPI_PINGROUP(6, LPI_NO_SLEW, dmic1_clk, i2s1_clk, _,  _),
> +	LPI_PINGROUP(7, LPI_NO_SLEW, dmic1_data, i2s1_ws, _, _),
> +	LPI_PINGROUP(8, LPI_NO_SLEW, dmic2_clk, i2s1_data, _, _),
> +	LPI_PINGROUP(9, LPI_NO_SLEW, dmic2_data, i2s1_data, _, _),
> +	LPI_PINGROUP(10, 16, i2s2_clk, wsa_swr_clk, _, _),
> +	LPI_PINGROUP(11, 18, i2s2_ws, wsa_swr_data, _, _),
> +	LPI_PINGROUP(12, LPI_NO_SLEW, dmic3_clk, i2s2_data, _, _),
> +	LPI_PINGROUP(13, LPI_NO_SLEW, dmic3_data, i2s2_data, _, _),
> +	LPI_PINGROUP_SLEW_SPARE_1(14, 0, swr_tx_data, _, _, _),

Modulo this odd cookie, it's identical to 8250.. but then it messes with
all the definitions, so it makes sense to keep it separate

I verified all the functions and slew offsets


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

