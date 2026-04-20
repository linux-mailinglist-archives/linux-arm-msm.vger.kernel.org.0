Return-Path: <linux-arm-msm+bounces-103733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eF+uBoH+5WlEqAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 12:22:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7316B42950A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 12:22:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68C1F300C590
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 10:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB813398913;
	Mon, 20 Apr 2026 10:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LvWwVWm0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="COEjcMKN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54F53988FD
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 10:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776680493; cv=none; b=naR21DSz9EJGLx5YQqwV6W/EDw8uDbePKwnvgA/ilMELih8yt/OsmoBFOZxvAgX9CdU+HDDtoqxFg1HmYVvzWoSsKngnlMNxgRdPY6J7Ku9xFJzyn6U2egQKHr1ycCa+RFxSpwTw/vrHtscxsnN3rE92gAZdxpLIFoXFryKjyzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776680493; c=relaxed/simple;
	bh=pJBwT42XrTx1rl1L98j4BHq9CeadcTi9TUyNihB7Ef0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Th3kP5DmJdaIH54OmflR6yeHKgPESi1gT7APwqGf9sq5eDkNllvBjm8HAQNJiyWS34fcXZa/KuJsU/fxdCHQ+43S7kc1lQzGWTq4P2Wfn97+WT7Aliihai8/xOvZQPlCZ4mGkJVyEyMssSL7hsyG9zoTo2mcsWNAL7cZwlqGw8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LvWwVWm0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=COEjcMKN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KA4FDr2980856
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 10:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZUBb5hNBHXHmGm6XH6rVMbCB7n6MvsW8JM4SfYPfukg=; b=LvWwVWm0SRzK7Z/h
	6ziHKldnsNrkeQIVLRjId9XsHm7m3sT+G4PcAhwoYxiyURoa1xFAgckBloQEsh3D
	hc9Z/0v0oebcR3QMgWAPaEsLY303CrXXQ0Vvi5gbmRo/jkARDb3wzzpZd0JGf3YA
	mql2icyAxBAIbhgcrm965rFGNO0cf59QhbPnpm+mEvTSpolW1jBst2U/rm4/zNLX
	6WoLxiJCHTSdLRjyGk2Loy2RwhknQy/ExUSzaZwiUWWeLzRmSov8IENNj7P5KSmY
	lycVSvoSGoFU7eE0b3WrR2vFPJgvwtxaQrvH+4SfVWQHaeJq/PLzCUA6iGwHKm2s
	XIx8Zg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnj2pr1u4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 10:21:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50de6db1eabso6669011cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 03:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776680491; x=1777285291; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZUBb5hNBHXHmGm6XH6rVMbCB7n6MvsW8JM4SfYPfukg=;
        b=COEjcMKNA4sg+s84OhLQE+bEFUQz890mJ4tYgm+sq6EuvdQPrczSyDtSjOm/iRO1Hi
         NCCPCrZBbbsZe8lGaeaa7ChDWMMFzOIyMy9d0kp1RImYmSKidQfS9TOpmONt1UAA1cnG
         Xw+E8WeV9bHT+ECuNYUjhyKNMvFgO57pxd2JJIjDPQDwW1YEhA9ynN9damKtqY/xn/mc
         phQ3OJl5YYWzhut7QrCDTIwxTlTlWCIyme/qon6t95sBQ29pdMylIT+BiKshpNi+7OXt
         Syt+c4ocCYqqo8h7XO5tz0QLg+pi+p8gzohtcxAh6Xsy9sSqRLItQ77h99Ctx/oarI5o
         r74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776680491; x=1777285291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZUBb5hNBHXHmGm6XH6rVMbCB7n6MvsW8JM4SfYPfukg=;
        b=SStRJACmZOt0pSbGRkB9TDnmNisBEPZdba1RLI8yuQlXLKYcWZhH8iZBKupx0H30fk
         Ax7boy05diBq8wXeH99QsfNRu3YQzYlNxs8JQaNRIMTBEZmh2aSSa4SBYdrrHQhtmXuK
         5BkBKd4YSa5Q2qSX/JQgmiPYx9zxwhwDHDxF6+mPGfvFc1Numz07POfnCFx0O3xuu025
         u/FaGqHDU7VsXAEVSMQJDoW15AorJqzqdJWlYBoW3NdNcVsi5gS2qRIbLxC/XQyETPHk
         8pIgQtDOGZxxRW1QcCtgm3LK5jjH3qiiHJF9xFeYWKxBhqgHeQtxL70xHngoY6JWV0hA
         pv0w==
X-Forwarded-Encrypted: i=1; AFNElJ+0i7NMamDOLeQrLRBMEN8seNntQ8dKC1NvaOVApYDwZyTAuJfFnjF60oms1pZjiAnmxLWSuUihwURGJMqS@vger.kernel.org
X-Gm-Message-State: AOJu0YysMJQm+rRBFw5sLck9aGNMqYFpLfcoaAPBVtV1FOu4m8RoVgAD
	LHtPjSdi9CQAuDRPDWH7x28lYy5tMdIYeYjTLfQxWRdWhWNAwbJn2Ew3SwFRTidhoYRjNxWqo2d
	ujDoFct8RBsSgmZ+pY7ecYXmDcifrfori1ihPT893xJcIyf0R209l0ViQOu4nXogVK5yz
