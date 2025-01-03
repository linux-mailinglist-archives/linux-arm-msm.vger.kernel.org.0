Return-Path: <linux-arm-msm+bounces-43886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA9CA00972
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 13:44:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FB261884971
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 12:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E84C51F941D;
	Fri,  3 Jan 2025 12:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DVt6xO+q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320D91F9ECF
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jan 2025 12:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735908287; cv=none; b=p4a92TpqOCehv41WR+YKNUpe1LrPQ9bZG/3kyqiVEf8N9XSlKIcPnY3o9gSn21sEumVnrGJQxYuj+wsmHCf+wPZksArSDzSfHQ8ToICZQPOPuHfyd55TnYSQZL52qgIjDjBFTgNg/xJy0a8FAKJi/sp/IXrvRte1PtJNM/SuW64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735908287; c=relaxed/simple;
	bh=OJsVQnBI822a5hWWy/C8hSW5XLLPZ80RcrW4Lx7Rjnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ihBCKJIHpnBGnRKgZvZdWqwCDtEN254e+G5JZonQDLkNCOzuKNQr506bclT0Dj5JGTgVmGXoO4HTBWtI8VD23/k0z2yx6pF7B9WxBqcuor2pOXzCRtpGmGmp6f95dKMk7o5ItgnzFYFtb1fytHSbUD74yRfHmm5rymvsFJDXHfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DVt6xO+q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 503BuF2t017583
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jan 2025 12:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iib3XxU147/JFyS85vFiFRwwDL4ry9lkMvgUWQP+oCk=; b=DVt6xO+qcsROUcQK
	V+1JwzpsFPUsujIlzQ+n5YmaAaf4CD3DtdPGhhK0Fsd0r6yBCJGuHVAJ1QKn40nU
	ciCtLLNOU+oOaf5fkVrfjdHSxJobNzq1SSlEIj+awigRLQPZoZPWszOKGpWTA1Bg
	RU2gb4G+IKOsUM6dxhlWNtfREJlBKrLZPZWCEwOvlqNL9+e1FdHy09ZMjgzN/MIm
	3pu495BllScpdiJJyh2obgyandcKKNPjHpi8CVj/Scr75lRXBXs8gc0u0gl/UQJN
	P+R0CGcOQ2x6MxM5Exarr7U7o1Z9vkHrjq4eHybGnddQHuKqWiXBVYkVJ7/9YoA8
	vbDx7A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xfex02ng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 12:44:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4679fb949e8so29071961cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 04:44:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735908283; x=1736513083;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iib3XxU147/JFyS85vFiFRwwDL4ry9lkMvgUWQP+oCk=;
        b=peDnDinFQbRSS4w1YZHDxMQ5iCAslBwnNBSG4Q+I3+ZFcwntNUZE367ZXo+W4s0AgC
         rI3ZP+w/xQfcSbRy9/Pcw+JR33x8t9QoGenvYLEBggRUvc0hQpNhLsXZejlFmF95pv9D
         gUflLRhX/GT2AXZZ1vNeGFAt8pkOBGW9AhVn/6qC0T8gOwVzHmFv7gIHoj8F6OSAUenM
         1EtapP9dbwJRQdX5BO+JTs6C2JI4g3EPot2FBvGjos13TMP3K2rDOrd7rgaihpd1yVGo
         v5727XlZqsPVU4NUNt4T56biGl808K8Cf/rguIWv3jBerSrSfsVoLNtKr5aZ/OFdr/9+
         qUkw==
X-Forwarded-Encrypted: i=1; AJvYcCX1hwsThE+iCFwzuDXmMzjLo0yB2c/lWo3i9nzEqFIDS4dYjYeIpnhGE5VO2dW86ah8LCzUkmedsxEJnXzK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz56OXkIGxW3gUhL34KsXnY3Zb6t66rTCdQ37+OOr2WTSJy5Szq
	d7rKa4uWVJxKqJaxmbMrD+yBOhgKMgpoej4tEyG9dUghvmGkuYpY0EpseESs47pmUTgc11qWEhd
	goKvlr6lLuwPHK1DqdVbLLQRuWndR8vatHKzfXykAeGUvDIEceMIcxnBFOxHhwzmT
X-Gm-Gg: ASbGnct9sSW57S+8z2twwGp2fYFGCTBGzMca03BiRdTyWBDr901ZqlKRJV6P7msXcWn
	IyMEr9XVhvq7K2y/LG4LhEVYjUskAthtNd36GK2Zm+1M91DRA4iI/ooX26ctHOcJnqLbz75TgrG
	d9n2+nT48At6K20okmRHm9A0aEtGzcWN1fouI8n2Mn13Cv7d43snbjtuju8hD+VeBdas129fprM
	yRJ55Rk8WrdnNrOWrxyhyDw5g4dq0ALJ/2ikpH/kZUNpXDmOr7LxDeO/XXa7piUuKqlCdguAosr
	cpu67ktvGXa1edHoObOK1oNFySXAQ/tKfKc=
X-Received: by 2002:a05:6214:3213:b0:6d8:8d30:d4b0 with SMTP id 6a1803df08f44-6dd230ce2fdmr293603946d6.0.1735908282957;
        Fri, 03 Jan 2025 04:44:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpStx9xvQ/rcilMyiMCgBeLkKdpFPcBJ+ximdKE4jHQcparrmjurhZaQEpJKWhkAcrm7qWkA==
X-Received: by 2002:a05:6214:3213:b0:6d8:8d30:d4b0 with SMTP id 6a1803df08f44-6dd230ce2fdmr293603796d6.0.1735908282598;
        Fri, 03 Jan 2025 04:44:42 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f070a7bsm1882834266b.201.2025.01.03.04.44.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 04:44:42 -0800 (PST)
Message-ID: <770b35b7-27c0-4b55-af85-9d6170d43102@oss.qualcomm.com>
Date: Fri, 3 Jan 2025 13:44:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: Add coresight node for SM8650
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250103-sm8650-cs-dt-v3-1-759a3f6a3cc8@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250103-sm8650-cs-dt-v3-1-759a3f6a3cc8@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FWl7b8MCbf3FX9xiWBmZSVdrNGHwE7rS
X-Proofpoint-ORIG-GUID: FWl7b8MCbf3FX9xiWBmZSVdrNGHwE7rS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 clxscore=1015 mlxscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=809
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501030112

On 3.01.2025 12:27 PM, Yuanfang Zhang wrote:
> Add coresight components: Funnel, ETE and ETF for SM8650.
> 
> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> ---

[...]

> +
> +		funnel@13810000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +
> +			reg = <0x0 0x13810000 0x0 0x1000>;

This now looks good, please just re-sort these nodes (by address instead
of adding them at the end).

Also, did you give this patch a try on a production-fused device?

Konrad

