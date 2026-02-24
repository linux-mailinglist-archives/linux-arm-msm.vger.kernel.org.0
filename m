Return-Path: <linux-arm-msm+bounces-93964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDlDMLyMnWn5QQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 12:34:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FCF18659F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 12:34:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2B24A3056B2E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 11:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F9F837D132;
	Tue, 24 Feb 2026 11:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fk6ZFC3S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="imNqSxHC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFC137C10F
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 11:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771932650; cv=none; b=seRqSyKMkzcGyr99J/fDnNW7JLhJZTeiR0xiKlPAqYFfJEtCxwq1KK37U4LlKe+DknRvxs/rPg8o4dlVqBQGCi4qVO120kCblcvM5C9EIhiSVxiGu1tMxwdI1pH4iKTplBsBgCNO4efF72YWvvzQBcEm4zYHLCIr6DKNyYqPJ6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771932650; c=relaxed/simple;
	bh=NR5c2lqcGrUDgJqbWlOyrsK1Q8UFahTNzG362eLtZrk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QtdeO3uth31mafNJbQZRiOCdevAxriZML6mNylLznxwpImyPeF3g4KE/KLMs+AjjFOPT7QawJhdR6DXXFofxFTJiiQXZWNTLbyMGzjKiwuFU1S+fXAdR3SbsthbJAVN3jRwbAcrtFFZBETNG3WBNjfFVE7oLV+949nkTaPNkSW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fk6ZFC3S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=imNqSxHC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFTtD2774559
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 11:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+EVLGgc9YOc/CuzuU/mzpF4YtsaatUWJt8Cqs4/tWyA=; b=fk6ZFC3Sc6sWMBRt
	6c+LK96hyMmHgRDxerexVfqJgOFyPEAmIj7oOKh5iEAcVSDaP+BNHdkdFeaxMe7n
	RhJohlZBVMoxxSYr1heZwef6ODOxNin91hEa1IXZ3k0gFvdQxCbDpffmPij1xNnc
	lwDYGAFFBE7OCd8SLA4d6HvHKekLMqPEc3gCWyDMST79MX0LyB9qAnPskAUtDjXo
	JqVIInoJvf8W5U0NoxhXOGz8bIREDautsZ2/H1XpJv/26AC+fD2xSYlY/l2BfmJu
	dDeHosorAdGLgJcNhrondD4OK1ZCQy9HygKj2TTK7yUkKlCqYZTNMa0nSpXXmDEw
	BcpR+g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgr69kg87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 11:30:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c710279d57so507444085a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 03:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771932646; x=1772537446; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+EVLGgc9YOc/CuzuU/mzpF4YtsaatUWJt8Cqs4/tWyA=;
        b=imNqSxHClTlHTfZon8l6RxGWMH0mZup8etIvUiCI9KmiSRWr7jqr896ZDXT9uXyqe6
         lsEEOgJuX45SpIlO7LLZddlolBIBO7OqQdBZTC2luXiIWz/PfEcU0CkXi7dOOK9Kbwnh
         daDHOxsgZyJ4AVW4KyYyI31PpdeVfacWoZ5noTlZEEyL1qmk/tDSdr1sl5jJ4rrEHfHN
         YtOKVY/LnJ5EUx+Bl7g1qxqqBIbEE4YoVj/CGDc/IDU+8hGq2XhQhAZ/TFSeRxWbLG9o
         fJgJIRZ7tSk2bKNSBqXDoI+IcHx9C/MC70vr38Wa3+TVMjTGMIkp/tIFJZVopAhcfJUH
         jWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771932646; x=1772537446;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+EVLGgc9YOc/CuzuU/mzpF4YtsaatUWJt8Cqs4/tWyA=;
        b=nuKR7dcx16dXbrfQg2YmEvBsAiv/g9gqA1VsphFhDMTpyWONZk8CJkRKZxxNNaGkN1
         kyq3TT3ZkSKAIuuRk6Zq8EJMClyqQijCqMNWIOLiEENlNXhZBxYU8e7pEsTERRXlgu1Y
         Ksn0J4Cu5LkmvpXUy5wRMVAtLHqDuKJZY7/UL18faKxycXpX/7SSqNnHRso6jyhueIHF
         wJn6+7FHK1EBtjaoFF02pJ+QH1n+hKEK13ebIfYWUTjEYjT2f4vmlQAQ0VuuABHdTK4Y
         qR8NqMfUXUkqI/BZwwmsUGuN5TgEdeYsUWtbSr0WgggqGKr/CDjn1Ta3fvJCoXNBWpjs
         xsWg==
