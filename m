Return-Path: <linux-arm-msm+bounces-113900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I8gFJtDmN2qoVQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2026 15:27:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF8E6AAE46
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2026 15:27:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="hzeW/c41";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=J5smdw9b;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113900-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113900-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F6493006B24
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2026 13:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFBB5285CA4;
	Sun, 21 Jun 2026 13:27:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58A333985
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 13:27:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782048461; cv=none; b=q0lz+RxjCp1ZLYgu0jwFboFjX3gGvHv8wyoELNB7F5wjAOGLMKDrU0cg2nNGeRdtD3l9IPHFQ9r3H9/gIBAPvmRm+YN8mtmzL1o6EGX7rtXJjy47YYdKSNz6Z3A8ZGGyySGUtsLZjDauQlsNvt3vcozrd2HaFQ5QB6PAY5zrkdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782048461; c=relaxed/simple;
	bh=lm6Is8OqE/SGUt7pxfzgTsyif4RJ5sdb5fi3qSnD4jo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UzFwPAxibeAUZ+6gvbs3cpv5TgcAKyXZwcYU4/Jhn9WA1Q7LETmmApqbqDaCe1iZ49B27MtNa0Tf4KZJ3lvAHDSjmQrsRXappuSk4jUY/wEhVo0R7yldD2kkhtr0xYEu3Ft7bkgwvD65sVmcMwTsDKaFa59oxh3Tdn2+7ibFxkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hzeW/c41; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J5smdw9b; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65L9tthp1465656
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 13:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HM94g8R2dXZBcQZBqSknKOLIPm3L587bQbswDd/w+tM=; b=hzeW/c41gJaiJ7b0
	qmEjXbp846iE67uvh38R+fxsb18aTlyhW1NG3fePe0tRqpFYJnjZg6cmSGdx97e2
	J0nUyjyhAnUT+lT9dYhnSrGl/smY6D+K82+IwDrm9B/48ZhosWUPbTJs4QK/9gUy
	wRUzgKVbMRg0grGBLzque1S2XOcXxQ3LQEonEEL72cnTAXX/YfU930QPzIG3y6IW
	rBAE6nDiILV5q/kkrvSU9+RjUgCzrdgL9pnN5BR93U3eCqHpAwyxUVzqz9EmicXH
	fzMWasa1Xo+Unt5bt8r2x7cZf8lho4emIN1QZb+ndtML/hTHonmbr9pjxx1YWvD7
	RNTQpA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewm1k2yhv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 13:27:40 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8bad49b171so1040607a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 06:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782048459; x=1782653259; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HM94g8R2dXZBcQZBqSknKOLIPm3L587bQbswDd/w+tM=;
        b=J5smdw9b0oQOZ8LI5faPpm4DyKaMrntUvKXikbgrFA9ztu5f8jkWiHK13pFO0nLJ6m
         dCLu7d+WNRtyAdUMtcUwAAVXTxn2sjArv39YCfyQAGAk2AbAtGFwU2Ckh3GmUeH/Kufh
         VT5Q+WWhpyOftsNZ3sYk+VyiY3N8tCfa/vIsgYfXxY7XwhxRdaavPOqTRnIeyp8I5+tP
         i0b4pWtZ+lfg6zfaNSIFiJvf5e06BU/1qyNW0AKUMJdVOoY+aPeKmXhMns8QxHBsbCIs
         9nYh04uOUFOkllO76Zn+ixD4gwwpTNs459NYZN/HTOixjHDifRAfi9mCuIOx+V5QERiy
         d1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782048459; x=1782653259;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HM94g8R2dXZBcQZBqSknKOLIPm3L587bQbswDd/w+tM=;
        b=pW3NV3W5O+PxnsNXia68tH4v/aJJ8ktRpgZ9nMDlBfPF9BJYN5wjpBlAo04vMfKduc
         S/OCPDhRtYukm4aCmTbwMwcw+xeY4zVXtMRAud/dOmOxOnNW/Cxj3gamgbXRXIHRnyGk
         SJ8GDidEMVQFMcBSMXCKR5rCMTDki02cCOhY1MjBgJq7nhGUBcxUSll63YQvd0Pm+s8i
         4dl9ylVR/F/iGMybvBZ5ABuLfkpp+NYcgbVfKDwQjjNTuCfU/5utjxijaiD6VuETc0wJ
         6vyue7pJNNqqVWVj07CmkHL/WP3earDuyy/KZmPScpVOReXgo2dq8aHiTlG7he+EHkL/
         /X1w==
X-Forwarded-Encrypted: i=1; AFNElJ+G/4vxZagdYdnSSWI1FOHYnNocz8bcHkXbh8QjJiX7V+EXp+CqZqGtpSjKQcwRvR0+J1ieS4Y5iUPlNPSX@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg2+T6TqZngcxA+FnfWdlmmzcpS3kjR8eTjYkk3gZTbBcerDU5
	rbWUkVuQnjXK6e5HOgcUMPbADQ85xAsyozxiSdVjVjC6dt3o7zpcfpyu4OQVcpXSi2+MjyPuM6h
	P1v8MYaQRxgrgXOln0Mf3oL6w3WoKQlcZio3hnZLVR9clKwxFjAUlw77wKFHrXk0Stto/
