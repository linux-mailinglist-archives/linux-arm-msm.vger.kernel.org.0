Return-Path: <linux-arm-msm+bounces-71579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4650BB3FFC2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 14:15:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B96445E13E8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 12:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41E412FE56E;
	Tue,  2 Sep 2025 12:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bk66qHMa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7394B2FE052
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 12:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814545; cv=none; b=J0HphVaZa+pBPAsTBAspN4nnUPHW6l/Re9JRG2oaNOubVsHC+lKrztg1Q9RuzTdVe7K7oDyFa+EBelf9aO3leLUiH2pyHHDASRdhs7bWwdfc+Q3VLhErOGnn1LXsRXmBwAXjFpXnt/oqpNOzemEFEHHakMqcYihpn5x34BA82CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814545; c=relaxed/simple;
	bh=4TzxjJYIEkM93LSsZNJ7ZgTRddLrFBxtbjs3pMbeoUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lgHWsDsvk/Cj9ryu3HKcmQWuwHB1765GSl4/+pBl+7zwwfGSLHkTEZl6wv2ruRrxTRswolV+Aj/6xIgFzIu53rtNMAo6EZ09HTAjQvxksRVu7NZ2Rrgr1Ai8nqmf+JHpR3sbbnjEEctPnh/ApX0GKjs7WYANuEvodLhA3rOQ8KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bk66qHMa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582BD5NB031109
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 12:02:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9/1kAQDm/SU/mMAVnrKZOzxGTzM4Q3HKFjG6jr+d3L4=; b=Bk66qHMa5mklpb+b
	l8R3j0hB77vZfbO1l1yn0YGsEZGfkJzup0058kF1ciMr5gwt4MuUmoBhLM7+mq6u
	0BoT+ZkiddUxItWCFi16y9dUmTwvDBnSubKNP9eTdy+rXExIMV3lEctgn26MlIFC
	uc6wNcZL9JwOgWLOT6swvBWgr+G9lZfQhcIeMycTyONvs+J79x4QN+VrsddChI5Q
	WOkJD4+sHzPXdEoFvdOaaTJROKHbMMXnBIUGW0RU8NAaK1jp8o8wktmxSWhxdnQE
	RssUhfytPc7zIF+1MJrMWlZPCilHUoPucbZy8huYcOYnh/a56ZBQwDGzZ43/bX6p
	bMa3uA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush2yjg8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 12:02:22 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-544b8c7ad8fso31183e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 05:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756814541; x=1757419341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9/1kAQDm/SU/mMAVnrKZOzxGTzM4Q3HKFjG6jr+d3L4=;
        b=HtjKmcw3JgkJeT75JpBYo/xofsBP2y+0j0aaWUTBK1NqAAz6MvW1rq4b/vZHy0/HD0
         vqo/MobytlUq275PxpMgAvOurPXwCzrBBTCXRzgTUl116dmU3P9c8dDXk6AlP/YixDdz
         dfF/6QqtH2yjcQFKIVJARXLCfMG9gTQBQC6kX1Vr8IWwaO1O42e8SMrzG3gtFzmMElbW
         jP2pe8KzDxhq5zVUJKHHy4V6tmuC57OoBhDfcSqPZgpC3bf1ruHMFWcm3KVJEhvdTLY+
         cxe45FnbiBrsO/1168bh8xH91k9C1jDk2oGIS50N/rQBrYUu0lEUUVdQjz5WcPkCPGgj
         Pu1A==
X-Forwarded-Encrypted: i=1; AJvYcCX8JN2vEJtQz94JgcKhoFyGjJLCUOsMtlsfhofCvFBqctJcS2IckjCeglkjkkX0vDGypRamKTrvvcTrGi05@vger.kernel.org
X-Gm-Message-State: AOJu0YxasQmbD5gOqUc5+xdzlIDbRxUrHMtwd6fi5Nbdny7knoEXHnxc
	pO4lvdMEmle6HTx52e+82a4LbqhgIH56BgEgjGG2flKc+azgnD+4QBBH33JNJmfaj5y5Wxfnm4X
	KMk3AScULAvLZFgcyQpjIAgUYOUordFRVa+btpdiwuC0rLkQ5a6SarD0ehEgJNej9vLXv
X-Gm-Gg: ASbGnctFwXUNtjmfHyiCDHi/uaTkra6YUVvItlMTsAkhL9Rszu9ElFRAvHkd0r/zf6o
	DReGp24qkdFUMbQP5B2tFL1g19kt9td4FCpIC2plOZmwHVvZv52BsMpAroQgzZCfWlT8bZl79QJ
	i9r59bdo9mL72A+uVMC5qnseQGhLFVpqXIfECO19VXcnZe5yqDh8BmF7+PgtKqPW5xqnCta9Y43
	aTwmsXu4WGIsRcf0iw1XwlJjOr0y3x5A+wsm6JLCVcSZQ2mrCaxcy1/CZ4ZFotOnvWyrcm1OCGL
	/HDkzssAo10Kt8ek5yavkIm4jXoe3PKxQ1kveNhsELDk9Hf+PQZTJckbyhpzX01t1QL0+uqVq7t
	1xOqYV4RU2OK9KPIWpb5zqg==
