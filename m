Return-Path: <linux-arm-msm+bounces-113084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Qt2CNt6SL2r2CgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 07:51:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7425668395E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 07:51:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=R9li4ae+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="EwW9w/c9";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113084-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113084-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8B2353004DF7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 05:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69BC83AEF46;
	Mon, 15 Jun 2026 05:51:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3391E3AEB5D
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:51:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781502684; cv=none; b=oDP3CAeMarj+QAOuh90EmHBnElqc23poZ6MGeUxTORh9a2xZn2kj3ClVcImHbZ9fhNs6vbfEtLZ+L6YNZlBpVDqFDeQGaWrpTXfhWFvn+zvpeUMbQTK1BTxZRU3kwdhD1pb5fPUoJIdq9THjMGkr0CeLFW3zG056v/Dq7Gv5Nw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781502684; c=relaxed/simple;
	bh=THM7ahWJk71/LoSX2T6Z8VkcVT1plWm6lCU1L7btHiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OfNGJP6FYBhypkT77ZJMsPj9/GvkwGbrVqpxxkKW70I0iONhowFG2X8ktuFF3/3xYKFSDC7JHvcnjW13zK/NAnzaqS5SatPZ/6j3CRglvXiCfFbNd9kzwoAfSA76tEsgmaprdFivB8EnT29qre1V2Dic9RbsQhVAeUEZVms2Hmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R9li4ae+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EwW9w/c9; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1kaEm3287316
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:51:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	13MV5+oGu9Y4QSitcFuhVSklhqqLnHoOgTil+bf8rdY=; b=R9li4ae+Vk/Iss32
	J4asgu/AaZCOoEjhYJJcZCAxfumUZuVwEJGGj5lRbQqIEWGI+lhZO+YPgph48OBn
	NdvFDGou6r/9QhLO1P8YsYDGh5O7Is1G/ZrrUObW9L4NkUeOsPo0MDazKvblf7rE
	zELvNJuMIrvx0z4hySPC7KXII04IWtoI+QfxYLXeBM08Wjt3xZhqskyAo+XpkMkR
	nyNXnhS9fCLVKktQpTmmhnJYBSDxXiH/zvwYWdBFXpE7bP9+bmW7hRg0+RejxzP0
	kow7P6sjaFHLBg9qL/0Ys1JwRLJ5oQFC2XsxeLVtHjaVbjMqMOgjy3rvPm0++9qX
	ofEbTQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery8wwrjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:51:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf004bf8beso38272545ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 22:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781502681; x=1782107481; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=13MV5+oGu9Y4QSitcFuhVSklhqqLnHoOgTil+bf8rdY=;
        b=EwW9w/c9lSrf85qhKSU3PWQOlJa31q3HQVXx3/w3gQkr4cOMXSpSdctALtDy4dnkfD
         ZpPNa1MFXDq30rDBe07jQWuuDkA7U8htqFGdP2x+wgQQGBuusBKsmJsnSijv8keuT11W
         UdxQx6yLMUf1XiyIGJZJKx+BS/WbDN3mkJZb4ck4V4hKEc0FGnlmAtetQ+U52CO4SbJC
         ZyKWzOfYj7PPx/rY7qp07SMliJvhOrnEBE/p62v6QNCetAiXlP1LK6uJ3ppIZkXlh647
         3jih771OyTdjUI/lHiK/Jv/Wwqm8xMCo5mfJ0TZgNFO1hg4uAzJVPmA65zbuBTFXwsn5
         twig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781502681; x=1782107481;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=13MV5+oGu9Y4QSitcFuhVSklhqqLnHoOgTil+bf8rdY=;
        b=MdDHAJeYjQCLUyZIqN9N6NSlAECNSy1qsa9/cEj13JsvaxtMZtzddhSrlN4p4tip7j
         ZUL2IhLKdqqOR6CGQNvTTEumv3b5gu+QDBjlvS40LGm2tKWaWavkhWv4UVNyNzdHgbIY
         meJc01XByKhc/BOBQlo3Exw6hzLc8Lh7KEn1QvBE1e9rNrHrAHvIjqoctE8qrX550FoM
         Tl8RiP7vw6E5GBtqUqOSnmpCJv4f9erPiPw4egkpuqm9ayFOt+hwTpcbaDYpZ0FsmHRj
         RCIDMV3kAJEaOIW16k9C9fNF7+y19QU3V8EqCE7m4yvQnY2HOk/hoydxgjaPkt+gNyVm
         kmow==
