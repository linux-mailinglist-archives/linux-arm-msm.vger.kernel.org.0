Return-Path: <linux-arm-msm+bounces-112189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u0+HEUUgKGqP+QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 16:16:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89361660E7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 16:16:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=L9gk04SR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jratY9m3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112189-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112189-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8F923064706
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 14:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29AFA31F9BA;
	Tue,  9 Jun 2026 14:07:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D241931986C
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 14:07:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014062; cv=none; b=B8qOZSDqYpqJPrvRnxws49fSADinkiMHiSszXY2Tg/5JRtWycSSXLdu6ZAXs/WTInln9ys0TtmAFlYHa3sNcU4ZsCNNyujIOuGgANDG9MkuTvvkkpk3WJMYXZeIKruiP5B9hj3qYRVw6UsLvQnaWvDY60weck6XBxY50JGNCu6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014062; c=relaxed/simple;
	bh=cLnvuyhUDxRli1mmxi18YHK8So+HlU3fZNMEkOnKa1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n2WSN9F9NVIYEx97CMo4g4ycuFt41JcN0ez9AtS3ighmiY2TySQplOLUhkyxaY8wXqQ4JSdEqVKYcQAty1CkMcmyBE7jeN1AE5EqgIdz49eAE8r6TMNB2gUqz2JjMwwbepKnJ2ocixAG3+/eNrrhTvwIdLsAgZu9LV8RS4W9sQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L9gk04SR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jratY9m3; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CnIcS2668349
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 14:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lp/L6GOkz32D1rojCKCm9+SClyAyCdF0rMaHBiwhoZc=; b=L9gk04SRsSkyFOgt
	GJBxTVnaGRvQUUfD5VFuUMbKhAuSx4u35f6X+H0UFl15WmnNGaSuh0zRRfvh3YWM
	7cFCt5qnJk5cgwuJSJPlfW7KY2tt/rLPJQgSst3b7HWaAfA30iyrCaLtEhrB5Z8V
	tAwGv3Hj0nldvoeIEzdq5EkaUbvCYJqQncOBRIGwsWAhrQJo6F5yq1h2OKPx5KIR
	+pv5m/vN7WoXHQHg/hImoNTm3lfBS2hptYdzGK5iAB0DxrNUJE8Ddwuhan2C84m2
	lk3inFAuvzlk2NBhNyG0f6iduMEXf23texs93luyyCcS9JcL7IpvlP/qTg1Ng6Ar
	GStpiw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epe25suw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 14:07:39 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6cfe512ea6bso237030137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 07:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781014059; x=1781618859; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lp/L6GOkz32D1rojCKCm9+SClyAyCdF0rMaHBiwhoZc=;
        b=jratY9m3EJyktTZ0Bdj5Os+P3358g/NjIu63yRjF4aG13sM9RtUsRDOIVd1gQJcvhm
         l1DOaEkGCngmiNRXh7kimsQglm1VMhXUlqA5EEpYrmEwr9eKyJEhWc59b6bMH4ioEyA+
         hxE21xtT1ol7doaaRlCN2JxqaK08+VkHdNtHWJpcc+pYpqtLF2Jf5Tc7XCn/UrUL8LQd
         3V35mYds5THygGaM70jrZ2xiBjMAfTTV77+aX11Nf9o5exmDxniXEvnVySXlR0zfg9H/
         fi9RB7JLlT7f3A0kY4o85UVIfzhQcT7dmnmvLI0Xp5z+YSSBvGiFw70bAMr3bx45nRRX
         Vl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014059; x=1781618859;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lp/L6GOkz32D1rojCKCm9+SClyAyCdF0rMaHBiwhoZc=;
        b=Sxf3t+xUTGX6HUmJ/xTmW95OE/02FAvoI7IdQ7Etcgipjz6/2JGuyw6xplBbaOaANV
         nD6mjn+pii4N0eqbZrcNksypKlBpkNRbcB6EryZcmmvc7vHXh8WUXqXSI1bwiPGoLNEP
         wv2z1L86mG0KT7RjPFqgd0t3GpRPhaypZ1dHQr0TAd6BvDmBidyBCdwO8RtB5G5NMxUk
         w8x6tntHqzSBLL/KPmNsfj+OdApjyKG4RrL2tJpf/UGxAD2sedmr5MSYQr3lvcLswVbW
         A2hb0vXtBqmUMitbV1tOADfxEFXawAhMky4DdHDa4HK6K+lkYuGmOI9XY71+NWIYxj8y
         jCtA==
X-Gm-Message-State: AOJu0YzIWcIO8qimxL5V66OK7J4Mqt6x+NmccB3KeqLcC42ug2BfU+rH
	Uj8fYY3Xf28BbEBtA8meX1vTmPcQi1asK7zt3Bz5LE2LCmQyhZkjTi6oICD3WdNc9jXvFeNa7/G
	eia0CC3iECROSzxIIaNWgtr3kEEX/rOhoL+r40qBvbazP5lEBC5aYzIWmdFNvuZ3WAG5gXviOgj
	SB
X-Gm-Gg: Acq92OFiIiX29X6hG+UXi0CwIMdj5xK9n5DRIVXbg4Z1IHuxe5JhsMepHP0+ARkhrSM
	93m/UizaPHcmzlIMTwIXF1GFI08yaCKyhdKay5qKvM4o2wv7gD911Z7FtclbPCWp61E4qfmdF6w
	jZWMex9jgSf0j6iYUB59k/c3gicrNuJ4hHW2UhA9AQXo7IZri4gk0RMbpNWn81rbLnISc1PBGsT
	upiT/Q3yNKGd6nXOQ390V2iSxFuL1yesrTMv2T7lPDpee6viYUo4n5vJTnBb68m8oAYk2jnqtcq
	3x4i6aTaGI1orm8Us0XMHWO/SWxx/WP/HLor5n9qJp2MqEOL1q/VcYn3IOA3zmbsuNFgXTV58CK
	C50LIYpugVmxGWy+2+PJhssrih8fdtEWjTfWnMe8Arh5BpYN7Exb31bc3
