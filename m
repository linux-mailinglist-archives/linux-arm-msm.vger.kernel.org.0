Return-Path: <linux-arm-msm+bounces-107591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIY5OHnDBWpMbAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:43:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3507541D21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 264B23021672
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 12:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D792C1594;
	Thu, 14 May 2026 12:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WTnpVJrS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iwJ90WVx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B953C0A00
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 12:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778762611; cv=none; b=ahl3yr5Qz9aD18xIPiKbJSicwSL6oFaPDRCPF9GmA7T5UdKZZ3/CtCQ4s1DyPRaZnRZ6G9FvskcZBxrdhxxHcwEZQQeq3t68WWznkAD198KpDI3ktoq/dJyIZ7scW5VRK+wH2APufGB/vIS/4N7NG7lIkPEOXGt14/x3s9lBJ0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778762611; c=relaxed/simple;
	bh=5WxmdUO3QYYjWtLbTWfcSXQWZpK2u4YbsYkn6Q0Qv8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E/olDB7l3B/ROYsU/E1P2KQtlMV68Yh6RnNMVAn/KWVb/S7usJYzqSltqjLYTgjp7sGfb6wmWVUxo3MtEpTVh7xmFpaViulrkrbs3U3V2XXcdH5mvTQkqUPEv8pOe1e4jP56tAnwtoMrfjQuPJLgRcbzDvOVTyL47i2FNQJZhZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WTnpVJrS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iwJ90WVx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeTrh889384
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 12:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EU8VqILiVkLUPw58TAFmECDvG2KNHo2DCKZDUVw7+FI=; b=WTnpVJrSxdmUwNhd
	6OnwELisSHFfwHwNb57jJAIMiM4R/w+Zisp/JAhJgSHJbksSZTLcRgXos6ymekCV
	La1pdg7stJ8GSN+wKtWR+ONa1eqf41tiNg9suNWeI3Uiio0ugBKLoNWtKrsbKd0m
	2Jo0wJIcXcF0gyr84Kgag3qloKqLV21+lJX1aRSXCAAL1MrD+tPYG1o6FgIfkwP5
	qyQxQ0zEp0oyN4Spc2hI+41KgIfKOhWcueMKjNDbHDIZGx/APouCxSZNz0sRmAgM
	y//yKVb5qRZYteVpEg0upBvCbObqpcYr3X/8QZqzFatGZSKgHBix5fgHzCNJ/vQ5
	hRJvYw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjkugt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 12:43:29 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56f6e373ba0so625555e0c.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 05:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778762609; x=1779367409; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EU8VqILiVkLUPw58TAFmECDvG2KNHo2DCKZDUVw7+FI=;
        b=iwJ90WVxTyiRoaLGwtuK9wA2i4iBDVSclXrT7ZzXBPN6otN80ahZzmmE3iQI1EprvB
         xlPAmPOStY5BO6v+iuyE0so5BA3GLOvQlBtmrlUpnruuqFyvtQsQFJKy6mdyWFVOhMHF
         K0Wx5i0qaFTPmDM199v6lhy3XxFdADz4hW4p9lg7+yX8LZewsDI+hFy9Csx69FqyBwfP
         lO9Pap4uPuSB1KhlUR2/Z6NRB/YDMa55c0zoa143De8eWO7KvrBsUWWfhU9xeISHBJAt
         tkdxeqp2nLc6/Tidue8O0QZVWEsb6BGaO69V7yd7LdPecJzU9VR92JeL5Y//xuX3ZD7K
         3xIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778762609; x=1779367409;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EU8VqILiVkLUPw58TAFmECDvG2KNHo2DCKZDUVw7+FI=;
        b=lmkP1wwzZwjtBdlzVCa0en6rfsSSFccsnEmcigrYcFqk3UJycYDe63HNtyzg+0k3qs
         giDjp7qaFENAX7KmKrD4OKiykUcOcYL4rPxB6wqIpWxwtHN52LKtdFNsglh18jzZO/3L
         aPxh2ec/lruR4F0abAKgkwBkMf9kcDpY5hED+LOZKRk7xSdlAJqDqC+f8553wGrVH5Zs
         SzJCOaAlMFaNImUwFEYxz07vyluB1xoZhaUZnhB/uRfxI4eugC88LpfwiQQGaqV3FsGO
         LtNz0FYOypWZUNLoQoItKGxbF4WYFNAY21thmyQlgbuTC/OPCxFs3bg6AVN0hVvpJ+em
         r26Q==
X-Forwarded-Encrypted: i=1; AFNElJ9T0i/VuOHfVLcbUEAGwQRQg7ICNgWzjzHHPREjj8zJ9FvALleVrWgsJegjazdmdCSvYfYzqKDS2Noq/MLO@vger.kernel.org
X-Gm-Message-State: AOJu0YyYRfQS/eVPiwcrY+1UPpxto6NDLik6BKIrKcMStSgty57xCcNa
	iQh5QEbZgvIBRBabcNvs3Qvvb9FYJBccyJDdEkg/Ft/tPI2KZHu5AEiRp9wpsbC98cBAIkoghhe
	1IDN6oaVf2i3E5xMc94QFmQzfeMvwGffodgaKMbZl7OTmant2A5isqDCQqkTW4pZDVkFn
