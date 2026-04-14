Return-Path: <linux-arm-msm+bounces-103104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6N1kDFIS3mkomwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 12:09:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D453F8719
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 12:09:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 907D930429B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E173B8BC7;
	Tue, 14 Apr 2026 10:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oj/89Ahc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UVDccFi4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DE33A0E80
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776161105; cv=none; b=NmdFEGrGkDDJRX2dbQkYJWcvUQgfN/meDT4uf8oE+E9YFsCoKCAd8fhLKoEQGc4xWFTcYllzV+ncE0AoRVEbe8b4kuMUdQzYZ7HHESlRcRlf/NcgdFWzKtqXo9ZIb/wwWTvmOcLh8vLSSxTpxbg0NGy9z6T5R6JU3ioo+mLs8pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776161105; c=relaxed/simple;
	bh=8Wx4Krs6AGxwgNFSv6fzfnOE9NXDgIszdipj5pZUQEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jPrNG2gG6fxwlqERyra2vL3Wkhc75Pojn2g+eid/mX8po7jjITX+XwwVnK5Z+US/tNRVFBGWPYNOKMjPpqoE/4luJ0ht7igjdnvBv7Ln+AoCw316qQQJFoJogfOCgv3k5I8RadTLVD9qfcVsYLZXAQApyNjbMGuGuh0j+twn0fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oj/89Ahc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UVDccFi4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6XZhG280857
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J7qBFKS/RQGm4G9FxW8wVL0yrqFmIaMojcREHOXJ4Rk=; b=Oj/89AhcnfmzdOz5
	4p86RIKyspBCZ7AvemDpQBpEuhCySQj61t5z7URF6HDiKI5RRd7prrfigHRIJYgT
	TE5QqohxMss0pdclvW+a68lq1fiwjBtLszb0alJmqNQCmQ0NL8rN9XkYPBI21x2x
	6b/Y+Rcw2O/mECk+soofI619fGVe7xOjLhL76dzU/f2oTcrTUSKc4+O4GyCgg1x+
	nPRKyDFytphJ1gyAg0iZpqaCtVaWWiqkERwHwpGW3vNqlN8eZm4dEwQfPE2mdJqK
	5W59MJja0kqfuKY7/zwm+AJxf7LiUfo8saKtaB+0uoCAWpPpatGWYkh/RVfXnx7P
	7yYONw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86vj6vw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:05:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d59968444aso154432285a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 03:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776161102; x=1776765902; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J7qBFKS/RQGm4G9FxW8wVL0yrqFmIaMojcREHOXJ4Rk=;
        b=UVDccFi4OpU0lFMACXOnyF6f5wBvRI4IthqRr0PMptQUceHgGZTklW7rAeb/6m4GDk
         c7UY4XKVNbCjiiFCBElEGJfVaapvyi0R7m5jvXwbrZu4cpniPvhQh/xF6kyOKapx/T0U
         Qvb1XJhX7XGv+3vvZc8R6arT787cudDOypjDHxyQisuaW5N8rHFEIfU0h86iVIY6YJai
         6N2K4ccyugh7El4nha+lyJIF8+zndB3LH/LYducApZ9tyYCAiS/ufpIQUDEg5KEEjFp0
         TlPas0aarLKeVXlXgUM/FOmP0uysPKQQLksBL/lTzuxDvaB2jpkKuH+0KjHiUO6r6svr
         fBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776161102; x=1776765902;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J7qBFKS/RQGm4G9FxW8wVL0yrqFmIaMojcREHOXJ4Rk=;
        b=E4YCR2mdR3K26R8ic8sEj3zNn4OxNIbQPNgmC3uTnDL6DFnmDpHbEbqmCcmamJheUR
         dDJ2Z63XGfwHXySiMLeLb0uQESMd3muKzzsUDKSx7JurNbW8N0RuTxpZ1/8KMb+FkImu
         bLmah8UZ3aN6COmm+P5F18Zv0fhz2Nv1nm/jIrcz7rhWT45YYT9hQlTC1EwMaZFknZm0
         iabOSEyxMkmjXBFIGFiYUgA9RUduDclZ7YS96XqsfaOcfXuOOZbj9DJY7jZbXJXT1ZYs
         215WiPmNJbsDDI3fPnTm/TdsO/CKhEr2KOjVjkhUsxS9fm4/WBEdZ820v831vkaSk37I
         GKHQ==
X-Gm-Message-State: AOJu0YwJdaXnsdXJUlIuMX8MtgeVUux1Da7tdVmbYMpXByj/2dZ4LghB
	fP9vQ4qjBOiDu7qpCRTiuQxX48h8I4MlhOo9kxqKsg4MGP/zv6fXAfldCBq4lJOPVP4edtEOlTl
	Ehk1JUnGvnYumirfpJ/oXWreI6M210VqAMZ5erPCdXIS3ccKcrCviaWE2TR2tF//2Q/ZP
