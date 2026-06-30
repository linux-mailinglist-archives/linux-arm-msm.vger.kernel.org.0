Return-Path: <linux-arm-msm+bounces-115394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JvfFE/urQ2roegoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 13:43:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 187C26E3C18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 13:43:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=d0Rq5OHc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="BNmdRs8/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115394-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115394-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 883E3300CDB5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43D3B404897;
	Tue, 30 Jun 2026 11:43:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEC8403156
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:43:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782819833; cv=none; b=VvPQlipn+gydvl4SSCIDNTXwlblXE93DHl8+mnsuHAqVRqQ+fp4XgzgT6jPwKBlu1xwGFFNB2WgtmkLD4OVfwHdLctgGsLvjZzmlakhXSSRCI7u+dMJIuFDfjG83byyZQs3TG7xOXlelczn/+0yjko/Je6rNVnbK+psKJYSAQRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782819833; c=relaxed/simple;
	bh=ydxso3tQzTPdXtcvGFdCqB1x6Jr03cYbvaMFGBrRqxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qkfO7ghrNlCfAdeBM3ZbPYHLNCXY34sP+FkNP1KkNLt0u4knI/SNVD2Q3T++xSBbJ4lVGX66cEozPODH10ku5WNjVjdmlAldbGMP4QGJj9IS0jSfE2lzkzmUkTH/06L7KjYPh6sQ9TiPfeARkHwQ7YNYRcFTiKMmwVmM3qeV8jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d0Rq5OHc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BNmdRs8/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mxHY1604722
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dVMvkTVLGH+FcIS/vfSvK/ujPY+UerDGY/JcdPljsRg=; b=d0Rq5OHcxH34F+t2
	luWaixD9UWj7vzhGYA6kxXL+JJBPzSmvjx7PMBdI3LttHL5XGZGliNh/m4Y2BuH4
	tjQfbD8CjuqpcTy3oz2zRFnCcvryFpqDMtJ3jGsq2F5/kxNk/3fFGmJLJsbSTlD4
	HHFCjdYQF6e8gvSVPdwKKVlrBl+Iv43I8jaPVFLSPKQc5Gpacd/F+e0cByxLxgya
	cMCCP6r8KgTjQiJB2UEXaJbyl8cWYsewsO9mizSdpbqrF0nw049GkXyb1lJ8A/pV
	1Gwkr5qjs9VV3xBsJRnPbwpdKn30Mcj+B5Kvlcx9Nybyb6Hm1x2TMWnQ4Fl8eRAe
	htS8tQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f462fj0fy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:43:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92b79cc1f21so114350185a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 04:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782819830; x=1783424630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dVMvkTVLGH+FcIS/vfSvK/ujPY+UerDGY/JcdPljsRg=;
        b=BNmdRs8/PyYa+oAZWRmtrp5PnQSCOkqcWArZ1b0ZnXakrM5Rj8sPDW0Bj5SVxwNXGa
         9QXMXRckW5xdyMw5CtT+cSID6H2+iPM47Edr3KkkEhcJmHukekxzNwOTIfP9haQVgOZ6
         0uHM9SvafC95StRAf4h1lfUS8MgP6/VNgjCnrrH9neBvcjrk5qBEntLqmjXMLv+g7fdg
         FqFB0i6HHOoWC7XOnEa8l67NaUVjUJdmvUCWx85WV15VQ85eM7c+FAySj/9WGq9caRWG
         0W8AgB0BVDChzIZzW/g23aTVvk+InWYnRm+DRPmno3cZJtOKH/Ioi1OSKZ/aoLZ5aw1Q
         iaAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782819830; x=1783424630;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dVMvkTVLGH+FcIS/vfSvK/ujPY+UerDGY/JcdPljsRg=;
        b=XgnERw6gwr9Rzg6JVOe2fERTrQvu0tbnqah0uzv2hnL2zMd7144Zc/ODMA6I/PiWlg
         f9NAXaBLGqD7qBv+2TpkG9WhxRQPmTrlD2OwBV9XeI3RaprEQk5YdQsOUeMwe3pEqWvJ
         jQ1m4Fwv7ptKKm+OxhmJwH/yckVofXoyGtAhwQLuOnxWAmDE45lH2VEnNq9Z3ZwSTIEV
         wHtdovnUfni8DLs29Chc7FvFn9SbL6qMDmHNNvvod959qkFG7u8flOBAhlg9rzthLsQh
         3DBnMwKdeWlxvHimegogHgCt7ZVSCUYM90dzBFa9stWqzwPKBgbmCOPpFD5z8fSzzSq+
         k++g==
