Return-Path: <linux-arm-msm+bounces-113378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4RMaLlwtMWpVdQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:02:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C71968E98D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:02:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BuKuCI1e;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QbA0PdiD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113378-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113378-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBD753036632
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 10:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 326D4438FEF;
	Tue, 16 Jun 2026 10:57:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F237E436352
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:57:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781607470; cv=none; b=FTXf8vdQtEWTl9nP15Gkt54EiZDKv4c6PwJl8Jnbl2gLQl01yWDtOS+dFvhnh/2fdhA9HLzmBnFbP+8Gp0GRgH9jcpROwCGgzzu/TqM1omkw8nPjprD090kANckrLOnuOG5YloIR2+kuy7akpOGISGT7j79DiNpAk8YBfXhcvb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781607470; c=relaxed/simple;
	bh=NS//MCMBdkNN0XJbYUijVfTrNR78IKk61N2pgwwLO3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NTtSgyHm9Qw1HXlVY7pRehQicEzCKvlwI9oLKCNPb5FyEB+/qpBwcRb7P0IEFnh38BAwB84b2ZBsYBIxxkipgG6Kb/VSUIa6fMqc6lz3NoXD9bmTq6EsdVlaNg7RlxjAQYaovl38YbEZvHys7UcJZ/pXBGF6h5E/oRfEkUlOc40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BuKuCI1e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QbA0PdiD; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GABKxK3223797
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:57:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xQG2J/5iHeMqzZbJSHFUtPe02y0MfIYhF4AjsSTfAZ0=; b=BuKuCI1eW8AV04Yd
	ocLM0iolj+K5Xd7eYyKJOmrGbgjYJ5o1GkwXPF8DD8Ikf0Asy1iEuHea1i3R3l0J
	751ZZaA+qpsK6YzDcSCQZ+CCDSLqOFkjGqpukoF6P6BLiLDIR6WeucRjW4xt0sSC
	TYZrlC+RDAwJbXeI9QKF8VUf0yCJEt1Tisoaam79fI09s4oDOJIvx6JRqsTDqBXn
	wjl3zeEH0JZmXWBiIB84r2MLaqUJ9qKQldoV0PZ9yGTG/het00VpAfkZLLXDEx2n
	0SsT5PsDTb+glRckqE9sTu3kn4e16gCskD3uwwkq555utD8xBcrhcitZ3xhs28In
	2j1CqQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1ysru1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:57:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915827fb1a3so30158785a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 03:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781607467; x=1782212267; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xQG2J/5iHeMqzZbJSHFUtPe02y0MfIYhF4AjsSTfAZ0=;
        b=QbA0PdiDXSAxnXee/1f2e86h6g/vaaGcUTTXJUqgBfwMDR9GcIwdbTjFaPr9Qf/kQI
         MaQWm129APQ7+UWpHgT3ufMrg+NvQ5vEkmsZEOgk774Y9ZFDLSDI7IupHuLq+7N/UYFO
         Ti9Ip1rHp0HhttXQJ3gCq3HUYAyQBCIwTU7IdlptIyzO27uKzX7bTLIc2waadhS10ifq
         w4AM9kHwdxp5mtyti2uuZWX6nJ1zHM5TijpF8OxbfYdyI5uCLmRdwcIZD87s6I5Kz715
         B+Hx9elBEk2FelMAhELAvriewLDIdIwCKDr6Wi1Chiw/wjPMSIzzCCcf9b3ttzDyV3pK
         LFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781607467; x=1782212267;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xQG2J/5iHeMqzZbJSHFUtPe02y0MfIYhF4AjsSTfAZ0=;
        b=HE4c2Q3RoQrs2U/KIhhocBfjAfvMPuanjMd4Kk5gpJwEnoiFpEFm4yNozUYci2czv0
         lo2Q8pcOqXYrdm3ldHiJdSeIzI+kb7BnZDEoC821riBNfP1DYfcP1f4ZJPLzN2kjyaGw
         PVoZIw5Pi5/9OnBab02AU4kLyNuWjFMk5L0Ies3m0ltKO8RXA4+28FL8kZmee6vlVR0h
         GZSJ4qIBvJtvFYOb1RxgpHO5Lq/LMiwHLUBaAdqSi7YFB742i3P8SjSxPeW4rBVTBMWB
         nXveAYtyOjHCy2Ms+az7Q6v0TuCFrfLuG/ExCx2GCxzSKDftaO5fCHTNDQtuoRkoWyVu
         YnWA==
X-Forwarded-Encrypted: i=1; AFNElJ/v3tMyL30XxCWzajqdhz+bMgtFOC6fvmywzw3muL07vFrEeY38RurDEINtXisiVXkkqPRfmQYMHNS9eT+A@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx51DilkOiMCRvt1A6xHNUMFY/ESYBpAJkBenPHG/iMsw7ZFq6
	p/M4JpKb1jZI/IxZAB33JVHYim9RpOFS9rdyvax+DvwDVl9SHq9oSlwBVRcJvi8z0RyzheMrLup
	gbpDm3ikXduIP23RTdqRly7hef5YlVV2++np/MxJlgTuwi2wsLsj7bHCAd49VOJJOcDqZO41YiC
	Jd
