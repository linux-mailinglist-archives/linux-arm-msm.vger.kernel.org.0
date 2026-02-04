Return-Path: <linux-arm-msm+bounces-91828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OF/lN9x6g2nyngMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 17:59:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AA3EAAA4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 17:59:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9592301FF80
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 16:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444AC33D6E7;
	Wed,  4 Feb 2026 16:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MHb/wRDK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UVhCf8rG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECC933D6C1
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 16:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770224024; cv=none; b=g+fbJYyelgPgaEnjoYIjliqy9jBpJs/S/C00MUY2xUOCqVSwlTJIkUQAfyyWlsvdkFNGUzAUZ+Gjt3zsHkFmAoOwW5XKM/w4krwQGB/mkmSv0yPkaest0vD9NCe1d0hxhhkYYtCYQxp6fw4sT+k3i867pYvG9jRmgaC3kueI9gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770224024; c=relaxed/simple;
	bh=zi6HkUKBfnP/t3J/J2ImkUwQFEjslB3MRWhpAK1iazs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ln3lVwYC0XhqPcw03a8o6SZfnGPNheqnQZKOTXXyK3/iqIGuMG0eaRUe9P7Pj1H6yKxeHjJImiczGYUK75DAPKEef3oAhfkDOEm2hcXQ56kG3KxSNwg01wAiiIgi2kDGsfh++NfzN74JIvGGtTXksiw+dVtZaLqZ3Wigl5L5PrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MHb/wRDK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UVhCf8rG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIfpF899472
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 16:53:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F6RbjU3p3cldbw8gS9JUC5O2zV5v1JuXRiSIeWr4pEE=; b=MHb/wRDKxMceG3s0
	xGvOvFkYc28JnC9r7kCVXMwoRtgSs/21iV0bQKHpGDbTJPLVsNDjdiNvoEq+7bN2
	Z966tXmxhnuRPanasolkV4C6aDgWv9EXVIue2q6yJV+TzUrUozzl+5nnOQ5lO2zw
	5poF0eg2ua+Z48QRuOeW+Mt07Ehq5GZvfPJqb++pwp6oRV8Zw62IboH0shLIntnF
	s6dA/5M5Dw9agfu1p4SfqFBEgtRWnb0dGg0Yce/T4cGJMSGbp5CeFKnzzSnYjMkI
	I796OD+aZS33V42e6YxDSyXqXBdUsZ/iTegsazk1aQIK5mehP7jv0SUkN1fPNCyv
	0kQ/DA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c445wh6rh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 16:53:42 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c552d1f9eafso14295369a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 08:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770224022; x=1770828822; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F6RbjU3p3cldbw8gS9JUC5O2zV5v1JuXRiSIeWr4pEE=;
        b=UVhCf8rG1yElI/Zjrnn9f/Uu62jv7F84RcSog/Gea+bLLefGnrKeJqyM0OLYbUpunS
         4jdhwpy+Debyva4rEgmiU/cF15MeYLgFZq29W/+eITI/2B9ZaM/hQthHiUan7Lc/lBuS
         bjQVs0pTgfodlPklk7Jp72MwDTTrygYow0/xgsAAg7dYpBMK4OBxQ0CoyPu9tGlXCEMC
         QC4jU79y9rn1UUEifKGSakKewuvuV79N29H7TRhB3ViOexwzJCSZRIgXMiTXehvnM8ME
         3S5WBBf/CU0PpZdkA63NFFCQpBqrzP140z9cI46pSI1XTfJo17xVt+JPbCJZbnBBq5IM
         uw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770224022; x=1770828822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F6RbjU3p3cldbw8gS9JUC5O2zV5v1JuXRiSIeWr4pEE=;
        b=YLm75GVqVGufqXBfqK+zIwahExAk6T+XyYWr9zED19gQgmeIM6BV9V3wmpvFZlb1kp
         kIi82UfSK9FwwaEqxjN5hJC9i/HFS+gAXMs6BVxF/0c4Icw72e1ZQkv4ZjN5W3l7lIym
         bHelo/FR+kCVlE/FzuyYNEhVRqL5hWm6VDhHWfj0OAvv1LLu5VrgxOn18dC385naZD6p
         st+7iGM2wOj3R8qnIfO1/EL9/jxR4fUL73n17Gyw7Y0B3mWLob5phhrVnH7qdHZsuDKz
         BOqmnDWJQrZtW9giM4VwjdIcA1WBHM4PQ2X7z3FxnoMLz9QHlqPI1DD1BfZANcM3eIpL
         Lmww==
X-Forwarded-Encrypted: i=1; AJvYcCWTHxTBmutE1oBFestGyIYpHmoyZ0BvW5zAe5GP8Ee9/98rWaMqnuR1HMezmK5dm/tGPhelTzDXGiDUI7Rx@vger.kernel.org
X-Gm-Message-State: AOJu0YzmTmwHK6LVz3d0sB7fgipOiqDp9fe8hKw8Pd46wQvQgXas0G+A
	474JhJC7eWWGl/C/QOj7DaSxslSXvNEDivd4S62mUUxjVVk5oJYZLZlAlu4bD22JMIqV9qBp+i9
	ZEmmpVLtFPBZO5rtJdIzo+6+FtD336d9XQh4r7poYt4ankPPwHizCAdN3OSzqZirmRiQg
