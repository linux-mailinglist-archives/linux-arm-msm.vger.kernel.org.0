Return-Path: <linux-arm-msm+bounces-78318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 833E8BFB987
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 13:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C638E19A8111
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 11:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3839F331A51;
	Wed, 22 Oct 2025 11:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BTXtd+nN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED853164AF
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 11:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761131964; cv=none; b=ZRh9Q3hwU0ikA7o/70+QY68Bym0mGkz6wnVHhTmKwM6CStpB7gMnchQQBzLZGBWPoPZVzyNlVh8/gaDLJfm1GzYQ8xn2cjtjxiqrdZXyR/rEmL0bBO55/ObR6K/KITH0f07ZkmCdQSAE6Ox1QkgoqL6xRmXHOanr+qb21CrkK3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761131964; c=relaxed/simple;
	bh=/ZFit2eOHNjEEsjBju9zb4SqZsQdMWbQEVyan6gONAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RwXM6ZjleVRUmrlNsKoP0YYFVTJqa8FHsol5gloeaVm34ndqFPfdDBBezVfrg+Ni5Vh43LkOK1zBG/RCGa+9noqvFmcEPV0OhhrA727RpQ3Cn1D7ia723B33txrrz3RYlREWOu2DMciPInAaokBQ0XjZiMFZGtFff7q1POIm54k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BTXtd+nN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MA9NUG002534
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 11:19:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ZFit2eOHNjEEsjBju9zb4SqZsQdMWbQEVyan6gONAc=; b=BTXtd+nNVNpr1wMx
	klsf0O0myoX/Eh7pgTzydU9l6B7RNlKHy1Vv80wlAlf5KbO5TAGkUotzYZ5vIPxA
	5JkoqWydGseevMrTmvw7WZQb2zNcyxziwNa9EQwjcSoXawVJq7laeG38d/OSLP/V
	4Gz5tvrBQLRciqMMyebjJTAi4MvFOQSj07bNy4lkEQnYQ84+BEN06bFRYcmV0A9o
	heBHEHHdeF6sRbd6vJSiPYfJElyS8aP3Ba7IIMzfrpX4IdZwPa1yfkxhm1E+Xl28
	BqamLE3BBEbqUHHdFE/NOqFwTJuCLaizgifVSpljn1uxSxNSNEbqeEWXBXF1mBuu
	jXCDLA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08wa1nf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 11:19:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e886630291so3001701cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 04:19:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761131961; x=1761736761;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZFit2eOHNjEEsjBju9zb4SqZsQdMWbQEVyan6gONAc=;
        b=KJhWq1n+zLFuVXNi1gvJGi76BQ5dY8wLU4u2OuG4Bt9mGn7H0nJfYLOmReMylpqRbs
         oHkHoCcRK02S2704eKNuDhyeUW5QGZ++3+ar3kL38I66dviGGRVqAGdZRwJKxtmyzoe+
         cWgQIN9t3mteMns2UmBTVc6gHTRM9H6rmzvHcS7J3pPXftauXeZvWzI7aknTOZV35CO+
         w5/1kdthDDNhEYj+ApPJ8EAHCen+X5RXZl095u/NQKGHRLCMOKQNDAOP0v+Mw9hW5fcG
         UbTSicgj1mTxJXzjQAyS/u03f3yuHsoh4VXIc150IfgehX4hg5bT1T/lR1n4Geq1KT0p
         BLcA==
X-Forwarded-Encrypted: i=1; AJvYcCVxASOHxwvfjB1SJ8mqwbMl/RCcdiF/ybKCe76pQ01rNH/MM/vwbGplcRzJM//MvEVgBmFWwlxY6HVt5KbK@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1cYNzO2mBHZP9N8AUEdB4lLh+9opcmQlORH4ZH7n9sAjj4DG0
	SDkVNTG2dHsbm8iu8Ij6j9mSXYyZCXDvtP1Xu4sy+KkgEZAw39GnY5auC28nUAzNKdKlAKU2cAn
	zM7squOsps+/bgdT++nOp8nMz2mEyy/RgzOnE9gqEQZx7TVjq/xa3vCc2FEukROlLBLfh
