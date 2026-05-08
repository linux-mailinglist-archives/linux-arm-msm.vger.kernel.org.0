Return-Path: <linux-arm-msm+bounces-106697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMGNG6Xt/WlJkwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 16:05:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1049C4F78CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 16:05:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8B72302ED7A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 14:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DB993E8C5A;
	Fri,  8 May 2026 14:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A/sY6KHY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RAgxulmI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF753E4C90
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 14:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778249027; cv=none; b=TQQo4dHaJMlG9A1vQCAXWR1lwA892XeAWi6KRze2D90wzGZrCCjrdDIeHrVZJoPuIkTq9kxb4W4mRvLKmZLTsnMKlILTi+MtUCuDxAq+aN5mjmK/M0FMT1Xjf2h+TtXcYjMmg/PkQHiKG07qdJiVASE2EE2xmVVOXtJb/nvSODU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778249027; c=relaxed/simple;
	bh=tVLN9H4wXbxCspwoH2tS6QtKKtprn15Te8BRG+V6lVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AwepEHB7jByWmHPFhh+aV3TM1h7eSEKR0468CdGfzXgc/o2ABTvna6JvG48tT6UPo/1W3BpQzBeoAp2F6qognqLQ1VWt/+nktNITaUp+6pJb0G6fuzxyYCFdfWI7qWmq4V5YPcTU5omv18dYLn9afC5tFgBRNM/LBT60C8TPTQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A/sY6KHY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RAgxulmI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648AaCgH2531551
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 14:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6PaLrzZ/Tau/BNFGUX9KOBZJHsqcYNs5C4hkDbabRvQ=; b=A/sY6KHYIFcKhS94
	NhiWomB1DvClA0fBtyGO6SgZcMfBuYQ50w+MPtem2yUW8HZxGwFdM22iBWMXYWEK
	SPLwfIZ7yqcelZQLTFFzBrIEfpTVEPX6pSmM8dQ0fLc77cdDpBzRCkgOnUQXs5xo
	hrvbnHXiC1I2Yf+kaO2ruFaVnrfojf4/+Rk9k5No29B4iwKmlAjb0mIp4lYGLjHK
	jMfMZHNnUXlr1+m3x4NrTHDxRXBgOprkfUICLIXLX2sj+tPP026KpsDia3MPJNCK
	C102f0AIeG6Q9UrWboM111YS23g0oJyYeng21kCsv3dqgcJYLEx5N+4tbmCl6Ftg
	KRL3NA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10m9ut3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 14:03:45 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7dcce2935b9so562624a34.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 07:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778249024; x=1778853824; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6PaLrzZ/Tau/BNFGUX9KOBZJHsqcYNs5C4hkDbabRvQ=;
        b=RAgxulmIV9ITf0LZ0rgjIy+Y16/dkHdgdyAIufxSZKriKDoKOSsmzlbLh+ncsMyfio
         l+MkwJ/xTaIFblmmAnw5HzLRHeHxPnibebOXl+2N7NVvXFR3VK10pfFCWw4RlT2gYq1s
         5+eCTX5FmlTtX67Lx/eY+cTysulXK97B1iSDWTEbDH3N0BU3Sk5nZ67bny/eY6ssvwcS
         59Iq636N+RssjJhBRVfuZ0oD5jGmdv1YJZlIqUnUrcCruRlsvnORnrRN5pRlhc9/TR7p
         rVcUmGhMnJDaRalPmFgb3ngd0aailqCqqzWokZh2QlvE7/x8yJ3qvurDNQM0WxuSkXYM
         fzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778249024; x=1778853824;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6PaLrzZ/Tau/BNFGUX9KOBZJHsqcYNs5C4hkDbabRvQ=;
        b=HLNgMyfuzyE7+WIaQQDjrZqMtz98xsLAFIdxImzpAZIiS2s8fuo0BWCydGNy2CIAa6
         +D9CKSSBnjhCNAP2TSewex5z+tLPsTDigTSkqEI11XBNb/yqyt3XwrhguwEqYkASYq56
         uJb9afaFZtUQvDTDSOcR3eEP/oPLT2+a8yoxmY4QEAls/a0QYGK3ZIiI802cqzpHoJRu
         OyztjJtFKEcMXoHpY+HlBGqMkD/e3gM8EhjaZrJ4y8ojNRT1XRtOFs2PNlFTSKFMsaRD
         8rg+19nAFQyGkNJwq42/3TQUHtW+b/8Ajc4qjweALkzArh5U6JGfcsZejYUMhCGAdnjX
         mwVQ==
X-Forwarded-Encrypted: i=1; AFNElJ/kPYTv2pMxTd9pHp4/RkDPd12nnraM0nGeQccPEzFLCuiz6mRXVp88wclOV+BvT1Lol2aSWA90HIAsi2nL@vger.kernel.org
X-Gm-Message-State: AOJu0YxHaVuvLU3AbwOZlYpSEgp/PGmRFQID+URitFjgph+J5FbZa7z3
	osOEJNTuDzItRRRb1wlNZd66C7VkJRi0LqyqOzk0XQ/miRtPOrElVUgaRiKM3fUyJ93Fgl7Hqvr
	HKkoyDLHyMka7pNDQfYCcIV7Jw6ArUum3Lk9arTRSzolvtnuTcoST9vNAr7v8gB5MHU98
