Return-Path: <linux-arm-msm+bounces-91454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJETKNR3gGn78gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:09:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2498CA971
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:09:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D0833306AB0C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 10:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 557113563F9;
	Mon,  2 Feb 2026 10:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G93WKS+A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NCc5/gRj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347D12DAFAA
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 10:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026559; cv=none; b=BmN1eqTXQhHV+FnP2LkZ9SPfvvk38esq0imY5UXq7n4FeLv562FWOam25Q5NnHQnZ7RhaxNC+mvb9ER82hbLgDkn1G//YtdiFjf0ABqaxFK6cx+T9ElFOhP9Ap9zb2yG/cTbDo7uyuGml8uuE1tQRDJ58pQj43M6R+1M8ka08N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026559; c=relaxed/simple;
	bh=JDSeexC0+JEFNCPV/nFoAtVuXSlVMpI6OdGFK/M9k6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cJRgDt/k/tFKzw9h/dyEhHc9XscHymCSFn8VhDVfN0IscX4XCi9GRdN2g0PB2JbSezDYzjANJdH6vl+mZhi5moSOaKp8dUw5gEfXVEcg9W9MwVcIvaTfZCI1QzvGEH7oLRI+uHNf5dZHJgUs1EXTfBdRVDTdIRtfwc8xNs46SMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G93WKS+A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NCc5/gRj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61284oie681897
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 10:02:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jCAadpfJgT9dXEEIgywaUL4bC6A8NzSXrVe0HfftFtA=; b=G93WKS+AhHzdPX1h
	z3wSHCpza4u4nh5QC9t9MYGDXmNpzeM5weAn/OFUK4H3V5tY+YemhR/u+yxEJB+3
	AE5hc8QSiJLHu1T8Augtvt6kAnkBkN1F3WafhhJ0W1JSpNCshs2ifiIqROdeci+w
	ut8N75TQ0zvBDOB5q3PPZjuklNMW7hamV8FwNslmuDEfyNuC/llZn7GzE2j4ng15
	1HOit32Mf7BW8eSE+CnN0DXFCCAru4qeZJsVjABhvciolM9sGVZWeww1CVNOM5hy
	QL03uzyZC02tDlaehPzUkNEyZau+vAk0ypLGgno1aIMvrIagwPgA8zmfLWGXUl9Z
	mQb2YQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1b17vxfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 10:02:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6b48c08deso69186285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 02:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770026556; x=1770631356; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jCAadpfJgT9dXEEIgywaUL4bC6A8NzSXrVe0HfftFtA=;
        b=NCc5/gRj5knThzVoo87xi8AWKzankoHwHQtf3xIYMOYYYe5PMkjEIwNT0+v++HbbCg
         3Nws/GGQ6NJzbGFxOyvHvZhBb8adB/ouV7fraZIn0QEde7QrYIQhYS4ZIODYKX417tM8
         kYTPouiJYYdaxCNzokB2u86p0vI235oXMkopsMT2WvuP6FOZWNmpvjUOqjAD5bEUmK3x
         PZpalKrC+rzXX/v6ICR17qHOvWgOJjPi7VPVeq3GLAevArKE6oGMOLCzlRKdJ6uSu5fC
         IqDD6piDbl66C/vwXhOCYbwtufCenMofcFWilgwBrLSVhO6u6v2A3Vnn35lfp8S3M3IK
         sckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770026556; x=1770631356;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jCAadpfJgT9dXEEIgywaUL4bC6A8NzSXrVe0HfftFtA=;
        b=t2LKsNr9qU1g0IEI5wbw5ij0gvDJ7DDRZKHdgwtmsjeAiDlGGylHR0Zk67SAXmJrjl
         JZqHk4NFhfxi0jDRsjTf1mlcybVgGrWFtz3gSTR2blmxGmeeJZGSuafSU8HxcDZvv0Jc
         OgXmJs34qzJxmrwEBd7CXzWt02rrlGS5KtzdK85VvThoOAzuc/JftYN3kAyt/XdTdb85
         yQFMZRyuw1xtumSKB9/Uk7FwtU5fyXO6Zd8icAI6xwzz+l54UKzM82jQEXRbS+6+eaBx
         hHFn77N5UhU+E90WNL8lMj9ns2nG6LOFvvyH/H1sw4ovhRyipqbiNo9S05VyFeBAbizE
         q1XQ==
X-Gm-Message-State: AOJu0Yyp5TJ+xhrQ1mGlSGskBoA+tS045iwJha9H1xlA/ChN89zM3zjO
	6jYX7yC53BJZBR23LIFT4HKT4zoK6lMGEkgERD3rTXV7BJKSWEDIENbV1EoII6Bt7wJowUCPYdD
	XLdALj7dNwEudZ4VjEAh6Z6i2NMBSpEFitg/UoE7RrP9J4omQ5U+3ZyHrsQ53If1fQzEe