X-Forwarded-Encrypted: i=1; AFNElJ9uV00rpv8cITH6iXv6Y1hmiTBClYEzQVIsiu9E27m0vajrfUVGV6RvxWVS4+YViqA++xf9rpxLUovk9Lvx@vger.kernel.org
X-Gm-Message-State: AOJu0YymAbxy6pe+qbcdyjxI+ZL0n99pM5ysIogk9baqevgNl65QK9ac
	dQPB4l53r2IbbLK/E21+OlFZZ/Iimr/fLS65LgIludDagsr9UB3Pyb+Z6IATylWdU7b2DQGLRh5
	HiS7kmG0j6RslTTOIfzVf3cewzViG0IxOvu31TMBlJ/UznFipi2/wYhp1vQ81Nc4v7Gr9
X-Gm-Gg: AfdE7clfd7fjsQoErPGMaDLNeJ0HQ68QQO4oaYTfWtWDaaMPdevs1xUsXTT5COS2UJO
	JEpctFct6k1whsJScRXzixR8vMVgy8aXFWwb58ekjmlXKhzAm2c0kxG0yVTwKSqGYVoBWslsu3Z
	IaeoLZien8To6XYxWKjWDcI9oRCMqJkAtGABBDknItZZ1tuwiuGdgKr/vZWvjh5Yb8ZkQhM0cAn
	/45dFh6NFMPzyae2mBPs0eLwJm3KpXUsCw7EwLc+8vtIsR89joOqjYd/I/CAsdKl2V2Vzkio45s
	46yXRBU9BsFfWgg0NbPQtwcBn19IJowDffoZNQ5PWjiM2DomD5mP7IAWkrtVAH+e/FxJBd9619u
	i6eFRlVQ6q6NriFtD+mIT5VykLMDwYOiwTY8=
X-Received: by 2002:a05:620a:1a13:b0:92a:d546:ba04 with SMTP id af79cd13be357-92e62620d05mr347162185a.1.1782819830035;
        Tue, 30 Jun 2026 04:43:50 -0700 (PDT)
X-Received: by 2002:a05:620a:1a13:b0:92a:d546:ba04 with SMTP id af79cd13be357-92e62620d05mr347156685a.1.1782819829433;
        Tue, 30 Jun 2026 04:43:49 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d18735sm113653666b.6.2026.06.30.04.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 04:43:48 -0700 (PDT)
Message-ID: <1416ada5-ccdf-400e-b2b8-d2c5c7e335dc@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 13:43:45 +0200
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
        Rudraksha Gupta <guptarud@gmail.com>,
        Alexandre MINETTE <contact@alex-min.fr>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
 <20260601-msm8960-wifi-v3-5-fec6ac8dba02@smankusors.com>
 <1d15a420-7360-429e-a451-ec1f012a0346@oss.qualcomm.com>
 <efb42f6c-b26a-4ee0-a5e7-0a25a0a41f50@smankusors.com>
 <b0d30704-7761-40a2-9090-983f32102c8a@oss.qualcomm.com>
 <417600e8-9be7-4c6e-a62c-f10a5fca7a9a@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <417600e8-9be7-4c6e-a62c-f10a5fca7a9a@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEwOCBTYWx0ZWRfX/MNZbf0pK5tR
 xo4JkYp2T3+xS+2mkC+KDB2chvyH/q9sM3AvJ9rd6z/MPOIPOaHxZ/jOoSr9UjOD2W/PYaE+Fc7
 d2VmcPXxfjR7IURJVJ+8g3qUxWdzze7mvKLJmswa7Q9jDrjprkMXXHe2bzPhQt23wYZbOf91/Ys
 e3qT225Fv9EEBgZX3Vqj+1QjH9A0iTw98dN0rvLpMHKtA8eMRJfPsSULU04j0QBzK+ADgxWQAyZ
 /40NaVn8rUCgDNEOnnuvGICv2xye7NfwHtcM1sTk16XRNuyI4sU30kqSnRoP23VakQTyISKxUlD
 JqZene+mWo7JXXkesji56/caqDCS2uk560fj1oo3Ih6go3jXDO17VdqxNh8CVyyqW+EKH/lmO+X
 aNlcCQNWOo4onYBdpGz+tUcXjHJj8Hn9VYqlp46+BfpVdElX6+/1FGWP7ry8ePLFmOsvND9FVK2
 3J6eWUvIpLj8s89KU6A==