X-Gm-Gg: AeBDievr2LtX48D+c1Wxv1XswFM2aRorC2YW4ojxff3VlsAkC9eAytEB6P/cSxQavtP
	HzHauTOHIv66P3DQfy5D7lqxhdiC4CdegpFo0ykn85PdbaVsRm47luhQUqO5sXTW04a5gLM17HP
	7n0yAvLZDIzO7slwBM4NG9vAbbIdR5epTlmIEyz99oMH+4jgyxuqE6hMhFA4p/LWXzmmdL//hZ8
	0AVF+iZByFvMo1eUrd+tLxHwoI1ZOo/AGL7HnExNL2hqjb7XyJVdJhUj1nZwEhR9jMI4IYNVGZq
	jOpUIEhIAC1/JXC+62AVVqbwKE9k4XhVXp/IdMdjTLAYp1CXw+x5FWGrPEp+5ehoTf1eQ9KfniX
	Xg1U9XHtKXkynLwEYoWuaPtCPi7khNNPNmzvmHi+o/y+wFExW8x9RdySA7uzJKRGU3IfqeZZTf+
	5BVB2HHbl+LVZy1A==
X-Received: by 2002:a05:620a:19a7:b0:8cf:df8b:1e6b with SMTP id af79cd13be357-8ddcd21924bmr1557790985a.1.1776161102422;
        Tue, 14 Apr 2026 03:05:02 -0700 (PDT)
X-Received: by 2002:a05:620a:19a7:b0:8cf:df8b:1e6b with SMTP id af79cd13be357-8ddcd21924bmr1557787185a.1.1776161101945;
        Tue, 14 Apr 2026 03:05:01 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670e93f1898sm2113897a12.16.2026.04.14.03.04.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 03:05:00 -0700 (PDT)
Message-ID: <717c4b3b-426b-4e1a-b910-af466f8ef2b4@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 12:04:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] arm64: dts: qcom: talos: Add label properties to
 CoreSight devices
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com>
 <20260410-add-label-to-coresight-device-v1-2-d71a6759dbc2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260410-add-label-to-coresight-device-v1-2-d71a6759dbc2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XiGat0U2OtTSIT4I22go-lVTKicu8myc
X-Authority-Analysis: v=2.4 cv=cffiaHDM c=1 sm=1 tr=0 ts=69de114f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=DmPo0rGNWzzyqNjFmuoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: XiGat0U2OtTSIT4I22go-lVTKicu8myc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5MyBTYWx0ZWRfXyPSSVgJUbLDt
 Pb+tgvl9KBqC5I1/cZL80Kiib21ECndxfS9uCDdoNuthuRmvccTPLnYrt/I9+9CG0v31TTygZi7
 usVsq/+URk8Z5iNKEQwTwnJKLdZJmcH+l+58Eg4dgJMVncsbPRbhZB7XX4MWFhYM9hEC9wnPFao
 6CZ8L1G4VRK60ubELcIoxADCKjssqqJBeL1oRgbjTCgXClLGmocsTTEnsGXe8Pw95S46kOgVuU/
 xYPUtjv7hnslwvg+C4Gq06SZQjClNntORG6SNYqk1u4Ctmy/G3BJzb5vsI2E4MKSMHu3tQzYeDf
 CZGfl2s4Cu59txOr1lmiQINgS29WAXf8c/ojPvjwcJtzo4mgYwGVq9CWZVcHy9zvW3VBr7vPeKs
 +8+tFE5iyXQc+UrcGFpalD2JvNp2JRE/dv0wo5ESUkdtODCBo8R2aldsTuUG5pt2Zd9MacLYL7t
 EcpisuW79wuHGNtUlFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140093
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.120.139.96:email,0.126.165.224:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103104-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 95D453F8719
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/10/26 5:08 AM, Jie Gan wrote:
> Add label properties to CTI and TPDM nodes in the talos device tree to
> provide human-readable identifiers for each CoreSight device. These
> labels allow userspace tools and the CoreSight framework to identify
> devices by name rather than by base address.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad3597,6 +3652,7 @@ tpdm@78b0000 {>  
>  			clocks = <&aoss_qmp>;
>  			clock-names = "apb_pclk";
> +			label = "tpdm_llm_gold";
>  
>  			qcom,cmb-element-bits = <32>;
>  			qcom,cmb-msrs-num = <32>;
> @@ -3664,6 +3720,7 @@ cti@78e0000 {
>  
>  			clocks = <&aoss_qmp>;
>  			clock-names = "apb_pclk";
> +			label = "cti_apss";
>  		};
>  
>  		cti@78f0000 {
> @@ -3672,6 +3729,7 @@ cti@78f0000 {
>  
>  			clocks = <&aoss_qmp>;
>  			clock-names = "apb_pclk";
> +			label = "cti_apss_1";
>  		};
>  
>  		cti@7900000 {
> @@ -3680,6 +3738,7 @@ cti@7900000 {
>  
>  			clocks = <&aoss_qmp>;
>  			clock-names = "apb_pclk";
> +			label = "cti_apss_2";
>  		};
>  
>  		remoteproc_cdsp: remoteproc@8300000 {
> 

