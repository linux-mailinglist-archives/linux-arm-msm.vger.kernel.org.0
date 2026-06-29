Return-Path: <linux-arm-msm+bounces-114851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XSu3IXAUQmpOzwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 08:45:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1306D6793
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 08:45:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=V5SVKwOH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="YEA/RPqm";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114851-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114851-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB3C9301CFF2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 06:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B1C639D3EB;
	Mon, 29 Jun 2026 06:43:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3598539D6FA
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:43:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782715427; cv=none; b=aw9UYY9RO7+Umlec9MYtXOEkIuRekMwJa6+8Cgos2gyCh92dCsEane2hSmlYPDkKDN2r+0uHSy/b6C0ODiFVs3cNhrzvQvSDb/u6gNr1zhjARnbj4wXbhtb6FR3ZDCwnp0lpkx0TndD5/qzYT5LVxsH5C2jHWWs2/xDFwCI72Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782715427; c=relaxed/simple;
	bh=YtI/a8V3VWHkMUyvr7qqdakggCFkROYEKEL0ogcwEec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K6+qcK932rtzo5rsdHu8zNRbk5rHddUQnedczI+TyKKObXyvNhQl9rC2QLVjYvKbwNELHl2bMfcd95MJQ07AbNv6RK/Jfm2N5sGfv4rJTm/YU/nY1m3jYdf9C0TOIeaA/nXM2Mhb/zDLOqsx3PoNxfVD5LsqadOZkulxvvRMt+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V5SVKwOH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YEA/RPqm; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NFME1729613
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:43:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oeev35a+fYiBHIAn2kEt/OV9882jmuAqnxY7YgH70c8=; b=V5SVKwOHM6OdgErS
	QpJ2G2DxgHm6YgItSmHOkHYZPI1pdLRFDwISAoZHWwHBR37rPuGhe9bJhgMmuiRf
	925Qmp5b0HW++API94cQ6wjg70SI7iihaN1FxCzFXYKwFrrv5d4VWfQGaUf8NxOT
	TAx0aoMYu/+CvkUHHB233YNR82wmnDgV9sBQvTNzTY4/oK8pd3EeWNzbmGy6tnXJ
	tHgaUOeJV1zvMC37jusZ7sDOLjUefXftty9H/nJi70Riv6GuFAc6fM9/WKzVkyD0
	p17CQictIJh6dXtLaDHUxBDDnjHx94NKqnqrJwZCy0MDi0b4gj6TGsm7DnVO1oNd
	6Vq0OA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27t7vx7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:43:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c6afd85980so23751485ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 23:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782715424; x=1783320224; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oeev35a+fYiBHIAn2kEt/OV9882jmuAqnxY7YgH70c8=;
        b=YEA/RPqmU3xBkD/WiOWbDspZ7XPSiSOW294hZE8O6IN7EvU+5n4DqttkQU7PIf5vgu
         fQNxI7jeX+TsSZs4ZfBy/WZMIglcKXZ5FdQXubG7Iduw2pENt5l3HC2rmnNqR9QtesGE
         M04b+th9MAnCBUHb/oY9r0bszz04+ykBDF/+cQrfuwQkm5FtdkEA6Nb6GyxOuTQhzoh3
         IVfoj134nzQvCGxLrUJ03Qu3/+2HmpFvgrMhbl9dKPLcpUsDwgPq4+x+YfZHtQTdg25S
         gVHo9A/gFzTBf2Z3Lg5ThO61rno2WEHk8HIo1XAACww3ujJavEBZM3XsizLK6jGI9SHC
         spEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782715424; x=1783320224;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oeev35a+fYiBHIAn2kEt/OV9882jmuAqnxY7YgH70c8=;
        b=W+muWia0UI5kszITjHcyyVGCL4zuSu3iwIlK6JD8SXQ/7iSWtV6dqiaF3L7pkD3JGu
         unEM1D2SJ8CNwBPI6wl5jXLnVRNbFEtUgk2FlbfLcoYz5iiRUbjUIwEblIICDYt4tSrI
         dJA8TMvY1aliMThECajBNkunivjeZtOHke11OlYg/TraJBA/m8NP4r4S5S8ABz1ODknO
         BECfRsXNjHCr/DGbiiMb8GFCNOm4wJ+wOMZCTZgWCFSlyfJ/RaQtL5jS9syKl9DAUuO4
         0TgHSNticrzn8RmHkZ9+v+uH4fAlbnBQqw4F1KL+9YAyR3777Mimoiyly2XsGOZn7SJU
         E81w==
