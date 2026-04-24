Return-Path: <linux-arm-msm+bounces-104432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KC7dCFBK62kfKwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:47:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAF045D5B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63036300A13D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 10:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E250839184A;
	Fri, 24 Apr 2026 10:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OkjPmKeZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GhJLAtlh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26E43914E4
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 10:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777027529; cv=none; b=J35Pi1i92hEXJMwU9BZtXq8SSIV4aUDqBN8DXNdlgnTIFd+KGOFlJgOpHRefmgWoa73qauptKgnNusrCqeV8QhkgFQEBYGnlDK8IGzG8vFMSft6fDx3GEf55Kef8n0aNywTiUiKXocX7FTTLZlP1hhU9O4hG2fmMCPrPXvl5pkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777027529; c=relaxed/simple;
	bh=OnzGzcqNY+ArADqz4SnmiPYbRzsG9LBv1JybDtwFAvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RmstaUivHbDHnpkOB0+9JhGB9OdnQckYr8YsvLJQwY7ZkFqVRvzrHkWuz/J1UJAeXhMnfyY8wkLE+JGcnIQSZBrWvxMtfJItjQJL84p50GnhYQjy6YM+3O3QriCmZyOnWG8VD1fvacHOWCsw1UjLHym4yvGvpo5l7KPmZ3McJIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OkjPmKeZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GhJLAtlh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O7ROBD1823223
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 10:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7eXC+Vvh1qI0aXe+adcCnpHa7mHRMAm7stQmrq1bj9Q=; b=OkjPmKeZh+bJGatv
	LPW5N9Q8BVgqBkX/Tbliwcl2mCwKO2ek52J3z3rJi3DuOAm2RQndSxQL50j2bCNK
	mOHkQrQhpvgU2cReoDtKuekLUJo85LlJz0BR04qYnK8W+CqK3ER6jitRDmM5CYa/
	jruCtDZpOxh2VVTt9NO4KOCpQKYyWEoplJm3JcndlEuWtvTqtyFmF9uSGZf8DFi0
	rpninchS1CgTDCoQtdxTkNaYI9vgfoQAQvOsQKFJ8pOkcvwr4ygYpZFk54YTWc1V
	iUOptEVp2RV4enz0KkqLvqTnWMxQtdYIwUj6KNe+Pw0eobaJa1H+nEs7ySuBLVxZ
	03h5HA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqv5rtfj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 10:45:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8ecac841eecso113564685a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 03:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777027527; x=1777632327; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7eXC+Vvh1qI0aXe+adcCnpHa7mHRMAm7stQmrq1bj9Q=;
        b=GhJLAtlhhzS2WSt1QUG8PErNE2bUnp0lH/q2AVMCqmU1Jx0docu2FHw1qnFVt7PPvd
         5BuxfUj+Ig+X8STbVcDXY1xP6UpKUGHNoLpt4x7O+2HOn0L1Cqt05XHXQEs2EU74/XzY
         /e/xDE7hmJAeH6JfUrlXn8esttz7YL8sDwAgErCwhZRDGANobC0o+yYG8tjdj2xdYHv5
         Y+yDrS5jlp/nSV4b4ya6R8lAlyb4OShvfBbfOEd5zoK8tB3c6XzCT7z04eTv4Q53yFjs
         uHQmAgzI4cw4fuX1JCIP754Kn6nKNGU8q700C9Air++3j0ghnIc3189tGp2zrJT8Idk4
         NdwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777027527; x=1777632327;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7eXC+Vvh1qI0aXe+adcCnpHa7mHRMAm7stQmrq1bj9Q=;
        b=PMgKzTLmwsaLv0+J16hX5Rnt+uzlhrHJ+lYYswqMcG6Z94NRjorlKMXEJAMaWUBh8O
         dj5Jb9i22X9CRmUIRymGzx8GTVVhz3fhTHzj8dMdY9+Tt4ZhGA+cmvqCPo86LakyyuM2
         Nz1/BfhiOC1iYqrt0yfcIXEtM1xVFRQj2Y+s78xNwV+PvfOpqAvgPuTzrpTYEmDd07R6
         GH23dvCBF0CgWOooV6ismZpq3GfqGeEbsta6yv/WVLJUJ4RiRHki0pbpjD+xMxYA09aG
         0PEMHHyawnmvKG+ClfQPQgw2ZuNQWoPb9QAnbHmRpkO/q2jJlZt8U/qIWjRXIvLNcZ4u
         DjBQ==
X-Gm-Message-State: AOJu0YyYRdDNGS7uv/uUG9I5r+O07OZndQ+KoQj1xVmnWieE5LWIGvS1
	njMHZOOQMk0qsWrZ8Jv1lZKe0DBbKUFReY26grl1JkpZC6mtqP8d7fsxUnMmOPlRZauhHJYvmHf
	k7eJJUp0rPTf+2RKy8Y9D6si+ewYdIJcE03rysPPHSYJ/K5a0khd2xcjhmwqQXmhKcZQe
