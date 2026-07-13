Return-Path: <linux-arm-msm+bounces-118690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HANEF+qpVGo5pAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 11:03:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA14074912A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 11:03:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="c4q/ae6Y";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WMTO3UIc;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118690-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118690-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E05043004D9E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70D13DC4D3;
	Mon, 13 Jul 2026 09:01:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882E33A963A
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:01:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783933295; cv=none; b=pewsURGJjqSV+XhOepTByHssCPSI/1UXG9SRMho7pVtjnOp8CHs1E03F6LZBu66OB3oQs4xnMzQOor26iJfObPOjjmnVmgPcZCrUucy3BcKljt+JQb4PuYYwQAPnEVzjmKviLE2rBpeBKfz6+d9BSXeqxFm1yLtbTOS5MDIqTgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783933295; c=relaxed/simple;
	bh=zDBTH3Ht8iT/bEP/SfxoUt790hMWzYelZ4Smmp6GZjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=krq8yaq691YQLwX5EJ7+JZ6rYdARfvpUTjuGuqGRS0SWv6WCxHMaqzJIXxHJpzBXWq0qUJHUkBFVFtRPctcER2uKPo3acfEtjhf/UKWF+NgpWSOob2N6iawqPtQ76V3bwHC3N2701XXWz0mdWrXFcaCrvAXwaq5GqMMbSrl6vcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c4q/ae6Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WMTO3UIc; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NuPW568086
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3nUf1OEnKzZigpglhQFy8FOfo17BW1VAoVGKVtdtS/s=; b=c4q/ae6YhWEC69nP
	rDqeGGj+8jGtqCTzI86fseoOOY15ItJFxDm6wXleAzS7ElDQaxAmH14xQPYjGPAr
	HGAURheQEA+TRlhIUkHL/VXJiFNmMSYDuCg/t1+p7/XyKIZyZqSrA5oV24k9STXG
	3oflQxr2R5ATrZHgXTEyw84tKTihTP0DV2aOMSM4zMLy2rrWayRRcxk7AkqbEV72
	hc+Z7LHnTAVaTwiMlehKsH4QiXH5DrL6Ohji41WxsjZ9BzmL2cyO+PRKUSBMHSWD
	RutWJ3JOzaV91IPStYsuq9FyvyvCV2b2tUv/VQLQ8jPwsI0bb4UjNrhLognax4qi
	kdz7ew==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe915abf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:01:33 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c890bac374eso7556943a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 02:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783933292; x=1784538092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3nUf1OEnKzZigpglhQFy8FOfo17BW1VAoVGKVtdtS/s=;
        b=WMTO3UIcmLkPKNSH561n+hQEbKbPqlkbQ+gKUPfbCufJ0sKG/PtAUjJykETinKlNIq
         aCvHTPfjSy0e2KAPfBz5e2vnTrB8Lo3A2wQyzzke+1+4Tiz8sZexDDLJWlInjliwAAdt
         A4jfdvkVKDAMF6vuSg8oAyC77D/IzR8Ossa+Clr7DRI+dBllfSouwh1W021a0oZyBrgj
         WwMok0SCBwkAzbXLFPgqr/khWCvvxZpqcaSb8hBjYaeF86CimkDSSHlAmXiFheKATcgi
         j3xBnK4gtgFAdNrCVXapMz1qvcmLFNUiGgiOQ1Du94AznES9wFiC6uJUwlYb6l5g1TmR
         pg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783933292; x=1784538092;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3nUf1OEnKzZigpglhQFy8FOfo17BW1VAoVGKVtdtS/s=;
        b=gDDzKkDKQsuPR9whtYjj8Rv8wiISI2fb0PKvsm/qcVoLjkudt9kEK05f9Z6zKGk0wO
         Xwe/5j4RTIJn9f7t10CL5NN3UIAXmI/IjKhb+O1jbSiRATfu3WVHqmwyFkdDxiNZmepX
         yGPnNiOn+Kq5VZwV0oZUkmsvc5KlReARvd3VEJvOv03UGA3TZIbTcFq616Bt81sJ4wIC
         u4lRUwaEmuV29eIMB4+c5NscjCvp1AotROmdkQY4wN75WMsMfaChCqLOFo1DxpDK3qwg
         rZWTfErTleJ1JDdk7rJyNA7aCTIk1tGihjWJ0p1cca/2fxo7YwG4pyI+zKw6YXcRbkFQ
         nptw==
X-Forwarded-Encrypted: i=1; AHgh+RpBQ/XZ79NfUkGOIMXQt9ZQfpfThoIyHPnN4BcfFjL1KJRJ5XDeAOWjw/ncqxmqa9tg5JidGyC1XLTuxGmv@vger.kernel.org
X-Gm-Message-State: AOJu0YziGYNiV8mRBRcFahis7rSFTOGl0KvtyUSSNdyjmPcRYtDPhy7f
	wMB0NZJQ/nILipHbULJD6Bb+4rBop1R4vAzFs2cEN+qOHk06eiSXIFwjt1sVxrhVAXs4GXiQLMU
	zQsY+Hcs9kxIfDjOyhpO25VWnW1WBMa61G3YP82plkC79tPH1W86xI5toEIAQBwXKZzG+
