Return-Path: <linux-arm-msm+bounces-91633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EB5iJFK+gWm7JAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:22:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C79D6BDB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:22:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 24E903001CDF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 09:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA829396D17;
	Tue,  3 Feb 2026 09:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yhydb+Ff";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b1+GE8e8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C8D285C91
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 09:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770110541; cv=none; b=dDlTB02T8z5n93S799RsRUSNK7ojXg16Tj1+es5WbUjw/xYD/4YJkoD+VsoAUTQk+Cwg6sq39iV5X72gDTdWSNiizeSw9kDD8msTyOdUYihd5+VVimktEPsCpq4BHh2/OpyNpRBL+PWzTCIEBOZRWoZE5gmdJW600SgSrHQhK6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770110541; c=relaxed/simple;
	bh=gHMBeLhhI9GqT2ZLXL+4oMQfPXSPk2nb6lV6MrWhnsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ose7RF7h9BrJD06P5vY+wUaLJLKJs9FMCmYgzBXaAlhvDurGGsOXYO0SEtQnFfzIPPZh1Md29UiX+oxYhuGFSimunv8e1c5ZhVqb4OrCuGjMUEVuFaMAj5JVlBdZ5hs/dldo9n51JFzAUGUaPkkuFfkrB1m4k1qfZL5MitgzqfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yhydb+Ff; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b1+GE8e8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61365SxK2107257
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 09:22:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wkUSQO/8af2vGB0hL4ZD1UQg1aLOCt2SKKbsaQnjmAQ=; b=Yhydb+Ff1VoAthyr
	2c77O3MchnNjZ4Xed+kSMtvJ6dI1NPk0o7wrIglvTzGcZuwOhb2mfZo5IM8pfjGo
	n5M/PDKbz68ICo+oaR3TnfmyTqt2CcKP0o7rhFDJsHh2dOstUgz29+uszAHyAJbq
	rUzVgegr6Xx+zBsbe/2Kk9hH9Bbf3YedwxB9Z02MsHwEq2QmqhFgxz9gzvQXNxta
	ttKiI8z3Jwykc1yWAYOdwlTkocf9/CsXams4th9jeM5pVSUYuqgWhXTuI6+sGytF
	mmW/dnK/o8JufubzqEcPnthu8FJOQiM9+Lvq1SFt3tlPAtp57XVWqd8U/rsbzJqA
	qsZy3g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2t5ebvts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 09:22:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6b48c08deso107216185a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 01:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770110539; x=1770715339; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wkUSQO/8af2vGB0hL4ZD1UQg1aLOCt2SKKbsaQnjmAQ=;
        b=b1+GE8e84mFGRej287tDsh6NcaM54ANxvm4wKAJRYlkZ9Ff4m8sqxoxJm1Y9k9JFj7
         B0UXYqIUUI1U0o6ibLj/y4aHp0jMNGtv6eM5y1rVffiUOAUoY0aUrA1JK0WrT57j5qX8
         vA/9Q1IgwW31qDAGsHSRsyHA+9m1S7XgKk5O75rp8d65s0NZsFS+65OBetX4Gp/NWam8
         gd/EBzHNjd4d7AnZsvB2HjQCUWA0Pagh1D7REk9mDY7ZqzNCdIS1iht0vtmxxKWrj0gP
         zeuL3sNX3kqT8t7a8meu4g2yx9elIAFOfQBhUjAZBaoXi2rhCRV/7Kz8bCxsKwkVvSKi
         DOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770110539; x=1770715339;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wkUSQO/8af2vGB0hL4ZD1UQg1aLOCt2SKKbsaQnjmAQ=;
        b=JkDEZKcWmeeWzT95KriNcqyeWF7vCpPLg/tQPNBgHLNsAtFM7PEbnIMtqiyX613LGy
         IUG2pRqyQbsQbVnx1JIAKVCJ2mTAe1c8lUWPEY/yKaBp1HtaWMAG/rtmSh/+ZUf8Y2Aa
         qb5/fuxedrxzmtNIGKvaOepypn7KHDm2omAncS5IwR9AqZLmYmTj2MNCZjuH6+RPVCU9
         GPHGQU6O8SDNcuwusFJb8/61GodplALsXC3he5oE9nQDxv33qrx+l8lasz5vysJW0VQq
         E576qv6rdveCYvvxaLc8RhAgotvuAe0pCN3f8nLkwVmxf6p7wLZTL34Uh3G5GwR66ghT
         ndCA==
X-Gm-Message-State: AOJu0YxwPPKNhk3U7oK/6zpv9+9G63heN5MR/DcSJPn7qHgtzUBybuBs
	ygzuka10Mu0e2Fgf1dvFNfKupuDtuWUWO1xTXiKqrjLxUeF6XN5Q58yA7nCnA4wf+TKGVq8wzTF
	kgS2Dfs61Uk+CxgnQ7hD5/Pj52hvnk6mBxtiU77TdJS/EbUyYFYcu3lDDBXq++vGJz7VX