X-Gm-Gg: Acq92OFI57i47Osg79povuwpoquVOb1H81gXBknrpxdVBnXDuXRoVp6OwZqXEqUVnBc
	A0I2v4VvNrvDDGBvkYt/UqvWvN58P3QmABdtqIdnFkJiJ2bhpv0IGeGgADfA3VLZSjgnJmLXSI+
	r2/7mCAzikIZw5ecgYVkUsSprorIyJiQY2mOUffXWY/QL6HWoMDO9a4I3h6rcau3ofZuZ3q4it9
	R/GdQ0o+GNp8Sxh52mf//AiNThez9kGaFEKE2D0Cl+sqKgmWJ8kJve5ti7v8542rDEEmqQ20rhW
	8VwswCRfe5dQbWQMPuu2s1mtaUqC8kt6vYiN9B55N0LmexTkFVi8P4/HaIG+b8FqbtViJk+T3PG
	EV3c1i9eP7irNerbIeYYGlTyWtuyHBG8TAcXFQWo7GHNwJtpU7xHkRZNr0oKQ+pHbrRDlQQeOuq
	zra2w=
X-Received: by 2002:a05:6102:2255:b0:632:509b:e399 with SMTP id ada2fe7eead31-6377454e62emr1205257137.3.1778762608392;
        Thu, 14 May 2026 05:43:28 -0700 (PDT)
X-Received: by 2002:a05:6102:2255:b0:632:509b:e399 with SMTP id ada2fe7eead31-6377454e62emr1205248137.3.1778762607958;
        Thu, 14 May 2026 05:43:27 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4de6f1dsm86629066b.31.2026.05.14.05.43.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 05:43:26 -0700 (PDT)
Message-ID: <14a2fbfd-97c1-4ba7-aa51-a07134102d3b@oss.qualcomm.com>
Date: Thu, 14 May 2026 14:43:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] arm64: dts: qcom: Add GPU support for Kaanapali
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-5-13e1c07c2050@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260512-kaana-gpu-dt-v1-5-13e1c07c2050@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Nd0lkLWAZdEvZkTuaN2FkxH8GIYb3MCN
X-Proofpoint-ORIG-GUID: Nd0lkLWAZdEvZkTuaN2FkxH8GIYb3MCN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEyNyBTYWx0ZWRfX1ZA2bnliSoFm
 awo01mTlaadNeXzOlPhKsIhZzhCADqVKY4S899VyFVokbOKfN6BB72l9ksXyrilniOuEuD7HhYy
 ntHmktQvBs4kD6FYwIgkwf4ZC0rixfGP1Yw7vhWhDNuoFI+Lya/uH3DiUQXbNNcCp8dcLF7nZWh
 09/4MekNtt5MlY7YdiPER17EvDv+CKguoeLQemn0fuggRDo5JhnhIQURLPrDPjtR6cgq9GK76qx
 Vkd3G8Nw6J7p11ADx0nzMcPHE9Gf/4dMyEPlH7qGDw0ZePgOdu4T5KJW4n1ItfinxTlJJExFwdD
 o9Dn0XVwa3phUwdvY0M4M3dbmJB3nZsmqNg/cVbUZtxW+zPdiNtgQS5+FOhG2qtUGOfq3mUkwIc
 zDKcn6ZkCr7uzyXvdjov0C1OGXWMmKH9ps67kap0vTusTnWFTf/ZVl0kkLIAfT1DblPUHT+hjTa
 FpOAAwJ74Rka9sgKPcw==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a05c371 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=pN7wo_Rnn8_v9tKSZuAA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140127
X-Rspamd-Queue-Id: A3507541D21
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107591-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,arm.com,8bytes.org,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Action: no action

On 5/12/26 12:23 AM, Akhil P Oommen wrote:
> Adreno 840 present in Kaanapali SoC is the second generation GPU in
> A8x family. It is based on the new slice architecture with 3 slices,
> higher GMEM/caches etc.
> 
> There is some re-arrangement in the reglist to properly cover maximum
> register region. Other than this, the DT description is mostly similar
> to the existing chipsets except the OPP tables.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +			gpu_opp_table: opp-table {
> +				compatible = "operating-points-v2-adreno",
> +					     "operating-points-v2";
> +
> +				opp-222000000 {
> +					opp-hz = /bits/ 64 <222000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
> +					opp-peak-kBps = <2136718>;
> +					opp-supported-hw = <0x0f>;
> +					/* ACD is disabled */
> +				};

The clock plan also has a 160 MHz OPP @ LOWSVS_D3 and there's a couple of
interim OPPs that you have that aren't part of it (but maybe you have
better docs)

Otherwise lgtm but the size of the GPU region and the GMU base look
slightly confusing when I'm comparing them against the reg map

Konrad

