Return-Path: <linux-arm-msm+bounces-103269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKDGFmth32lhSQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:59:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EF7403056
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:59:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B86E03002539
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 09:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF3533C536;
	Wed, 15 Apr 2026 09:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DSKCgCYt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e7HOOsUN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F51D33F360
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776246575; cv=none; b=ZYEU/pX4IoJsK0Xz8R/1XlbF5wy+wxlD7tjz0BHH2KISgxmEL3PepeFQ3edlZN4A2t55p/+Y2FR9eQD0pHRM1WQsHSvV/rHkGaT8nma7e4juwptxuCxJkSQ2LTSuWpCqz7MUZfy+20BWpDRlW/t8ifWTpLj7fKeHb4j2GqDG6hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776246575; c=relaxed/simple;
	bh=cxYpEZvQMHrSUdqMLabhc/dkvmhcRT0qC3vW9qGxMb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ej8g+5BAndVAfteq9L5t/wgoamz32fnNBehwiihSnXWKMKUEhWufzl7q2wwP8AtF9jz7a86lMx+wK8Pnx1fqlmPjndvoDK6V2/YPowDytU4Y06jzEq0erhWQ1G3mMY2/oDniJq8ugxviiki28BRydv4nFVbz+pYdyYXTgdu2rF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DSKCgCYt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e7HOOsUN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F8sDGQ3936622
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UGKAhaWbgzww5lhS1vPXCnXjw4jpJVAA+m/j2lXOxow=; b=DSKCgCYtV6swTrO7
	BOS8qTKDMkjskI6iwsokkCWBuPm7oSS+g4u8AwzBl4H0cIUGW94tFo8rG98/SqrX
	hNq9Lwo95bdshxZXqGIXJm7IC1wmtdGFfjgStRP3zZdocOn/qGVnBUDHnZXGxIv/
	nFX4FQpvcfNE5PJng86B4jwuV6M/qLsPyj+AP6rJTcq+fZUw2ANsTTPMzFpjujhF
	Tg82lAf9yvpPcoDrT6DP3hhye5WU6XM1m6r7tlKNfDFv5fhUy//GLXDNloCg80NA
	NCTBYx9tnhpoD0XMGWBCWNZzyQ4/gcJSRzC4zh+8yaDOv6DDu2PL0MbzwiDpzpl6
	cK4FDA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrbf38n6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:49:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8c183c2eso58360921cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 02:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776246572; x=1776851372; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UGKAhaWbgzww5lhS1vPXCnXjw4jpJVAA+m/j2lXOxow=;
        b=e7HOOsUNXTXJ/4IvFM6ovxxETcZ/frFNwRwHeu1mFRXBEW97+PhSgwOV/MTBD+0X29
         T7o8ZGZKsXpfaP3dEBz4qwJO1OMp0Ht23rP3Nd6n2La0K5XG4GNNxyEAWzgC3TxE/7xS
         P9z+BoU0spQ6Nu4Yror8Y6RNTHglNdy7I1+Sry0aMUpoM+xpEArMVFQ4Y2BPqXngB5el
         b8V7aCnkviszOa5NhayvKAdTrMUf86aQZRw/71hdZgLK/Z7XGOQH2yzyI4ZkbZ8kUh7v
         ej1OpqJg29AVx7cVAdbBuAUVQRONduqI3jZHcmhWPqLvZMBLrBEIDFtdnJ2bhpso/8h+
         ukoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776246572; x=1776851372;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UGKAhaWbgzww5lhS1vPXCnXjw4jpJVAA+m/j2lXOxow=;
        b=f0u/KZB5TUaBqQhvJoFb8sN4YCZvD6N/Nts9YFGsPr1aiekKSWqYcgY1pOVcNAv1GD
         Bx0bX4TGjFXlUsg2a5VmvplZfvXigYKKoQNVF/SLNneHsubC5h7UZg2VN69ZcxKG3Wl/
         B7LNQQYNjhJTgu8Es/EzHf840WrfJv47T4k6s3hVWdNNE6cpV11y2Buhlxz6Sy4g2UxW
         TIkhHg4XUL7fQO4CtwAg80ucdH+BluvClJ/W7qcRk/Z8mazVrAAELFxb2kgriToDvJrj
         yw9munrtuX8L7A2kfCUf3UPREN9cLEtezZ2/49cy3YTA+p2sXslmRncxZ3eSVGHJxcRv
         YDXg==