X-Gm-Gg: AeBDiesO668GdohlNVcIefMgPG6zslm+dCqaY8gjvsAl7WRUSplJCCCGdWWqYSrQR5+
	DvIYWDCB6NPyk8n2FIuNZD/6s4BMLGiGC/MC0Z6HJ5ty9o96u1m/CqbGpsFtdK8z8viKONXS6NY
	xfcXZodtrVMIRNmb9oYj/sdaf8A2Cl51yytF6suAJyVc44wp3ocrPuAtcUdPYEtHJNk4hYnxo0M
	f74DC/ZkYtIsHQ/aT9snELJb/ov/Nyx7DSdnE3NT0M1bi7GGTiUrjQygEr2UA/fVy0DOrIz6Q/p
	gNVawTtdQz0IC9qfpig1Zrx6hVuTRLVtkKujbAx4PjP5DZtM6ej7xpf1hSvEtIJNnFAes8QGsWW
	70sNorf6umcncJUgEDT1x5U9DuvtaW+43I/nAVLqEc5L5Ev11gSgoRf0/HqUJufGB81MMRmuNUd
	NLGq0ruiztGqLJ7A==
X-Received: by 2002:ac8:57c5:0:b0:509:39b5:a97a with SMTP id d75a77b69052e-50e366774edmr145482611cf.0.1776680490908;
        Mon, 20 Apr 2026 03:21:30 -0700 (PDT)
X-Received: by 2002:ac8:57c5:0:b0:509:39b5:a97a with SMTP id d75a77b69052e-50e366774edmr145482251cf.0.1776680490512;
        Mon, 20 Apr 2026 03:21:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c480e18esm1964412a12.10.2026.04.20.03.21.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 03:21:29 -0700 (PDT)
Message-ID: <b9b58923-40c0-4d3d-991f-52471b29a813@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 12:21:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc8280xp: add several missing pdc
 map entries
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260419173251.1180026-1-mitltlatltl@gmail.com>
 <4abb1626-a0a3-45e1-9289-fee366a8d9f0@oss.qualcomm.com>
 <CAH2e8h4bMve_hfW6VXynBh--DgwW2v8=XuVpAzUoS8N_73ZEhg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAH2e8h4bMve_hfW6VXynBh--DgwW2v8=XuVpAzUoS8N_73ZEhg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Rn9lT5bHIRT1nGeHtpLub66eJ6BzuErS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEwMCBTYWx0ZWRfX1j7lTkebhJC7
 FST0D+UzwLy+HMGGlD1QeLAaAy/ePs1naBnjJYzHGdQouDxS+v5V6oJxIH5UF5AkCX0O8eGxvpc
 OM0LZa7wxNdf3gHyWAyy9EPbl/xNjWg0ChiNZqZ23UWc0CAgfStiBASXeP5Hu8iM5heR1XvKOWE
 ocSeZ2qfPvvcNUs4sO+P8fuC9cvFpT7p79IY4yOnbowz+ZdPF7Dt83mbgoy8FUmVAm0zNpRZzjs
 RYBYt/ZFON7ryWdCGGsIzx/K9zwzvja4IVxCwelMq2RfVG+wPoBwRgizPWhMe0+omiypQT726mo
 2XYDckl1SoG5c4W/aoXAAQqTI+/At3rOk+ikF2amQj7xIwyAgxUxqZjsN9xBwiyfdQq9FdpWMci
 Ao776C3OJqquQLpUlUZhHHrAz90N00DJdqH0VGCSfrqEC54CaRd3tL4ZgpiOrBhItnr+oSwJ6hd
 qVj84TO/pXn2orUQ7FA==
X-Authority-Analysis: v=2.4 cv=XMoAjwhE c=1 sm=1 tr=0 ts=69e5fe2b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=HY-0N2Azj2Mso-XHyusA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Rn9lT5bHIRT1nGeHtpLub66eJ6BzuErS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 spamscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200100
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-103733-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7316B42950A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/20/26 11:53 AM, Pengyu Luo wrote:
> On Mon, Apr 20, 2026 at 4:32 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 4/19/26 7:32 PM, Pengyu Luo wrote:
>>> pdc 215, 256, 257 are missing, but we can find tlmm pin 103, 84, 90
>>> are mapped to them respectively, so add the map entries from pdc to
>>> gic. These entries are reversed from .data section of qcgpio.sys
>>>
>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>>> ---
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Konrad
>>
>> The below change on top will fully align it with the data in the docs
>> (no functional change)
>>
> 
> Glad to know. Could you please help to check the tlmm map too? When I
> was parsing the binary, I found
> 
> tlmm 65535 => pdc 70 => gic 520
> tlmm 65535 => pdc 174 => gic 733
> tlmm 65535 => pdc 175 => gic 734
> tlmm 65535 => pdc 176 => gic 735
> tlmm 65535 => pdc 177 => gic 736
> tlmm 65535 => pdc 178 => gic 737
> tlmm 65535 => pdc 184 => gic 743
> tlmm 65535 => pdc 185 => gic 744
> tlmm 65535 => pdc 186 => gic 745
> tlmm 65535 => pdc 187 => gic 746
> tlmm 65535 => pdc 188 => gic 747
> tlmm 65535 => pdc 194 => gic 753
> tlmm 65535 => pdc 195 => gic 754
> tlmm 65535 => pdc 196 => gic 755
> tlmm 65535 => pdc 197 => gic 756
> tlmm 65535 => pdc 198 => gic 757
> tlmm 65535 => pdc 199 => gic 416
> tlmm 65535 => pdc 204 => gic 462
> tlmm 65535 => pdc 205 => gic 264
> 
> If 65536 means the pin is missing, I will send v2 to remove the tlmm
> map together with the pdc removal.

These seem to be LPASS/SSC GPIOs

There are missing pairs of:

TLMM 151 -> PDC 264 -> GIC 191
TLMM 143 -> PDC 261 -> GIC 402

and very interestingly, GPIO 190 has two mappings:
PDC 70 -> GIC 552
PDC 178 -> GIC 769


Konrad

