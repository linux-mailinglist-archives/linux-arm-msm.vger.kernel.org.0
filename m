Return-Path: <linux-arm-msm+bounces-118049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hRgFLpO/T2oZnwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 17:34:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 382FB732F77
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 17:34:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HgpvLHyv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fTGBo5a0;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118049-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118049-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7062430FB774
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 15:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2D853859E3;
	Thu,  9 Jul 2026 15:28:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D905380FCD
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 15:28:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783610895; cv=none; b=MJdXCX9L3+UBiXGRu2+nO3DaNaaLqSAzzEScIKzUk+BIabOeItsVvdpILZiC9OS02YJQvTqZuDUDjg6xfDrysSaLVPEt76WWQKnR7Ab7LRnUhmG6spF5I5T4V2bjfLQDa+D+R0J1w2jUmXHj9l6fWonum3K5vKfIabvCIEvtsIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783610895; c=relaxed/simple;
	bh=hhpoffETOuifw+MNksNM0dLoI7WKZHtIwfPDeUBNl8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eZtaw2vz4qHspkf0si2a97+om/3CJgkmP25VwCVM+XgPn6gYxn3yg1iwQJJh/v4hKJcbS+Ih/KaNQL8IwgdgDu1RQUaGpC8ZOqlE1IiXL2vXOf7ytRHqoIkvIy2SLOIgoRsrldiwohKoxF+0qmJ4q1J7kUEGfMQBWoMwVJgccWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HgpvLHyv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fTGBo5a0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669EwRvk2062323
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 15:28:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hhpoffETOuifw+MNksNM0dLoI7WKZHtIwfPDeUBNl8o=; b=HgpvLHyviZF2l86A
	avaqMK/HD9K4u+4v0YOvK+NtbkudPr2r9wXZSpXXZNSQNnTSm1OAcOUOkeNMU/Js
	Ct91/n7EdsTMkDCQtSPPJivDjALwt7rsquxAQbH97zPdx0w5NQG5nF/piNU6Hwvs
	EI5gTdrrWagAihHic8S3kqskvWOUW5GzQwZjtyIsbebbIaITueNf18Lf4Z5b17is
	m/WYYryEDzKQBwmD2I+5/lAjSOzxrU/RmlbzICjn5jDLBUzJ/Q3aitci2VB1S2dW
	bMfICuoaqCWfsBgsf99BvUSlMfVxhRTMpf22UvyiqYnfG6wSeR0Alp305EygksoR
	zrnfQw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fadvj84px-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 15:28:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37d4eede8ccso6999a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 08:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783610892; x=1784215692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhpoffETOuifw+MNksNM0dLoI7WKZHtIwfPDeUBNl8o=;
        b=fTGBo5a0tXztKfsT9uvnojbNEqPZJlyUZAz3zhLUUGKCSKu7lhlvHIQULK6FEBIsP5
         Oj0UQjx+cvrWYyrpH6Fo8afOEyXrtuttQJINlpUtGFyViNcHjCPFmKa0Jj5ZZRH+goZN
         ocGm1kfOP9ORBaRJrR3fOm7cNlvQR6exXUCtIUTlsRMWqhcBf8LrEtD7gQomEsPsjPIm
         iJkVXVbbSYPO8eGxdKYuWYEAzbbysCaUs5n+klyvNi9NGeJet1CRD/tS4d81FnvZ3/4v
         1yffG28HqFwb6L12QBaZaUX0lRVXogFoYZHyd7FeUEbu6cwT+nA9RlNzm7NtZevwLSyz
         81rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783610892; x=1784215692;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hhpoffETOuifw+MNksNM0dLoI7WKZHtIwfPDeUBNl8o=;
        b=tM1aCCikjlyeBrWa3fdjO9nmUHpWIulA3sfV9N/sGWMDavcU/aY+ERMJSFgua4lZX4
         0ylgpQqhJxiNhVKb6PvJkmetIe6CKPfvQrEqkoXJdty08jXUPluq4FrJneOsSHj0Rxtq
         C67T8rMBQGIAzwq/gV+VH1fGrbqQYJN4hwOJVcAFaablh7533tSkUkUVdTqCZDVS04n6
         rRNplu7oapIXGFCopRY30RVBJTjwbs9ct7+S2JcX38rmvSQjX5JuxkjcfOAOr/ohiAxE
         IbeUsDDiGCQdxvtGMSfVMCpaveqWxzL8YtsF7DeoHM6sf+/frqW6ulrJFqq7uicuRBbf
         8+HQ==
