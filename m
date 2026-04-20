Return-Path: <linux-arm-msm+bounces-103722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJ3RCC325Wl+pgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:47:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D82DD429033
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:47:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B894130471D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ACA9389119;
	Mon, 20 Apr 2026 09:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pGk94qRE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V/j3wtXk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480503914FD
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 09:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776678327; cv=none; b=M4CY9mT5niaglCaXs8eUjl4yEc0nZunJ/k5fx1UjjoF/SqaBEAnYGHK0mr2a7iMzouOWtJlhIJNUoiFVxVSL2xzc2kh1AVkaQgHLV50i4tzJJH1IHRPDsvWdHT1bFeJcRCZI/GMp7fLOBmIa9SeiqxfQKXZqiW9HO5pRg0O9nMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776678327; c=relaxed/simple;
	bh=bYSwmUjGtLvHCdtVR/0+t4pA3GFfCehUNhWs06XWDCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Il8rnCV2R9jBvSEoiKqeeVrtDGaZCLdbAH57C3Og5drLbXP6Aa1OOd1X+fSW1rQUu3OZby9ASie0NKY3g4AwnxhiTkO7nQ87lODe0SAa4C5w0EoAufQKUylpWMWVcMH0wWqgsVU03SDVJUC71y4DB/gQJlqZSemT05pN/qCvZwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pGk94qRE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V/j3wtXk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K97E0p2755817
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 09:45:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y33D5UjjNCecB2uHxdjgRCYaxrrJ89ADDV/1ve9CS7A=; b=pGk94qREZgzRdAWt
	h5jF2GTN4Gx48ZrIDfShqM4WDnQP0ZZH8EUBQM8NmbWKZSm+xIUDaIo4JZLh2OGp
	mw1nYeAnjnur1NmD01BY17yvEweX1+ui7cJSF1Ob+eLs/kphP5LlvST0UaYM8xtN
	HOQkXGjTBtRq299gOX7JeeoZFl9y/ltIkXZhP8ZPHwv55hxtTQnxy1vJd9FHyhvN
	3nLqc+vxtugKHO9gA+FjVQIVPeBKObTGs44Hg/FJ7/CtY+K3kEZsErhTY5kqFYsE
	4B+9OBpvNXCwdM3kvp4P2okgNsLXNA6GSS7NeJ0xWNBFg19RdmEgxWWHcbY0ekWx
	54PqJQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh7xg4xy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 09:45:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5073ed1ec6fso9567651cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 02:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776678323; x=1777283123; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y33D5UjjNCecB2uHxdjgRCYaxrrJ89ADDV/1ve9CS7A=;
        b=V/j3wtXkaRlR7ACzAcXdYJTA5PHBBRYDeMg/RI+6W6Y7D7zdqlIWNzvUwBV7IIySas
         cddQu5U2wzqXC4SGlxpx2YAPufvAyJV5N76Z3EF11roLvhQoaF5PcDeaNLPInncjOkWJ
         fMSra950xo2RV1acne0djucY6LOKxY3sbpjYv4qjdrW7rw6AS+tvXN6NJQ424NMcFlTS
         gJWBFg2P/lQx0H2Em0WE13Rx2zWHIvGssXDI5KloOgXNSod24kkcmUSE4uYXyfr0+684
         OM+qnJ/3kFOieL1/IDK81QgLBZYyAEydvGiOADIHqnovTUhEXkCaUsOdyjgwdF9SY+Tc
         2yjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776678323; x=1777283123;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y33D5UjjNCecB2uHxdjgRCYaxrrJ89ADDV/1ve9CS7A=;
        b=I74FPDcmOwyS+NYJB27+zzbRNFC1vgHIOmOPNgFbuqQdQu69b3RTpLNhjUFAPEkw2i
         MtZdJwK26KyM7McmRwCoROVXFUeY00Niv3F4WiZ/6F4mfjIZJMDAT10T4Scm1cg4RDb4
         651VBmk3+VXZXuKK0XB6sLuHElUjv/D44lkucNIrdTIHWQ9hrEJI0UZ7dvdpK7XsD/eM
         mzH042e1IxhJbgq9ORSYOVQKM4QrpJUVD+e3vGMBufL8MhWHqIL+30sCg1GOMyaCPKvC
         Bl1fIVIRa9+4diq9TggDx8HTPYQXgXv2n+71iZUAchH3HLuyV1GvP+hsQHNQ6owy7T+y
         Fo+w==
