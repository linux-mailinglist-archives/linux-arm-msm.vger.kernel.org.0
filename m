Return-Path: <linux-arm-msm+bounces-93180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKE0FjholGlFDgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:08:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B1B14C64C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:08:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D57223030101
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A14B935D5F2;
	Tue, 17 Feb 2026 13:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y2fGN4Rk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VYHUhW4+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA06F35CBB8
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771333683; cv=none; b=YIuVyX8kFxu2vlSmGtWL3cTAhz5i1vnFVQjiK8MYw0Un3WSAjMmsgm5YBXw4r9fBuPIJjPYTzwfW6to5bfyQPcvEX9r55d+y+CjBZnz6XfKn8a9AaaSq6dV641La4gcixGGPDDFpDbHu3pQYN1n+8YyEioAaR93gjp2lKgFYDok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771333683; c=relaxed/simple;
	bh=wL5VuiMiqYyh/wwnpJVu5jYTCmuIX0jo1WMK767HlLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QM4oHEjKjZ4nTpFW+4S7Oc5zkc/dd8aKNzTZe2Vdp4Zr8Lcr4JNlNcwniSLOYrwmWDXYCoKi1DFV0UvdjSa3zx2Vzq+OTrzvQEev7DOX0Ym5JUebOmsyMvPLWKBLLw8vHi2I467MITK0yXCXx2mFIZQH9YpWEeUpHyGDVs5fgHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y2fGN4Rk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VYHUhW4+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H9nRO52802096
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f5ADTz8P05lKTT/ohdOal7Q2OxWIqe1+w4fGM/g/gWw=; b=Y2fGN4RkiBYJKDwf
	MnSGehZf7bbloRchb695Nm0irew8uxxgpDhSn3f01W5vvsyKw53ohZUu9AmCzeNc
	cC2tnxOLd1ydycIHhIo6ICPq51od9OcK/yVxnYSc/KnsN1rnmho7CSvnYnje+RsZ
	rDFa4q5lxV71dEJrEwnsj6iLkCpfSCNZVh6hv+DZnMsaQMrJ+i6FHv8vDAumsD8s
	E5fhYhy0IXFcYRpIn2f0xxaSxIiXJzHNWFgPLLi4kiQ89AIEJtGXZE7onfOVMrFu
	CxQydh5+dYEqOjRZ5AoIY78KVhWpdjg/EWtVcRP+NReV5A18UwR6l6WEtZvZN9yj
	pb2JLA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbyxukj3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:07:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb5a76f13eso151605485a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 05:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771333678; x=1771938478; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f5ADTz8P05lKTT/ohdOal7Q2OxWIqe1+w4fGM/g/gWw=;
        b=VYHUhW4+fFt7Tm0TyqGdcvvJUrrb75XzdXsXfW6LnLo2+u56M1xjhaUjWTCpoXMJl9
         WpefzcmjlId+JCA4x1jpy4KCWGNJ9WBBKFTF6tm3M+zKDodWC0dx3bQ64y6jbHZ/6h8a
         kWY/QQIMTYqkfg8UU5+UTci+t/Npz2/ATsvfkwQ64CtpEtFVyVaHKwCbqjJ7STCO3X3i
         9EMfrB7zc8+If4CNMGrhta2A0uI5dJ+gPU9qgO4sxQC3wcsd7LvP1a0SkX11P+tC2pA0
         scv1lobxRGS9dgFDWjQTHBACbIsKnh8bNaMsp/ksyR0+A6m96bbPCwi2CjeKJ0GdW7xO
         FtqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771333678; x=1771938478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f5ADTz8P05lKTT/ohdOal7Q2OxWIqe1+w4fGM/g/gWw=;
        b=OCR1WJU9/nKSLkKfHbfRLXYPbVxQ5OpxA9dkmOs7GUxjtPMm5PVA6CnxaY90G1b/C0
         d6/pLln+2nEy7UUgEaoYiaS9DcP5CyeS6jTu8TkA9moD33jCG5mmcPx390DNi3dCNmQI
         3w9DEihl23feVCqha/l1YvwRt2ELawLWur+F11nOvGuCbPgSCMmiuIN+jL1iyDRpqqPD
         kfmxf1n131cc1AkzijD+YLj3VKLnjMKndUZcsjBM21tfu4lIola3wSFiyTImI0+ZJAtU
         nRbqdm7bZ77g3HBKKRmqhB/O3b6DE8CGu0sSXCaSQj73iM8XN1lMyRHmmLgwnrID/c1U
         jG3g==