X-Gm-Message-State: AOJu0Yxm3ecAqXLKmlkdKe/xDyJ19slGCKDuLm/LIHfl7EZHeVfWtLun
	M+ep/k6h0bKZPuz8vMHVm2wrCV1viOIFWBJI5sUnlbqOETu8FB4U14xAfpZ/MYkB3LyWnC12m1+
	hy/VZyDqIO3ERhaD2ycHACnQzA+fnrazCpybD7i0i4BUaQbBzzExq9DshuHD85aSg8yLk
X-Gm-Gg: AfdE7clD1mRf7q+eQZR8vW484vxcTxKIuWkycuD1WQwAPcsmyagwbacAEv5BWZznD47
	FJ7Og/8e+AJcZtrgZKT7a4YibHkPnPp4i7Fx/xoJefy3ie5EtJp09ktv28AZnv/OCXrHtsTV/BE
	jzYKKpV/O1Nte29eoQdgKVtRbsmJKDHE/2DH7Y5+OoU4ka+ZozELHk1ZHMWDEg87dAKQ0DusyPM
	+iQnATtAgwN0Ecpecto+aM0VK8vTl7+FnCn9ROn5fH2frO22f979avapd48RzOr4wilVoZqBoBQ
	bTHjQktIcxyxrmWf8260arKurc/ftlcQMYyWiopXubLPNlGhFi33uHj+41er7Z8DuDGJhpRNrZu
	ALxiMFy6f35l93Q2Lm5ESemL9mMgUsfwMbBa3IRC/9Q==
X-Received: by 2002:a17:90b:1d44:b0:37f:d9dc:557 with SMTP id 98e67ed59e1d1-38940638b51mr9375040a91.16.1783610892178;
        Thu, 09 Jul 2026 08:28:12 -0700 (PDT)
X-Received: by 2002:a17:90b:1d44:b0:37f:d9dc:557 with SMTP id 98e67ed59e1d1-38940638b51mr9374988a91.16.1783610891627;
        Thu, 09 Jul 2026 08:28:11 -0700 (PDT)
Received: from [10.204.66.221] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31198cb2b99sm13681204eec.26.2026.07.09.08.28.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 08:28:11 -0700 (PDT)
Message-ID: <85a05836-6298-4111-97ca-80d7e3b3a9c4@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 20:58:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/6] dt-bindings: media: qcom,x1e80100-camss: Describe
 iommu entries
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-2-f8588da41f16@linaro.org>
 <HCPw5KYwtYb7jBFED4lssTvcaMo2bK808SHkTWNR77q0DXGPQklaADJXvuyeBrXh_GsEMKdiaaktkzQ9_xeseg==@protonmail.internalid>
 <cbc1b1eb-0064-4999-b829-2bec451c682a@oss.qualcomm.com>
 <f307848d-6abd-4e96-9183-36f8599026ce@kernel.org>
