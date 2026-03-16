Return-Path: <linux-arm-msm+bounces-97908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIRSKmbet2mcWAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:41:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 959E62980CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:41:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 35F17300D1D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAC4338E5DE;
	Mon, 16 Mar 2026 10:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JeYwaiyS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hhwb/yxW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334A338D6A9
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773657692; cv=none; b=rztOraXTYU7haRj37oYIVaf2nWmkk3TCsO5i3fofngRLH4GneRJTZke4eHmx8cUpVO5IjF+XHl7syyvMTNstfqWHyUXyoY/WG+IpITdTItgItW399Tsw8knMagHUD2Xb+8xxGU9f9hZprxVE4+38p4YbSb3+mzHLaO8eJoZ3OXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773657692; c=relaxed/simple;
	bh=xGsdO9lvHQTEQqegkv3PbncSFZyHZckPB8k6omLSYbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QLsasdCvQNeQlPIOA2xY8GZ15I7JV6KfHw/jm1PoeswNxlQbG32KsPjXF4CjfyYdlMT5cz0iGG+ZZfGcgmDfK+Wuwmstc9z02S48rQ8wCudZM+cO39AFNZ6k3yD6k0jorXRPg+dqddrvY/JC6bq+mlvfuYpuxpCTkcL1RzyEW7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JeYwaiyS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hhwb/yxW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64jsv744151
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1QqnBdYN2J1s3k4Tlc9PyCtgucdWDLMMCEFYmM+WSvM=; b=JeYwaiySR8LxK/ap
	VGxH/KN5SNQsjCsh99I76ZWxnIQiAPWgYgZkNiomfJ9kwyBPtWS5BrZ9FFxZ+CgS
	74n0hAiZk6i0Grc6OqGTYAcM/9eUGap/KMM/zIpFKS5QACQvoB/iPomCOC8KXxt9
	T942vHJEBh30gUu/rKg9sRWL4Amocgdh8Q2IlfaWhJUgSX0e4WIBK6iwDyBI39sx
	1ZoRtAISamPcu9V4PPnS37lzfvketUEiZZjvpj8OyoZgqI6GeD05Io5pjqRPgjsk
	KFjdJpf2rAH/V2ugTFIKY8QpjGS4C0dkzhs8HWasGJ8j81F/A/Y64ya3VNYNmcDZ
	5QMtyw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw00bdc3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:41:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd90958f24so246654985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 03:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773657688; x=1774262488; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1QqnBdYN2J1s3k4Tlc9PyCtgucdWDLMMCEFYmM+WSvM=;
        b=Hhwb/yxW2T6KbiivzMYmpuUhNeydgT2dCen1/8SbJZbF36qkTqv3l2DEmx9FpyuD6k
         WnXOVuzNKc6Bk9EJb7JqgLAMkkz/cxC+bOjbhPIgGD0kGeFTerjbjUPVBF2iVAwPXvsZ
         qW8m2OlHlM0PMtVI8IV5ceV/LsgN9oEuALxG2oHoYvZ7dibfzvzi/XRU1EOSmQAvWQhs
         caw3IBcvKB7KZeBH6x28dgissiJYCoRY0jC+zKWvvztS6ptdwwuTrIJ3N4X1x0dk6+op
         z9+N+Gj/phE78AzdCfKjRHBhaWWRpvubm1dIEqmxinoRvB96SbsTFPxYhuWtXrl89xL0
         FhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773657688; x=1774262488;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1QqnBdYN2J1s3k4Tlc9PyCtgucdWDLMMCEFYmM+WSvM=;
        b=WYZTAebBU65PekFxvmxVN8+Urx/DcPxQZ8g6evxUZRpqkKmnESkwzERkqfdZ+zIMR+
         s8bdd6whezh8a+2yeq5wDuHILipwS1DWJSjhnRBYm41312MEov3U/FOxWcFOXaiFJ5Dq
         H8Tlbq8yMAXf1+9DCwNXb1OnDy4rAyUl7CMVpMLQ5VkOsDprn+YRJ0wHS7ysMXu20ngc
         ztHg8jNABf21YVwmT+eROxeJRUdnNnLMUI8eUyC2C58TzR4pSTq62Ho6vxmP6GmN0gIx
         ANAqgTviHKiwMrMOdDM4T7xxq60/kzrawy1bwKrbFtmq0ZBtkGDuRuxlJxb6lb08Tphf
         2/uQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWDz9FmHyVLKyBWRrBHt82H03d1rmiJT9N37IiMfebTf746pHUYgIe4rmJRdHQM06lf4PWD0nDj5gD21/F@vger.kernel.org
X-Gm-Message-State: AOJu0YxSRVuyfVLYoNCKgYa6qvBtASR4htQjDNOtJPeQcHgVO3+8SVas
	viyU3wtNZ8z7IK7XDiJ0IU2P4HrLemZoIO/tdAicfmgxzmYNkTm0RL+iC1gQIl6YoaEHqwC0/5Z
	C/LH4Y5XCWLFPw7teCqrspQIDtJzOXd1WCFH/LaabCFTQeJktHCannUOqnRAkweCBTUP2
