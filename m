Return-Path: <linux-arm-msm+bounces-115684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DTwGC174RGoX4QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:22:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 641956ECBF6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:22:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gwxZyeyl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IXQZDHdW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115684-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115684-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79443308CE47
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 11:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 531D3466B4C;
	Wed,  1 Jul 2026 11:19:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE84646AECF
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 11:19:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782904775; cv=none; b=u9Nb1dOXU4grHMY2L8MuyQMxz9Xhl+p47neWCYysrWyWm58y1T5+znPUSamqy0RoPAUCI7dDQRCyx3b2aMc69WWlbZTPokufKpKNYNmjAj1xxnp5g3A8JZgybfbwlR6SLup6oC3e55SG1wNHKPDFihMcWt3y7MzVh/AbnkxOYbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782904775; c=relaxed/simple;
	bh=Ua0ef1yufrvAgyuq1JcYRzLNA3rEellk2uJBPX5w7XI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TtjLGBogKp51V+LTRr8k4h4oAesHqubzpp/nlwAS/ehMJ4D2kPu8tWXGp/K4DWHor+8m3Tu4DoVJFUFb3c+2lX1/RvTL68EuMaiLrwYx808XhFM++5gKcA74thKtYAXurFBWi6aJbJsLnIU5N3Ooz+P96mWcEJtYvXpgYxGrMWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gwxZyeyl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IXQZDHdW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8Usi643999
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 11:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	URtox8zEzP/untTK+3HtClYPfjcDlUxDwjjp/zQVHfE=; b=gwxZyeylLOdVJC5D
	nuiZH2uaPci7Kc/y5/kYSdu7RKfA7lOmveWJy1VW4oLWcuH5fgjB1NchLw0Ke0dB
	UTygydJC/Obd+YoZgeo7oAUK8CXqIFKcX/nwHed63IOvth5hm1ULhYCZe82PI5BZ
	RlRRg5A//oin8Om9NSrqlkktK7tKPHQLLLKipvVr3iYaXvt6uAtRMLVGRPINW8fk
	pBCYjpq/e/ILwtMuiDELUSRDXVl0dBy4raERAUgi8GDprDV+Hvmv7CyPETGSejji
	0A8KVrbPAPM7jw/ECj54GWkVvVpLsbR6U2kaDO/345lDmguhzCoiTY5cEcdMXOzn
	t/WJSA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hbd4gsw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 11:19:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e57e56ce9so6092785a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 04:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782904772; x=1783509572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=URtox8zEzP/untTK+3HtClYPfjcDlUxDwjjp/zQVHfE=;
        b=IXQZDHdWWTas8L/k0iV2V4Bj6gU+wziQ0NUJvzzmSwzSiZ6AfVTAFXJ0HDeJG4F93z
         gNh6+dEjVQKHMmLRK+e2958LKGgvE9VsUx1szpJN+cuKcutjuwnl5ZR0fM7EAyQBat8Y
         4CuKjD4YLtxz4qn2KKQf5duYldumaza5AJ0t1zGzBqLkCnj0peo1ZiZ1irYFxmdYvM0s
         HEbJxBt94JgbgQ/3XBFkR1Ej7NyKRqemG3Uuw90sPFA9tilVRnJDeLIf6DiNwVtuEFrZ
         PsiG+dYVN278uTNp4FlJ2JZKY+J9JltUTkNY1UOLLZHGq8g1TRXQti47QOJbYi9ovV0P
         VvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782904772; x=1783509572;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=URtox8zEzP/untTK+3HtClYPfjcDlUxDwjjp/zQVHfE=;
        b=Z+uyitoXyK4j8hh5slbWMNrUsznhx+Z2xWNIggT6Ku+J4PkkZY5yyaEQSCiOmREy44
         XjSupkrjbKCUAwI2frBhcILe8NeaJlQqNqyadFyhMlY43hV3Jmm/fyHUmbmT3YHFkoV9
         m6fxj2EdH21BaZjoyuD1BAbkYvjfJg64OcLU2W8qBzLElBXHTpR+h9ozeOeHSPC7qkFo
         JQF+M5gixP54LHIas65rh34M0dP02tHa3kOaidGpbxy2yrFNhVXq6mFgLMk+aVKrlcAj
         g9XKurGGImRgmuFcioJQyr7gbf5ElZ5skBF2yRgOpVfBxg8LzA6FIO9c6wM36//a9MT+
         4HOQ==
