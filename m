Return-Path: <linux-arm-msm+bounces-114138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /F9KO2lVOmpU6QcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:44:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 878416B5E3F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:44:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="YB/8UGmo";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DchT3qzt;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114138-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114138-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFB623062C31
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 09:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E703CF21A;
	Tue, 23 Jun 2026 09:42:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065483C73C9
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:42:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782207765; cv=none; b=FH3e8WChImImm4BTJwPr1s+DA3PcvmBedKpf49Y58e75iAbqHs617wbbQES7LIVFop9p6/DwQZ+iarrAxdSdSGKTmfL08ZJ3J8De+pj+kZ3J7/HYEsCSEupeXxfGhPOoRQ9Rwb4a+3nh1WlD8ffBgbl9ovFAQptUSQoDY5f7P94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782207765; c=relaxed/simple;
	bh=2zt4mDfQLCcN7VZdwKtxZoDHgil7aJyHwJKdbeBKs4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uo/6dBP2xthUR2BVQM0TomWmWeLApca7nDvVpGp+ZQG9yaeCgGu1CnCqG+IM7mWFSs3Y0n2GqbF6vlf5+HkTiGxE4wHx9CiwfImYzUmSUu85C+xSV20EF0Btd6UvsrLP+qpqJKs7hkfhBa7CYlwu0/TuT77ElyT3S3PbyNJ0s9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YB/8UGmo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DchT3qzt; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N7ko633228464
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gso4/eCWqTGK9+zw2V2gKqpch+D4ZfB1l0eAVrB6LD8=; b=YB/8UGmo765MuLo0
	dXdHA69ayE7MXPDuMXJO5te4qaOteA0rpPktiMkss4WuOYCOqi2vivLey+r3TRaf
	2jQVDKIeOZxKis0Z1Lm8QyUyb2j4zRT/fZF/8fX4Yvb+vJsGDtwjmsk/94nqqPuA
	RkmrafsyDgYqPaiFZLco1hdHb6ac6cjZ6CON6aO2OcrrHaKAsGWr7rzdp/wlGlxY
	ZkRRJCAKnzu0GMf+NQ+8WpAy0ezSv40+rCA7wrD+CQLpyCa7/pfGWpAeXCuhB4/w
	HoK8j24/Dg7iZn9ddvMBgHF2CxJGQnxmfguyb6lBLHtblo6MPf9V/TM1N8nWCOhi
	QqXxQA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp29gg1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:42:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c6a9bbcc53so56558735ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 02:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782207763; x=1782812563; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gso4/eCWqTGK9+zw2V2gKqpch+D4ZfB1l0eAVrB6LD8=;
        b=DchT3qztJF+AEjzIeTnmKTMvlbgQoQakpBFToLIWgTegvCzSKPD6DHpN3oQfaDXA+b
         kMGnbvF7rOIVvNbTCD2JAPi7aN/nBfX4LoDx9tHgDI0q+zraLv1E7EtKMcx+4ogWZXHy
         uigm7lQqVRZ8FJEpY4AuboNza2NuZxVpKGFqpLRAGzx1yVe2oaqCofJk2o3RlIFV5eo0
         GgsYg8jQfdizqNT7kukHixE/aoxIarQJbnCdfe69ZKQY0mvPfmv2ikR+wiH0UwvIvGSp
         dBm5GIgr39iYu9czOpdFF34iVtPk6Bvq/QhQynnxzz0xzGHsF53wS/rSEovNaqP1W1Ok
         awjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782207763; x=1782812563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gso4/eCWqTGK9+zw2V2gKqpch+D4ZfB1l0eAVrB6LD8=;
        b=VJrlzF9D4xv3Ups/nlEijmkC4lYQmo74Veoa986gBLFpIxo0QZPqSlgXS3eKbJAZZq
         csX7JkwRhACRrdqyLFi4JUhRzW61L/7mxb5s6RPmG1BQlmfI1KE8s3UiW+SEx8Z6aykg
         EW5gl1QBFahPVRkcyBEKxy8CHOALotZc1h8INaP4GugqxTUt30hIWG42iB5W58MbSM+0
         3uuXtYW396gOmhT2UAp4IEDtTYK3IKdrzRYlHVI7etjUIj0dHbd/BTcVtj7HcINIASg5
         7h9HHuWaEdkKSwz5ft9Pnc3DUj0/a0v9qfyD8aBEdtzhKP6reiDdz3Sx1SAnYLUDRZqC
         Vp0g==
X-Forwarded-Encrypted: i=1; AHgh+Rr3pEC0DgLCvy4RTYFU7A2OF4AM53O/MyqDif5Tuu+g9F0eDqWPadjL1v2Kda7LiawfsWg8Yv1scnVAqqLT@vger.kernel.org
X-Gm-Message-State: AOJu0YyEPBgsJ9tyatIb6mvfe+YAGnk4dX8GqyRg7JKX6Xxom8FVqj7g
	PI53HI0NXjFoe4b4MR0Tnr6jOjEBXk7YP0aKzNqf3Y9aLgBxTLW0mifnl/p2NchXA1rJZJ7y+F1
	woS3xA7tJq2XIa1bCB3z9wCEFaTTEy3v3Up5al7HEcXqrG4BZJNVI+xC5yK573hKkrK1v
