Return-Path: <linux-arm-msm+bounces-113440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w4SsAV1cMWpIiAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 16:23:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BAF6906F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 16:23:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QAM1kyVT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cUsvkNr8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113440-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113440-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D95DA319218B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1D85369211;
	Tue, 16 Jun 2026 14:14:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5BD3655C0
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 14:14:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781619287; cv=none; b=bHHKWqDudDYi531LZtkF+cz5SS/4AhL6y5USoJpvtL+KXaOSOvBDmZVnWcbhNaiF6a3qOekbVNFcPOs9q122L9q3yZqSHxWnmBc9GrxLWNMAXsQ9HCzzZXKH+36rbEiZIaotq0EoiTGx4FHMCaOnRyvHiOqdS2l598bQk7VN9uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781619287; c=relaxed/simple;
	bh=irl8QxA5C9eS4raapfmrswfr3OhWo1FcTIzj3kwcHHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sqjiY0kahviRvLsPdjvu7NtvzvqZ818duGJcD83JG98sao1eNmQJbiB/cgWWmTmaUlvt0XBtiZGHtFt3p5DF8YNf26Jt7yV/3xnNDjVm+RujFACinzuAnpCNRH5lAx6jzKBARFRwRUml+NV8727sBxx/bUX00StDIEC5Kf0W4F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QAM1kyVT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cUsvkNr8; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GDxWbT1934631
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 14:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0hAx854ISARB3ER/A8NJSDIfIV15g1Oji8K44z4BCu0=; b=QAM1kyVTARUAiUx1
	HwN+Rt6ZPoLOrdawDoHFv7Fqdc32iTUYp39m0XzMLGHkpcqd0xkq3fZgHcaemSmN
	ANGPium+D5z1xual38fwaYY0vF/sHhoJ6Qglc3O7zImBcQbIu6aPNpiFueoVY7Wk
	OhvRw2QYbY6ukTECrhwTWbCr+mxQjrvSgMWy9VEz44c4mV8SVxkLqacih9//O6nh
	GDzAvqhArXNn/Sg28e/MY+SsHZ0p2+409jVroHjrIULgFyj+hZFtPLzQY3RkPkRL
	sO9NSscH/uSIWI3FrcEPfDskndnhaRb5hwOjaUv+7ogTIeycvXbhZwIvFzaQBNQr
	N/5jHA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu3ct1cdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 14:14:46 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c4b898e8d8so220943137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 07:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781619285; x=1782224085; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0hAx854ISARB3ER/A8NJSDIfIV15g1Oji8K44z4BCu0=;
        b=cUsvkNr8aM7a+6Sca1olvc/J3uuAVC42YaKvMrAm5oPJ53s2paflvxyf9AAZha1zOe
         7fWLGUAxvatzyDgoJ9jM1aFCE9RpJl3JYPJoTKUwRmINMdtpmzTRUSYsyJO+GmWkqiOm
         zyOlOcA9095VwaWT9TBAK4pnXUHJGyyB5lhb8cp1GA7VX6szrakJdOMxmchvJ/kpLy41
         2Phm5+aS7k9H3FRRKqVk2tYaC/dJ3foPTKPdGdYtDFLvJb4aaCOi0FjXMDKKamCHfMqB
         A9nOPnagJu4PTMqdS00qkzRPdJNhtsBFdgvEHYGXeOahS8ogRXr91waJPUhRoMkMlu22
         bT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781619285; x=1782224085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0hAx854ISARB3ER/A8NJSDIfIV15g1Oji8K44z4BCu0=;
        b=aPALr5p3CsHsYCyvEOGZ+VmUQ943pv0SjTOuT/lk8aE/Zs4M/mJG+wJ5ro+F37JX/G
         zTCu8pakFXAhAgIO7EnHr8ol++1wk2Z/PizERGruEYtibo6xFX080LQbSr4YXWPet4Fr
         y/MNun2RJ8kANsB35IrPG8pSpmVtGPqvNoBWHQrzUKg6qkZzUASHGzT4sZSkZKEnrBPS
         /IKUuWXKW5u/lL8iA2hkL6yASYLeg4YjnGVkDJEtzm51CROXLtWQcyRDoq5++gfJ3FkC
         +QicfAifj/c5m/UZSe49U8UDWYgeeLQFRaxf8g65ddczN1+tY9nzxprgWMURdwVnNPXk
         YOpg==
