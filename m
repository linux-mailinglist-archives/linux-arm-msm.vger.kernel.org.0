Return-Path: <linux-arm-msm+bounces-113426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mtzKBhtTMWpIgwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 15:43:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A84986900B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 15:43:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bbZztLce;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=S4iR8TOz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113426-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113426-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1ED3B3009F40
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F7432AAA3;
	Tue, 16 Jun 2026 13:43:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C6D330678
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:43:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781617432; cv=none; b=skygDHM58YJgK41e4MGw9bFB4HmvCn4SYM3yXvheqAnyylTLXIyWcUsKcl2ddw3EQypUF0Bsu8GkhFmIYw3isg983yDEu8VfuM5ut1BW+rY6pSRsFpR5XXkfR0cPw5xerG+qIAfU1momEg2YhqxTSavRTne2x8PWLa2IejU3zlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781617432; c=relaxed/simple;
	bh=bKV17d9tguID0LIesu8rxYoO2nZDE0Plv0lBRFnUe+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ECjTFMPV5Gb+AN7aklIXav3B8z7EcsbiYk8AqFU/kyc2BIJ/rhFg5uMyirAlB9juj7xJzlGbJXOo5W489E50DauIb6tl8nSnAnmfW0ONAXXwTsST4EM2RK8vDNHiDFYkuShhVURCe5aawwUPjjgENXdmcT8MmCBs5QfzV47/CLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bbZztLce; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S4iR8TOz; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GAC1Rw3256260
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:43:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lx2pLtb1L3rBMwiQWuihEDC+CgioMsnRDiqje1tzDBk=; b=bbZztLce5htqB+3O
	+w1Fo/2iUHCgOt/hWdZlXc5G4Qkhq8hGeyB4Yyu6TtF3S7Egt+gVq7wBbpT2nkGW
	Ec15ZJeh/EIj9vqjcF7udRq10ujntgMSuiv8UPGdXmTW5N2Fo2urgiU37quZnGNu
	z+SQSfXo7mByZkiJj6RKN4hk9uimRTrOfNWhVB7v/+UkBDtaeD+q9S4n31Crivo/
	ts9YRcjEbNeH9eQVAnGf1baKzyr9zkNUv0R9lZrYP/umcsoUyvkS4PbHJPHVxhhM
	rQ0AhQq4PD92Rz0qQhRbkzLA0g2sywlndUs7TmLKm3718/0hGf3nVZJLruVVPL2s
	fzMkRw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09ka2w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:43:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517796be724so11851041cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 06:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781617429; x=1782222229; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lx2pLtb1L3rBMwiQWuihEDC+CgioMsnRDiqje1tzDBk=;
        b=S4iR8TOzNkYPiPcwtuxxrpxzB9Jet88oDuKFRMlACWu+hwCMjes7whw3Z8ljAhE+zu
         2UoXT6wDoQbrd/qQ7s+5fOj43fv/KFd1lAGnzLLnGifI7XASFAu7gXDfY5q5xIRs6/TH
         lfdDBBYMo1N5fiucCKWx+sM8i/5ydE3wpn19jg4OH3PrNTv20YCer4++TDt2on3dVrVw
         7V4ZbMa6Va+2Xib0thpz2MnJeGtPf7d9LgpL/+5MdA9kDVYMOI0C1R1L7PLmM9i4R6nh
         WgKrFyYYSASYI2tLOA5PYAvuXUC3NIbrXnfuIpWNfK1rUxeDC4DWRWZtcYGbYR9PinMV
         0i3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781617429; x=1782222229;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lx2pLtb1L3rBMwiQWuihEDC+CgioMsnRDiqje1tzDBk=;
        b=W0Q4xyii9xHhioGJZD8CdxobRptD5RFnZOYBd1lK2i2NOQOmH1VK4jZGJeQeJLphRQ
         wHpPyKEvPGBxJoYiIST+N2SlK3Cme9JfhvbP79grZj5uRgRtEK04hcoZZmcCU+SOlV7/
         rms89u376K/KYwURKn7w7b87yNxb0S4s3EbkGqAjmMS1uWqrnRRp0W5ttTQucoYZczoi
         kEdfVvPJLpoNg9Uh9vl72gYUHUOG/5PZ1YWcUqB1CtvVkcgKaOZNqcVYmexunCdzGdL6
         dyt+C1ijxeuEVAhEqnfl5dTsCJjelG2a/A+FcPCDyFEsI7U7U/UG6dHYzofKLpIze93s
         UA5A==