X-Forwarded-Encrypted: i=1; AHgh+RqML/2ucAd6M3I8TTSOt/g/4pygVn0+FPjJcHmBDqfn2VWCFTvIdODdrFVkRkMlzUQENjOHv7zUroO+g52V@vger.kernel.org
X-Gm-Message-State: AOJu0YxFrIJz0HFZzepH8YEJlhkUUN7W3LZzx/4Kf/Viz7POJCf5jArd
	Kj1rK+dXjEKpt9H/UqoR2C2AmVddNLuk1hUpBQ/h+lM6sArRCjkuqqWEwEACjweWFcAYNqrn0LD
	aYTuoOXgbBMYCkx0FKqe7moBOWfwow/vidnDnp37XHzY1IORynSTyELwOz2nf4HNjr+TA
X-Gm-Gg: AfdE7cnx4JvMv0pja3lQ8PuEB7d8h2m+WIF1uj4udwH5fr3bNfU0tFcf5/KZ8+HN536
	pzvJq0lexF4iMr7TJTUKOMZcoJFyr1n9w8/d5zida7BcBdKL000xKqpEkdOiISPmCv4VZOD13Eu
	BjE5i06Kt/oC9NLP7vkLWoq5gle9oZN8hT1gfm9m4z6bkmCZmuzEV2gZt1LwM39YHtQ6PHcY0s4
	YdHLRm9sTHRELHhf3pzQH9RRrG5JYTPgUAAh9yAB8J94KaZWixoa8zRFgEJ1FsLtxJWftA70UJH
	+yW5myVeRtuyRDCpHpmYSSbAosV0SihQUCWvePGK6m3ZBScGZ+hDWgdp/uon3KxzCkyU5YvnbZZ
	K1wguzVhh93VuHBrL4McOD1ZqgG8ksUDoRZ2Tcw==
X-Received: by 2002:a17:902:d585:b0:2c9:afad:c5f2 with SMTP id d9443c01a7336-2c9afadc67fmr70320355ad.45.1782715423742;
        Sun, 28 Jun 2026 23:43:43 -0700 (PDT)
X-Received: by 2002:a17:902:d585:b0:2c9:afad:c5f2 with SMTP id d9443c01a7336-2c9afadc67fmr70320155ad.45.1782715423304;
        Sun, 28 Jun 2026 23:43:43 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c8c940b55asm50724605ad.76.2026.06.28.23.43.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 23:43:42 -0700 (PDT)
Message-ID: <3f8d117c-2ced-480e-bec6-0bd38a60b7c0@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:13:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/13] arm64: dts: qcom: shikra: Add support for
 DISPCC/GPUCC nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <77a5213d-6be7-4a86-81ad-3509a499ad12@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <77a5213d-6be7-4a86-81ad-3509a499ad12@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA1NSBTYWx0ZWRfX8xKTVJTOL0Rh
 4KTS55qrtf7VhVnJGrkjLfy4OI6HtRuLrFK+nRewZZ8y7pAQnL262W//k5q4PpFohuCypmJincP
 FebHVARk/pZci/KFCpNSxWF5DVkbgFuP27RkRid3HiJznatfIfx0GqRSeTdfWO1w/+gthaSjCc1
 PfjyieTFhzjth65vuocBKP3EVW7u+XRTDqngjRNF3NDgAgxDSrBVWuComfmdban+d8GNLyi+jW5
 juN898nuCJRh03RkzoTqdoKJ01GFioJXfgk1RdRRvYqobQ1bofn4B+7TsWG3BKrS3FmZLAd5C3J
 E1PMgC7E1JpXEGmCTcCfaVsXJ0gpEomRmzUfqPPydFDRCi6zuw6sulnD2RPSLDGa1D09W4ZaI2W
 4WK1uwVjtptgJFaDb5j1niO6hcUuO/cc2wq/B3w/8Jt0gBhKB3qfJZq99s8IKwl0u8bB/a6HBzi
 0t/Fc94LlTrejVO/1pg==
