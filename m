Return-Path: <linux-arm-msm+bounces-112365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 87MGHuQnKWqrRgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:01:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B947C6678CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:01:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hJP9iZHW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AkcBNvbI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112365-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112365-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7611030D3413
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6950C3B5F59;
	Wed, 10 Jun 2026 08:54:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251C03B19B7
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:54:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081660; cv=none; b=X4deXBjMGnIGv/kytBWWrC38V3LIi+LLryAKxBOBFVDOQrrs8MMSWnUiwktsqskHBZ0/HR3qru3hI/tevGcr6SYm5V1iCF7wACmqfYaWjdgShArofsJYGSkjaswiq2GJQ82UXnJ+8HG/mN4I20d8gPF5WkkOXD2ydmVJsAoOlpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081660; c=relaxed/simple;
	bh=+Xxv2iMVAb9T+aphjK66OgMMwBlWTragL+FjrC9B7yI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rWduj9c9j4NTqVxR61OQZGvzcg6BpY3SNXXo2x3BhpSDvppRXwcV0eKgDgbo3HTVah0FGccEUjt4hYevvHUGt5c8fXnuFQRZPnXfcdLZbgMEUI94vd+aBFVoHfPKm9yNZsN0Vtebo8QokwblFE02Ecud+LKAFmmnS2Xyy/ZIbVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hJP9iZHW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AkcBNvbI; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7iKsR992605
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:54:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0voObAuVX8sMCu0eQenacXHJUxKc0dgwt+rySh55wjk=; b=hJP9iZHW9ePXHXOO
	iu8Uw1cwKZd3tZXTvQoIsGzaybsZmhr8X7bPmPZCtbIe/L5Sshp9yji2VkFGU7xI
	5iXz/YWnqlpuOaWBJZKxbWdFuH0PcqIUPS06iWtusxJKL64K7Luu0veDngGu8Uer
	lEomhNfVZsnn0xGyhUWib2sxwc65T5V2X9v+JIeIWPzjpIOZWzCqJGM67KxfCfH1
	4Be2c+zrS7C4hJ/kNcAms9YYcmHMd7kbnA23lqA/zBqnnS9pvEdyRFj72QN7rCNi
	kgVAw9l7nrI+jqHTG59kj0ca0aH3xY1LoMPZslExNexBV6PakjQycgmwIKxEoDlA
	LUQbSQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq1tg0rf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:54:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ccd9683350so19565336d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 01:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081657; x=1781686457; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0voObAuVX8sMCu0eQenacXHJUxKc0dgwt+rySh55wjk=;
        b=AkcBNvbIIOw8duPTeYxs7p3+BccTVbxaHrOZWy9btlDsGZ6OEfpHE1zEgULznuUzUj
         ngLYOSISSXDVnW9ejV+Q5J7olCX7hNMrs9hTCNZGCM5/lMG2o2gzDp/L9lw1lkpsEw6d
         YZWAdhWxz9ARfYENQIhvUI/iwWJWaxlVnsmlwZbXmyxFpUIKXnU0R6yTkpGlopqeZQ30
         zCFflSGFqzmoD9Qi1yQWJGhISrgBvljxLPQ4z4fXdnOgzcbz9/0rAmigk9yDBUK3PmBx
         5sEq4W8RaUWXnwDCXNQiAh3Y1aXgF+Yf/pgOx6G/qm3fzG1vUGgMVE9ADDtxsY+rZWDq
         FXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081657; x=1781686457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0voObAuVX8sMCu0eQenacXHJUxKc0dgwt+rySh55wjk=;
        b=orgcXkZQf0JCtzzqhUbkQZZpMkN5q7ngMAmjdejX4XzVBPzOPHt9mulrzUXbLbrZZq
         xDE1S+x58CCVCnC/UzbWaYLo6ywz7IxbNmvd3oqtgpgVILcaBaWSfdr3d2KlVjs8rKsG
         O2ea9Tkzc8DKTJRfTRM04eGkXHqgwcZAbyc+NwQ2cxCa5a3yk8EweVoGd8fHymkon6DZ
         OzYjc4ihrf8HFe5vTSH24tZtMfqpzZk3yx+WpRSHHAw+s/Lce1ZMTkMCLQC3gwZsRI0G
         V/A3Fv1ZkvK7QtWLTZ0j0/XQdZsmTe5TRQ5unv+SuMuvdRl74+g08oHLuj9DfOreuFHU
         7+OQ==
