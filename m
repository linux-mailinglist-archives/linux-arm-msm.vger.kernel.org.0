Return-Path: <linux-arm-msm+bounces-117962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZlMbEcqPT2rpjgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 14:10:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46616730D93
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 14:10:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bV400bX4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PQn32LpX;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117962-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117962-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9DFB5300F79E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 12:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6335D42885E;
	Thu,  9 Jul 2026 12:01:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2244071EE
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 12:01:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783598512; cv=none; b=D8Hg5F3YaW3H75HyUsCBeV62/SMeoJM5YMNRpJgKoBCS73Sd01ssO9dxhtxy6pGLnrwWrT/aZqFfANQCCuTi6yJydhqffAQsHKSLvrT2ZakabJZj2DDoMkdOJIN35PUkVlu/3p6Hu0Qv2OTIiEKXJutxdVdSMGD1nggb3lKAVvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783598512; c=relaxed/simple;
	bh=T8vWUTc/hDoiRVM9ZSQgSy0Glicx4wdpiqsdixf2nhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F35tGwhSLAyNGJ56pnbhxk5GbB8fIVoHnt9kChKyg4PDI1ylwfU3A4/Peydyk5ihkjYUkvWdqrq64rBa5MtCbr9EHj4RD7JEJg8P1W9CGezTCwVK/sC37DT9+DjoayOpr0jK4rgNEyLmD2pnj2Tr1j2mPFmiLRTZmDv7OdoFXxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bV400bX4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PQn32LpX; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNEBx1716346
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 12:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4X5IwwBAf5rNwTFzeJZ0uNbEuRCnPdo9QpS32w2RVt4=; b=bV400bX4pgrZOO1x
	SyYkxGkc532NtLElCvba+j1rxfLxEeXCwq86xr7wfB+a+NoxjVO7iQVbELle7KvM
	sOgsh/pOWPExaPbJsHnxn0L5ZbjQNDxWFILrMVcwl2al9WsbdgqLqxkbDoZTIbGk
	GQaxhPYFR9miPsPZZYnUMPUhaQsjalGl/9WgQqsEz2W1BrJbNeLNinr+lYJbr8CO
	hk6NCLMLcKWet0E6l90SJziaLvoNwIW3zQ5EafgK8tosiwMJyR6BSB4bwzjZYwM6
	UpmEsKtw1nhPXnfglk9jjsTNfHQFF8RXiRLvQu0Jcd0yAM54j1CWmxZ/qQeuRTTY
	J5qQdQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4vup3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 12:01:48 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e6b5741bbcso384489a34.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 05:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783598508; x=1784203308; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4X5IwwBAf5rNwTFzeJZ0uNbEuRCnPdo9QpS32w2RVt4=;
        b=PQn32LpXrv5YgQigWMEyJcWqY/zqDmZ896xikr7OYl4iBFTzLcb5e26aLt1HQhhXx7
         9wgu9IoorVbHbYxqq0g7gL/yKO7lEj46dxgmvxv71jVihc41lLcq0drl0wFef8Edi2M2
         9vSSYlh8PVDR5T2IsA9ArXGfY/m4qVmM7PBvQnstDfzK0HrktuxzOY95XeN06HI1jpCA
         2g5OhC8rmhLQVT4CXI+hjHaiKe9GuXwD3/VtL3+gi5gk58n4u97mBmAHJTm4piQvahny
         4saBKVsm42yJZN4o3giDt6gF9iJF//OGJGnFutQ2d/rHpc0EE2DZiwnmUBwfq2IYtcf8
         qItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783598508; x=1784203308;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4X5IwwBAf5rNwTFzeJZ0uNbEuRCnPdo9QpS32w2RVt4=;
        b=emKWcQTQDrGpBwjaAc0v6L0rEqb8YO3WxbM58xItbFR5ooN1pz0bgl5pPYN/1WZ49r
         1RKPCo/JZz2l0PFqllTEdeEG7gsgbPgp6QX/UlCmKgFJRH++ayagYR9JZ3nwMYIjMWa/
         w+RrhD1+VK6oVNPJwOYKGAePktvNWpCKjVCYHxBnOdWNRcyk/qEr6PJfxndp6CT6kwpQ
         1Kx9LSa7MDEVYCpCudHSg/hsBIflWisjF/RzUKBMjJBdWPr4/9yc6R3HgWY2m90LouvR
         J8lk7ykDhBSbPTNKvJNdYm2Mu90shOZZEP3rqMkGER/MgixP0M/UXtCV0xkzFCsaqkzZ
         PxKQ==
X-Forwarded-Encrypted: i=1; AFNElJ8xfcR1pAtTXnMwcdG0mxONOcmeyEW8iJmVuH3ONUPm38ZRLD0lvmI6tQ0lFt8F4ypgIy6Co+H9beDN8vOA@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfh+PKsgxIwtFFw8ob1AQ51KunsO5GlQEwIApZ9uXPwk3BaPmV
	QWzB4BlLTRTDyN4plcPrp5BREkpxZaIybxwQWaRN+HW4Qo6pqQz1ZUJZbbZwSktz6siivAaSMsA
	Mb7gaQERyt85HSEx+qJJYn/iX37jlcBxowa/zP9Iaob7lLR8hJx8yRQgBEBvarCdo43lwS1TdlA
	zI