X-Gm-Gg: Acq92OEmf3iLQZoU/8WGDWmLiooer0Ew4KapfuU76Dsrv+kgcPvRry/RlY3MmZRyx/V
	+vGhlJVLDMzdKdk+ide0Tlfpho+kpumJMd6VhgOvXLs8ghXF86W5mfjY0rmEg9j7Mjb1kkL0mT5
	i8UJLY1Ig/ZQ5SKXaGYzqJNohvPXCnsJvyDCRXg0ABglOqeKj021HBKGP5+vp/bhP9XjP3H7f4h
	yUcZ4CtN43sbbFjcD2cfiGbSFyaXs1Iwod5nvWpv39ylGa1DwSBqUzPGqZXd2qcKoUM5Y4RWGNI
	qAJLznKnIfSiyeoTWycqvLVjH4LjUeEtPf0wMEmcUre3EEdEGjscKKokUYRG82oGkiLxuTEJmgF
	iDWGdXc8K2frFJUXgutiM5JDAkqk3So2wIu3VtcWvfWMgiw==
X-Received: by 2002:a05:620a:7085:b0:914:ea37:6f14 with SMTP id af79cd13be357-9161baa4b36mr1648588785a.1.1781607467422;
        Tue, 16 Jun 2026 03:57:47 -0700 (PDT)
X-Received: by 2002:a05:620a:7085:b0:914:ea37:6f14 with SMTP id af79cd13be357-9161baa4b36mr1648586385a.1.1781607466931;
        Tue, 16 Jun 2026 03:57:46 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937949fb19sm4682243a12.27.2026.06.16.03.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 03:57:46 -0700 (PDT)
Message-ID: <65467777-27eb-4b8e-bb36-ace91ad27e0a@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 12:57:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND 2/5] arm64: dts: qcom: Add device tree for Nord
 SoC series
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
 <20260526051300.1669201-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526051300.1669201-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cbd8AHUbm6GGeo3l0ANqf8pMh-i0nC8r
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDExMCBTYWx0ZWRfX7qZDmmU67C8g
 zF+p1NRbLRJ2wG9wCSjduccPN8UBaBF12aOFotVBYPekdoIhqEhjhh2anAbZkZRBWPC807vxc2T
 gSyE6SyS3FiUi/w7rxBBDlKRX419DDU=
X-Proofpoint-ORIG-GUID: cbd8AHUbm6GGeo3l0ANqf8pMh-i0nC8r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDExMCBTYWx0ZWRfX5zDlwEA4+Kft
 oPEX12UNhs6BsmxYSK16jQ6mHo9tN93l1lhUC9f1mcDjAsbk6jJk2qtJsf7xPm3IVeBs4L+7X4s
 zQR+AJ9zoqRcRr0ygw8kkTFSKcaNO6998TrF+YE3Okph48aRT8Vxrf8IjlM0epWa30jopQUI07g
 E8Bf+G5uuD+8xGNfXfpGeMzTULu3WNzT6HFlSjLBrL7TfgqAec79UP+1qIdX4/suPLX7+5cl/2m
 5ADqe59Y/QOS2BL64AJ/v4RoYXoJIrEtc37xjc164ApnmXtgNn7wc/KAftKuLHz4KFOjIw/QHG0
 +Nyt9hb2aT3EcBH4ocUmA8A7Ds4//RcgNwMwUqYwn7y8rra9J6sD5wSbbA16zA3cEkN0mf/utIO
 VE9DsjDiJHqz8X8vvKZEgkHCq3do79cnemKrCIdzkN/XHdYa3/hPwpF2Vpad34BbovsDBkiJjkg
 Nubtx92IfuXpMyTGfSA==
X-Authority-Analysis: v=2.4 cv=JJcLdcKb c=1 sm=1 tr=0 ts=6a312c2c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=9WZ0TxbkuCU3YGxODWMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113378-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:shengchao.guo@oss.qualcomm.com,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:deepti.jaggi@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:herbert@gondor.apana.org.au,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C71968E98D

On 5/26/26 7:12 AM, Shawn Guo wrote:
> Add base device tree include (nord.dtsi) for the Nord SoC series
> describing the core hardware components:
> 
>  - 18 Oryon (qcom,oryon-1-5) cores in three clusters, with PSCI-based
>    power management and CPU/cluster idle states
>  - ARM GICv3 interrupt controller with ITS
>  - TLMM GPIO/pinctrl controller
>  - 8 TSENS thermal sensors with thermal zones
>  - 3 APPS SMMU-500 instances
>  - 3 QUPv3 GENI SE QUP blocks
>  - PDP SCMI channel and mailbox
>  - Watchdog, TRNG and TCSR
>  - Reserved memory, CMD-DB and firmware SCM
>  - PSCI and architected timers

[...]

> +		dump_mem: mem-dump-region {
> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;

off-by-1?

[...]

> +		intc: interrupt-controller@17000000 {
> +			compatible = "arm,gic-v3";
> +			reg = <0x0 0x17000000 0x0 0x10000>,     /* GICD */
> +			      <0x0 0x17080000 0x0 0x480000>;    /* GICR * 18 */

Please drop these comments

Otherwise looks alright

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