Content-Language: en-US
From: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
In-Reply-To: <f307848d-6abd-4e96-9183-36f8599026ce@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE1MiBTYWx0ZWRfX+wT9vA+qxf9j
 De7nzdWp5GqCfBF6WHeO8zDAuGemX7nuvIVLzDzxU4E/8BoppG0rKszxOr4SGoPqTk4JH1+62jn
 h6/d+QLv5m3LsjVSg7NB42G4mB2QwYHQmNRGLVYR3OZplwbmZ4vtwl771bC5mrvfJx3O8zHPEfC
 DTF99kPGM75AS/pyfW4tRuMesYuJbND98z7hGkjGuZnX17r/NM2BM1dnrlPTkyohkVPxzSlkwa/
 WjF+QfpM78qP/U5Ei46As9UDERGXLXCrD18P6q/bepXywm19sc3gVSrLgQWkAezTSMGEWgYyXXA
 g8rRL7haqaxMYffiQQ2ThhKniefEOJpVbWZAtWoZJYH0aCvU5flOhPDkM2CMhowMPd2S+cCNR9t
 J4cTQvw0dO0fADqoT6cZwzGWjOAVyYROp/KVbF2SFfs+6XpziwYg3GZNuXMj0lugWdODMrTMUas
 liQjOha0RQHdEmW68HA==
X-Authority-Analysis: v=2.4 cv=WpIb99fv c=1 sm=1 tr=0 ts=6a4fbe0d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=HI1v2mgwsAgm2NAubtIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: _rP-EnEZq0lSfoWBpcKpsrxWE4OGZ5fI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE1MiBTYWx0ZWRfX5NNNqt2mFq/Q
 il/0+h/pIKjIleNLcMsv03I99rOTzWGL9yvjKbWsc84qMPMzmbZIH6tR8Arpr/1Tv1p+uDTqH+T
 4ssv9Y8bTUCVUwWGUvtbVDlB9BNV+v0=
X-Proofpoint-ORIG-GUID: _rP-EnEZq0lSfoWBpcKpsrxWE4OGZ5fI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090152
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118049-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:todor.too@gmail.com,m:mchehab@kernel.org,m:konradybcio@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:krzk@kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:conor@kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[vikram.sharma@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,baylibre.com,gmail.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikram.sharma@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 382FB732F77


On 7/9/2026 3:02 AM, Bryan O'Donoghue wrote:
> On 08/07/2026 16:15, Vikram Sharma wrote:
>>
>> On 7/8/2026 5:36 AM, Bryan O'Donoghue wrote:
>>>               iommus = <&apps_smmu 0x800 0x60>,
>>> +                     <&apps_smmu 0x820 0x60>,
>>> +                     <&apps_smmu 0x840 0x60>,
>>>                        <&apps_smmu 0x860 0x60>,
>>
>> I think only "iommus = <&apps_smmu 0x800 0x60>" should be enough as mask which 0x60 is implicitly covering sids like 0x820, 0x840 and 0x860.
>>
>> Regards,
>> Vikram
>>
>
> These all come from the Hamoa iommu defintions in qcom docs.
>
> Can you double check for yourself and let me know. 
Hi Bryan,

Confirmed — all four SIDs (0x800, 0x820, 0x840, 0x860) are valid and documented for IFE/SFE. My point was specifically about how the ARM SMMU SMR matching logic handles these with the given mask.

In SMR hardware, the mask field marks bits as "don't care" during stream ID comparison. With SID = 0x800 and MASK = 0x60:

MASK = 0x60 = 0b 0110 0000  →  bits [6:5] are don't-care
The four SIDs differ only in bits [6:5]:

0x800 = 0b 1000 0000 0000  → bits[6:5] = 00
0x820 = 0b 1000 0010 0000  → bits[6:5] = 01
0x840 = 0b 1000 0100 0000  → bits[6:5] = 10
0x860 = 0b 1000 0110 0000  → bits[6:5] = 11

Since 0x60 masks out exactly those differing bits, a single entry <&apps_smmu 0x800 0x60> will match all four SIDs.

That said, I'd say this is more of a preference — both forms are functionally correct, and if you prefer keeping the four explicit entries for clarity or to stay aligned with how the Qcom docs enumerate them, that's perfectly fine too.

Regards,
Vikram