X-Forwarded-Encrypted: i=1; AFNElJ/0ggqFw8T8R0V/TRx/EqM00kfNsDsnOkbwbA19jq4qUMOqEN+Lv9LEV6uDyuP1MwN0dRIMukDNeyAoJFc/@vger.kernel.org
X-Gm-Message-State: AOJu0YxhQX150jp1xB1XoKDJaHRxULBVqBDF33FWt3g5UPx+0ZErF7jm
	J1hHs5dWKSpRrzt97iX9bgAXmQ3OjIJeEWjQRAuhU1Q2mdTioo3XBezTaGEUfbtDGyCKk23rsSi
	ZKNmc05APbxD/xznNsDkzBvCP84DARA5FpMnI30jz+29+nch8d9sKTGrCweNHIZgrSk3C
X-Gm-Gg: Acq92OFjHiJQSA47t0DlERUYI/niRfeUHRtsNECLgoFJeAG7hUSoqCJuHOHW5CJwN/n
	pnbyhavZcpjR4VPcPlz/WsTmbLKQs8Xb7e+tcsLhDXIPPtuCNsrS1SBXs8i8ssIBgvPvDMk53OK
	J6EzE3wRMC7pFehgUs0e9eCD2UgSi9EYen/AjdIqdT4NzQl/fhwT7hhunQN0AZQRqkTWNqncLg0
	o3J55P8tKKjjutf/xJFmXp9s0ycbHIXW8E5VVo+4Smj4IR48C/LQNXlyp5m1RqZdrtAAWsIRsuy
	YW1woH8xHIsFtKcTl+yxvG8/IdfYqy+xFvuvwCZwwqjJVmRGEMJH0aIREvOAMvrnKPLOnPN7YNK
	WkFxvGu/x3YsA/j+VI/nzBx7veFqQQJL4ttNlf85UqVV5gDQIHjGH
X-Received: by 2002:a17:902:ebc7:b0:2bd:5ab:af95 with SMTP id d9443c01a7336-2c664082585mr114141575ad.0.1781502681070;
        Sun, 14 Jun 2026 22:51:21 -0700 (PDT)
X-Received: by 2002:a17:902:ebc7:b0:2bd:5ab:af95 with SMTP id d9443c01a7336-2c664082585mr114141265ad.0.1781502680609;
        Sun, 14 Jun 2026 22:51:20 -0700 (PDT)
Received: from [10.92.170.188] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c432c8ce89sm89192275ad.57.2026.06.14.22.51.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 22:51:20 -0700 (PDT)
Message-ID: <1403607d-a277-4300-abe4-56648b3c2a1f@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 11:21:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] phy: qcom-qmp-ufs: Add UFS PHY support on Hawi
To: Vinod Koul <vkoul@kernel.org>
Cc: neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org, alim.akhtar@samsung.com,
        bvanassche@acm.org, andersson@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        luca.weiss@fairphone.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        nitin.rawat@oss.qualcomm.com
References: <20260526090956.2340262-1-palash.kambar@oss.qualcomm.com>
 <20260526090956.2340262-4-palash.kambar@oss.qualcomm.com>
 <airUb6wT-I-7cOXK@vaman>
