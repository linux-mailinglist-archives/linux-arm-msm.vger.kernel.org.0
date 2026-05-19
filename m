Return-Path: <linux-arm-msm+bounces-108485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOggHbhLDGrjdQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:38:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E064F57DC91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:38:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8062B303F283
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 11:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2B2E35202B;
	Tue, 19 May 2026 11:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kyh/qtWK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dDxeuWdY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC45233923
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779190502; cv=none; b=HygJY/kdXQtV+nlKzNfYUWAaiS09mVuZPte/6BnTG+kiSMUwDiuyeUh+G3CUP3YsifqBDkBJPWes6tkratHZJnxus4f/RDY1Jq48JDgnBy4kiMQj8/lyK/9wZDFU6eWZIuhxYnG9mIzaOxFf7gMKLY9tXlGBsOpUcmcEyT0eii0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779190502; c=relaxed/simple;
	bh=LQOxPGnXUTSOXlHpb6gPJJIavSLp81lHe+vVOxiyXCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WU/z/0Fspyj1CLR1LZJ/QO52WQ5OjHsV5qKd0Jgxh6XWOOUlJ6E/UL1rtnaJenrCZe4nTlCaEbPA8y+K824M4J7gYxUsJocw0haAgopPjcacEW0FuFFKp1F3HjjPhUFM3C5UItV5XkXyu84Hao7IEaNg4zzxBfU6JyI+Cne0zgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kyh/qtWK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dDxeuWdY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JA37oT1392968
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZAYCGahJcCtZt/TPl8oyzRpvSJVUQPm2nLTOqjEGls4=; b=Kyh/qtWK9Hfj3JEb
	JyqmPEbfysDE6W4/Gnik37xPy1t2776iMTbG1vm+O4CzM/a8dV27NfON3V9LFLsQ
	gxu2D1LLdsTdlxCfWYpjmKN7ws6lGf/zPAG7x/iNBjSs49sSgaUqBcHc4xf+NSTI
	9ALbT4TmTtHOmb8I3b33HmIySaFjGkKMwgjhtFdUttBQVn5RoGbLT2XrVjFEe+ZI
	rG59uHRQ3LKRxfEESHz7pB9TLJNm+OeIsegF8BjZLuSkYJQH9d5m9EBgfkbohLgF
	NSFgd4B+cfC3y6JPwjXvjG5SPoqX0yhcaAbEemXhspPuLNzdod0mm7hAJNmRfXJh
	5fM6PA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ns48bk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:35:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fad7b0ae2so12685911cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 04:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779190499; x=1779795299; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZAYCGahJcCtZt/TPl8oyzRpvSJVUQPm2nLTOqjEGls4=;
        b=dDxeuWdYlZL1Wt04tPOZUq0dTDNI1XbtVHGobk2lypY2CPUwl0lIvsda+/CCjWyM+n
         e4bleqtTjoC+/kdNBaz4h11Tfv8zQkIW1aoaRpiJmIW2LgfpIFYfokycD/w/psy2elC7
         VLwl11enxVVfNaUhXM/IpQtjY7fFQaQF8nnW7xYEsCA7VtBbN5rHiuyqyBJt739Fa+a2
         bUgbqBEkus5PNuHgjU8rKBhxohVhSL33tIKs5vEQ/xT8FVtDjQwFuztt4iKO5llwWLtX
         Bu6Hj0UkPEKGHwqEunDgD7wlQlgBo8liYwgwFtloKZPhFBbx/8oqAk6W6bLVV6jwFG5M
         Hd1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779190499; x=1779795299;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZAYCGahJcCtZt/TPl8oyzRpvSJVUQPm2nLTOqjEGls4=;
        b=cKSofyxwbglS1rwgMZ0+MnkrKhepzYhHiyZKZUdfe6giWVTNwQ6/ucbrifq/c573RL
         5dRnmj48YY+46zcG2wWoMlT6v9o1BJaEhDInv6gzIL1a/phwG0NsK7GPAdIrONRNJZu1
         jNFrAeZh41/YvzAokXkByDmouCytehqCpsIGIK7zt9MflITt9GNBbgEq3jQww8u8hyON
         Yy00Jsa+HeJwSJJTG4feJhlrl4VuXIdF+qm25uwdOaQ6H0FzhsigOb2UmqGPuWBbkSlF
         Q4gXHrbWNfNLikNmYYeXFuq6C40fTZebk87fIhdYthbeng1eFU0u3Ub5z9R5PlH6vc9s
         fQ9g==
X-Forwarded-Encrypted: i=1; AFNElJ+R5vlGUsEjvgpbBhjjHZx5Wkv36vk64j7ZVFBXLLwzW5g0pjtS3ljO0+BnA/Ao6Bxh4lB1eO3R2xz7B409@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk9SEyAmclB4agh/R50leC8iOqQRmsoWrb9TmHngilYX5GKsne
	xHcqWxSZVYPFF2zt7RAV7Obcq/KjqyVjnD15nPGTw096xX425RcfXBTHfi8WAFipqoBvVul+ldH
	+cBOr1BFUvVEf0xrOrNHuJIOJmDd6pcMrp2+c9Q9+YXdBDH6AWKaJfO33fU8vQ4F7n/yM
