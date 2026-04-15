Return-Path: <linux-arm-msm+bounces-103244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DsPKOtG32mFRQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 10:06:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E86C401AFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 10:06:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B05D0300B5A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 08:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABCFB39FCB9;
	Wed, 15 Apr 2026 08:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mvg0i8r9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VKumVq+d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A57C3358D3
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 08:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776240360; cv=none; b=izkLhVlRaLLi0kY4GRLTASGGc+8fhhFlH0KfjoFnZKdtueUpdHJTjniyfhCKam6VRtJlNTURa+jHUjF44Hxyy2WYL4fiIldNPLsKY81wyVu7uqOSf3gXaiLlLgrZXBeTw2ULDpXL+CS+WCNalYgURNE+Pfq9Load9RIzZO/l984=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776240360; c=relaxed/simple;
	bh=2DDPtEzoVCZkgFIPYBtK+Ad36Wq/d0wjmoJvNl8NxwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YGhyMOWcVSrZ3tEiymFBVkIwH1v1Opra3RQVKDz9+cXhS9ml/kI+gyVe9umPgy092b9a3oIfu7n1iDJrkIXU+XaDgEQLP0PC/xe9mKrEmrKExwZ/bKUbpjd/3tmq2I+FgeDX1dIVmD21QyWOuk/InC4irYqG19AOlrLGXnPCuf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mvg0i8r9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VKumVq+d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F5xFo62772630
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 08:05:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dj8Ohoyg5EdWLl5OwTikqGQxN3VfSLXZZkdw9EKrecc=; b=Mvg0i8r9wq++yum3
	Ty5Kq2BROXgDjvv6j39m4HCLqKuqkoePLXXsE/wbPWugI6Q4oxq1euTJ2a8r3d6t
	hzVPXgLdAGwqYJ/DOwa/4+1peloM5B8r7ynNpPCZONJald++lLpM1v1FWgDvb+dD
	xXMDmqSQEg9f9HllMDHmDTbGFbdtFxyYIbde3YG2qf0N17dixTghJEM4oGM1u4F8
	A7rdHTVmHiZo2N93g3g6LWkDi0cYvEJQSBZ1xcy/hIAofnwwTSoRApq14LcVrqoD
	WqiBBf26z4cn/n5Dy3GGjYbI48JJbgRRK6kaLZAw9aZtyfKBwav2kSMk0cwP+CBe
	HELR3A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj50v0dds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 08:05:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d7128e038so16159561cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 01:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776240358; x=1776845158; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dj8Ohoyg5EdWLl5OwTikqGQxN3VfSLXZZkdw9EKrecc=;
        b=VKumVq+dN5Gqbge0xdpzN2qQmVKJye52q8HHNw0hj5SiiBEXO2Dct1Xtkd04fqe185
         s7beg03maGxqUm33y+VQkroSf97TltxTyOYLK6uxNSLoYo2qrRHpcaXRw1ASpw9q7spD
         YZJa88/Hx1o0BPf1kJrG3TYRoLRJ9bOESWLGKqq9letIUBQ/woL/IEiZOjM09EGilpiE
         QhhIN4jPl41Y8+ch8rk5dFsUlghqp0vpj1VbRm2jYJmzeSH6tSDP4DqdPvgipnsAmBHh
         hk/AAwtAQbPHkBtZHj/vR71tlV4Wb1JVlXQSLo+cWV2VOEWT3oylyEl2Xab/3R/wlHXE
         WOyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776240358; x=1776845158;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dj8Ohoyg5EdWLl5OwTikqGQxN3VfSLXZZkdw9EKrecc=;
        b=HtEb0jOt8Gh3LdNxskv9s2vSCO6/RNeN03Mxy03t/S/I+P5KSr/UDSIlt/2o130l8H
         xqxasI1g/+hpAMqdLhUpdq9U6Q3jlr+zhGx9OUgeKC71PKxxA/vCbNRBgcQqWF0mOBqR
         idx8n1wlzFqYt8ZSdZm+4btHMNv0hpIlxEpNybgkQDOo3V0i4nIwoOPtYdPQ3d+Vc2gF
         N8XyVODZ3QZAa+lTelaZEjkQL3Ir0ItJ+mGjxyXYvoB6gE6CzVcvE+65/x+BicYy6ss9
         NuxD0NmVa8XHFpLOwJ7N9JvSb4PxlF3HANM9wDHfCE7BTBXVYeCGMbl82i4RqJp4MiIQ
         4mtw==
