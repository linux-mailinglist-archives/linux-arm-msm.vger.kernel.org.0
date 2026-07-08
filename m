Return-Path: <linux-arm-msm+bounces-117525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YcMBK6D3TWp8AwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 09:09:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 534887227DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 09:09:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kb989Jkh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="B7/t26ct";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117525-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117525-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C2CD23089FFE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 07:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D97CD3F23C9;
	Wed,  8 Jul 2026 07:02:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD2B3EE1F1
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 07:02:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783494142; cv=none; b=D5tn3jCXN12TKCABn+Ur84eO9jYD9JtGnqkQ6s5lBtShHDWFBM9hmGx6uBxtgxq03PiW5yoGizACjn/Xu+5C9Q9htPw0Uy4WtZX1uoreZYBAXIl05fQqYvMgCYzD2Y/Y5bS05IYV03yY/KTlCvlcM7r8Yo5VH35EVHhnvtUV/sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783494142; c=relaxed/simple;
	bh=a3+u6bqen98RIltbKM6R1AY88Zbb0gytbixnAWAgASE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p8vtagYjY0LHCFu9PvbEZdUQWaFxYzLWKhYDRDK74eEAe4b1gYQSPHqLmWR0PfDAYOIpPn5KCoEsgmXds3r2GfjVTIFALQi0ft+9ubxWi64ysmIgQFEC9VIVIGef8mMvJFIpOU1EIpPak+Km9KsRCz8qS/hNlJvpgh5kp17qxgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kb989Jkh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B7/t26ct; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842HjQ1656620
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 07:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5E9DTeuL9lwGprVKTcT9XKG5hC9lDtVWiXIoh7IcYJ0=; b=kb989JkhavL4eLHT
	Ktxl4S4vvQOKcki9R+mwvzLR40NECxNBUvJDrry/pDfepNyOJ8mhOZC0tgE/+NXi
	6V1L9OBrLpQ9vxcuy0YYyWX3OErwkqV89hdpnRe5Lvnhco5VKo7/xP8rn2ZnfERv
	CgwtA07A9euns8bxwxU9YE9DeCTa+dJ+p90PHW3diNI0p0CnFn7wwS1dEpknrrZD
	fW8NbE31YkDvw10UxWLmPCAWes6+OlkyL2cZzc7sQIyoI5EQCSE+2S0Ng95hYGU+
	IetzJ4mPofI2HKF6kB+rYLUgxJ6RO2QgkpveuwPvQsalLuDv6JGUWxrogiROxtHd
	sMF5PQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9csss5a3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 07:02:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1e777a15so951771cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 00:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783494125; x=1784098925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5E9DTeuL9lwGprVKTcT9XKG5hC9lDtVWiXIoh7IcYJ0=;
        b=B7/t26ctnW92AsaNRaHaYJbOmU5Reh0oDfq3nYUFp8QSao04vXXlcO2pVwuRh9BxVu
         d72Ry2TdlEs5fGLbAAdeThtceFCKXx0DD5WfFAIrXOOsioUFP4iA2YQj569U6M+MdcT7
         Z6p+xDAT3XgN6GLat0Ftf4KTBFPd0/HZioJfJo7CgqguHgTR5WZkntTTmzj25WHgoWK4
         yBRuu5Ivk0Ctkto9yPlP6GSDBRuzDNNXL4amp6onnmq/MZkZ9l+qdmljoDwWDYKXGM0o
         4aF+Dww5i/7mTC5ew0yeegudK1hN6Usm10BSTCIz3Fmr3gPdx/ZSTMDCZuamsHtQBXZ+
         73BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783494125; x=1784098925;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5E9DTeuL9lwGprVKTcT9XKG5hC9lDtVWiXIoh7IcYJ0=;
        b=BRFVbH1146M8fdsugkZJeZ73ABBQM38VABAKLmbg/cPENKPfva/lHW3Z8FB7WYTVp5
         mMkEaBEyWydx4vFxYVZUBta8702nnGXvisGH8qYRN9cbuhYMqMwMcj2TlFZ5Xt4V8RxS
         YfgZpwO3i48MpMARzKI0BhvNUx6aALMp/YfopqncJpNzTgfz/UKExj0QXKFYBgnroCN7
         v/Z6FdzL/qO6OasAB5N+VuWsGbBZaMTudqgkSaZv9Q43/YcA06SI9sHeNzjdIkwoZT1K
         2ivsXD3gKhW114A0nR88UZJhqBll3KTCcK+bMPnBQPe7gKiHxhINy+fVU7/cEZLjYoSQ
         76UA==
X-Forwarded-Encrypted: i=1; AHgh+RrFfESkqy4qMXGo+WW8KjvKnUaZzEEHWEfmtixrF/mBgnAo7BhjjlCAJx192KHNwKHg1nmsp6tRVFAueYum@vger.kernel.org
X-Gm-Message-State: AOJu0YzYVV5FFNL7bfy7ElxG6r43DtHbdleU5Hw8wYmQmYHXFdP4V3AE
	K1kjpOQrKNJaz0jCoJcNLXNtGPX/vTTomsyTgFxSPAStjzB6XvnTWaf2Kkz1kXAdix3AhSXmUX4
	LITBvbkV18682aAGlOh/WhXwl6Nj/J0KNomaMglNjzLjw8DoKXAGLSSA96OexAVPWwyXd
