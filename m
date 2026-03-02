Return-Path: <linux-arm-msm+bounces-94905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIx4Ng+ApWl1CgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:18:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 409DF1D8267
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA9D53044089
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 12:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5292F364936;
	Mon,  2 Mar 2026 12:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nNldSCxI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QeFNly66"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6F7365A15
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 12:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772453649; cv=none; b=nmy97gIdLbN15uORnUrII3YqSTWrjcUXzvt1WRXBDHQMpmj4XpIOxevigOlNB49wB63hgs8R22i9s0F5dM+B5muJuJIFGx+ZdDV4ql8CnQiRnJtpIFAL9e48CqLxkSTVUu6pjfrujPysFH839AsoL1LH6UeIx25pBSpOJMXjWbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772453649; c=relaxed/simple;
	bh=XHXBp3d97iiosVab1Jn23Km3/qBA8emWKMZwOEPDpbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EmE71l/jvTxL+wzm5/09/55S7pmCmQeTAp5vj70sfn4QBRLJCHKLMeY8SDltqRq0/rmNCz2zd6KVmfdMAv7smw92XjQgrGu8NOnfk/mnoKsAExiYKyBEkIS90HIDtysCFe0lPDH87rb4Bkj95RX21yeCKtZIWRmPk6fdz+PUMNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nNldSCxI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QeFNly66; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62281H6q356388
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 12:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	foPu8WsEnJMu/Sq9F0b9Fw4C2wsRnWlxNiY7OWrklQ0=; b=nNldSCxIbdShk4kT
	+aAH9TQnYP83Db7Y0xmr6lKNnV5MwkSLK233EeShy+kLIEq6M1JHQBnDJ9WgdyUQ
	wT13mBDOvGbgPvitn4DZrcQexMERL9xJmOJcPS1Z1HhGB+7+A/6IEGZFqRUzaJbP
	YDEXmPD4HKc6T+t/IfC52KBmCGL7hE7DlJPcH973ArwRt7O/xOZK6qzjTB2v8SXW
	TsHjx40LDqAxS97QYOKPV5qDgTjrh6qR9vXdTs6CFWCWSzPv8jTK8IWsF/JZau6q
	iz37DBzO+RgTwVNiL9PVZKuwlA1GI2mwP/Cijx8ZQyRBPu3cQmnbIV+OejR7AZa0
	/gxE2w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmw64a9ee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 12:14:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70cb31bcdso417646485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 04:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772453646; x=1773058446; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=foPu8WsEnJMu/Sq9F0b9Fw4C2wsRnWlxNiY7OWrklQ0=;
        b=QeFNly66rSYhuurXakUmtNetVAOon3UoO5CLu0ucWFLV2DGwD0Jz6PCwQw/I+zWHWe
         5soa3nFtbx1d7Oe4mtV8md3wSTBEkQro3BSbEcK5nj9KkXer1dlgYa6iDeDN9F0HkmXy
         VvpT+TS+8uOQ7klqsW94Ic6YIyrHtbWRY89USBbHzsk+ScujjZ+oaOTrwYjYkI1W6jz4
         E+CQFlK+uApPJPdc8e9alAwbjAfx3kGe553KqGGYZih0zfLtqbRte6drNsl4vFVIi9f4
         KXE9YMdestvhonR7mK+cfgksequJ+aqeJXKJxjb5WbMEeqHXFg6NKSn4/2OmiLo0KTM8
         uv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772453646; x=1773058446;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=foPu8WsEnJMu/Sq9F0b9Fw4C2wsRnWlxNiY7OWrklQ0=;
        b=VeJNwplrd1nO+vitavySK29KMpuLIE+ywS9xdqy7MNPuDq57N+9W856VtcyGPA7P7H
         yBtkLO49Csmntgq3gs+4V0URq9J13y8pA3OZYWY3f8rG2iEF373oSqlmj+gDC4H2D8G0
         KC0LOwoOHz3CoLjYLtB6g2RhBQh4qYJz29b6JxnvABXKnGJyAisXVT/B/6Wyq+XKR7TM
         BGd+Lr/eKj2svZP9vZCkWqF9am5rWYbGwFl2/xf0OYV79IgzgqT/ZcxnpZ/wba5FbXYa
         ODeGRdsbmQHE1TWd+mJr9LUBXWSvzg4c7bssLY8y0UwF1Aj7Jv8Qi43ff2oBBmqvi76O
         stYA==
