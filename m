Return-Path: <linux-arm-msm+bounces-106098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QI/PC54Z+2mYWgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 12:36:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7AA4D95D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 12:36:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 116743023340
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 10:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF3B37F8D6;
	Wed,  6 May 2026 10:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WaCPXV30";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fKL+MEYy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7683F54D1
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 10:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778063671; cv=none; b=KuAvrIHbax/+FagzSimecwm51uQXaE1M60ZyybMqzNgFjzrK4dokcSDa66avYH4VUimYe2mkWEIc1LBQqGBkp+frzhTPOGx6/HNYndpIRYYsJJ26GBruxw0mMOvbNit+MNTGfIathZsVfcu+kHO961d0E/l4rLJkQnM6Z/J8myQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778063671; c=relaxed/simple;
	bh=8pD5Y2Gw1xXO6MNf3qMxfxJoU4QawtyS04q9c1OQ93Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iJ4XCmtrd7DVIZte+AX9tXyG8tlFTS8C+nixO5XwmB7xnIhjzeGPZsiM6nPGVfaeY7vKYs7TxMtZtvUjVo1M4eZuo5J0miRA1T+HvQDnqBePx8yzXx9tDXCpeER56g56A73IQOhX55IQWCELlRyJrIqYseST3kXSUKU2F52whVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WaCPXV30; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fKL+MEYy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6467Cfkn1527930
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 10:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SGXrGDHADy4VW0xAVeipqzNuBCg4PRMApMn7mO6mfPA=; b=WaCPXV30ob4WS8PF
	rWGmiAbm2TAM5Nx+VJqKv5GbdxsX8F5slc7lOzADZX6GJE9ryq1tkGvqWymy5Boy
	sAgqwGnrPg/Z2SGuv7XZ3ojUGE00LIPavhRijzteynWMlJiJwDnL6R4JsvQZxi+2
	AYS5EsmO/lEF37Nj5byPt3rMQbMiAzLtrIcg5n6q7zru9BAVQCW1fSdVH61NU6A9
	UhamLeGXL3EctLlGUm3v/idq6PuE7rqXFsXf3xyWBWaVqCWh7sjFbPMpVh/fAAAA
	ved//T1wgveYZh5pvnJc4QURIA4e1KC1i7ET02pAWtFc2qVpZ+FIN1RaQ/Kldgpc
	DDU/GA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e01288tv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 10:34:27 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56f7d6e7a31so501066e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 03:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778063667; x=1778668467; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SGXrGDHADy4VW0xAVeipqzNuBCg4PRMApMn7mO6mfPA=;
        b=fKL+MEYyLwffKl/zktKjgKH2Qb9hz7OAE6LAyrNGH3IDvY7bQGGwvmVU4RDCfduknM
         hTmjx2MDj8k9rnvPOgst2if3Jmy0j77fht1fiz8rEE67hNuBg7kB57r+X37rjEwlGgiO
         IhL/csDqMRxDfGxj+9KU4ct31NYXGFTYkzqGTzRHI2TN33QjcfX3+1RBkXyqfEL3Ma/L
         gqdBY/ZLfcWHwGVnmBO232Fx0c7AxePOcgDoTAdzP+BF39r3TTufiMZvN2qFspdv1CTt
         GTFvs+doidfuHFKZDkKBIC3vOteTLq7Ekln3nQM6+lpRu7cRGqoai8jQwf1xwP72YU7G
         Uu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778063667; x=1778668467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SGXrGDHADy4VW0xAVeipqzNuBCg4PRMApMn7mO6mfPA=;
        b=dw7ftkENnB3/DQlCM7cSCoNjBmHIWdngoLOyW44mc6D8o1IdQw/94NFRtzDaY7pn1v
         CH0/FL92y37bBmPlwdSvqwWDK/+XQonzmq9t1dkp6t3xGL3PgJyu/zBW2aePAljNnM2x
         2esBPekjBaYXUlAL4Tz0TZqdNWJlnM45TXFz6zMS1cSz6psVS6fb+/5H0IyJlVIJ913o
         SK9JWiXhNQUfS7uxmNaHvaLDo9kakrk68f0XFAa3Lj8U/n1X4CTkg15iiI6/wJ811WMl
         yKjphkcsgf8mXoTRC5dU7CYz0BseD/Uwy+oNOK1fPOFInfBnPhs1EU5v5vsth/lpCe/+
         lMSQ==
X-Gm-Message-State: AOJu0YzDxjzTgp2+xpmK3wZ3U6eZ7tW9X/Q6p3M9gE8Fn2wmH9PT1mgX
	6Jp22esh73cnnhVNZ5BYTyaWRCC47U4pD7Te3QmdyZKNEd8NYAXPrGMTjLChwSPYzEdqFzSsTJY
	NlgnJonO42M/gfWS0HnsZVBO9L2Kc3CU1VnfvIZJbGHrY3cltI2K5qNLwnC4euk19l1l+
