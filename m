Return-Path: <linux-arm-msm+bounces-49273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC6AA43BD3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 11:36:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9663D18870EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 10:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52E8B1E1020;
	Tue, 25 Feb 2025 10:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cpfk4PGt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05361C8634
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 10:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740479459; cv=none; b=NyTMghI634ir58X/trVhj9NafYBFk87LDX0Skvd0rTNap4hIfg+D9LC7ETgao1K3pcLJBnv8SnAUcb0Wx+nKYU6IhzECDhyU8JVGv/tZobFtgN+Jd9A2TjAnTo3OHJxo0D/+ovPdUFG9lppITGPshwDOMC+O0HsHj5+b3flFLuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740479459; c=relaxed/simple;
	bh=twBjVGnJahxmvhFhjvSn5Su3hptRGwOQitAeV2FWUfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QdrNk6v8vpENwyntdOqaiyXpca7dFNjrC2pZoaIlaOoIU11k+Y9QB0bp8+6dEYJMwXQrWQe1n7/vOmNUq9lCPakCAKyMYKbpIP/FDK758fBFhX4zj9uctL594min+Xnts/OlIqQ6MO9HA2I/ni/aRAoWSxBrRQhzkbaO6mKlcUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cpfk4PGt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P8T6LX014309
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 10:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WqnuvYu4WPEc+kz1zfJCPmfGzlIVxlgiv6jIgV5NH1A=; b=cpfk4PGtEspcdglF
	vZ6iumE9YdGZOGpA3IenOsl1dcrN9EuKZhFGKmxaS2icOsxkcJ6RWQYz7Om+PONr
	nr1DOVDk8gItqoi1f5XsuwJVGF3fKT7FPFtNEn83dxZ1Ho7tKhF2donc3zCXPqYF
	ARivm/I9uXNim57p/XrHvwwKLuUpVKJIEmeUDEjDZwpJmA9q1JZWHWu7SrDOUWJ5
	2BJeO3k57M6cePjK9qYSlXGjo+PgTerKI5naKtEgHmbcZHURS/61UWylR0bsdTPo
	LsbKujed3a3/G0WG155HqoPtn1820MIncjwTWsbD7F5CFCtMe1o9Gsc3DGEjVZbq
	Za+xmQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y5wgrkyj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 10:30:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e67ac0f122so9476766d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 02:30:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740479456; x=1741084256;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WqnuvYu4WPEc+kz1zfJCPmfGzlIVxlgiv6jIgV5NH1A=;
        b=QmZQFizMZ8nuYQxwJC0SgCfazKjm1wmhwsHfcVsze5wTCP2eLimE8ydQLawp/5mSTG
         8lsJE1311KU4klVWRnGYf2w0Kd35p5/xSvQeycsMpX4BMKGceZrKW2lN1sMD/+PQv8Mx
         wuf/2rSODR1NdnT555Gy8PPju4RVsaQSxMMQKOlQJV+5lFBc+2hAvV/VzPQZbNbwTyAL
         TWnL7RhuSWSCDaJN4SG7jFK71ip/j7LMaBDSgxKHL45t7PArpLdjiS0qAFObWi9qG0QX
         MdYAmuCrlD+Ecf4QtWzRenG+CEGX2UNYRZPfkQIM7N4T71uC5qoebk728G8I3AQSJhhj
         mVvA==
X-Gm-Message-State: AOJu0YxEU5IR2ZmbcN31qEFaJJBLlZPA/TH9qxryCCV9PjGlaKcaJQE9
	PAPC2g5uknTXyFfIzOqOELGI2yiUAd4h3y2BFGPZv5RC9lYKM/G4feJNtVU2ewAcFIMjM6lhS/k
	54nKtCc/++2tKOD8mZALpRG4+L6zA+4dJhQZRRGeJlYC06e1ii+2KLieQDOMOG4g6
X-Gm-Gg: ASbGncv6os7zgC5XzfwcQ2xXs6IuTeO/u3s+aYDjn/VF/KtIfmDcayJc1K1SzS7sh+G
	aHkuiE2/e0JWRYFahpNnAewFVHsnpcSOvo86r2PDh3lMesacmHtG4G/tlEMhIp6u+Kh8nNsvj0e
	PjuWAb5SWBW4wiSLKWLktnKd6nMOsLkOBBdkb+RhF4i6iPyeBwPsNPvy+1uq/g8apc7o4DZ33y4
	y5kRryu1qupNEOKY3jFKom5yrSixw33NMN+5nqwiXE0jsDRxVbeICy1ObcteCeIS43/W7TSIfDA
	U02XMolpA8ICWgrVdwel1GA7tP9d5LVkoh7iu4IddPGOw5bLAICaRCVFCelyBtubRx4RuA==
X-Received: by 2002:a05:6214:518a:b0:6e4:449c:ab1d with SMTP id 6a1803df08f44-6e6ae7d9245mr81553996d6.2.1740479455575;
        Tue, 25 Feb 2025 02:30:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmB4rwyEg0+JyqJXur2Jj93wuFcgD3awq8KLQERo2qnyPuDfhN13XtvsewtYpx1f1krix3DQ==
X-Received: by 2002:a05:6214:518a:b0:6e4:449c:ab1d with SMTP id 6a1803df08f44-6e6ae7d9245mr81553766d6.2.1740479455155;
        Tue, 25 Feb 2025 02:30:55 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1cd5fc8sm118472866b.5.2025.02.25.02.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 02:30:54 -0800 (PST)
Message-ID: <94e3efff-44c5-4be2-9600-f05732e38637@oss.qualcomm.com>
Date: Tue, 25 Feb 2025 11:30:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/13] arm: dts: qcom: Switch to undeprecated
 qcom,calibration-variant
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250225-dts-qcom-wifi-calibration-v1-0-347e9c72dcfc@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250225-dts-qcom-wifi-calibration-v1-0-347e9c72dcfc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: V3RjYAOyVE0C2NulUS4Z-6t16AKALVA4
X-Proofpoint-ORIG-GUID: V3RjYAOyVE0C2NulUS4Z-6t16AKALVA4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_03,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 phishscore=0 mlxlogscore=940 spamscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502250073

On 25.02.2025 10:58 AM, Krzysztof Kozlowski wrote:
> Dependency
> ==========
> RFC, because this should be merged release after driver support is
> merged:
> https://lore.kernel.org/linux-devicetree/20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org/T/#t
> 
> Change will affect out of tree users, like other projects, of this DTS.

That's a good cleanup, too bad nobody thought of that before

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