X-Gm-Gg: AZuq6aKw8n0wAJwmwNJtx+tORuSZt7hv3ktlxP1C7ysxKPUcWMAlYp+zZBbT0ssiD0r
	nz/KtWh4b1xO3fg3w4JvrGI3/oJPwGHHO96JAU5vgOziQB5xHHilYsNV/O7WOcZXhcX0y7qGuHT
	p42JZmxITp6UaTvrwWGx6P5/7Fb7QAQfZ31xIK4COyGRnWiM76vKjKn4GHKKH9l/ofMhMVuvo/V
	ElvX5OKCOwi1ETa5e7A3Glwg0+6PGSsOfXtfMNA0A8UjXJWN5oCo5P+QcPCUGvnMnJhOKz8nxf2
	Pz59OQJMR2Kjy3kJ28t+8iFhDKvrsiXFEYY5f8HB6stvy7VWNLYB06mCRMjtXEhuPBmqkxPW5ZW
	B3eWhT8ObGmO/QHF0uCv2nw84HpxoIAzImF365g==
X-Received: by 2002:a05:6a21:4508:b0:35f:84c7:4031 with SMTP id adf61e73a8af0-393724aa832mr3903405637.55.1770224021838;
        Wed, 04 Feb 2026 08:53:41 -0800 (PST)
X-Received: by 2002:a05:6a21:4508:b0:35f:84c7:4031 with SMTP id adf61e73a8af0-393724aa832mr3903384637.55.1770224021337;
        Wed, 04 Feb 2026 08:53:41 -0800 (PST)
Received: from [192.168.0.195] ([49.204.26.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a93397c472sm27992595ad.89.2026.02.04.08.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 08:53:41 -0800 (PST)
Message-ID: <469148c7-c7b4-4266-a07c-4a5195ed986d@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 22:23:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Questions About SM8550 Support
To: Aaron Kling <webgeek1234@gmail.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org
References: <CALHNRZ8qSOZKwmBznRqvAAjMcQ265iEdBXEA2RSkSBViKO=uEA@mail.gmail.com>
 <4d73907d-9915-44a7-99c7-2294c4be01b7@oss.qualcomm.com>
 <60c970dc-141c-4a2e-aaee-719786371eee@oss.qualcomm.com>
 <CALHNRZ-3nr+EF_m3UpLHRfv3bpOdzzxSZfnnk99xH87MM8WiSg@mail.gmail.com>
 <f4420072-4540-4e90-a22d-02b79784c3cb@oss.qualcomm.com>
 <CALHNRZ_k6ePOC0AuJR_-RUF-bts=pkWpcrB=L8=HZbQQTFnqmA@mail.gmail.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <CALHNRZ_k6ePOC0AuJR_-RUF-bts=pkWpcrB=L8=HZbQQTFnqmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEyOCBTYWx0ZWRfX/ECHYsDOyI7K
 p11JzZeMu2vIR51YArslvABrJMMA7kX/4UtWaHYU/oqUzanTxDETwugIKwSbz8RKsvam6pmg/h4
 xAEbK5ruyY10eEOF1QwtZG2256z/UODTmTaeoXPeLyFhawFvum779m1eFI3UGQtUWSlxlDE5VEF
 J4S7Q6+bP9/jZ0CoUSceseVGoaHQ9Du0j94j8qxo/OWG30AMco/tmGA9QylAdQQsVsZpOfK3+6h
 9CT71o2l35t9dHYwzJU1D/dcodfxkMeET7c1Vd35BXOmBy0ZqfRZ5EVX2QER0XTOk+X53ACatSy
 +wb0vpKoL8rV/Z8yrDyvp+Z5BkUlHHuDPxqZYu6oCPeLL9hBRTKU2Vc0VtVtXYLWmsofhSjp2GA
 nzZb1ACvXzIgkew1IwGz319D9NUfw7BTlopmfIZm817irUoma+iCGDt0YAdY5ZT04nJu9EMiRsa
 s4yFrtCNYMeG4h0k4kQ==
X-Proofpoint-ORIG-GUID: DUO3oc_skulVk-PJInALhQl5WHRRXbw-
X-Authority-Analysis: v=2.4 cv=GvhPO01C c=1 sm=1 tr=0 ts=69837996 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=4SK2cRMLhjb37gGuRvOPyg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=GBOZxCzhY-ozrUvPE1QA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: DUO3oc_skulVk-PJInALhQl5WHRRXbw-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_06,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040128
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91828-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 33AA3EAAA4
X-Rspamd-Action: no action



On 2/4/2026 4:51 AM, Aaron Kling wrote:
>> +                       .flags = CLK_SET_RATE_PARENT | CLK_DONT_HOLD_STATE,
>>                         .ops = &clk_branch2_ops,
>>                 },
>>         },
>> @@ -415,7 +415,7 @@ static struct clk_branch gpu_cc_hub_cx_int_clk = {
>>                                 &gpu_cc_hub_clk_src.clkr.hw,
>>                         },
>>                         .num_parents = 1,
>> -                       .flags = CLK_SET_RATE_PARENT,
>> +                       .flags = CLK_SET_RATE_PARENT | CLK_DONT_HOLD_STATE,
>>                         .ops = &clk_branch2_aon_ops,
>>                 },
>>         },
> Both reverting the clock sync state support and setting the
> CLK_DONT_HOLD_STATE flag on the affected clocks do independently cause
> the warnings to stop.
> 

Thanks for confirming that Aaron.

> So this is an ACK issue and not related to mainline at all. Sorry for
> the hassle. But while the topic is here, is this something that should
> be sent to the aosp gerrit? I'd be willing to spearhead that if no one
> else is planning to. But I don't know much about the underlying issues
> at play there, so if anyone that does know more about that is willing
> to, it'd be more efficient for them to do so.

On the AOSP, we should be having another code altogether which would
include all the required support. Is there any reason we want to use the
upstreamed version of the driver?

-- 
Thanks,
Taniya Das


