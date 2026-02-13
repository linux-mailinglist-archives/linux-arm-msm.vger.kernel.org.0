Return-Path: <linux-arm-msm+bounces-92764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIx4MvX/jmkAHQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 11:41:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D13D135320
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 11:41:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F9483051A90
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 10:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B6B352F85;
	Fri, 13 Feb 2026 10:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GsGokeVE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H29IMZ7x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E4332D7F7
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 10:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770979293; cv=none; b=DaSWQreH8GJgek7SnkPE9RT9sExyrKlgTkAUPHMp+R0yeWIh+hmzIRKvjo1d30zTBWkoF/hd5EKaTU1TbiFMoFrXMUVwNEHpMF20bvgUXYmfgBlx1TwbxCPgkG7bwCjQmThuwjp//lionE46scTAGTa722SMg06qLhXtj3T7LtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770979293; c=relaxed/simple;
	bh=wgmwpsW7eeK7dT6tep1a6shwrdiQKLgKcMB8xfG2iu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NbxnnJZam8o/UuMwqDWsYSBX5m54s3pmLTewRZq0tW0mJ8qyW+VkDleDl19mEVk1lLPJSu/w7d+rCQmCUgGsAUPYkdCYkuRAP5Bj63oWbRnzFbYRID/z47MHxqNTFBh+rU/8YyWmUnr+4jevTrx8wfNsephF+ruHRE2rjeG0e7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GsGokeVE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H29IMZ7x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D75gFL3332780
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 10:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	euRNAmbdPE0Yo9bIP/pqIZTm2YoAfkfcYcqSuQD6OjY=; b=GsGokeVEMcmuv/oL
	WHtZELBYm6xGjvJ/Dv5b45VSSq+1wIyM4c8KS7cy2Ne3EZiYHjOc5CnkpmDjUUNM
	ji26wdRCXhNH3SreICPQNgh7qBdCXEErArgOdzH7MQ8r9hj+7JDfBJHw3QRww8MP
	FjxDkw9CH+fDVhgbYI5q1qfHdBJMOCnWv0rg5MYZKCcUxuFf1rbnZgdJruhmgMnD
	QJUXK6Sf6z8FEu/eRG04KsO//tjJUZ/+N8xZbbCVC5142jHZZWNZ7unExVp1YpAn
	CD+dtHTsYIUI+5z5p4bfFmji8OX5IOr6Sn6ipMLggQ2sIYLzZcc9tGewZSA5sLk8
	/6qllg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9mb1318a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 10:41:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70c91c8b0so37398785a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 02:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770979290; x=1771584090; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=euRNAmbdPE0Yo9bIP/pqIZTm2YoAfkfcYcqSuQD6OjY=;
        b=H29IMZ7xeS9KjGXvSV6GaYuBO355EljnphcvUJS3DNh/647DCfbhR5ZAbfL3gwSgoF
         qmcyS/Tm4ymk1psbXGw0OUovSyRioxJaSVSi4eahsg0Ie1LWxOqBC361i3n1T5bTBNPN
         Evqfu6lTf0VVyLbBXWU+ZW06foLwLaISGo7ZFMLKQIlsVshIcb0T3AgEQPrt6D/TTSM6
         wSEYuRXRe1tm0PaHeHW7RyeqvMS9+XypbjoLaQPS30qJtwSVyXZKOQJXuS5N+G07dyIA
         ejJ6B9m+hMQJ4zuVOqGGC2hkVd1kY+vd6D7/yqaeylfc+Nf/NKT2PxZ4AzCFuomSIqVF
         Z9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770979290; x=1771584090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=euRNAmbdPE0Yo9bIP/pqIZTm2YoAfkfcYcqSuQD6OjY=;
        b=vsz9d835ES39DXRv+GS6fGV5npXNyPORZXdg9aiION/L9V9InniZQJ7AHr5EZgU7ta
         SSJkMGjBFE3QP3Bhu/CwsHMUjrTTbMkwCIMV3+ySI0AFeiLODnLDoUJISjxRahd+PkT3
         cvbaEtcM8r/MLhx3G3TpQUAHRKkaT8/8zgXqHb2fc2SAzkJW//sYXh6uhu5Jkr5PQHQT
         URWWB6p+J1YE82T/z9a60My8S3ZUMlzC1eZvap3JhUJeHXL6eiOd6Z0vSYEqxgCyZp8+
         kpXW6p8De0qNHwH1l7eCUS80pln+xnGhPxIoRj8fncfkSDTDBmduJrbotVjWCemoDjd/
         xcsg==
X-Forwarded-Encrypted: i=1; AJvYcCUmmCLlfH9TBj593OiIDKYLxekdPYrCPJM/oA+SQ5yhzvhB+ME186SnSKD61oeT1lHYBLZUCsnzBKY18LIM@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0AVyzIoobXF1aAGOHsAO5YdqQKhurbE0VQA5cbKKW1KpUle/h
	auZv4iBdloCQ0ew82DULp9A5Z+YXF0j/JHPtzJ7IWZjtVGTTrwd9Xq9y2oaTHjGauDnDJlhnuIN
	2b0BKWZWPwkaVRD2eMEv9++/1j0ovwYdRYsvxgPrK0RllD0MnDs/DEnQtvxb1jyqC/g7Y
