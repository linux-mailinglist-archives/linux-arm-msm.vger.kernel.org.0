Return-Path: <linux-arm-msm+bounces-114515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5pCqKUwUPWrpwggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 13:43:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A86226C5390
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 13:43:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=X2gd777n;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WtpATyup;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114515-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114515-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A5423303CE33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08E223D9DC1;
	Thu, 25 Jun 2026 11:36:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0583CF02E
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 11:36:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782387411; cv=none; b=qTRbF+B+TcatwTv0PYy6lD4RUO6sTE1AXu7ChGZPhtWba0zznzE5GUqoUxXk7cDybBXIhGjKf5YjXs+xFv2Vx+QpuvScbNGkiOQTlkVusq34VYi3zbMLqSVjqwSOKcyLqAOi2pGLZ+8Kt7hzFcwateEYcyNmdxbiyukm6VjlUq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782387411; c=relaxed/simple;
	bh=EKoghlk8RH2zNWov+Ldx9Bakuy2XIl3xFyMtc1/ag+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ft4clnt3FowIBFF8IbJ52H3uGwBSdRbojn/hIfLrOu5CsY7ygZLMk2jipEphb3S76tzm07wrG+YVf20GgP1RTVUdGuPpZ6MSYkXSd9bWxABtCfHRPtv3S6Rkv711hgWVP/DeA0Y6tqyAaIaJNlEChANbkE1r4Y1YpRv4zO58Euc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X2gd777n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WtpATyup; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9jshF1454344
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 11:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WVY/1XuYxAJzExKXdHQeGSKvfHtqz93hoztP85UA33I=; b=X2gd777n8egnysoz
	xelcUMjWxePk5DhDwNcAZk/WsoU7MGigh7XE76wS3sA9ohFY5KTFd6MACOV/mrny
	iv7u9KBsa2bl1NI/oLOhoOw0Vqp//8tlizfWLCidjcD14MhY5xG+WZcmKx37CzkO
	yqFt84dhhTY2Wt7JHNOf7VvG+9GU9DjKVGD4GZxDMKQct5Vd7NbGusMzUGY1gqNK
	2XeEXfcDqf17zhnIb6E4Lf3rcGnOy/cLftKGXq80H/iKbMiukCDyW1KJHFyjm+XC
	bSIY+sJW7htd6od9SreojJ8QKtHRj7iGCyEMsNSIWERiv+QyjhyA4Zn7bYt0+pwL
	+UppEw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0mjbue8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 11:36:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5177b12d7bbso3913281cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 04:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782387408; x=1782992208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WVY/1XuYxAJzExKXdHQeGSKvfHtqz93hoztP85UA33I=;
        b=WtpATyupeDwKW4nuq5eBTjOvmO5zFM96eME5bohugOJxnHJHYnNf2dign71pS47Lx/
         NiXU2zPcBwY2cRBh92cn3d1jXTxp/hQCwPaf0+9H2+eLRs0nVqt/a5dEDp5rp6J08c8K
         ea+LGb+B8o3bitp2xJbai08dFPsYN5pADQMpJPUPyrnq0cliYcSoYAnu2ymTYohT9+UM
         uaAT4xpyKaojUxLeVAQo5kZOs5jPVoy4Grj2kweVQihcTfdOfhtqz+4YNzGKGVuv0wUN
         D8GTDhZmqZMFtjdLaHIywAazfBVzF0nhkFk/tK/ORJaOg5+MNuXmS4C6m6Kx/VYgh8gG
         Pl/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782387408; x=1782992208;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WVY/1XuYxAJzExKXdHQeGSKvfHtqz93hoztP85UA33I=;
        b=fbf0+TXNGm0TklxXP+Tnxe9h+2+pjmFQTS1PljmOh382Q45Y0nfb/TOrcgBenZH4HC
         wvWIXoU4o3yBixT1KXM3bSw/oJH9t1v1Fio9BN2H0hIQI0KjhcKkJfa13XLT480eZIsW
         fG3TFpEIYefMo4G7ADazmo3991BitFul7eahtigW0PbaQcQx5ajs0EcNRAdQZrZxIgSt
         v3xtrKu0eX4nMUcK1MKg0nvYM6GSmsypHXeRcbeVqAtGRWiu8vCjn6aOYqof1KoDCy3q
         goyCRS10XPie61lRYD4BnjPZg0tQZYfxJ8uNZA+OBvkb3+aXk/DP21Pl2GW00KN/wcnp
         Pmwg==
X-Forwarded-Encrypted: i=1; AFNElJ+1eGCSaqzAgMHGsJ6Nl745PcMMXN27K+DjlokSIOZevEhDmjsWJVlbed6pplyXqFkMnVqW+GF6oblSvebp@vger.kernel.org
X-Gm-Message-State: AOJu0YzeBUCT8vI9naAR+ZyK7yWaSy3NdXcF3TiFebv3C2rqzVqQmAJl
	CAGH2gmuy+vggdxjnIUPDv0/r7b/oMKOC/rbx/t8fp8ImngteKwOQ3PwzrHtljvcij+KihbImGU
	WAGSC7/AQaUqN1SB4FKj0482I8ylGFZbKX2/LZMR0Nvj+ANT5qEjLQf6M0bvJ5Hexa3ZK
