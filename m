Return-Path: <linux-arm-msm+bounces-118684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i8CoLH2kVGq+ogMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:40:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2F1748D28
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:40:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dVzQgizB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fOpkLbxo;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118684-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118684-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 879A7303EB28
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 08:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0FD53B1016;
	Mon, 13 Jul 2026 08:29:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711323AFCE5
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 08:29:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783931363; cv=none; b=Nk6F4X1fDxTqe0idrRLzJyJj3Z/lz4yWflYiD2IsPQfVpf7y1G0QHLv3pHYs8iMykUN0KEEshuBv/JNteHCyWmLxntdv5r6MO4jvWzmNAICfJI+sNBB1nFAbmGVGzwi4SRU1zlWm+B0nGw9OiXHZLTHIU87GKizuRaO9dgADCPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783931363; c=relaxed/simple;
	bh=09gwAOIvWrUT011HK0YUkRTcGAOOHymVhnDkjMFHaLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ibIQ8/stn7JA9FsNjTmWJuQKciIT6piVuteWmuwJN/MjyrBGvHTgtCmANq4kGrnMhqxGBR/GV/HR6XUQFY0x94aBWp7rQ6JWOCCxa1kAbplT2IJa4zrbtCtP76NK6+LAI/rZu6xsaac+BY6WTnziN+nMepot6FBBqvXbjfBnBqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dVzQgizB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fOpkLbxo; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NhTd648361
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 08:29:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gPu99KlXeshTai9DWwRSdh62GROPGEcOid9sYlTAh90=; b=dVzQgizB32zWhKwK
	hZbpSd4oEZlXQA3pVEtGUfO+Yq9I+p3ry/wNnGhmPPWZ+TdlYEo6DfMvisyUpTI9
	Ohb0pUbUJMIPB68IoUXxTyxZ8pOSEi2rlu5ehjfgRz9aX/vsZw7m7zBm/WqAa5KM
	OdpQ/ZjFFYZxFNrLiyviIO3nqESO1MQ1MyO7cmBspePJQctiHi9waC1MWB3k49my
	+PCa1xypPHGr2MiZ+vwUUOmUY4Azyi98A5eofmfQQ2uMnoH3nzV5/koxMleXoE7K
	ZvfhLeALmghy64gPV7lJnwPN8TExBupdkKBzqlkI2BPNmLZRYMm9CPkzLj5rP7CF
	TJwqUw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbebr533w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 08:29:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ec235c7c66so35791546d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 01:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783931361; x=1784536161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gPu99KlXeshTai9DWwRSdh62GROPGEcOid9sYlTAh90=;
        b=fOpkLbxongQJXeK4K6roDStnUIvQ/Y/rDHLDUylHenmGCcxueoRGReFvMcdelc48AK
         5uBzsCffn3j2tP9BNSNjO3g6eGvEPzFM7NHqqwD27waHuF/wJSCqtULSkgMbbhHFXyxl
         O0k+Bxl783nl8EapIyuiAleNV//43rTEdjFPVbPaL1E47PRxlMrrhwr5XcH8m/YKp386
         6kpgtsqXQuyKVILujgaigW4rNl3MXwv4e340Nvn4J5b4lTSLtOizmCmd3nc8ckaE3I1c
         mEtx13SAPFtIRsU1hd6b76jClbZIcYyyghjOy4ZLy8voKEcEThTTrxDupQZ9YtQDKi6D
         ++Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783931361; x=1784536161;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gPu99KlXeshTai9DWwRSdh62GROPGEcOid9sYlTAh90=;
        b=bUZ7ITEBhsH+wibAop3SWj0hDK4SXjjoBY9hTmJ9al+f6+FuEHuifntnWKJdyO3I/J
         Hnxg4wgZsEKu1+BHRJEu1qO0kSMxOwHxQ8jSWyWHiOommWaFu5JjSa1pr2eOAg6NFhaZ
         ns7H5HNU5jFKzarvJzEPXYhz9Z/zG5/pEiUiWKpAh2lVS762KENmYGPh0lszX2v+37AY
         hDayPVIurSO7LRZ5D2VEI9L3Pdq17jcN0qLJHvw5Xzhxfbn/84b/yHl+Lg+kgWM3BpHE
         TGSc9JCU73NNSHjnIMIxJ64euHit/p2sFbbAD4QcQLbLxB5IUEPN/Gw25RymtFJ6F8rA
         XXYQ==
X-Forwarded-Encrypted: i=1; AHgh+RpfYStc8lDtzJsScrpRjWP81S8RsEQrlQ1H3Q9QYIw4uBCJXXt0N+se+dA7wOWJO3SFucEADSryW+Yqmw7j@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/0sMl2SMB+FfJ8HYmr4nugRHVHUSFsxOGphXUc0FwdSR6/Yd+
	O0xQOhjebpoZCJZ7W1UPodNbgizNsqnqgRhBsLS3qSVP0umllwN2eEjUAbewaOEnyK2XXy7Bbcr
	Xqaj0ti9aMAt2GOb9O4ndSIxTNssYWkLa/Wq7VFyXb84qx4TXVtpqicBHZ3o9k/RciePS
