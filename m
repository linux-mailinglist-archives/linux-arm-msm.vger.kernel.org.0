Return-Path: <linux-arm-msm+bounces-66055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 209C7B0D7F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 13:12:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C4E9165462
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 11:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5562028C2C4;
	Tue, 22 Jul 2025 11:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kuDjK8lV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E034028B4EF
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 11:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753182728; cv=none; b=drAwiMC0NTSoDs67SE75Mr6Ckq6d9wjNZJJ+EghnxlKGCEUw+ZsY07b/cVqLt+eN5NjE6YQpP3n/T9SqAAi8KEfUs0EwnWjmcINFaKMpgemMyLtds6AhDx1rfiL4QcZ44KU30elgPdoJMg9Dg+56/X81I/10FWmDldVJ2vjYd10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753182728; c=relaxed/simple;
	bh=AdS/HEGQYIwXAPgGKh/dj7/4HJqP4YWiQMnvmpzNaGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JBNujKx4roZcdruEShuXL86POozcDvskMB6pXWK1geSu7nJkHSTKdc1HTLR1yg08Qf5da6JVNSAtZNMS7V0B1vMcFcHSSoEecuu/Cn0P1s4CnpGjw1HVUWqUlQKjx2WqlP76vuW6TDagnNb9+vr6HcMhSiCDGqnM4GOXCpTIRHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kuDjK8lV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7WdlK009366
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 11:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lp9oCAfC0uqs28+yLNSlWvHOEvpNJYHHvb1kBs8yoFw=; b=kuDjK8lVrMQ29mM2
	NnvkBJtssHyZ940GjxnoRNMKZIaxrrUx8OXjNq0M/7BtxrF5bJvbBeYk6ggjByLo
	PwzeE6UzPYbeH2HjAjXIWWUlV2lGbdSN2XiTlUTL9IgR/r9Zn7QKGAkBaD9K5lyN
	RIKWxENkALQGIO+ipEuOmfCiHWx3pFg+M73KWyqTq/Rz26jIV2vpsG6lgUxrkti2
	Lh3UHvoSbhksgHnFKlfDBWl+tzn/5QD0hSvpBlrkZIXA2MLcqD25MBwTkjLj/obA
	SmTVTcuY9IMCN16lD/Tackv2Syvpf+s7q0WFRV6BqDaEkCr62XhpKPUTbzRoxzuf
	HnrRrQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045vyj1d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 11:12:05 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fae04a3769so523136d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 04:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753182724; x=1753787524;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lp9oCAfC0uqs28+yLNSlWvHOEvpNJYHHvb1kBs8yoFw=;
        b=KlT7htNQdgrjaBvJOvvBUf5WkFetts0ZYmJnPPb9qGa+WiUDN8Ha9k8n1n7hFbZ3UJ
         OMamTYL0Jx0l1o5rXPGl7E8NtQ0Era1d0dFWQOkmNO2W3NPL1OILBHXnTPDmk/l85rCK
         NzB1GTGrvrjcylZ2nGF2ZZUVOBM7VFgG+8G7rU+Kitrb1HxLMuv8EwYdmLDVhlNg655N
         CWuMK7exfWAySOf7ZhjpOOQxrpOwV4/50jCBChnK95DVUiuI+DvT9dCDRawnWoBDGwLw
         YkkEHh/xJW26hbiix66vwrgotlmqmY+LNpSw1C2B+b2G+lfXMyI7/u1ZnBhCN2r5DETk
         AhBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKPOzsWFujrB8Lqlc3wpzOMO7snC2zAZxNka/MEqko+INGji+BR7izlSQMF6tIvKDpW+YiGPKL9xH6CowN@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz8dgpO/MWQTGQHjQMXTAZZcOua5wRbK1RsqRcTsfDG0rClGM+
	U2QnJEbArJ7ZSq0hs5KRuZ3AxN7+gpVQ2U3xA3ZL5JmrkxQQww/jPlZNarkCsVtA+PnPr1zrNFd
	srwT3OChHN9y5Wf9SZTSxF4VwtdyK++z6TXld4ILmDAdBLjIOLxafNHsHdmSTu2WMODjM
