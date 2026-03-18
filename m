Return-Path: <linux-arm-msm+bounces-98450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJpYJleRumncYwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:49:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 151B42BB154
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:49:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E6FEE3012CBD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E4A3D3333;
	Wed, 18 Mar 2026 11:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PvGlctYe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="djo9YO5L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDBA3A8744
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773834574; cv=none; b=TvrAprGW7xPaXBufoxo1G5XKke6au+PjYcolC7E0D4E8WZr7lANjjhpB3zmblQcHTc6t3rhtgI6sv3oPy1xO/7lrKx2zZI/S/5uMwBDdn+R39ieN6jEMFtGeAeX4dxnPI8qJOTKRPvZSbITch/HkLy+B+EfA0gvxZUtaeMt1SAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773834574; c=relaxed/simple;
	bh=rBOS0ej5yvstPJpN7/12hCBamhtOK4e9RXqnzoQFezM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nUnlbkJXPPjulGJEDhe9Nycl8KiU1sWbLHETE4OD7QjlRCr3JpO6L6XiGNaeSco3jDqd+vdP4Z8iKY/vi8YNNm9NfzwgkvrBx15/SseQkIigj41I74Zhz8m1Hk278jb2rF7ZEhJikaXAfqelXvVW/fBzHcWYNJZpZ70CcA0R6AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PvGlctYe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=djo9YO5L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IAhx17008446
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kUN6NuA9E0A6Euv+7NTzfaobQJSV6Fe3Lnfqqc9SXAY=; b=PvGlctYeeBT1dA7G
	RwPpFl5T2vcc8r021RTxtqtq8x4jLuHXSnWRaHaLjD5859+tMWClat341bT7mLXP
	OmjHRXJFqeFGlNuwBon+fUzODu0HXpMoLg+r96wcf+r4+yTBcNpQqhYwOuVTnk6o
	GBhYXoOnpaXUcMG1GBXzSJedo0Fix1cVN4uHfl0Z5zB4eQITkl5j3W2mrZclLoCg
	lrqZptJ98MQaWqY6M8tmLSuDqE/I+EFgk7N9xGGJiYz6E/fp2Sy7zSNPFISfmdfe
	kPUqZjqrxSoItgY6CZ/KfYgo5gB+S+uyz1UaOPXObjYhyv+7vLfyQsw17eQu6hy7
	XZ5Wqg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj506mt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:49:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50923dc39f4so48134271cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773834570; x=1774439370; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kUN6NuA9E0A6Euv+7NTzfaobQJSV6Fe3Lnfqqc9SXAY=;
        b=djo9YO5LW+9Ra9ij5RIAH3ee10e9y+MKBoyxYiqVjWBQesTeOj3BAps15yk/5Onkix
         9vR7rK0NNygKbu3EGAasjKE1aIP42JbbPjShhzQCAL7oarbJgqNsH6XdtfEvIeHjjd4p
         gsRxIOKmBwE1RESZEDiux1zu/PGI3M5/IcwpVRwif2Z029y+kI9CO4xEE16Bl4PFJmHd
         vRJJy4aSBZgfINx+w8m2b11QekhmVDwxzetqPqqjE9yx3Yv7j2SNoof5TOnI0s+QSOHw
         aBpf84GSLRxBzXBI0IZeGAfwo+ofaum5k5SWPhGVL5qObXDX1jikic5SyV7c3V1nkfTM
         qRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773834570; x=1774439370;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kUN6NuA9E0A6Euv+7NTzfaobQJSV6Fe3Lnfqqc9SXAY=;
        b=SepObwmDBCAfiHnWJ1jg0ZTdPEzgT+rcblTayJpzLnECl7w0pMlmk1dIgiTpNZ3zcF
         lj9hz0zdj9Fkfz6J6NimRB5FgaEF+uBQhOo31mRiFumfEdUawRIb72TQRTRIQi2x7ATV
         FIi2Q3ugCp+uGFXfNzYOasIRDDt+PY1sg+l9sH52l7s24ecfG4Q3VYlvqB5UtodOy5Tg
         0VlleJKwdKPUCshccHPfpftd0MvP5mcJrJrwSlUWZtYW98GPLQ2hcUpu+qHwSra6y7/r
         Uz73gT6+QCFmBJCeibD/A0M34NEevajL43mdM0SVlKtkYxAYEuf5tqlRbP1rPS8pVa+L
         MC+w==
X-Forwarded-Encrypted: i=1; AJvYcCV2XFUcuX/1W88+4uVsxj8FG1V48J9OYYsaqrSDxIpLAeX2NjW6GZmh4aYVXarXEObpBqxcaBTBG5zJUHeF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7YeS+ZEmVDwDsksjpEgVgXG//C20Jot4DomwXfPT/HTbV86AP
	iqko1mbqpP7O0/HYprTGp5vtqa1gqv32a+2raRYCPvVz6S0/YIFu8WndUc2oL5/JOgLFAtn91nO
	XZmJpT80P5V7xhrnUZqv1fRWe9TTwakBbZ8OPQ3/B54w8IocAWzreV1Nx0cQFuvtUeXKW
