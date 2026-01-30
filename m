Return-Path: <linux-arm-msm+bounces-91302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDMAJP+ffGlSOAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 13:11:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B5FBA5A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 13:11:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E49C43001394
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E8236EAA1;
	Fri, 30 Jan 2026 12:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="osY1sV75";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OXb60wLt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5326236BCF8
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 12:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769775098; cv=none; b=U/pd8csiQXA1qyBq6gIIPqWlAu1IBkAq2FMQh6VLZylr1j2TwoMg5xNQ0VhjwVmcRtfNW9aSpoYUU8W2JIxLDQhr19vaYfSOJqoznP3nP0C5+CklbvZfB1Gy6Ca5i+6VdNKDl/bjLqIDQHjcKmmA1qjjcppR1qnLrs9x9cpdH/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769775098; c=relaxed/simple;
	bh=3GSdMKdwN+itJrF8aikP9IngQ/p6kcunKAal99y/xbo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VPoDQZMr3uV8KSRQCRzK78aHmRz9PorMjcuFsA6YMwO6j0acM0BzuYMzoFYCrgYINcqFZtymeDG3UnvAhkBjd90vdc28JpM8qrbFvIJR+3wZzRG14p0h/9h0brR6k17uOJeAroTp4bykWbaan2bjNUIDvOhJ7A88KD+pXgm83Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=osY1sV75; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OXb60wLt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UC0xLM1485239
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 12:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QML/ROFYsRa3wCAhgii1SBThLnaFW/W37txI0arbOqk=; b=osY1sV75QR7fChrV
	TH8jz7Dy7Gd2IniTB6Y1nuebWirl6RZZ1//eWy9troxKu2tQlsLPedyCxGixSd9W
	+HHKK9IAalpzmkf80s9OT8pJHDrshDXCDM5g1RRZydXO/L4Ik1dPMw3fNhSWdzXd
	sA3ZL10x4i0f/SXfJL+AFfpSGz28BAHqpG1gKtI9K9qb0GrCnw6zGhW0VHiW1O5T
	6pguIRaGB9SgWXxzWXWq5obcalM9NiPJlngeHtWDhnWC1Ifm4OK/7jG7TBN0IQ1B
	EhSo2VG/XJSGgMiPBSw3QzsRfqo/SrEnHuUmIyVBIrWvSJGnDneYHhEk0lZf/y4g
	Eu3D4A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0nsf99cq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 12:11:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c710279d57so16225285a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 04:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769775096; x=1770379896; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QML/ROFYsRa3wCAhgii1SBThLnaFW/W37txI0arbOqk=;
        b=OXb60wLtZI+ZY1iHme9ktWazfZXKkA3fQnRCde8NogaSvKlrjxJzxny0dufv0bJWyM
         wVfIfkYhCeJgDe2u0vBUL9J1bzDDlxXkxzIN2i1oSOH03f8DRHUWSbPFzItMt8RnvSgP
         QxXcKMkHb3ofxcwGn6X4kNxRgElvMNbh3BclUW3cDyuE/OCRGeFsSf0s8sJ+LCIXY3rr
         8xX5bL11VVmuBPCJ7hk6d/7Ll2k0cdBTM4OphuNaBuXMZZFIrR34wJhAqLpXz16HU+Fd
         0eFaMFVrvZA2pUVa8I/nCDoUJvtSrZfIHUzGRzLlUkcuZv+kkC7JRmfWE45/rMGrPe8B
         700g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769775096; x=1770379896;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QML/ROFYsRa3wCAhgii1SBThLnaFW/W37txI0arbOqk=;
        b=Ue5WD8Ax1IfOBNiw3ND6Q3l/DJ7zNi7xmkss9dWOXijRUgweH9PXXpFDmgCyE5F6kd
         eHB3BO6CgRt6L3hnmcIE/PHE6hiPt1qxB/wvqXJYBmJpBDuKx5xJY6Kvm5cKZ4/D8ah0
         r7ae4j8gqLdjgHi5QON1jXhqYM+NOKljHgjErXWD7NsC0qv9yx1WOhuidyYjlhSnTTK9
         d7NCVb+Hjm6rz/OxhD0+mppBZwsnRkv6nVLfZqBqrFEHTjNHw+xaCtw1crGMHp8qeEVT
         2t2o6roA6KbW6iwsOq/aYfNifL9y/eKvt55gof/oFgGM/FQArA0FbkkSkn2gN4UJQTEO
         SwMA==
X-Forwarded-Encrypted: i=1; AJvYcCVrc16OdW6yzT/h1IvPz/l8QLVXUjEr3DVpyP0xE+r3n9N8NzpSmEvgi9hf+n4fArsW2psgBG2IidwrPc8c@vger.kernel.org
X-Gm-Message-State: AOJu0YzlwpoKaG3KYByaSFjOJEQX7pSEZGnifLV+azMh4vkwz02HF2O5
	is/fvRO8rZV5s0TaI5veA4awZadjpsgyJdDuj085lfjEM41VT23n12luRdQMNFZHuO4Ru/X5T8c
	SKJ5sYHnkgNPe+ctGLhZddKnvC61XnRrlMVo8RIghgi3fFuSNwOEan4hn5PceIyqr+TGN
