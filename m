Return-Path: <linux-arm-msm+bounces-100229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGQbN81JxmmIIQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:11:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F513418A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:11:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0A3B2301346A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C2B3DBD41;
	Fri, 27 Mar 2026 09:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zu5LjdEv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tvhpv9tn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309BB3DB628
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774602687; cv=none; b=df9QRcaNIrGDj5Ny1oKZ3JgqxRxY+jX3JDBFlaWkZHr9tEDGNsVmndShNCKLc7PkSM21OAggDIqvePaXc7Jm3KZnRnEc/pm6kP0Ce+hQxKJUHisOMVMzDZlyaAZiUC228g8PYTgLGFcKH0iiz/bmRHUSxwXbsCC9wSD43KsovKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774602687; c=relaxed/simple;
	bh=uGozACJjJMX4KDbiacyy679zPy64q8SfwO9CEBpk+tk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=craYyCL4U+8VTSS8WkGBdEZnob9w1Q1CT8+elG1EyuOhxa7qtDQ7G2Maz998NNeoT817wdOKfXw7oF9sTJEyvARlR1iR+9kpmJx4+m7RxNCl/lvwbrhSfJe3e2CD5dr9UC6AexhdDsKe4S1WpHFHlB3zGKTruhpg9BJ8CQouh+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zu5LjdEv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tvhpv9tn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vqcb298575
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uGozACJjJMX4KDbiacyy679zPy64q8SfwO9CEBpk+tk=; b=Zu5LjdEvkNdaQE7m
	0avCjzdpdia1zX2iph2xFjSvIgvDwUNyQVXQjcQ3BeDcbFjpgAiPFcKcjJThvFuF
	Zc5UiJpVpHJdWdlVigz5i76brJwpa34NdjNPTBFRXreHW716GhZLkv9QPC50fG9O
	5aXkL8c//o3BbOOsFAlQuvHXO+aOdtK/9azBx69+WaMCmY+2rwaGfrwzyz8Ee00o
	hvDc1ZtvJHlxKtwiYYBWeOSP39UGDtg9Fl9ppiACE/yDCq/d/3Cdm/3SAnfTuMcf
	iEqNp+xYQ5KxMlE0sNY0VZVYt+ZpD3JdQM24eza7O3+GT5evxkYSMdw5B/uMzUbI
	K+r8Pg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bd8tdgh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:11:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cfbd336c3eso63374885a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 02:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774602682; x=1775207482; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uGozACJjJMX4KDbiacyy679zPy64q8SfwO9CEBpk+tk=;
        b=Tvhpv9tnV6jGXr1unO2Cc1788oB+uuhYDO10MzIw3j3Frlp934bJ8R0au7KUDoZ05D
         ZjTD/PfZKMm2EUmfmTJWf1Yk/SS0fVPJZUraRm+mCYPXx9oUiHa51ferhsSX2ESr2CLy
         UQRxAZ0gvva1nCu4CPEIp8E8UDY1Dm9ndA6LLO4gZvNkXzbeHq2HwbCCAkeoQHIinK+f
         77V7IVCX9cRgR3u9X+oK4ejwVCaUvsrO+G1mX+qKZwpfD/vuKSM/BeilWplSaIEoHKa8
         YknADw7pFpFNiYi0XMahg+UgY32BYE/G6r6aAmHc7IcvfPnNzJPl1A84Sb49nhJjpgw0
         FL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774602682; x=1775207482;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uGozACJjJMX4KDbiacyy679zPy64q8SfwO9CEBpk+tk=;
        b=cLb1RqACRjds1Bkza6BBwLz1ZHm4h2O/lw8MmuCVpsd6lrEDclZV0v6ZIrVxyEx6OO
         NSkLR6/S03D5YUmm0qIg2xnHDsM5A2V3IyptSFfZfEQSXm5uvqzNPyNzzLI9pZJt6+pU
         Wsc4y66R2jeoEKuGLIjQUg8TW/Hn/gIHGIrOilEsLjWQuydF1lAY0KUHJki5EFnE4d2Z
         E8U/pvplbNKx1A/+HQmxA1GIdP4XMLj1f49xgSj7cP6LwegQ7W41ydYvxpzwo09yjEZ7
         V7qwTHf8hRmzNXbmFknZrSRf8eIlU/hXUZ3vNOlP1Lq4i4KXManTfiyhSC9Xd+Oz3xqy
         YJaw==
X-Forwarded-Encrypted: i=1; AJvYcCV2Uo9LPOyXfD3kKswIshwGcU9XLRwWqE+f9gOn3tIOmGkCuZOSFHmK03jQk85Al1v49a0TlZ4m4nwt2S57@vger.kernel.org
X-Gm-Message-State: AOJu0YwTLFhCxgbyI6QndTBkE2PlHEG/tWIv5IFBicsGU27KW/75m8Ti
	hgaopHUimw0gjF+zTzcWFjYUQq+oWQ1YIN907kNfXDnlqAr7HvIid8s1mjcEylGQTWP1P/KoDis
	j0G1ZWZwhZOlGlEtlcgmkgoirMvsNhitO3x1RRJ/4v7ZktrvvxM5+AREs1Joyx0G2AHfC
