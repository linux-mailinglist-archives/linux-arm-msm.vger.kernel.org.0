Return-Path: <linux-arm-msm+bounces-67006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63534B14E6A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 15:32:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34FEA3B995E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 13:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B910617A2E0;
	Tue, 29 Jul 2025 13:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jpnWDldJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA3B10A1E
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 13:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753795931; cv=none; b=UcRk5LYa+fOUYVpDGI7g55+Gmk/LB+Ppc/2VztYkhX7wx+GAGzXfXAG4QWF/HxAGeKiKMzxDh+CcGHDMznlO6HsXkwNjEB/v7BkepqBeUZWS59aGb/fgmdt5zmxexsI0lWiqNUJceOivg+qyrr+vphnfVumQpE1izCTPPvfmFIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753795931; c=relaxed/simple;
	bh=8Ft2D/+C4yivVVIIj7XXHB6bdiwQxNYGInng8jnYwyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RJCcup1VZisB9++xfKfB7Hsc96gEbb+a4l0G785ruZTqI7kpHhJZPeq+EH1xGPmmB1AdcjT1jJ3M1uk9CqIjKqLK1ounRJa/ETF7wW9XBDAzZyfVny1Ldg2qWvhsAwTsAi/LpyysWDX9xhHTFPf5RQ9w55c6T8pkmX1b2BxvNII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jpnWDldJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T9BIi8017611
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 13:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rxf3Nnt90oOV5L8CNTt+oQ9ToPCocW8enMiasd1MNto=; b=jpnWDldJ9rk8DHmw
	ADBKBxby2tR09BvFzV5peoYbLgDHaxu1NVUEEVdOAODl8IAqMUWC2G60HthJ6vYG
	/ShgPqyY0SRQrqoJR6iTJkSy5K6anl7cHdIY+ORJWlCLcbUMIdNs9lT3m3By5yus
	u47vk/XSzMKMbBaW40Kp67l5Ddt9no3/5HqKysSgsVFxTIVo6h5QhHjr35ZoURBR
	T/s9WgeCN6sArXuSaSlJkBWjlnp+VV9T45FvpHWJvuSYldnMb/JI5im96jwCtbro
	SAGkx6TbuYH+HHC2q/xV/ileXpfqBo2+FaMlVhJU5KeHaDniMB1dgpL3PyPz4Krb
	Q1vDMg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484p1ag6nc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 13:32:09 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b42099903c3so124947a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 06:32:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753795928; x=1754400728;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rxf3Nnt90oOV5L8CNTt+oQ9ToPCocW8enMiasd1MNto=;
        b=atHq17jAmRXWSWUXSuBt0HIGisK753Wox8iUR1Qzk/A3cj780RFivwxbup9GKgIxKq
         40HjTyxmTpCZDML/2wj8KSi+SzuD88e91cxS6gsbUYC4emKkorGqLzX2uYXYhZVF327X
         d5qRs3HP+CiRD5TqprwQDgNrZ7p6OqDAMK3KDYB4BYKbGGMxNf+S8qVvuFykCJbW7jJH
         jvEaUa4q1tXVqSU88KKUZqYiuelgMeA9t0zDvaos1I0n5GwDmseaSGpx6ZNhbss/9kIM
         y7GtMqkpXZb7hVQ+x7uYdfA6GxRLZBE/BWa6CA+Xudv3wL85118kCwl1So/FM9iNPOcL
         zrpA==
X-Gm-Message-State: AOJu0Yw0L+2/3vl6NN2Z3EKp9mIamSpwOxFC4gJK/azXZ55LdkeBVgVF
	dzRxuu819BeZ0jXfyvbelgyWQ1TvVdQ2UkXk58YyhFA2qz0V2Div284nJkCEn7Y6gGw1Sukl3CL
	/d5a0n0p0zACjY3SDV2XKv046e1XVut5PNFupMTVPzw70tKFTrz0zTFJBUQBxkrZTPGZK