X-Received: by 2002:a05:6102:548c:b0:633:3bf6:977c with SMTP id ada2fe7eead31-719160955fbmr459256137.1.1781014059092;
        Tue, 09 Jun 2026 07:07:39 -0700 (PDT)
X-Received: by 2002:a05:6102:548c:b0:633:3bf6:977c with SMTP id ada2fe7eead31-719160955fbmr459224137.1.1781014058545;
        Tue, 09 Jun 2026 07:07:38 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0559eee00sm1064314366b.56.2026.06.09.07.07.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 07:07:37 -0700 (PDT)
Message-ID: <7e04a133-05c2-4137-9ac4-c4fd4ecdd505@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 16:07:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] arm64: dts: qcom: mahua: Switch pcie5_phy ref
 clock to RPMH_CXO_CLK
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-7-ded83866c9d9@oss.qualcomm.com>
 <db074223-ac01-4ffe-ae82-187ef0cb2cbb@oss.qualcomm.com>
 <245e1e8c-45e4-426d-9c0c-4c2c0952223b@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <245e1e8c-45e4-426d-9c0c-4c2c0952223b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iI_qaZIiIiGXygfMXNOfzizpTegLYeIb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEzNCBTYWx0ZWRfX/t8wFWrQZXId
 Gy+IIRk9/t+5YzWZINWSP6AZgMo9+Jd/fvKLH+PHAGsgsY9mqD3BEe/4llcFMkkbOpVpcsidwrS
 YRc9RH64tX74wZd5rNuPJYS9xgVSfNJgLCTi8W58/T/wex4c6+ru4w1ftmnlxMIbQQJTax1MK5g
 5Dlw4Mev1svd23aQp/eyVAdOaZQXOsbbRDIwoqx15VH23FKA6eiyT9bQ2E7e1J670/02wWkWtOj
 EHbjCxnRZ4qEMUnUsSHenVNVegMOBqJ8KyRHxMrOtlHYBEEmOFzsUF5W45f+2GXAii2kk7yA7sz
 gfkS9v7T3JF0AEI7M/19tnpu3i69zDgzuL8gZRWoPAZ9JIf9hZeDfwZXx9wk2GN9dkMgYVetoEv
 4Tk+G0LpIGBZY3cOhi2kKRI7GkiV7SebuylDPsb+E0fAGTbl4+srOiu0+fmfccuWnO1poX0BDcL
 R5aqVKx2Zp2/1m1sESg==
X-Proofpoint-GUID: iI_qaZIiIiGXygfMXNOfzizpTegLYeIb
X-Authority-Analysis: v=2.4 cv=LoqiDHdc c=1 sm=1 tr=0 ts=6a281e2b cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=aQRuXO-KHT3Wpr6myUEA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090134
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
	TAGGED_FROM(0.00)[bounces-112189-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:qiang.yu@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 89361660E7F

On 6/9/26 3:55 PM, Krzysztof Kozlowski wrote:
> On 09/06/2026 15:06, Konrad Dybcio wrote:
>> On 5/28/26 4:29 AM, Qiang Yu wrote:
>>> PCIe5 PHY on Mahua gets refclk from CXO0 pad directly, so no QREF
>>> clkref_en voting is required. Override the clock list to use RPMH_CXO_CLK
>>> directly instead.
>>
>> This is the last piece of the puzzle that this series is missing.
>> There's no QREF clkref_en, but there is a refgen that needs to be
>> powered. For PCIe5 on Mahua this would be L2F_E0 (0p9) and L4H_E0
>> (1p2).
>>
>> I think the easiest (laziest?) solution would be to add dummy clocks
>> in the clkref driver and only toggle the required regulators. Another
>> option is to defer back to individual drivers (such as PCIe QMPPHY).
>>
>> I kinda like the "one central node to drive power" approach, but I'm
>> not sure others agree, since it stretches truth just a tiny bit
>> (although not as much as one would think since there are *some*
>> controls for the transparent-to-the-OS hw pieces in these paths still
>> in TCSR).. Dmitry, Krzysztof, would you object to that?
> 
> Not sure what you ask here... the tcsr will get the refgen supplies and
> that's all what is needed from DT.

What I'm saying is that there are always-on clock branches (no register
to control them) which go through controllable repeaters (with a reg in
tcsr, although we never control them since the reset state is OK)

Both the repeaters and the associated refgens need power supplies. My
suggestion was to take care of that by adding "fake" clocks. Currently,
we have e.g.:

&usb_0_qmpphy {
        vdda-phy-supply = <&vreg_l4h_e0_1p2>;
        vdda-pll-supply = <&vreg_l3f_e0_0p72>;
        refgen-supply = <&vreg_l2f_e0_0p82>; // the other 1.2v refgen is missing

        status = "okay";
};

The refgen supply is deferred to the QMPPHY node itself, and the
repeaters on the way are ignored. The "ref" clock points to RPMH_XO.

What I'm suggesting is that we add "fake" (i.e. uncontrollable) TCSR
clocks, such as the inexistent TCSR_USB4_0_CLKREF_EN, to which we can
link the required regulators, both for the repeaters and the refgen
source

Konrad