X-Gm-Gg: AZuq6aKCMvBaUuZSoxvLS6YDjX3YIqj+b9/+ZQhOzyCaj4rGnDjl0q37NjVTMbHVtYe
	DzFUCp/5KrzBkC5CdF9NV6mTh5v7uxT5Lgk7CwdDbrOdcEt2uQhd9lTaKVcOARpXPVbQ4rywbKV
	CyDDhgRUwNpgef6rSfQElZUblLeJsP0cRP36jkxoPv+WmQ+0ffY8/oWrM+XnOe5ikm9mmUq87ks
	DMsRFYGPlYHQfgmJgCjsb/82XqUMXtD1WjAz/kcyu1rs+ywybt5kxACznKqQM56OHZ5J6Jj1x0K
	oIKG4qK7TZiyoO/t3gipxvRcbQbfO1WehHt978YF3Soii+7huDvvwOTndFeulOQEoFkYLOQy4I3
	AprRHrYmkjEfECmkjjwXcOoks9neW2ZCXqWHwjcO7uMbQLdkgEsFG/7VK4bqZVQUVUXc=
X-Received: by 2002:a05:620a:bd6:b0:8c0:cec5:148c with SMTP id af79cd13be357-8c9eb34ff20mr277196985a.11.1769775095662;
        Fri, 30 Jan 2026 04:11:35 -0800 (PST)
X-Received: by 2002:a05:620a:bd6:b0:8c0:cec5:148c with SMTP id af79cd13be357-8c9eb34ff20mr277193885a.11.1769775095204;
        Fri, 30 Jan 2026 04:11:35 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4256a35sm4087136a12.1.2026.01.30.04.11.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 04:11:34 -0800 (PST)
Message-ID: <ae4eeac9-701e-4697-9d76-931a6659e7d5@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 13:11:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/12] soc: qcom: geni-se: Add resources
 activation/deactivation helpers
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
References: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
 <20260112104722.591521-5-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260112104722.591521-5-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1n0MYTdqdeNBUnog5neatO_7SwBM041Y
X-Authority-Analysis: v=2.4 cv=EvjfbCcA c=1 sm=1 tr=0 ts=697c9ff8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fehRvCu74lOKQ2FmR6kA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 1n0MYTdqdeNBUnog5neatO_7SwBM041Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA5OSBTYWx0ZWRfX9LADDCWKddYm
 /HpnKGhDv2ffxvNSi4M/02+2FpfecyMhwXPFy5SuvuMMBFfZ7MBDzTohz88esA3qLrMtcNxz8A0
 drHxN9ji1hp2/Ac1fJPmlRONmSU6kZhbhKnFTaP13PD7RlH+pDuEY5QONMTjDTFpLFGdg+aU7Vh
 c0uf8bIBTkyik7GDwp7UQd8Q74OcvCXTefW848wtYCoD7347dYiguY5gwUjBSaZ6+P+uA7lHdmj
 ILEznXGuzCS4+o1udzxzajEJNwZCmd3sSee8/GGiDF1xEuMwC9z8vw7YOWXvfEUBIkjWlRCT3A2
 mqVl/Zal9f5ZFQqzKAKTIrBnuI0fqESu7ZyyLQf6l83sqsYL+TqWeYpdviWWFIf282panuMtGch
 w+of1kQEldcRvi7KxNTVrIg+dSxBWNhBWX4xaKmgmy8ky5nusv9I9WrZr/ThS1ojkP363oKBqvc
 LVgyS61r/UbadLtuckQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300099
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91302-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 93B5FBA5A1
X-Rspamd-Action: no action

On 1/12/26 11:47 AM, Praveen Talari wrote:
> The GENI SE protocol drivers (I2C, SPI, UART) implement similar resource
> activation/deactivation sequences independently, leading to code
> duplication.
> 
> Introduce geni_se_resources_activate()/geni_se_resources_deactivate() to
> power on/off resources.The activate function enables ICC, clocks, and TLMM
> whereas the deactivate function disables resources in reverse order
> including OPP rate reset, clocks, ICC and TLMM.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

[...]

> +int geni_se_resources_deactivate(struct geni_se *se)
> +{
> +	int ret;
> +
> +	if (has_acpi_companion(se->dev))
> +		return 0;
> +
> +	if (se->has_opp)
> +		dev_pm_opp_set_rate(se->dev, 0);
> +
> +	ret = pinctrl_pm_select_sleep_state(se->dev);
> +	if (ret)
> +		return ret;
> +
> +	geni_se_clks_off(se);
> +
> +	if (se->core_clk)
> +		clk_disable_unprepare(se->core_clk);

All clk APIs already perform a null-check internally, perhaps this call
could be merged into geni_se_clks_off()?

Konrad