X-Proofpoint-ORIG-GUID: srBPwv3FdoVvB9p9GewfU2XBd6Y_U9hV
X-Authority-Analysis: v=2.4 cv=JqbBas4C c=1 sm=1 tr=0 ts=6a43abf7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=wxLWbCv9AAAA:8 a=iVYy-9Xbl0-MiRC387cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-GUID: srBPwv3FdoVvB9p9GewfU2XBd6Y_U9hV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEwOCBTYWx0ZWRfX6cYm84m8b8ex
 piVG1KkZrBrBTOZI5herizLMozJTBHaQimQViDf3D7zbccx1JDtwRZaaU1yhKjilziVEB8tBxEY
 a86Mg1vD4yaNxRHmb2fsZ2G9xBZOgeE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300108
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-115394-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@smankusors.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:konradybcio@kernel.org,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:guptarud@gmail.com,m:contact@alex-min.fr,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,alex-min.fr];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,smankusors.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 187C26E3C18

On 6/29/26 9:41 PM, Antony Kurniawan Soemardi wrote:
> On 6/16/2026 8:43 PM, Konrad Dybcio wrote:
>> On 6/16/26 3:04 PM, Antony Kurniawan Soemardi wrote:
>>> On 6/9/2026 7:21 PM, Konrad Dybcio wrote:
>>>> On 6/1/26 10:51 AM, Antony Kurniawan Soemardi via B4 Relay wrote:
>>>>> From: Antony Kurniawan Soemardi <linux@smankusors.com>
>>>>> @@ -507,8 +519,12 @@ usb1: usb@12500000 {
>>>>>                reg = <0x12500000 0x200>,
>>>>>                      <0x12500200 0x200>;
>>>>>                interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
>>>>> -            clocks = <&gcc USB_HS1_XCVR_CLK>, <&gcc USB_HS1_H_CLK>;
>>>>> -            clock-names = "core", "iface";
>>>>> +            clocks = <&gcc USB_HS1_H_CLK>,
>>>>> +                 <&rpmcc RPM_DAYTONA_FABRIC_CLK>,
>>>>> +                 <&gcc USB_HS1_XCVR_CLK>;
>>>>> +            clock-names = "iface",
>>>>> +                      "core",
>>>>> +                      "fs";
>>>>
>>>> The bindings change you sent changes the expectations - "core" used
>>>> to be the first clock. And I would guesstimate that the
>>>> DAYTONA_FABRIC clock is not really "core" - does downstream do any
>>>> ratesetting on the other two?
>>>
>>> Looking at the downstream, I can only find HS1_XCVR being set to 60MHz, DAYTONA_FABRIC being set to the max rate (just for voting purposes?). I don't see any clk_set_rate for HS1_P though.
>>>
>>> Would you rather the other way around? Like "core", "iface", and "fs"? My concern is that such a change would result in a large number of warnings for newer SoC device trees.
>>
>> I didn't notice you're actually aligning the order with bindings. I was
>> under the impression this was a random change.
>>
>> For the clock assignments themselves, I think the schema reflects a
>> full-speed (i.e. usb 1.x) core.. I dug out some ancient doc that says
>> that we should have:
>>
>> - ahb (bus clock - perhaps daytona in this case?)
>> - system (core clock for the thing, >55 Mhz for compliant HS operation
>>    or at least 35 MHz for any sort of operation)
>> - ulpi_clk (60 MHz, coming from the USB PHY) (we can probably ignore this
>>    in our description)
>> - inactivity_timer since there's a BAM instance attached to this host
>>    (possibly handled implicitly)
>>
>> for the record, there's 4 hosts:
>>
>> USB1_HS @ 0x12500000 (this one)
>> USB2_HSIC @ 0x12520000
>> USB1_FS @ 0x18000000
>> USB2_FS @ 0x18100000
>>
>> I don't know if they are all exposed and functional though
> 
> Hmm, I'm not sure which option is technically more correct.
> 
> I did try swapping the clocks, using daytona as the iface clock and
> `hs1_h` as the core clock. USB still works as expected in Sony Xperia
> SP.

They aren't handled very differently in the driver, one's just enabled
slightly ahead of the other, so I wouldn't expect it to surface any
issues (although perhaps it would be good to know whether downstream
e.g. does ratesetting on any of these clocks to save power when the
full capability of the host isn't necessary)

> If that's what you want, let me know. I'm also curious whether others
> agree with this approach.

Dmitry?

Konrad