X-Gm-Gg: Acq92OG+N0cZIxxyWet0KIYmKZvqVOJjum0goJFoPAJZ1P2uvt0whFplZJtkKxOZPGi
	8GP5PVIwaqbhOylKeGE3AtuqYBbtavNWvZk0HnAuxmSbbfFdN+4nTml/+/mZkBtOOLm2Y/ZbckR
	W2+JUWgUiAwcWYZ63SXnvt9jvuIloBNrc4f1USjGuafJevkBNPXjEssKLtHkgDppRJ5R2RTJw5V
	vUH+AHqN3sRoLJn74U2kvDiAYzOVFYynnFystbOjf1MIVK/zI46LmmCw7MF017RavXfpKtAbX1o
	fXH4R0NDuUS/ud/tzmYG39rMnoz8oq8dcAHMNRZteq5JGH5uLK4tGMY8PwLcd4/qe4OWCTgoGbn
	wYQSK7BB4ny+ROOsZGtZ4AKbnBfK5CZMQgAJEgls2JgHzWRfOdgQDR9uHnz4W5/OoPvdHy9H+jo
	R6z1wu5Ur221aKoA==
X-Received: by 2002:a05:622a:283:b0:50d:a978:6ece with SMTP id d75a77b69052e-5166ebd8710mr137485841cf.1.1779190499562;
        Tue, 19 May 2026 04:34:59 -0700 (PDT)
X-Received: by 2002:a05:622a:283:b0:50d:a978:6ece with SMTP id d75a77b69052e-5166ebd8710mr137485451cf.1.1779190499028;
        Tue, 19 May 2026 04:34:59 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4dec855sm697523966b.37.2026.05.19.04.34.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 04:34:58 -0700 (PDT)
Message-ID: <5c59952f-72c5-4aee-a1a6-4b11b0a542c3@oss.qualcomm.com>
Date: Tue, 19 May 2026 13:34:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] spi: qcom-geni: Add trace events for Qualcomm GENI
 SPI driver
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu
 <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com
References: <20260518-add-tracepoints-for-qcom-geni-spi-v3-0-7928f6810a79@oss.qualcomm.com>
 <20260518-add-tracepoints-for-qcom-geni-spi-v3-2-7928f6810a79@oss.qualcomm.com>
 <12d8da90-f092-449f-af6b-14b9dd851f1e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <12d8da90-f092-449f-af6b-14b9dd851f1e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDExNCBTYWx0ZWRfX7Ct7PTkZfYIv
 mzv+YYbyH0VrenRadcguEXFEKiACDC8BaWJHL44N+R82bSPQumoN9PTCJFXUIQcmtpjws5gLDNj
 NJwHKUrvzpqkG0Q3QSYbGL6W32Npu2cvmXroQ8m7k0yB5QrMN0tcd03HvvVzX3I1Ysr8/fS5FMs
 AUoLdlnK8qkfnqxSMJQFFG6MuFoeesYoFQ8iFwErMT2YdNTdRvC8lWcP+vCh/S2o7h/N1b28zF+
 j3ApAjiVZmxx0ONjyv7GqlJBF3mC8iU5IRVX2rdzZziNuIjFsDYrjrtDPOXQlq7Lq4ZMz8V2KXu
 6sBgm9CD24HiGtbM7Rnq8tJiav3OmNUb1JrNULX4OyvB+uY6afgqiOMnW0LSM5vBy0ZADBgGxhy
 WxaCuMqOdIBad2xjGJB7qClYVdwAEZxSYGMJzWQX+SsZeAwstmVwXVix3095zP1ngtP7NHkrF3o
 fYp/MZsy+RE02xgc/DQ==
X-Authority-Analysis: v=2.4 cv=F6dnsKhN c=1 sm=1 tr=0 ts=6a0c4ae4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=77sk_vpZ_aVc8lPgWwIA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: I0DzO9U-Pu-f9vHI8ovfNthE717tN5zU
X-Proofpoint-ORIG-GUID: I0DzO9U-Pu-f9vHI8ovfNthE717tN5zU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190114
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108485-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E064F57DC91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 12:59 PM, Mukesh Savaliya wrote:
> Hi Praveen, one question below.
> 
> On 5/18/2026 10:30 PM, Praveen Talari wrote:
>> Add tracepoints to the Qualcomm GENI (Generic Interface) SPI driver.
>> These trace events enable runtime debugging and performance analysis
>> of SPI operations.
>>
>> The trace events capture SPI clock configuration, setup parameters,
>> transfer details, interrupt status.
> Don't you need trace logs around PM operations ? ie. runtime and system PM ?

The PM core provides a couple, are those enough?

Konrad

