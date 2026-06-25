Return-Path: <linux-arm-msm+bounces-114471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eyQUDdLqPGqIuQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 10:46:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAB96C3F09
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 10:46:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=L2uRnliV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=isduX9wZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114471-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114471-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBC00309AD1D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 08:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6CF5381B07;
	Thu, 25 Jun 2026 08:44:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0FF381B10
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 08:44:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782377061; cv=none; b=gtzdWFObZcNO0WCtWzk6ybMhXEbJDzE3CFVdSzWvQMJzDU+BYMsmr2HOEvRs74nlrJyBBCi0ifmLU0LVNKRo9Dk8DT+NO+c4bWGasOLLCYvZh8E494MN7TAs1uZiBSI/cDGYG3WueaTP6PByZha5gCvTez3w2phu4dvPDltvPio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782377061; c=relaxed/simple;
	bh=7eg0kdEPuCmjJDnFXk124Q9nn/0D+ctFDpFo7bCDmrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HAwHuiCstgu6pAcdy8t/hNlXom1igB5KXyCK6gu3XrJ+oIdC3kFAiuf2qd9O+IR969DGzAJdsHj1T6JlDfkwRjbRC2wEH8pYlBgCxPSm3QVyI54VzYtDc0WIhF4bXEoLo5v8G7YXxuuy7C5G55bqAoA372PclfPdrtykD28lvI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L2uRnliV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=isduX9wZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P6glWV1527031
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 08:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QODe9BtwCwyVTZaeScSNIr/mu9BsGdO2HvYWlim1hPs=; b=L2uRnliV82mooo7h
	2k6+ekR3mQL3OAZuan726AC7yRiLCQfn24Spz/22SIHsoUqy1zV4tlm9QTtbi0sc
	lpSiP3LgyxGf0FgpAcrtpdGdP6vhjvYpRWqNQX1QRpX9tH7k3ZXvC+9ts5RhKs7m
	eu7RGRseIRvxrB6t8Aoxzb/kYm4nSJ+z3JrgHIHxcJrF/7DAZZx/EpXFEa03n0N9
	syEM6fmTHHVCN9knwDqp+JEZj/OlqoSi4jaevmufAZ6KK4mM0xwoWH6UoDNaopWV
	ERi/MP605MJpWinslDW0JKAZeNMT0l4UN5/6IwbtyTPBkgZOJpPz309tn7EwQvw+
	3Czl7w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ya8rewn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 08:44:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-920d6f3c2b8so15628185a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 01:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782377058; x=1782981858; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QODe9BtwCwyVTZaeScSNIr/mu9BsGdO2HvYWlim1hPs=;
        b=isduX9wZYBwxxTdJ0d9dmOSTYnRCC9msjUX2cie8b1YaY9jlNCrUz7cIErgA4T4x7j
         BMBpEe3uN5QjFWex9LfbtlpUHNgsC61rVGWOU8NBqKgcz4Z3oVoCt8XkR7/HeKtBfhrE
         KyrY5iUm0qRJNH/4MdD2P47pFyDAOzmBcee1VSDYZhyzt9boYbEBFlQZCcOHrmImUIPi
         sP8Df0yrSHrFJt2LJlyvB/dRtG7poLiprQ1aB4oIbSTqC1VJ9j4seL5Pton7rPo5COSd
         DgJ1ikYydaX4kcLunlsyEaKWECz3pPRnRgeCFHoqT5KzMZJbr8WmEy1EXPpS3sCdiFDu
         yD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782377058; x=1782981858;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QODe9BtwCwyVTZaeScSNIr/mu9BsGdO2HvYWlim1hPs=;
        b=PCuBY02TOzLrdM/Lu3u6aJuw73Sicm4/R9VCa0EflTFRYHryWMh3OhPLxlBmD5WKXS
         OEpss8IrFnovka/zQnEaDKNcdPkW6pm+nTmCmlqsR7zBpnajMQkxzy2a/tLAAmVyKYaZ
         9cPcbj4wMDQrae85N5ggASlI78gq+QXqyjcorwhSm3H6/kvsQ4UuMydwGs9N6rgAHFx9
         ohHVOD007z+9vhExU4G6YB6BL/lEHxHphR8IfMn6VQvYRgWarADsDPQc3TTcjUwiK/1C
         2GO94sJ2gD1+I/DQClckMY7edSwP0r9ekdSEIbxb3Hp6nA2s41mjLl+7sqPccaDtu7qX
         zHAQ==
X-Forwarded-Encrypted: i=1; AFNElJ8vktF2Qu5tVM1zlemahK3eGax+Tli0Mc5SL8kIYcHvXOkS+xiuZR/Y+xn75u6CfPfTklasYcEtYmim7Rft@vger.kernel.org
X-Gm-Message-State: AOJu0YyfvgGy0BFukntO0LAClu7RIzhwAyxjeYOdOuLrLpoE2Pm+SiBr
	NzzJ6IcCXL19nKx2XtvMfV/m7bfR+7XrIkiWEoMyxGk/d2eFLl0tsVPccrc1SNcFy2zHbr4Bgzm
	Lkns5vZJX/EnAsswNGXtFnpYOIqHW4tamq9M/9GTtG5PQlcvTocGo5nXrfAx/rOFu1v+B
