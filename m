Return-Path: <linux-arm-msm+bounces-113222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n4pbGsQiMGqxOgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 18:05:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5190688163
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 18:05:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VVD7TU+D;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="RpYK/q7T";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113222-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113222-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AFF50302002D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 15:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 461194071D7;
	Mon, 15 Jun 2026 15:55:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C103FF893
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 15:55:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538918; cv=none; b=Xzg3+c5nCfxXpmR0TaVEBgnxWST/q8XDWk633sH9oD2cvPOqGDiIbCUWLDxSvnVLwYlsKKiZytQRbmjp1rft6lBDnu7U1ttqW68GZadz7vS5ayCYOdOUBwIIkFBFJkBzD7Ja8AJeuiVxTEGqh0udtSH6Na7Xr1ED1ruyAoaa9iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538918; c=relaxed/simple;
	bh=nCRNN6CIdUWxU0TC0zPmBIGU88DS23T9rTmjY23BMuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UCyGftf0QF+lXbX2/FEvAl341WJQ+Q56soK21wyb/+oWHYCbe3/TLf9RaZSP2fvqPT0JL33luhE7ZjUy90JavLWWAYH9j2rBSeW0qpIWlivN1X/g4j3iRY5CkGEpCwFvbKT7SzckOvANLXZB6JYroHPQqJXTDxCHaAFGdSnqiog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VVD7TU+D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RpYK/q7T; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FFhYj9992042
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 15:55:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9mmPpVRAg1mCFM9/2ox53W3gNuvXNANQ6Cp0MI1ZH40=; b=VVD7TU+DcxlNGOUa
	LHIJWBy3TDYHlR/e72RkOCWkNT/Hh9dDv8W96P8DYqPnq2NTfXkeKEaqMS5ja99N
	Tqzr0RX6uiWXpM9YIAsm996j7skp81ye7tj7JUjz3vmK8O2IAfYKEPcHgvdmUd9W
	HY7lI6TnCf2XA8Bhdzl5TVEvOCN1lH6KZHOdnoOtRm0Icb5nZOnAOA2totvWAMAV
	Yjy47BkRFT2Uy3+UEu0ub4OQNtUTTfa94HK7ihsSmXYE5WocXUNVKsBCYSfJ05IK
	6cmRDfEczykC8fp31b6f0Fvb8XaohnM+ltgyHLi7K0q83vakcM0mXP1IPdY/3MNT
	WMxfWw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etgvhh2x8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 15:55:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5177b12d7bbso8210791cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781538915; x=1782143715; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9mmPpVRAg1mCFM9/2ox53W3gNuvXNANQ6Cp0MI1ZH40=;
        b=RpYK/q7T8uTZsCGFEDXx7AmUFeMhU3x7d59wlraPkkEU1CzRH/2ZSmWZlhLb2Y5l8g
         0jK3m3hgrNqD7y9+eF25hEZVD36E5L8n3TmLc+7nvQuIoawEhQTc+41W6aXggG9eGiA3
         88Epm0YtmlK+8hOESN/ZmsdQgJ4P0WslFY150vG9jAgLVVBIaDtrF4XXqRtmf8wULIK4
         m2QjvKxuJuPmBDdX9eY/qf92onkCdvMpPwFVH6G9DiufR/iKc3mlc6qBe75ppAmuYsO5
         yz1X4AchadtaXHIzAX/w7oYN9k1ZWM4FWZKiIbhnr88VPHhVR4i4samv0l7hiBBv75K7
         GCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538915; x=1782143715;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9mmPpVRAg1mCFM9/2ox53W3gNuvXNANQ6Cp0MI1ZH40=;
        b=LNhwEwz1xQzgt4XJKiEO5RhJfOY1NOd0T6j+iKxvH3CDb9IYFbK7w11CC04fDGk6I7
         BKFQR4vsQc4zi5bYiTfe9Ey4RBFEpNhYISiLyCvxXZlm/+5aNs90fJy+0Mlb0F4M1rKa
         3wJ0Y2mMZVk4zlciSnllk03ydEIveWu0g2xJu0uKH4SrvdYUjarOfCgVjn3VVVeGYId6
         fXl+My+0OsMwgz39zsN+wNwUwF+t+xsm11yDIq8yZ3p5jbrMa98v+YvU3ojXlh5WrQFF
         95NcPxkSpLklynbJzur2Jl+WPjwA6xthyQiPxfQ/y1zraSSoPM8F7xPiZsimEeLdnMhJ
         nF9Q==
