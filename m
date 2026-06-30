Return-Path: <linux-arm-msm+bounces-115402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pPVLOC6yQ2pMfQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:10:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AEA6E4030
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:10:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CWsZJXTk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WxOOiySw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115402-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115402-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 81AD83001597
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65C2840803F;
	Tue, 30 Jun 2026 12:04:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD193ACF0B
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:04:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782821082; cv=none; b=iNaT0h9BwzQMsZtJZP4PjeIVMI3ap4+zVoH/jshUtNZ7LMOdceX97KG7KzZP0cTKFVaUJIs+XP9tIymXLrSOr7Lvb/zuGTChCHICT1Pmb3l94FE4OG9xOubOhpHzl7tG/+2RpJL9Bgvuwfd/6EGACmzkq6VxdIOcSFcVJIQE3DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782821082; c=relaxed/simple;
	bh=2u1+1s3LllqRcXvrtwNyjdlEgfbYJsRTb31iaSqge2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LlhNLF+gEcoQ7lWD6ldSilDXNJxXxmeTY92OU0MUfbfQkPMJwj4DPnXtuYNh1XsPmWJB4F7Uo4sYlzIcJb7bHVhB0AJd6n32mhUx/SQfRhgdDnsO35XbVt/kMC855OwlbC2prP0fMAOmSjMMXWUkf5ERO7rUxcg4FnPeXhbSx20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CWsZJXTk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WxOOiySw; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n9p21605922
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:04:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+30fU8u7ebAIK9tBeViJ2CQuNZoM6yp3p/ercnVPPxs=; b=CWsZJXTkef4pdvqf
	/qcr9ap24auSylx3VWie1K/SBvMf/FR5e6y7HU8IW1CjtyV8tdul0A3Z4ceflAk6
	P9t49NkyHdUgaireLYNO+hTILgYoRzdcCbT1Nyx4y2kWEJEO/eGaFglp8gUVA2IJ
	B249ZMHzH5a//+WjzYjy96Yr0urhYHGvE/B2u5RUwUBiVWwRx60K5Lix+0ff0KUd
	yFrqTF42FjeCqhETRjfbiQKcQCNjhn11JauCiyzvSPbS7qgolgFoiiKSeDv65fKP
	ro0EcieAT80Vwpk0jiSVnyiovwVYW/lE0C2lSTEMEz7krTW65ybkkfCxYa9ob2X8
	VM6IhA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f45k5t7s4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:04:40 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-737c728b37fso96529137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 05:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782821079; x=1783425879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+30fU8u7ebAIK9tBeViJ2CQuNZoM6yp3p/ercnVPPxs=;
        b=WxOOiySwmKc85gI+5m1Dj+a+XapA98t+EsRkUfEbLf//HyxmySViNA6ldoGyWEt/Bg
         tTWwDULrMQJo5nQmobfIuWFQAqUy5pYoDWrFP2zibuRncygS7YFSlkIZdZKucXTtDdBx
         5EVp7+Ep9lzjFOoRnW/GTyrBihQOKLCY9vm1gW5NLjdN8TDMRtwJ4zfaBJa1VXitxKqO
         gI9PzjQrv+2IGXhMOgl92GjPltBbnVEB2KARXoeKvduCq1i1OYgrQWaeIWx7pa48g8Tu
         Q3fS/Idgcr5UGXFYGBYZbog3By7FwFaP8KMyrasn1DxuBSG+ExEI3K2SXNCx89fzm4nq
         oqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782821079; x=1783425879;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+30fU8u7ebAIK9tBeViJ2CQuNZoM6yp3p/ercnVPPxs=;
        b=acP1VSnLIF62OlhKVEAJXZvdlWvQZb58QhO0CvOuEy5+8FGxRBCSrveSo0QIkz6358
         NXjWgebh3TJkWDAO/HFKnH6zvdUkNp8mQELwfGzPdUTyOQCu8AgugURJwC6i+aB4+Ugs
         IsKqeslPrZ2FB0zhNiPkQMmxvll8Ja2LETrkqF50ouIzXcABPc3k7XKUyQi2dV8dK3sy
         Y5Qb6+nuWoTpR0N5afqt371wLo4K48I12MeI5+TjiNLxgTvp/F4lzL5YkevO6/kMhja1
         6dDyMU3AO9+xdaFG+n9emmM5T+SqlztMjF7y4yIn9FKUfdHp47x2TO+NQDSA0EP99CrP
         D+SA==
X-Gm-Message-State: AOJu0Yx9FtNkFPJeSUIkCwDVUbPPew7FkRvevLhg16mIee/ykY6pHEHC
	VeaGML1boTXyJurlu4mmYl3MNBCEp2LTwAyWUHcXhh0v48AiyxGuv3nozP44GcPllvjaOF5Fr+E
	RBAkxaBUikyw2TK2KNsAqPqioW23E8rjySxD5Iq7eAsg3F6Kt8g32uB/zWLVtYe9AIN0q
