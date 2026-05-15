Return-Path: <linux-arm-msm+bounces-107788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEOAJoL+BmpiqgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:07:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB4C54E151
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:07:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D21613009F02
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E38421A1D;
	Fri, 15 May 2026 10:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GWVEUiSA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EVzF532M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB5D401499
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778841454; cv=none; b=eNnPoc2hA4+v4D27hoTc4TCjxjOXmuJTSR4AL1GAih0Zw/86oMrXYOI+/bRkyXcoEolsW3Ur35tav2JCWCZvsDSBYDqs7huWxVOacs4HuqC+lbo1DO/g/GnMRrNiUzXhjgiG5qVVxuURo30/jXFX6ohFt3ttYdStB5zkiLUAzCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778841454; c=relaxed/simple;
	bh=Olhz024//a3T39nWj7aqngNz5zRyYEO9Z31uP3Yw8LA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gI71Cg4lirjy+2OwjBPMncTX75GbverH1yrs89g3NY5SlsDfXgpIAdUCHudDG8lShV+6yGiOC4dTPUr1Uq1loQh+9D9+992ePqSCuMY/4pFV/WyNCsv7KasL4bbtyqEtjUuMqtvOIUziACP3Oojkz3/U9vmV5Z2TGLxDGJ0E8Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GWVEUiSA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EVzF532M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4s0OK2676199
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VvbGXS2kE9zWNc5GpgcccNRZaDS08RE8hpzanRVUMOE=; b=GWVEUiSA3y599VxP
	PumCYLmwl71QWmb8uCw1z7y5MHaXMEjidj0PZ8v6NjmdhJrCs35UooKfmwl7OjC7
	yT1d870mm/U980fmjS0xppCjXxTmjl3nt5vEDH3nzJPqnOvY2mtLHXwY91aRdpyJ
	DlBewtmCX2dkvh9m583EB95DcaJRIvv3U+0DqYzZM7X4pCrOj88dtSaFIauNqVM+
	A0Vo8QnGwp25YTCDSw/DQKDa1rYAGQgDpiPubOc5Oj7Sd4iVqGD6ynTfnwMPOBuf
	y9YQXQIp2l3zoCf09CUXMPLgCo9/SUscDJawRtxZQGVRdTX6Hg6lrraVu7hL/aEB
	u4OG5g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vtvp8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:37:32 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6313443ffa2so647089137.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778841451; x=1779446251; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VvbGXS2kE9zWNc5GpgcccNRZaDS08RE8hpzanRVUMOE=;
        b=EVzF532MfX1gyXSXi2xGpO6eNPkvwVbe7N9xbJOJ+TGqngyYIU1UBvkZh1W6A0pUX8
         1ZzqlT0x91MWJzfK85E+AJQuLQOGLxGDOX/mVKEzMfGnfJlSBDnvenT+xkG3aEcTiFE2
         PJ8kGxQ12VSX4NlueEiXDKrg0Lw6Coxme7bLsyaviUk3lfFJl8jFqKk/QoAeiRKANuVe
         ozDxUeYwTpkvMy65s/rLDiPvboz3VsiL2C143KvdFTwV9skOT0BLSqaFjAUsVxRXCTTK
         7iISovupklVJHetKGr0j30Qj9ntIYxHbUhyu2mtYTdvVyaRjzsyb7x6IXMiCBnPNtj/p
         gupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778841451; x=1779446251;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VvbGXS2kE9zWNc5GpgcccNRZaDS08RE8hpzanRVUMOE=;
        b=XIwBWjHu/wqJZ4xz2FrmBgkz2DCmRDqiF4RvlWAWrFYhMMHrClkMKXybJlGaCEHttO
         /650ByHgn/LlHfy+CEueeJ6lZFJZ2xMGeLsXrY7fDKRTCKHEWmiVzJqmC17rYHgMD6BX
         UW4XQyiXsL3z2nPQ40YEsunh0UQCIT5TE+wnbpoCUXMNXoqCPSS8rn/BWtVo5cIDVrlM
         kZRGCS+tbTZSy1kQPiEDUqgxwjZ3fOALlQsqOq5zcbEdTyh6uRR3N1T2IXo4WqtAL0mf
         14tL3TKeJr0pWNFatKpuF7/+QkJC2+uumo7UKl34xjFshhG2tfJV5CigWC7ByZkVGoZM
         6YtQ==
X-Gm-Message-State: AOJu0Yx9jz/427WHbJNh3i6/DgUZ0tyksK3w1BTh59UHUuwNz1eCWB5e
	2Bv/a0KPMpAxEuGh0/V86Uj2KIGfWpZd2pyrNwQ8t8HaTJbuxVY4D1IVtYibL7AofBfFYAAHfLX
	WDevG1DLG2XpEdzd7p+6OyuT9sySwpmMTuZCIsyHgkmUFivL0MSCHpC5eaxv1JbcTXQ7b+qntVq
	b4
