Return-Path: <linux-arm-msm+bounces-113640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 78/sEAadMmpF2wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 15:11:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 902F9699FD3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 15:11:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CfMnS92k;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fqPwZdNs;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113640-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113640-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7EED430160D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4CE922097;
	Wed, 17 Jun 2026 13:03:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CC7380FDE
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 13:03:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781701431; cv=none; b=cqOJvb1rn3tMelU15JQ8HgpWHl5Ggd5hTZQTnF0yGq9VEsXajAxL5iW79tXQrUxgEj86HTHl5bKMql9eHEQosycpnEY3ili4nMY+9tLi5nI0GS1aQXPXY7CuRdR+T2l6bsgykGWpfUCyGt/9m+UsD1ieBnjBhIzdK3Ve2UZLVUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781701431; c=relaxed/simple;
	bh=vkbVEGHGPYIWff5a+gnc1xm21wzif9CrOR85hzc44xs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FpSsWxBmgjB8y7G/asWSUiOmzi6NpsCatjx7S088WvHxAxHSTRa4WfaIpLFwp8YfIq1WeQd6lVHhfveHhrCvAUaGICvfHxkh6UciW7sc+1L/5aWi/GpF6Ghbi0u+AYiCUlYgLbynhr+MKSzLiKm9OAS+HJrdBjV6aVC5J3c5D8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CfMnS92k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fqPwZdNs; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UUba3273558
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 13:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+oNFtPh1I858ThMD4359ZKal6EprR4daQKZRbaXsDx8=; b=CfMnS92kg9tnBUtb
	X9V7iumsmtCnjURVwW1DcA/XTS6ej6Axea/Klb2bhVLcixe8nrGTkhrY4RAYVLVi
	pFM7xNxzOhfTWMTtdJKaguyNEpLX/w0wpsaoJ0vtKnQ1aE7LFZYCIPilBxNL3iqz
	8Mk8bRT44BQh2+gKNH0bIOzlgp68DvJ8tNlpTCzhEf/tNSWu9Nk9sw4JFoVDb9wN
	mgTal8O1G8xPSm0eM0+MBkwl63a/2udap/XBgk+kmQm4ddY3pQmaJqRg22/5IeAy
	T2ulnuUyAPmENfjLmwsPBK/n+TCb2S0AKUzFceeqTFvZg5wbSai3sedstuPu4HNL
	XOpfxw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euefbu7n8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 13:03:49 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e6b5a8836bso2282175a34.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 06:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781701429; x=1782306229; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+oNFtPh1I858ThMD4359ZKal6EprR4daQKZRbaXsDx8=;
        b=fqPwZdNsT8rt2KbXvtjuiJxUMYhmBAiKiz2IUAHb9Cx9+nHERsxTobTuLxHkOT6x0S
         Z3HOocFrAKDYopnZJ5NdUbCFXNkCv2PMAe76xKXPJjNkkgQedERfcfaQtfKII/rYd9CU
         XZHUkvYlLXFcGWm1LE2hO278eNrEi/BrfHrFvoOfWXTVcAcVIjiuDavhV+mP+FxQKrBY
         wp4fPWui+ztpWnXYEjW3VYDmJtp4XChQcou5LZiqfJV5ucDI/meT/pZXe6RLblfcVh1R
         fJIEehMH1yro1eKQLHQoSnXHGp5bZtvHIcpzCMivW1S8DuZh1qt8JJv+d5J2VjdkMedF
         Wh9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781701429; x=1782306229;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+oNFtPh1I858ThMD4359ZKal6EprR4daQKZRbaXsDx8=;
        b=LVcZ4C49aSkCtmoXBCH0F1AA4JtxLp9zi6KyjHS/L9bXhgJ4GSi6JfxM7j1wV5KjhN
         5hblOh9QaH9qDNr2uMFzpDY8x1II3EkdbLDUngdunCem31hWeKXkwdffi4PQ64nrMIrr
         Xz+xz43Jre9lEaHXnYQzcLTvj9xPLldpHSsg4+wlKvipIZyI1af3TdEGMw9j+5cxxQg7
         nmFw3dtm/pwACljCopDbkeV05rHdp6nx2ojNRJHqPxnpvJ02vm0rwJH0BjjzcFPlp5yn
         wNV3bIg5LB6W34TN0FlYleTiUNBDDpFtxHLhCFwcVN1bPA7SUCLPnDkaNAN55LtblywX
         oDrg==