X-Gm-Gg: AeBDiet4L0TvlD2e7v004swDZugnuT2CQskcVIWExZm+hZenh2MQl3Sz8e0MaqPbhRN
	OAyDKxGZhSvo7IXGMRd6U4+PSMkOlOpNJloUp8WRnsPj0TSHlLXn9rQtXo1Rzu+L1MXxst7JVJU
	P6UAVLMDaSoYbsVYHIofU1TJcHna1r1wE/iHnQM9VNSXq7onDCx/Wb6nFyks6COCnYobxVn3gbH
	+6nXEdmZEMLSjMHOj/xFOQPfZac1SwelK2b90T/0LfU3D/bB57a/uVhwZxuHXTSXbrB7QTrSmeY
	kjJfTIMnBvoyPpaTKGerqAaHugo2waCR0WkRvgaWp3ZcyXiCN8BAig9JldxRzGXchMEjYYl3DTp
	jaxH3ycCso3xkZMECFPj/VR0Stgy7+1n6kS1mg9RPX8GO27RQ/no/zfTbNnFEm/+jtUxMgB0q2M
	VgGSA=
X-Received: by 2002:a05:6830:2b29:b0:7dc:c31e:7823 with SMTP id 46e09a7af769-7e1df018fc4mr4435656a34.4.1778249024146;
        Fri, 08 May 2026 07:03:44 -0700 (PDT)
X-Received: by 2002:a05:6830:2b29:b0:7dc:c31e:7823 with SMTP id 46e09a7af769-7e1df018fc4mr4435567a34.4.1778249023494;
        Fri, 08 May 2026 07:03:43 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4358cedsm87169366b.47.2026.05.08.07.03.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 07:03:42 -0700 (PDT)
Message-ID: <01d6ea18-e022-41c7-a642-ac0321957923@oss.qualcomm.com>
Date: Fri, 8 May 2026 16:03:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 12/12] arm64: dts: qcom: qcs6490-rb3gen2: enable
 TC9564 with a single QCS8081 phy
To: Alex Elder <elder@riscstar.com>, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, maxime.chevallier@bootlin.com,
        rmk+kernel@armlinux.org.uk, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org, arnd@arndb.de,
        gregkh@linuxfoundation.org
Cc: Daniel Thompson <daniel@riscstar.com>, mohd.anwar@oss.qualcomm.com,
        a0987203069@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
        boon.khai.ng@altera.com, chenchuangyu@xiaomi.com,
        chenhuacai@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
        hkallweit1@gmail.com, inochiama@gmail.com, john.fastabend@gmail.com,
        julianbraha@gmail.com, livelycarpet87@gmail.com,
        matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
        prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
        rohan.g.thomas@altera.com, sdf@fomichev.me,
        siyanteng@cqsoftware.com.cn, weishangjuan@eswincomputing.com,
        wens@kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-13-elder@riscstar.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260501155421.3329862-13-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VltA8u41melPCECydDMY362Fr-b9VP-4
X-Authority-Analysis: v=2.4 cv=VP3tWdPX c=1 sm=1 tr=0 ts=69fded41 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=ee_2aqc6AAAA:8 a=lW0hg0oAPnnF6MRRTAsA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE0MiBTYWx0ZWRfX/IhrdlTyiJNv
 umBikYyad45aoxfKIJTPn2iItwt8fi7Urv/v8rzvji331i5w6/rWlTJx/FjH2nZxo4Rtr1nuBYT
 bRyDGAlm5YayMfXIlQUyhJODFfwKrZphlBNl86OH8U3PnYZpWo4rUyBhu6cHjKM2sx5m8t7gSS8
 4pzlFMTf2mNTkxuB8e5uHU74I4u4FnEicnI5VfTBBaQiYp8I0gDpGdSYQtkkqGBCOkZqOlmpd1W
 dppOfkbS6bL9BTW+BSiRvfSupsMj3mUBwDgYvDgvfReonCclLVbs/rATF4oE1qhUOj9iTPCVaZ0
 cFEEKPKYWDG4pPcUTZo3fteeSKrVkhouJvnKsUAgu5WndiyPKib0c7OL1udAQ5MreRV+FboqU8i
 43tJVmycCJSX14C2veTL6Z9C0jvyB2IfN8uARrUpTTglOod5+EQHVjKCi/y8XlujIMI+toYtRqB
 T+3qXFi+K3ppYaBKFrg==
X-Proofpoint-ORIG-GUID: VltA8u41melPCECydDMY362Fr-b9VP-4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080142
X-Rspamd-Queue-Id: 1049C4F78CA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,kernel.org,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-106697-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,checkpatch.pl:url,riscstar.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[50];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,kernel,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/1/26 5:54 PM, Alex Elder wrote:
> From: Daniel Thompson <daniel@riscstar.com>
> 
> The QCS6490 RB3Gen2 includes a Toshiba TC9564 (a.k.a. Qualcomm QPS615).
> TC9564 is an twin Ethernet-AVB/TSN bridge with an integrated PCIe switch.
> 
> There are multiple builds of RB3Gen2 with components included/excluded.
> That means whether or not there is a phy attached to eMAC0 depends on
> the exact board. However all versions include a TC9564 combined with a
> single QCS8081 attached to eMAC1.
> 
> Add properties to the existing PCI nodes to describe how the TC9564 and
> QCS8081 are connected to each other (and to the host SoC).
> 
> (Note: "pci1179,0220" is documented in the "net/toshiba,tc956x-dwmac.yaml"
> binding, but checkpatch.pl doesn't recognize that.)

This should probably go under the --- line

[...]

> +	qep_1p8: regulator-qep-1p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "qep_1p8";
> +		gpio = <&pm7325_gpios 8 GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		enable-active-high;
> +		regulator-always-on;
> +	};

If I'm reading the schematics right, this is only required for the PHY
- is it collapsible, or does it really need to be a-on?

[...]

> +	qep_irq_pin: qep-irq-state {
> +		pins = "gpio101";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;

There's no pull-up onboard, should we use the on-chip one?

Konrad