X-Gm-Gg: ASbGncutvgjKakKxTbeVJnXf+R0XPpNRvIj5zV1nc/ovFg0jSnOM4Txi9QH+NOeSz/z
	GzQ9LUUgxX7p9asUpEzpQQcet3yl0uBw7wEDVVXHNsEZKMHbwHgMZyFXBHs3ZwXvSptjH12E78N
	4vgQpMsI8RK9Ao2MOY7+QOxp/GZ3Is/Rvp8V1+lBiUO1B6LXTUGxcnNXnSS5IjtS/hDi6lpO7AS
	t2AKvjnMKB3j3CsWfwf4RpYT9OlyRv5iQR395iMVNn9GK6UKgTr0nWui8M9tx8qx0faKNmquGRe
	7SUH3kDX2mCNS4lUXCyB0E3hgXrSlDj7wPJbpH8zY3vjlUXux+fLFOspkc60FBI/Tnt/8k5dBLu
	53RhbXg4urKewaaIX6Q==
X-Received: by 2002:a05:6a21:4603:b0:235:6606:6840 with SMTP id adf61e73a8af0-23d701797efmr10497064637.6.1753795927887;
        Tue, 29 Jul 2025 06:32:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGppZH4tBm0B0ZjZxNPeIr5Ha36dgu+n0hmG3OmQx2BO7yLnrEJlDf1YuOvKQHgy5pzupLEDg==
X-Received: by 2002:a05:6a21:4603:b0:235:6606:6840 with SMTP id adf61e73a8af0-23d701797efmr10497026637.6.1753795927390;
        Tue, 29 Jul 2025 06:32:07 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af8f62b27a1sm19823066b.54.2025.07.29.06.32.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 06:32:05 -0700 (PDT)
Message-ID: <8dca591d-0a4e-43ee-903a-7a6dccff9250@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 15:32:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] arm64: dts: qcom: sa8775p: remove aux clock from
 pcie phy
To: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jingoohan1@gmail.com, mani@kernel.org,
        lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com,
        johan+linaro@kernel.org, vkoul@kernel.org, kishon@kernel.org,
        neil.armstrong@linaro.org, abel.vesa@linaro.org, kw@linux.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-phy@lists.infradead.org, qiang.yu@oss.qualcomm.com,
        quic_krichai@quicinc.com, quic_vbadigan@quicinc.com
References: <20250725102231.3608298-1-ziyue.zhang@oss.qualcomm.com>
 <20250725102231.3608298-3-ziyue.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250725102231.3608298-3-ziyue.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lu_poGfXTU9h1WvNWTX-U_6935bxHwgJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDEwMyBTYWx0ZWRfX54x9iEvNIKxB
 kAc9OWvUnnMja7KzbSRTbzdh9Wzr8S4FZb3CuM665qv/bc2k9YhIG5GIM04NG26PzVq50zEM5Tc
 XHPF2tPo8yr5tRZgHaBHFs7VPO3z2uYst25t6B7gawLJQmEjY6UcfM+3Hpesq9gshFS3MIvG95U
 QG/Y6niHNVfuQt0JOn9o7d2dCB/rJFfeT7PjwYJzMILJnw2OPdOEOjBtQ3C+2MpwdOOWFSgBWCx
 CNqDSwH2cYZb9yBs9pWI/t8JvH1hI44/qxEXcdAQ7BGah2M+QaYRiLwwX6CNe0K2G4vPDnSZsWH
 ZnwUgRpI0pZikXtYO3IXfm/Gwdmr2Vi4dtTh8JQNeNgPOfeO8vzo8pPEsgfsItlT3dJmJVd1kEG
 81Lh3ft0g/OqOY2sEf/ulb2FZpJndYCI4iU2K5eZ5cVn3zp2eb8PDmFdkh+OfshJJBi1p6nF
X-Proofpoint-GUID: lu_poGfXTU9h1WvNWTX-U_6935bxHwgJ
X-Authority-Analysis: v=2.4 cv=KtNN2XWN c=1 sm=1 tr=0 ts=6888cd59 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=8Yr4R-HfXjpLVZqX0moA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=972 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290103

On 7/25/25 12:22 PM, Ziyue Zhang wrote:
> The gcc_aux_clk is used by the PCIe Root Complex (RC) and is not required
> by the PHY. The correct clock for the PHY is gcc_phy_aux_clk, which this
> patch uses to replace the incorrect reference.
> 
> The distinction between AUX_CLK and PHY_AUX_CLK is important: AUX_CLK is
> typically used by the controller, while PHY_AUX_CLK is required by certain
> PHYs—particularly Gen4 QMP PHYs—for internal operations such as clock
> gating and power management. Some non-Gen4 Qualcomm PHYs also use
> PHY_AUX_CLK, but they do not require AUX_CLK.
> 
> This change ensures proper clock configuration and avoids unnecessary
> dependencies.
> 
> Signed-off-by: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