X-Gm-Gg: ASbGncvdKeoz+WH2r3UjvDb1DWngdJOfwobPmDguS5B6OunO3O6uUO2w5Nmxgso/2Ao
	RileawVWdciQkSD4mZ2sxKpZdreGAUZROCQLotCFQ2NfLLDE+E5cM3/gwBO6pc1dupl5hoK7AFK
	6usfzWzE7fyOdvlYN3auLY+n8DrAjz4+BzAVIGDHrUR/TFfWhervgwdskNcx0gZD/7LfxZ6UQB0
	R74wiXje1kw7Vt7GuCoF3GbwmED4koiYIcnxCSaTk3kW1Hsi1c1FSgPJh5Ubwku+salmS071hxd
	RRzgNa4CxLCzHPFw+gLeiBOJIiLfJg5KWyf5QJTyXT58eNpetatUWP5cBawPMyyu4NlcyZyK4ao
	akrvnFt1byi2mtwGit5gG
X-Received: by 2002:a05:620a:4894:b0:7e3:2c3a:aac5 with SMTP id af79cd13be357-7e342b70ea4mr1315162785a.12.1753182724464;
        Tue, 22 Jul 2025 04:12:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsVndy6GfF1/rbOfATVToveGOqPm5CxByBr7sl2oaOgD0x8vxoWl1Wqyb/DMzWWuenDTrgHg==
X-Received: by 2002:a05:620a:4894:b0:7e3:2c3a:aac5 with SMTP id af79cd13be357-7e342b70ea4mr1315159785a.12.1753182723749;
        Tue, 22 Jul 2025 04:12:03 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c8f36f96sm6863713a12.23.2025.07.22.04.12.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 04:12:02 -0700 (PDT)
Message-ID: <41dda9bd-12c8-485a-a6d0-69d040d724cd@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 13:11:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] nvmem: qcom-spmi-sdam: Migrate to
 devm_spmi_subdevice_alloc_and_add()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        sboyd@kernel.org
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
        andy@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
        srini@kernel.org, vkoul@kernel.org, kishon@kernel.org, sre@kernel.org,
        krzysztof.kozlowski@linaro.org, u.kleine-koenig@baylibre.com,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-pm@vger.kernel.org, kernel@collabora.com, wenst@chromium.org,
        casey.connolly@linaro.org
References: <20250722101317.76729-1-angelogioacchino.delregno@collabora.com>
 <20250722101317.76729-3-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250722101317.76729-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LL1mQIW9 c=1 sm=1 tr=0 ts=687f7205 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=Y_nGuXgBD960inqFf4MA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: H-sOKZS7nZu4XcEHnGSR2U10KWhMUUQ0
X-Proofpoint-ORIG-GUID: H-sOKZS7nZu4XcEHnGSR2U10KWhMUUQ0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA5MSBTYWx0ZWRfX9AtiMOF6s8L4
 pEYk5JvIvTdr9CvaNKNV2o62TnCaRg/p9VlbO756YYZQlQCpJ/w+WQDyGNPS6EXaifclsnEvQxE
 acOmvxqF1hWeyhXP1uv8UQcVl+fhA7YIwTQgbDlfgNVghC0FCfKRuJqn/b/Jn302lluR3/yNoci
 Q9t/ePW+BwwFZW+XDcO90EYv1CYrOMYdj4qRLVzhycqlwAlg1HpL+O06NsKIOtvOyFLqD9wiEum
 H/pTAUA7QO9TnVQmqpj1ocUNRzn/A6exa0uKPHXGmXSN/sAK2CjvIJQYT6vp9bo9fMOxyD3PQvR
 M7z9x1rCmglAjl+luET73kDaR3ZguAyAuLkI19g6Ex4cigMA6it71uXEADjhMbI1UI6qDYDr0Rb
 yjeX1ACRMunDfVtUWHUy15i9sdSMPRiFy00GEx358AZhc0mZVZTYOEoDwg9uSZ6TlUBfNh0L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=753 clxscore=1015 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220091

On 7/22/25 12:13 PM, AngeloGioacchino Del Regno wrote:
> Some Qualcomm PMICs integrate a SDAM device, internally located in
> a specific address range reachable through SPMI communication.
> 
> Instead of using the parent SPMI device (the main PMIC) as a kind
> of syscon in this driver, register a new SPMI sub-device for SDAM
> and initialize its own regmap with this sub-device's specific base
> address, retrieved from the devicetree.
> 
> This allows to stop manually adding the register base address to
> every R/W call in this driver, as this can be, and is now, handled
> by the regmap API instead.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