X-Forwarded-Encrypted: i=1; AFNElJ/C6v4b416/EPQmLzJBO53YXX6OcbcMb8SpYPlLt+0mTIWHN7ARKtl22Kn4riTWiNhNnLpQpkHN9abgRB5N@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmbrtx2yEhOHORHLnGPWH6TX0Dtaw8Y4QeoptGp0RoE21QoIOA
	3MbnntFTqbpi/5/IbHQqnDmhEfrfpEeNVoWIt4NlyRal/3Baq1OGmDVz4xN7UZSg7ts86AaVtWJ
	W+JZI8FrjdXmIp7PkhKOn9xDd52dmGuV6ALALP53kaZsfZ12rYLmVcrSouBgxvR5THb8h
X-Gm-Gg: Acq92OHpHwlwzYIn6/TWmjyOleiXQkPEh8tRE5+sx41i1LZgLDZFUR3XaGbgvbyUwRp
	WPoOd2f9BHZ4lIFxXCu4MV+tEAPAZSiR1FUpaEGGGQX/OPl6NbL/4MJDMSG3sl1bk6TUPiP1ncm
	3fcv37+hgrYyPEQsN6MtPubk+fjYv++3BIyYOaBpPpB7h4yiDRXc9gzUedSMfoOuVxr9j57meU3
	IsyObyL4nPJp7NR4tJSdjJUeoC9iBSbPkSfiNuPezH11PN8wlRl3VCfgyfaNzSgBlT3Km5paaQ3
	hHcu4I76qHNvaU97zAwLOkK64bd8mo3eTwBuh4y2D/55SADMrmFHtgxdXvlN5UmcDtomDYqJL2e
	BXe/PwO6zBlUWcQV9TOLhoXrDY4oFHsnIWw7EvO2zxXrOjQ==
X-Received: by 2002:a05:6102:510b:b0:631:4d32:a86 with SMTP id ada2fe7eead31-71e88e3f21emr2770739137.7.1781619285176;
        Tue, 16 Jun 2026 07:14:45 -0700 (PDT)
X-Received: by 2002:a05:6102:510b:b0:631:4d32:a86 with SMTP id ada2fe7eead31-71e88e3f21emr2770699137.7.1781619284575;
        Tue, 16 Jun 2026 07:14:44 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6d8c2sm638601966b.38.2026.06.16.07.14.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 07:14:43 -0700 (PDT)
Message-ID: <50f7eb11-7bac-4d45-9e0a-b209f7e8e9f6@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 16:14:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/9] net: stmmac: qcom-ethqos: fix RGMII_ID mode to
 use DLL bypass
To: Andrew Lunn <andrew@lunn.ch>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Eric Chanudet <echanude@redhat.com>,
        Lucas Karpinski <lkarpins@redhat.com>,
        Andrew Halaney <ahalaney@redhat.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-3-f0f4a1d19929@oss.qualcomm.com>
 <42355330-c22a-4fce-98ab-dc22b321ff16@lunn.ch>
 <ai93X/cNWHtEQsDt@oss.qualcomm.com>
 <82705420-771d-41bf-a4d9-ed94dff86ff0@lunn.ch>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <82705420-771d-41bf-a4d9-ed94dff86ff0@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=6a315a56 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=RaRby332RutXx2QLMF0A:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: jqiAOY2mG0jpegw87umUCx3BuholG3yx