X-Forwarded-Encrypted: i=1; AFNElJ8IdHQVXb+kW3DHYTSz2AmnAVTKR3FbfYx5SrKjIyYBfEmWM+2EKrFQfSh1YdRzllNo4tOfGczPezFf1aEi@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe9404RdjrADIDZf+wXikMRHAeZaerIHULlRhMC6BYrX7+Zemf
	Vqf+6uQcW3mha2B1jjokiIL6ld0uDW4cwkqRSQz1Bi/hbsJ/8TEhDoDV9T0STyUyIUUGy5TfLEF
	W+u5u3zDHvp0Hq1mg62vIbjgX5aJ8z78doOMt6nKyJzPEAEWsfYedzf7teYl6XmivYIAy
X-Gm-Gg: Acq92OGoHcZ62hT2QOPm33751p1J4Kfh9Z0CxI8LXh5Uo+S0en2xofX+ITMt2R5BjsN
	Gch4t1+5H7hH/Gs6YQNLPg+TgkIKVvZ5OEfodsQpuI/mJhLdyJSt6Vt0E+GBGonYN3mLRnyhLwv
	Xq+Ez/mWa98Qoo0AUzn/Ce6jVpIxtNXGg1C2cjtx+gn2jxlKIQdlLOOuHb+uLJjj7jOBi/cMT4i
	SlMUQz7tZhZBMxBVDs2+QIkynXHMc8vLYwiU6+b/9BHmD8iYTHXG7nQLts600IU/vuIrL+kCcyS
	XosfeGjnQfswGhvTUgtRu9ukdX0oBsy1loJzKlxAHsHMFbxKETgUnEUT7mTGyQtuYGK/ugcDjX2
	m1eHoPmk4W1I+b+noJIzKJsyx1bWhPLIV20ci79exAQL32g==
X-Received: by 2002:a05:622a:1a98:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-517fdea8e41mr196169071cf.2.1781617429133;
        Tue, 16 Jun 2026 06:43:49 -0700 (PDT)
X-Received: by 2002:a05:622a:1a98:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-517fdea8e41mr196168641cf.2.1781617428618;
        Tue, 16 Jun 2026 06:43:48 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-693c6d7cf3csm4133056a12.14.2026.06.16.06.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 06:43:47 -0700 (PDT)
Message-ID: <b0d30704-7761-40a2-9090-983f32102c8a@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 15:43:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/10] ARM: dts: qcom: msm8960: add RPM clock
 controller and fix USB clocks
To: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
 <20260601-msm8960-wifi-v3-5-fec6ac8dba02@smankusors.com>
 <1d15a420-7360-429e-a451-ec1f012a0346@oss.qualcomm.com>
 <efb42f6c-b26a-4ee0-a5e7-0a25a0a41f50@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <efb42f6c-b26a-4ee0-a5e7-0a25a0a41f50@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE0MCBTYWx0ZWRfX6SPHkxlW2F78
 NiNWFJWheN6H4nYCDyF6KM8MUaA7R/iBDJBFPLFezWfldFjMemT3DWJ3XvASiD0VhbMinx3Ufr4
 qGutEe1fELvJ32IYgrxTWq0B1dZmHco=