X-Gm-Message-State: AOJu0Yw06Zj1ZyIKXTU8k4B/qGOtUWNWOgm00dyFBf1uBFJt4WXbEqgA
	hctxv+PPvxPLhtceXEQ7Dx6jxrVy6Yj9JBBrXkTPQh2g+eLwq7GI0A4xaphrwYruW0vw3kURZTu
	MPKK1tlNF+wcUqsB4IrvFIZ38gTWgKMT6tiq+EnCVi+RvVW5F+95Rr7MO/uc18ROq1gEa
X-Gm-Gg: Acq92OEnLBUL51b1DRFTOZc2K0+MPXfAxn3PaYu07IJGyakaQR3kUm3bIFk02WrtEpW
	BJtkfKWSIS6KksFLWsEyhHFyAsaDA5wyVOjJkczM7GD1Bo/tRC6eNhjGnlbjdqRck9o/6rhNYmp
	oXTBoDeL92Raj4t1iJAhwLR5b/4X8M3N6iU6qzV6yx/AY50lJC3/EuRcpZ4yn0UCO53kgrcLIQk
	X3UgIrj+Wbx9xKVPrBSFnDFmKcx9zk6XVVSFIcpASP9NutOI2OSRliS5hTSD+G4zMkleYhTLBYI
	fC87DnJ8LLctk5mcGWjI0kgvKgwNQL9oR6nTcMWzFHqvl+xJuDCjwK9vJtzmdCobKxyVzujcJlA
	1b6kYFZtsVwWuEY2o+h6Zf+s4zFmjHRbU59WOo78M//biZg==
X-Received: by 2002:a05:622a:6187:b0:510:144a:636 with SMTP id d75a77b69052e-517fe46d067mr136948481cf.8.1781538915283;
        Mon, 15 Jun 2026 08:55:15 -0700 (PDT)
X-Received: by 2002:a05:622a:6187:b0:510:144a:636 with SMTP id d75a77b69052e-517fe46d067mr136948011cf.8.1781538914828;
        Mon, 15 Jun 2026 08:55:14 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937949bcbfsm3731921a12.24.2026.06.15.08.55.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 08:55:13 -0700 (PDT)
Message-ID: <60170148-2fef-4282-ad68-f784e4fdfe23@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 17:55:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: Add header file for ADC5 Gen3
 channel macros
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <20260430-adc5_gen3_dt-v1-0-ab2bb40fd490@oss.qualcomm.com>
 <20260430-adc5_gen3_dt-v1-1-ab2bb40fd490@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260430-adc5_gen3_dt-v1-1-ab2bb40fd490@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE2OCBTYWx0ZWRfXzA6VrVxMVMc5
 WdMsbU/MSzPuVwGYlptLVD41G3laTHyfHaZkHLySC+U09eGkHghPTsNluhsY7Ap705XZqTPraBA
 Z/LuGTO68+REzAeb37WIkum7lym7aGo=
X-Authority-Analysis: v=2.4 cv=Zqnd7d7G c=1 sm=1 tr=0 ts=6a302063 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=5RUdO5zOb_ExAWw9uU0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: zGbmT3YzZUaS1i2YMjQ3R8Cv29MmLc5O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE2OCBTYWx0ZWRfX3NocCOS9hJgH
 bseqsx6GZ/lUUHw05Qzh/4x8TqXtT6uuCbRKvj3OFSeWeMusThtXQWNnULaKYgADKbItt2MY0sw
 6qJYlQQdNAu+ZwKq0aloOa9Y29Tm9CdaLD2DJ72XDVzJ2Dgg5zWwMpZdxxQgHziAwhbuc5wEnsk
 uh2csxTqCnWs6c2EVfjo01wnHqlUvDn6A+bqvA4mhRjEqMXI82HyG6hSkiUsqYRw4XhlCb3PC7B
 R7tqeHbpp7fqGoSGjupkhanTZfyx2Cu90sXakDla1ZKbQN8KnPVT6c+Cn1IUpnXZrkFG9mZf0gT
 E1REEUpZRqNEKKcGUSyeaDEubVoHp2Wln2AS3q/XqiP0csj/NFuB5DXA32PaSgnrjtYxqtzjG+V
 Tr/MEtLgsyFUYstgcgXGjXUnxJkg0DktZzNP6X4E8pyHjsBxXCOB7S2szysIp+sRNlUK4+FAtvI
 ZS9vT3AYjV6+PuumwWw==
X-Proofpoint-ORIG-GUID: zGbmT3YzZUaS1i2YMjQ3R8Cv29MmLc5O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150168
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113222-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:jishnu.prakash@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:aushasre@qti.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D5190688163

On 4/30/26 10:58 AM, Jishnu Prakash wrote:
> Add macro definitions for virtual channels (combination of ADC channel
> number and PMIC SID number), to be used in devicetree by clients of ADC5
> GEN3 device and in the "reg" property of ADC channels.
> 
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