X-Proofpoint-GUID: PYYYaooONlN6R6W2v9m9u8rQGGIiOhWp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA1NSBTYWx0ZWRfX0KXT4nBUMYLP
 olZgO2KYHNtGHICBl/e3pD2n7mhu3SmpWxzHwxcP7akSHVjQIuoY7dVhA/0wdo/UMplElHpISKP
 XU7DZ6x80p+IUW34EtWiRxTX4fb3LNs=
X-Proofpoint-ORIG-GUID: PYYYaooONlN6R6W2v9m9u8rQGGIiOhWp
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a421420 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=LPMG5iTiuM7aS0oOI1MA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290055
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114851-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3E1306D6793



On 25-06-2026 02:14 pm, Konrad Dybcio wrote:
> On 6/4/26 7:26 AM, Imran Shaik wrote:
>> Add support for Display clock controller and GPU clock controller nodes
>> on Qualcomm Shikra SoCs.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra.dtsi | 41 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 41 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..1ccb0f1419aaa34d32f3c3eaabdb8727a497b501 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> @@ -3,6 +3,8 @@
>>    * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>    */
>>   
>> +#include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
>> +#include <dt-bindings/clock/qcom,qcm2290-gpucc.h>
>>   #include <dt-bindings/clock/qcom,rpmcc.h>
>>   #include <dt-bindings/clock/qcom,shikra-gcc.h>
>>   #include <dt-bindings/interconnect/qcom,icc.h>
>> @@ -640,6 +642,45 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
>>   			};
>>   		};
>>   
>> +		gpucc: clock-controller@5990000 {
>> +			compatible = "qcom,shikra-gpucc";
>> +			reg = <0x0 0x05990000 0x0 0x9000>;
>> +			clocks = <&gcc GCC_GPU_CFG_AHB_CLK>,
>> +				 <&rpmcc RPM_SMD_XO_CLK_SRC>,
>> +				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
>> +				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
>> +			power-domains = <&rpmpd RPMPD_VDDCX>;
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +			#power-domain-cells = <1>;
>> +		};
>> +
>> +		dispcc: clock-controller@5f00000 {
>> +			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
>> +			reg = <0x0 0x05f00000 0x0 0x20000>;
>> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
>> +				 <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
>> +				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
>> +				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
>> +				 <0>,
>> +				 <0>,
>> +				 <0>,
>> +				 <0>,
>> +				 <&sleep_clk>;
>> +			clock-names = "bi_tcxo",
>> +				      "bi_tcxo_ao",
> 
> Is the AO clock going to be any useful? Taniya recently dropped it
> from some other submission after assessing it wasn't
> 

The Agatti DISPCC driver is consuming the AO clock for the MDSS AHB 
clocks. As we are re-using the Agatti driver for Shikra, kept the AO 
clock as is.

>> +				      "gcc_disp_gpll0_clk_src",
>> +				      "gcc_disp_gpll0_div_clk_src",
>> +				      "dsi0_phy_pll_out_byteclk",
>> +				      "dsi0_phy_pll_out_dsiclk",
>> +				      "dsi1_phy_pll_out_byteclk",
>> +				      "dsi1_phy_pll_out_dsiclk",
>> +				      "sleep_clk";
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +			#power-domain-cells = <1>;
> 
> DISP_CC also needs to source power from somewhere!
> 

The Shikra bindings aligns with the existing Agatti bindings, as it is a 
re-use. And the Shikra/Agatti DISPCC is on CX rail, and it will be 
always ON when APPS is active.

Thanks,
Imran