X-Gm-Message-State: AOJu0Yyj0MNlkuOCMu3RF36uzashV4fMQO0HHzgbYB6tOlEtPUijREz4
	cMsGDO9BwriehDPQs6+LiW/QASJVvbHIZcADWd8pbVt0Lyf2KvbaB4Ge5Uh4/guzKl06d/YhlmS
	z8S1vsmIbYpWCTXEp/yYam5ZKHoTkUZKUHqCxjOsRLRwzMxfgj7cude07kjWy4Bf5HPcK
X-Gm-Gg: AeBDieuJ+h3m3oCZkwzVr9ZWWqYKQD48D1Ol1EjCvYvFZ7gmuUKYsVOtH+HeQTm4gpm
	II4WrIS+wNqvr+PZvBwUDlPYlPzhmza9rlShrXM9as2YJngIQpY3HxlXMXLB2cpgtlnFKrfdBWu
	/bxDuvESNYhMblJP+VKzTWguOgR68M2I/RUTXMJy2RTeCt4acDnHfRb7dm+A3sTaVpKN+bnBqLT
	sfB1Z+2Vps4L9uR5mG6CL8eafpY/OCouU3dJ3S2CSB90tz1vKA12E9LFfD3PWsl+wOWilyxED49
	bDgmuVzCDdp/5rumSgSuGCFfejxZSF0oxrjnMijwy/W10x3SKKOZdmLqElpq0p6jOOrm6aTK2Zz
	ZtEQVPiQ+XOGgmDyUYC1dL2JtSAmuLDOsGPd8Lku9hKqZvlAo6fQ6+Neh2eybigvFl374nKL8Mu
	Jki2J7NIFq6FBSkQ==
X-Received: by 2002:ad4:574b:0:b0:89c:c2eb:681c with SMTP id 6a1803df08f44-8ae6a908bf2mr17625976d6.4.1776240357704;
        Wed, 15 Apr 2026 01:05:57 -0700 (PDT)
X-Received: by 2002:ad4:574b:0:b0:89c:c2eb:681c with SMTP id 6a1803df08f44-8ae6a908bf2mr17625806d6.4.1776240357155;
        Wed, 15 Apr 2026 01:05:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba173d59e7dsm30143866b.24.2026.04.15.01.05.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 01:05:56 -0700 (PDT)
Message-ID: <1ad71ab8-6f24-403b-bf5d-98726f038898@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 10:05:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] clk: qcom: clk-rpmh: Make all VRMs optional
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260414-clk-rpmh-vrm-opt-v3-1-8ca21469ffbc@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-clk-rpmh-vrm-opt-v3-1-8ca21469ffbc@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cKkQXINxYzombb7e3urRCNMbPBX4Yc1p
X-Authority-Analysis: v=2.4 cv=eLMjSnp1 c=1 sm=1 tr=0 ts=69df46e6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=hEP6UMytxTtgw7GBnusA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA3MyBTYWx0ZWRfX8aJiUqi7iWxh
 o0eGzmIAJ8oJNEiF0mrHBBxkazaMFxj6w9O44brc5uxQd/09Irl+UiQXfbO2pfFfAiFVTyY2sHP
 HQhadkn+Cg9qml9HNP4pcEXDSroG3DuTNDIVIqKoZb6CG8gcsGkr1UzYdfA9Qm7lpia++99W+4C
 NxjgsivQrSbYUiLpakBKFk3fKcdGFPgfqjrOOAK1td3FkpFCHNVSACf7pqi/gB0nHQS6eqVyjIH
 W0vyYAhF4VPz5xnGcGO/86sFXK1QI/ul2FPQYKDw9ekk9pDoWE4Z6KZ+etWZyHW5K4h0e79luZn
 9q5hMk9CWTLZBLflGnWvVZNo0RJ9W67Q6vmNcTI3qu1ROOqKWs6TGfnUfChg4BK5PBefVKdlsmi
 dZW++aEdaT2fm/bBRHJJmguhuJfP318aXcdpzXuk8KXTCmu0Q4n5Hci3DoTl3pG1xANywKxPuI+
 2L7l44XaIrIeB2W4/yg==
X-Proofpoint-ORIG-GUID: cKkQXINxYzombb7e3urRCNMbPBX4Yc1p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150073
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103244-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4E86C401AFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/14/26 7:34 PM, Alexander Koskovich wrote:
> Some VRMs aren't present on all boards, so mark them as optional. This
> prevents probe failures on boards where not all VRMs are present.
> 
> This resolves an issue seen on the Nothing Phone (4a) Pro (Eliza) where
> probe fails due to RPMH_RF_CLK5 not being present on the board, this is
> due to this device having a slightly different PMIC configuration from
> the Eliza MTP.
> 
> This matches the downstream approach of marking all VRMs as optional
> and makes the previous clka_optional handling redundant.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