X-Gm-Gg: ATEYQzy9vn5OSPGpWTJIvYJL6cyXWPBjoLwy8z4WTtxPFMd0JTFlvwI5XsHxtLpd99N
	ex5p372yWohKNn4ePkydT82Yuk8xr6XoEjcI44MWfJMMyVuO2bPV6/RHgKu5+fIteVft7VT+Wir
	d21iEdnR5TT5qLz9GbNNafbq1H1t+I5/aMuDoINOsaohVsQghw7/sqOM/GXI0A6ffHzJPt3uLXL
	xzNzVAzPR97AAMwUdozEA6nxahaVblZCdhTISYxh5ROqSDCSj+3ze6NEeCv3hIotYETwxfjXfPn
	6eLfx7DaljOo2xFI4ca8gBd0yxiAj7KPgqKb0C+d0qT4kprZaWtDNtKOF7RxnCh/eNDtt0n3cb/
	RRIQzXkham80BQbBooQP8Er/ijlTcWzHLjRC/TeqaMXIJurGaynInXQiuyyN50zPcIO3/D/yqB/
	jN1UE=
X-Received: by 2002:a05:620a:3181:b0:8cd:8b9b:4581 with SMTP id af79cd13be357-8d01c39ada6mr134835685a.0.1774602682187;
        Fri, 27 Mar 2026 02:11:22 -0700 (PDT)
X-Received: by 2002:a05:620a:3181:b0:8cd:8b9b:4581 with SMTP id af79cd13be357-8d01c39ada6mr134832685a.0.1774602681682;
        Fri, 27 Mar 2026 02:11:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66ad60361c6sm2072794a12.7.2026.03.27.02.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 02:11:20 -0700 (PDT)
Message-ID: <e063e7b3-e72b-4a2f-b307-080748cae2c8@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 10:11:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Add vibrator, IR transmitter and USB-C handling in
 xiaomi-ginkgo
To: barnabas.czeman@mainlining.org
Cc: Biswapriyo Nath <nathbappai@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <9a61ad79-b787-4b83-b7dd-2ea36e7cea81@oss.qualcomm.com>
 <cc0d9e1d8f85bf2b67df35b8d9c2110c@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cc0d9e1d8f85bf2b67df35b8d9c2110c@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA2NiBTYWx0ZWRfX4VUNVXREBjUD
 370z5n0LMN0wna1WMJLSgHSPSQkgUEA6t+8riMHWNwJwC1yIZZDXaKcAQHov+1hLdiYhgoawKe+
 HNjSdKBuiJZg3PF1215P0bD/fHXD/f52oOE0SjeV2vfdg8vhesjgFK56yClI2am/df0gRwI2f4b
 ljq1d2FiJfaiwwJvqSf/Cejtg/chb/IXt+qu8dWnBkk1sCwgTIEnsZehewBxFfj7eVnY/XkNy04
 +2H0x5aJi0pPOcxa1x9QfXtS/kjuFSL/sP/fujlrHdjGlUCxX2NwBXl3H672qw8sarpogHwqJVt
 W4rzbnn2G8E2O814bmLoSMTTSrPmI1Rv5CaSmxjfW5o9vgO0M52yWVma1qEVI3DVZBHVZWFrCHv
 horc1WVN5Z8m9Xr95SHXQ+dwOOXyuZycTHzEcWNRhnGAaSNnhGT33jg2jt4Nd4xiqcuGBH8+R9j
 kCnIU5dvxkZc1xHqKXA==
X-Proofpoint-ORIG-GUID: HCBh_7Va6zSQjumZ38GbuH-4_gSsrq9t
X-Authority-Analysis: v=2.4 cv=BZrVE7t2 c=1 sm=1 tr=0 ts=69c649ba cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=OuZLqq7tAAAA:8 a=pGLkceISAAAA:8 a=yzi8m8hClloKuEgN4c8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: HCBh_7Va6zSQjumZ38GbuH-4_gSsrq9t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270066
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,mess.org,baylibre.com,somainline.org,vger.kernel.org,lists.sr.ht,intel.com];
	TAGGED_FROM(0.00)[bounces-100229-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 82F513418A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/26 6:48 PM, barnabas.czeman@mainlining.org wrote:
> On 2026-03-26 10:39, Konrad Dybcio wrote:
>> On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
>>> This patch series add support for various components in Xiaomi Redmi
>>> Note 8.
>>>
>>> Most notably:
>>> - IR transmitter
>>> - USB-C OTG
>>> - Vibrator
>>>
>>> Also, fix some bindings warning as reported due to previous commits.
>>> These are tested with linux-next tag next-20260320.
>>>
>>> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
>>> ---
>>> Biswapriyo Nath (7):
>>>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable vibrator
>>>       arm64: dts: qcom: sm6125: Enable USB-C port handling
>>>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632 Type-C property
>>>       dt-bindings: leds: irled: ir-spi-led: Add new duty-cycle value
>>>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR transmitter
>>>       arm64: dts: qcom: sm6125: Use 64 bit addressing
>>>       dt-bindings: clock: qcom, dispcc-sm6125: Add #reset-cells property
>>>
>>>  .../bindings/clock/qcom,dispcc-sm6125.yaml         |   3 +
>>>  .../devicetree/bindings/leds/irled/ir-spi-led.yaml |   2 +-
>>>  .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi |  56 +++++++
>>
>> I'm assuming all of these changes apply to both ginkgo and willow,
>> which both include ginkgo-common?
> All these change should work on both, willow is a ginkgo with NFC.

Thanks for confirming!

Konrad