X-Gm-Gg: AeBDiesqDCrMDAatOBgZLbQC8/+Z740KwxELGcSq7Ds6IpzxYqbaFuAzbJP5NjOtsxE
	ySqvFxybllinTk0epxrtNyusUaxGXd35N74fHtORz9iULSlwn9So7TOHN/E7zUE92NtylkPqWaE
	+0kDQJrN0g0b6qdH5or6e5ntlAs0L+If8wod8ZLJXrT/jVB2z3+z2/SkghKoD2+d2gvgUz3cAGs
	6z8BlDuEn9ii95Z4t0VcmDwAL+r0ZNPDeCvSlAutRoApzireMM/DFNg9vSKYgrE23yT5f/aU9Kd
	N089YY4OM7GtvJNzSXUg688AIVx5S6Yh0mCC2zjbIX2CaNp/sfBvlfT4z9ONPUQBPjcWRYd6SD6
	WJYYnnuYWGuzmu3DDgASLalXJLI6QBnWuPZ8+iYj9A3I3RmRew5uS0fXOdF3a1hNma/w0faNW6+
	FDwYRo5I2OH/q4iQ==
X-Received: by 2002:a05:6122:5017:b0:575:24c1:f668 with SMTP id 71dfb90a1353d-5755b2b0d03mr285586e0c.1.1778063667100;
        Wed, 06 May 2026 03:34:27 -0700 (PDT)
X-Received: by 2002:a05:6122:5017:b0:575:24c1:f668 with SMTP id 71dfb90a1353d-5755b2b0d03mr285580e0c.1.1778063666712;
        Wed, 06 May 2026 03:34:26 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc55875cb59sm69779066b.0.2026.05.06.03.34.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 03:34:25 -0700 (PDT)
Message-ID: <031624bd-cb67-404f-866a-250f6362d941@oss.qualcomm.com>
Date: Wed, 6 May 2026 12:34:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] clk: qcom: smd-rpm: Add clocks for MSM8920
To: "Catherine A. Frederick" <serenity@floorchan.org>, andersson@kernel.org,
        sboyd@kernel.org, krzk+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260505203845.192140-1-serenity@floorchan.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260505203845.192140-1-serenity@floorchan.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sIJ3T_ANkFpCMhzOec3JjDzuMbShs_DA
X-Proofpoint-ORIG-GUID: sIJ3T_ANkFpCMhzOec3JjDzuMbShs_DA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDEwMyBTYWx0ZWRfX6QGAZPmECf+l
 wAIB1kT1B4XL2LummvNVWxAwOVY3FJnOePEcO3922Sgw5uqgBacZbr+mUccmq4RuFxR7+20e/by
 83/SYr9iCv2SgTJFw4DQ63U74bwVmc9jWbXKSEYmsdf3XEMS33dUguIfuMrsB4eCv2+winrrLV0
 NhvvIeBQm4ApllTJbfBJ8bB+L6Cjx2r+b4WtjLJwDrYjriMGZPZaiR/lPEXL7yk9tuKU10orRAI
 cvH2Ex90FyCHbyaK4W3/9ZXm5M8FHYFNmTkm9H0Ng2EvHQj11+cQx010NHT+EeB0YKxfsDHBwQ8
 8/jGVm7fqmazc3wmCZP43YOjQ0p9/Y+X4OdoVyKI4H4/KxZueeU5D4+bUByxk5Im032Om4THs1F
 ZrlbG6xJf6DuF21upHJG9ERWs4T+pUTUYfL3OGZNtj5yzdwdqSk1ETFyjASKhItAoC3l5f7Dv5U
 GAN011ATrZf7AtBWuDw==
X-Authority-Analysis: v=2.4 cv=A8xc+aWG c=1 sm=1 tr=0 ts=69fb1933 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=DhTvykhhAAAA:8 a=EUspDBNiAAAA:8 a=URLdPFrtKwSTYNkRWwwA:9 a=QEXdDO2ut3YA:10
 a=T4Xa7w4Qb_kA:10 a=hhpmQAJR8DioWGSBphRh:22 a=bLiRU7DCRrRo9wiowOr6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060103
X-Rspamd-Queue-Id: 8A7AA4D95D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,floorchan.org:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106098-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]

On 5/5/26 10:38 PM, Catherine A. Frederick wrote:
> MSM8920 is very similar to MSM8917, but adds IPA clocks.
> 
> Signed-off-by: Catherine A. Frederick <serenity@floorchan.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

