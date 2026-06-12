Return-Path: <linux-arm-msm+bounces-112887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8nkMBZW+K2rIEAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 10:08:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF436677A71
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 10:08:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jUkIZABS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OUkugKBc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112887-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112887-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A0CBD3010710
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 08:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148EE373BF6;
	Fri, 12 Jun 2026 08:08:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6ED0371056
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 08:08:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251710; cv=none; b=i6MQyFTsnHw/E54WlFg4dTFQj3BQscoymrpeuLMFAhlrwk/9VYT0gwJgyGxfvfyy8ssh8LDonnu8BXdMmG6A3uR8se0Ts/BcpPHu7hG3sHZMcYyl3x5pUkXm5Xis3VAUrUarVQwmW8QMo2OP0MRlZDPAsgpFj7ppP9h9HW3mGxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251710; c=relaxed/simple;
	bh=G7R5v7S4yfvUXe2xOvoA2FRSQ5VC1p6ljqF9ti9JpA8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ApNpmd+6bBko/aJ5ofUXVpzz1/GnkBSZMzSQp9L32Xr5Wd6xXgEUxCHrr7S+peYtTA1cMikgVlUPyWA/8CTmaGxQb4ainukrelBNZxxwoCVM02sllXO7KwelMdSAD1U/B3iIt+Ud4HNoX20Thc/my/OvKAi6FnBVzlUlDPiserY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jUkIZABS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OUkugKBc; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3C9vl2534242
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 08:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DWYvrVR9u8QpN8NdHDBscoTKQgzIdztsQdgF9fhW5bQ=; b=jUkIZABSDjvG2+0e
	keSeprAhCzaa5ySTpA+uZ+dB0o2jNq+hfFPZlU2qcEzi3gaDJmjvQR3FlVsKBp61
	TZAMo0kLdzHFxCDKn2VYZWB4VvlT1P6efWlZgYTYh9Xkmn1SIzLdV9J5g0lOfzxR
	SE8cdlv/MVtNx4sX1WhsxWqIw9qWHNMCS3uHG9DUKtUAyo4xKLqTrdDfEINuUf9i
	48Plbe2rc6Ly2G3Z3hs0olOn9cJZeXJAvv+qumItGXA8kixES0gI5uzTefL9ZjMi
	J/5g9HRhH7dVKCeChwtX/Zrxf3z9wgmlybovNvH9U19iKk/ie+C5ytfPLcMAYqFg
	oAiRTw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2u4242b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 08:08:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d98b5a68fso1347628a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 01:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781251707; x=1781856507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DWYvrVR9u8QpN8NdHDBscoTKQgzIdztsQdgF9fhW5bQ=;
        b=OUkugKBcDv9MIDob7X6LZTXBKISXHoVnNdyOUlRgQYJbuvZflkMx1rO4HgmXYSGWPu
         04Vc8VxjryJuIOBY7bJt3yrFaTvDZwkdwPYPEMGH6Hud0JLGhaLVds5w4c4A60FK60uK
         WFp31gNjWbjYMKBJKx3OO1yiiOfH4oHbdb4kbiXo8Wisk4uoYDpUJnj6e8qBIUOv57Di
         /jz9xdX+q7FHuszqDgN/3J4Sq7x2ivWuXRjNqlLSqQYh4IRhfx7h0arHn6DTJLqfo+dC
         53i5lcOt/37pm4CZ7/jSDLn17VTosC0kxpLAdSK2W41lCJnMgOraS7fwrEQHnFuLUS/o
         Czdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781251707; x=1781856507;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DWYvrVR9u8QpN8NdHDBscoTKQgzIdztsQdgF9fhW5bQ=;
        b=AdGaRZIUUA6xXGP7L5uGQzPtcAI8lrBj/xthOqsLDe4c5W48BY9kcFSK4D3Q1HRXbT
         rATQsw9sbuC+dHxYKiEOK7kpXK3EaqsfonQFMkjn3tHU3lt11OfRhVwB3ipoQOLZp2py
         kajFZYEdVKjD+mBiO84o8STAW29tqaWC3jszLLvMwJXqderNkwLURvIcPA8+FFzFUAf1
         avL4ZqG8ilI6tfpl4tMKz/pvSJjBiH0b/MGWxTCHk5/qB90+9PbIZ3MemMYF9v97Bq2W
         RY2b/tmj5DX434Szt0xhGG5/IER/qm128BBoX2/AXPo8FWxdMhYorkmCZ6O5VlzuR8cz
         167w==
X-Forwarded-Encrypted: i=1; AFNElJ8xP5X1cjptPhNiYVFvQ+t+HimeEybFW22yG0wyRXbj7u033Z0vL9OBU4RnxeXVYGEDmPX7xvuZZDKP6WR1@vger.kernel.org
X-Gm-Message-State: AOJu0YzRlPyiVNgzcnM6GiFLKzaI0tMxktfiCDXzsMr+Gbhph7z+oN5G
	1YH74toyTObiFTToo0hWobhQXiIhnza5weQcGC026Nq0r8sEfQysdR+s2qmyOGxFmxbGycidRyJ
	4Gv9vCnJEAEszBdZ07ZLM9xuV2jOWYt47r2UENYTMZHmqXjxuhgQ7sztsRKfEZTI8qYnB