X-Gm-Gg: AfdE7clpnThMIdeoBePhMztnKSIBu0FesU916++/JaN9fol0A6FXJZVrIFBOjv65GWL
	4lI0JJvMZWhCVYDMbIuqyBdBCdUqvjZ0LkJf+7WKwkwB7WHs4YZG9fVzezoF9hYxc7wEWEqJw1D
	jEY51bDMY0CH7udEa7giDj9XyURauvgLHLbUQi3ZDNOycYSBc58rT5VcmwYtYVLRrcSBHKwGwpc
	knbr0opVXI2bdcWJubej/6GcWZIuxnartvJiheqGTODGSIvRf1EgmCbkLGPya4+PZYOgvKU7dIa
	uUpv5fOm0mr05XhSxLM72aDcAYSNnOdIiegdY4XEliQFG9N358pTsZn9l2xSOsOw3js+24VEYCs
	G2E03uiom8r+wTWG6/SMzpDcYd61ZqBZags0=
X-Received: by 2002:a05:620a:29d3:b0:915:54b2:582d with SMTP id af79cd13be357-9293e3c784cmr129979385a.8.1782377058139;
        Thu, 25 Jun 2026 01:44:18 -0700 (PDT)
X-Received: by 2002:a05:620a:29d3:b0:915:54b2:582d with SMTP id af79cd13be357-9293e3c784cmr129976985a.8.1782377057605;
        Thu, 25 Jun 2026 01:44:17 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe05c22sm132561866b.39.2026.06.25.01.44.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 01:44:16 -0700 (PDT)
Message-ID: <77a5213d-6be7-4a86-81ad-3509a499ad12@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 10:44:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/13] arm64: dts: qcom: shikra: Add support for
 DISPCC/GPUCC nodes
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-13-8204f1029311@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-13-8204f1029311@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA3NCBTYWx0ZWRfX1kRCUOwyf1Vx
 juu/hCmgFruF7ria31DXtNp0Kdp+YbhtmkL3DtpDu5p9qcBYy24SbRo3hK7BsEJZU3h/c4BC4rw
 DC7R0LF5K5SW8bkNmGx2zANkcWbOs64=
X-Proofpoint-GUID: jMoFWlRUwwF4-ndEU8Vxpclt6ER3iIgg
X-Proofpoint-ORIG-GUID: jMoFWlRUwwF4-ndEU8Vxpclt6ER3iIgg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA3NCBTYWx0ZWRfX1orthoIJWgh5
 NLc7jPrFuvFDPCl+epMfQ7esZKBiKWoalFCRtKGBSZUuom+P3DBx8pPt4gxreR1ZtwK6IZjsEEs
 mW1EmNJnAZnyJ+/Gqden8yx8ZdmPn0lFBnlqgbZHXKCb9wHGM5SI2/1MxVFEFjapOjOTHbi1UvN
 3WVx0XHldqjIUIWTc1wbDLzUB5XYOMs2gbjhAUXSWRDpbq0s/FBeUvDPgIsA6rfgL7yxrA+luE1
 MeGxu04UUHOwFuDsji6J5aTJhmDJZsuJKj+U5agTu31Y393Dfey3rTG0fQpCqdz0kC1Wq4MiTAC
 TdwiEXifP5Lpi2mKe56CBmHGPF16/m0Qjet3PQrVXb+ERFKmoNJcEfJzUyAtvT08YvhhJOyG2if
 Wtjr86x7ISfM0UFomQXCvWlOE/76sL8JQULignsXSmsB1xkV9UxQ0+FU48rCg5LKafaS0E/JLBj
 nzgWeW5O8C43wXB7EzQ==
X-Authority-Analysis: v=2.4 cv=Z+Xc2nRA c=1 sm=1 tr=0 ts=6a3cea62 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=9L-xRQyfrTjc-s41Cp8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114471-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7EAB96C3F09

On 6/4/26 7:26 AM, Imran Shaik wrote:
> Add support for Display clock controller and GPU clock controller nodes
> on Qualcomm Shikra SoCs.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 41 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..1ccb0f1419aaa34d32f3c3eaabdb8727a497b501 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -3,6 +3,8 @@
>   * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */
>  
> +#include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
> +#include <dt-bindings/clock/qcom,qcm2290-gpucc.h>
>  #include <dt-bindings/clock/qcom,rpmcc.h>
>  #include <dt-bindings/clock/qcom,shikra-gcc.h>
>  #include <dt-bindings/interconnect/qcom,icc.h>
> @@ -640,6 +642,45 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
>  			};
>  		};
>  
> +		gpucc: clock-controller@5990000 {
> +			compatible = "qcom,shikra-gpucc";
> +			reg = <0x0 0x05990000 0x0 0x9000>;
> +			clocks = <&gcc GCC_GPU_CFG_AHB_CLK>,
> +				 <&rpmcc RPM_SMD_XO_CLK_SRC>,
> +				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
> +				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
> +			power-domains = <&rpmpd RPMPD_VDDCX>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		dispcc: clock-controller@5f00000 {
> +			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
> +			reg = <0x0 0x05f00000 0x0 0x20000>;
> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> +				 <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
> +				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
> +				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <&sleep_clk>;
> +			clock-names = "bi_tcxo",
> +				      "bi_tcxo_ao",

Is the AO clock going to be any useful? Taniya recently dropped it
from some other submission after assessing it wasn't

> +				      "gcc_disp_gpll0_clk_src",
> +				      "gcc_disp_gpll0_div_clk_src",
> +				      "dsi0_phy_pll_out_byteclk",
> +				      "dsi0_phy_pll_out_dsiclk",
> +				      "dsi1_phy_pll_out_byteclk",
> +				      "dsi1_phy_pll_out_dsiclk",
> +				      "sleep_clk";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;

DISP_CC also needs to source power from somewhere!

Konrad