X-Gm-Message-State: AOJu0YzEb8fe0f/HDPJ4I7Yqe2NLbTRcTHFOOOrTbTCbb36LfI5sLE41
	WoCCvXzhjgljBTOOxKyO1sAp7Sq3SUbTdncLjS/BftymZBUXGvH1NlR1Tcm1J33Kp6aPb6PcWj7
	/yaJBtrF54hUCJfd1gsmi8UOLyUFJMI61r4h1XVzBTjst8Qv1EJyjAqA+0G+UyxWjs8kH
X-Gm-Gg: AeBDieuhePxHwZcsz1bV3aqmVr0tr27zH3lfSGK3j8fzsWo8Xg6kKpUnBl0cF+FTgX8
	N2GR3AQ3PrRakg69LI3lXRjfSWlHjTaHBt4G4LLUJQleclB+Vqb+aggDBO4bGmBFQ8cCqWrG7B3
	3GBfcREL93JE34f2E9c74iN4RK3TkHFpda+/mTFZ0MVMbW7eJKolcYpbEJDCGAOSZ2DvnmQOh2s
	ICWMZsMZmWOoQhWc5GWKax7drq22vsUgVvxm0bQzD8O1MObtjb3q7rv9ltFqcGtWt6v734TOnsZ
	FR6ZfgYNmJHSLjFvHKawwEu8M0YQ8/5LNOam4n1DgrS6KLMotAGrCIRM7OxlPndJkl8Jyu57q8S
	OO+o/I6VKb6PU4ck15XUq71MQAM1ODiJ6eHo7Nqyf4wt56+IsfjlVqc1VtQb8jTG6jKSmkH/Awp
	SnA/HzFgHrv2unzg==
X-Received: by 2002:ac8:5893:0:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50e1a703e9dmr15482521cf.4.1776246572400;
        Wed, 15 Apr 2026 02:49:32 -0700 (PDT)
X-Received: by 2002:ac8:5893:0:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50e1a703e9dmr15482401cf.4.1776246572016;
        Wed, 15 Apr 2026 02:49:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1782aecf1sm38771566b.60.2026.04.15.02.49.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 02:49:31 -0700 (PDT)
Message-ID: <d4c7d384-316b-4d32-9161-04757ede9ffe@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 11:49:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: kodiak: Add QSPI memory
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
References: <20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com>
 <20260414-spi-nor-v2-6-bcca40de4b5f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-spi-nor-v2-6-bcca40de4b5f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: m_Z5yxJUReBGl7PueZjGfM0wRB3_Dv_0
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=69df5f2d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ctcgHeANrx8D0WuUPGkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: m_Z5yxJUReBGl7PueZjGfM0wRB3_Dv_0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA4OSBTYWx0ZWRfX821SyYN7kg73
 h6pvP0tuclrx0FT7c7+QwzxeVLdBmmsJPUmr0lDbxff7edR3V7EFDh10xMqUGaC1mW80Q0nhoIe
 GVUWqwBKari/hZKIc6tXI+uBfUa/PPJygOPhNySVpzOMd4PBLpjbzDKIE/QIT6p7hoYSl/dFcD2
 d/LYEND3Sk8vQqG2SRBvk1mvX7KKSxxKO82c/EhQfN0q01xhGkjAG+U7md5AnB8jVKz8sbs1d5i
 nQDhC7/rfZRQnQykzvyV+4N6kB+r9ekV2zzWRQD4s2id1BSfg6D4nhJ0l56LdH0vP8dvvxbd25J
 ny8ULAdIeszeFH0B7tB/Wa1ptrFJQ1JaNHZ6LGDzOhI22vTxr2OPoCBArtbb8v1yDCgHXV3yW/D
 ImTNjbM0xm4jlf76cXufXeqNg9bOT7UcWOfv/RSkZw/DO8QVm9djTlKqHGa2HFfkQlLI7Br5eFs
 MHAchxPhKdjJqIVDHWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150089
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103269-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 93EF7403056
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/14/26 7:08 PM, Viken Dadhaniya wrote:
> Add the missing QSPI-to-memory interconnect path alongside the existing
> configuration path. Without it, the interconnect framework cannot vote for
> the bandwidth required by QSPI DMA data transfers.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 6079e67ea829..105efb4b3aa4 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -4312,9 +4312,12 @@ qspi: spi@88dc000 {
>  			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
>  				 <&gcc GCC_QSPI_CORE_CLK>;
>  			clock-names = "iface", "core";
> -			interconnects = <&gem_noc MASTER_APPSS_PROC 0
> -					&cnoc2 SLAVE_QSPI_0 0>;
> -			interconnect-names = "qspi-config";
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &cnoc2 SLAVE_QSPI_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&aggre1_noc MASTER_QSPI_0 QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;

same comments as patch 4

Konrad

