Return-Path: <linux-arm-msm+bounces-112165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lbexB2cGKGoW7gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 14:26:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD26366008C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 14:26:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Lc3akBcz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=E2tO+sz4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112165-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112165-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 59BCD3016B7D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 12:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F114F416D1A;
	Tue,  9 Jun 2026 12:26:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D16416CFC
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 12:26:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781007965; cv=none; b=kyJxhfAdU1UkTVascebuF9hu9rQrp5gT8KGjwefUhOAHLkf5N7yfZAmywqYws9c2PmNL4QdCftqllUyiPvzyP32s1LtUHhC/al1Wx3iBiukKO2yxLqLplaXzDSag6s248P1kmZt6ZI8tZZztAWkiJzkc9Om8ChX5eohOc+BylOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781007965; c=relaxed/simple;
	bh=Ts2/FF30nKpmBcjGZN0aUYdrj2LtbrxodUaLBGi4zIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nmsrM+YWXZ8o9UhL+82pg3r58bkb/aiZxdnUrwCyWDU6QyTMOL4GdXyqrsiQHKiK4JUZ8kx2VsigVvOE2wcl25qyyIXLet/npqlQUQRUZayuNk9hfCWigw0jAaqzsOV/iaIFiSWSGhiH8VpCLU+3j9b3lm4E+VBry3rmwSV11No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lc3akBcz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E2tO+sz4; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659BnBwn518712
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 12:26:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W7P+3n7+hHYd59il+PzNqQYdlKI3EP1oX8aavZ/2jfM=; b=Lc3akBczV43yjUbM
	X0EyPi6/uvJyn0f3w5Wj29bV2WhiLYmeb8q1rdk17fleqDyS1tuKDglqpD3kkqF5
	rZ9cwOR4i2RKsyIhGJprctORhHnH1Z0GcjD+CHk/QSLhGDDbLzm16WAQUs15ukQW
	2Yk24Vg2ymIVSxKta5H9IOH+86NRMCnGiPGK2hZtfCPq15m/zknwnc5Zf6ad5IYd
	tM/yngbnSjfDLWXm75viFzzuT8Qh61SPVRUUoZL99QxG784Lt9pYQ3vO0yG+WRG8
	oYjxT/86GgD6be1BwBem8GAzRzS8WVO9btR+ivLCW/atCrRGi1fzC+966mNq0bRP
	CX97+A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epf0ss27s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 12:26:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91550f68e7cso145118685a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 05:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781007960; x=1781612760; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W7P+3n7+hHYd59il+PzNqQYdlKI3EP1oX8aavZ/2jfM=;
        b=E2tO+sz4ugTHr1D5+z7Ck/AZCbSZnhrj1ilHnAEFa6FDCBljqLZiSGw5myn6GcuNBm
         AmiA1KTTQ011P0f4bweFz53irObLEYt6A0Kw1T2c+aazFyt7afmK4dorBxx02yyludCN
         bloqDSNJM5ikDEZyj3Kq/nXHFlKvmXp+5ovI19+321BIMHd61A2UYq+/cP9O1ySfmOcZ
         NNnx135fbSCfAzebxPZ09qHByVRICGMsooGxQkE20yDuQT5BJFz4bEFOaIw4JirnW1e3
         DB41l+/tWL3n9SHN5EbdCRLRVcHr09eR3IF3P5IPXYJqHgscDbMdnShr2/ssH7I4BZQC
         8MjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781007960; x=1781612760;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W7P+3n7+hHYd59il+PzNqQYdlKI3EP1oX8aavZ/2jfM=;
        b=gQ8wi0p3AbJAGtL9sL4e+1sfNm+OjMjJjLP5b+C1aWyrhLjpUwFdoC+7mo8Hj/A9a2
         I31xdqjSI4PiWVxuPEk9SRbg6KARBNRpN3kSwEpsQdML9bm7pyc7GJUgKJrrPYJiEm0X
         kb9z5qQQfXwy2aiVu1u88fas2Mhm20XCjrRBZ+i23zhXogaj7Rbz7i7FcDs80C17b2XB
         dRaZjbU27NI2/61cA9o7I2E8NRGGDsWJ5F3aWdOoSq0zzdhw0D4X7kCp5yKzu5CqQLW6
         hVq+PVhB01XPdki5dNBfU8jrjdDL15p1r8yxpZrW/6Wftyy3rz4SXg87P1miFsk3Fb/y
         yRqw==
X-Forwarded-Encrypted: i=1; AFNElJ83pMWGws0XqUEQ9+nVbqhH4OvReDxD2JXW6bQ6ljX+UhPSnZ62xpgnLi46Yvh7yZl9pRRK3L2DoafJ0bAD@vger.kernel.org
X-Gm-Message-State: AOJu0YwTOOHIGx2tNhME5l5CXhsfqR58AfSrh/h9Ljts46W6FZdr4vR+
	SipYH3D7Zk9ciuRy5IesaV83Fjp0S84zekZ1QeTebb3avSnNS0tiUfAkIFWTLxNk5UC4w2vJxdn
	J/Kimvueegf9zoAsgXDmvAg08QH8v+r42Ea92D1NgwZIwNpRTGaTLb1HcEZsgmQvucQis