X-Gm-Gg: AZuq6aIsdF/A4oKmxLu0xjxo+SGczHik3uCtrPsVVWzoMdnBYrRFBxv4zpNx1FK1Pcg
	msQ4be7L53IFzOP66I+S1jfBZln0jnK6PWKwGvCUKENqF1YVOf0uq9SqZ0qMSHHeNC2lEPmlZWz
	Irvp/ua/KWgdzxfMNXZePb/uzxxWVoFlooExwWdIvaHZpEgeG7Lt5paq7/uccGzt4PwojUDAiEx
	VO/qS9+OZgszMLC11+j2mgQnU1sQDTifXWxd4saijU/7641Sk0zpoe65pgOkfiT9KebcAGpCpVj
	8j32CTkRJmnR1BQfE6ThJJLB3aMEP/ka+TFGI1K/TPVZPI2CRm4Avtx+MeR3nLEBf/UCLc/p0ql
	dkByk5MAfwjrniPrdA1HxCHB3tfU6aiTeUHxr1uffS5FO9Z22EV5To5RZy/CuVUouNAk=
X-Received: by 2002:a05:620a:4009:b0:8c7:9e6:3a4e with SMTP id af79cd13be357-8c9eb10f0a2mr1033783885a.0.1770026555508;
        Mon, 02 Feb 2026 02:02:35 -0800 (PST)
X-Received: by 2002:a05:620a:4009:b0:8c7:9e6:3a4e with SMTP id af79cd13be357-8c9eb10f0a2mr1033779985a.0.1770026555002;
        Mon, 02 Feb 2026 02:02:35 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c500bsm837501866b.54.2026.02.02.02.02.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:02:34 -0800 (PST)
Message-ID: <231ae9c2-bb3b-430c-990c-deab6a8a0d0b@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:02:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] media: venus: scale MMCX power domain on SM8250
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <20260201-iris-venus-fix-sm8250-v2-5-6f40d2605c89@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-5-6f40d2605c89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LcAxKzfi c=1 sm=1 tr=0 ts=6980763c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=v07b0KzaqYqj_yNn1HoA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 2PSQpSHb872cxarP-2QU0D7IJLSTivlD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4NSBTYWx0ZWRfX8CIcMMbQF8KC
 ZJXn2/NyKter/HqtqKZyN50I7ST6wQ26cwKocVsaP7vKn10P3ByM5XTJPS6RhGVmkHUIGp6gUvc
 RoKhE6RpdkTaI6kp5pAY0qYuwEi046Mt/BLEU1xG2Mb3mNdhQKqudKIlVMV9kkHR5Ll9TS3mLt8
 xfoMJoQoACK45nlA0Qc21Ob0gXMh+ws7M670k72Ex/P0KA02f1XfHRWaqTyqAOskytV8V3Z51WE
 F2CA4glimZNEQYf8zloz9cVtjWv8Hq7uMbXEbP7k6tZN+WW4KXZzuzCPP/57Wiod1ji3Jsbh+tB
 cdMug7YVYusnVjXwHNbjNlOhv/dAYcHk6FYhwqdvVY8jrUhjzCq1bLhl4VUesJjKBYO3zvlgfGs
 8i2micqAyafjqnzHPJD4ctbcJ61uChlPitS4m68QFOmBrPMkbd5SeSyIetBOC+LaLCvAr6Zvmv7
 geWlxxNVVZ1RLgI7q4Q==
X-Proofpoint-GUID: 2PSQpSHb872cxarP-2QU0D7IJLSTivlD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91454-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C2498CA971
X-Rspamd-Action: no action

On 2/1/26 11:49 AM, Dmitry Baryshkov wrote:
> On SM8250 most of the video clocks are powered by the MMCX domain, while
> the PLL it powered on by the MX domain. Extend the driver to support
> scaling both power domains, while keeping compatibitility with the
> existing DTs, which define only the MX domain.
> 
> Fixes: 0aeabfa29a9c ("media: venus: core: add sm8250 DT compatible and resource data")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> @@ -904,6 +904,12 @@ static int vcodec_domains_get(struct venus_core *core)
>  
>  	/* Attach the power domain for setting performance state */
>  	ret = devm_pm_domain_attach_list(dev, &opp_pd_data, &core->opp_pmdomain);
> +	/* backwards compatibility for incomplete ABI SM8250 */

"eeeh", I'd rather error out since it can't guarantee to have its
power fully on

Konrad

> +	if (ret == -ENODEV &&
> +	    of_device_is_compatible(dev->of_node, "qcom,sm8250-venus")) {
> +		opp_pd_data.num_pd_names--;
> +		ret = devm_pm_domain_attach_list(dev, &opp_pd_data, &core->opp_pmdomain);
> +	}
>  	if (ret < 0)
>  		return ret;
>  
> 