X-Gm-Gg: AfdE7cm+om+YZSdYPxatHufzLM97kElQtPtlr6Lk6/ccRaC5LsKga7Cv77Oy9l4IEW6
	1/omoJuac8C4rukqlkPdY2LuyCDTGbZE1CciykAwiwOCUuzTa6PwSiUSiwkdwuxDoNqKqnKJs12
	39AgrWQ0M7ehLw6uZEMvCDX6laWQgSfFTjFgN7OKs1NrSNjttsy/pn+CVNhWHiMUUyhbrmDI6jJ
	N8FT05Uch9MIL4778jwISVDlvnQ0Cmg2/fNR+yqc840YHfufbGIunPCT+s3ZW/5ulFyasdgU54t
	BVqj7YDKWB+f9b8GK6QsdbDz7xgrZVJPovkF8tfTDQtaL6GK88iCpmANMOxVjfR/CIM3qnjoKVq
	nIZnvTDyHbQeEsnpNgrC8jmEgShWhe5RwIH8=
X-Received: by 2002:a05:6102:6886:b0:738:8d0f:72a3 with SMTP id ada2fe7eead31-73a3853a35fmr562315137.4.1782821079604;
        Tue, 30 Jun 2026 05:04:39 -0700 (PDT)
X-Received: by 2002:a05:6102:6886:b0:738:8d0f:72a3 with SMTP id ada2fe7eead31-73a3853a35fmr562301137.4.1782821079207;
        Tue, 30 Jun 2026 05:04:39 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c3b5ca9sm1117702a12.9.2026.06.30.05.04.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:04:38 -0700 (PDT)
Message-ID: <4571c6af-2a5b-49ac-903e-b158d9cbad16@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:04:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: lemans-pmics: Add ADC support
 for PMM8654au
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com>
 <20260614-adc5_gen3_dt-v2-2-32ec576c5865@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260614-adc5_gen3_dt-v2-2-32ec576c5865@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AqDeGu9P c=1 sm=1 tr=0 ts=6a43b0d8 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=bnp5ujGDWJDzncnA5ckA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: nTMDK8k2lUMahGxW4jhhrzfZ--z7zG6H
X-Proofpoint-ORIG-GUID: nTMDK8k2lUMahGxW4jhhrzfZ--z7zG6H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExMSBTYWx0ZWRfX4LHu6m021nbl
 47vkwnbQVGYrwj5rv1i2U3QmhQRQzUm4XDbqfbqDz6JpSAASTRKMmNsPfPGJnq3iW7q7W1U1B+b
 leCJe6YnxNZGQVOOs9KnhEJPPGaFBGyMevgQhMYcQ/vw2a58yuDFt/tn+tOC1xdVxOe+S0vYRsR
 4nBHmv2ldbwg9hGu4TARYhn/Rw7xhD7SSUfhjvYREdEmYzKMavI4UVBd+3Sl5hnhAgowATXub6h
 cppsHsh0EU5qT0tYIKVQpoZKqb+kT9nLSqYzE/rpdfYVyryGR4dJWqPZlKGGf0GbSoBKmjjIwh1
 ZJUesIkERsykgyOxk6ePnv0lyeevfkaObyAcQld+0UBSSeryIB4jyAGD0lrl0jpoHrxEUxMYvta
 +GsZl/U679n9RuVsnp5hkYHdwYcVzap789nS6EwfZ/QgHFeAb0yQrdcoMX2FSd3WWjBQu6Nq885
 Sctr+XhxP6dgGguX73Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExMSBTYWx0ZWRfX3k8Fl5oIrIKY
 pv+9R3k11MEn2wwVlJNC2RCgiZLOcvtCM0Sd0Fv6YPj9hzGPf60cDjT4VvgLUNNKG54KenM9ef9
 IJCq+XZwFe8+uwxn2peWvFTE3trXs9U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115402-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:jishnu.prakash@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:aushasre@qti.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B1AEA6E4030

On 6/14/26 10:05 AM, Jishnu Prakash wrote:
> From: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
> 
> Add ADC nodes for the four PMM8654au PMICs (pmm8654au_0 through
> pmm8654au_3) on the Lemans platform.
> 
> Each ADC node exposes the following ADC channels:
> - DIE_TEMP: PMIC die temperature channel
> - VPH_PWR: Battery/supply voltage channel
> 
> Also add the io-channels and io-channel-names properties under
> the temp-alarm nodes so that they can get temperature reading
> from the ADC die_temp channels.
> 
> Signed-off-by: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---

[...]

> +		pmm8654au_0_adc: adc@8000 {
> +			compatible = "qcom,spmi-adc5-gen3";
> +			reg = <0x8000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <0x0 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
> +			#io-channel-cells = <1>;

Same nit as patch 3

and only now I realized - s/interrupts/interrupts-extended - this is
necessary for !Linux, see

2d5cab9232ba ("arm64: dts: qcom: sc8280xp-pmics: Specify interrupt parent explicitly")

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