X-Gm-Gg: AfdE7cmsk9t9HiabTcX+Qc7/HFzo35VjEzPQSWmoMlgJl5XLEqB3Oywv5cyp6BlBsot
	c6AnjZywHjU0Xjmg4oPNrZgxSstrfK4gsyx4FBy00TOL8UfERzbGcvz9DLe/TOU+TFG+/ZZd8e+
	E7kIgLPTScu14zYTFincfoVlfBM2kbM2Ro8w48rFvPB1Zy3UxrcO3/gTYIpRMwoP0wdp2e1FArj
	pd3eKD5/vxpYBfocfVvXKLsYLvieYtGvWlCBbGuxIfYJSizIM8lXFCMUIuhQxD0W3b3DWoj86hL
	ez10wZkntRNZHjyd3yCoSXzLwUBSaoe9tWtQib7IUaaXVjHdIb7W4MIGhMPAtQJbpI6PJrjfx8n
	T7fj9umPXruKL32Siy9C6MOFyPTMqqi83VUU=
X-Received: by 2002:a05:6820:c44f:20b0:6a3:6bb0:e58d with SMTP id 006d021491bc7-6a3790d0157mr1184953eaf.0.1783598507673;
        Thu, 09 Jul 2026 05:01:47 -0700 (PDT)
X-Received: by 2002:a05:6820:c44f:20b0:6a3:6bb0:e58d with SMTP id 006d021491bc7-6a3790d0157mr1184929eaf.0.1783598507195;
        Thu, 09 Jul 2026 05:01:47 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad821ae3sm464361766b.5.2026.07.09.05.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 05:01:46 -0700 (PDT)
Message-ID: <47e3cd69-9800-462e-94c0-f2987066cf68@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 14:01:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: shikra: Add support for
 AudioCoreCC and AudioCoreCSR nodes
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
 <20260708-shikra-audiocorecc-v2-4-b320d822cdd0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260708-shikra-audiocorecc-v2-4-b320d822cdd0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kWy_a2-1TjAe4g3Adgq0mm0TZ5qJx7C2
X-Proofpoint-ORIG-GUID: kWy_a2-1TjAe4g3Adgq0mm0TZ5qJx7C2
X-Authority-Analysis: v=2.4 cv=GIg41ONK c=1 sm=1 tr=0 ts=6a4f8dac cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=xaeihZ6KTXLYonzE1EUA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDExNSBTYWx0ZWRfX50vbVF2KE8ne
 rnxJ+0vC3/DfpI4DUENlfynty18BjK7cg17BBSkstUa6cBMwPNwaOugV3S1WwBQo3OLxuVF5NqG
 gTv5U+wKzDz+7p/oh0NYHAdFE+KMvns2/ozeeSd44Th7SQ7w943UiVozQ0K3xl5zdlMj+YcXSm0
 KE5kgyL/qHPCvS3Fk6mnNXkhKABZ1D2grfOTwtPmjsaEG+pTqql0eO3ctwDLaZBsh80X7995d31
 Y2ayEVgz5l1EdC2Jpzk6efN058dFWWuljUsZ5a/MG2mYMTaNn0YZm4SReIWOxuF5cT4tWKljSqd
 T8GM/5/8H9UNsTsIiE50zBl2r7gtYx/H8ncAQtlRT3d+YzlPDWAwD87wdqBKBYKvIp9x0seC4C/
 5Ju7Mg6HmjEH1g+uBLlAyPNYiVJNlrkgb7P0XpMgMd1rr57YzFt4FWYF7x9fPvAvp76qzMfoJgE
 9I+NzZDzIlA11u/4NgA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDExNSBTYWx0ZWRfX/32Ff4Ywb9LP
 QjUu04+nfSWFATIPIBws1Sa16S3uNDq6KVq2E3Bhu+WOTFGRhUKmVfo5rpdrGSwryF/KPHk71Lz
 l0SKHjdNSYfw8nnRJ2wxhI1vVEPmYno=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090115
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117962-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:p.zabel@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 46616730D93

On 7/8/26 8:25 PM, Imran Shaik wrote:
> Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
> CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
> differs across Shikra variants based on Audio subsystem enablement as
> follows:
> - CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
> are required to be supported on HLOS.
> - CQS variant: The QAIF driver runs on the Modem, and required clocks are
> handled on Modem, so from HLOS only resets are needed.
> - IQS variant: no soundwire codes, hence no clocks/resets are needed.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

[...]


> +		audiocorecc: clock-controller@a0a0000 {
> +			compatible = "qcom,shikra-audiocorecc";
> +			reg = <0x0 0x0a0a0000 0x0 0x10000>;
> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> +				 <&sleep_clk>,
> +				 <0>;
> +			#clock-cells = <1>;
> +			status = "disabled";

/* Owned by [name of the DSP] firmware */
status = "reserved";

Konrad