X-Gm-Gg: AfdE7cnEwbc4XjgjgaS7y+ievAfecs8QnDURk6TBHwSAL+2q5ikIT5JDRuh2aTNUMUG
	wQXj3cmJJgPZGyq9FvbBhxVMyap4y16uQh5rNZEQJg4R7mfajqPVybx14PWtT/xeRhWQ2SxNKkR
	BIftx/ySS4e4gxL354frD6O4xCt9l+87Ca7x5TSnQvaXzUmiJnVDKqH40dDOkaR5oCxZvPHS+ZK
	wBdEAXKtxUCFAsOM/0T16WQN2G2eH0W79njYIc1uRsCGwxxibxZPpPJOTYf6fy9Burp2sIkbp6t
	p7cPGuEsl/XfQGH8wVDnoACQa6mbPgxEJ1+MQK/ozV3DqDVftd4AfQNgH2K7PddGVffbvsljhY7
	IWEUJbIIqNtf3vxCm8Z+9/6oB0zsp6LlaECk2FMBvxK38
X-Received: by 2002:a05:6a21:46c5:b0:3b4:c9d5:cd5b with SMTP id adf61e73a8af0-3c1100383f1mr8708875637.13.1783933292649;
        Mon, 13 Jul 2026 02:01:32 -0700 (PDT)
X-Received: by 2002:a05:6a21:46c5:b0:3b4:c9d5:cd5b with SMTP id adf61e73a8af0-3c1100383f1mr8708853637.13.1783933292234;
        Mon, 13 Jul 2026 02:01:32 -0700 (PDT)
Received: from [10.217.240.77] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313af819732sm37325698eec.16.2026.07.13.02.01.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 02:01:31 -0700 (PDT)
Message-ID: <6ec77dc0-1f6e-4fb1-870b-6897b686c451@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:31:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc: qcom: llcc: Add configuration data for Shikra
 SoC
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
References: <20260630-shikra-edac-v1-0-287b3233241a@oss.qualcomm.com>
 <20260630-shikra-edac-v1-1-287b3233241a@oss.qualcomm.com>
 <20260701131937.ub4uzpixlmm72es4@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
In-Reply-To: <20260701131937.ub4uzpixlmm72es4@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TbymcxQh c=1 sm=1 tr=0 ts=6a54a96d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=-ejpVAtAuEjdjmEucHkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5MyBTYWx0ZWRfXxEKD/bb6PwDh
 AerGNwVRkC3ksIXPXhIM4X07D1f7h1Ph11HdsyOJMZmx3YLBbelhsXITJODwCGBIccdfFzoVd9z
 qAkzrgvZH2dCy1rq0K+J9Se4LG0V8UE=
X-Proofpoint-GUID: 3glipvTBzgYZ1ic-ULAWM8LqJC7FBvRS
X-Proofpoint-ORIG-GUID: 3glipvTBzgYZ1ic-ULAWM8LqJC7FBvRS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5MyBTYWx0ZWRfX/VtIAT1jzcm2
 ZToHtFEU9PCWOynfbibnuc+k/GAkrb4ppm26f0thFFTE3K/k1QXrjXW69u2xXnDhJb6po2CbQFr
 aVT1OOPpsDWMtgSWbVWklHUWvW3RVw7RImwdl4KspgrxjxHEdHPiezRIRO0/IOxXfp4YzSDec3I
 EWTDGVdKqpecdt2pdVymgCw7Vf4YAH4mEVik5PbA4VXDvUa9XqzARlgDFqI5l/aNpyIHEv5J/0e
 G3PJrHJoJfT4XMT2vixfevXwp1yBC6dBd/ZO35GwufcJeMfhfUb0XuoiV9Pl3zH7oi+Kn+Tz4kh
 dcVdiknRamMDTVuc7iDbbR/kppCttroPCqNwI1wtZFrNMzBJtH1B6NFvK3Q/6rA24asr9LJq2XT
 JhTHSyPIQJWwbFI4qkFU9pNh2/nRrv258fQb5pRx46me3wgWPkTQMHQcgBYIVfANlxSe3qDurrr
 mYTacIF6rqZMxtoHwrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130093
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118690-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:komal.bajaj@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[faiyaz.mohammed@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[faiyaz.mohammed@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA14074912A



On 7/1/2026 6:49 PM, Mukesh Ojha wrote:
> On Tue, Jun 30, 2026 at 06:25:09PM +0530, Faiyaz Mohammed wrote:
>> From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>>
>> Add Last Level Cache table and configs for the Shikra SoC.
>>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> 
> Sender of the patch should always have their sign-off at the end.
> 
Thanks for the review. You are right — I should have included my
Signed-off-by as the submitter. The patch has already been picked
up by the maintainer, so sending v2 of [2/2] as a standalone patch shortly.

Thanks,
Faiyaz Mohammed

