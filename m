Return-Path: <linux-arm-msm+bounces-109029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAYfLUHrDmqwDAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:23:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A6A5A3F67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:23:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8244E303FD78
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 468043BCD36;
	Thu, 21 May 2026 11:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H4GNa20f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T4HOYb+v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AD03BB9E3
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 11:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779362353; cv=none; b=bgZ2vk5+T9WAT6mLrobAFunvtO9Zo8207zeAvsV4QNOBs3W/KgfDmw6HNAT/exKzGJocyyPS8pFDaUVfCxbOI+94K2oqz9LaHXE0cqG2AJjo/7QeFV4sUWa4djXzrsJvCs71zemyhCs6arSk6cxjHnXvvPDwG9sr2VCi/DojiKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779362353; c=relaxed/simple;
	bh=Va1tsaXau3ZOp4Fs1C6XDkNnNoOcNPKFH6zod0IfVuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WLZLhcm2a6AiHdtjdaLbhCo3lTwoJeyHaPVvoffeXQ/gf3vK6+NM2Whd5iknuuCJOSMSBha0smneZecOidfOU4wpzMDP7J1cHQNBow5oXtQvU+lhSaAubvPokajbBoNc2RwqBps9D/ljrhhivThKmPglLsyBtXyuu0DgH3Ae89U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H4GNa20f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T4HOYb+v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9A1WI2632794
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 11:19:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q7zTCbgzBEgy2rmz8Lm0pdUFHaG13OEbYSNtkZTbeHg=; b=H4GNa20fpZA3wcMy
	LobHT60IIU6ZNxgcEiPCX73buSLKX1O0Tx+ZduVLSb93fUh7qnO1NMQ3rbETM5aC
	ydoJA+9cLksq/me5mLfcJmLVV1IPx8pFdZsqDqML0D9pVsVQjk0lCVN+U4yO9R4u
	+aILbPfAfy5HrabDCnbPh3qR2j3U8/48x/F0SqqP2sXhzZZatgEqRyN3w1E9KdmY
	kaMzgai5M9NRRiMTSvKyvfn1HHwEexTKPZBo+4TpiY1Nib4aZv5tv8uplBW7nfml
	u59E/KyMAy2uErqx8IbHkkrRPTeCUV3L30kuB+5roxzrlg800GXh/RrTbeXVdtkZ
	4cT/SQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ee8cqf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 11:19:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d9f1bccd7so15413051cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 04:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779362350; x=1779967150; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q7zTCbgzBEgy2rmz8Lm0pdUFHaG13OEbYSNtkZTbeHg=;
        b=T4HOYb+v9yAfXR87qfMfX7Ra5/Epgmk25br5GGbtrNqRobeW19ScKksOw1flh/uRD/
         AZDs4xKIBhyiyg4SBI+9wkrEY/vX8l3KXeGa91UIeNaSKGaK6l6oPRsuecIgUdP/hOhP
         /xkEBqUU90xJFc7zAu8dW4IV1Y0ALtQEw7NwX/Pw7PzGVDlLcjyevo5CrRdU57msI9WP
         wRbXiJKFkoPtW8JwaoAJdx4VebEY4VWKJeG+WHzXzDrZqksDXIZ8npauT3rg3epEMGMZ
         dYAUMunfS7W/3rqL+caOPPJt7YjkpdNADFLqmEUlM9RVIs51+gG9y4LFcSRSCwfOmlsS
         rjBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779362350; x=1779967150;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q7zTCbgzBEgy2rmz8Lm0pdUFHaG13OEbYSNtkZTbeHg=;
        b=R5OeX2jpnIyAjzY2jvgXAkiFu0/IHe39FehfeYkvXqrvO4H7m2FO+qOXZJ48MAscTy
         5B8rbPuh/09XUpWmw7kZq8auIVNAJvmP6uJgfmY3/RDJ+PeimGrcL7ZWj/G44H0ZPfRd
         uqgFyORMHIIg4DgEHzjH9omjWiu2B7F0D3FiZClmlQXnjofah42oykwueFqaWeWyE7sZ
         cnfZzaRo4h4xY1RO62Gg8r4uNAKz0YmCusfwljc5cIy/mT2Ja44JQj1s5z1izEbA1uFY
         im/9tAu/owY+MtczACjm6KpguyEmbuwBUtnCLgFSScyLWmwu9b2Gixh0fyZXaSrVP3yc
         8HDg==
X-Gm-Message-State: AOJu0YyZ1Lll6ik4KkeLuLMkDlitVxzonuT+UU2bJ4DiZHQC+WXdglcT
	ktQ4wMhpNHTa615UpodtHpPEkPCRmHsOvT4qobbt/4AlI0cyx5HJGeJRkZk6RzIcOuHv7O4qNCF
	+zkCxleeH02ZsaydrAlZYrMZYaPPABfPRBsw0Lcn+6IxDZdEAZYXXYdiBtBfMYKKjOGZQ
