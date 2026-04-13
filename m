Return-Path: <linux-arm-msm+bounces-102896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIHGMjur3GlfVAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 10:37:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCE03E9331
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 10:37:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 033EF300BCB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 08:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8059E3AB279;
	Mon, 13 Apr 2026 08:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L4kEE1Zr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Quhp53+j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1650C37EFFE
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776069424; cv=none; b=HaVowNf6EDrXr3AUb58vpL2CqQMXuXL5QmZ/O9ejnBAMOasvkVhLknLVfNfk7/5SguHL4F9MGcLtgyJB7thWJHVDBLnJkiUkxLPX9ZEkzPqrR9qoi0nk1xrW+EztGSSNb/3//TqtBWxcyMkhWkOlLigAN+o6lwDXC6djquwi38g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776069424; c=relaxed/simple;
	bh=OaoJFLO2aBVpD5kCuT2SFUReZuAlH6eEsf5E0yrjLPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LQ41/v2ehJT3WebYz3HdT2qASTr+rcy8W1xh0uFhk0lr/MwEGeZwVBT1GUB6jTe8CHySxBXae3jZcVjay6lfYRflWsiHHLe4UOtpzS669Q+V8X7Z5kghhnOdD8QPupmZyc9/thjS8pG38BVDa1/B2cpzyNES+Ddgi0eZ5WrEuPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L4kEE1Zr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Quhp53+j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D78DxN1780542
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uGsajq/vn1yB+1MJRQzoKNoOQK8FQWz7uCTZTI7fQDU=; b=L4kEE1ZrlktZkdyu
	CO4Y45EQXohbImpf8FQCvojNhRzSXqeqEV7nqmFSD74/n1leuEFPZV9aQhqv1jvl
	G0R3jVtPqZWfqe9HoNTiFhgvvCnwcgtq5f8gDmV/5c5RUvMlGINp0z8ZDXbLHAv3
	YKgq1lX/WVXpSRxXqI+g0K5tn/ok1BUJsT3Fqyxenw1KWmktBmTBNQxltoc4eIZ4
	3vZFNqIMnhx+M5iEWjUlYYPwAFzSDXitMbyOoFxEeBrMFIYwFdmhZGxm6UVBSt1+
	9rR3TUj1+HjxEvb9cCE/Xh0ULyGtRHjyWm++5wHVwOzI7pqOhi2aNrXUMDKJtFBL
	OlsPEw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff0jvdpy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:37:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8a5bf7ee420so13741796d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 01:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776069420; x=1776674220; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uGsajq/vn1yB+1MJRQzoKNoOQK8FQWz7uCTZTI7fQDU=;
        b=Quhp53+jrEHqWbx+p8UjVSr5CFM6MJ52N8QZ89DtJML/lD/37L1nzGhipphWLzwn/s
         Fbg+ft2Y7siVBX353zBovugzVvQbJOwARhT5A21C7iP9/II3vE/mCOMLgqYmVl+Wr7Xu
         rBtPNnbbWYXr0HdLwJPP+FRTMDQXXYqUsAZITVNUpRaJX954Y4x7+1Gwjnxz9z1b11dJ
         ipHd/KGjXO3RKoEnMGcwLuUgEwMXjFRjBW+iOfWVPeXRX0YutiZ832+qnhZGYjF9zpNV
         rxomkLuX+mQpUWRBchEGMDT4PGiv0xCIEHAzBZOoJQSjDHbqn7aVWYUFztyssw005uIx
         M/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776069420; x=1776674220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uGsajq/vn1yB+1MJRQzoKNoOQK8FQWz7uCTZTI7fQDU=;
        b=ZC4OIFaxgS4J4QmRyRQsHiTiRovvDLlCb0zpr7iwTAkIqsnhNPwBWjl7tAyQWqcjMC
         AfobHXVU+EdR5dwpsHfTCkSUVlFg92e8L2hxgIyZkXPyf/DHhQqICFt8klUZdBogea4q
         ynOzQmNOi4RyhRbquS5nSNIqkjuMZZaW1gWqwY5A3ECVYn+U0g44QrnAtBnyUjkO7fQZ
         IY8v3YLzsa6okMqDmQNEZVrEsGBsc3RypbXna0opP8d7duzYVpWBMWiTgnQSITcjT/36
         YMPT6S1OJ34lFpiJgOeUr0tR+s+ti2ZRWoXp4YxtSNotKJ+t+Y3PogyJzMjoJd/D6Q/D
         BbqA==
X-Forwarded-Encrypted: i=1; AFNElJ8Wy+/kzcmm995XGaUBm5si9KxHh9SkP7ADttD3aGzTiB3n5YRAC8qwT9U9uUHcoDbj/K+ps8ZUeU9jtKEE@vger.kernel.org
X-Gm-Message-State: AOJu0YxKDSjtPf1IzuxubO5VbLMZPs+oUgPT+xEaRJoIAi8pmoTanBAv
	K+fTyE6iArsmXpPCAdOjhvh1LTSvSs06zvHw85Fiic/9vMHlflhsk8EvUK6uDh69YtzY/vjNzGB
	xyjO/UNX3ID0dafwyx5YpdZa5gdWqbtNDPj3u9s8VhmiD70Os/JretrJQNi4OWSsXwaL/