X-Gm-Gg: AfdE7ck8B0fGJgcSBLbZ2mHl1dr0rEcr+TEpAbkSi5CS/QHRDDFOjvPVt55Gwq4wr5y
	hN8APUZwujWakDYyEbPxRud3uLH3qWfEC0jOgHnGwLZ8A4Kn0BgZcJgaYU881gn/T1hYCAckllt
	YSltjpELvE5K5P7qluGlXgWh5OpdBS5wUJE0JwMGvbbFP2BfKEBcEbh03m2R2GAyfNB7SBNij6w
	DfwKxu/qpO/5FoJZy0vwHPEipy/0F1rhNkB8yjgaIykMmjY/BqL55dxtVTmNcXs9RO66M4wNfPO
	pXtpgUdbbQl1HEIzE0Wg/Scf6lQCJGCl6s0wyxQiPJ3y5KHhf7SByFMsLiFDBr/u8LGjUrFkyi6
	SXnEdyEokZKEIVEaoUpddJgLFbJ5creAaKya07Lhr
X-Received: by 2002:a05:6a00:846:b0:842:688f:307f with SMTP id d2e1a72fcca58-8455087800cmr11650749b3a.28.1782048459406;
        Sun, 21 Jun 2026 06:27:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:846:b0:842:688f:307f with SMTP id d2e1a72fcca58-8455087800cmr11650713b3a.28.1782048458971;
        Sun, 21 Jun 2026 06:27:38 -0700 (PDT)
Received: from [192.168.29.32] ([49.43.225.115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d6c25fsm5121415b3a.4.2026.06.21.06.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 06:27:38 -0700 (PDT)
Message-ID: <a38443b7-c7c8-4eaf-920b-9b0563703969@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 18:57:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: Re: [PATCH v4 04/13] dt-bindings: clock: qcom: Add Qualcomm Shikra
 GPU clock controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey
 <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-4-8204f1029311@oss.qualcomm.com>
 <20260605-camouflaged-seagull-of-chaos-afeaf5@quoll>
Content-Language: en-US
In-Reply-To: <20260605-camouflaged-seagull-of-chaos-afeaf5@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LEchEtjT5mF22GvXUfFf3qK7jPzSm3Qn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIxMDEzNiBTYWx0ZWRfX9vtaR5hWE5f1
 tz8hRGYBtRVKet7X3ieCkg+aCXetDM5rtKgHUYP+rUFXw2eMA3NhGQDJajdXIlCD4ZoyoQy6eFj
 +MFHu7R9DKs7r3+I/khiVd3TRdpjQGU=
X-Authority-Analysis: v=2.4 cv=T6S8ifKQ c=1 sm=1 tr=0 ts=6a37e6cc cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=HwFTmRh04JSsUSWzyQ2edw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=IDlySeeo0UQRlzYkq3IA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIxMDEzNiBTYWx0ZWRfXymJWW98UFYDt
 ST3V2/0WTZJnsSRCKlN7igmc7PUKdL9DN9YEV8PUmD0nTL7VjkSp9WL9kNX2V5ypUdxY+G8K/hb
 PFo+Hi14mEkvv7sstkGm1qwdUmwpEDArii6OVC0W80cy2mjI4+Zkwxqj7sBasuYor9bpt1WgFZM
 gT20FDhE/FGEVNFKDl8ABP6VBTKDIE+fRWphaaicGEr6+rsGpAWyNy+AKRtF69ZH+H57H2D48w7
 1LcNwJBr+GgYgmpxnYus54ub2jwiA03blzrN+UswUwzY62GHsPIb0zlEcmM5rPzTUl0cwKr+3lc
 8s83t2ccNtBMV4JLDnhvtL9AFSWjv0qCpFcZXbNqQYfB+HW6xq0He05W9OUH4bV92ZsrqNp7GtQ
 hepUQD699w+h8aX8Yuq99OuPr9HYbWeEedLVXQBYleWzNDQkmc7wYWgN8qzipTs+n1WWli7S/0I
 kZFIxrMQhD6cbdAMzCQ==
X-Proofpoint-ORIG-GUID: LEchEtjT5mF22GvXUfFf3qK7jPzSm3Qn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-21_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606210136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113900-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DFF8E6AAE46



On 05-06-2026 03:54 pm, Krzysztof Kozlowski wrote:
> On Thu, Jun 04, 2026 at 10:56:10AM +0530, Imran Shaik wrote:
>> The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
>> hardware block, with minor differences. Hence, reuse the QCM2290 GPUCC
> 
> No header file? Are you going to reuse the QCM one, so basically you
> have the same clocks?
> 

Yes, Shikra GPUCC has the same clocks as QCM2290 GPUCC, and re-suing the 
QCM2290 header file. I will update these details in the commit text in 
next series.

Thanks,
Imran