X-Gm-Gg: Acq92OHhzP0AYxCzMCLxeD8MSX83FdmjWqe82ux/4r6CQ5HestQcvuSOp1+WnD7XnB3
	LcFvtSqNZHqnBZ4lx6fhDJviwQMrF9hIuCExfo1J7x8B3bzq9flmy5jjxuDUmEdV0z2WcbuCmtG
	BEpPMxbzlP7mAkreQ7HUDEtdtXI+ilyb1OJksJmhmRcz7P8UrGcePpBdEOQTlmzttSzB+Gs1gG/
	clJWRCuWlTY1Tip7y41s9ye5F7n2mI6b326aTgqVQV7XCinjESCFwmMaT1xsVMd1HxCi5iPOQzY
	heIygoTtusNp1vssWfFSQrdxJ/aSQWujP9TsgTQ17a992GRLcTCfwtGi2r1r1d8xMLofiEE5tzH
	h5hUtyBA9UCXr4uhN4L4zOIinwGMfwi2yxrVEGaun+Ics5VlHxMXeIJdZtzRP9miqj2u3SmlNnr
	1D4Tg=
X-Received: by 2002:a05:622a:4113:b0:509:e68:22cb with SMTP id d75a77b69052e-516c5646459mr20999941cf.5.1779362350125;
        Thu, 21 May 2026 04:19:10 -0700 (PDT)
X-Received: by 2002:a05:622a:4113:b0:509:e68:22cb with SMTP id d75a77b69052e-516c5646459mr20999661cf.5.1779362349730;
        Thu, 21 May 2026 04:19:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc8a410c87sm32062966b.30.2026.05.21.04.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 04:19:08 -0700 (PDT)
Message-ID: <69ad1327-8ef2-41c3-b07f-61d00e862904@oss.qualcomm.com>
Date: Thu, 21 May 2026 13:19:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] powercap: qcom: Add SPEL powercap driver
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260519-qcom_spel_driver_upstream-v1-0-75356d1b7f94@oss.qualcomm.com>
 <20260519-qcom_spel_driver_upstream-v1-2-75356d1b7f94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-qcom_spel_driver_upstream-v1-2-75356d1b7f94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: j5v_vvb4tnZCiuiakeVN5_s1OvAqKbEb
X-Authority-Analysis: v=2.4 cv=e5k2j6p/ c=1 sm=1 tr=0 ts=6a0eea2f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=fLRa9Tv8D7x8Vr91H4gA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDExMiBTYWx0ZWRfXwNh8aut/uY4j
 qiJ+jXgdlYnChiZY8u4lyaVs49cjNFH5Ir+ClQYTGiOUbDIHkBKFO+Hmwpnb9mzmnjW4mMsXA5F
 yFuy0fq5p4l87kTH3hX7uGwjPE72ebljCWsQfynAkB0x4vNbRAyo/SXmbykqQC/hCEdD+J3Xb9a
 bkVbJpiW1ugbTzJ5hIdfeW7pNbWuXEXXLNntWErVStw677iuC2qo0gDqVAsohGiCXCqHmlGa2LA
 7PItF4xFgvMptMcRq90y6HqFHoxBr4486UuC5wb/w+Qg2VYGcNPd6zs/7fp0oVAuvd6fcnORYkc
 dDL8Efp82snA+h/er3K1WTGZOroN7syeNOLfmHilwDldOr4mW9vQgv4wzJo/1NW7Xf0fwSZolwl
 8LdGj3PpgRk7dnPDHzqY6Pi/OibbmU1jFzUjv6dL/Ukw7XyKqrtrB434t3jovYCqkhapIflzVhr
 tY6PYz4zchU5oi/P4LQ==
X-Proofpoint-GUID: j5v_vvb4tnZCiuiakeVN5_s1OvAqKbEb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210112
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-109029-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 96A6A5A3F67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 12:49 PM, Manaf Meethalavalappu Pallikunhi wrote:
> The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
> based power monitoring and limiting capabilities for various power
> domains including System, SoC, CPU clusters, GPU, and various other
> subsystems.
> 
> The driver integrates with the Linux powercap framework, exposing SPEL
> capabilities through powercap sysfs interfaces.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

[...]

> +static const char *const spel_domain_names[] = {
> +	"sys", "soc", "cl0", "cl1", "cl2", "igpu", "dgpu", "nsp",
> +	"mmcx", "infra", "dram", "mdm", "wlan", "usb1", "usb2", "usb3",
> +};

If the domain data is not going to change for future platforms (but
e.g. only the offsets will), which I doubt, please use designated
initializers

Otherwise, please coalesce the names and offsets in a struct

Konrad