X-Gm-Gg: ATEYQzyb62hYBv+F+/EWnAm9JjjvZYOhiWls4OMXbE6h4F0fSRN5AQV8/Bmr4Sbr6hb
	75QhwZL5EX/bcdnzLM9X1ehsLa/3O+ukfboAMbghYrH4o8uNqKNi1CPonO3spWOupdAjgpYoGMm
	am8i9UNHTsTFy9XZxwDQT7yO0tFbRAs8CEi+hi7ZDkiViF5edYX4g8d48ISRxYggY+Y8kb5ocfd
	D+0DR8ahi2zvl7ZZjBrNVQkeChUWswk2qxxDcHvdF9H1SiQYxvMDbbxOpLvz/uDI2X7PPTcxWtV
	Wy+OwUddAkghXHsFtSI42PWXy8r2kvGCdBIpu4lAOfn8nNeKXXsko5GeFvj9IkG+Lu1fbQVoTlg
	OQs+cbFDp+Fl1ymyxLMnpJ44t60jHsxrAG5EVoWdpPGNd1iI9UXlfNg0iv+tsBEnc5BexP03Hox
	cDd6c=
X-Received: by 2002:a05:622a:10b:b0:509:2a92:8088 with SMTP id d75a77b69052e-50b14752dcemr27744491cf.1.1773834570107;
        Wed, 18 Mar 2026 04:49:30 -0700 (PDT)
X-Received: by 2002:a05:622a:10b:b0:509:2a92:8088 with SMTP id d75a77b69052e-50b14752dcemr27744241cf.1.1773834569701;
        Wed, 18 Mar 2026 04:49:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667ac611b88sm1815696a12.0.2026.03.18.04.49.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 04:49:28 -0700 (PDT)
Message-ID: <9148cecd-6632-46f2-88f3-152c6d6df10c@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:49:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v2 11/11] arm64: dts: qcom: sdm845-google: Add STM FTS
 touchscreen support
To: david@ixit.cz, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260315-stmfts5-v2-0-70bc83ee9591@ixit.cz>
 <20260315-stmfts5-v2-11-70bc83ee9591@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260315-stmfts5-v2-11-70bc83ee9591@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5OSBTYWx0ZWRfX9EEek5AzWLvy
 ffh/fG5ePs3+alP9Mg+k8AAIrlkKfvZsTYuMWzaH5yzz8jM3rYd++o/1QjG+noNYsxYetIhaIG8
 7u29/AVSSteHNdXxdsiJdIrlOAAwPzqBC3u6prjWpgfqrNDjtpRGxCGJUzUNUeGT4Wxmc9Tb+dj
 MR/ioeWqRINHwnEXbuBiywHwD4Oso7c10/uisqryO7zw6Ll6Hfa2/iQJPhDCw/tmOlj1T04WLbd
 yh7jjokk6ZTU8ubVcTzbrhysGFDgGIwIGojDgvb/jzMceQ3oxItA9yrI6xKpqPapYEk6Bzoc1IJ
 7nYhCRwMlAyAi4vIB7NsfMkxzBoYOv+exRzq9pmqCC9m0a/3Z0uyjVSFxxPbFAbvWK9i7QVgfnJ
 zaPeHZLUZa8IhYeSTc1fOV4hWfFkoVfr5TwbPDQaj5RFdy2sDsdjPyUPCHvgKeUElWgnldm2JcT
 I+qpFR8oCLYjA9jiCNg==
X-Proofpoint-ORIG-GUID: F83l1U85O28Iq0oU6MCdByCFLvrkQA8e
X-Proofpoint-GUID: F83l1U85O28Iq0oU6MCdByCFLvrkQA8e
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69ba914a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=sfOm8-O8AAAA:8 a=8wVjoaYgGRnUAGDsoUAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180099
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[protonmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,kernel.org];
	TAGGED_FROM(0.00)[bounces-98450-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,protonmail.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,ixit.cz:email];
	FREEMAIL_TO(0.00)[ixit.cz,gmail.com,foss.st.com,kernel.org,bitmath.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.49:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 151B42BB154
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/15/26 7:52 PM, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Basic touchscreen connected to second i2c bus.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> index fa89be500fb85..48d7e7f83c285 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> @@ -26,7 +26,25 @@ &i2c2 {
>  
>  	status = "okay";
>  
> -	/* ST,FTS @ 49 */
> +	touchscreen@49 {
> +		compatible = "st,stmfts5";
> +		reg = <0x49>;
> +
> +		pinctrl-0 = <&touchscreen_pins &touchscreen_reset>;

s/touchscreen_pins/touchscreen_irq_n?

also: <&foo>, <&bar> (this produces the exact same compilation output
but making them separate makes more ""semantic"" sense)

> +		pinctrl-names = "default";
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <125 IRQ_TYPE_LEVEL_LOW>;

interrupts-extended = <&tlmm 125 IRQ...>

Konrad

