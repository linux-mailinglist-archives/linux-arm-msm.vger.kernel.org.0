Return-Path: <linux-arm-msm+bounces-116225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9HjCKKZzR2qyYQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:32:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D32370017F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:32:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CZAkf10s;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KqQRdGYc;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116225-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116225-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B25E830F423C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 08:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6DF3403E1;
	Fri,  3 Jul 2026 08:18:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF00314B76
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 08:18:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783066707; cv=none; b=HvAEIAqqCpniscC1rmvfw+ux5v5Vi+eVNlfh9N6/dm/NcHQOjDONQHj4BVs86e7e+tqSyYltwe+v4q9/73BgX/g6XTHiz1DPAiNtj6FHKZg1CxGZDurO1YmSR63BpJMUKBi9GDC81i8CpvgHlhHwfK0T7502ItRrvMpGSDuCi1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783066707; c=relaxed/simple;
	bh=X7A2d8nw06smgyIcTq9KpSNNtCB1qTjlb0Lz/P935uw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UGZJXYnhl9M8Lf9i1axIQ51K61gR4beLIDnmmgW9YesV5wnL/TtrAw0DKEM8xWqOSi3Of12LGNMS8W1xPFTTEjTyRiYlB3P3Bwau+GHDQ3z1eGIo8MjMvhB1/1PbjjUNTAcBnVqgudFEl948fhvJ2CcaTTm20KtRBAy36v5EJb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CZAkf10s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KqQRdGYc; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635reDk2994861
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 08:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yHznjqxcH8V5jOn4X+unmnLf9eh1cHDxSeH30hTY1dU=; b=CZAkf10sVKZ+Z5It
	TiO0mQoDevx3Rhg54OrCNL1N+ozBkP9FH/slp89WHvQSsEq7DcyJPp+3imxnfm8y
	PaoLWfGsaocaQEXd4AnUZD/4sPMLMk6tX0POejoffawL1mYG3hk9IYMmwyN3lDCv
	Rz4YRz55iSURxWmjSE5JO57fQ4/JQbHN7yHwE/8DozGSROFGVX2FOP02Wv29AY/n
	qirXwrLFrDzgawSuwiL4ZI3R5qR0DDrw0TtmAvz4Pq0zlrlI9rVL+Iw69F/o0uLh
	LZICJLQMOsqvl4WBWZD4tvlelnoGytXTR46G5IfixDRLg0u5jvebUHtNeLYR+mTX
	bx8K3g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n1dgd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 08:18:24 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c98136ceff4so610960a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 01:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783066704; x=1783671504; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yHznjqxcH8V5jOn4X+unmnLf9eh1cHDxSeH30hTY1dU=;
        b=KqQRdGYcXY8seHqrd9YjwbAW5LqBHF9+QjtjOc02sU2ar8D353jqCkk/QTyLO4WovL
         pRBNHUqcVLBeGJYJrXd2rKaJdE95tZ5MgjNgVT3zhcXfc9pUGvsaxEqvuZdwrwtZ8JIg
         FxOlh3ZslSvDgJTmd414di7siOYSIQY5PqUQQ77m3OMFIk48DfQrYJemmtFC3W1twyts
         pfCJ9ScLR9puEHjOpMmnmrxQJJnHvtTJRO/nYuCqc8y0JS+9N90vwYMnMfhYRNdzVWDg
         SEVDd0DyHsvzTubwMR7T/5tynNxtddDyxJbi4TScBT5UsEvricjLVEemqSLMc2DSj4E5
         hCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783066704; x=1783671504;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yHznjqxcH8V5jOn4X+unmnLf9eh1cHDxSeH30hTY1dU=;
        b=S60JpZAlqtXOSKSdNTLsORinF9fEihnJYuP7GmXwrvSVoDVkNTGc8/X/FW6wPukOGU
         mXQNPHvcItKsxASc7yjH0BVyCGXoPdrns22xXvh50DrDwTNUR9EM2BKZBmtGSsjqTyi0
         Y6zQR0Srp6alcpW44jA/j11i5YvIvIxdV+SYNeZ42hznG4V7jvCjVmPzWw3OIilO6bnA
         KZ5qwMXCFahBY6dSbSXX6svGVED9wO32ZTslK9Safwlltfeyrc0ig6SFcvh3X4bKvECA
         fCwyvDu0H3E6jrJTp7G1UzJ0vE7XKI2/f7DPqskGJtEEUBM5xdi8ZmURktqsiXSw6gbc
         9naw==
X-Gm-Message-State: AOJu0Yw3nSFrEW3ukMJBVtdUE9clGmGDic0hs802j1aICdCbnPZbuiC0
	LcKlGTkn/qbk4YfCYGFnFhSJeYvNrzCMKsBorwXdcIm1mwanrKwOn6WowMLgSt/TY0NidJDWvt5
	fMLFdqFFdd2rGqcch0V7uuR4SUzVyU4m/chwsTwrKBHbuGnOsoTbS70x72CVUN36nn4Il