X-Gm-Gg: AeBDiesujFANbofA82wFO6r+e7SmetTMg3MzdTh60dfSDEtHEBMSXW0yTiKGBu8VJV9
	tBrb7W56+nm7SoFD/bd6+odF8/4F0i8xBe/K925LmD0uMe1+byFsjwW5wSBgjO2kkJcpfcNQMZe
	kg5/14AujuUh8l23BioboU9F/injdw5aaTV7/QM187l2iaGMSoqGicpk/OkSLSWtd3qMXAal3CC
	AzFro9lF3sZY722xSCFJ7cVm3MoMWI95yjDwyPm3cKpixdIFoYj7IZNnC+NOaxFfxqT2uNyToMb
	FZMPP7DEBkyAML14rIZ6D2CmpMFtnKw5e+ME/OZ+FNZsz0iTvhNM05BNGkHRvkuUdrAuGzXY0H6
	9jS+/DK/BC4Nav4xXlBFNBwsZa/eUiup8Vy4ZDQLttr4uywqA3VXuwOzQbF0uR1ZPDZACjCRyKT
	kCIGzNwF1fR9o6NA==
X-Received: by 2002:a05:620a:4114:b0:8f0:7516:da94 with SMTP id af79cd13be357-8f07516e2aamr868768085a.1.1777027526982;
        Fri, 24 Apr 2026 03:45:26 -0700 (PDT)
X-Received: by 2002:a05:620a:4114:b0:8f0:7516:da94 with SMTP id af79cd13be357-8f07516e2aamr868765485a.1.1777027526447;
        Fri, 24 Apr 2026 03:45:26 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d69708sm4772555a12.28.2026.04.24.03.45.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 03:45:25 -0700 (PDT)
Message-ID: <c6a06641-c345-4e65-9fec-7f2d4367710a@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 12:45:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] pinctrl: qcom: eliza: Split QUP lane mirror
 alternates
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260423-fix-eliza-pinctrl-v3-0-68b24893ae63@pm.me>
 <20260423-fix-eliza-pinctrl-v3-3-68b24893ae63@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260423-fix-eliza-pinctrl-v3-3-68b24893ae63@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LqiiDHdc c=1 sm=1 tr=0 ts=69eb49c8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=j-nvzvvU1SLIUX5pO48A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: NyFcIUAM6cibdYtibkRN2l6pBhuujstS
X-Proofpoint-GUID: NyFcIUAM6cibdYtibkRN2l6pBhuujstS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDEwMSBTYWx0ZWRfX2EUe90pAtgxX
 0QuCTjYtG2cuI8MxKXH3zu8gmVTvV5v49R5gtONq0/3+tCwZNQNMHBgPp+jPjhc1W11NmFIGKqf
 C50IkH3aj+Qw6HcpI8/RtIkaL2y7Nymt1vCox0nzNYoKNYVWJcU+RN/28gqDtI/Fbt+B0M/b/2+
 C016XWcrywWu+JoxCDUBo6NktbCWslhCvY0lHpDJceMxDFkLtllc3q/pEMmSA/NzheOZ7UwOVsL
 sT2yRx9QNI8l2tl9z2YudrRfoz+ghMHYvquko6xnAhhFk6PnOnkrJ3z2tswcRqANL3Br1HWJnVP
 j60iGqW+aTKokMos4j6FdUV3vq6mydO3JKp7n/jQl9xlre/iRJ9/eDLR0qeJUm+XxgD60a8Wy/z
 r2KPfcw512h7RYG8gvRcE4EqyFpMqOvBzBiMG6bA/tNrPuS8gzlMachLnfvLgFDE/Qg2eGxJBLA
 GKH0yH3nJS9L0bcMBfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240101
X-Rspamd-Queue-Id: 6BAF045D5B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pm.me:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104432-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/23/26 6:43 AM, Alexander Koskovich wrote:
> Several QUP lanes have MIRA/MIRB mirror routings which are collapsed
> under a single function name (e.g. qup1_se6).
> 
> This is an issue because it means there are multiple functions defined
> for a given pin that share the same name:
> 
> [42] = PINGROUP(42, qup1_se6, qup1_se2, qup1_se6...
> 
> So when you select pin 42 and request function qup1_se6, it will select
> the first instance of it in this group, which just happens to be
> QUP1_SE6_L2, making the second instance (QUP1_SE6_L1_MIRA) effectively
> unreachable.
> 
> Split each of these lanes that has an alternative GPIO into their own
> function so they can actually be selected, following the pattern seen
> in pinctrl-sm8550.c.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