X-Gm-Gg: Acq92OFs9xIE0lyKsc0bgN562Jx6fFWfGxpf9aHaP+YbHsFPmFnEmQG02OABNIbD5Tt
	zUB3T+Xxc4BhM87w3sQRCacJYw4rr4d33b48sgJp7ZhdIKW9t/wn2y8/krhKxJr6zRqstW7hUDX
	cobiKitdy+Gxi45jpE3T7IM8bsEw6uV0NDk74WUvMZozrFvU7K5fN57fVLQYbi64YXI3NWHdpb9
	SWHNU9kmlqNWOwhObA/MJTHnb0jTttMEQ+do+En5r30H4HQZFWDcIbjDWNvwjfwb0XukJDCD0ty
	7Gep1L088IkxNB/UDx+UJdiGESqWCHI6MMMUx4ufI7HtYsmHXwc0s8U6NDDUNw0dXTCGCPiZ898
	JMMebmtBtjEte/eXkLDCgUmiYUTAGsllyWXK75LmlN1zYRUAD9nNwl0I/
X-Received: by 2002:a05:620a:458f:b0:911:295d:59a1 with SMTP id af79cd13be357-915a9e00b2dmr1973571085a.8.1781007960140;
        Tue, 09 Jun 2026 05:26:00 -0700 (PDT)
X-Received: by 2002:a05:620a:458f:b0:911:295d:59a1 with SMTP id af79cd13be357-915a9e00b2dmr1973567485a.8.1781007959707;
        Tue, 09 Jun 2026 05:25:59 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051b8c7efsm1021314666b.14.2026.06.09.05.25.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 05:25:58 -0700 (PDT)
Message-ID: <271de410-76a3-4bc6-ae78-2054fd7b8480@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 14:25:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: clock: qcom,gcc-msm8660: add CE2_P_CLK,
 PLL4_VOTE + per-clock annotations
To: Herman van Hazendonk <github.com@herrie.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
References: <20260530135731.185313-1-github.com@herrie.org>
 <c36dcf40802d89a4b43255394386fff974a6301c.1780197117.git.github.com@herrie.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c36dcf40802d89a4b43255394386fff974a6301c.1780197117.git.github.com@herrie.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDExNyBTYWx0ZWRfX4zI5qY6I15co
 MbDvLjMayqHrHTKp94gM255NxT+QIOMlFez1ow/4BTq6FRju4WUvVbCOaXz7b8u+Zle0VDDjmlX
 YsyW4vO43lviaFyF/b1IGYT5L10XSpihFCQPgFYpXQPfG0s2ULpUYkV+wP+0qN/2jekbGCRTTn+
 iUjWRcazpndbXKs+znyMbJ0tsuHbxtmaDd0QropwYJh2iblTxk7FQ/quDOo2Yu78IHhOguXoR4f
 RJXMTSzAbGlrcPUvd8N4pcDuwzpqrM/fU8EaxTs6O34dBoiGpaxqNdw52v73J7DOh+YBqdhoY3u
 6bSPKvbJsXZBBoFsy4q2A0f4+mXzFEIUT0tWcnu6UV54WtCOosaID4ZxOnWxTFbgRLOF6L4Q7sC
 VF2uw03oHYk7YQ2OB7R5LiNum/WGqYI1G0A+nTQ3L8w3kOPsCYy1OIc4LV4yuPRa/GXOMW2wzVB
 EQZkA04OiFElESCvkqg==
X-Proofpoint-ORIG-GUID: Rcv6PIYJUptNjBb9Jgx5SEarjzI2FniC
X-Proofpoint-GUID: Rcv6PIYJUptNjBb9Jgx5SEarjzI2FniC
X-Authority-Analysis: v=2.4 cv=GeonWwXL c=1 sm=1 tr=0 ts=6a280659 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=TTKJ41doIbe5-gzaxsQA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090117
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
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-112165-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:andersson@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:krzk+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mturquette@baylibre.com,m:robh@kernel.org,m:sboyd@kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD26366008C

On 5/31/26 6:08 AM, Herman van Hazendonk wrote:
> Annotate each clock with provenance and consumer information cross-
> referenced against the GCC driver, the downstream HTC/Samsung/Palm
> sources and the legacy TouchPad / Pre3 vendor trees, so reviewers
> adding new MSM8x60 board DTs can tell at a glance whether a given
> clock is wired up in the GCC driver, in the device tree, or both.
> 
> Add two clocks that the in-tree driver and downstream consumers
> already use but which were missing from the header:
> 
>   - CE2_P_CLK (Crypto Engine 2 APB) - needed by drivers/crypto/qce
>     for the MSM8x60 CE2 path that the qcom,msm8660-qce binding adds.
>   - PLL4_VOTE - software-vote handle for the LPASS PLL4 used by both
>     lcc-msm8660 and the modem subsystem.
> 
> Both new IDs are appended at the end of the existing numbering
> (258 and 259) so that every previously-allocated ID in the header
> keeps its current value. This preserves DT ABI for any existing DTB
> compiled against the prior header.

Is this claude talking?

If not, while this is indeed true, it's something implicit and
definitely not adding value in an individual platform's header..

Konrad