X-Forwarded-Encrypted: i=1; AJvYcCXk8F504Dnf4+QsJaYmAtRp0JXKQDwHoIkAJU3YIRLyjfwK7zYgeWrCPt5p0zdb2xlBDFKVPNpTaCHWizJu@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+4UJJtw+iigJSsNKH8+TeSPq/P5mtCdiTS0/85+ryjdp/pvaH
	BykvKhmp0FeLTJLj4T9MG51JBVgryJ7kS+fFDtBcCbP1pc6GVF3WapnztXMfrb6EoW6u1ie8Ql2
	v4efgKIOqwTZQRD1DWnyv6Qv3CYCwm9WLNe46snObdtun8CW0iJj5dsox+ChX+FHtTpFvKRfnDO
	iW
X-Gm-Gg: AZuq6aKbaaA2ZEPC8UGnPgiii48sIx4ycYZ0GnlAA95/V+A4Vh47j2lVaFOuRoSIY8V
	3OXQkp3Cu0CnRFro4lzW8DIkm+pAVaxqPGwrQFnOWPvcsSTpmLKHJu3tpm5o62MYCYMaDlz++Sc
	v1wTqHpzXwXm0VjhcHZc5WmPE60co1RTw+5R1yV4PFuXZ/ub8SU93jxzcSeNykAR+bg9xq3zJ81
	lephM53P80anj6amLt4GFLzqHlho2W0qtIwbU1pTJipRkNv9q2LmOwKnAxeWEf5HjwwUwnW0uQ4
	EFKQAX2wM/L2/OdJrCG6RRHFzjdWBMUkPzZjs7BYdlELjwdEH7WyWmfDR7et9kDcNxh9uZt/IFy
	aEiuHqtCpRIidn5xYZYurZ30NCFfh9xOCBxeiDAph1zeoWHHtkI4zKWM8Seh8F68/qhI7dgeQ2d
	TfUxk=
X-Received: by 2002:a05:620a:1a25:b0:8c7:1aea:53b7 with SMTP id af79cd13be357-8cb8caa40f8mr1146304685a.9.1771932645676;
        Tue, 24 Feb 2026 03:30:45 -0800 (PST)
X-Received: by 2002:a05:620a:1a25:b0:8c7:1aea:53b7 with SMTP id af79cd13be357-8cb8caa40f8mr1146302585a.9.1771932645173;
        Tue, 24 Feb 2026 03:30:45 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65f73b56602sm124824a12.9.2026.02.24.03.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 03:30:43 -0800 (PST)
Message-ID: <35288ab6-bc18-44d6-94b5-756c76992067@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 12:30:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: qce - Replace snprintf("%s") with strscpy
To: Thorsten Blum <thorsten.blum@linux.dev>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260223155756.340931-1-thorsten.blum@linux.dev>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260223155756.340931-1-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O6A0fR9W c=1 sm=1 tr=0 ts=699d8be6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=PzOCrqrjzUU8T3-Ey24A:9 a=QEXdDO2ut3YA:10 a=vyftHvtinYYA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Y7ivafLWf1PZW8wBHh860unRIJwxQ1y2
X-Proofpoint-GUID: Y7ivafLWf1PZW8wBHh860unRIJwxQ1y2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA5MiBTYWx0ZWRfX3SpvgUVV9SDp
 hcb0+4kdZmJRanJhF1CWlDVaco+HDTirlPdme5gU1FOKhRry6yCjZiP8oXKDotAuSP6YJ5aeHRG
 fYgGsGF1JKbfDKlJdBIifhcBIOSMmF0+b26IQ2S0qpSbFCQ5vqrox2NTski71lah+ugw1L2YcYU
 YJnK5LnKImN0KcEsvK4/ZC/gzC7tIi4U2WnkOyFF1Jctj9cX4nfeWkYLgB4WbRo91WcqNLQwahv
 P4BbNWwvQnEtd4Dk2ow9rRGFa/0vLwgFfxIeqxBf3QlJoGTu9Ll9hE+uyQGqde8dJrKevAwjQ7W
 Kci9ANUYjqXYbIolYVDha8tF1Q4Ff6q13sYj77CUYNWH30xeqFYfTNZnrSDeEmvnBd4Zx6iRWDe
 IlywMRv8CUhEipagGdLJP5DcY7TQX1QxRax1O0yVrbtgH31wabbeA3aSBiVXAhz33JdgqQScfQN
 LrL5cxEI7RhkQTnHBVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240092
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
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.dev,gmail.com,gondor.apana.org.au,davemloft.net];
	TAGGED_FROM(0.00)[bounces-93964-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,linux.dev:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 00FCF18659F
X-Rspamd-Action: no action

On 2/23/26 4:57 PM, Thorsten Blum wrote:
> Replace snprintf("%s", ...) with the faster and more direct strscpy().
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