Content-Language: en-US
From: Palash Kambar <palash.kambar@oss.qualcomm.com>
In-Reply-To: <airUb6wT-I-7cOXK@vaman>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BzDgOsYx-db3rXGR4vvr5iRdMY1Ff9ef
X-Proofpoint-GUID: BzDgOsYx-db3rXGR4vvr5iRdMY1Ff9ef
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA1OCBTYWx0ZWRfX6rzC6NaBd6+E
 fhT17CdpZeu1sAxXFmdldYxpas0PcaUqqOFSDXNCwcpx1tzfeH4Rnu0IlZAt6oCmC8Fj40KMqvg
 wt92Nn61nj8gzPuZbuDlIc6pjXIfOmQ=
X-Authority-Analysis: v=2.4 cv=IqAutr/g c=1 sm=1 tr=0 ts=6a2f92da cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=YxLorS6-WnmH7tsLkT0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA1OCBTYWx0ZWRfX4QwcleLODnzS
 PzzAACljBf9xvYQeVPXpPOt05+rYVwHOUZ2CxuYq8eKpPd145TyQUTVsQOzrb+j1Kst8fvHWs7D
 64uA9gigDElfqdbyhwzx/xMU8RnUu2aT6Jpltdi/vjBBTmaCHzNpld2nRB1G8CUp0s5v1zWx5mD
 fvuRl+O0KcGa1rGsLTYDrr3eiGfsuDb9TeQMu3ToKQw8wNs/VkoV2Ol21jATFndbRUQLuDcizZI
 BiMsxJ9n56+qXdW3nf1+3pkWfTqnEsUku7D0ccMkY/7KxL+2R+cp+i9W3lyRxHefnG2rT1e91kj
 mjw20ZIRqn20AD2qPeaT91eeWt0pVanL5gOjs5WyXy0KiJu1FINtqMb96IEd/a+W+kGyeV3se/H
 P2utsnDiyUAz+YHCpT/1tK1nUzYIYoH5+Bo8eJBC0bEWf7j+In8CfY5WFlzCnAtoKamS0P7dSbn
 AuqY4UgnkpqcYLyfPLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150058
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113084-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:alim.akhtar@samsung.com,m:bvanassche@acm.org,m:andersson@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:luca.weiss@fairphone.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:nitin.rawat@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7425668395E



On 6/11/2026 8:59 PM, Vinod Koul wrote:
> On 26-05-26, 14:39, palash.kambar@oss.qualcomm.com wrote:
>> From: Palash Kambar <palash.kambar@oss.qualcomm.com>
>>
>> Add the init sequence tables and config for the UFS QMP phy found in
>> the Hawi SoC.
> 
> This fails to build for me on phy/next
> 
> In file included from drivers/phy/qualcomm/phy-qcom-qmp-ufs.c:24:
> drivers/phy/qualcomm/phy-qcom-qmp-ufs.c:1878:26: error: ‘QSERDES_V8_COM_PLL_IVCO_MODE1’ undeclared here (not in a function); did you mean ‘QSERDES_V6_COM_PLL_IVCO_MODE1’?
>  1878 |         QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_IVCO_MODE1, 0x1f),
>       |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/phy/qualcomm/phy-qcom-qmp-common.h:22:27: note: in definition of macro ‘QMP_PHY_INIT_CFG’
>    22 |                 .offset = o,            \
>       |                           ^
> drivers/phy/qualcomm/phy-qcom-qmp-ufs.c:1879:26: error: ‘QSERDES_V8_COM_CMN_IETRIM’ undeclared here (not in a function); did you mean ‘QSERDES_V6_COM_CMN_IETRIM’?
>  1879 |         QMP_PHY_INIT_CFG(QSERDES_V8_COM_CMN_IETRIM, 0x07),
>       |                          ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/phy/qualcomm/phy-qcom-qmp-common.h:22:27: note: in definition of macro ‘QMP_PHY_INIT_CFG’
>    22 |                 .offset = o,            \
> 
> And so on. Looks like QSERDES_V8_COM_PLL_IVCO_MODE1 etc are not define.
> Please rebase test and send again
> 

Hi Vinod,

Sure, will rebase and check. Thanks.