X-Gm-Gg: Acq92OHbjru2WI23q7A+if/zYhGkKxneD1LmeisMfU8gkAF7l+lbwS1izRH2PK7V4De
	cO8zEWAREg8cWP9OBHF/MhpFGYJwtDYPQxN/otR6/qMx308A8i8uWYtEnRnuVa68PbfttMYAOnN
	acUiUQXfQXCdvp3k0xTJ8M64YvC5Smx1VnFVxbZg0v9WJVzW1vxfKSg4ZP4UWeqMMDqNXosmy24
	ttcVJQWRKs17sdMnOEpy43EX8Ty5YMB7lS+72EcTatKzMdzxJsVwv7Gd+xEuwru3TLfUSSsox3z
	iOZgM9PPlhO/XYC9bebHx37iIYYsbsa8g7DfuOJ73enJLXDqf+HvNcztTyZPl1xvu4Y2vA7WxC4
	qMdy5Qu2wlSC5A4xS43/3tsiFSyeMcKtYKLqh6vG7Wyi9O4WUDlc1OOfoPsFCFBk=
X-Received: by 2002:a17:90b:2c84:b0:36d:7a76:827b with SMTP id 98e67ed59e1d1-37a038e1996mr1933134a91.14.1781251706672;
        Fri, 12 Jun 2026 01:08:26 -0700 (PDT)
X-Received: by 2002:a17:90b:2c84:b0:36d:7a76:827b with SMTP id 98e67ed59e1d1-37a038e1996mr1933110a91.14.1781251706192;
        Fri, 12 Jun 2026 01:08:26 -0700 (PDT)
Received: from [192.168.1.8] ([122.164.81.0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1f07bbfdsm1578146a91.5.2026.06.12.01.08.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 01:08:25 -0700 (PDT)
Message-ID: <cb1c557b-c411-4102-ab1f-38fec91d7677@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 13:38:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add support for the QMP PCIe PHYs in Qualcomm IPQ9650
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260602-ipq9650_pcie_phy-v1-0-d8c32a36dbd9@oss.qualcomm.com>
 <aiqYtowP2DQt7Jw0@vaman>
 <8a0e9314-0c97-48c8-be95-986c7e6fe641@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8a0e9314-0c97-48c8-be95-986c7e6fe641@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZZhHL_fsZCAFdJhJCB6VYRoR0_uoTbcK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA3MiBTYWx0ZWRfXwYfpoK9oP9Pe
 eBmwPPr3xmNK5Ph6MkAK5cWZmhb7nGbtseb0BUzDO2vZ5C5QxCjG6Ol5YAm9MLOoSdZ9YY7mgVZ
 rsB2+c/+8vAPfrburR9OHscGwaB/6PQ=
X-Proofpoint-ORIG-GUID: ZZhHL_fsZCAFdJhJCB6VYRoR0_uoTbcK
X-Authority-Analysis: v=2.4 cv=N94Z0W9B c=1 sm=1 tr=0 ts=6a2bbe7b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=DVNErGSwdtF8OHn2hLoakQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mUgSyTONyoZcvpXPCScA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA3MiBTYWx0ZWRfX/40RrDWmSivT
 LHIC0phMmY78CzDcU1G3LEZkIABpTKhbewLRvnIqzF+kv/6ZEaoKj7qgzFobXMI4YMZFq/dUVn5
 6Ql9OX4HrD8Zmv7wQfcrgdcYHJh5f0459VQK5AqHO9/tzAAs91/TS94fg2pG+IfB2wnhe457Tjc
 moWQUAsIP6cZXMlJAcXJcvUr6TOKQFA7n/0axbbEVyLQnMSZjCR1zLBnd0RfJGyXrCjXb0MqFhq
 4HI5umk5NVUWXpsNdMFErnnIaVzqLM7DXydFcbWkTp1wQUbr2o1Z8Tn0lxFbrj+DqZHZPqJZpWT
 nGc5swMmLCjCRdBN0tYPclLlh/1pTXlEh/8gbVeF4FWa4+W0WHRtTytEHwl7nIsQTGuXdYforAB
 xmveUP7lSSgNfEegKyCdyqbVuUzRBkruVZ28nVxS08Hk83wxBI2gwpoLhDKnR86/DWKTq9/ANUf
 R1FJE0LqNj1neaypOgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120072
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112887-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF436677A71


On 6/11/2026 9:52 PM, Kathiravan Thirumoorthy wrote:
>
> On 6/11/2026 4:45 PM, Vinod Koul wrote:
>> On 02-06-26, 14:40, Kathiravan Thirumoorthy wrote:
>>> Qualcomm's IPQ9650 SoC has 3 Gen3 dual lane and 2 Gen3 single lane
>>> controllers with the QMP PHYs. Unlike the PHYs in the other IPQ SoC,
>>> refgen supply is needed to bringup the PHYs. Both single and dual lane
>>> shares the same HW init sequence. So reuse the tables.
>>>
>>> Document the compatible along with refgen supply and add the phy driver
>>> support for it.
>> Please rebase this on phy-next tomorrow. It does not apply for me due to
>> changes applied ealier today
>
> There is a discussion open about the supplies[1]. Once that is 
> clarified, let me re spin. So we can take up this series for v7.3 once 
> that discussion is closed.
>
> [1] 
> https://lore.kernel.org/linux-arm-msm/aiqYtowP2DQt7Jw0@vaman/T/#m37a571fac0c77fd00f6379ad9a2414b60431820b 
>

Discussion is concluded and I have sent the V2[1] on top of phy-next 
(2ace2e949979 ("phy: rockchip: inno-usb2: Add missing clkout_ctl_phy 
kerneldoc")). Please take a look at it.

[1] 
https://lore.kernel.org/linux-arm-msm/20260612-ipq9650_pcie_phy-v2-0-b938cc2fc267@qti.qualcomm.com/#t