X-Gm-Gg: Acq92OHb86RL7PDdTx+iFY+VbbXStKGLkrduJvxrVNl22i1GJQ2ehEv8Z3SBlWC5qsu
	N7+GLfHLevQxwStHip+GPeH6KvbBrCAFhXjss6iQzChITgOiYUUfZB4LDGfF6twLB/xEhZA1mN4
	GHOAaSniXFADXHy/K9xcdUvurQWCF23INJ4HFGs5M/BXIS55/NoOhlsmQmnzhDWTfCT9M9Qlajl
	q0Rf/eHIwkqsXRuyoUImnWjplJ2fEanMnfi7NQ05ASDNL2Ydlvp9fG9eiyiQ8fOfdB/h0WZSt4b
	hSxpFO//nUEdMk0H7eZSG0wfdi7Ah2ZA6zD1Fktc0e3Xd25T9bxVOTeZp2t1L9vlILMwOT3AipJ
	PtHb0HBU2G0pG0Lz6TI99bc4uS/gr0H6m7xeXtEWWl49k8HWGM+YcyoJkrcttF6buYIPfk8cb7j
	i5V80=
X-Received: by 2002:a05:6102:2245:b0:631:3ccc:42df with SMTP id ada2fe7eead31-63a3fa98b68mr406162137.3.1778841451396;
        Fri, 15 May 2026 03:37:31 -0700 (PDT)
X-Received: by 2002:a05:6102:2245:b0:631:3ccc:42df with SMTP id ada2fe7eead31-63a3fa98b68mr406147137.3.1778841450885;
        Fri, 15 May 2026 03:37:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4ec6548sm206391066b.62.2026.05.15.03.37.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:37:29 -0700 (PDT)
Message-ID: <ced00124-9ba2-49ca-9200-62abd6ac3340@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:37:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: Introduce Shikra SoC base dtsi
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>
References: <20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com>
 <20260512-shikra-dt-v1-2-716438330dd0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260512-shikra-dt-v1-2-716438330dd0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PKE/P/qC c=1 sm=1 tr=0 ts=6a06f76c cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ids9KMZMtRugHLbRT8AA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwNyBTYWx0ZWRfX2iMC/2dISHgd
 JulLmprqWOm6INz1w95eoTu9uqVxHB6Ereht4gtylG3g/QHY5r1fdR1O79RkJzrNlXQuknpwRsu
 JM3Q7geNTdso5I+lCCR/m90c2pmcXPQ172dv6U+W23Sn5c3hcCl/lLEFwh88witr0XQDmjN5udu
 A064jJhhNdEdBzFSfbxRffNAsMZm3iwRgnLPnMgQeLbUpNcXI476IJ31IFG7r6djtTA63mutGv9
 fn6WOApYFrJv7ZB42dGD87Nio8qWK/961rGHAzwaZTjKcTFzbXp/ctpfSd6+RsgDt7W6TE6czFs
 HXVfTJyJB1w5UTH/Lb9Pfu1Y7oqsBVN/FmloeA0y0MruUKfLKDxMYq9DLOU+lnj8uQ5etDt8H+z
 Hqxr+Dvh0noz1muK3AY8Tu2e5gv5jHza7YTb9ephkd9lb4dz7CIhl/Q2Yk4oCmWXRH2LB1xod7d
 zWOQKeqEZFEN0wJ1u8g==
X-Proofpoint-ORIG-GUID: bnCoY5IWUSM27IS8YyKRyN9k6pY2E-ql
X-Proofpoint-GUID: bnCoY5IWUSM27IS8YyKRyN9k6pY2E-ql
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150107
X-Rspamd-Queue-Id: 5CB4C54E151
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107788-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/12/26 6:08 AM, Komal Bajaj wrote:
> Add initial device tree support for the Qualcomm Shikra SoC,
> an IoT-focused platform built around a heterogeneous CPU cluster
> (Cortex-A55 + Cortex-A78C) with RPM-based power and clock management.

[...]

> +	pmu {
> +		compatible = "arm,armv8-pmuv3";
> +		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH>;

Considering there's 2 core types, you may need something like:

9ce52e908bd5 ("arm64: dts: qcom: sm8650: switch to interrupt-cells 4 to add PPI partitions")
2c06e0797c32 ("arm64: dts: qcom: sm8650: add PPI interrupt partitions for the ARM PMUs")

> +	};
> +
> +	psci: psci {

Unused label, please drop

otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