X-Proofpoint-ORIG-GUID: jqiAOY2mG0jpegw87umUCx3BuholG3yx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE0NSBTYWx0ZWRfXw5Obiju7GhFz
 tx+Cu/Psk26TBAMzhEcjdtQKrgmUDjXNObHpH81t/ODYc1CQWBWLu7NM+6qHTxxjDeSNBy1aPxE
 3aGXliKwAycWgxSe6/vxogyARQp2qCYYKTP1gkF2gZYjSnPT1Aal4NUxH7bczStKjDUCMiDNL+u
 mvm2dvDnokKAnMLKk+W7DF4YVjRor5yBzOi1FxuSPE5MILbslPg/j770bWquUbbNtRFgBunfjRy
 A0VoqyLHJ8pIWXop3FZBD7EB+JLPOPJb66JSx1dAGnAluVob150jh2kC0Wiu71a0QGytzvHsXXr
 Rxh5fzc8RYsvy6FvZd6fptE1m3KA9Jk3AVyp1KVr1/bdxd69lJU3a8m/zvGwkRxp/U6yragK/rL
 58V1tV7siryxXZnAAL7oYNcrTsycXZwnVY8U1FxLag9J+hxghZJADVgzeqCg/ubAkCaQ7PyTGA5
 MQ4yPi2sa98TdG4rYEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE0NSBTYWx0ZWRfX/xRL0N4wuZPB
 2wbvscKqJjlhNQAsNeaOEmAl1SykJtKddI9NALxf27/BxmWDXCX1L+dXxDtC7TAj6knBFTzPVuk
 49cNV+KpFIaOYSyyiyKX0BVHhoznxSQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160145
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	TAGGED_FROM(0.00)[bounces-113440-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:mohd.anwar@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:echanude@redhat.com,m:lkarpins@redhat.com,m:ahalaney@redhat.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux@armlinux.org.uk,m:linux-arm-msm@vger.kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,armlinux.org.uk,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 51BAF6906F7

On 6/15/26 6:48 PM, Andrew Lunn wrote:
> On Mon, Jun 15, 2026 at 09:24:07AM +0530, Mohd Ayaan Anwar wrote:
>> Hello Andrew,
>> On Thu, Jun 11, 2026 at 10:54:37PM +0200, Andrew Lunn wrote:
>>> On Fri, Jun 12, 2026 at 12:06:59AM +0530, Mohd Ayaan Anwar wrote:
>>>> When "rgmii-id" is selected the PHY supplies both TX and RX delays, so
>>>> the MAC must not add its own.  The driver currently falls through to the
>>>> generic DLL initialisation path which programs it to add a delay.
>>>>
>>>> Power down the DLL and set DDR bypass mode for RGMII_ID, then program
>>>> the IO_MACRO via a new ethqos_rgmii_id_macro_init() helper.  Also fix
>>>> ethqos_set_clk_tx_rate() to not double the clock rate in bypass mode at
>>>> 100M/10M, and remove RGMII_ID from the phase-shift suppression in
>>>> ethqos_rgmii_macro_init() since RGMII_ID no longer reaches that path.
>>>
>>> I'm curious how this works at the moment? Do no boards make use of
>>> RGMII ID? Are all current boards broken?
>>
>> Searching through the DTS, I found that we have two boards using "rgmii"
>> (qcs404-evb-4000.dts and sa8155-adp.dts) and another board using
>> "rgmii-txid" (sa8540p-ride.dts). No board which uses RGMII ID.
> 
> So this causes problems. We cannot break existing boards, yet it would
> be good to fix the current broken behaviour.

These are a funny bunch.. QCS404 is a stuck in a perpetual cycle of
"no one has the hardware" and "someone has the hw but zero interest or
time". I think we've considered it for removal at one point..

I'm not sure to what degree the two SA8xxx boards are used. They
may have been stuck in some sort of a limbo. Maybe Bjorn knows?

Also +Cc some of the folks that contributed to them in the past

Konrad

