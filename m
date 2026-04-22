Return-Path: <linux-arm-msm+bounces-104116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGX1MtS+6GkHPgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 14:28:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0C8445E5D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 14:28:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BBFA53057114
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C21FB3D332F;
	Wed, 22 Apr 2026 12:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CIhcKeZ4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iczjK1Xr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875DA3B27DB
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 12:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776860749; cv=none; b=HCCQRFPt6pEwjTWMUmfmz/gIMsMuhlRgY/xO7uTVy9msezgQz3dke/oJLd6CyjU/8oeThvGpvaZHpGoThbVazs+MNbbvZ4AtTWPqKNjJBcSGvyWNVCLxk2B6I4EIBitjo5bLRMTa4S+yiV2ylQfTYC6Yuc4QT8/NoFMZB81kCEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776860749; c=relaxed/simple;
	bh=fSgwybm8EB7GnGWRJtzgSEC1MgNI4d36M3kf88uxlCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JUOyD6Xd50mku6kSWH8pUHMUY9RL8HI01U/iL+TW5CTPmLUecwRIhSozPFddS/X5sHqASRHN4UFZarRu2jXCKGl6+yPYbQNZDbQJI3aoYitCRrvsFS0W8Fec14IMIaLMJjW3NCX3yRfk6yBNXom7EhlTOFnV40ETYMFXfFJgzN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CIhcKeZ4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iczjK1Xr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MB8nS02209284
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 12:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pYI32RcMK+rIbb/42OAco+jjgy3p3bOcRS0/OXM4iEs=; b=CIhcKeZ4Bee3Y/9o
	bGYGyFmxpAwkvSQiA4p5k97kAbEXo2AE4n6YJCnJ6/+sfLm5JBDaVDlcNSRSMxXE
	PDypnv6i2wgoqZP1Frgzjp6gF2J2iCGZPPlF8mCE8COsIkZ8tZ4+XrfPBnCnm8F6
	GjCDHatWY1Tt0Fwd9KB7jJ2lA1UuDbQbInzrzthkO1YRxTz9ijU3IzTSNLcCq/At
	9FTN9Gb4dr6q9DbgIOOBceyrJraCjxGMN8Kub1eAvo1ejXDohdzxlMkDjcahb84N
	MZ4eyX90/HnIQMOIl6YSIAJWFn5SXmU9S+3Mlhu3dXCTsSlxsjmME7Mm9+PHYQYv
	JRDHZQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpengb9ya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 12:25:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fad7b0ae2so8673371cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 05:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776860747; x=1777465547; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pYI32RcMK+rIbb/42OAco+jjgy3p3bOcRS0/OXM4iEs=;
        b=iczjK1Xr5nP9Uqdhr65TI6o8pSXrT7SmigyftGdq3UW5tVF29zAae8JN8t5/z76Isb
         WTvaZFthdX3lA4vN8bPNZGZMs1U6HkuVXI3hk6fAPqz+9qIOuE26XP8MWwpuWI+6qzpc
         q/JRIs1oFE8EuEFVOoYW+T9KI71yjwf5junaPJbifMlmayY9VR+NMRGTynb/x4ash9Bi
         ZvHpbS0Jnlss/pRLcpdDfN+zr9CAoyD41YoAV36Z7qruOX5g9qPd674xGhwslVJRZick
         /7SZWJW1kSxrMS6DKiBJUQFfhhbE12qWfJXfKM0snvNGInOUgSvUH1otsONk57cALVUq
         z6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776860747; x=1777465547;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pYI32RcMK+rIbb/42OAco+jjgy3p3bOcRS0/OXM4iEs=;
        b=sxkIJnaeGdFMumRzzpoOCZUuR5aegcm6/yljx0ZhUKlCyLEfsKw2ZQGEPjEiRFw12M
         wTog3taGVUmIpBIxROHdDdg2Fchy0j6p208qoBlxgJfohLaqvDcyZzdPApiLPht8BRiL
         7+kxyHzlERSmv+azVZQw047WBX0JR6SV/ksug8pQb+PDSqrYUra3tpQDeuyNX3XZvRfK
         m0XL7gvDS26XkQlVYc5S/r6MCq21oUYaSk/N9+FzBsP28S4C6Wb7JcQ3cS7Myji9zirh
         dMjDQgmWGJs040x9Ywc2uyFH94Hn5T15AWCCDnmUntSeUZmNm5bWM36RBFZ3beDE1tT0
         r3bA==
