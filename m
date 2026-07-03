Return-Path: <linux-arm-msm+bounces-116193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UhslLyVlR2qeXgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 09:30:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 415C66FF8DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 09:30:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Cl4WYlNm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="C/cYyKy6";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116193-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116193-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4B9F3019BAD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 07:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DEB135AC33;
	Fri,  3 Jul 2026 07:29:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3993546CB
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 07:29:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783063793; cv=none; b=g7QIbLDcOYlOAkDVRNQ2F24SP8pzlN/uvjehiPAYhkhXmDdYpHF6ZlWo87MbdK3z9B1sayp3/1DDrow4tw/SxUafjo3M1YVodyHnJG6jRO/s/Ai76Uf+gJ/QvVyKqaFVAmP8w+jxjAZs+Lg1vezFdcOiOd32GGmIvLR0QxIe5+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783063793; c=relaxed/simple;
	bh=keYYojx7hrV9GwpDS+RpEon2iNQ30Tb27/cqifn/KEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F9wHzICpd9mKE0vafc/zjPtcBoLyPtgQOU3YjkcfmWZvN2FdPilmIdnCeSjKyObDyPVCEgpPlukhcVjiFORgMKiz658P8eqm68QHnaM5FjzUdSyuMfQ8pjc6BP5e3O7I4Y3yJAgRvx7M+diz8rUEBDWUPBGNEpJVv7MgXLOUJ5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cl4WYlNm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C/cYyKy6; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635s2jk3147920
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 07:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	er8rWzDS2U/5MvIw2KIto8dcYylrFUQzbRA4fDGhqG4=; b=Cl4WYlNmoJILtuiN
	1v5f83QgXNLOdvN/xh/RR81yVzmIaW6/GLnjEki1H2MtKxbq57QIZiOx4XizLwbz
	VAKHbYDu6fIYSyzfpNwVwSqMunhuOzPUS3jbHh06ouWlbd7yYSm53AdonjX2Kqy8
	3DFj88j6DcTVR10bHzibqddPjJHyw7JEAfJMLaqqVgWeyzepcK8klSn4riyMIYfX
	rBdEMlpquOSwJkic6S/pPKnUSAudpQiM7/+sNE2SC+t01YmFVItduecntI3Lnjd3
	uDxAJeIE0BPeUCns93Vr3NlJm/5xtBueveo61RALMglPHajDO6t9B39cEK5glXlo
	oNVlgA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5mvww2q3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 07:29:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5e21552dso5033085a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 00:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783063791; x=1783668591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=er8rWzDS2U/5MvIw2KIto8dcYylrFUQzbRA4fDGhqG4=;
        b=C/cYyKy6qyEpUZLpGaUpSBHiLEdp8duPIyns6lTCAjV8P8EoGjN7GLf0Qbo8qMfBdx
         MfMwxUqMiACd6vp0s3asoh4aR99tgGWXM9Rbcm1PuUT0sVuDOsd25BE0qV5tl37thm7N
         R8TS7x+8cLmP/M+aYp5s6+FOoaTcv/76q696agQrXJbzdiHbezo2WaBl1rdgQVGL61aU
         gFORKXzgJnhP/6sJiZSHZD/lDkFZdDtuGwatuxzo2qlOQd83KFqNTkuoLHrJESFk0Czm
         SoPapkRwPOAFP71FB8V0n+4gLEps16dzuF/zZWXN8qOcz4Lt/SU/Itz1U9w6lBdHfDwU
         J9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783063791; x=1783668591;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=er8rWzDS2U/5MvIw2KIto8dcYylrFUQzbRA4fDGhqG4=;
        b=MbApOAg1el+KjyhVy+fGp3iU5bc38RMu/z2/+1AP3YE8qQLukxiVKsv4nqnV4MNzJL
         LBavBT6zHJqV3ZTK6s/ab//sR7KNrqClYEPx2WLqb9qv0u505+TetcXgOljsd9Sj2geC
         nIitbJAHHn91RuJOVm0JBfno2C2fDOgLGuao6H/uDPi4qxUMTh+pmvLuwIiUMR1j9ifE
         GXI3Obi7CboTjYMdc4vp0q9RDYZLWhuqnEYCjyE7gknL0ucWCbUlliv+yYLwlXSavGuZ
         j/B0wa1COmMyoPKUWNUrMNR13VYHldtMUS5vGpgNFHPHsM+GG4agdnzIfW8ktI6885m3
         9lTA==
