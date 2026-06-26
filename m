Return-Path: <linux-arm-msm+bounces-114689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Pc5/Iw2XPmqhIgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 17:13:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F078A6CE5ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 17:13:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hVigOysL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=A1lGs2K8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114689-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114689-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 422D330B75A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 15:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 715B137B417;
	Fri, 26 Jun 2026 15:08:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4A637B00C
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 15:08:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782486516; cv=none; b=akRPuJDt3luwyyjOhLhj9IUB3jLxn//VpOUwp9Uo3c73Fqnhl5h4+P8W97vNqT3xdPaktQ8yCEgRCbOPVTlOTuHLpkAAqy4/blsjnCUfF92zlLfxgeQ+Fp+vezzuqe5hm9fVKML8IwU19jdAliv7VH2T3w0+wjbAEvspqqKQg9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782486516; c=relaxed/simple;
	bh=Ti9wZcdPmQ1luO/G6ZLLTNu7JKd8+Ea2ubScJ03pS1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DrhJr+2mpl1XxLnqF5BermUWI0fHO2jlT4K4W1wgqsdh0ef2pvFY1vPqms8IVL4i6nJGaP4uQ0Zq/10MO4B8AHCWO1Ic8uR9MvuCRQ2K+3fDI93N42X6y4aB0xhCasCd9DsBkM2AHnH+CEGYOtlnGWrQlWKqa8CpVAhSkG7Ij4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hVigOysL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A1lGs2K8; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QF43vQ1150819
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 15:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8WCBLywKVM6L78fgzdW46De6pJpcR7Z/ugCxGfOaJvs=; b=hVigOysLV6oqACZ/
	sEvTFB1/oUfeOu8mEJm1e/ouH1jRKNQuy18jMAUomHzIQ+W7Rvfv0Vs/82bRZGD/
	cB8iI9cST+uJVt33bVUq9DFanM0mshWuq0FOBhS9e6+00kstSJRzsKQGYd3LZLyp
	3Ngy87Tf5VaVj+LmWWUi0VjDmKBNVxgb/7NyZFQrbuD7VtqJPg8BpmTdUtOxknyb
	MZtt2ZOJLoPQvRl0YBmL1XBoPx09NN0E7pZhV9Nr3nGSGMV9jfr2LOlh/XbP6d6o
	lnkxn8gLn0BaQuSDQSgVMWN6qA27uESdLRgk/r9R1UJbgz3RG/nr2l7aUEdcX8BX
	U3LNgA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fgdu0cb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 15:08:33 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-73580bf7bacso29598137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 08:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782486512; x=1783091312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8WCBLywKVM6L78fgzdW46De6pJpcR7Z/ugCxGfOaJvs=;
        b=A1lGs2K8Z3iE03nc8Ep9esUGttWFgHDUEutQDrrzOAFiPFRlnJrHSj5XKyLYJdWu92
         tapXEPA1dA9Xyn8gPvgmqX+cHk70A/TwcLfPm3k315rzPHqpLogGwazyRsRckviIjSte
         OCwyFe31qbrhC6CLgqKITWaQYiOgZ97rniNX7WnFh8Xfk32c8f+cNS21EXEWfmLIlA5b
         A/bSan89WNm6+siGCXkHk0gXLy7EcvGqEOBKCjgVWbUXTYuNDOG46yN5cyVA/lLLKUbq
         A3jGvb9lV33OvKdkF8/AHQMuycSeNR+TRnvXZhRaVkuzpjbPVegdBujz/3ZuPhYLsL6b
         rJYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782486512; x=1783091312;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8WCBLywKVM6L78fgzdW46De6pJpcR7Z/ugCxGfOaJvs=;
        b=QyiwPMotLh81tXGSIzGyFvV0oCSsvx5VqK2Ml8F7hKyMSL3LaY5vZWl39gQCXwVfLU
         VRBugvJE0Xb0PdTojIWkZnmIDt1qtWHObvz0tTfPWEbLvDwhPRa9aQq1haHGGehG1CRr
         GrgbXobSVDnNHjII9B/vbHwGxlxZoA/DRAHsJekGkJiTACbWq0SuZjBnCBAhWJPyjpqF
         RrABXnv3Olyzwr511PQrzgzzc0V2AFPRN8ABVfD/WKvZCLLz1pbQvIHKVNgUQ45/4XVm
         fIdORJHtJ7snGjEpmVxezGyU9vZeG5Te7fv2PaaKvaJjIzj98sYSMuo8iU+t7uVaqg4d
         SNKA==
X-Forwarded-Encrypted: i=1; AHgh+RrdiJHyRNR3Rofp+xknx5a3CqyipQrMezurVI8lEGa5FaNb7cDxvzoMCFKAZJNXiDBBdbzKudMXzyT0vXpD@vger.kernel.org
X-Gm-Message-State: AOJu0YzWaWs0rIIvzN3Q9ugNkxp1xa0YhYdd8eUMCkpEwnaGQGeCn1XP
	C4yK1lJTGhfBEKVPRYVPu6S7FmK7IvghD8kUrsJQ1K83awFLu0OnBNcL1OnmioxRyAQ0+UAxSek
	CpJrXQwg6uwDUlQbHQOr2Fawo6YcNg/cvhjhBZAAau2NkLP9i2XlNclhGJOkUEP20kAag