X-Gm-Message-State: AOJu0YyAAtXfp9rR1W1zTD8aDgL8OpSHjb3ucroSZTakIC+Jx8ytVb6L
	B/XWuxD73+WUBdmVwKLJcsAlCQBMWRL8P6398thcj82Kqd1afU81AeF4iKYO6qf4TcyN/1q1PJQ
	UGgyjKVVBqw+jisWpqdWzutnejT7+Eglx2g681cfoej1Nf9spl8K8hZkrFOvAnpi+7E/1
X-Gm-Gg: AeBDietHzOUXo+MlckZVKmhwm1GK4IUuRQ9lVpwKoAnkmpPgqqVH+zPyl6TVUSeyiVY
	Rl5smj6WNiMG8tDT54UV+lG/rdQNoq+p5Y3Ikbri8k1XF4VePOEhAOz0NV0bo9EzSTDM9WxxOp9
	N/dv84EZNH1CcWMC5wdjWz/WlXA0/TNJ33dM1haaK59IAdkTXQwjMQBSB5iljcAW7E/yslaLQLo
	G+gWXQ6GTlba1k26rQSTS/ZDhnzMirmvWsdyIZ7WNDMgL8e/AGME6x4d5Z8Syizw/5yStOwkvvc
	Mz3NzBY2q9xx6aPOqvhz2tjx7UD9dNg0ERsrwGlG0+lGRwBlS/TQF/haTNpnlz6p6u+5+lHqErZ
	BkpxbRTYtnzKfUIjooTzRN2XfY/QzSs3naYQHiIxIN0/30djuqMD4MWJx0G8l309CeF0nHa5hpD
	+psikfxK8xszwpcA==
X-Received: by 2002:a05:622a:1ba9:b0:50d:a978:6ece with SMTP id d75a77b69052e-50e3693546emr131044331cf.1.1776678323564;
        Mon, 20 Apr 2026 02:45:23 -0700 (PDT)
X-Received: by 2002:a05:622a:1ba9:b0:50d:a978:6ece with SMTP id d75a77b69052e-50e3693546emr131044101cf.1.1776678323076;
        Mon, 20 Apr 2026 02:45:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455045652sm329858566b.51.2026.04.20.02.45.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 02:45:22 -0700 (PDT)
Message-ID: <f8fe7790-90d4-4c34-8662-f15555e5e2c6@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 11:45:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] arm64: dts: qcom: kodiak: Add QSPI memory
 interconnect path
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
 <20260420-spi-nor-v3-6-7de325a29010@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260420-spi-nor-v3-6-7de325a29010@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA5MyBTYWx0ZWRfXx9iHZB/JXqfG
 h8W/ll6n+dCQuE5df4viv4gZobhWccgS2YoHug0NdBcKAgoSgEW3dQ6fuMDa1ExabUGs08UqttI
 Vi52tklQRiHZNCkf/AaBhpmKy8nVOoJYJV6z7kboOmvQF4RJQYcDRAVJ82W8MAambxK2P21TNuL
 9P/tNCAieFKoYmd31l+e8gXYzyQvj0L2gasX/laFPI7B9131rFVRs3+Wk3PqNQ0Z8TgVe93NIZA
 ITbnI6EXQM1ajcADV/E7UviPcnzGGnQM+PPX5mNskQvCUJiHCHkKOLc2VQ9/H7gYLrQe6FXOR+Z
 oncZq0FjHBpzHemdRiCq7KE55/qqFxMiVKPQ4FXt29pOCAc69ypSsvWoWVL77VjbCYNEvrQHpfl
 UEj/VS/asc4adSxZU/MXHIjQJM8nqAb25M5H5Eahf2um0KwoPpAJdZ1HAg4zWeoIwqsAHpeRbML
 R4L+Asy90bl4gop/LTA==
X-Authority-Analysis: v=2.4 cv=BPmDalQG c=1 sm=1 tr=0 ts=69e5f5b4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Qfo_qk6ajyruwQE2hCAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 3QuscTKIlzLibw7mn6u8hgu7fsZUwLB_
X-Proofpoint-GUID: 3QuscTKIlzLibw7mn6u8hgu7fsZUwLB_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200093
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103722-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D82DD429033
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/20/26 8:12 AM, Viken Dadhaniya wrote:
> Add the missing QSPI-to-memory interconnect path alongside the existing
> configuration path. Without it, the interconnect framework cannot vote for
> the bandwidth required by QSPI DMA data transfers.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