X-Forwarded-Encrypted: i=1; AFNElJ8odMo1m0xDC7VUDv37P45KZUtdvrzSdH8ccP3l6ZJYRuVBsvM6Crr/HYC7s8lEpmBPMCqNpExhqhou2Wp9@vger.kernel.org
X-Gm-Message-State: AOJu0YyE2lT0yok/FM3pESjaPDib2g/lXMpRz/yORjownxI+P/YltH6S
	j2ZOCX2qcnfKruETjyroFa3/DfaTsx6Jofis6NsOVtfRs/jUEXdKxMJDJDE+sYdAoE4cPFDDvzn
	wGASDi2OB8XQ5M7ZMRrQJF3qKVok/v1G09St8pG1reSKUqUGQWoKQLnCBHCL5EtaEnubo
X-Gm-Gg: AfdE7cn1WXe5avaGmVeRXxLLovwVP4DKwlzASOl5nEDB1cL8RRghsHE53YaWljV/DF1
	3Wdfy/0mzYOXAnnP5husFl1psyKOO9/KPligG9vip90loz+JdAc9yxCZANq2NJc9BLOj4E0pPY5
	P2LJyvUc+8YcamTwix2n93eQzdUgchu6Qn6UrQQ6ZAwfFNcwVY9nQEsbQSLHLPCq6199OIkJgNw
	Q7MGQ//ql0mZvCi4f1DhL7AwbjI0UAnu6Boum6bSAsGxK8vIJGeXds6dOiA7QR4aK+8MWniYOGw
	YihkbHOZGD+3JpkjXTxHVJ30lQHnqnUWoVgmTIIGYZvSV4z8LuuwCP58S4/QW6EMJsDoDg0WFAh
	NwvUmrqZlqKMHiq4vOWoiBL8EE9VSKsrbKxs=
X-Received: by 2002:a05:622a:14d1:b0:50b:3489:5495 with SMTP id d75a77b69052e-51c26b3920dmr76392581cf.8.1783063790823;
        Fri, 03 Jul 2026 00:29:50 -0700 (PDT)
X-Received: by 2002:a05:622a:14d1:b0:50b:3489:5495 with SMTP id d75a77b69052e-51c26b3920dmr76392391cf.8.1783063790422;
        Fri, 03 Jul 2026 00:29:50 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f6e3dsm236629766b.62.2026.07.03.00.29.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:29:49 -0700 (PDT)
Message-ID: <7070bad8-3210-4bc8-aefe-8cb0c2d51a75@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 09:29:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/19] clk: qcom: gpucc-qcm2290: Drop pm_clk handling
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-12-cc13826d4d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-12-cc13826d4d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VdO2NzOIyzX2Vjodov-UgtWjp7xWHSaZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2OSBTYWx0ZWRfX2xnTNVO0a95X
 9eaEJqvX7TsqlPba+E3peYLDsZlqzvAAk4EoALbvxSZi7hdjJI87twZjCUGekHoMby3QZeTRQR6
 APD/SQgqqWhu01OZH7BefyUaQKntPVNZJUznZwvHh3XyYfJQQZTtFGFgASaovzJvrjO5c6j2HTZ
 aNwbq1FXO61XrvY71eKgYySkrtMbBW2xjl8mdsee/gnyBKZBntqoJg/Mra+U+QuOtQTHuZHrmEx
 HCF9Lv6Tgz1AIWxW2uYeqZmsbqzPUWC5fasQxQZCE6uiRlufZxuhepPehhaVDkeRXic9KjPJy+6
 ohcH2xsNAXmp6C5FSvqnV0RwirXQyaOPQ6PZ9IDSWxnbRmbFj6pOZvBf5fuuZ3ZVnpxhRxSDFqv
 ZWVkYVgvNLMv3nDwpleBIjy8CMGVVPWhKlN/tF2N+T+DYfc6My3KpvwXiDynOEwzaiZ+XVyK814
 SACYWWx0beUW3RGqmrg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2OSBTYWx0ZWRfXxDWbrOPAg2tr
 BWvZPzF9KJnIqBwu0MRBSA0JMZSUa6Bp4jePtpOqZQyZd+EV2V16U+Pq6gmgHZBIgjB9mvDrmqa
 cWqz8w7iTwKCeNXdSiIliJB3Q1CkuWE=
X-Authority-Analysis: v=2.4 cv=N+UZ0W9B c=1 sm=1 tr=0 ts=6a4764ef cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=slVkNxoZvn7uzNb-wxkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: VdO2NzOIyzX2Vjodov-UgtWjp7xWHSaZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030069
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116193-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 415C66FF8DA

On 7/2/26 8:31 PM, Imran Shaik wrote:
> Drop the pm_clk handling from QCM2290 GPUCC driver as the required GCC AHB
> clocks are kept always enabled by the GCC driver during probe.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