X-Gm-Gg: AfdE7ckcqesfJuJYcZx/tQ8aBc1LYDoIT4g5f/hwWngIQMHKEysB8fvnBlwoM6P26qs
	zixk9aS7/nsBqPfJqvDjU+RcxyJ7uUwalJbwwUaFyzaKlAwaCVpJJAQlXHidulq8DublWBtkJnQ
	fwRxOQMS8I8oyeljJWw0s9BNhQitK9q0VNWSQmowbYq3PlCzNhL8/bVKNZjzzSD+HJq29V19VJK
	r8XM8JKQRcZBeGN9fOSqHrxQTS0OdC71SMkTsIf1SKzR4rUnuH7GZjqZGJNzeoXoMHlQJcVHzxs
	baQWZ9/EjV7t0BJn0eqrfb14qFwD96Bdhp0Pl26wI44ZCb7pIwQH022nEjw5A03LO+h8UganGxa
	0V6JmAUQooDe0v5l192ETfhs2NJiWZsQlFAF1rlo4azc=
X-Received: by 2002:a05:622a:420b:b0:51c:7b12:1208 with SMTP id d75a77b69052e-51cbf3040f3mr83363501cf.86.1783931360787;
        Mon, 13 Jul 2026 01:29:20 -0700 (PDT)
X-Received: by 2002:a05:622a:420b:b0:51c:7b12:1208 with SMTP id d75a77b69052e-51cbf3040f3mr83363311cf.86.1783931360349;
        Mon, 13 Jul 2026 01:29:20 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d81bbceesm704212666b.41.2026.07.13.01.29.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 01:29:19 -0700 (PDT)
Message-ID: <86624fe6-b2fe-49e2-9980-0ae2fbebf108@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 11:29:18 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: sm8250: Add JPEG encoder node
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-5-atanas.filipov@oss.qualcomm.com>
 <7f0c7e6b-e92e-4058-8662-52004625eebf@kernel.org>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <7f0c7e6b-e92e-4058-8662-52004625eebf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4NyBTYWx0ZWRfX23p6SZ+NIpIi
 qYc9iCIF1+fGaZ7an7PaUN3/+xQ74X4Nor6g042TT8bcCFAkdtATDhblpkC/6NQnqCf1aEf6pVI
 n3J1ZXwie+xLL93gshNxSpgxWJDdfYg=
X-Authority-Analysis: v=2.4 cv=OK8XGyaB c=1 sm=1 tr=0 ts=6a54a1e1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=giEypKqMxUzoDvydzB8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: a1jfKhfmGimp3HUYXudfhDR-ypMm2zUi
X-Proofpoint-ORIG-GUID: a1jfKhfmGimp3HUYXudfhDR-ypMm2zUi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4NyBTYWx0ZWRfXymf+un4xC/Pf
 gwKumNHBus9Kjp48dV5tiGTV/pfRsHwEevubOd8QYMHfzWtgIPFZ+6/Vwtxf98Au6Cg9R7rkZTK
 VWOcpaYlWZv0jjyoPvZzCW4TJGfZt4SVmxGohoKRBLjSdrq2FEvCnZEAxk/T3aDolSYgqDLcSjA
 0+JcAn04rvplJWUDyesdlTtsjijUHaO4zyXmjITQPE0/B7c/MMLWbr3nJYAfltVvdFs3i66eR9s
 j9qn5GPcRUrnN5+XUXf5LJarKnozvyJbc5AIMRlcXXB7G6X5xz0ku4WmTHlMfRmAEQkrdmNx+os
 m4IC6fu3m2gTAHt5x6a7LdBg0gfIgHl8a4NHhnPdhq9LyYbdKHmwOqK241TjquBpjo2x5DTyOUX
 7LlvFD2AAgf+AMfoHyqgIE1M/RbGwfQ2KCWV6ZrgVtx8iJOEZ4ec8L6OUw6HkUfwjCeoCpq0hqF
 mGVKpxeBhnOeJRAOb/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118684-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9E2F1748D28

On 7/6/2026 3:18 PM, Krzysztof Kozlowski wrote:
> On 06/07/2026 09:11, Atanas Filipov wrote:
>> Add the JPEG encoder hardware node to the SM8250 device tree so the
>> qcom-jpeg V4L2 encoder driver can bind and operate on this platform.
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 81 ++++++++++++++++++++++++++++
>>   1 file changed, 81 insertions(+)
> 
> Why is DTS patch before driver? Driver CANNOT depend on this.
> 
> Please organize your work correctly, see submitting patches in DT
> explaining how this should be done.
> 
> Best regards,
> Krzysztof

Acknowledged. v5 will have the correct order: binding → driver → DTS.

Best regards,
Atanas