X-Forwarded-Encrypted: i=1; AJvYcCW1CKBLVsWEAetRjZa4iMZTgMqSagWPjOKEiKWJ99x3Gb3MftbA/hSZd/DDCRO7Qa4PJSaaMCPiWcQQTBCm@vger.kernel.org
X-Gm-Message-State: AOJu0YxKOu4UL7s2bSFcbmxgV1IhKXcD1Y3XaHDNoCsXa7D7pcuDt/Db
	0H8prEswE1V4f4M+P7qMyJzvlHUFgXcds5RuJpwuHyWWDFKa2jm36pCrEZ/Gv/jMUdgIqe+d1PT
	0ujepE/TbfM44/VfvcfbZH6Bp47LLcE5rb3MpYyaNUquYrGQWiQXnMhlI7uqT5OCAbE3t
X-Gm-Gg: ATEYQzyqn11GCLcUlXpL2PoA+aOIwa4S1NLuCcGpNRbHK3SxJS2gKoJvsgazTCz/F00
	jaLOemZFL1c+RyFRvjDJK3AiWnx8kk8DG+x6BTFaqNkOti6irVPhJrD0r1WxwqfIyO7Q40YEoXw
	SJNGgVeI9RKrP5vM726HPchQCg/p38MtSFapmD2irPmW6DwWXMvrjm0jGwCyZbk3QFgIpHyhsQX
	YmqJhBH51iqIrk9omcin+HXZzPtjIDLqQ5vyIMUQqrM76VsTcOOMkz8ZTblvGouH/+lETQTtqOW
	KEYikKKNC2iA4Ra0suF9/NTyCD0t0FWtLXPkZmbYCDa3pcZgF15vFAX4lZbQOE6KGw1VIBy5u98
	9oIrg87CPFWiC0tGuiuLfarVH8vsWjTkQTYF+0wsQfZRxEv9Lx0d3jfCUorRmiF46Nb43WQx+Ac
	x6y14=
X-Received: by 2002:a05:620a:7084:b0:8b2:e346:de7b with SMTP id af79cd13be357-8cbc8e50f80mr1166823485a.1.1772453646639;
        Mon, 02 Mar 2026 04:14:06 -0800 (PST)
X-Received: by 2002:a05:620a:7084:b0:8b2:e346:de7b with SMTP id af79cd13be357-8cbc8e50f80mr1166820585a.1.1772453646233;
        Mon, 02 Mar 2026 04:14:06 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabd4695bsm3488662a12.12.2026.03.02.04.14.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 04:14:05 -0800 (PST)
Message-ID: <630bcc07-5290-4099-bdf3-b7e37105619f@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 13:14:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-dell-xps13-9345: enable
 onboard accelerometers
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: laurentiu.tudor1@dell.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260228-dell-xps-9345-accel-v1-1-daf9e3b3b5ee@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260228-dell-xps-9345-accel-v1-1-daf9e3b3b5ee@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AL16YUTcI_cHZdInTSStx0yXp8A2efIO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwMSBTYWx0ZWRfX0at6oiLFpVWD
 +e/y5opL0gIkM3fnmX9WrsYEOElLcv6eGGr1GGA1aGqQtaA7SZEB6yu3GNk6pl1pKbq5vIavWHF
 YhNlA6ZLuZD0sb3AWXtrbL5DMp6FqaW/9aF6ncPEA34GYYmxo0FyQoi5IBrFaP5nvGmfP1mJxv0
 UuSH/JIjGoMnMGkEtXH9q/Rs6je0sGGdt73XviyBcUPGGsoVccFVZhiskjLUmDBk2bYop6nzPb5
 cXV6Lm55UCEByjZ2Biw64YMGKSm39q3HXDbMdxgX00FGmVAhBi6p0VWeazY0gV4M4Y8Hz/ArAHP
 4JIEuWdR+rMRevScRS/joTFBonK11qCGeZBR/YKvE5NjrqSVtBUHvFBUo0bcCo5u/fXO2861nYB
 hso3RNOAZ1mn68fl8XI8ytL+dgUj2ltztOdHg/WJDX7zwNjarEabwqn38TraGEYujPysR1jchcs
 UoAwwQs8M/3JzteXLkA==
X-Proofpoint-ORIG-GUID: AL16YUTcI_cHZdInTSStx0yXp8A2efIO
X-Authority-Analysis: v=2.4 cv=I5Vohdgg c=1 sm=1 tr=0 ts=69a57f0f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=FX2E6SYNxEhLkC_k0woA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020101
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94905-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 409DF1D8267
X-Rspamd-Action: no action

On 2/28/26 6:46 PM, Aleksandrs Vinarskis wrote:
> Particular laptop comes with two sets of sensors:
> 1. Motherboard: accelerometer
> 2. Display/Camera module: accelerometer, ambient ligth (and more)
>    sensor
> 
> Define both i2c busses (bitbanged), sensors and respective rotation
> matrices.

These GPIOs correspond to ADSP/SSC-bound QUPs. It may be that you're
poking at the same bus as the DSP is, concurrently.

Konrad