X-Gm-Gg: AZuq6aIjOECfqSnCgC3RPf2FUPLYfont+DJNXT9HwAgu3PD7My4ggpwzscC9r/n8ktd
	TJbStGZWYPiCVIBrbcM2jMbLL7W3ZA4OpbpVG0uNY3WlW8FmuY42ycVMfjcCMwS/K8MX8XaOB6b
	WvO2PA2cffZ36PaqOKZQJCSKjjjw280FSmwWy9S1tt9bw9kA86eTaMlP0o8SJrInEiB2niyb/mD
	v+VMi+8NDyCwNaSTAbsvA2jV2yBBY2HcKue6sCpidKXoexn/Xv4rkHmbr0MPxG0JoTh5px5Re0t
	nOZizsDiJdIvCbQ/OlytlKgSsZSkVR2vcC49PKmZ1+TZy3er2zElxVl/ytKJEw0cLP6cODWRTXp
	EUSWyzWIF4pZDsIlN1bWv00ZMjHqwEUTqkSquadR+phNGFVkFu6naSPC8//+JOmQzBSc=
X-Received: by 2002:a05:620a:4441:b0:8c7:1156:efe9 with SMTP id af79cd13be357-8c9eb35c797mr1395114985a.11.1770110538947;
        Tue, 03 Feb 2026 01:22:18 -0800 (PST)
X-Received: by 2002:a05:620a:4441:b0:8c7:1156:efe9 with SMTP id af79cd13be357-8c9eb35c797mr1395114085a.11.1770110538472;
        Tue, 03 Feb 2026 01:22:18 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2ecc73sm1017985966b.62.2026.02.03.01.22.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 01:22:18 -0800 (PST)
Message-ID: <d4907b57-ef8f-4357-804c-930200f57c35@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 10:22:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch node for PCIe0
To: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260203-industrial-mezzanine-pcie-v2-0-8579ed6bf931@oss.qualcomm.com>
 <20260203-industrial-mezzanine-pcie-v2-1-8579ed6bf931@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260203-industrial-mezzanine-pcie-v2-1-8579ed6bf931@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3MyBTYWx0ZWRfX0JowSpq0fcTx
 hU8evIozCSj7djs6IR1KGigH3WeRAibsup0YMaBGyOC1nCR0ucKRR74TfjfvwKTZYyFDz//Wy1D
 u6s7zHaGnHPmTYSFX30cIwi1020qG39PDtaKftxMS+CyU4MgQ8/3bzPUGTRMKQsJX08PUea1rfz
 bprUCyJDRfbf40DwUM3EQlqpBFaMSwIvdKzrszQDyAPnX6oxyxm8y1cI2hoqPKcpYE0gicyA3Qt
 /+6CmKkrfE24ANznKJ1ENhwNTruntp93wxeEVxSCw9WoG1rgz76GbPYR+iXJ87Dq46ErVLHo1wT
 zpGVAueIzJtoMf7dOTzAYa1o+GnB+lCqD+ty06vVaJotOgxnus1+xnUn8NgZp3w27MWJ/esJBrs
 Ah5rAQn3m0ms2ZsniEGpKYTwJB33mxFmFHqujbDgQabZK1nE/nZ9+l6LNNNTQVSR8UWsDRYJSIi
 AVRyqvE4/XHZPCmHd2w==
X-Proofpoint-GUID: wTL26avQXOUYrWfqWqijbm8OFYOg9JbW
X-Authority-Analysis: v=2.4 cv=NOfYOk6g c=1 sm=1 tr=0 ts=6981be4b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=qSWERiRezZrDuvaUYp0A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: wTL26avQXOUYrWfqWqijbm8OFYOg9JbW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030073
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91633-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B5C79D6BDB
X-Rspamd-Action: no action

On 2/3/26 5:31 AM, Sushrut Shree Trivedi wrote:
> Add a node for the TC9563 PCIe switch connected to PCIe0. The switch
> has three downstream ports.Two embedded Ethernet devices are present
> on one of the downstream ports. All the ports present in the
> node represent the downstream ports and embedded endpoints.
> 
> Power to the TC9563 is supplied through two LDO regulators, which
> are on by default and are added as fixed regulators. TC9563 can be
> configured through I2C.
> 
> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
> ---

Largely the same label comments as in patch 2

[...]

> +&{/} {
> +
> +	vreg_dc_12v: regulator-vreg-dc-12v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_DC_12V";
> +
> +		regulator-always-on;
> +		regulator-boot-on;

Nit: please move these boolean properties below min/max-microvolt

Konrad