X-Gm-Gg: ATEYQzxlujlMoM7AGLYBWvlLQ7mchKzeLm4yBc0ZAls+BiBmXBIjjOE7p8c+vArnE2E
	OOjmWVKpeepyIfBuqMoPTI2QrvNwq/eCT8MomSy69FJSVmmQYV7h2zqFUg3mK2aeAg5VLBXwk/4
	KB0xhHSEi2XG3sg51EEMP05GOXxEz2xxuu495M5w0C9StIsMA1s9EIhsD/XPK3T3PRv2k9Lmoya
	MoigKmGsFu1gCivRCARtpSCxRAfdt7w1uEgVAzUBfRLX83PveDqFx/sUgWPFIhyKZvF7Hko7Wcn
	9kr429/DxnkJXMLTeM5lUUARBICF1g6R3qudcOQi9mT+SBpOQWNBQb5YglM3/+P24nlHbPKEPTE
	i/itpwyHPwfqKDcdLgFcQZKA7t2+UZcEReH59im4tmjhj42mCePFrmZRXKquDxHFAuuGDKUJcF9
	F+8rM=
X-Received: by 2002:a05:620a:290e:b0:8cd:8736:9fc3 with SMTP id af79cd13be357-8cdb5b8a614mr1280364585a.7.1773657688606;
        Mon, 16 Mar 2026 03:41:28 -0700 (PDT)
X-Received: by 2002:a05:620a:290e:b0:8cd:8736:9fc3 with SMTP id af79cd13be357-8cdb5b8a614mr1280362485a.7.1773657688178;
        Mon, 16 Mar 2026 03:41:28 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cf49fa6sm537613066b.58.2026.03.16.03.41.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 03:41:27 -0700 (PDT)
Message-ID: <c9b4481e-f109-4acf-b58f-2235efc7cd5b@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 11:41:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: Add Arduino Monza (VENTUNO Q)
 board support
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: richardcochran@gmail.com, r.mereu@arduino.cc, m.facchin@arduino.cc,
        geert+renesas@glider.be, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, ebiggers@kernel.org,
        michal.simek@amd.com, luca.weiss@fairphone.com, sven@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        kuninori.morimoto.gx@renesas.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
References: <20260313103824.2634519-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260313103824.2634519-7-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260313103824.2634519-7-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IsATsb/g c=1 sm=1 tr=0 ts=69b7de59 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=5D_ixgJ-nfAih4ZOxbkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4MiBTYWx0ZWRfX01BT8AIbHSIv
 ly17YwXYuyTtAa1K+V3bK5fWrt+W0SZGFaSzo87nyeUfoQcy6zF0BoxTulbUjBZ+d8lZqpbua0l
 o2nEKT/JsaFgwDiLRoThr9ejjHi+fehADRmqgEBGerxOL3jkgAYV/rOiaCMdRsmiBYZWynFZiUI
 5Y9GRpPCOFx/VH6hjFmyq8Un25x1ZSHGKnPvr72MwylJb6I7o/NOHqrVb23Za812dUc7WF8jwuQ
 GFaJvu+wCBkfP09fwvYlYOyezf7u5XaN6pcMrSH4UV2culXRZbx1o2mC5Y0jp61FUtN04cnpvKg
 61EDIpGsddZhlrl7nXKzFniNXUtAF5fU8n8682SZ2+QuRESvXVm4+K/gdFFf3H8j1vr0Pjea3Rm
 YlA+w83PSGrAFNVm5BCS4jCt80n1n6SQPW8ZG4W2SnwV4Ix7gb8ceBk1pay8lMZsycbXhxd8C8K
 foFvmjYb1riB/APQcSg==
X-Proofpoint-GUID: CdkFrvTUnv4dRiyTfO9BxckdNaS2IjlR
X-Proofpoint-ORIG-GUID: CdkFrvTUnv4dRiyTfO9BxckdNaS2IjlR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,arduino.cc,glider.be,arndb.de,oss.qualcomm.com,kernel.org,amd.com,fairphone.com,bp.renesas.com,renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-97908-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 959E62980CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/13/26 11:38 AM, Srinivas Kandagatla wrote:
> From: Loic Poulain <loic.poulain@oss.qualcomm.com>
> 
> Add device tree support for the Arduino VENTUNO Q board,
> based on the Qualcomm QCS8300 (Monaco) SoC.
> 
> The board features a Qualcomm Monza SoM and integrates various
> peripherals, including:
> - USB Type‑C connector with dual‑role support
> - ADV7535 DSI‑to‑HDMI bridge
> - MAX98091 audio codec
> - 2.5G Ethernet PHY (HSGMII)
> - PCIe0 (to onboard WiFi chipset and USB bridge)
> - PCIe1 (to M2/nvme)
> - Button (via GPIO‑keys)
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