X-Gm-Gg: AfdE7cmzD90azLVpMnz6DwQwaYZddPGgpkD35ZByQvYHjlto6HqEY9Kl1UU+RIAphkP
	Omwor1ttkzh+jPhIw4281iXC2OztT8cLn67AMExAFZCYQjCLZmB4PkBV5m/mT0k4p6yAMPdAFHh
	uzDOK5CqadffO8b1zbL8v0POx4FYHYCcRpNyA5VV2hz+U5AgArgF8mFyc5tKdo5EcLSPIZQo8pa
	p9ZuJ8ELUypRHei6IuX0A9ndQBiuH6zjwwZpcpeoMJT6A8saL5CHbTcxQZeeJneWN27CbsRbmRo
	T7A2YSzdchokDIqdP0sYzzX+lKvpCs+CBnkU+PF3P5JF8xZOjL7tz1D//7AuNiKbHjtSLbhnpod
	b5Sijbo0GBTMHHtMekX/fjjNa1t28Bqv9nyE=
X-Received: by 2002:a05:622a:14d2:b0:51c:223:3c57 with SMTP id d75a77b69052e-51c8b53a6c7mr11077181cf.10.1783494125477;
        Wed, 08 Jul 2026 00:02:05 -0700 (PDT)
X-Received: by 2002:a05:622a:14d2:b0:51c:223:3c57 with SMTP id d75a77b69052e-51c8b53a6c7mr11076831cf.10.1783494125047;
        Wed, 08 Jul 2026 00:02:05 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad882289sm257222966b.26.2026.07.08.00.02.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 00:02:04 -0700 (PDT)
Message-ID: <1f98aa3b-9da1-4617-96a6-025bfd81c2e6@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 09:02:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: monaco-arduino-monza: Add overlay
 for Waveshare WM8960 Audio HAT
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.poulain@oss.qualcomm.com
References: <20260707163703.233405-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260707163703.233405-4-srinivas.kandagatla@oss.qualcomm.com>
 <zfmtqi3k3miv3ncgla5x3gjktj5j25zkyqqxmyq5i44ynzfnhb@7mruev4sw5vm>
 <64af4615-4581-43dd-a1b1-8324c63d5853@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <64af4615-4581-43dd-a1b1-8324c63d5853@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4df5ee cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=tXEpHCNmLiySnc06sYEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA2NSBTYWx0ZWRfXw+3zikDnvLW+
 aXGOKrvCVX2oAPIXMMeC+Mhly4B6QiIW9scz+WQ1k0HL7BlR3UHtfbW9rFn96dMPg2JqWq/N20W
 2qeCnsKHD2p0+BQKwg9WipYocpbz6iAoYV2hIGQmUVn+oKuCpMdM12QqqsmS2xbNyWO5V2mITeA
 pwAqnNwwCjD5pBWH190LUSG7OUl50namhQnTA9URLrVpy3R3JEs056VTJsjL7R50PJSEdAomjAH
 8PGKy7RfUkxfn0fOc1V8INkkwfLxByk9zb5piuE/pJpGTZZ/7pFn7YmAtCys3q+1uCjDAsibRyz
 JxFvTHFaHI35WAV0l2ZVa8oXSR8UDDcAa5t9dRjGToaoSvStIEaHm385scL//1f5SYKdlO/Wh7n
 /o1Gmsd6ATZlaNjA79asL4Zqf2cB32xsXdnATP6xL7vOeR69yjWTzw2pBuIEbMLB34UKCCnsvF3
 cIRySbPZe6zHujy3WWg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA2NSBTYWx0ZWRfXzfukVbJUl8GC
 /fmcd0bKGQqELN9WzSPmfl2SvS9YzIma6SQjOqIHemEGZn+GGkZnyox6MWfr3eoqR3bYEfVJaCo
 wdVpUzyMEnPUQJcmUaaixUFNxFyIcYM=
X-Proofpoint-GUID: -PQ3SrYmUBwi_DxeeMQ8_1-uLcmkdPNY
X-Proofpoint-ORIG-GUID: -PQ3SrYmUBwi_DxeeMQ8_1-uLcmkdPNY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080065
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117525-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:srinivas.kandagatla@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 534887227DE

On 7/7/26 10:41 PM, Srinivas Kandagatla wrote:
> On 7/7/26 7:15 PM, Dmitry Baryshkov wrote:
>> On Tue, Jul 07, 2026 at 05:37:03PM +0100, Srinivas Kandagatla wrote:
>>> Add a DT overlay for the Waveshare WM8960 Audio HAT connected to the
>>> 40-pin JHAT connector. The overlay adds the WM8960 fixed MCLK clock,
>>> the WM8960 codec on I2C0, and the corresponding I2S1 playback and
>>> capture DAI links to the sound card.
>>
>> The contents of the overlay is more or less visible from the patch.
>> Please provide some useful documentation, e.g. how to test the codec.
>> Does one need extra UCM file for it? 
> 
> Yes, currently this has been tested manually with mixer commands from
> console, the plan make this work with ucm dynamically based on the
> existence of the dai-link that comes as part of overlay.
> 
> Here is wip ucm changes required for this,
> 
> https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/ventuno-q-jhat

with the commit message amended

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