X-Received: by 2002:a05:6122:3a83:b0:544:9bc2:8676 with SMTP id 71dfb90a1353d-5449bc2aa5dmr1067964e0c.1.1756814539673;
        Tue, 02 Sep 2025 05:02:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkeOteUQsHrAg2Cy2y9fzQCmk+oLMhpHwli32VvO1rpwsKviEqQRUMDoCaCgN2xEoKHR06lA==
X-Received: by 2002:a05:6122:3a83:b0:544:9bc2:8676 with SMTP id 71dfb90a1353d-5449bc2aa5dmr1067944e0c.1.1756814538721;
        Tue, 02 Sep 2025 05:02:18 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc1c7848sm9834988a12.2.2025.09.02.05.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 05:02:17 -0700 (PDT)
Message-ID: <90b13660-1844-4701-8e63-7fde2f093db0@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 14:02:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sc7280: Drop aggre{1,2}_noc QOS
 clocks on Herobrine
To: Brian Norris <briannorris@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Odelu Kukatla <quic_okukatla@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org, Conor Dooley <conor+dt@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org
References: <20250825155557.v2.1.I018984907c1e6322cf4710bd1ce805580ed33261@changeid>
 <20250825155557.v2.2.Idebf1d8bd8ff507462fef9dc1ff47e84c01e9b60@changeid>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250825155557.v2.2.Idebf1d8bd8ff507462fef9dc1ff47e84c01e9b60@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfXwBE7UF+uQn6J
 FB2nd+ssLeNlbNShJeUjOkkCTv98x3gcgKJsD1AfJvi5Woz3suW24wkZnpc7KAkBcmjiHhLuG4M
 23gUxgYLuQ5gpZaKkiiwN0PLhG2gecQYaCyqNgninMxUSV4xaRqHv0cMJFMVWnjF+zKmgUvC8S0
 QIUZHT0OpAyTyZ3ydwIE+/k0ZBZzAcMCl5m9NzFH1Bjw4X6Vl4fyi2K/f6hY6oERt6EitxwarSw
 yTCihfouFiTetlPeUEhfnnvDIsoJCSKt5Vqt6MkHc1wbuuLp79MTcLLVupvEa2XXW/hXH6BLOVu
 hp/0snSCO/rv/a8hgFXl0UHo02+fdevRFHpJpy3CwNW8PYhArEZyIeG4B1dbFbrNS9BtbN2N/t9
 Dd7PLZz2
X-Proofpoint-ORIG-GUID: 5CVZzAE6hPvhPYUlnMmkjqs5sFLiH1q-
X-Proofpoint-GUID: 5CVZzAE6hPvhPYUlnMmkjqs5sFLiH1q-
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b6dcce cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=IKJ9IO03V--UWE61HX4A:9
 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032

On 8/26/25 12:55 AM, Brian Norris wrote:
> Ever since these two commits
> 
>   fbd908bb8bc0 ("interconnect: qcom: sc7280: enable QoS configuration")
>   2b5004956aff ("arm64: dts: qcom: sc7280: Add clocks for QOS configuration")
> 
> Herobrine systems fail to boot due to crashes like the following:
> 
> [    0.243171] Kernel panic - not syncing: Asynchronous SError Interrupt
> [    0.243173] CPU: 7 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.11.0 #1 c5464041cff584ced692726af2c4400fa2bde1db
> [    0.243178] Hardware name: Qualcomm Technologies, Inc. sc7280 CRD platform (rev5+) (DT)
> [    0.243180] Call trace:
> [    0.243182]  dump_backtrace+0x104/0x128
> [    0.243194]  show_stack+0x24/0x38
> [    0.243202]  __dump_stack+0x28/0x38
> [    0.243208]  dump_stack_lvl+0x28/0xb8
> [    0.243211]  dump_stack+0x18/0x30
> [    0.243215]  panic+0x134/0x340
> [    0.243219]  nmi_panic+0x48/0x98
> [    0.243227]  arm64_serror_panic+0x6c/0x80
> [    0.243245]  arm64_is_fatal_ras_serror+0xd8/0xe0
> [    0.243261]  do_serror+0x5c/0xa8
> [    0.243265]  el1h_64_error_handler+0x34/0x48
> [    0.243272]  el1h_64_error+0x7c/0x80
> [    0.243285]  regmap_mmio_read+0x5c/0xc0
> [    0.243289]  _regmap_bus_reg_read+0x78/0xf8
> [    0.243296]  regmap_update_bits_base+0xec/0x3a8
> [    0.243300]  qcom_icc_rpmh_probe+0x2d4/0x490
> [    0.243308]  platform_probe+0xb4/0xe0
> [...]
> 
> Specifically, they fail in qcom_icc_set_qos() when trying to write the
> QoS settings for qhm_qup1. Several of the previous nodes (qhm_qspi,
> qhm_qup0, ...) seem to configure without crashing.
> 
> We suspect that the TZ firmware on these devices does not expose QoS
> regions to Linux. The right solution here might involve deleting both
> 'clocks' and 'reg', but 'reg' would cause more problems. Linux is
> already OK with a missing 'clocks', since pre-2b5004956aff DTBs need to
> be supported, so we go with an easier solution.

Just to make sure I'm reading this right - the clocks enable just fine,
but it's the writes to the QoS settings that trigger the hang?
Any chance skipping qhm_qup1 specifically makes things better?

Could you please share your exact software version (which I assume is really
just the version of TF-A in this case) so I can try and reproduce it?

Konrad