X-Gm-Gg: AfdE7cluy/gJMeKOh9ODGD+wlBeg8EDS2WKsxLLR7a4Dl85XjrNCyfs7R0GPmthVHsk
	s58UyDuyIey0PBSDKXT+L5Qy5Jdd7QJjzp0AtsoQ79HV6UBxnusX6sE3Yj1UB32AsniR1fx2Gkn
	ObN5+QaizgF5BlybBlJErkoMwsaaUp5VEImQ9Z4pnpoN/dmY2zQVYPmGhNpIbOKgxMJRVlm5rFL
	5fLoMbxIrMgUdcfF6L4xUZbgT+xB2LkAbxGVNeI3jLb3T6Nz62JyRpviWtiCdTliKpgrJwnLuA1
	W+qq182KwnPxjZwETCUaD8Vqg525uGqgpTmuT9c5wQz4eD4zuyuwwbz9fqXuEy7cvctAOw/gMy+
	hKA9G+vViT9K9wgHFOfkYU+l/7CVBEMKUOTI=
X-Received: by 2002:a05:6102:424c:b0:631:267d:157b with SMTP id ada2fe7eead31-734366c92a8mr1199059137.5.1782486512420;
        Fri, 26 Jun 2026 08:08:32 -0700 (PDT)
X-Received: by 2002:a05:6102:424c:b0:631:267d:157b with SMTP id ada2fe7eead31-734366c92a8mr1199052137.5.1782486511997;
        Fri, 26 Jun 2026 08:08:31 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999b182a84sm52287371fa.32.2026.06.26.08.08.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 08:08:30 -0700 (PDT)
Message-ID: <bf7f9caf-8ab1-4420-be4a-b2949c17088e@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 17:08:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: Add IMDT QCS8550 SoM
To: William Bright <william.bright@imd-tec.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260610-imdt-qcs8550-sbc-rfc-v4-0-358e71d606bc@imd-tec.com>
 <20260610-imdt-qcs8550-sbc-rfc-v4-3-358e71d606bc@imd-tec.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260610-imdt-qcs8550-sbc-rfc-v4-3-358e71d606bc@imd-tec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=API5kwXb c=1 sm=1 tr=0 ts=6a3e95f1 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gNcS5RXMAAAA:8 a=qfocr26bbEtc0TLUibIA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=VeqYHxXNbGx7SVBbL1V1:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEyNCBTYWx0ZWRfX7GEGjmi/DNu6
 C87EULbQ+NJsOfz8OfQjv0LFXzKyBQvDmZbkfibVLyDgsPlUVU9vdtTX9WFe2jjUhXR5KGXeCJI
 Tv7LCWHO7idy0G2EgQdP0N3j7wI4Bfk8upBh7CVZDu7/usb9I4WlYm0oKPxr1iKKGLQUS3S4S8I
 Pn0nty4GWyr4rFyja3ene2CJGgbP5xCx/EF0jMc3nSG3Wv39Ya/A5OeHtV57KXygk/J34thtf+7
 H/uOZ8kR7mVMT0x1q894CJlWPn2V4wg4i28amjwcdQOSlg3Nxbkr2Ho1RGM95Q8sfIXaMgXyqy2
 X8oxRdLJCBXY87iuIqAIf/9JGg42tFLKe3YkeWHxdLtgJVpBMHTN9kiZVZQKHeZtTWO7WelnE7X
 KfgFuiv1P1IUQiTGi2etwlgg3LnB3vC2IJomx+ulHqATW9b5rKYKfLwOnOwvTacIdLSHE1w3BQl
 Cbaoi8n9iaS3Cx/4hDA==
X-Proofpoint-ORIG-GUID: odpaCjlzNSuZPqDq0KRGV1RWmgItwlUJ
X-Proofpoint-GUID: odpaCjlzNSuZPqDq0KRGV1RWmgItwlUJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEyNCBTYWx0ZWRfX/VBDXTLjBiWW
 2u79CFSiqDxL1gTQCHGlwTUtWBZUnom8jRWiktfYjuptBbeUyxIv4mfzNQddDu2KrcTuNJKBoDe
 U62HxmSCWGSlv2IXxTU6qAWMYlb86UI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260124
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114689-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:william.bright@imd-tec.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imd-tec.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F078A6CE5ED

On 6/10/26 10:57 AM, William Bright wrote:
> The IMDT QCS8550 SoM is a System-on-Module from IMD Technologies Ltd
> built around the Qualcomm QCS8550 SoC. It is intended to be soldered
> onto a carrier board that supplies VPH_PWR and exposes the off-module
> peripherals.
> 
> Add qcs8550-imdt-som.dtsi describing the SoM's PMICs (PM8550, PM8550VE,
> PM8550VS, PMK8550) and the apps_rsc PMIC outputs. Compared to other
> SM8550/QCS8550 boards, this SoM excludes the PM8550B charger PMIC.
> 
> Assisted-by: Claude:claude-opus-4.7
> Signed-off-by: William Bright <william.bright@imd-tec.com>
> ---

[...]

> +&pm8550vs_d_gpios {
> +	status = "okay";
> +};

This is already enabled by default

Konrad