X-Forwarded-Encrypted: i=1; AFNElJ8EBLu8SyHLr0ha2Suvec6KNePIUsYC+9evMZw0Y82gKsFp0lvT++tv9ka++KV5+1vqq6gtzWQMuStKwODe@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk64+1P7YPI4bnuKZWbKAfibSPVGGhkBa3PIEQJwhpqhaDPZeA
	lltbq8f/d8V9kKEdxLK0cKNogi+n+tmBWttONObcNYgd7+ASxSL6OqhwJE4VsprroWVvguvn9WZ
	zR+sesT4+ibazzbUKPshRVtBUdmtbN2t/fGsa6bbKhSa5nr/UKo9tR7IejFezw4VNnCR3
X-Gm-Gg: AfdE7cnBaVxtTCNQ+36MjQ5LRmOSVbkuI+gxu/TQBIvWHwqWvSG6t8dJMBvf8kx+FjL
	vFMQt3Ja++cMeIj3dwrYC2qcfpabKZ1+QumvP/ryCOIchkuome0AGNyFOTzLd2ebrfCu3m5e/B7
	Go6IntcAI8imi1Z6wp/hcyzH9qYy/N/v8k6W7zsRi/619fFiWxQ2f5KVgl6CYi6JdWbuiclLbdp
	V6/Xh6rURUvhll9DDhy8Sbrx0dQui+IhHGD9Iz0iz/ateMb4lunzeKG7xzKqq5/a8ji/nNRyb/s
	ceR0H1VYQBzrUMWFsiSiGLobOh3XZgtqcri5fuH177OEtjlp3VaQTjWMJVnl9CZT3LJxUywogd3
	PA7X3Kkg83X0kvKCc/43OIc2+Fl0MKA10zTo=
X-Received: by 2002:a05:622a:14d1:b0:51a:8c9b:6494 with SMTP id d75a77b69052e-51c26b42202mr8376111cf.11.1782904772051;
        Wed, 01 Jul 2026 04:19:32 -0700 (PDT)
X-Received: by 2002:a05:622a:14d1:b0:51a:8c9b:6494 with SMTP id d75a77b69052e-51c26b42202mr8375671cf.11.1782904771316;
        Wed, 01 Jul 2026 04:19:31 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d6b068sm261505466b.25.2026.07.01.04.19.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 04:19:30 -0700 (PDT)
Message-ID: <597fac9c-8522-449a-891c-2935382c0cd6@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 13:19:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] Bluetooth: Introduce Qualcomm IPQ5018 IPC based
 HCI driver
To: george.moussalem@outlook.com, Jens Axboe <axboe@kernel.dk>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Saravana Kannan
 <saravanak@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King
 <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260629-ipq5018-bluetooth-v2-0-02770f03b6bb@outlook.com>
 <20260629-ipq5018-bluetooth-v2-4-02770f03b6bb@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629-ipq5018-bluetooth-v2-4-02770f03b6bb@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExOSBTYWx0ZWRfXx8vozrPs8mXS
 eut0xB4moH6imk/kaXJ4XBUJkziDq0VCNht9K098uVKEoP7RdcmS08ir7Epj9oi0AxDjuj2fPVP
 jrzyvMnbHQ4sOrwsE10mK3xlUcEpg04=