X-Gm-Gg: AfdE7ckaVfeOkggRXAKA3YkHGmmeGzWkUUEVdTy7+06DQoHAJt18hCv4ShDTTCwBkJc
	IE8pTNJzNbgtVxkmFmEXMGd4co7NfiTe6Yi/uHrAs91Lu6/WmsgENUC50zyVMP7NO6cBahlV+6y
	AqwF0BdKIRc8te7Yw7RMXJTck/TgwQfL+pbFY5WQOLPkP0Xbwg1HfV1RZKmi2IX1sgQE0qryfmp
	7RWHu8pXeYFHfWZS/cxAKjLkr7+ybUUUqpXuUzq1ki8/xRz85DyhnAr8rPKZVeZDza183nAUUno
	XVQDv8/yuEz2amUkbBTXfUYmxYghIb6bIoIErFC9kvxBr1ily1aA18FxGmsShNlhS5rBq3ATCTD
	8OaIWfA2pFKPH78LV7Lh4AYUE2QoJxTWyuKSD22EChq+08GRsV3TXzmrXMpEbCsD7oVXkODYKS3
	Pc
X-Received: by 2002:a17:903:2ec7:b0:2c0:3400:5c34 with SMTP id d9443c01a7336-2c718c879fbmr191507965ad.3.1782207762712;
        Tue, 23 Jun 2026 02:42:42 -0700 (PDT)
X-Received: by 2002:a17:903:2ec7:b0:2c0:3400:5c34 with SMTP id d9443c01a7336-2c718c879fbmr191507745ad.3.1782207762274;
        Tue, 23 Jun 2026 02:42:42 -0700 (PDT)
Received: from [10.133.33.169] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c743bfe8aasm97603725ad.68.2026.06.23.02.42.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 02:42:41 -0700 (PDT)
Message-ID: <8b0560ae-af5c-4d54-be02-d186be1d799c@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 17:42:34 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: ethernet: qualcomm: ppe: Demote from supported
 and fix maintainer addresses
To: Andrew Lunn <andrew@lunn.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org
References: <20260623073307.36483-2-krzysztof.kozlowski@oss.qualcomm.com>
 <0247dfba-1c14-4fea-aab3-5489a36f35f6@lunn.ch>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <0247dfba-1c14-4fea-aab3-5489a36f35f6@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LdAMLDfi c=1 sm=1 tr=0 ts=6a3a5513 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=HzQU9uYTMzTt3pVePtwA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: T7UlV4KRwgeISPIpylAsGwOAkIpmgUx6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3OCBTYWx0ZWRfXxr0h+eR1zSGp
 CjknD3+aB6N6AIc8ox1IWso6mAiv8OO9Kzm9ZQsLrarw/ITJvH1QlNKC9BbdlH+sdqiL4WdwtBV
 rNUd1KgidS4JQ35R8vdC4++Q0TOtsWc=
X-Proofpoint-ORIG-GUID: T7UlV4KRwgeISPIpylAsGwOAkIpmgUx6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3OCBTYWx0ZWRfX+0XPiTZsz6x5
 bfhpJDLvcwVaH+wrF8LtXhx5It6BEIRZqNlFQPI7b61q9YNL5RoM2lRh+UM2Sd4FHKMQZrz9sXH
 dcso7xuJZ7erGtsfCwH8jH6MBZLlduJ5OsX48TNrx7/oYultlc2wKXznTMaJbaNdjNfaK29PqR4
 zmDBfSbI4ldfVwjt6Vrn6sktKNJ/7HB978rivAOJhphcQEMRx8pcBt8G/IR56F3gEG0yCSGf/Og
 eMKJHVJhTSPRDFY4wJL2AhKQJz0o/tA70nIZgTmG21OLsOlxTVPTm3/OWUDf6gLB4YsvM7cT3HQ
 jYIzrdmsYh5gFFeque0P1z3T9br17MtAcN+jyhJONWUBXOpdZ4AnhIMMfrfDitiUTtNNZ7Yo3/3
 nB3ycZ0A1+lxS+/vfMfC/12EW0Lutbfricpgkjc8C1eydTtuQJsiIaWyTbaex2BmNz2lZI2UkNu
 dhN1bhhqFLIdGKmdBwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230078
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114138-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[jie.luo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:quic_leiwei@quicinc.com,m:quic_suruchia@quicinc.com,m:quic_pavir@quicinc.com,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:netdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.luo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 878416B5E3F



On 6/23/2026 4:10 PM, Andrew Lunn wrote:
>> Driver is not supported - in terms of how netdev understands supported
>> commitment - if maintainer does not care to receive the patches for its
>> code, so demote it to "maintained" to reflect true status.
> 
> Maybe "Orphan" would be better, if the listed Maintainer is not doing
> any Maintainer work?
> 
> 	   Andrew	   

Hello Andrew, Krzysztof,
I will continue to maintain the listed drivers, so their status can
remain Supported.