X-Forwarded-Encrypted: i=1; AFNElJ+C4szeG1MgOa19DcXnLNu0lYpyzKrotaylvXVZgeN8lsmzzdYq3m/Tb47ljVu2aINUblBShpN2G4+WHMLL@vger.kernel.org
X-Gm-Message-State: AOJu0YwpdgDewxDxyCgtdS3FerBfykswlNXdnPeQlmZviQSuLMDkoqm3
	i8kpBzZ4xIr/zgZIyI0x4TC4z98WJ87H8yI8SZxydY17aGqMPOlZV7c5stkEk4o9VpUYqtgKi3Q
	Yb4DS2nIcBDx/zx/b5PCBkmSrnSkdcBhBqQOVkFSl1e8our6yw4R8bggAEo70ivCTqbXr
X-Gm-Gg: Acq92OEXSm9kHNsGasGhAS1nYc7D5WONmO2w94Urk52DNN2kOLrl4q6yH0BApYdUmh3
	3BpsP3MLikeVhTHnQkaYUf65IJtLoqEEUD+/7a9naQ/aKAqkXM9XMVBqQ7102T5jxZqP4CNwr53
	p121zvULmyWU1tTR00fAYQSZSd0P6YQSs9orI9AvVnPKJrDReyBU35FO3HNvwPPRBZG7VtePVNn
	nk1Wrmbf/RFqQne2IX2akIKtLJDH3bdSC8Tnedv65aI01HdaKKRwiphyfaxLssX+sHV9OUMAMLQ
	f56opqg9AknSTAlU6rMAwA/jYkSqA/G2U2oanfXobZazZkpNtjnL39Tjh4wVldX7ZiPv4qSmcOo
	Bn3VJS+Bo2D7iXhAVfAH1wJV4lnpDDeZqwHXyucuZ0whcMRZP/D3KwiS5
X-Received: by 2002:a05:620a:2892:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-915e6baf76cmr725470685a.0.1781081657452;
        Wed, 10 Jun 2026 01:54:17 -0700 (PDT)
X-Received: by 2002:a05:620a:2892:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-915e6baf76cmr725468185a.0.1781081656950;
        Wed, 10 Jun 2026 01:54:16 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e086fesm1183744866b.32.2026.06.10.01.54.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 01:54:15 -0700 (PDT)
Message-ID: <49a0e51b-a0be-486e-acf3-5725551d1715@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 10:54:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: monaco-arduino-monza: add ina232
 power sensor
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260610-monza-ina232-v1-0-925b0d12771b@oss.qualcomm.com>
 <20260610-monza-ina232-v1-3-925b0d12771b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260610-monza-ina232-v1-3-925b0d12771b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Rujrsit86_VlRVHeURqlN92PrrXfii_Z
X-Authority-Analysis: v=2.4 cv=dLmWXuZb c=1 sm=1 tr=0 ts=6a29263a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=STQ2a8oQ04ts6E9hehUA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MyBTYWx0ZWRfX+E4/Pvg07pRa
 hB8hsyEji2B0wzFHZCWz9AeCZC6TvfIZy6r1z3xsmkEf9l/c84K6WKhybEATibNMrzqfp7rGGEI
 iN26YxehRzpxSuH4wYcYjcQRnc+U0SB+Eq/1ZrohUTPcNtWJxcmi5NLbP0lcVu5110VDuRboJqu
 dZypaGqHdv4cDbon9Y6ZvNkJDPdo/MNUzDTAOeKfm2gJ5Md9R+piTNSBUYeLn3ld2LN6j5DeWb8
 2NB4O/GjUHw155ZISS9ECPs7+qnfFZD0cwJZsYxwMlJJjtZuT3qKZMAVrBl/R/YaOOIdR29HBPX
 DztWMgc0ByvqJRdNkqNE8RSyyLVfwUGZuk30BONF0ZPCTVeWWHVUD0pocmadDKYynY7B5M3E1RM
 e1/A/oX+GhNPYmxeyvKSEVnqTF8pEN7PpcsZWXwmh8egzMLioq0h7oyotC2lXZoWE1qbCCSbcLJ
 QY7oN/VzpZyz6P6FR4g==
X-Proofpoint-ORIG-GUID: Rujrsit86_VlRVHeURqlN92PrrXfii_Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112365-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:krzk@kernel.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: B947C6678CF

On 6/10/26 10:32 AM, Loic Poulain wrote:
> The Arduino Monza board has a TI INA232 current/power monitor connected
> on I2C12 at address 0x40. It is used to measure the board supply current
> through a 2Mohm shunt resistor.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> index 379b796f261f4c8f6b7712c5d340b20be1b9217c..a526c8a07b30c22820f54b54644916b268496209 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> @@ -291,6 +291,12 @@ adv7535_out: endpoint {
>  			};
>  		};
>  	};
> +
> +	power-sensor@40 {
> +		compatible = "ti,ina232";
> +		reg = <0x40>;
> +		shunt-resistor = <2000>;

The commit message says:

"through a 2Mohm shunt resistor"

and the bindings say:

"Shunt resistor value in micro-Ohm"

Konrad