X-Authority-Analysis: v=2.4 cv=MpJiLWae c=1 sm=1 tr=0 ts=6a44f7c5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=UqCG9HQmAAAA:8 a=ZNUA0hKuP8YIc2uBTmcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: NCBa6jFQNCVv_ynns47BYFKSKzjfbW6J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExOSBTYWx0ZWRfXxicyxzJk3Iy/
 XcKtMZz+wgCgVk/9J5iswD4IksvB5PSkgv6583oedQF2hEHn+9k5MWovnAYxM6b1GAwS7Z6Bzp5
 fC7PJItpCdxBt5KII+ngKqTTvc58vxBK1+2uPIvM0yUirV3f53JK42knxty2vfdRtT5aBAj6kBy
 9UBz5e9KZKRuJmF0Jx19K+wclTM8XCPEw1NnxssUWnOaCcYSpZwl5pCJXnpvXwqzbjqgdWzWhB0
 whgTXa+QpNdISuCrqmIo+3/XEePQDxMO23+aQJRQ3azpzsNgY8RBuRwfL09zhJjC/bSBeb0K2/5
 wygbmPQunh7pW/lbpEBz4CucmfKh6o8XlMQZz9Wq8UZUzQEvOVdlf8XWZkhQu50QTnFizG6NDLa
 KUbtbFb5jDUu4TNAiRZZGympBpaYUgAzXVGfgwSgqzjo9H4hn4w6PZRk2uPS9NmygY5Svtbz/IE
 a+ofdiuSrAiOfcfBXMA==
X-Proofpoint-GUID: NCBa6jFQNCVv_ynns47BYFKSKzjfbW6J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010119
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-115684-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[outlook.com,kernel.dk,kernel.org,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,lunn.ch,armlinux.org.uk,davemloft.net,google.com,redhat.com,linaro.org,pengutronix.de];
	FORGED_RECIPIENTS(0.00)[m:george.moussalem@outlook.com,m:axboe@kernel.dk,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:johannes@sipsolutions.net,m:jjohnson@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:saravanak@kernel.org,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:p.zabel@pengutronix.de,m:linux-block@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath10k@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,outlook.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 641956ECBF6

On 6/29/26 3:01 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add support for the Bluetooth controller found in the IPQ5018 SoC.
> This driver implements firmware loading and the transport layer between
> the HCI core and the Bluetooth controller.
> 
> The firmware is loaded by the host into the dedicated reserved memory
> carveout and authenticated by TrustZone. A Secure Channel Manager (SCM)
> call safely brings the peripheral core out of reset.
> 
> A shared memory ring buffer topology handles runtime data frame
> transport between the host APSS and the controller.
> 
> An outgoing APCS IPC bit and an incoming GIC interrupt handle host/guest
> signaling.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

[...]

> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/elf.h>
> +#include <linux/firmware.h>
> +#include <linux/firmware/qcom/qcom_scm.h>
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include <linux/skbuff.h>
> +#include <linux/slab.h>
> +#include <linux/soc/qcom/mdt_loader.h>
> +#include <linux/types.h>
> +#include <linux/workqueue.h>

I don't know for sure, but the amount of the includes suggests some may
be unnecessary

[...]

> +static void btqcomipc_update_stats(struct hci_dev *hdev, struct sk_buff *skb);

I don't think the forward-declaration is necessary


> +static struct ring_buffer_info *btss_get_tx_rbuf(struct qcom_btss *desc,
> +						 bool *is_sbuf_full)
> +{
> +	u8 idx;
> +	struct ring_buffer_info *rinfo;
> +
> +	for (rinfo = &(desc->tx_ctxt->sring_buf_info);	rinfo != NULL;
> +		rinfo = (struct ring_buffer_info *)(uintptr_t)(rinfo->next)) {
> +		idx = (rinfo->widx + 1) % (desc->tx_ctxt->smsg_buf_cnt);

That's one complex for-loop! Maybe move the assignments into the loop body

[...]

> +	/* Account for HCI packet type as it's not included in the skb payload */
> +	len = (skb) ? skb->len + 1 : 0;

Unnecessary parentheses, also in some other places

> +	memset(&aux_ptr, 0, sizeof(struct ipc_aux_ptr));

You can do aux_ptr = { } at declaration

Konrad