X-Gm-Gg: AfdE7ckUt77uarrrK185nXPYEILTwMfUxGPMNBVtbXw2WdMM5iGhMLkeB6eOhLSr5Sq
	LX5swRg2A50LdH5j6RZ0KUbTC7oIpKNBLX/sfIoRYWsqC7Xfo6ljghLllzafuev4pjRJWjcJW3p
	3B45alOs03gjZM+nFhMW8JL8Iu+mTQOiETBiAOQIKR6mdPPwo8yKnUQmM2YVN+VMkDbiCyp2MYs
	sBEdc3SO3X3D3JvN9MtnJUGoePLhvPKxUUYYMy3/9VC/WHy65yWm/r7RZRUoW/shFEieeDOKgyu
	/kSJRIVKIt7A1KSwHEEGH8PYd6XZUY047Gk+278uEzzAoZsLKCfuGWAcsWSpUmqW72GZcvq8GRe
	NDbIVsrIoHiylTTnsD77Q6nDMB28b0omYA7Mrpt1s
X-Received: by 2002:a05:6a21:9f07:b0:3bf:6c08:2847 with SMTP id adf61e73a8af0-3bff42f825bmr10946884637.54.1783066704021;
        Fri, 03 Jul 2026 01:18:24 -0700 (PDT)
X-Received: by 2002:a05:6a21:9f07:b0:3bf:6c08:2847 with SMTP id adf61e73a8af0-3bff42f825bmr10946858637.54.1783066703563;
        Fri, 03 Jul 2026 01:18:23 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c870effsm21148189c88.12.2026.07.03.01.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 01:18:23 -0700 (PDT)
Message-ID: <996d66e3-76a3-4d12-9e79-8dfe3e96137d@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 13:48:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] irqchip/qcom-pdc: restructure version support
To: Thomas Gleixner <tglx@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-1-4d8e1504ea75@oss.qualcomm.com>
 <87mrwcqejt.ffs@fw13>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <87mrwcqejt.ffs@fw13>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA3OCBTYWx0ZWRfX/4Fn7d06Lc7d
 MzHaf2zhK0Lr0EKyY1QDkfOGgbBuDTKz7nOX1CW3A19kdjXmUfNKrzwMo40g67sfMY2ZZe+8gAJ
 5jrusJVvIOuk0fYOeqP5+we6+BEml1w=
X-Proofpoint-ORIG-GUID: tn_cwtpVwN99YywjiF3AqQFGSXYY2Opg
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a477050 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=xxOP1YzqUXX0Hlv9yD0A:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: tn_cwtpVwN99YywjiF3AqQFGSXYY2Opg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA3OCBTYWx0ZWRfX/sBhDgXExl9a
 O6XzAIG5HbigN64bIOHuX20SWE2w4++QNneiWMX4QeyMemzjWHu5oZkHwbjWaeUmEgFk1qK7V93
 U+RXdGh9uE7VqovAZvaCZQwqwHECQOWN8jQHsSU+KqxKvFM/TxiIW4WpwB+q5/X/GFiFU0wdLp+
 m3vNJXSYHYJwfzMGy5WTU+uWrq632ap2iXYZCbIrLvb2iVbUypEEAg1Fpb0z5Pw9iCHKyabCEU1
 a5jWUD52lbbNuhle0TTHZwrMR79gdNxaLCrNHg01EtbUWU8AxhVZYNPDOR3DizS996MCSXqdgJ9
 gMIucODP0Lb2IHOzq20fUC7Dja/CBGGQ7rdpw1N+pwbbii8zkT7BMzTSKky3imPxX16ZTm5UJTa
 ZK9Xh4HQgWKMQt1HvwXc3mh6He7iMx7jbZShuvHf9tjVfC4Wy4KY84VsupAwjZ8QvjN8/p22AHR
 WRyDgT8Bi1J4PIrxnZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030078
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116225-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9D32370017F



On 6/30/2026 8:08 PM, Thomas Gleixner wrote:
> On Tue, Jun 16 2026 at 14:55, Maulik Shah wrote:
>> @@ -336,7 +418,8 @@ static int pdc_setup_pin_mapping(struct device_node *np)
>>  		return -EINVAL;
>>  
>>  	pdc_region_cnt = n / 3;
>> -	pdc_region = kzalloc_objs(*pdc_region, pdc_region_cnt);
>> +	pdc_region = devm_kcalloc(dev, pdc_region_cnt, sizeof(*pdc_region),
>> +				  GFP_KERNEL);
> 
> No line break required. You have 100 characters
> 
> Other than that nit, this looks sane now.

Sure. I will update in v4.

Thanks,
Maulik