X-Gm-Gg: AZuq6aLfo95BrU7HYVHREmlFhqzvIcZwHpdtnA/HTJQgMNNQSlnVmGyeM9Dr2BCYTjK
	JzQAJ9YEnufdDljdW5yZFYXkyXaqFLPCMUJnKjKyy8yIdnE9Iw/midy4biQ/gWJJW8fwGopQq0v
	JSSohXpPbfdsg9cOVl5OYkCkTKec3QmdveEDyy6R3/toM+3Z5ZZkjH9QgO02CgOZPSbyMkFnpDB
	GeJ7Tz+vri6aPzBWYupvz1c8KVlvuHTdQmCou7Mp1AnaQQzKw8eWrHotvWiU+Oe7YvxK+5Hy9dc
	QsDM2Bd9ut2BMHKyZzEMDWTqQYQ0KIsVI6vcvNj1YZnSnZRsY2MpKEt+vVwpN5ypaQabvxohLQu
	CqvYayTg5PiXl3DgO//Tvtz7VPsjqoHdEgmso8xOb8uj/hLXc4TODfd3JNP8kS0uwpDiX4HHoSz
	bnQfM=
X-Received: by 2002:a05:620a:472b:b0:8ca:4545:aee4 with SMTP id af79cd13be357-8cb40807ca3mr192990585a.1.1770979290397;
        Fri, 13 Feb 2026 02:41:30 -0800 (PST)
X-Received: by 2002:a05:620a:472b:b0:8ca:4545:aee4 with SMTP id af79cd13be357-8cb40807ca3mr192989185a.1.1770979290036;
        Fri, 13 Feb 2026 02:41:30 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad19be17sm524394a12.4.2026.02.13.02.41.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 02:41:28 -0800 (PST)
Message-ID: <a4cfbe52-51cd-4851-8a1a-2830886c4dfc@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 11:41:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: hwmon: Add qcom,bcl-hwmon yaml bindings
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-1-7b426f0b77a1@oss.qualcomm.com>
 <ae2802d8-2eb4-4dcf-8212-d8f2a41a7185@oss.qualcomm.com>
 <15fe2128-5a88-4140-8aba-0e8d73350df9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <15fe2128-5a88-4140-8aba-0e8d73350df9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA4MiBTYWx0ZWRfXxrQ9lE9+jHFh
 SQntheBpMZpPyxrE8xu+8t30buhgFXYrvGPn+3DR9gBTsF1Zmhwpw+eULxx62JoJi3i7D13Y87H
 ZHLSOpdYv5N2gjK3zehOi5/I4IBbPC8E8ffUVLfyF2u3ch+sXSr3PSmLic1+qxxmw/eWZ1Fqx49
 1EB+KoxupMphFrDLnWKtc3NjUKgfek2a7BuiPfo85Tsc7CO/Gi9s7AU5buCkYFLpVPgCEytUwaE
 +XWKhwBSP6Fj8bbHPAgnhGNUu20XIEPXl0A6KTfdhk7P4DkkGI92jKXC0RAQYMALQGeWVQNBH2N
 d444SS63Tsqzvxkk1WXI0g2kms4cNu/sVfRaj69Gwj2CdVSUXTzn27JgbkVj0+UcxpvDlom+PYD
 vZPv5r9UgH72XJvRHWT5MHo09MFgozCSXUDoLPJcXfLl3JiMxjXxvYH6d8b2LavNAVMfMLripD9
 KnKJusavL1WttiHMJCg==
X-Proofpoint-ORIG-GUID: 9hWf2wCOP3m23o45dZ-f2IdtLOx9YT0X
X-Authority-Analysis: v=2.4 cv=asC/yCZV c=1 sm=1 tr=0 ts=698effdb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=Q9nwfTyik-j77Jmcf8EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 9hWf2wCOP3m23o45dZ-f2IdtLOx9YT0X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_01,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130082
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92764-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6D13D135320
X-Rspamd-Action: no action

On 2/13/26 7:04 AM, Manaf Meethalavalappu Pallikunhi wrote:
> Hi Konrad,
> 
> On 2/6/2026 2:38 PM, Konrad Dybcio wrote:
>> On 2/5/26 10:14 PM, Manaf Meethalavalappu Pallikunhi wrote:
>>> Add devicetree binding documentation for Qualcomm PMIC Battery Current
>>> Limiting (BCL) hardware monitor. The BCL hardware provides monitoring
>>> and alarm functionality for battery overcurrent and battery/system
>>> under voltage conditions.
>>>
>>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>>> ---
>> [...]
>>
>>> +properties:
>>> +  compatible:
>>> +    oneOf:
>>> +      - description: v1 based BCL
>>> +        items:
>>> +          - enum:
>>> +              - qcom,pm7250b-bcl
>>> +              - qcom,pm8250b-bcl
>>> +          - const: qcom,bcl-v1
>> I see that e.g. PMI8998 has a BCL block, would that also be 'v1',
>> or something else?
> 
> I added support for pmic 5 bcl design from v1 to v4 in this series. PMI8998 is older pmic design(pmic 4). As of now, we don't have any requirement to enable it

Right, but then you never mentioned "PMIC5" anywhere in the compatible
or the binding, so this wasn't obvious at all. With the request from others
to shift towards PMIC-specific compatibles that won't be an issue

Konrad