X-Gm-Gg: AeBDieuV/mXEKfq8yNIQ7d0HqgsBOA4H9nuF1v1CLH72MMJAy5ESA/k/PC9Wb6WNDRq
	yy1EJmrlti4ZgxusX0w9b71r3iYbjXka6QPD0r/DfVoDq4JCFHx6mm36nSFG5cq9anF62D6O9/e
	De4CUgCs9YW7z5q0NP/4BhnD2afmDV5vk6rbgkCUYqPijMWg61m47m8yECmUydARH45dYN9juHP
	GbBZc4MJgHwIE2XKqB6DgSF2ALcRwsoqwbAOHm2MI+Tk2plDTiu9IOXP1HWVJPXajKxIdp2B/qC
	D5meZxKKrR9FoUv/Zqz6/D7ajK/YofH6bv2P31BQlUxyVZn5EI9MPcoUGqQKJzJVnJPN8zM/Fbj
	7sD5jVuOudXPi2mTvqOsXYzamCnMdp0OE6ZTiOguOQ4wW7HzLQvcizkdCtnlGoZWEs0xRjsosZi
	51PR4=
X-Received: by 2002:a05:6214:230a:b0:89c:5473:bf47 with SMTP id 6a1803df08f44-8ac861baaf7mr127314346d6.4.1776069420505;
        Mon, 13 Apr 2026 01:37:00 -0700 (PDT)
X-Received: by 2002:a05:6214:230a:b0:89c:5473:bf47 with SMTP id 6a1803df08f44-8ac861baaf7mr127314116d6.4.1776069419933;
        Mon, 13 Apr 2026 01:36:59 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c8492sm295448266b.47.2026.04.13.01.36.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 01:36:59 -0700 (PDT)
Message-ID: <8d2d25fb-2adb-488b-aef6-79bf3bc1cf8e@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 10:36:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sdm845-google: Enable PMI8998
 camera flash LED
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260412-pixel3-camera-v3-0-e26b090a6110@ixit.cz>
 <20260412-pixel3-camera-v3-2-e26b090a6110@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260412-pixel3-camera-v3-2-e26b090a6110@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4MyBTYWx0ZWRfX1UbK4so+7KbF
 xZ/xCtzGLptMIJHh3FQ5BKR9QX/PAq2WQukD3R0bFnA4rpFtmgDuVlsOA3xxCbJtliD03PaZk0T
 tpp+u2QvszK6sqzUAkWoAVP98Hi516/bIEm0qQ0Ly7QkfGRU80BJlU0eVYRpAX9XRWzsJ++Vy27
 ndWhsJ4dkbIBcm3dNXCFInTbLcr8C0egw2ExBgiwEkqoQDWJIpF1ffqTyxFCm7aWtqwCG/ZfXAp
 fuW75XajEqcCBzNtCRB4wfWIHekEBHaLw9+FMeb3TwFoxDYc8fjmOpiwJyGo4cdQibehA1K90yS
 3YD+swqaGNCUJnT+L02ncK132UtQ7QUcghHvKhhVDLHeAAp+U4GvjAbb6KlMMUYwuoM2rmnxWmY
 IARbxi5TGW6xGE6EeI7lca3ouCI0awawr8g/wQEFDjG99fr5ARTxGyu4ubkYPo2ohn6QCj1UPHO
 IKEvw9nMlDGp5VpnAmA==
X-Proofpoint-ORIG-GUID: lHvLVyOLSAjURmNrD3Dmr4b0ZQrn1ljQ
X-Proofpoint-GUID: lHvLVyOLSAjURmNrD3Dmr4b0ZQrn1ljQ
X-Authority-Analysis: v=2.4 cv=d/LFDxjE c=1 sm=1 tr=0 ts=69dcab2d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=xIeCYdN2kLphDQboBmoA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[protonmail.com,gmail.com,vger.kernel.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-102896-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6FCE03E9331
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/12/26 6:35 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Enable the PMI8998 flash LED block and describe the white flash LED
> used for the rear camera.
> 
> Configure the LED in flash mode with hardware limits matching the
> original device configuration, including maximum current and timeout.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> index 070023a9813ce..e9d9842cb8674 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> @@ -6,6 +6,7 @@
>  #include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/input/linux-event-codes.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/media/video-interfaces.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  
> @@ -596,6 +597,19 @@ &pmi8998_charger {
>  	status = "okay";
>  };
>  
> +&pmi8998_flash {
> +	status = "okay";
> +
> +	led-1 {

"-0"?

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