X-Gm-Message-State: AOJu0Ywao3LY2TzdV5scumOIsghlLVdg0XebKibb1Z05fZ9gProzcjt8
	cinn+QixWHQaMRHJhh3T6Zb1ztG7mKtZVUB4L4cfg71B85RWzljKqWyoBW58N5goRfJfBPEJ95m
	Pd4z3PyXJMqAuVJWbiGKAQhoOMngTiMpKk4EdIqKK2a5I6jQjZNylD8B2SfzjAhzki56r
X-Gm-Gg: Acq92OG6LYTzFU1qOHJtFELM7KljSJOEe3W3OjrKDc5pvockvDeswf36Ym9s5oaUKgX
	ecxZ5fNL6TrKeSstYmNxV+Ttr8Bf9LpXQLyQqInFHmIxYbrbN5TQH8ZU6bX5JY1Oi0LVBwdrEVL
	VBFmlaMZeYw2AiDCwmOMnrbeIYPZ69Xo2dWYy5VpnYsHqAhDHZt8tO25AgAmf0xg5laTYzM2SIH
	WrEJ/0Ap7Zrq0RqfGmjPEnjIVaciaLy6eMBD0S2BcFFLbC+2oNqO1mChPtrOoSG2syxrAd7XmOs
	WVKn1Ubg1pl9GquseN1HsX1VoSPoaa2T79HUy3VvYA/AT1+3RSRta3Ejvhii8clnQnaN6XEDa6v
	1XHiDSqDz/rTlHkjyka9cBz7o+KCX2xI9MS0=
X-Received: by 2002:a05:6830:67f4:b0:7e6:cbe3:cbbe with SMTP id 46e09a7af769-7e90b4841d8mr2219596a34.7.1781701428959;
        Wed, 17 Jun 2026 06:03:48 -0700 (PDT)
X-Received: by 2002:a05:6830:67f4:b0:7e6:cbe3:cbbe with SMTP id 46e09a7af769-7e90b4841d8mr2219518a34.7.1781701428207;
        Wed, 17 Jun 2026 06:03:48 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c063f9b2470sm75913666b.62.2026.06.17.06.03.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 06:03:47 -0700 (PDT)
Message-ID: <5ca49c34-d0c9-441a-a8d5-6a334b6be58a@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 15:03:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] phy: qcom-qusb2: Fix SM6115 init sequence
To: Iskren Chernev <me@iskren.info>, Konrad Dybcio <konradybcio@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260610-topic-8996_61x5_qusb2phy-v1-0-d7135980e78f@oss.qualcomm.com>
 <20260610-topic-8996_61x5_qusb2phy-v1-2-d7135980e78f@oss.qualcomm.com>
 <5b474af3-f651-4a64-a5b9-c18136e589eb@iskren.info>
 <a51b6333-cd5a-4a38-b748-b6623c6a1078@oss.qualcomm.com>
 <6fb6f805-aea1-47e7-bb7c-bc5ecb2201ae@iskren.info>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6fb6f805-aea1-47e7-bb7c-bc5ecb2201ae@iskren.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: c4hUPwiBmMquiZc3Ej756xA8BKMN_cfB
X-Authority-Analysis: v=2.4 cv=IeC3n2qa c=1 sm=1 tr=0 ts=6a329b35 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=H8nO66aeAAAA:8 a=sh5-wexBAAAA:20 a=EUspDBNiAAAA:8 a=9_hlcAaISHj5Px0iC68A:9
 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22 a=29nWO70QIcuf0NxZitda:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEyNCBTYWx0ZWRfX8Jo0vhMJRvnP
 LSvORSVSEC+5p6sV5SHtXl78gwcglaX9HI2oLkTo5sdzGfBj3GCiBgj/b3KkYf0qRrZClgO1lIf
 cwQjdgF5rEcqZMOo2GGj94WS4i2y7Gw=