X-Gm-Gg: AfdE7cls2sa6OWb3P1nZ9yek9pVcZNINeCPTkXVNvEbHgKSOwVK2rBgslP87ht4hS4v
	c6C2hkruIJdbQLcoO4aNhPtJg47U3EPkdi+vdG6Pb/kM8ZB0RSX3Orbl9yzXgfRsH73edcWmGth
	sIKFG/XTWX8lM+d5QkWEmrPaUwVGuKubmsf7ElYSGfuDTcbzoH3Vlv8wqf8mpRvXQBQ6QgoWCzd
	l2/AyBC2SNh925J342rTX8uo4OrjeR1UTZ7jyIlSHa8DGbQsaLAHjK4i2x7DxAfMds2xiY/VBQ6
	zwTeR3gh8XB9n01vvyCv6+yZYxRwqAlL9cRmknxPKXYl/0bxD26/pMg6gOhkPdUqPX/2CbAEzSI
	uleWfe/wv2YLonfe+WYEpINPdJNjmlf5ja7s=
X-Received: by 2002:ac8:57c5:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-51a72a47ba5mr15818741cf.3.1782387407662;
        Thu, 25 Jun 2026 04:36:47 -0700 (PDT)
X-Received: by 2002:ac8:57c5:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-51a72a47ba5mr15818501cf.3.1782387407280;
        Thu, 25 Jun 2026 04:36:47 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbed6c78sm161489066b.60.2026.06.25.04.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 04:36:46 -0700 (PDT)
Message-ID: <ea233160-505d-496d-a321-dc23e7f69d80@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 13:36:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: x1e78100-t14s: Add thermal zones
 for keyboard skin and charging sensors
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, sre@kernel.org,
        hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux@roeck-us.net,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
 <20260624210825.264454-4-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260624210825.264454-4-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA5OSBTYWx0ZWRfX1ZeJ1tNujh+z
 vzZxP6/kzVpsqlyaryG6Mmk2nX54HhYKhTQCNeImA5H2cOoY1UkUWmE0w/zbFKuofgTuRyKaxi1
 pscsTpB6YmEM8OXeCtooLY+LV8B2YPQ=
X-Proofpoint-ORIG-GUID: xwWSu0ZQF80aOEkWb4yPGA4n5Z1CeUdI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA5OSBTYWx0ZWRfXwecikSAjbcvm
 HNj7GJbzAkBdjpkwJjyphCSwS/qXyIuAB/KrFf8OFgEgNEV/hSH0Z37/obKIeJPHsId37QKnpW3
 /CB2J5U44lse3wthKaGx4vSxEfRfoqTvBJvvZw1DRZubw0VQg8ZCpgcvgPfsyBd4AVnz9V2K18y
 AtVOCJ/nI4MHAShUj+toTGkdajY6iLnB2+92P0qRMBS3L0kKsVo0PoFpsmt2PDt0gUe7V6lkDq/
 4SixlmkzgScJbu5aqqVhpJ+0DXHN8f8dUTG2HmRC2AgJQRBtiOw+v4PJrs6kQKBZ+ku2YqdqUOY
 ZytuXyIKMvULXGxnVa8sim0X18Anr1NZ6udA7+yycRm3V0SRwsAz5PygRLspZfEAWxryOws5DYQ
 +IpnDxAAWce21sqKzH7zayfI6JuluhA+BEWhfC4EfBpOTEljCPLLYgwbofkMfnFaBZQ/Ag4LgeT
 Rp55djNoxtpdc6lb+hA==
X-Proofpoint-GUID: xwWSu0ZQF80aOEkWb4yPGA4n5Z1CeUdI
X-Authority-Analysis: v=2.4 cv=TcSmcxQh c=1 sm=1 tr=0 ts=6a3d12d0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=68P_60IqByrghkTM5uUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114515-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:daniel.lezcano@oss.qualcomm.com,m:sre@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux@roeck-us.net,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: A86226C5390

On 6/24/26 11:08 PM, Daniel Lezcano wrote:
> Add thermal zone descriptions for the keyboard skin temperature and
> battery charging circuitry sensors exposed by the embedded controller.
> 
> Expose the EC as a thermal sensor provider and define two thermal zones
> using the temperatures reported by the EC:
> 
>   - a keyboard skin temperature zone with passive and hot trip points,
>   - a charging circuitry temperature zone with multiple passive trip
>     points and CPU frequency mitigation levels.
> 
> The charging thermal zone progressively throttles the different CPU
> clusters as the charging circuitry temperature rises and triggers a hot
> condition at the highest trip point.
> 
> This provides thermal framework integration for the EC temperature
> sensors and enables platform thermal management through standard thermal
> zone definitions.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---

[...]

> +	ec-charging-thermal {
> +		polling-delay = <5000>;
> +		polling-delay-passive = <2000>;
> +
> +		thermal-sensors = <&ec 3>;
> +
> +		trips {
> +			psv0: trip-point0 {

"ec_charging_tripN", please - these labels are file-wide, so it's
better if they're not overly short

> +				temperature = <55000>;
> +				hysteresis = <0>;
> +				type = "passive";
> +			};
> +
> +			alert0: trip-point1 {
> +				temperature = <63000>;
> +				hysteresis = <0>;
> +				type = "hot";
> +			};
> +		};
> +
> +		cooling-maps {
> +			map0 {
> +				trip = <&psv0>;
> +				cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +
> +			};

Stray \n above, might also possibly want to throttle the GPU.
I don't know.

Konrad