X-Proofpoint-GUID: _z-vlRdey-ZnzyOryyPuFQ2o9qA-aogH
X-Authority-Analysis: v=2.4 cv=DoZmPm/+ c=1 sm=1 tr=0 ts=6a315315 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=wxLWbCv9AAAA:8 a=kVRP5i783O7quJDYENkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-ORIG-GUID: _z-vlRdey-ZnzyOryyPuFQ2o9qA-aogH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE0MCBTYWx0ZWRfXxgaa/RaCAn05
 pBmuDhz5p1fyyXaQiehTbhnT/vI39HS/7Xs6MasCRdZBEAOpkHkoJksjaXa3mbBxUpGR0IfL95w
 5vLSDYfQAFYUNO5uSgQHxTpogxr5pcg4A+Z7JWIb4inmZeGnfAERI6xpmHT+DG+QrUXvz07THC3
 rj0oYjorDRk5BU/LWReDa0/W5Scdu3OQDnQ1FLxxEBDDSpXHWx9x4WqAs/HFTQtF/V29FlHd3MN
 NTSUPH4krXe+CLnX91dn8+7gtB8jCz95cfMiD+TjGzoPpaXvO4QQkZ8kMrqP3S0wKS5Mmjb/zNk
 6kJ7dwzivWzePPwiAxmS/SdLN1GN+ssFlUd6NBim34Dce2Bs+IjuKSsSB1aRIYnV5DXlPgeZxXs
 S79hFb6ImU6LS0CpnTP2kKnYg+Omibj2e2mv8MiRMZWjOifv47ttaNdxBjpkqgDPSTf+3+sulfp
 Kf1Vi8HGJgO3av6zwrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160140
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-113426-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@smankusors.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:konradybcio@kernel.org,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:guptarud@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,smankusors.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A84986900B8

On 6/16/26 3:04 PM, Antony Kurniawan Soemardi wrote:
> On 6/9/2026 7:21 PM, Konrad Dybcio wrote:
>> On 6/1/26 10:51 AM, Antony Kurniawan Soemardi via B4 Relay wrote:
>>> From: Antony Kurniawan Soemardi <linux@smankusors.com>
>>> @@ -507,8 +519,12 @@ usb1: usb@12500000 {
>>>               reg = <0x12500000 0x200>,
>>>                     <0x12500200 0x200>;
>>>               interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
>>> -            clocks = <&gcc USB_HS1_XCVR_CLK>, <&gcc USB_HS1_H_CLK>;
>>> -            clock-names = "core", "iface";
>>> +            clocks = <&gcc USB_HS1_H_CLK>,
>>> +                 <&rpmcc RPM_DAYTONA_FABRIC_CLK>,
>>> +                 <&gcc USB_HS1_XCVR_CLK>;
>>> +            clock-names = "iface",
>>> +                      "core",
>>> +                      "fs";
>>
>> The bindings change you sent changes the expectations - "core" used
>> to be the first clock. And I would guesstimate that the
>> DAYTONA_FABRIC clock is not really "core" - does downstream do any
>> ratesetting on the other two?
> 
> Looking at the downstream, I can only find HS1_XCVR being set to 60MHz, DAYTONA_FABRIC being set to the max rate (just for voting purposes?). I don't see any clk_set_rate for HS1_P though.
> 
> Would you rather the other way around? Like "core", "iface", and "fs"? My concern is that such a change would result in a large number of warnings for newer SoC device trees.

I didn't notice you're actually aligning the order with bindings. I was
under the impression this was a random change.

For the clock assignments themselves, I think the schema reflects a
full-speed (i.e. usb 1.x) core.. I dug out some ancient doc that says
that we should have:

- ahb (bus clock - perhaps daytona in this case?)
- system (core clock for the thing, >55 Mhz for compliant HS operation
  or at least 35 MHz for any sort of operation)
- ulpi_clk (60 MHz, coming from the USB PHY) (we can probably ignore this
  in our description)
- inactivity_timer since there's a BAM instance attached to this host 
  (possibly handled implicitly)

for the record, there's 4 hosts:

USB1_HS @ 0x12500000 (this one)
USB2_HSIC @ 0x12520000
USB1_FS @ 0x18000000
USB2_FS @ 0x18100000

I don't know if they are all exposed and functional though

Konrad