X-Proofpoint-ORIG-GUID: c4hUPwiBmMquiZc3Ej756xA8BKMN_cfB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEyNCBTYWx0ZWRfXyk93nc5na607
 sdp/+11BTMAOxwyRjHcotChhcsbLXWwmx1DO2M553di13h03bqCe9i0wPTBg6hHwUue7C5huuLV
 FAE/4SIo+4v04XlI5EZBljU9QC9quXS93g7Sg185NY1Y46QsmQnPDypyZkgSrNDNhgQqkiRhxgh
 hB3/CLKEN3emAKBcj6ZeQf/H+bBmh26o/ypLTrIlfQv19UolRpkKkmli4EK1RAlS3M71WVAkCE6
 sQ2x40nhsmJGLnKktb+wVat2RgsPZO8pp/EbWmlHFu/x1iCdIPYgOkHMZCNRxAdvje/qOashE8a
 321Oe47t2BJAmXwSOcomPGM9y2Vo2aICZxAfbJUokClJoRMUWgGMRqfw/u+v84lH5csdI1TrGtk
 zKII8gYMKmdk2jdA74EVWcc+WCLWVI9nnT0mzc4g2cmHbipKxMfAK3ZMApWpmjNHClgSdjupVTi
 GfjS/oZJfSKxLEb258g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170124
X-Rspamd-Action: add header
X-Spamd-Result: default: False [8.84 / 15.00];
	URIBL_BLACK(7.50)[mainlining.dev:url];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:me@iskren.info,m:konradybcio@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113640-lists,linux-arm-msm=lfdr.de];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,mainlining.dev:url];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	HAS_WP_URI(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 902F9699FD3
X-Spam: Yes

On 6/17/26 2:48 PM, Iskren Chernev wrote:
> 
> 
> On 6/15/26 1:44 PM, Konrad Dybcio wrote:
>> On 6/14/26 2:29 PM, Iskren Chernev wrote:
>>>
>>>
>>> On 6/10/26 3:04 PM, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> I don't know where the existing one came from, but it's apparently
>>>> wrong, according to both docs and a downstream DT [1]. Fix it up.
>>>
>>> They came from DTB extracted from a running billie2 (OnePlus Nord N100):
>>> [1] https://mainlining.dev/wp-content/uploads/2021/02/03_dtbdump_Qualcomm_Technologies_Inc._Bengal_SoC.dts
>>>
>>> The phone was bough early after launch, so it could have been wrong/updated later.
>>
>> Good to see you're still around!
>>
>> Looks like vendor tuning. I see that even the initial commit for
>> 6115 had the init sequence I posted. And the OnePlus sources have
>> what seems like a project-specific local copy of the DTSI:
>>
>> https://github.com/OnePlusOSS/android_kernel_oneplus_sm4250/blob/oneplus/SM4250_Q_10.0/arch/arm64/boot/dts/vendor/qcom/bengal-usb.dtsi#L145
>> https://github.com/OnePlusOSS/android_kernel_oneplus_sm4250/blob/oneplus/SM4250_Q_10.0/arch/arm64/boot/dts/vendor/20882/bengal-usb.dtsi#L148
>>
>> To support that, we should add a new property to override the TUNEx
>> registers - like e.g. qcom,hstx-trim-value that's already consumed
> 
> My 2 cents - I never understood why init sequences are taboo in mainline
> and widely used in downstream. I guess if it doesn't change (but across
> what and who decides) it should be in code, but if it's "tuning"
> - whatever that means, possibly depends on other components around, it
> should be "configurable" via DT.

The PHY has some electrical characteristics of its own, and then atop
that are the characteristics of what's on the other end of it. Making
all parameters configurable (i.e. raw init sequence) leads to duplication
and pure blob seqeuences, whereas making everything constant leads to
polluting the driver (if every device-specific seq was to be in C files)

I think the current model of "override as necessary" is OK, especially
since we can use the upstream leverage to require describing what the
altered parameters actually change

>> Would you like to look into that, or should I take this?
> 
> You can take it, the other option is to mark a TODO, and if somebody
> feels strongly about the binary value in a usb tune register s/he can
> take up the task.

Seems like OnePlus does.. actually, a number of vendors do. Sony
does/used to do some tuning there too.

> I just wanted to point out that the number didn't come from a random
> number generator (or AI).

I'm sorry if my language was too harsh. You used the best sources
you had and had no reason to believe they were not the expected values.

Konrad