X-Forwarded-Encrypted: i=1; AFNElJ+frVrS29xFWo4iNj/DDIiW6ooKWgKNOH/RMm71rlkC8B+LYA/VZOpwB1AcSHyFR1uqwdSYDmZOitco+KNZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyWOFREOYZ+hVkEHSSZ8wF7DKzffZe1QfNPH/MY3Z1p9hc+JkFP
	WgwaQqEOW67RqpYAKbEw/q5RVcJQGcGDlPjASB9aWtP5uvRGAiaAq/ASdJeYvd0Y04i8KnR548y
	uCD+yZGtA3+phKEPmmeASq3yg3fB/dj/YKALQNRte6H9YNClXFy2FolXOyH64C1CMnFvR
X-Gm-Gg: AeBDievBGR/FrpGxWmwIE9a4QEvq5+MEKXWm3oh/riFh80LHmHxiC1bTYgmub99cMCb
	TQs7fv9IVkxC0pJTYH2mxVHATf6SzBpZTEuplbn1mXPClavoSZAjk2ISuQlFh53/ZhjZUEBo78W
	iWc78cmEnQGM/N5rudclq1Zc7iudKqt7b0qP2BGkI2gnuArjbtyC/RyTmxBFxR/AwsAoO3JpKL5
	iNGJF258DEBclXz7UWvOoy/VoJ0Rr2v07J4b4IjZdcCVECA+uQGiqkzAB+0US67XYeaIBQ+tcZU
	1dD7Hy/Wwv2l09oIORbgux0anBvfj4i6AcSGJe97MIqCuk5xmPs0A5D5Uva7wjw8nIfx44bSszr
	T1fU1Gn2SmFOmQET264oMOTNj1oPSOlsfB6PO7eoCIEzzcbrnLWzylZTQ4ALZleueGrxTa/sxVg
	m6422bmB3PMzjQBQ==
X-Received: by 2002:a05:622a:1f88:b0:50f:bfe3:a04e with SMTP id d75a77b69052e-50fbfe3a765mr27128121cf.7.1776860746802;
        Wed, 22 Apr 2026 05:25:46 -0700 (PDT)
X-Received: by 2002:a05:622a:1f88:b0:50f:bfe3:a04e with SMTP id d75a77b69052e-50fbfe3a765mr27127801cf.7.1776860746428;
        Wed, 22 Apr 2026 05:25:46 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c480d735sm3230047a12.7.2026.04.22.05.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 05:25:45 -0700 (PDT)
Message-ID: <c99013e4-8be2-45ca-89f9-bd21d77d3eb6@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 14:25:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] media: qcom: iris: Add missing break in
 iris_hfi_gen2_session_set_codec()
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com>
 <20260422-iris-code-improvement-v1-6-8e150482212d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260422-iris-code-improvement-v1-6-8e150482212d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEyMCBTYWx0ZWRfXwog9biXN5QGh
 fsMrQB4UIvvF0yFJlqq9fJg1uovSgHsKU8G4FMsOT79ef/lvhRbflZI1se08oj3ElolEfRXc2jP
 h1Ns39kmkHgQcazUVCkXh4/1tw8klg/BZGvcQZEn80Ppty/izeYdBwVT9BILA0dFI/aCLORapIa
 1xLK4SAUXWWfC6RX0RyBr1Gn7Hjx7Kej/+9DwFBlTqEYytl3wEpZ6UbBLc/WbARaR3YjR634LAP
 o1SStxIEuqY2tPHMl1b2uK1bx4UTkpld3I8LwGxPxPfzHZz8NIbB6liUhMg3k5qXbPUP7Z1RlIb
 q5KGJWm2ZU28NnYaisjRbcdZi7t5GKIxXpMCMFocxdZudMp+Nn0zk4sZkdAdiCPxnfapDV0njHn
 UvClJfphRf6DNYHtZ5n92cKm21oA5i4omopnCUQSkOw8ywVhpuonatC4JEq4EQrRrsDCZW6Yur4
 gVkB4rsMOq50XzXzcEA==
X-Proofpoint-ORIG-GUID: m8P7HwWmN1PWDKb8zhyZVAHKu7xEVQty
X-Authority-Analysis: v=2.4 cv=RYygzVtv c=1 sm=1 tr=0 ts=69e8be4b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=4W0TTdc1l3xnTvgem7MA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: m8P7HwWmN1PWDKb8zhyZVAHKu7xEVQty
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220120
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104116-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6B0C8445E5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/22/26 1:16 PM, Dikshita Agarwal wrote:
> Without the break the AV1 case falls through, risking unintended behaviour
> if new cases are added after it.
> 
> Fixes: 2af481a459a4 ("media: iris: Define AV1-specific platform capabilities and properties")
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---

'fixes' is debatable here but anyway

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