X-Forwarded-Encrypted: i=1; AJvYcCX2m2lqL4wzdCyQ3Im18FiwE5PzY17rlRJoNrkpWx0hbtSG7yVXnE9LmpioMp3CWKAkrMpAP7l9gaSltOyR@vger.kernel.org
X-Gm-Message-State: AOJu0YxRp6O0X8MrCZ9lR3uqD7iKbV9rAEmHaNZVfq/T6qr98ht3/ObT
	ElQOODM5hVXo5KOSfRnZ55VYtuDUpvgFOHHVbz6KIwa616QXNYax5pOwvaIDnpmZUFTC/pfz8QD
	vINkkU99hERLv0e+87j2M2P5PR65SQXgvas8n7Rnl+isj4KgdbczkpbvyCtVMKXV+rLov
X-Gm-Gg: AZuq6aJ1IYNEHVdvmP5BKSw5s/Jy6EqqtJ5MqQz8OFzROlkZR5Lq9MY1z1asU4EZIu0
	d6AYHTcsX3nN85spHr9Lo5brcVuK87JSG9NlLh+9JtqQZYtZFIIkmshi8+pwal0EIQPo7t2G/ac
	Q+Bs3XcRy1nOpvDQZAbgogK/hlUaXsXemPXnmNCX7KunlM80gItaJPRLaMrlxqlBDblBD2rByvC
	hZAYzZqR5oUPVirAck8wrMxVA/CQnTNEif3ida6zeagvDj1sAH+ZPXxGonp5+qoEGqVnIDFaNz6
	nAiJo7U5yN/p7xolpp6p9vsLUS3R4zhYmzsxBBgJBV8mKVFkJM0WnQ7HoYFEfbRN/WDeMumpQyc
	QG1/zsZ7+P3cxGIZR1aNHfwgqSzkokddXIxiLMmkiT0j1BMH+mpzwL52eiOoPv2zIOW1iqzQZgb
	wte9M=
X-Received: by 2002:a05:620a:4441:b0:8cb:1d7a:3f33 with SMTP id af79cd13be357-8cb4084bbe4mr1357956485a.4.1771333678055;
        Tue, 17 Feb 2026 05:07:58 -0800 (PST)
X-Received: by 2002:a05:620a:4441:b0:8cb:1d7a:3f33 with SMTP id af79cd13be357-8cb4084bbe4mr1357950885a.4.1771333677349;
        Tue, 17 Feb 2026 05:07:57 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad3e356asm2383640a12.16.2026.02.17.05.07.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 05:07:56 -0800 (PST)
Message-ID: <bc36449a-c523-43b0-b2f6-fa8eff13a8e0@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 14:07:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clk: qcom: De-acronymize Glymur SoC name
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260217130047.281813-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260217130047.281813-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260217130047.281813-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: C_Lxx4Cwo8iN4ZgAip4_p6y7fzGreYij
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwNiBTYWx0ZWRfXxDJnN5PXCSEA
 92WUxtOO81QxtZmN/6gKIEn+r7kh+CDF0JCs2yBa5v/HG9dEV2Ssqt3LAOKFjdq49cfO6FuMHw2
 wk5iLuiQPb3M4v8henJy2UPTlRJczNk2uBla4zor/sGKWKsAcvd0TBe9MzltQfpqa4uDNySbKDK
 nuhVk6Fy68vYc3c73ccH3FSv/5HrpQ2L+pSLA13I4icxlZ2A+3gn9BbBlAiheIlSHV+uPk4xpYk
 20ZhhLaIHVGLG3CjTIiBEXlJxUgfievGlpF+JBpkaEmA6hSY3MbwzFPt3tnyQi3zcligcwngDXa
 uGgM5gLUGoWAqt6xV8Ckobg/2WMPM5Oz3jb2nziJQ9LLm/XSHNN7pZFXLIUIBuzdAuLsHVhjyZf
 s2MjntQL4L0Up3p/OxUn2XEkvkSVb1A5wOtFFeBDTiyrEhdfVCo+OwYvl34OCw/Z//yfI/szp3a
 frBGpkuY2i5pBy9D7Qg==
X-Authority-Analysis: v=2.4 cv=BpuQAIX5 c=1 sm=1 tr=0 ts=6994682e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=Rh8BIR2qzSpX2dRZ-WwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: C_Lxx4Cwo8iN4ZgAip4_p6y7fzGreYij
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93180-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B1B1B14C64C
X-Rspamd-Action: no action

On 2/17/26 2:00 PM, Krzysztof Kozlowski wrote:
> Glymur is a codename of Qualcomm SoC, not an acronym.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