X-Gm-Gg: ASbGnctdm1VaVurIYf6HMef9etsSEPlgjVtKzZv0IcjkN7+RFYvq9g+yGO+Fx6zQtXd
	lajaFT9rfh2Z0jZ+yRq7eC88MQ9H2tIpsYchbtQvexxgUzrTRHFsWycgkdE/rlJj4kmfZMyBy4w
	ZIHlZUINupBlu9Ym9Tfmg7mDtZaLbTTubKN5wGc7r63KEi/8VuZWkZATDiuuQsgPR+vUjAyDB2A
	WqEWuQNCSw9pz3MGuEJOa9kCfaqJBFMLsJuin9hJVdNu9NRqBS9NSwM6LP1OCDHmHKyC0zs9vkL
	dXUg6AURfAP7XNN8JWJNsM/WthWtLMttYeYQvm3WKUkMTAVqYpr5gqkw8aaFxmhf+8IxM8luAeF
	qgLbd1dNSaGnefJsyI6vUi4JjIX2iEzBDauHUbxZP62lsAi+F2GmgF9za
X-Received: by 2002:a05:622a:199a:b0:4e8:a9f6:359 with SMTP id d75a77b69052e-4ea1178251cmr53460971cf.10.1761131960880;
        Wed, 22 Oct 2025 04:19:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHazv7EpuQKVa2TE7vWJl88ysZRYLrTeTShK//8fzdheK7Yg9kZVd8M9zY6Uals8F4qoNmYwA==
X-Received: by 2002:a05:622a:199a:b0:4e8:a9f6:359 with SMTP id d75a77b69052e-4ea1178251cmr53460731cf.10.1761131960401;
        Wed, 22 Oct 2025 04:19:20 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c4945f1ffsm11844158a12.31.2025.10.22.04.19.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 04:19:18 -0700 (PDT)
Message-ID: <06aec134-4795-4111-801a-469afdd8977d@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 13:19:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: camcc-sm6350: Fix PLL config of PLL2
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Danila Tikhonov <danila@jiaxyga.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251021-agera-pll-fixups-v1-0-8c1d8aff4afc@fairphone.com>
 <20251021-agera-pll-fixups-v1-1-8c1d8aff4afc@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251021-agera-pll-fixups-v1-1-8c1d8aff4afc@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fhEVhESduqmM5uRZtprCqTXGoSbRs92b
X-Proofpoint-GUID: fhEVhESduqmM5uRZtprCqTXGoSbRs92b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfXyiptmkU93FOc
 GNrC6xTh4C7qzIu+cd7gicldQY+teIBrgX9X8g50V2SawC5qiMx4gmyY/DNObSoyLuTx32dR7IO
 ++U/CKEqQM7qRFxXusQ3hO0Q6FEeryC/Ym9EALJDFIJIbW0CEOUq9P9LmSSnpohpTj30cGKEicU
 mQ+ICU90XwwOTfiJC6/T0+E4ZY+VSfv29qIpyX/VCj9qpMeHvMn2jklyocbIfXACQ52Souqr8hS
 3jLQJZDQEZaTgXex6N2jPLXN3U9S5FMQAMDOx2DVLx7jiyWkylP5argseeHP4j+faj8q7AhvPPO
 UcGVHwlBYttl+zbuauWUa3fHZRjkze5wmsRvW/LauIqqbWjC0i0Yxh7h8CjmGIYtf/+OpRYxNcq
 9vnPH1AdRpatmbaXHKgVcEHqdToXuA==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68f8bdba cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ElG4cDhITSkplFuxWWoA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090

On 10/21/25 8:08 PM, Luca Weiss wrote:
> The 'Agera' PLLs (with clk_agera_pll_configure) do not take some of the
> parameters that are provided in the vendor driver. Instead the upstream
> configuration should provide the final user_ctl value that is written to
> the USER_CTL register.

This is perhaps wishful thinking due to potential complexity, but maybe
we could add some sanity checks to make sure that putting things in
unused fields doesn't happen

Konrad

