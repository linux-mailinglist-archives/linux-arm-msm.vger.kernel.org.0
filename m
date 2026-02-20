Return-Path: <linux-arm-msm+bounces-93479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJ6dIhAwmGkzCQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 10:57:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C86DA166895
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 10:57:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C43CC300C269
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 09:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAD2B332906;
	Fri, 20 Feb 2026 09:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oAlLT1Zd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TxvPmR0R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3667133290C
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 09:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771581452; cv=none; b=aSnOmciZlLMPdf4kQQmPoFBS0hMRW+MIParDeC/9TcyExxtzEdxJrkjwcUqPdETnVsokCQOBOE4LRUzE9X/a3oxGmVJQa+4xi+2GFzVLXSD/lXPl3B5TSP3bWHOU2B5SsXTKqbMCJPbNwUW6UUtEP0xMGvooUFDT/+ZlbOJfy6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771581452; c=relaxed/simple;
	bh=H0bxDrD7Q3iu1dnJy/oLm0o9F6Btp8a9WEHS1lwFwQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fQxX+ahibHgjYv94rn9qMsI4Sok/RNOkVR/CNhJRqGNV4BoOxyKLc06KJhRWqc1Kdmr4quJm7wso8dZrqajmvLnSp3UUTueQurLcS6rFzWtykOMuOnkwvQCITj7rZK24rQUELY6X5q6M+d0Qi6qT37b98O0Rh8lLnwhvHX5xQXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oAlLT1Zd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TxvPmR0R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5SQEp3699759
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 09:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Td/GyC2H54TSnBsbZynZSNK0FkJDWvK5rVS04DwJxtU=; b=oAlLT1ZdkZc/HTEU
	P8EungoIUuX3fSBU95Vrnj3jBchh/utgHfR2UhfmGpuWq3X3PAuvPqTKky6E+qJn
	oGyiQFSiVMNG+ygP7xSnm31gYTH1U09aaLBAJ6oy5KHKQAbsg6t0GInyF7CasBOQ
	qMXTx0AXOW+tVMyPYVi/x4bQT1Tcnpn03tDT0j2q0lYGEYuzOac4Lm5gRZ72a8Dv
	rkNfXErAJcRNzqTYQH97k8P3ho2s1XWH/riNHYVtSEfgccmljtnUb3O6gX0pKw06
	3eQEKmyWyvk/1nEyJsTg4/STJ9oZ/ka5v2YVTRCjuh14Z1p7U46kP1x8FSxk3aFi
	KegcQQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ceh5jgnu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 09:57:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb399597fbso152575785a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 01:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771581449; x=1772186249; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Td/GyC2H54TSnBsbZynZSNK0FkJDWvK5rVS04DwJxtU=;
        b=TxvPmR0Rx/GB41zUmCyVvdcem39eTBUdKij/2WdAs0tJYH4g22gC8o/Ew5gezjqlTP
         /9cFUzSHaHhkv+p1Fw/4WS3fT2fc5BNEHwtcuT0p5hxK31F+jxBdiEeC2CboyzLfQ3MN
         Wc6HoPwrigHRwk1ffohi0eUuk0+ZqxKZbA4r9U/wuuwQCbddxn8VaJSnRf5F+nopWK0o
         3/JInwllm9re6qe9zzJtIHK669N9pMOSNmRxlv8KcAQOjLozeyIOiwee4gJzpSGOoUkm
         ZedrthZ3H8QuA94W1h7bGL6NlDTCWxdi6olIS1j8PfDmOP+gg46rVfrBc1EJMCVEobSu
         z81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771581449; x=1772186249;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Td/GyC2H54TSnBsbZynZSNK0FkJDWvK5rVS04DwJxtU=;
        b=bhuz3X36cptR7duDq63neUS46iHRYGuH56Pehlsp9d2dtExy61Snv47Bhs45I4BA4K
         lc+059S1mkjJqhKm2NYW0+FwTuhvPtlUP5FdE53LwT0jSsx8CcWv/vKalnU+Kmjgd2uP
         U3H5mqo6g7+l9l8gR5oKzv5lhuDIbs2LfY05rJ46X6A1R11f51NdBK2Rf7T+CRxey4pq
         PDS9Pk1UXhD3wVssyshp115OnjuT642L94wT+SkqaIeIETBuSlvP9l/d/VFJZ8v83sqB
         UKBFFtHx4kAVkl/0Gul0Au8feki6RNeS08E6vETIVJx25YP1jttOVr5RKSShoGL78KkX
         ircw==
X-Forwarded-Encrypted: i=1; AJvYcCVhAYyK5rTk70R3F6QKlHs30V2KSzWm/Bu2J9/woZ5fhCYNRdDGBvdZtCIKlYlBEWkprMN/HLK9zGYMxN+8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7iTEIajplIl3Fa1M+Czst0jgJ3Wh2AcFhBSW6nSnJeEn0cZ+B
	PrGw/rnWEgPFLBjXcdD3BEKT1S0CbXnNPjWfHC9VSfqF6S/Fc22wyd/kPZeGXCZ4OMLVcLJHwbC
	sSChpS2zRkol+jZZQMbUvdfeXi3sWNhgoFQUe2ARtNp4wfEDTXySxrI+Xc6s1mwOHXze4
X-Gm-Gg: AZuq6aJAI5PYg2uqVBHdu57AZdZZ1yxBdVzOepUiigl9eYxX+z8Uics+Tfug+W+i3ds
	/+2eG0i9Hmh6LTUq48ga2Bpor8hP79DCtuFM89FixpPgTk/2YuqRj/Vtm2/UdoAsFDqX1nkydsB
	RNEtfPT86Suqwi7pRksrh7KprCWLYtnFArMjunSrJxCD+D5u25PFGDAzEM9MlEZl0mGOYlQK2D5
	+GOAUOlg1rXiiz5biMNV1rEWDR6Hr41b5cQugcybUUh4575aW1aKBg+I5aJCTCihuXNr2dz3sL1
	3RyfRbtI7/kg7IXzsEE4AHj3Z7DBIQZPfi6xNq91yMwJoM5mjzpOOBleCF6hvqLFmunmd5fvMZB
	G4HqT9n+QAygAuL8ZicDrYUCptW4Zc9/LDSdwm9r6rzWxC2epgIXRmitLKd+yCke//Fo4jKvcom
	20vJE=
X-Received: by 2002:a05:620a:d8a:b0:8b2:e346:de7b with SMTP id af79cd13be357-8cb40820215mr2408609285a.1.1771581449636;
        Fri, 20 Feb 2026 01:57:29 -0800 (PST)
X-Received: by 2002:a05:620a:d8a:b0:8b2:e346:de7b with SMTP id af79cd13be357-8cb40820215mr2408606885a.1.1771581449214;
        Fri, 20 Feb 2026 01:57:29 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc735d95bsm661300166b.7.2026.02.20.01.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 01:57:28 -0800 (PST)
Message-ID: <cf9c3543-e3ff-4ce0-8fe2-942a478dee4d@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 10:57:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: pm7250b: Define battery
 temperature ADC channels
To: Luca Weiss <luca.weiss@fairphone.com>,
        Jonathan Cameron
 <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans de Goede <hansg@kernel.org>, Jens Reidel <adrian@mainlining.org>,
        Casey Connolly <casey.connolly@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260220-bat-temp-adc-v2-0-fe34ed4ea851@fairphone.com>
 <20260220-bat-temp-adc-v2-4-fe34ed4ea851@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260220-bat-temp-adc-v2-4-fe34ed4ea851@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Raedyltv c=1 sm=1 tr=0 ts=6998300a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=ZSlsbEq598atbnW4AL0A:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA4NiBTYWx0ZWRfX/1Vu8A7ElmET
 HL99vYKKYKL7mVwd+MlpHhZn/oqs3eyqxmC6A5JMAgAMPnOAGIrSzt5H7VZ97wEyjTRBy3z6aHG
 shP7Q4U5bGxdI/9VdiAbH22aSv7oo2SDcHRRgmh3x4NoZy/4WjRMHvJuWDGvI8BqOzBMdw8Jsb6
 zpMQygommm5H6yDYapDAkHVY8dG9Ht29Wy2E9W4oMwrGui1yZkrQaimFxVm7uyYZbsanV43IQIo
 G8+RrQ8GFKMhLd8a1b/Ew9GxgQrImTiACDMXRMhL02f5PKjZhzWKVOmuf5ZAHWbJIR3LqMwCbB6
 ND7kTHPaQTdjKUzaHy9jmdwnz6qs8AOk/H5RSwkP9ZLu8K5GZ1Uv5ozwshzPmJ2yGhMvPgv5l4W
 Gxydmyr0mAGyl/lJHt3/J61ba6sZTwaiWJIviS2ztTFfAFHCGbe3D2g9SPkMsEMvBi3UL94lVDw
 qvZ7RapAlj8qROCj5Lg==
X-Proofpoint-GUID: BtBvwB96UKMGbCKwGWC6o2QMPAucziAf
X-Proofpoint-ORIG-GUID: BtBvwB96UKMGbCKwGWC6o2QMPAucziAf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_01,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200086
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93479-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,fairphone.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C86DA166895
X-Rspamd-Action: no action

On 2/20/26 10:19 AM, Luca Weiss wrote:
> Add the definition for these ADC channels to the PM7250B definition.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

